export default function handler(req, res) {
  res.setHeader('Cache-Control', 'no-store');
  return res.status(200).json({
    ok: true,
    service: 'Personal Command Center API',
    telegramLogin: 'not configured',
    database: 'not configured',
    message: 'Add the required environment variables and complete Telegram application setup before enabling sign-in.'
  });
}
