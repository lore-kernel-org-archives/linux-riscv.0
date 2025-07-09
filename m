Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27C6C83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 02:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=reSan/9em1OvdxsxX6dkf9WNPiBXfZIwprO/Ur7j8Rs=; b=FdDHhxqCEMNRmx
	Yjd4vNKHt0Xrox0RoWmsAe6FnqJQJwf10PsG70GRdsZnWL/1UZJwSILuadNbGgrI1ahtobyc7mlQ4
	f1JB0oB89oOi3jikd3M/tztvjFSY5RfzNGYCtzta0HJza9HazhKxmNJiPPqKMjNJhr5sjbWJu+qBh
	CKQmoQWdqgoVphTWno3M49KhhLmOt+jrAIwiMLuj9+q/NHilvXVui6eYpvMMzzkB93dBSP1wVY2Z4
	Tt1aFh1XKjTy2AtpqPtegio4HxRMEbpeGNUPp2An3gaThIiUydYCcDEWE1hqlnCM0HWYcgNdZurHK
	C32ppkainvDKbxYdwv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKz5-00000007Dbb-3OuG;
	Wed, 09 Jul 2025 02:56:35 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKz3-00000007Db4-1fUy
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 02:56:34 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7d20f79a00dso752520885a.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Jul 2025 19:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1752029792; x=1752634592; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C9U4brjiS3C32XW3bHVRt6PkxvPweR4nZGcE43NufvY=;
        b=gDcN3O1dP2ljNNLAFTJ2qn+vfHy9vnrjbvjONQDkUYAEIsZ3OF0VQ5MICANe4tKOPS
         dWsUIMgJG3cIjkopFMe57C83CpM+EWn5E0onB4xg3BmdhRpZbjwpjWa8s/5lyu5Xivf+
         0NNNjYY75h3Ek8nyz3OUfh+QkJikpqi2SykNVDDPg8sJCBaDKr/lTlKP6Y3Tb1HUE/hf
         2axJS334kbQyJi77jZEutVM+HWs5dEt3XnvEo3SJz/MsnoBi/7zE7Pu0neNb7dmDH+K0
         HyJvCKW85IV8xA0z/fjUIab/zlcqNj4mfAR4m7/t3SqG2Lc5AvlqOGTUV7hvVSf9jm62
         nXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029792; x=1752634592;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9U4brjiS3C32XW3bHVRt6PkxvPweR4nZGcE43NufvY=;
        b=b9G1KyVHC/V5MwVdPLPmBij479XYTrrNDZu2zgFQQvLb3eQf/5J9P6v/bBfht5xpi1
         lsrxee42wZXwP2vyoamqhxQgSHU0x46FuFwQiWEs2EdR67nkEqUlZ2YjvdNlh1avb3ki
         ScJSq/aP5GZaPQNpz4fhQYavrjaj9OT1A5iowDwW3VuQAy/BB3KMLwqoc2dpZu4Oe1WB
         fCH1s7HUGdOVrfKtbCZt1UIVEZCzfZx29NUZWRgagOemDH6pUSwoWI970ZpezwTlBQEt
         XgwxCs8eMC71NBf6d4CwiDqPEcHC8araIplNzPfxzXJti9CzVPPTaTHTIZtroLtUSa7D
         oTNw==
X-Forwarded-Encrypted: i=1; AJvYcCVv/3sFJCl1eg/hU2Z7KMdzIc7howJiQimKVeBTPgYf7J2CNPBAjbsgAgWih/k5KKHxteh285TuB9QGHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsFaLOfklr9LjE8wtO1zK1CgCkTa37IvyQHIz/oPB2E8hbIFMd
	E5cop/CZ8ucgdN2c1EtZHFn2AAOWHKIGo4M/Ia/hPUBAxGdDXe7u5d8E3HgVrYGCIpA=
X-Gm-Gg: ASbGnctktbAPx/fEFGNUm3Pl9ZqlzQhd6TeG/TiWXBlqgJk7B5yp2892Sz8MTodffZw
	IQLxqfMfbh8vBQIemSCUX0xm62C2yYAT7++Y5T927xBg9G04N0PJhki3bzUYYZtQ22iM5bT1GJb
	huZU2usesVL4Hwg+hX1TG1oRRdCIdROvkWxBdv/ptiEkocf6pJixKYuY+QH9lmfYNAk6KCJhmRh
	VL2tIC8QQi5Ha7XS2rKiNuXixBTISxI2oMeioprhPwVlBUZLo8kj4GnTC/FMFOU+Y/b2K3uYYsm
	WjI8/TF1nhwXmuA1V/Zuvn/Q3tuAkQMqITu6uE+HDOl48TvLt3iCN4HAKSywFYsjOTxFWid+bU9
	vjms3Dqb8
X-Google-Smtp-Source: AGHT+IG/O/VknzhuZDlGWIkLTbeQ76zvcAaRgDp06FmEoKv7tLit+X11x+afuO2aoaIdYNQmMzC1MQ==
X-Received: by 2002:a05:620a:4508:b0:7d4:70:908a with SMTP id af79cd13be357-7db7db70ce4mr163253085a.53.1752029792368;
        Tue, 08 Jul 2025 19:56:32 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbeb2318sm867257585a.107.2025.07.08.19.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:56:32 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 1/2] irqchip/riscv-imsic: Restore the IMSIC registers
Date: Wed,  9 Jul 2025 10:55:15 +0800
Message-Id: <20250709025516.28051-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250709025516.28051-1-nick.hu@sifive.com>
References: <20250709025516.28051-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_195633_438485_CAA81451 
X-CRM114-Status: GOOD (  14.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When the system woken up from the low power state, the IMSIC might be in
the reset state. Therefore adding the CPU PM callbacks to restore the
IMSIC register when the cpu resume from the low power state.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 41 ++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index d9ae87808651..f64d9a0642bb 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/cpu_pm.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -109,14 +110,8 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static int imsic_starting_cpu(unsigned int cpu)
+static void imsic_restore(void)
 {
-	/* Mark per-CPU IMSIC state as online */
-	imsic_state_online();
-
-	/* Enable per-CPU parent interrupt */
-	enable_percpu_irq(imsic_parent_irq, irq_get_trigger_type(imsic_parent_irq));
-
 	/* Setup IPIs */
 	imsic_ipi_starting_cpu();
 
@@ -128,6 +123,19 @@ static int imsic_starting_cpu(unsigned int cpu)
 
 	/* Enable local interrupt delivery */
 	imsic_local_delivery(true);
+}
+
+static int imsic_starting_cpu(unsigned int cpu)
+{
+	/* Mark per-CPU IMSIC state as online */
+	imsic_state_online();
+
+	/* Enable per-CPU parent interrupt */
+	enable_percpu_irq(imsic_parent_irq,
+			  irq_get_trigger_type(imsic_parent_irq));
+
+	/* Restore the imsic reg */
+	imsic_restore();
 
 	return 0;
 }
@@ -143,6 +151,23 @@ static int imsic_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
+static int imsic_notifier(struct notifier_block *self, unsigned long cmd,
+			  void *v)
+{
+	switch (cmd) {
+	case CPU_PM_EXIT:
+		/* Restore the imsic reg */
+		imsic_restore();
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block imsic_notifier_block = {
+	.notifier_call = imsic_notifier,
+};
+
 static int __init imsic_early_probe(struct fwnode_handle *fwnode)
 {
 	struct irq_domain *domain;
@@ -180,7 +205,7 @@ static int __init imsic_early_probe(struct fwnode_handle *fwnode)
 	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_IMSIC_STARTING, "irqchip/riscv/imsic:starting",
 			  imsic_starting_cpu, imsic_dying_cpu);
 
-	return 0;
+	return cpu_pm_register_notifier(&imsic_notifier_block);
 }
 
 static int __init imsic_early_dt_init(struct device_node *node, struct device_node *parent)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
