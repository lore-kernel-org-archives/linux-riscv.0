Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB0CE77173
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Dec 2024 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ov+hsBdUdnom1kglZS3uXxZ4YILfuMdC3u5p/E3r6ik=; b=aDBid2mgfm9x6S
	W8oZZVDMWaSUAKvSU6iJnS4XqDWYYcFpZKZr3eXxQSsYiTq7F32GgD+Iyob7b5yyU1gK03SrTWIxY
	7K75YfMjEFM0t/5/y/nKFHdFhxVPqjqqLLyzmMv0f3LvbLIFkG5lAKJZffikCDiE7TPBQavWe8hkC
	2Sx8a9NamA3p2dmPhbeZP7zlXwG3PQ0oguYOv9R4OTZ0RZrnx1OFtZa9oRcp77FreU4EI3SlglWFk
	k41JT5Or9mv61Zcj8Sfcvi49bL3TKQgCk9MFUVRjzPI0GJ3+7cT1RpUoPAa7DOi+pvyF1qm8Af1qv
	zzXFp+2uA/k2v55aPgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIvc-00000005Qs2-3pHe;
	Sun, 08 Dec 2024 15:10:36 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIsl-00000005Q8W-2RNx
	for linux-riscv@lists.infradead.org;
	Sun, 08 Dec 2024 15:07:40 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21631789fcdso4789005ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 07:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670459; x=1734275259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkXmty9V9UumQmJiSKG/1C8V4fnfZ0RhcvZQ4ROkR2w=;
        b=gmvqFq96nKrMOKGocaWoq9D1d3ELVaUiUUEaM72MrAlm2CkDBTysvb0cSvLfqg+Up5
         /gaFBBxugq6i+PqTt6EvCeZaP6aD8qjgLolAuMdsYe59JkYbz2Q8u0+m2mEbyoDUXRbY
         +Sb59VuP3GNmxMyWlbq3tu/8vfgDScgaEyo5jsgnqXD9gami1vcrXXxvTi9nACBr9kaA
         mxyxtPHhO3fQz/DsV+VdqdoqYojEV42nrbsWe5PaL4qy506szW9hbZSiOEIj1dybexDY
         tsxKyS3KACwMXQX0o3YCOsu1fqR5W+MuSqL67xvaJf+2wmzuUq/Cxciige6m5iwnsFB+
         MQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670459; x=1734275259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkXmty9V9UumQmJiSKG/1C8V4fnfZ0RhcvZQ4ROkR2w=;
        b=QnzwMyNhfHLCrl8VTMzKUQqVdKC4/vqP4cWsxJizuWlFLe0FdNEEPU9XNKaxapBs0+
         QQ5Oua1CIhFRCMxEaxkQ2Bd9pz89xiwgm1OTN0kcuFgSRXySAs4iQntR4RzdheyBsydm
         iVl34DOXvR+1g3cdyRP4fgN+xIDhxrLsLydBw0aW/8eJK8V3rCKweN58ckqX3wr6cueO
         UwJOE4GZIKSef3P3+NEUjTvtzUILeqDNnldmmlkF5BfQ4QY+GCKRX7bbfHqbt07sDINi
         998nfwtQ5zeDMwsFQdao2UcC0wUl9x01MeUkKESDyYxnTv3A8vwqlpJVtMY8GNzw/xnf
         iunQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWGJ2MdK+U7oXj/hizQD83EbMo2sBR2wiUs+IeKWT9o97zEtR99IxnEMgQqC9KEnDLKkLRfiIvSSAw+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBWS6JH2qO7Goas+qux6rifiQXa0dal2Em/OsEXviMQFfloTIv
	mhyeD9dko/35MZJe88N1QYizUZWPhOBAEXm56D7mPF6+8fGg7DAlS2rsS/Y5fow=
X-Gm-Gg: ASbGncu77OQeL5LgIlYacXJZo6oCS+7dsmfTEro2jneV1wNbYxz6+xEe/4T/yoyyM/+
	Mm52rgmvSBvwA33dXX8v2x8Y47dOjrJrGNGwIfljzrFqNn0GcfzEwcIYLaALmFkMk3UpxOx41qA
	iJQc4ZbIPM4vlraBHA8D6LC2TkqgOHJ6ICvCKxHChsIfCYFZaAvJBgw89Qf/StJKiFfYxGIvUb7
	hLjbuOTPCpBqOF5q5PCb9E+ohWDiLGpmINQLgjFmIaXeRqn1nctrI6pbnhrA4GYZN5nh8iRO/ec
	lD7Ud6ts7zPK3co=
X-Google-Smtp-Source: AGHT+IEdCvop71IxVDmxbyI+VLG1bHMgUFJCX254kjusIKOtBxnkHakfEgU6KYI1lpBx+kU5iAXctw==
X-Received: by 2002:a17:902:ef48:b0:215:742e:5cff with SMTP id d9443c01a7336-216114e67eamr186694365ad.16.1733670458958;
        Sun, 08 Dec 2024 07:07:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:38 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 3/4] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Sun,  8 Dec 2024 20:37:10 +0530
Message-ID: <20241208150711.297624-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208150711.297624-1-apatel@ventanamicro.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_070739_623925_33E0CEDD 
X-CRM114-Status: GOOD (  13.29  )
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

Instead of using imsic_irq_set_affinity() for non-leaf MSI domains,
use imsic_irq_set_affinity() for the leaf IMSIC base domain and use
irq_chip_set_affinity_parent() for non-leaf MSI domains.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 707c7ccb4d08..33a8261e6017 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -96,10 +96,9 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct irq_data *pd = d->parent_data;
 	struct imsic_vector tmp_vec;
 
-	old_vec = irq_data_get_irq_chip_data(pd);
+	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
 		return -ENOENT;
 
@@ -139,17 +138,17 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		tmp_vec.local_id = new_vec->local_id;
 
 		/* Point device to the temporary vector */
-		imsic_msi_update_msg(d, &tmp_vec);
+		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
 	}
 
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
@@ -162,6 +161,9 @@ static struct irq_chip imsic_irq_base_chip = {
 	.name			= "IMSIC",
 	.irq_mask		= imsic_irq_mask,
 	.irq_unmask		= imsic_irq_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
@@ -272,7 +274,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
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
