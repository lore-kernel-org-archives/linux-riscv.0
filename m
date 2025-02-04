Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26375C02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 07:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0of8vmMgsAPA/oC5M6T/vmwBB7PBmpRHztC3sxy2hio=; b=MHPL7KPvihZRql
	37qniSQsqRgBeyQfivemjQYnbKTKKxlJvLy4PcRLQtPU31XLEoKKazNM85RsYfpLx0j2YpqLyrFtx
	nlexbsRI6v1gZuXj4t75Unztsy05HFhgYvHvllCL/HjRdGxQIi4FWoHaz6XcXSdu3yvGsuWKjzcwz
	dxyVnHgU6aP9O0Z/aKAwsLgWiYVRn+O67mo1b48ForDTL3RfOTq36ma0ywt9cuCKZ3Zs02oARiGre
	2rUXFmrOJfOEFEPp81tTsd65HTXD2DtmZ2tZW7aMxler0WjkKManXgt6hyQ1+A+eYL1pv1Cs5ctzv
	g310l6aYb/dpAVKxsrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDpv-0000000HTei-3V7p;
	Tue, 04 Feb 2025 07:59:11 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDll-0000000HSha-0txn
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 07:54:54 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7b6ed9ed5b9so888115185a.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 23:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655692; x=1739260492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=EdQSY7Li/3xErwyTKc5KPO1Hj882zI46VS6rdyOThYd+KcqT/+TSjk2tx0Z0kq78AK
         jhYeO2jM8vyGUXBnFt+PJQYsgGFzkAHjDRRdiwfHk+E3apCS6Jz4+Ri46EzGK0ndJNfT
         xW6kfj75fyTWJqypzFm7glZuuYRKue3nFeePEMsL1oEQXQPau7wZ9Kjn+HuWVIbDqRH7
         85o1Q7hNP/sTRBiMLIjNI0HQp9sj3jcXdYDNIKhCkcYSbGZUNYJ9ZUou1LFU27d0KD6B
         CsG7kVhuBE+S4T2qKD9QbNyLf2ubweD5trnPww89O99Yu+TkVumIfXEFGwPFvBh6H8EV
         /zOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655692; x=1739260492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=kFXKh/JJihhtv2fySiLHj6uq5OhrfDstYoySkRCtgRq5g0K1Gdc4QqOxqpvoNlL7br
         Bamk8V3Pc4gMEeepm9y36bvNGTEiBfyCFAC+lk6AqbsNBS1+LYbdan6n6v8R0wkif8qo
         oAEvsEIjgwwXQIBFbhdp8+da06G8QtLuskdpCi66xVQb2wElZ+vNJ1gz2STSrp07jWNt
         VjeArzNEDmFLP+QVZt4DurLVXMElc+JC3hnY32DkT2Wm7GtUVo5GYRAgfPuz/7/O0ucd
         +3gGK5Dc+oY6V/FxifwE8piIokew8HW1AMs09AGiR2UiUFRRoJLwHdAvXFejU35SPaiC
         7H1w==
X-Forwarded-Encrypted: i=1; AJvYcCW+zMqeIWEEg6xBAuXlgird8vMdQvJTyAbR3IHl+ue5/6ohEJVMxKyQo2nveCMyt/1tGyKjStzMKzdhyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj5+4BTJLik8ixeYGLagZ19FXBBqbM0dsIxnPQEmHmV8u4qi7K
	BAGcpHJ5KbJh7YqRKYNIhUuBJU1UeaNy2dpmk5AiuyEEK7cUJMiHKlUiv2+zCk8=
X-Gm-Gg: ASbGncutedsJvh7KdMxKE6z030lc9WeqhPqkEsug5o7OccRqnqpg75WoGsxiRkTbLHW
	TGabKUejgS6dMvsnnuT3rApZk7YBfZqin84XsPS0wc7/Ix1SDxV9mIp/z0nOyjIvBTyOuwTlNMt
	tK7ar2yd+tGda6TajqKfdDLsI1E7x+5lnnB5jG9OiH9Jy54rMaMkgMa9jR8z4/L3rXOikzGhBRg
	hlXkmYNG5Py6AMOlEyIWp3yViKwt0EQEd448Q2LfG7AI/5BENhTRb7XkyIAImeRlmGF7ACmU/ru
	XA0d8LTobBbfbt/PX8a9JqQ81lokjxzf4qWbJSTC9lsHicUCZTnIjyY=
X-Google-Smtp-Source: AGHT+IE555JYDjxayJP3hHqE1TDj1cVPpWMaeaM/3WguRaZQLIT7OdX0Wc2dai4BACH0ZbT7vjefxQ==
X-Received: by 2002:a05:620a:8395:b0:7b6:6e59:2864 with SMTP id af79cd13be357-7bffcd726edmr3656909985a.43.1738655691894;
        Mon, 03 Feb 2025 23:54:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:54:51 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 03/10] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Tue,  4 Feb 2025 13:23:58 +0530
Message-ID: <20250204075405.824721-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235453_273836_291A3B40 
X-CRM114-Status: GOOD (  13.69  )
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
 drivers/irqchip/irq-riscv-imsic-platform.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index b44eb0b3990b..dc6f63f657e4 100644
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
