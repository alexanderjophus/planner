class MeetingInvitationMailer < ApplicationMailer
  include EmailHeaderHelper
  include ApplicationHelper

  helper ApplicationHelper

  def invite(meeting, member, invitation)
    @member = member
    @meeting = meeting
    @invitation = invitation
    @host_address = AddressPresenter.new(@meeting.venue.address)
    @rsvp_url = meeting_url(@meeting, token: @invitation.token)

    subject = "You are invited to codebar's #{@meeting.name} on #{humanize_date(@meeting.date_and_time)}"
    mail(mail_args(@member, subject), &:html)
  end

  def attending(meeting, member)
    @member = member
    @meeting = meeting
    @host_address = AddressPresenter.new(@meeting.venue.address)
    @cancellation_url = meeting_url(@meeting)

    subject = "See you at #{@meeting.name} on #{humanize_date(@meeting.date_and_time)}"
    mail(mail_args(@member, subject), &:html)
  end

  def approve_from_waitlist(meeting, member)
    @member = member
    @meeting = meeting
    @host_address = AddressPresenter.new(@meeting.venue.address)
    @cancellation_url = meeting_url(@meeting)

    subject = "A spot has opened up for #{@meeting.name} on #{humanize_date(@meeting.date_and_time)}"
    mail(mail_args(@member, subject), &:html)
  end

  def attendance_reminder(meeting, member)
    @member = member
    @meeting = meeting
    @host_address = AddressPresenter.new(@meeting.venue.address)
    @cancellation_url = meeting_url(@meeting)

    subject = "Reminder: You have a spot for #{@meeting.name} on #{humanize_date(@meeting.date_and_time)}"
    mail(mail_args(@member, subject), &:html)
  end

  private

  helper do
    def full_url_for(path)
      "#{@host}#{path}"
    end
  end
end
