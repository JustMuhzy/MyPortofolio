export function requireAdmin(req,res,next){ if(req.session?.admin){return next();} return res.status(401).json({message:'Silakan login sebagai admin.'}); }
