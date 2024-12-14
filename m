Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E90E7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 17:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIhQbkKMsggENuXCldM3e+TFKDOO/AK14bSwFlRsaGg=; b=W9PGgj30pCt8mI
	GThXhDi5WtIaR9W8v2eU3WDSuhuzcwAFbMdF4LNN7WW+P89oLLanEL89QnY1B312gQsYdpGYpIyoP
	IV4rsfvjw2eYg29EMHqV/4oJhqjeEp9G6U2Xj+hhSwks2zwRgH+GL6M91VuJVkmlmZiQzyW9wPyFO
	an456HyjJjykuSeyjYl4bzw6R8D7foIuJgcq8hqB0I5RzalEDFLTBd3Ooxh5kKWPHY6P0tOXU9smf
	9f86nHtbGVKgpGlm3Iix1XB840er+NtkWOayuitceoSBG+Uk4O6RJD0aST5BZ5RKQ8YpZCXon24S5
	ElT9zD4TJjEivg6xh+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMW1a-00000006hwo-1B1A;
	Sat, 14 Dec 2024 17:33:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVuh-00000006gSW-3ePB
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2161eb94cceso18955645ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Dec 2024 09:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197207; x=1734802007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBJthI+mqNYzorludLEAXvfiuDja+LCnD6djvnBek6Y=;
        b=XwD75bzjtZC0hcFt552Ed3Cwu2pjC74+4d2/k2A4NzxeKzmUaqnHjUAyEB31QZVDfe
         3eEMLwyqjFqN/AFGGwcW8/ZWE5u7OQDLxsN9U8zt8PFIpWLQ0xxBlFeMHU+tInxEzXqV
         MVVkhGBi5PqoMOLTrpDZVnWVmF0R3096yQuRuJeRr0m/ZeaFoGhPaWj487SxbPN4g0fG
         7oja0C2imIloG30z+vXbjb7w0NhaPmgkCkvdPpt13SBGMzMVDoopT2a5qKZMRcWpqJVe
         YKMLwMBZ2tHLrreVHPyPZcCBMtb730aIse06wHLyM7Jak6eOiIkiaw+vTODEXvmM8JrW
         75wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197207; x=1734802007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBJthI+mqNYzorludLEAXvfiuDja+LCnD6djvnBek6Y=;
        b=oQXoqD63FbAcmqEZmnMPBAgJqFOJEgfIRizIJ90zfugqZblrewD+3hwGq9VGcYSKp2
         HdFDPMXK9Bdc6dkv3LWfJxCAftB1DR9tRLVnCe8z+QWp4PDJ7Sjkb+Tkap9dkBq/MKQb
         43/IJ6TPvz+5H+IIxETOWczVGSQ+fWGjGgmMO2RAuEmumMJxUBKM45r0YPS0W+BIu1oT
         snT+cecOgxylbgvC0nwE0ahkluHK8WrVamqqRvQsohS0/xE2FVSW6CB9qUVTkXp09SCu
         zBM4tuQjXj8dLuWPBaXU5P2yEK1rfQu3pd2j335J48jm2DDXhE9LdJIUDE6UwNzhTc+8
         yjZw==
X-Forwarded-Encrypted: i=1; AJvYcCUYSwXt1rEe8Ghk/DgmTLlwJASC19DBqJc0snS+Z+J2lUICyeF9AAaOlUJ+rzbVcXrlPKWKonslCAxFWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNBvd2lU723o+tU2JPC6aMWpQfw3WgMAc9OY9mxx5v2cU7Beyx
	FstpXrmrHnwHpQU+9OXF/Nu8RF0Aq7lEfERy+DH7G17tVzt2hUPI8rP+Vmes/+s=
X-Gm-Gg: ASbGncvmy01z5j7aV6lJFTs7jVUS0BWEmSq/XonX+Eg7H0HpCmgDm/XSBEHTqSpeNjN
	8ntC4nRUS+OPirnM8S5hyswvRwR4Q9ADDGEMBQgGz+wv+d33aMqjUKW/H57uWvmXiyS84Aj35v9
	O2ZpXR1DUOEyXz2QebU4KM/qZQKJ3/yG0vaG33E5zh4RvTQG8JkdzyiEWhXJYRZ9YwnNLeExnY2
	I3k7XlpBOKZBW8EfM6k5dRs9ak0FD+ms9y/dDH3bai9IKNr7i4f8BD4wiPJhSeAX5eyCMbZa+3J
	2MVAV9cgID0xvnQ=
X-Google-Smtp-Source: AGHT+IHWMVLk7VAHEJKffclkR/GgfiztR1cE76mj+f0onDTerIF7KBl2vajNkAVkEerHi9sn/JzVIA==
X-Received: by 2002:a17:902:ccd0:b0:216:3466:7414 with SMTP id d9443c01a7336-21892a41a9dmr113376145ad.44.1734197206669;
        Sat, 14 Dec 2024 09:26:46 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:46 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 06/11] genirq: Introduce common irq_force_complete_move() implementation
Date: Sat, 14 Dec 2024 22:55:44 +0530
Message-ID: <20241214172549.8842-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092647_958083_59BE1B90 
X-CRM114-Status: GOOD (  11.38  )
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

The GENERIC_PENDING_IRQ requires an arch specific implementation
of irq_force_complete_move(). At the moment, only x86 implements
this but for RISC-V the irq_force_complete_move() is only needed
when RISC-V IMSIC driver is in use and not needed otherwise.

To address the above, introduce common weak implementation of
the irq_force_complete_move() which lets irqchip do the actual
irq_force_complete_move().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    | 5 +++++
 kernel/irq/migration.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index b689c8fe8d60..509c0ee4ef38 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -496,6 +496,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @ipi_send_mask:	send an IPI to destination cpus in cpumask
  * @irq_nmi_setup:	function called from core code before enabling an NMI
  * @irq_nmi_teardown:	function called from core code after disabling an NMI
+ * @irq_force_complete_move:	optional function to force complete pending irq move
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -547,6 +548,10 @@ struct irq_chip {
 	int		(*irq_nmi_setup)(struct irq_data *data);
 	void		(*irq_nmi_teardown)(struct irq_data *data);
 
+#if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+	void		(*irq_force_complete_move)(struct irq_data *data);
+#endif
+
 	unsigned long	flags;
 };
 
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index eb150afd671f..2920024475a3 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -5,6 +5,15 @@
 
 #include "internals.h"
 
+void __weak irq_force_complete_move(struct irq_desc *desc)
+{
+	struct irq_data *d = irq_desc_get_irq_data(desc);
+	struct irq_chip *chip = irq_data_get_irq_chip(d);
+
+	if (chip && chip->irq_force_complete_move)
+		chip->irq_force_complete_move(d);
+}
+
 /**
  * irq_fixup_move_pending - Cleanup irq move pending from a dying CPU
  * @desc:		Interrupt descriptor to clean up
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
