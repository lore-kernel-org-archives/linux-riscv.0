Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD18EC3601A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 14:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STy/PZMvMRKzXcGZAPm4wD1rT0TfYHAgvVbGJMlRzvI=; b=GTTdNqaBR8qjEg
	7lNBbr+D4JineiR9Lgs4moXVxZ9KMjs9eVndYDWQE/2vcb6BKjcG11hqbU7cRSHluZ+fukjiwc1GU
	2RmVK/BxG2pwyot3p8zNoz1+7YEitlT4tYuvLqbY0XT2Mx/vtVv4tRBVp+wwlH1pJ1K5RfJMpBSIb
	j85/gUvx8ac1uZ1Er3/w9niWziFjUITsRDuhmRlfwujeU6Zv77XdrlNUgr7b7keCFELd30CAOU/wZ
	zQPZQJAwKGLV6Mq93n1GRX3LhaLlLehjFa7i/6EAC3fYdvnxU0hR6rXZdHQHJ24rGGiUb9a8aWnjM
	ctew2+H/oYAIfmBRnSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hgk-0000000Bw9H-04r0;
	Fri, 04 Apr 2025 14:06:30 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hVI-0000000Bu1q-02bf
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 13:54:41 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso2077631b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 06:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743774879; x=1744379679; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8XupPhYtcgvW5/k1ZLQn1jc4P/+RcYSuqaM+or8g0w=;
        b=EUkE+3bJHJULLqUDN2trPweRdSQa/vvUz3gP/9R7KF/jZqhbXaMcht5PCJjf+1+gPo
         VmmArH8EzBEewIeJbm7rPT/zAUigOfY/son2qTvol0AXlerwT0qZlE2pkLzI6/hmmnqA
         goFCTAIGVwonzrleF8GNfIspIhdjZD8iY7b5yYL5oMya4YZ+aSB+CH64bqZfSfoEY2+6
         U3qqYMhsx2HyirlFH0gPOtGG1V7r782J0W8IfeovwPbdpWu5I496cob0GlCx8GWq3f4n
         eu2WUp3dCj13Z6ZY6SgHvESuWYEbaRJFm1/nx05zL58yg3Qeq2n6pYsl2yvu8qp7c1mm
         yFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743774879; x=1744379679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8XupPhYtcgvW5/k1ZLQn1jc4P/+RcYSuqaM+or8g0w=;
        b=eOCxVpgz2qoe6CZftD0fwidOlr/VkQoXtuE/CopQ6GLADPnAUf5CTqnIZDIHTk5eb4
         kSwIGSgfgK4aYRN+fwauEYKMuQ06PyBPGkbek4GkBVg6QLi9yVLpUX0IyRh4yM9Vx/VT
         DEDS7a3DV77X/egks9CEWGi+gkj1sx+HxoJSJ5tSaMSqXUyoiOsamkdF3t/I8GGCC6Wv
         mxndOp4RT3MNORzCgeguFG3kjfY/yYUUAX1PknU/WNDnSKWUyzN2xdBaD8rYmKX7yHZS
         W/dRMteuazd/7RdCqYlBNP4HVFns0MIPY4DoynF751O92CzlvKeHbQKgJ0/WHFTfwYVR
         ZCiw==
X-Forwarded-Encrypted: i=1; AJvYcCV/HQlxsZmXNkYQmn5C3dwnZRzowTNkN6b1BSpPiTWFAB2EJoc4k4kyYzGUJtDUxR43GbsT4O95xPNuuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/CwwlmnQJZsGPQaySlJ8MLmLsRe4l3t9DephrWWa7uu1jYhQm
	nwLrD9wcftRcaqE7VLNafXylyYKbhMrWvID+QQrIG2VvWVP+4GoW
X-Gm-Gg: ASbGncsjR6MOeOQ37NhOTswknfy2f9beW7JYuIq4GmHJQEbihWwRZL2BKnBRws/+f1s
	yH+7+JOBUOVVoPdhbmqZhTN5gkYcwM2CnerKWiyBjjpA68bt38Mlw0yiMjQanuTqKEWJVotLmLV
	ewUaJZI08bIJLzRrTfA0DOkHl7HxyMJIVeVdLopoHLrXUb8r38anHM+2m9T+d0OtneAGqGuu14I
	z8aMdzLI9LSt2M1b+UL344u5bBpfo6jQr6KMn+aP4++Vfm4P++sqxN9j55O2KjsebIEeTPfjBh0
	MyKBQgJyZBgYGrRQ0DgILGrsw6bvBI0yUD369oUnC6mKxxydvmpUZ6d3MZpaYuxKiwZutqg2
X-Google-Smtp-Source: AGHT+IFC9N2k/ioIXcpoV0BN/ew7bxsN6dtQL5Sstqa61qFrdL0M2RbG2UttbswEJ6RlGwal0h7JVw==
X-Received: by 2002:a05:6a21:9201:b0:1f3:36f7:c0d2 with SMTP id adf61e73a8af0-20104769bb7mr5348532637.41.1743774878910;
        Fri, 04 Apr 2025 06:54:38 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc34e91asm2874206a12.33.2025.04.04.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:54:38 -0700 (PDT)
Date: Fri, 4 Apr 2025 21:54:35 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] riscv: Optimize gcd() performance by selecting
 CPU_NO_EFFICIENT_FFS
Message-ID: <Z+/km3h1ZmnJjyId@visitorckw-System-Product-Name>
References: <20250217013708.1932496-1-visitorckw@gmail.com>
 <61173b04-faea-4dfe-8e82-95a55ee33f3f@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61173b04-faea-4dfe-8e82-95a55ee33f3f@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_065440_062422_E5F9C3AD 
X-CRM114-Status: GOOD (  31.55  )
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

+Cc Andrew, since this might touch lib/math/gcd.c

On Fri, Mar 28, 2025 at 03:07:36PM +0100, Alexandre Ghiti wrote:
> Hi Kuan-Wei,
> 
> First sorry for the late review.
> 
> On 17/02/2025 02:37, Kuan-Wei Chiu wrote:
> > When the Zbb extension is not supported, ffs() falls back to a software
> > implementation instead of leveraging the hardware ctz instruction for
> > fast computation. In such cases, selecting CPU_NO_EFFICIENT_FFS
> > optimizes the efficiency of gcd().
> > 
> > The implementation of gcd() depends on the CPU_NO_EFFICIENT_FFS option.
> > With hardware support for ffs, the binary GCD algorithm is used.
> > Without it, the odd-even GCD algorithm is employed for better
> > performance.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > Although selecting NO_EFFICIENT_FFS seems reasonable without ctz
> > instructions, this patch hasn't been tested on real hardware. We'd
> > greatly appreciate it if someone could help test and provide
> > performance numbers!
> > 
> >   arch/riscv/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 7612c52e9b1e..2dd3699ad09b 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -91,6 +91,7 @@ config RISCV
> >   	select CLINT_TIMER if RISCV_M_MODE
> >   	select CLONE_BACKWARDS
> >   	select COMMON_CLK
> > +	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
> >   	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
> >   	select EDAC_SUPPORT
> >   	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
> 
> 
> So your patch is correct. But a kernel built with RISCV_ISA_ZBB does not
> mean the platform supports zbb and in that case, we'd still use the slow
> version of gcd().
> 
> Then I would use static keys instead, can you try to come up with a patch
> that does that?
> 
Here's my current thought: I'd like to add a static key named
efficient_ffs_key in gcd.c, and possibly call
static_branch_disable(&efficient_ffs_key) somewhere under arch/riscv/
when RISCV_ISA_ZBB is enabled but the Zbb extension is not detected at
runtime.

However, I'm new to the RISC-V kernel code and not sure where would be
the most appropriate place to insert that static_branch_disable() call.
Suggestions are very welcome!

Below is the diff for context.

Regards,
Kuan-Wei

diff --git a/lib/math/gcd.c b/lib/math/gcd.c
index e3b042214d1b..514b8a86b461 100644
--- a/lib/math/gcd.c
+++ b/lib/math/gcd.c
@@ -2,6 +2,7 @@
 #include <linux/kernel.h>
 #include <linux/gcd.h>
 #include <linux/export.h>
+#include <linux/jump_label.h>

 /*
  * This implements the binary GCD algorithm. (Often attributed to Stein,
@@ -11,6 +12,8 @@
  * has decent hardware division.
  */

+DEFINE_STATIC_KEY_TRUE(efficient_ffs_key);
+
 #if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)

 /* If __ffs is available, the even/odd algorithm benchmarks slower. */
@@ -20,7 +23,7 @@
  * @a: first value
  * @b: second value
  */
-unsigned long gcd(unsigned long a, unsigned long b)
+static unsigned long gcd_binary(unsigned long a, unsigned long b)
 {
 	unsigned long r = a | b;

@@ -44,7 +47,7 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }

-#else
+#endif

 /* If normalization is done by loops, the even/odd algorithm is a win. */
 unsigned long gcd(unsigned long a, unsigned long b)
@@ -54,6 +57,11 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	if (!a || !b)
 		return r;

+#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
+	if (static_branch_likely(&efficient_ffs_key))
+		return binary_gcd(a, b);
+#endif
+
 	/* Isolate lsbit of r */
 	r &= -r;

@@ -80,6 +88,4 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }

-#endif
-
 EXPORT_SYMBOL_GPL(gcd);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
