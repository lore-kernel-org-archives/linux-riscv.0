Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2749C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YG8nvKzX+4u0NuCuwmhLP+2BJ9iTaveZFvuVOPUbm8=; b=a5a0tGLbyGnNA1
	iTURqQiN2MZl0+WLptMP5EfXaXHQVp6fhQXBJScUrWImHM3u2exYtGOsOsP/asIuF9wTPsG4L33Jd
	CsEV/MsPI9h2mGJsU9XtLjD1sFb0isRBpyHnYMDC8rLx8UrYrYbQ3Ok+NKB6MNwL0qubhx67Ac3Ax
	HK/y6PdnqGSLSS6BBD4OC5qSQWBhqqxTRSYfLn4Jj0hlFuyYFs3jagfse+33pWW2M2hvJz7FKWYht
	S96Lou5w6t7gQZeOPtI8DOAiADh3CS+Sw10olZViAgVYJyINv/0mfKUASktgL4YNzHNBeaNM4QlUK
	G2/nqNLaWw0FmfLHLbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhrD-00000003tNH-2VEn;
	Wed, 05 Feb 2025 16:02:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhow-00000003sqG-2N4e
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=; b=GgEjLpY0OwT0bpWQJ+msw1DG6Y
	HXF+wSB/qJ9eMIrKKrs+GTDRRaAl2uWELIBWNHeIfGuqmQYe6B4XSgl2ZRl/tDATVnoux6NeQnyVW
	sHrhzFU+FhbISi9+TzD6S/NtiKT4Dwwed8h4kCBqjq4fA0YKTmvDSFQM/TURVAzpoEI+0gIjQ7n7l
	AHV/zZ1WRro0Me1X9XCEFv+vGkxbmTw3a7DYdQV7909atto44CkE8saR4T0kt7m/m1IQfCB15qr9A
	sUBIATpM01bzCqJGrCiQ2XYjIg6TVtye/VOtSwCivzgRmrBkk1LHQoZcgIwIZys1ixTye22Ws+SgD
	rolWuIBg==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhot-0000000GgKm-2KCC
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:09 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2163dc5155fso124409485ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 08:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771205; x=1739376005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=RHAUBPB2DvScUihMQzh6RFEtnszQm1n25B5Ts/O4zEC+bJIjw/PG1cbgHieFBGztkp
         GkDdhWL/4xu4sG/n4chiE6/c9i26pXY1UPNn1RgZ4c2DOxg0gfKUm9CmV70hBWXonmvA
         rV3KhGOmpHmYQZZesz+EFcl9EbkMBOLb1HonKP5nldiyVBpUvJfi2ik7dtTFu+8vwqnO
         Cp2kT1Y2WUUF1nSlpc9S6foGJb43BRU3eT4aBnI0FZkGNIHnEb52xN4QenQnlkymqBwh
         NqsmQuo06/ztNctcEJ52ETPBxXFEoF2xH9OW1/zcz46hw82L4laQdWLlJVvMF6XmvMmI
         xqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771205; x=1739376005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=ZhFy11dBBEoqmU0wrsJ0gchSuYQapiB9jXkSafwGVnWX6yJpt2vUzZCU3aPnY+aQ4K
         LMig6ZuDZtfJXZV+tMiZML1z1BTg/tQgp4VS6nuNep/CnILWtS9q+oV7WQqlUPT/6QkM
         e5g4UNFtCTeL7prFX7a8B9DOI2vOPlbpvuNYf2E5NOfr5HzIfDw43MxkiviAOT1d+3h/
         ktSRiglZAaA8iRfj9It+RDAqlsE4olbpwLtoxB8FvG+85y+pKivFUaR+dgOxQXsFZAi4
         KgxCRjQ2pD80wEJbjW09lauEG75IOfOLKsYUpq1KmHC79PNRW3LbCczTUI8jmyVlFbE0
         6AzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq9hTlaxncSjdyGnj8rCV6jt6dSeBbUAJUDMpqpAcfkl1e2tCB9OWqKBs+FksMaFjEtwh/b+7onU8AYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNjgoSoNrifeWMK6h7XdboEqXuZ3TytHLPBlRda6Zq5EqSdVkt
	hoCxjt4+gWh/1DubAdJfRSw62jFXV2wBu315dtE3Yh3ZIckioT+3DFFxgahT55I=
X-Gm-Gg: ASbGnct5/Us4pmmXykOLeqRHBW6cF7uKcIeBjHNZgqezQDSdD6GVOBtlKK1i2RVbS9B
	JCkyd8VxlRaWCh7ZFT1DNBhu7eDBTnBUVnJDz+/zs1QcHzDBjI3e0ps7MTrUxslsBrUFaDSo0MM
	xWuoigC1qVfflqtbqt45p27muQXeK7MVdy0HBsBDgXRjBv3wp5/1hn0XhCzyxgPfsDjj+EtI2ZF
	bevfrGYikexnPhcfvIEKK9+jySYMRln9D4pG/6on3UXzMEC0f7tlT1OybCQV4DkjHWW5Yn1V0MU
	wR8NEdatDMaHiFFLvaza0WTktJ3HLwJZHVKRlNoEt4Xci/twMZ6PtC4=
X-Google-Smtp-Source: AGHT+IFxrHkC5lry9v73hirVrwz0VwaueSl7vlCr1NVutMq+Q53roymPHtPchmK1sMCpMcVptQ1tdg==
X-Received: by 2002:a17:902:d28b:b0:216:410d:4c53 with SMTP id d9443c01a7336-21f17ebba71mr44908125ad.41.1738771204969;
        Wed, 05 Feb 2025 08:00:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:04 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 01/11] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Wed,  5 Feb 2025 21:29:37 +0530
Message-ID: <20250205155948.81385-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160007_814755_DE8BA4C1 
X-CRM114-Status: GOOD (  12.62  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Andrew Jones <ajones@ventanamicro.com>

Instead of using imsic_irq_set_affinity() for leaf MSI domains,
use imsic_irq_set_affinity() for the non-leaf IMSIC base domain
and use irq_chip_set_affinity_parent() for leaf MSI domains.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
