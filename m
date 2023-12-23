Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ADBC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 04:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYYQ2vQ/45jWs3ldcMBAe9pee8WFvmDL/zvIW6UNBsA=; b=G4NKRbPC+MkOXd
	y0rrvA1Sq9YtTi3k8RG30ytmEsP/CnVr3kk1E1VbY6l+7W/btV/xKl6/sIvqJM1vAJdC+fC8DIfQH
	NhHNwVtGqitaVnr0A435JgfWCDOcPwIT5Empw5IvsNxJxwA0hOb7Y8j9NeV2H2FYMtIp27DlwNkV7
	4CAeiPv6REtt/Tx6IzoObsUfbYPui701A/tfEx665aYddnXkVpIUTBQzBqW7rt3iDTS1e8EcK3s3n
	8Qxi8FwrKGZW2hwJKWxNS9GVXQSPl/ter7IgprWq4ZrqREPsWkwlg0TQzthj5Ae21LuZaVf02TJgL
	LfRWIirgW4FxE22I6UMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGte2-007LrZ-0I;
	Sat, 23 Dec 2023 04:29:50 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtdz-007Lqo-1M
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 04:29:48 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5908a63a83fso1516683eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 20:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703305786; x=1703910586; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lp2+zsApB1cPbYh9VNGYBy7kWpspp9gbGDo7+YZjNlI=;
        b=GvtX2aqcxyNmMQIWQwtsIsRMwBC1TwG4L3RmCU/RWpG2T7zZSJXe47fETeFVoCPJXV
         iT5tmMNG7eGAHQDVbLd2bim6po4oYOB5Rn644vzIgLNickBNemC0GuX+GPDZjwWF4ZMI
         G2GN2yKHNXx3oM6UO7esHtqU0QbFxLckrnd/8Gjm8ybK9hCzifdczn/X45/ER64GgJg1
         /4oMuPqCvy0rkqI2+a9lNQRZK8xiypaAnGz6tl13dIrkUMVS3c67lSx4gNHdG8sJvQjY
         35ThC6DL/Gd13bq7AYwCMvqtuMN+386pDKR0MWw+G+oFUyxqoGQfNVclabnYnNDh+H5j
         kfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703305786; x=1703910586;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp2+zsApB1cPbYh9VNGYBy7kWpspp9gbGDo7+YZjNlI=;
        b=LI6/IlFAh5r37ASxFG0rcsmRb93yxBUlp2xKCjffu8WN6jxOfBM5qskJqu0veKD10N
         sXHOAHhqDS+4wpnt1JdzpN2rWTJSQQ/JgkBYzHSjspa53ClnpkhFY+AZIPan7tca/Sfp
         3QaGyJ2aCwPKkoMS3sEssVVoVOO8Hzsg+iEL1nAXZi8IJGsFzfI43gYaO8GUD5nkCsWK
         DL+C5ALEEVqjQPym2e1pHM13XCMRcJhspK0oLs+jCfeAHb+CgRRgj6EMTiqHdYbpuZa5
         A6hFshGfu2siQFS6Vzm1n85E7FYqrEHhIGZWiU+6HnFYpwWnVgkBAOY4F2b+MQunL1th
         HpAA==
X-Gm-Message-State: AOJu0YxHknOJczmfoc8RaCotvxYOwZCoC5W+rw7iFe6LuuWHepMMRCy5
	Te+iJLOMIlJoi3CCVzlvPBS5KTUufzGPLWGpI8lnt7LzKSg0NrpzjWWN81TOom83bwy/3XfOy2N
	Us9ENP0Mci4DXQQsQH8+aS+Cxhtqba7z0VlAD2RB5KUHY/aicSEiZb/KJubY2IdCfR50YKDr7ro
	GlYOEYOwVcKu/c/WOGNjWi
X-Google-Smtp-Source: AGHT+IFnD3BlZsvQGPajrdNuqUpn9/TfLxhUPCHRWaI7J/VUH/ZH+OVcZJnCJloR3KX2gnwZqnW/gA==
X-Received: by 2002:a05:6358:10a:b0:174:cf23:8fb8 with SMTP id f10-20020a056358010a00b00174cf238fb8mr2212614rwa.60.1703305785629;
        Fri, 22 Dec 2023 20:29:45 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm2623397pjb.33.2023.12.22.20.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 20:29:44 -0800 (PST)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [v8, 02/10] riscv: vector: make Vector always available for softirq context
Date: Sat, 23 Dec 2023 04:29:06 +0000
Message-Id: <20231223042914.18599-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231223042914.18599-1-andy.chiu@sifive.com>
References: <20231223042914.18599-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_202947_460886_87520336 
X-CRM114-Status: GOOD (  14.74  )
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
---
Changelog v8:
 - refine comments, fix typos (Eric)
Changelog v4:
 - new patch since v4
---
 arch/riscv/include/asm/simd.h          |  6 +++++-
 arch/riscv/kernel/kernel_mode_vector.c | 14 ++++++++++++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index 3b603e47c5d8..2f1e95ccb03c 100644
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
-	return !in_hardirq() && !in_nmi() && !(riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK);
+	return !in_hardirq() && !in_nmi() && !irqs_disabled() && !(riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK);
 }
 
 #else /* ! CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 105147c7d2da..385d9b4d8cc6 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -23,7 +23,14 @@
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
 
 	WARN_ON((riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK) != 0);
 	riscv_v_ctx_cnt_add(RISCV_KERNEL_MODE_V);
@@ -41,7 +48,10 @@ void put_cpu_vector_context(void)
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
