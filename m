Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A7DC3064D
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xk/4pRh8CcdKqEdEc6j8sZNGKn+c3FrJOFzDP8sPuNg=; b=2r0mVlWu8bWNl9
	BPQhOWdAGQhD7sp7xjuaR+cowf57V6zpMjvhX+NJETGylgyc9pJAagGZy6N4rOhcdEoK9z145PmHC
	kAWY3gmDzxqJ7O6rHmlbsYJjANrMCC5yll7GZQ4nY6MU8lK6GUbF3EBUxYrnWF/05U2K6F7l5SLFV
	5FgODmc21DKDfMy8EshCn2a81hXMnN5fuwsNNGtT4cnQ8XO+Rla2+7tzfmZeU7+HiwB8BEnBkF294
	tUIL8LJT1D6UMGudQfgz3Olt6KrJE3b72ctogVMK+HSMGOQ/CPRafFOEO2cvWjmKBmiVbIohKYst4
	xjCsglzAGqC326u00xag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5q-0000000Da89-0MfN;
	Fri, 28 Jun 2024 11:48:42 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5n-0000000Da5o-32L0
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 11:48:41 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-25d584e9fe6so280915fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575318; x=1720180118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVz6x8zHD2e0o5+zukG3kv+msINNXHhJ2RLc+xaoywE=;
        b=SUqFb9Od2pvsfXhCz6GusvmsgC2u+2fllHpAONfc0WKGci9OF/OZWp0SrPTi0j2GYo
         bvwpLEgRAKCQSYd0LpL+sUEMJhmxhVdLw+1pR/MsFIz8P+p1IU1YZyjQLxKJjiTydX3l
         6i/c//ViuQqzP5aF3pFBWfjY3uNBN9plN709Q2pt8HZFw2BZ1q7t5FUtbjNYetG5ByJy
         8YGuDz3Hn8my4nU9JSLyd3K5Qr5sRaphGPP2/8w4ypETJQColzuLY78lSbKNSZkKuT/W
         pzQXxYXeT82j8hQR6z3pCHV4dBDTuvA4Pz0e8XMoH/dmmCl5txkodbooqUlvilnBorJV
         IOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575318; x=1720180118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVz6x8zHD2e0o5+zukG3kv+msINNXHhJ2RLc+xaoywE=;
        b=uDCb8V8m0EN6HirBzEU7A+sw6YbBjuhCzcDUbv0qVXU5bZAUwGBJhH59JdZRwFLXjQ
         o5ztVMbLfJfsa2AMMoUDUDa3wBb8o1qS8QbRIGlhNJTHrhDAJ1ymKD3dE040eWLE80em
         yeUn1O6oEUMuA05ECwLuFvJ3j0SDtQNksOyluX2TiyhCVgV2ssa0Ckgn+ljrcNWMYghz
         mlxMnQseK92RDghUI15Aupzb9n37EvB5a5xh1erS6CagMduFygclIPo8Eyj2aaZ7UpC8
         gacBhsEIq2UbWGWWzGNMPxMm8wAmPUKVe1+sCV3r/MkFc8lWM32S4Hs9pv4H43NLD2Tj
         CY1w==
X-Forwarded-Encrypted: i=1; AJvYcCUYWY0o4wuF+0mM/mBh+zsZ91Dgz5bPq7b6BueJn4xzOSIaQCpvCvik1aPY6As9jGrL+tvHDo1vNGyhWfub+6cgpqyx47B0APhAJfUPV/Po
X-Gm-Message-State: AOJu0Yxl26qHOFkZdMqqWsK2p4MbZFTkU5coyR/LFB3uhh2m/hadlPdt
	dSbaKWboWKRySbXGDKdMYsYALhlQzdh4I8KXa/tTT6x7XV6VeIgdHZyXex6jJAM=
X-Google-Smtp-Source: AGHT+IFOBKDdLVvGH5/U1B4nvMFkuWHQzKcK9o5xnO1lPmAh4a3+NRC7pmcUXvg9Bib/B2yboEQX6w==
X-Received: by 2002:a05:6871:3a11:b0:259:8671:2530 with SMTP id 586e51a60fabf-25d06c5118bmr17606779fac.25.1719575318592;
        Fri, 28 Jun 2024 04:48:38 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfb90sm1377775b3a.139.2024.06.28.04.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:48:38 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 28 Jun 2024 19:47:49 +0800
Subject: [PATCH v2 6/6] riscv: ftrace: support PREEMPT
MIME-Version: 1.0
Message-Id: <20240628-dev-andyc-dyn-ftrace-v4-v2-6-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_044839_963853_6871FB38 
X-CRM114-Status: GOOD (  10.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Now, we can safely enable dynamic ftrace with kernel preemption.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55c70efbad0a..881ea466ff52 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -139,7 +139,7 @@ config RISCV
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
