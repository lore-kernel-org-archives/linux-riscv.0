Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1B8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frr532NNIMh1YeNy4W8zzjN8t5Mk1RXLnPjNEvp7dsc=; b=RsF271NGMkMKNQ
	9p4VezdVUXPzhW5PJOwjzyvvXHcMNPYDxFESc0x/Z3E+EZqVGksYoekfV35sODPIS5KrjdRTXKgMc
	FFtzYlBroIvtuCfkNw/snDTwfk1vLQ+c1nxu+cBkulW5e2MC8wXVAaIz8eeKmhP7Yu4nAIArsTneJ
	SNWPVMGyKme+fUTnEuiHUgnKZW3xCWIrUz+zKfz0bX3ag/W13dIjmm8czOPAtYtEF9fEgk7vbeV3M
	rRaFOAZJcRnBYfdGlDl7wAHNbzuvG0ADBL1zP+ohS2FfM4XpzEWW7XfVRSmyUb4ELc9DfXGKlbrdv
	77StfwUb5ayQirAS6xuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDP3p-00EksT-3C;
	Wed, 13 Dec 2023 13:14:01 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDP3n-00EkrK-2L
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:14:01 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ce972ac39dso4292800b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 05:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702473237; x=1703078037; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Su/cYQNxYPK8qhHX3mu7YrdDkKMaLJ+YHnVyjYZSKGc=;
        b=KdTfgSvEqssuiifcAMQQdMPNe4A6vnR4V+XSXXEClV5OgN5NViN+IkBaGW4+cdopUV
         0JLel3q66XYfgB01voZ3THmDflusCxhhq5titofPWRNVgq+ugqSd/k8Asw0QBiTQhZvs
         7ArtiSNrok+DHBaFcNtAfxNeIJZXKPVMhKpG0zlSrbV8W1TjuCaKP+/ykivB2ee1alrg
         y09flqhpiwJvmFc73Iid2qgDfTNkmmowZPagQezsvaCca2YOTEaZ881ND0XHfQIrHbRE
         4Sg/eZs+cu31glrqzDyzv6oFOP4tlGs6uaOmpoHILjOoBIWM25Te82BPlBh/apfIQH+M
         qXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473237; x=1703078037;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Su/cYQNxYPK8qhHX3mu7YrdDkKMaLJ+YHnVyjYZSKGc=;
        b=vqV61KDdfkcWIIZ92ih1FegioHaoqKuUozkx6GdutFQdJ2ldnzn4jBVTfJMV8EkvhU
         WU2CRuLoMgsS4TUnPLFyDkcjeVq0keYfUMkDJOWnSDlOzxTmhLkKNbI0WZzOb9VfZOhu
         R1XCPKvrPKR8VSofiR0E1z8sJv1XGZShFkVBCU+M6HP2lArQGJ/N4fR9fqSt77zeMU5a
         /w08oj74RCicZE69Pd6lJrr8xf+geA7IGnkCIimc3TbhHhF3Hdsc+sRCt+PlSicvVxfr
         5trbXsIkUVVkjRImzyi00wV9eAE+yItnxamvw0sP5+uPuaxD2lhyy7dwsz8CHPkHoTy0
         CcEA==
X-Gm-Message-State: AOJu0Ywl8R+XvDd1/58q6jmzMtc0Kyy5MaVS1aFA5KGH49jgI352g9RK
	iI9o3iEPAvDz9KGfdxSPvm6K45S/7p+2/YEftVUaWQY/wuVQdAmlgs4ch9AfyzI7rxqIpImvpgg
	XlIIpvG0FdHBNtFZHiSwx2NdLQCpx1iwIBdvp8SslvfZZbIhw1eUtLCaz+F9626njsWiCjqdezn
	cndqAXcmcRVlPv
X-Google-Smtp-Source: AGHT+IGQEQPQfRYR/d9h/bgPu9MYyR23b0F643iv9WBdUZvVaYuw6Z2WhSIG1NyjUYbS4RH7ba0HKQ==
X-Received: by 2002:a05:6a00:1824:b0:6ce:2732:274 with SMTP id y36-20020a056a00182400b006ce27320274mr4004721pfa.35.1702473236479;
        Wed, 13 Dec 2023 05:13:56 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id fn7-20020a056a002fc700b006cecaff9e29sm9928601pfb.128.2023.12.13.05.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:13:55 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [v4, 2/6] riscv: vector: make Vector always available for softirq context
Date: Wed, 13 Dec 2023 13:13:17 +0000
Message-Id: <20231213131321.12862-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231213131321.12862-1-andy.chiu@sifive.com>
References: <20231213131321.12862-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_051359_766312_387A6BE3 
X-CRM114-Status: GOOD (  12.33  )
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
index c9ccf21dd16c..52e42f74ec9a 100644
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
 
 	WARN_ON(riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK);
 	riscv_v_ctx_cnt_add(RISCV_KERNEL_MODE_V);
@@ -41,7 +44,10 @@ void put_cpu_vector_context(void)
 	WARN_ON(!(riscv_v_ctx_cnt() & RISCV_KERNEL_MODE_V_MASK));
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
