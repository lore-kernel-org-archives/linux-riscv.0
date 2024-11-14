Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0D3D68B33
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NX1Bz8GLcBpLRbZdC0Two43FSUpfmuTLCqHQsJUuSa8=; b=rglNsH20m5Viww
	royhjnLsGNT8Ji30HfXZOldeqxzrPJU+G4MI14rW1grCnKu7EeDOkJgBMMnEuJIduT4XQi31/LjTk
	kccbfiLG9ZPi+xp0eE90Yx9oiL5rAB34liLNoDxX70SaHxBYBlIky+C9iU9eaUJMG+4CbYMg/tgi7
	UNoh1dSLlb2jgWs2HmbyIdEdxSp/Djih9IDhiS3cVm36rQiz7bJRqH2+VWtu7YMlOC65/ss7yJhlK
	zuc5oW2Dd3k70CS0LqwvVdHC9Phmv0KT67tXi66nMJvTW1aAGXwFckxUVJT4eiT7BTQiNzfr31iNm
	g3TjLxNrf74iqK9Lc1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYX-000000004qn-3o6S;
	Thu, 14 Nov 2024 16:18:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYU-000000004mn-1Qrs
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:18:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43158625112so7703775e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601128; x=1732205928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3ezq2WAE13GAqwSlX07T0LyNCWtPpuH6EoHFe0wCHg=;
        b=fXuGTM44jDhdUwAiHOdExJ6pFi+HjHaIHPwdoe66vog4yis+QSwDqE0/1poGgrt9Ia
         LafaKaI45QKTRLlWfustd30TVr8GoPxnVnxVHILYvFqXYU5WeUa4b0wC26pXbqWblA3P
         z27SgJAkU1od4hKoXeIjIEQhJRRlUm/9+7J4mym0KBWzGHCJS3P/GtlL+CwmiVdJYg4S
         +7/DPyoFHpe/XkdlAeS/PAT60A2tm500wieWBu35gIE6sycjhZFkR4j94bfpYah3dMgZ
         AnJ1yRa3enJVHlgTqWi4JRg2Peig1GOPHPxRifXjNmbNP4nMX8kAjozhfmp+2XiueCjM
         qIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601128; x=1732205928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3ezq2WAE13GAqwSlX07T0LyNCWtPpuH6EoHFe0wCHg=;
        b=CMLNu7HvzFZpFs8aY64GIgZbWbtDjolbXDsRyYAuv5+LghFfL6DYLVegi9ZrJ8Q2LZ
         qF7GIlME6Qeh2V1SFt9G3KG6EdtdbJLq4PNjzfZOe/bVXsJXH3x+2ZppOSXkyHZhq0GN
         LmGwncgQ3F3NOGg4TmkVhTv84p6/nFXUKjwwXirsJVxoDFslsJfSOEPkIrfDWx9QsUY7
         /8Q19a5TiMsuE6GTnqrRgOhSnGd0FXe+a5FJpoo7Z6wNPnViwPrZ2SO9clgPwGnoUBOp
         2NCeuam4j+NQVWgAh+mMluakRtzQU9NYOUBex9t8QADSi9TCMBD9o6lJygWBIp8tINwv
         NArg==
X-Forwarded-Encrypted: i=1; AJvYcCVnwUAcNzyXXXMQJHDe6nRbJkUvoByFlChYLIIQWcfJBUl0Rg4T6ZghrfxErtW6dMFmL0Q5aA++aL1IVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ2Fqqtl9aOtOHRCTz+eFAYNwlTo4A990Ww7vpAYHzFC0ncICt
	Cbft1RkWohHYoXZ2QLnJep5FIcjllaM7fwVTqQzCt41IYzsaol944ihbnZFO1eA=
X-Google-Smtp-Source: AGHT+IGL/aKw/LZ1JTJ7uKMa5kImPbRP3wDn7MPyUSWssqMaT5McjPD8vLFqR2fLEptCKYdvhP3z0A==
X-Received: by 2002:a05:600c:1d1c:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-432da7cbcefmr23145865e9.26.1731601128138;
        Thu, 14 Nov 2024 08:18:48 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da2800absm28573255e9.25.2024.11.14.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:18:47 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 01/15] irqchip/riscv-imsic: Use hierarchy to reach irq_set_affinity
Date: Thu, 14 Nov 2024 17:18:46 +0100
Message-ID: <20241114161845.502027-18-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081850_387854_F19EE333 
X-CRM114-Status: GOOD (  11.84  )
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

In order to support IRQ domains which reside between the leaf domains
and IMSIC, put the IMSIC implementation of irq_set_affinity into its
chip.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..5d7c30ad8855 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -96,9 +96,8 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct irq_data *pd = d->parent_data;
 
-	old_vec = irq_data_get_irq_chip_data(pd);
+	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
 		return -ENOENT;
 
@@ -116,13 +115,13 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -ENOSPC;
 
 	/* Point device to the new vector */
-	imsic_msi_update_msg(d, new_vec);
+	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
 	/* Update irq descriptors with the new vector */
-	pd->chip_data = new_vec;
+	d->chip_data = new_vec;
 
-	/* Update effective affinity of parent irq data */
-	irq_data_update_effective_affinity(pd, cpumask_of(new_vec->cpu));
+	/* Update effective affinity */
+	irq_data_update_effective_affinity(d, cpumask_of(new_vec->cpu));
 
 	/* Move state of the old vector to the new vector */
 	imsic_vector_move(old_vec, new_vec);
@@ -135,6 +134,9 @@ static struct irq_chip imsic_irq_base_chip = {
 	.name			= "IMSIC",
 	.irq_mask		= imsic_irq_mask,
 	.irq_unmask		= imsic_irq_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
@@ -245,7 +247,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
 #ifdef CONFIG_SMP
-		info->chip->irq_set_affinity = imsic_irq_set_affinity;
+		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
 #endif
 		break;
 	default:
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
