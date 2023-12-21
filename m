Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556CAC46CD8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePbB9hv4zEEFx9fIvbAJHGVmLU4/w3DiGNdCbgHMSEo=; b=d1cT96Rcg+/+Hs
	2RyzHCh+zV0S/ydOx8Nv8cBapErdbw5HraNPJwn/I3YNH4y4d8wmRjgn/OXiW2OFfxtYc1FqzzOEV
	lvl8OShWnb7e9yRYCkZmsHuTR76Nz3Ia6eeYBbWl48NxUmWBO/jzlHABLLU0ne0K8oEgnd7tRlx3u
	iRBQ/b9GWyq3mX0UlMwSLNRyElatF1Rwmi/LjOtQJW00uhQ3Yj2waPmuc0c51csB8JlIwmrgnQMBO
	DfYMQfmtmQraMmBEsDz75d6p6uMSrWZa9AFGcB1aoWUXqvN/vwkalefJ2CMT9XGOFTxEiV4oQWgaj
	RFz8CC+xZQK+v3R2LOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJL3-0031dL-2f;
	Thu, 21 Dec 2023 13:43:49 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJL1-0031bR-1r
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:43:48 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28bf1410e37so495047a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 05:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703166225; x=1703771025; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Okech3HlgIWagSpdZ6UWmUk2XTG35ZUmXiF4qccU1pg=;
        b=EmCc8c1A2lvDXKpLnGAx9s+LBl/S4uhYs9+ULP3wvH5ww3f3T93dsWtAjMVNCHfOBU
         B7JcyI76xKTw3w4BD6kbACYNzaS7Md7Lpd4L48cP97L573ryKeJG9VuqIXA2EbIygP4x
         aLwZz59z+t2yTY8+OBy1Kfb4ruOHQeATaA4N+5bi1yoB1iZxuB2VzlozjZUbPPn/Rjk2
         oWOgc+QhpbPlJ0atCRtoHazvzxOJEtzSTSyGhjMRW7jCkJdm/qYhKGDYKyVax7BOKHOf
         bcO7a3G9sXX4eScz8ODIaYUk5D/QkbTqq0K+MZoKeQQcCwLVhGQ0ebxNEmL9jyQCFc/b
         zTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166225; x=1703771025;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Okech3HlgIWagSpdZ6UWmUk2XTG35ZUmXiF4qccU1pg=;
        b=f1FvV9lmuW52t0zXx57v6N578y7jPgpfIgKKkfAKYLefj1pUPX8XHJiH1MaEbCjGYQ
         UGTdQCvI84BLH2zd1VdptdtfCpFvGaL6nMNCCyXVO79QhqY1a41exDIGdCPWsWN7UY1L
         qRBP/4jZT5Zqct9GtF5EwSIsYSJRO2Dww9eGCJgOmU0aCy2+t8cFgYF9Hu86qpf3Rpa0
         0xOJR3yVqsy/lQnzzji++9tW07H16yo3uN6J3fF8eObKVTR6Vsbdb3ugYsd4SGVa8Efw
         2XuIeb9jYgMEXImLi8nfEF+raAHEP4IIWSubtu76802eD74k4ewHuOEXASZaiiuH00hM
         Th5w==
X-Gm-Message-State: AOJu0YzxUuDn0Xv9waxz4L7aLpe1fwEOhKorvjsglc3g9VOW072xM1/P
	8v9RYqPlnBYtxtbHPTC7GCRlqr8KoMDS5NzfjoRoRa5682yr6Yu1gZOzrERECQftoMpYAhA492Y
	FQo9IlZmAi8IVYPmlh6nN9haLOhZWHz0f7P99gnVl3PiZxs/dmpF8AlINAnvOpOgm5fK3V6Rd/x
	fR0X43VTuM9sMF
X-Google-Smtp-Source: AGHT+IEF/jUm0cNA4KicQ5YSVHG03ki4VbwFRBT30U0JChfOf/MtKoONi+0dI/mScAeEjMhK0JpvAg==
X-Received: by 2002:a17:90a:d715:b0:28b:c1f5:ab15 with SMTP id y21-20020a17090ad71500b0028bc1f5ab15mr3186574pju.34.1703166224655;
        Thu, 21 Dec 2023 05:43:44 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001c72d5e16acsm1646001plb.57.2023.12.21.05.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:43:43 -0800 (PST)
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
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [v7, 02/10] riscv: vector: make Vector always available for softirq context
Date: Thu, 21 Dec 2023 13:43:09 +0000
Message-Id: <20231221134318.28105-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231221134318.28105-1-andy.chiu@sifive.com>
References: <20231221134318.28105-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_054347_611399_FDA53D94 
X-CRM114-Status: GOOD (  12.05  )
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

By disabling bottom halves in active kerne-mode Vector, softirq will not
be able to nest on top of any kernel-mode Vector.

After this patch, Vector context cannot start with irqs disabled.
Otherwise local_bh_enable() may run in a wrong context.

Disabling bh is not enough for RT-kernel to prevent preeemption. So
we must disable preemption, which also implies disabling bh on RT.

Related-to: commit 696207d4258b ("arm64/sve: Make kernel FPU protection RT friendly")
Related-to: commit 66c3ec5a7120 ("arm64: neon: Forbid when irqs are disabled")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v4:
 - new patch since v4
---
 arch/riscv/include/asm/simd.h          |  6 +++++-
 arch/riscv/kernel/kernel_mode_vector.c | 10 ++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index 3b603e47c5d8..7df5a976a80a 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -28,8 +28,12 @@ static __must_check inline bool may_use_simd(void)
 	/*
 	 * RISCV_KERNEL_MODE_V is only set while preemption is disabled,
 	 * and is clear whenever preemption is enabled.
+	 *
+	 * Kernel-mode Vector temperarily disables bh. So we must not return
+	 * true on irq_disabled(). Otherwise we would fail the lockdep check
+	 * calling local_bh_enable()
 	 */
-	return !in_hardirq() && !in_nmi() && !(riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK);
+	return !in_hardirq() && !in_nmi() && !irqs_disabled() && !(riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK);
 }
 
 #else /* ! CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 105147c7d2da..db0cf06f2abf 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -23,7 +23,10 @@
  */
 void get_cpu_vector_context(void)
 {
-	preempt_disable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_bh_disable();
+	else
+		preempt_disable();
 
 	WARN_ON((riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK) != 0);
 	riscv_v_ctx_cnt_add(RISCV_KERNEL_MODE_V);
@@ -41,7 +44,10 @@ void put_cpu_vector_context(void)
 	WARN_ON((riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK) != RISCV_KERNEL_MODE_V);
 	riscv_v_ctx_cnt_sub(RISCV_KERNEL_MODE_V);
 
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
