Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838EFE7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 17:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0of8vmMgsAPA/oC5M6T/vmwBB7PBmpRHztC3sxy2hio=; b=TqLS+7STR1BY53
	fScvRRkGvs3kpt/Pv2qErEwasYw2dwccHkc3Xiq9XAHwJ3fw+v3A23Skj+FjB0tv1Ai5eabjxNn08
	tB66Dl93e9IdbKAxN9i4lf+75uAMXEtjt0l9HkAdgdNbX84lICW/nqY0eCvGU3u/uFQFY37N4Ot2L
	XYyipi8E/qt0jHOulsxcVW2hJNNZfspgwrshJD8GBpnkcHhbGEzUgjtDNedZhmcX5f0Xadh+PALDp
	CQFA4G4vkMVGJHEuRTiYuUclyhZjFKFdK5PxrohEm2HdjWMuW5lPNVU7EuoewQf9JJWs6EtfJBYh+
	boDHcFcmoADq1iRycv2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVyO-00000006hNe-3aWB;
	Sat, 14 Dec 2024 17:30:36 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVuM-00000006gN4-3A37
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:27 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso1871116a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Dec 2024 09:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197185; x=1734801985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=WtX4Rx2xWe6RHZLgpwXWTuL/DQBRJ8G3YiGMfJ3LNbTpqTtc2/66lSGYpGm9/83Jlc
         ij3nDZGtNjYi0+zrz6o1Ig9Awk1kKuH/yGqCufOoGJ/wbbUbycYMxTkAw/JMgSzfqU7k
         YzX/+spltkD7tkCe6x92GKCQqXa23STMffqdOyrrviGWXqBRr2jV56QcoxEiyqUA4jRw
         Vb8wJ/ZXWRPH3Y6bWc1TuNpczmjJHHDQK01792A+dzUz7dgohIVQt+nscOCg3iNw0W9h
         FJL9V9WPl1Ig2jhEzMbnX7pqvoPJRDBuzdPT4j7Q3WwRT+mX1ae71BoolI6O4wHxPE9f
         qq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197185; x=1734801985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=AXJrLdqIhPN3v/jlia+QqJodVAoFugk92ikVJE9AHwzuI8cOLi438E73p+XlHIRhaU
         lDJkFqz7RKWFaCQAafffb1o2hozhWcGqKqoUMUR9kqY9QnClKAFTCm2npVCgZsDYAlKO
         pXLNyeYiSgfFrFiK75urwv6X48TfZuJv9AWMppL4LdE3qXwnXzOborFY91oBg2SSPBVZ
         hBTrETQnzxIlLLcfUFLANjSHXCf25RUKtcCFso+wIb8dSSNLrH/FziA6EL1JgxwAFM/K
         pe3mhdtklX7/ZW7n2kWrklzA6ZyzTWrV+MJvtFv79Y4dXsDBSPQncULJOgobjOOl9GTB
         xd5g==
X-Forwarded-Encrypted: i=1; AJvYcCWe37UTEUusT4zaX98B7QzlV8DDfmC1MXpOMP04u+1RY7+EsY+JYmmJHewzDWQByzI3S3Addx4UDMhfmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDp1wmuu5rEzUA2TVyRNf1sMEN6C/AKjubyz91RxyIQt0UCeI7
	mkY2hcWJFSsxF7cwhNKSk5t8qeNZv1FsrNn4yyIvJ9ii8c8V/GlNcGDQ3/NY6RQ=
X-Gm-Gg: ASbGnct5c9hrnhzrgJJmPh0lj2adp7soSDTUO9AUA2AUMBu35ZSyGy0nVVUDNNDkjWU
	7kCKEcF9dureme5LX6lk/HmmA6z1bloF8+5BMmSb8LmId5ZKIUImQAtWtjMGUzrRMuYTjJVraIe
	XkofD/IWtYPMQ7JiJFsBZcBUaMOrFr9KbWwTrrXC6VyU6BQRrqqcvEqHlayhCX5EWn0I7Ny2AqP
	sJnHjSeJM+VWU9jAgBxP1MqgK18pqnOWnC5mBKeP3HPpQLwkcMEdkB7Hnrr0kTlTsXfAoGeIaTS
	8UcAw6D2TLL8s0c=
X-Google-Smtp-Source: AGHT+IE1SPKm+gzJ6VGXDJy+q7RKdAC9iquVy8ivXNUGMyZxEqe5AtUA6j7vJ+xaqDvjxeC/PzggwA==
X-Received: by 2002:a17:90b:3c02:b0:2ee:5958:86d with SMTP id 98e67ed59e1d1-2f28fb6764amr10436246a91.9.1734197185565;
        Sat, 14 Dec 2024 09:26:25 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:25 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 03/11] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Sat, 14 Dec 2024 22:55:41 +0530
Message-ID: <20241214172549.8842-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092626_783501_24358CB8 
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
