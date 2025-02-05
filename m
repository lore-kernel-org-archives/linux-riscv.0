Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB1AC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6v3rCrAC9Tc9WC5bpmjJ6SnsLvxn/j3fkS4MH5jVyLE=; b=swhgCPmkiEaxr5
	IyFb3RkU67dZb1ApyZTuPxmXOt9Ar0adhhGS6MEzleRs/jq44TjRwb4NmJrD+/hHsqcQd2QkhCeZy
	1dfh4Wc3SuOq+85KL6Ca91s7kNn7F8kTT1P5UrOBSyzja83eHhaecvD/FM10jh+h4BCNN/gvXq9Cz
	wKedKHN1TARJuL1xMNPP89S0URqs7BsWFS0VLLIjwzUIsKYi++vJpsbzFgEmi/yrPeXZPvCt/fhXG
	iZ9u0vP449t2O+eRMDO/wINj2LkyrFifniCVbXf50YcAAOH4AfG5yPmFFkADXAa+cyXzDZxtJ6H0P
	uTM0YFq0i3bHfP1Ia+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhvE-00000003uGA-48zq;
	Wed, 05 Feb 2025 16:06:40 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpD-00000003suK-1SUX
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21f200014f1so9661165ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 08:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771227; x=1739376027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=GcGMj1B2FufUiEuKofbveyI/yKlRYdMCuQ5PWYd+zqu/C1qxBmBS2jAgc2kqt7oOke
         Z8m2h+UaJI4MNcsUDiP4Yf6eUUvjKDvmxURBwP4Bwq7DztEM3WXwYxkUFKBSSFPvgLeu
         pXmpwJEOJF10NzhHLN5KNfIxTsB4GtqbUW0AE+/+nO/p1v482XjECCtD6osoY5ui53yy
         EhA/ZsbnP+MJs9ctgKnjp+IHCWVBRyiok4duzZq5Zf9++upKh4I13rRemwOmIPMp+Ob/
         8dyKLv34T8Mr7gY32rh8JUt3TxQg/OxOrp7Elb064Oh3RHGJrPQiTVDKphks6gBlhdDb
         bdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771227; x=1739376027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=Qz3GDpMP8l3lRGByTpz/eyJpaZPnuTeiZOV2zrFGhtGFen2ANAoVl9W7UZ3f7wVBT2
         t9Nh0pecEyFW1CjuSmStA7dR6frmS80VDcMfLl5i4Jsa7U0uZwqvOx7iD8zt2b98AWNN
         F87Uxwy+x2RYe3vEgf6iEz+3mf4YJ5FPc3enz+XC//FGx79ct0s/giYB9xl1rjoMS0Nz
         BovkJgXoEbmZeD2vgV0gI+vudkzSmCEkF3PCdLMLo5rTSVshcoOdb0RO0KhyI95SZBOY
         8hyj9wy+v6wWFgEpRCmS/naMqxj504Rk2+30VjPaZkr2zzDl8dL3qhnyR3IdvM2c/DUL
         rw0g==
X-Forwarded-Encrypted: i=1; AJvYcCWzdhMf6WZipSKouokTwp8fRMjHPTvXrlT3zYBNpLJe1M8q5MWzvCXFY9wr2EuYNlUYPV10Ha11iEHmfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Tcz/w3WjrtkhtQxTevy0EYD8oXfOt/os+/xFtsSlvJn8MUtf
	kcCPdLZQWx3r0FwliRT9NiR2bkMlFSrg6SmLioB68JLWJNVCHJOYyweH97wbZ9E=
X-Gm-Gg: ASbGncv27IN0Hm8eXZsrLUC/qps8ga8/vUv4FjEqHtMpAklKZdMMQbEmudFOOUwxeL7
	ip/kMrYJdEHXd/2ir4a+tT2qo/BfOGUB4l6QmqWf1qKk7EdTInm2ZFbsI9yMPc6MBdyrL+QBRDT
	lzPv1nBJFpApSIPJZ2gFRBp9z+cfd/okE1D/7UPBaA/16hf7NA9C1/BKU4f9KBeNqrx+C8/F0g3
	aTYktD3Cg8m+jpR950MUw/2sEsWhPXmDGeWKsq94qjry/zozZoYDMPulEjN/lUuWhdfiRG0kQYd
	/aDtNRmgnhruang1FbdSRTC2Bas4XmcX8VPUB8kcifB+sDYCFLdzxu8=
X-Google-Smtp-Source: AGHT+IF8jFyxyV/f5JzHUJJ21FDiQHGu6kpLDQlz+2/R29XsqdFXb5Fuvhx/j03+dIK/P/pfOWQ0WA==
X-Received: by 2002:a17:902:ccca:b0:216:2bd7:1c27 with SMTP id d9443c01a7336-21f17ebb95cmr57042015ad.33.1738771226541;
        Wed, 05 Feb 2025 08:00:26 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:26 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 04/11] genirq: Introduce common irq_force_complete_move() implementation
Date: Wed,  5 Feb 2025 21:29:40 +0530
Message-ID: <20250205155948.81385-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080027_386350_818E298D 
X-CRM114-Status: GOOD (  11.21  )
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
