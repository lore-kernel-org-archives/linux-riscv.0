Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9697FC02199
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 04:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YG8nvKzX+4u0NuCuwmhLP+2BJ9iTaveZFvuVOPUbm8=; b=UfQlj62iaEY9RU
	Q3N2nCXYPauhP2UGmkkS3UlFWVTm8uuCtLegfC0yhDX44k8pIsPhtWhuRwK8oODva1lJdMpZO73s1
	sPYsqC8IOxo+hi9PmOJmEk9aTR3JDNahB11OR2T6/VqNr4mDlz4yivPw6DWS5doDs2YzC/27kUfy+
	+bYTYYg7JHFrQ/HgXKA7oj+Wme0uqTgUNVWQTQ+whtK5m5I8PSoouWYAWmpMdRUI39WTJNvdEhuom
	8zS8Hvtap+ARmf19EvvzzhtdALcnasxc8EkbOZsM0Vq5xA0n/Zovatt8VUZ0bBXKVcY8qbIZxoN7y
	wtgopPAWsLQFmz1520AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyng-0000000E33U-1e40;
	Sun, 09 Feb 2025 04:20:08 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyl1-0000000E2H0-0J07
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 04:17:24 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f9ba87f5d4so4708275a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 08 Feb 2025 20:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074642; x=1739679442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=ZhA1QhQF6RbBN70YHFPxplw9pQyOyDyCcHQUzrRG1Zq75CgTyYW7SIi/4ql2bVxHc9
         jBoStP4eaHWs39I/UVCQtuQVNIHnrMIOUTfsL0iGE8lBnYq7fIsttOQVVrsFLLSEt1bf
         KGu4NDFdsC74RMNu7SlzW3FKdShCpytmvU0pvTje0gLo5cYALvN/dbmT4NI4RMlv+M7g
         Cg8Ua81FkQRUIOAVcBeCIzIryR3yIVzOO+HIaQg9T7oYh6Up8PK1jghvoU7GgPIL2ECL
         xGStANAxnPwh5obYJy2QW/6rhrCJn0ueL1Ug6TsQYM2ieVyR3U3ymgowu1n4cEXAgtgB
         uedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074642; x=1739679442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=sCbc540a5PNrMyKctjHiUDrcrSeirLTcBd9iUC5HBYOeQMuDOJiD+E2wt8bFZ3vMnV
         qVTWWvPmhd7CDh/8cJPDwPkxYOgPmZtfV8crMLj4D4QrLrb6RixgBXt+CqKZLShfYIlT
         zOw+jMnM/GuwruJMbDPRABewRxIgwGB7Rb1hrP1hxQbJ2nB/OG7XRO9LpwYu5rurCY54
         xUZfLLaeixXDKCaE7B6X8lMyV/jxr2jcM5eroxAHondwzFLzOHMUyYe5UEiKCi/D98UM
         gU8Mkp8ahMSTR++K1DQQHiEoG/o08ynW7CGjvJFmqzblMw1i/T1fMwmoCjLlUJ6mr3Ql
         p68A==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7IDNfWLgWw7XT8SclAsfUl6Bahpp0dv+FsGrHwbZKTfj8gaVOFwhYzH4QkhfAxyD9Gj78tb5Nm2GPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeXM3xiIrcMZEMf56EZgsPpgAi/VH5Rr6wGhepgdwt2Pob1kEe
	peuwJPJSZxOiAFX9F9J44iLb0gxeT/vYEMWp7OoQywsy9fs1ifbg5y49g04bf+A=
X-Gm-Gg: ASbGncsbY3UrKdxrqKcpCfzoUanvS33a8iIxCheczW03zY9Rhbe1rza7WUtAzyeMs7G
	1sFeo28mXv1MPiBcBL9x9wFX193G4MbsBA01KOfyQPTaw6wWHHJM5ZPQ0iaFlnRjhrtpDtQ03tN
	8XiRSNb4R++i8JwvlI2hfBAQD68G3l7Md9tcp1DznkWifVh7mwEvfEQ/zMvNSWup6Q8xZFpEGmX
	whcNgUty8ECzSJ3Erawj0OK9f5x+tu5hZyhV4DhtlScOrz3B4cIJ2Fun/XxZwPLoxz2LZgH0Fiu
	16hnJqG0FYFL4QWHLNxgdIOAHgaV5Xzmo9BbP5vXUx4bnXM+mMTMI/8=
X-Google-Smtp-Source: AGHT+IHRXdIPs1mvVVeCpBykzAl+ifFcG5qlvMFYrTkFKgREylWnQV7fAuN/+eShJoWgxmV452gK/Q==
X-Received: by 2002:a05:6a00:b41:b0:730:8a0a:9f06 with SMTP id d2e1a72fcca58-7308a0aad32mr287596b3a.16.1739074642169;
        Sat, 08 Feb 2025 20:17:22 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:21 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v5 01/11] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Sun,  9 Feb 2025 09:46:45 +0530
Message-ID: <20250209041655.331470-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201723_263222_8F23E36E 
X-CRM114-Status: GOOD (  12.70  )
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
