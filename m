Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3698C0218F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 08:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6v3rCrAC9Tc9WC5bpmjJ6SnsLvxn/j3fkS4MH5jVyLE=; b=lvxV0pV1Xz+Hxq
	Gs9287OberUr43qNCUPePp2R90D/+uhaYY/Iksxwz1PnOlxIkABeAiTs9h4I+h9/UusH8SzGhFPXj
	soD0iuWNvvSjApgdzQf+WG6rWICd9jis6Y8tIl1uvHORCjNjK9V5aQSBgV7j4LtnJgY+zpDea9F9T
	0RNoHyqvpkfihXL1Oq4WbyEDkUFAjXIAJr/GDJ1QdN8BwujljzPvoqRo+IcJ6jx2HEBr6wTQYfDZE
	vk3cVJ61eG2VwKz+0/1xq7F3fftfhTDlrH97s7fVK+02Usp7UdJnHvXURD7pDTJ92hs/0iylr4pLI
	KzZEGmaD++sZ0Zm6KYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDtu-0000000HUCp-0GGK;
	Tue, 04 Feb 2025 08:03:18 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDm5-0000000HSoW-1C4x
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 07:55:14 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7b98a2e3b3eso290201085a.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 23:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655712; x=1739260512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=nCXhPJS129mXHl8LjkLJpQXnN8qDONxJoosT4r1dWpAiKa1481PWWHbN08LAcHvg8d
         1XCr6BHQsm5sheBCweuxVrHfCuzlnamFtZ0LiGIulmQf1+LqXDSH5s8+dDHZqZGfeZTi
         S1ZZqLE62xs7k0spvAWWiNG0ozXkdloTzOCLpBRW7VggQXgQgwsa/McVCpN/F+DxHmD3
         N4OQAST+PTn42lxEN2JgX6SMImpQdxUbuLHEswnWBWjdeBy2hjeHhaTLO79JE+3BQAyA
         iksg9asm3egzT8Jd0NuQnzg7xz7WDRhX6rfoAFiAAd6RgrkGnA1Ctr1EPQncR2E4Vat7
         lw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655712; x=1739260512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=jbQ5/82eDbl9utBS62YPwwb6ARbrj+5mF0L8fXgkJf1M5fUctJ/Pib4eJbG4bxYfhH
         sC7Ml7B8EZ1Qm+dNRq5I33VptoQOYwHtZSguUMx6zGCgScdVIW14Dr+NrJczUpah9LCQ
         upkrZQOLiZb3ZT/vEBQwkU/HWrF15sMN/iWfntu+tnby2whKIa2rymH6DW4wFUj13UZ7
         s7n0/eZQdhPxprPKljcy3Y2dmcNQRR/u7N7tW/e7Y0b3c+yDtunFYe5iwaLMMGKLD4Xv
         PX7LctiuspNaM9nb5D6+QSsWjsdsoPBnk5crOW71hUxErjpugyVivSMtbw5PjieX/2H1
         GIeg==
X-Forwarded-Encrypted: i=1; AJvYcCXwzuqR8XzwFlW8DBsdh8iBRbWdrgS41pJ9xJ+fmagabAeGqFYWP7AviKqvDKveJx2gNh+I2sXUmuX5jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YylkieaFtFkvFoXwQZZcV28n55aSQgeDnkjru12qcQLzautq5xt
	h13ErU62mlNPnyebr1jw4mdGcFCyI2JKaKBQCbdlh6X1T1xDYg/HHm6vXowiiWc=
X-Gm-Gg: ASbGncv3+U20rzubVQGtpKcxuS4z36EwjF3Pzo6rtvrbDbjGfnJSUoYXiGY5GrJ1EVV
	da/lDGe0ZBimcwCbHMe/mA9ij8ldhrL3POfQjnXSBcITrN/IxhwuwZatR434DeK4lbYovJgb1ID
	VyITBAODE28lO4/n0gECNh9ITpQMlNu/w8kBcXcOrA332/huOcDfL2Dtd8JyXh3wGVJG1HYnShQ
	zAxWwfWYWiNN+IWtuG54CnShjFa8J9xmDFWsXudY1QhbM91gx2MeeWGX9QkbDA9c+Q56fTdJHLn
	9dE/kqL99OALNX8C2I4KmHR0+aLXGMVERZumq4qbGOh8ZnZqTs9D8xI=
X-Google-Smtp-Source: AGHT+IEygJlzRE1f+LllQAS/xZozPVCC5zlNa0cJxT7IbmhuAFZYxlHSMSOoINty/Bxd6fyVjhK48w==
X-Received: by 2002:a05:620a:2b8a:b0:7b6:6c6f:fb5c with SMTP id af79cd13be357-7bffcce52e1mr3541223185a.15.1738655711939;
        Mon, 03 Feb 2025 23:55:11 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:10 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 05/10] genirq: Introduce common irq_force_complete_move() implementation
Date: Tue,  4 Feb 2025 13:24:00 +0530
Message-ID: <20250204075405.824721-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235513_323073_8266E554 
X-CRM114-Status: GOOD (  11.28  )
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
index 8daa17f0107a..1884fa4ec9b5 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -486,6 +486,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @ipi_send_mask:	send an IPI to destination cpus in cpumask
  * @irq_nmi_setup:	function called from core code before enabling an NMI
  * @irq_nmi_teardown:	function called from core code after disabling an NMI
+ * @irq_force_complete_move:	optional function to force complete pending irq move
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -537,6 +538,10 @@ struct irq_chip {
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
