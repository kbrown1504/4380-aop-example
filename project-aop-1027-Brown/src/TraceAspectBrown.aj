import org.aspectj.lang.Signature;

public aspect TraceAspectBrown {

	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	
	pointcut methodToTrace(): classToTrace() && execution(String getName(..));
	
	before(): methodToTrace() {
		Signature sig = thisJoinPointStaticPart.getSignature();
		int line = thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println("[BGN] " + sig.toString() + ", " + line);		
	}
	
	after(): methodToTrace() {
		String file = thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println("[END] " + file);
	}
}

