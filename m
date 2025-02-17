Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A4AC021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zz4w4TXd5a5kPGcgKvt9TQGmS7PdvY6E7VBfWl/mNaw=; b=b6K+WhPzx/cO0D
	tFVWo/Z6waDKzl2yM32GGy7dNHB/YCHJ7EGXNE8Q4TPGBLAj/KpXg/dgbAU+HRpR5dW+vTivn9j5n
	pZENshQEskABiVC3rgpdYPN9ExU25Hgp7rqiRWkA8KzuSL//fkYjPGSw0+KJY5eKFiML9YZFRKUyf
	LbV15jh6A+LjMRCXNOGmaQZwPlaPu7czQIssWLbivs2tjhrhpYYOxbXLkExFKnapT11MymohM4ZOt
	upiHVeRXTkqZhLuUuhoiExhhbvkvprPR/sZvBn/bw8c2LxrsYBclDm/EJr6V2mzeR0nfpyuCsCr1y
	nVpN9/6nXIYFqNpl0IGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwyN-00000003pu1-2FrN;
	Mon, 17 Feb 2025 08:59:27 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwww-00000003pa3-0Awq
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:57:59 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2fa48404207so8371796a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782677; x=1740387477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Atdfv1u3QJvV1o68tlPZkH3S4E5LyywsJGNj7mblCio=;
        b=N5GZiwzPhb3hogKX/hCLPo1FRYQeET8F9SGiqJwJCz9P0EXkCd48OI1grZXB4Swezk
         NzK2CgjhP3sbxbFPUm6fvdXa0hFJfGXUnnU0LK2D5d8kp16TJaK19g/B5R91yqOiryyX
         MHPb0Qak149maV7EEMaMqWpY2hiyTuKYsFwXlq9rBZTFb4S7VE7TlFtoNFxB8HhZUDXL
         Nelnsd/gySLelKRegVcna9opIH43z0KhIsbK6MmhDsFdwuMjI/n7p3usf3nC8L1+cMML
         EN+Fdg7L0wavMSBNhyb/l+y8Pn3UHTpInifN2xZkF/sZGebQqFy2aPOH07zm3jSsZXRc
         XVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782677; x=1740387477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Atdfv1u3QJvV1o68tlPZkH3S4E5LyywsJGNj7mblCio=;
        b=mkPBQcVeLeXkU9JEtd5DRReAnjEHTlhEOk5lSTwcqn/uOPKa1Bqcb+bmhUEgbKd5uS
         aGfYVEK3dOg25Wz6gUulKV1u8mS0b4QJ1/MZYAZrt9OJ4GNyE7/66EvpJ2m4w+0ftTPT
         gVmJ7oKA8oQKlDlx2qKPN+7zUaq9SztGqfLrv22+hx7XUlPo/nuAoUXqYUo/lUMub+zT
         pYdSXD+fRXjJkSpAIc9uOwiGt49kHkKyr92MOB1tRqBieuzT/TRr4e6r85nNphziYkh5
         X9Ap5sPJZOU+b1ebg4LEu0Pgx0I02S/wkPaaAucDR4UG1nqhmtFDMmGA+y0Xa1NceYWs
         Hcjg==
X-Forwarded-Encrypted: i=1; AJvYcCWrI1JM1+L76rGuQsDvalr8QRKTU8nPITNkgruN3o/gC2c3MMmWgFoivmeYaZJpkdnBGQs6W8iMqsbEZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyCZKcw3s4+SyruQpvRtWFnzEdXu1SPaCQYa/i8RaVcnf6FwMl
	+nYREIrlcUdK0wELiJ73iTTyJYIBusQYgUW1uxaO8tbJ+bvXU6A1zcSFaYre3oQ=
X-Gm-Gg: ASbGnctE/j6/GghtGhW27gpniqAOcGenpJ2dpF16yZ7fIwXH/nTGNf9lKDMprsAAqyv
	jATvNb78At8MWqZT7sPKQ36csyqIy0d7r9maHHxhZsv/LjwxfsqwHJew9RUdMJksHOlzCiBLNK8
	CFZ+fvOp1I2EKYTnkxaG57i1IwbaPLRkxx6/uaBuLU0NSUHYcFFpWIG65PXsisPZQPnROi9w40s
	7X7CAXHfMTd3vNPMBJYomRiNO1yrLHwg5RtYtN9pdHSqa8nD7lx0Xpx1gLDQt49f/4xR2Kbisqh
	Ic99OATkp/R6O3gr74wY64FIynewYsIgO956l+YbiH5DRv+RbGvswbE=
X-Google-Smtp-Source: AGHT+IFPW0gjXYzToorJlW4AuIzo5YfoCgQvbwScUi6k6HolCkujw1LAnVbhNnt/U0DkIfz+68pqpQ==
X-Received: by 2002:a05:6a00:cd4:b0:725:9d70:6ace with SMTP id d2e1a72fcca58-73261798a0amr14960838b3a.6.1739782677006;
        Mon, 17 Feb 2025 00:57:57 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:57:56 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v6 01/10] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Mon, 17 Feb 2025 14:26:47 +0530
Message-ID: <20250217085657.789309-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005758_086388_A76DE128 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, Atish Patra <atishp@atishpatra.org>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, hpa@zytor.com, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Andrew Jones <ajones@ventanamicro.com>

Instead of using imsic_irq_set_affinity() for leaf MSI domains, use
imsic_irq_set_affinity() for the non-leaf IMSIC base domain and use
irq_chip_set_affinity_parent() for leaf MSI domains. This is required
for moving the IMSIC driver to the common MSI lib which uses a generic
msi_domain_set_affinity() for device MSI domains.

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
