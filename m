Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7C2C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frr532NNIMh1YeNy4W8zzjN8t5Mk1RXLnPjNEvp7dsc=; b=GjFPsfm/yfUSr+
	ah91CdvMOQFM1xja+fb41qCChSlxuqPuv1tcrA6fWJeaVok++gZQw/tZw0Xbdb+Rx12TerLOSZ4AA
	g5JpKJwC7PKgHL+UbcAyVXTALjQJi/57MFrq4k1JJIX6vS6beLOzwaue4F14ZXn0Elz6Yg+LMCJRP
	G3HxRy7GpcwUFQX/upCnS7DkA3XUvs+h1qU3rsTi5eDMA13cTxzivUQsAdosNZ+l/q7jKP0b0eKbe
	yOTx9vlkuqnjwIia9uXUZZvoG1q4t57rJZyuBaxMPKn0vg+OZbNAOMJm2GHTcvM4DhxDx8yFMTMO2
	PG9ZbpZlU78gAmLCnCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDo6W-000jKB-1T;
	Thu, 14 Dec 2023 15:58:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDo6U-000jJ6-0h
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 15:58:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d075392ff6so6225455ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 07:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702569501; x=1703174301; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Su/cYQNxYPK8qhHX3mu7YrdDkKMaLJ+YHnVyjYZSKGc=;
        b=i2wmO625aHi74HfY6pnAsLj9TTnH/7DTlDEois4KGN6p7nO6YsEJ+0D4y9zSninpBy
         WVyKxNf9ps9kD4qPAfPZT/P9xrUzuXj1qBsbzBAMT69RISy3ePCv3RxKv75u2NBt15Sc
         I+lbda4pCHZgG8Uic+uN/FivQTTYhJP/o+JBX6h2BI72i3qQN69Yhkk1UCgwbJagO58r
         NoxIWNiTSJO1z0Oryr3yTL/MxjnG2SY1K5ZkmKDSNQZg+vlwBImaEUwJN20esmE3csu2
         Hw/U+oEyfuaDV9TBN1S2ImxChLn1QojxFjiD2i9PjHBYIFGjNsGqyRTWL+LicrG+jvpt
         i9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569501; x=1703174301;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Su/cYQNxYPK8qhHX3mu7YrdDkKMaLJ+YHnVyjYZSKGc=;
        b=MOhAbIaXG3zdMM2Ugl3YmIibd/l+TCt9kmjeHDq/GYyo4cB8g0/tirwO2Zf2qx046l
         2bQ+Yjl5qPHO6AXSSc0SIob8R7woa0hGM1sgd/Pr7x322v0y/WeWoFMocSZ8GXgftcqO
         gZpPMACw0TiwqWOII32V9au2MoKz3fZOnp4SQQuL9Q4CvyE2FSdgRY5uf5ztWyfCgV3+
         0L1aGWVYVVLSyONKxXaCNM0TsLNE8peeEf8kAjSNHFpxJKlKV4cWLHByXUs+ew97YxZq
         FYTR74QgB8tCwps7kJXFLzoSLP7Ph9SQhQXIM3PE+NlE8sZM1CL6F0lT4+GKepsNf3QT
         quQQ==
X-Gm-Message-State: AOJu0YxGz9DThDJvQicJmFDThx9h3Wbl3//mU1VI83gg2AXcsxkqT8pv
	WLdxMiLFnIuOq1nO+xQERZ1DPl+HjyunP93EOVWd6uQk1mo37nH/9T3QWcTkW9bWCVKAaKd2vOR
	AQJoF5fgsQV6/rJ5azGg+SVaHrmS4Y7oDhaFD1FdtX3AOdRG1wXINZSZ8sUYX+2LTWNPbfTbNqI
	ZDze3hF45wczDS
X-Google-Smtp-Source: AGHT+IFRwpTA4h+XxzQHgQTRRAxmsMRfgHoEhgu+fiFY8sBTx1rD2+ewtkPqy+QAxS27M85Ek+qpmQ==
X-Received: by 2002:a17:903:603:b0:1d3:6fa4:1cd5 with SMTP id kg3-20020a170903060300b001d36fa41cd5mr781666plb.66.1702569498899;
        Thu, 14 Dec 2023 07:58:18 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902e98400b001d35223d0besm3320799plb.251.2023.12.14.07.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:58:18 -0800 (PST)
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
Subject: [v5, 2/6] riscv: vector: make Vector always available for softirq context
Date: Thu, 14 Dec 2023 15:57:17 +0000
Message-Id: <20231214155721.1753-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231214155721.1753-1-andy.chiu@sifive.com>
References: <20231214155721.1753-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_075826_257170_215A8B5F 
X-CRM114-Status: GOOD (  12.11  )
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
