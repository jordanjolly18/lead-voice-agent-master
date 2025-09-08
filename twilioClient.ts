
import twilio from 'twilio';

if (!process.env.TWILIO_SID || !process.env.TWILIO_AUTH) {
  throw new Error('Missing Twilio environment variables');
}

export const twilioClient = twilio(process.env.TWILIO_SID, process.env.TWILIO_AUTH);
