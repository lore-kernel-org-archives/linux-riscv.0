Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07A3C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjuiNZhNght2I8vPegFxAX2TvPGQ41OV+URzW6TtB2g=; b=1BvdFC9+mKNcgA
	6DgY9dfP2aORjf/lK2um0EGXDOdqIfsIeYeawTYmXaUdeui1zYjseaPpBrpC/CaFHGP864p1rd/Yd
	f23zWXKjfOMMYBsarhVn1iDBY+ACimbyLAnKE0wB93pItRLBihItrIyxPjJEn/58EekvJx/+MFYX0
	31REFXmW2aKvvSJNa0KsM3J5avWAAjllBABFCQL1QtntzzW/HAOuc4SYv07b+IM/VCRVN/fr/FVF4
	auJo29JRaE4ITdpbkNB9LzKL6cmwaT8tl0KsoniOngtiWS1Ae1x1tgnQnGGkAQ30h9AgGsVTPOK9l
	tlOyDDmGSiDz9b6ZCHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuvD-0007MC-0l;
	Thu, 11 Jan 2024 13:16:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuvA-0007KE-0b
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 13:16:33 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6d9bba6d773so4551718b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 05:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704978988; x=1705583788; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/AayJx6bpS+I1BggTfh/rgvG078upYWdo73wc6SmWTY=;
        b=FrKT5XesFyJW6ZwDVwvJ4gqAMr8JYge3Ha17oRJNI4iKVr07hW0WcjY2UAhHS5nDpK
         VfgFP6rNUlCrdW9+Ukw0yaJWjm5BqRjDJsA/YrbV57X0AFTseXWggYzaiKGG0birzIWd
         3EGhoYBUq4/Ep7gWGXK4WDHQzMpCS+At+4Xjpgp33v/kO4iC8JSDHMbNScrRDOFvCYjV
         n21OqLDhR0DFGBIbR8vyr2hzaDtlhGz8dg72NQ5WDCn3zK18I77QEmZ2N30GZpiQZ/Rt
         wTfOkNGydb4bkESpwQiAhQSMKjOtPuVw4Qvmsins7zSHOC483UEh7tVY5nKYX9FMurh9
         wh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704978988; x=1705583788;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AayJx6bpS+I1BggTfh/rgvG078upYWdo73wc6SmWTY=;
        b=EwX/8u1N6JCVx4dSOrP2sWDumxJ0CJtS1+eEETkhCefh8WEyYWogJ/DAZ5cAHQ7h9f
         JISwMwuaFpcERdzvofn1PETNTleMj+5q4p2d0sCNU5qaCwgBN1D41nv4mfZBS3z/aiwE
         iGaLoSWA3Jmo9ARZigB5hu8WAbfw8oHjth4R5BOpGNx9woBPymXT9CZUloDU7iDr6iW7
         2fHM2aoHfaiyFNC0LoFKUx8723xmmMPqseRchGrgT8H5eGe7964LBkmjIU5hppOks2SM
         jr8ksUdtSMTBnsYbZ5X9rwt2hCsK2nFiRHKI3EZDEgN72hfB843L+3BdxytngA7KP+ya
         hq8w==
X-Gm-Message-State: AOJu0YzriAg5aGDeuMP3MEjRHF5NGbKflXXIUZTUWAfQhbPeixpbaL79
	mnZvQH6fhUjSryV5rCw2ppZXt467YNesEj3TPuwIao6mP5TT2Ho+0erISwbLH9BamViCmEGhA1E
	sLksZKc4dL6AaDlueGichj96ZopGPIpn1ylsLSx9w6Z3XCTVja7tmB9OEQH+XUbIohgEyaw10Y8
	+CqYVP0Jq1Nu8NXE6B0TjY
X-Google-Smtp-Source: AGHT+IGJTKDtmqKwqgbQ8aWFmBbPW6yB2oFvRvgOMEU1BOVghxEqjH8ukA4NLJn7eNaf9pOD+aYvIA==
X-Received: by 2002:aa7:8c51:0:b0:6d9:be3e:19a0 with SMTP id e17-20020aa78c51000000b006d9be3e19a0mr1039194pfd.48.1704978988046;
        Thu, 11 Jan 2024 05:16:28 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id ei30-20020a056a0080de00b006d9a6a9992dsm1103202pfb.123.2024.01.11.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 05:16:27 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	ebiggers@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Baoquan He <bhe@redhat.com>,
	Eric Biggers <ebiggers@google.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [v10, 02/10] riscv: vector: make Vector always available for softirq context
Date: Thu, 11 Jan 2024 13:15:50 +0000
Message-Id: <20240111131558.31211-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240111131558.31211-1-andy.chiu@sifive.com>
References: <20240111131558.31211-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_051632_220600_3D69B3DE 
X-CRM114-Status: GOOD (  16.34  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The goal of this patch is to provide full support of Vector in kernel
softirq context. So that some of the crypto alogrithms won't need scalar
fallbacks.

By disabling bottom halves in active kernel-mode Vector, softirq will
not be able to nest on top of any kernel-mode Vector. So, softirq
context is able to use Vector whenever it runs.

After this patch, Vector context cannot start with irqs disabled.
Otherwise local_bh_enable() may run in a wrong context.

Disabling bh is not enough for RT-kernel to prevent preeemption. So
we must disable preemption, which also implies disabling bh on RT.

Related-to: commit 696207d4258b ("arm64/sve: Make kernel FPU protection RT friendly")
Related-to: commit 66c3ec5a7120 ("arm64: neon: Forbid when irqs are disabled")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
Changelog v8:
 - refine comments, fix typos (Eric)
Changelog v4:
 - new patch since v4
---
 arch/riscv/include/asm/processor.h     |  3 ++-
 arch/riscv/include/asm/simd.h          |  6 +++++-
 arch/riscv/kernel/kernel_mode_vector.c | 14 ++++++++++++--
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 4809f20a2053..55ace554f202 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -78,7 +78,8 @@ struct pt_regs;
  * following meaning:
  *
  *  - bit 0: indicates whether the in-kernel Vector context is active. The
- *    activation of this state disables the preemption.
+ *    activation of this state disables the preemption. On a non-RT kernel, it
+ *    also disable bh.
  */
 #define RISCV_KERNEL_MODE_V	0x1
 
diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index ef8af413a9fc..4d699e16c9a9 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -28,8 +28,12 @@ static __must_check inline bool may_use_simd(void)
 	/*
 	 * RISCV_KERNEL_MODE_V is only set while preemption is disabled,
 	 * and is clear whenever preemption is enabled.
+	 *
+	 * Kernel-mode Vector temporarily disables bh. So we must not return
+	 * true on irq_disabled(). Otherwise we would fail the lockdep check
+	 * calling local_bh_enable()
 	 */
-	return !in_hardirq() && !in_nmi() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
+	return !in_hardirq() && !in_nmi() && !irqs_disabled() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
 }
 
 #else /* ! CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 114cf4f0a0eb..2fc145edae3d 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -46,7 +46,14 @@ static inline void riscv_v_stop(u32 flags)
  */
 void get_cpu_vector_context(void)
 {
-	preempt_disable();
+	/*
+	 * disable softirqs so it is impossible for softirqs to nest
+	 * get_cpu_vector_context() when kernel is actively using Vector.
+	 */
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_bh_disable();
+	else
+		preempt_disable();
 
 	riscv_v_start(RISCV_KERNEL_MODE_V);
 }
@@ -62,7 +69,10 @@ void put_cpu_vector_context(void)
 {
 	riscv_v_stop(RISCV_KERNEL_MODE_V);
 
-	preempt_enable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_bh_enable();
+	else
+		preempt_enable();
 }
 
 /*
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
