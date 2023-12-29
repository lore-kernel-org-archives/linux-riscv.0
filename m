Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC3EC4706F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4fJUCUW69AVXo+XFpl8Fcr4QFrtNNkNoEtxdEaR0Bg=; b=SNcJp3/5CvVbWp
	pcS1k4GDnotJPcRpmS/jQibbhVbVg/38lxe7BAbzcOaksgni6wxLU9m6AnU02its95TSiRh2dNxsm
	hAjmM/m9BG5bvjlS74ZLuwuehK4Bj8ltleg8G5bTgvFLi1ic7FJ2mWz9aE8FnyCgaAT+nGmmE5ozb
	c44ptKPqpZxL1NQqGcFdkXuKA6UXlZnqZOty5Okt6PxMtONvBEr4xzpe/xILLI5ujK1+/J1bdIETK
	XAWI+yZHnRfXCErBEv6R991k//wLjH6qELPIaeGSxdb5j24/rQ1zePWOQjDyqWz/U1KBs3gEnwZQV
	zrOsSCnnFu6zzXZk48Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDz5-0012nG-0j;
	Fri, 29 Dec 2023 14:37:11 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDz2-0012mT-0O
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 14:37:09 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6d9b267007fso1504766b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703860626; x=1704465426; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VdUeptsKHX9LIW7qCWweJJ78pP9QWx453hTzE07H6mI=;
        b=WZVBqi6Z5IW4FUuWaRhslRYYomjXCXW1AzWPV6U/ZMzzDottb5cS/C29QVH8QJ+Ce1
         2Qg7LulsMHtuTUuit203kRV350toCLaraE5OcRzuyj+hqDdp0+8qfxIGYJGUN4ABvkJi
         nV58Rvp2cbpcXmItFzIhShY2+zdTcNQc+aZWM815ErmpIKFjinmm1S8se+8/6mpyOuuW
         FNJFeIevT7Y+89YRORiPfybTm7B9Z+0pW9zu0Tn4rnr60emYeIBgV4CnwKkSUjdgT0XX
         WtkMIyw802KvQZMePmhXgGpGXnPY5LP9jr+G3Ll2gsWMd044eDfGFASfm9mrZp1tsN8m
         Rugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703860626; x=1704465426;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VdUeptsKHX9LIW7qCWweJJ78pP9QWx453hTzE07H6mI=;
        b=FZb2963LnttbgSsWaUegwRzcV1x9g2VevgYLeS20Zti24guLQUtv9rm0z7aQ8uniiz
         HOifU3z78VRWl4uLAD2kgh/ucE0GYAqdz2TsDp8W1ZHUx6sHZqvDwZXdiHe/ftqFC5zX
         MHBOwSL8ZHyS93w0FhOVtKroe6hZrDjPO1wme05nJJ10fvtJ+Ijl6Yv+E+bBlM/H2wlv
         tYJWIDkfX0wvM//dhrWyWGSTws/bmYXLT6Fq5qD8XTyP3V3I0tpABwHsward/I3lPLhV
         A+lOdLOJmkXTN+xBBSM2ULE067bRfhpdfGixfChL/y0daDStiqggQd7N/Tv5hZFlE8iB
         0Zag==
X-Gm-Message-State: AOJu0YzzcvJuE8sW/6x4ewOusu3RlaQ9ZGkPDWmptfiNDpKmViAd7/E2
	UACPkfXGE/Au8fuPD8zCbwj39YsYh6lJNSIPgtIAvzALEK0l0tJyCoWeHm+OkDScBVwQpCAhyZI
	7mmi4rfAY9kIyvcOEcB61Df38NhKICv750jBICJLWD6x/wluadKcS/7pp+7WytsIs8A51WBLsfi
	ubiiwJKL+Wsysmx8ykhqlL
X-Google-Smtp-Source: AGHT+IEyP75mXlR3bkE8TwVV1XWwWz9iEgUZtuWs0gXGzDtoC8us2l0/3X7592CnsqyY+j5g+UL3dQ==
X-Received: by 2002:a62:fb0f:0:b0:6d0:89be:e477 with SMTP id x15-20020a62fb0f000000b006d089bee477mr4584760pfm.51.1703860626418;
        Fri, 29 Dec 2023 06:37:06 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y16-20020aa793d0000000b006d99c6c0f1fsm11544727pff.100.2023.12.29.06.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 06:37:05 -0800 (PST)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Baoquan He <bhe@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [v9, 02/10] riscv: vector: make Vector always available for softirq context
Date: Fri, 29 Dec 2023 14:36:19 +0000
Message-Id: <20231229143627.22898-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231229143627.22898-1-andy.chiu@sifive.com>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_063708_159861_A21BBA1F 
X-CRM114-Status: GOOD (  17.64  )
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
 arch/riscv/include/asm/processor.h     |  5 +++--
 arch/riscv/include/asm/simd.h          |  6 +++++-
 arch/riscv/kernel/kernel_mode_vector.c | 14 ++++++++++++--
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 28d19aea24b1..e76839789067 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -78,8 +78,9 @@ struct pt_regs;
  * following meaning:
  *
  *  - bit 0: indicates whether the in-kernel Vector context is active. The
- *    activation of this state disables the preemption. Currently only 0 and 1
- *    are valid value for this field. Other values are reserved for future uses.
+ *    activation of this state disables the preemption. On a non-RT kernel, it
+ *    also disable bh. Currently only 0 and 1 are valid value for this field.
+ *    Other values are reserved for future uses.
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
