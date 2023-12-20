Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5646C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 07:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0z7jSwwfgDAJGFpiUlr+5uUQp6Fi3T2GULt8vTY8gs8=; b=ZotBDphgvxvH0x
	hRnPpuBfsMhn3r1nANugZI50AYCWeWwsc1CMd5qgKPFqQnqNmM7PKAwOYGIIdfH6wWBboBbCgFyeI
	5bPOtPSQaMNCLmgnOECRHyf4sZkVGiJuVnKCm1KRAo52iky/7Z2hBN+x3K3+cU0tygKDUZcZ1ufmi
	PxyFoEAL+aUIgOF6JU9kEeyaEFUixNv7MZ6mLuLdnbdCdZ7YEfXivxdrwelfKCTmP0BsQsXdocN4B
	hOgYik7yVZvDRghtDMBWy/eIvf2lSKZiHxgJzg/rr02R71AwbsWqyK2Qb3EIMo9n5Mxi2g58htkNX
	72pdibWhkLDaTlTztNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrSI-00GUM4-0V;
	Wed, 20 Dec 2023 07:57:26 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrSE-00GUKe-28
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 07:57:24 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso660230a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 23:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703059041; x=1703663841; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V1lsxw5x/Z60q61VBpRIFECLxPvRWOMvCnylmkFtswE=;
        b=IpKJJYMQVSl5Ql35wNZWTXvEOXVCicLcRyBcn1I7kWzu4Dg+GWa7IfmiQ0N4uTP5ka
         MzKBskvJ37yh63NqQBoRAKWKeaLCUqAkPm2IHy6Lq4JA+za2Ozwt2My2c8ugK/fvpmL6
         JiiZImpgRVV/JBdcasInVM3CjgrYMiZtbPyCHwkh5INmockbK8J7tfG03Lmqt8D5YF5j
         alxu3svI+t1/+p3tn//OqNKF5TvS51d2i7x24jOreyasJgg2xOcOwJNrvu8ZzW42copJ
         s89zSSJMAVGXUCdShaHx2L9ajyr9VGUrajKLisOqzvwwqGnHqcmzjMrBFntkLYA3+Wbx
         xRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059041; x=1703663841;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1lsxw5x/Z60q61VBpRIFECLxPvRWOMvCnylmkFtswE=;
        b=gqxTwKf/9JbyQsUM9ylTtNn9LKf7ok9ZhgqBAPG/S+pgM050fq8EQNUuzA6DUppSYr
         62+xYdHOgFm+WAbia3nGoOX75G3Rf8cMI5XsOj18msb1V3vi7+R4R1Eg9/+szBAX3LDt
         maHsTAabWoiH+UIIrQtDGWKycEG5k5zKMtCzZ3tn+FvEmR5CuHrMYRLIgBVl1jerihqA
         IUwhH6PlnfHWFCBM2OkP9WTxs+2DmCQz8VJyKxTWDt2KP9MZTyyazMuoRe2QrHd3gwHP
         gGu6bhWVO9QWZLDdJILSzBpYTezOBeVvtyF916EavJf755jQYiZzTkAtfUDFeB7wvcoG
         BETg==
X-Gm-Message-State: AOJu0YyLUlWNr0ZdEmb7AUJAJ1BNx1F+k8iesruDVijIpkwSFys3Vl3O
	OBR1SJp9leDBGajX2ZZfWOBjiF/K4sC7j348vWw7mzd97pE6qyR/nPZGw8NWimwGCk3k229Uv6h
	0+NjkcA60s5I5EBKV02/w4/27qm+qD6wPc5GPyHg1UEJ1dgEBfiPLSil6yDUNMIhq4d6sgBwdyM
	s1sDsP7Nvvg5DQ
X-Google-Smtp-Source: AGHT+IEc+Rrp/P611JUnV/wfs5lD5XhiOm1v6EyQkUulvMtVU3ExoWKS+72g2+zSK73sQUHWonGDsQ==
X-Received: by 2002:a05:6a20:3ca6:b0:18a:b5c3:55c1 with SMTP id b38-20020a056a203ca600b0018ab5c355c1mr11796784pzj.57.1703059040784;
        Tue, 19 Dec 2023 23:57:20 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902789400b001cf8546335fsm3441453pll.5.2023.12.19.23.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:57:18 -0800 (PST)
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
Subject: [v6, 02/10] riscv: vector: make Vector always available for softirq context
Date: Wed, 20 Dec 2023 07:54:04 +0000
Message-Id: <20231220075412.24084-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220075412.24084-1-andy.chiu@sifive.com>
References: <20231220075412.24084-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_235722_700308_BF2A2E3E 
X-CRM114-Status: GOOD (  12.41  )
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
index 269752bfa2cc..cd6180fe37c0 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -26,8 +26,12 @@ static __must_check inline bool may_use_simd(void)
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
