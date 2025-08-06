Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3B7C87FDA
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4n7TnOyDWb3pZjyF45ibgCoUQGCjV7XN5xBOpGOiq3E=; b=SQgS+APJtC5ZS5
	qqKdg9Xg6ocRbAWf3DEmdpxdwyT8i+s1e181sOK42DPANCgyRrR3Jc62LB+x3UVHLoaMQMoRul1ne
	dShlQOeHynNeWzTWDhoNloWiaYt3mU/XZ5l6fxRImCXA6oUF7mrSQ+xjm9KDf4Pjd859R/jtBfzn0
	vUWeoMJwsjfEffHW4VXQ5HeXnFEIl7mFk+2j7Vh7fLBPyDvECOq/z4y/K4eBKdbERprc8g6shSMUj
	AcUWbSR7wtbgaKRZp5/tyNLiFwmWry8mf4LTW+BN+1KSyMAUyWEoSmr9Lwu6CmQ3DaEp+FjfNPIta
	/oId/dpIZttrk6dkFPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZhe-0000000Ef0X-2Dkb;
	Wed, 06 Aug 2025 08:40:54 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZUt-0000000EdZo-0KYb
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 08:27:44 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b3aa2a0022cso6404418a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 01:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1754468862; x=1755073662; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ICquv6ryhz4yGvAhRfrCL5GzjO2ttknExu9gWXkhufM=;
        b=gn5Rcd25odVQcx0KXjJbq+V9GpzplMvX+a/ypmrRqVehrBrVzjyFScJG9wZMSN7asP
         9QaP61D2f2Ym4UoSBVLwmvtPKusujhUdPjO3nyB5+/19+uGtKkiHE3YTrqkF58mJFkfu
         JsJESF72alMW46+GVqIyQeza1Xfn3hYleb39NqIVAircGpY97RLNbSUzeyqqlGLcF6YY
         lDnJfhdj9qhvIXQ/3t0LGcINUr+k1U+O6lU8cq4FUE90rH3/leYCQIM5lrfDLHehs60j
         QZCAsMxzmRS/aBp2BzZ2jlr9WoVW9gDTL44I/25H7v92Vr0p8f6nTZALWw/agtUH0rVn
         keUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754468862; x=1755073662;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICquv6ryhz4yGvAhRfrCL5GzjO2ttknExu9gWXkhufM=;
        b=IZ8UE6OpnIx8uFxeS8rw8gogKhTRmjQ+kydAd8VTs5gHSqS+aTM2qgwU+yuTwjlJyR
         /BNDWA1fH8l5K+/Zj2Pl4ET7hxwP/INTuyt83nlkuuAvt16gcN7kE/1gq/KVDIeoVj5M
         axKhNFOi1GswwcUwMR4vWQk80zhOWLqO2bYSPn+Ex6fvWd6fR2ejL08fs1UYWHbW8v6L
         TOu8yA5u+N+XgNFGnezObmL2sQU++MrhBSmKCExU7Rl+quLshYl1Gwhf3IXBi7dmXDzS
         AjR3IHP/DqMBSDnYyOHyxBiV/l45tS63jFecZfZAqpBo1PN67VuVRloUw9SFoPmirvCh
         APQw==
X-Forwarded-Encrypted: i=1; AJvYcCUxnP3QswchfsQDmqhPuRD3DieTL/8Tmgv4KjgRBEdQpphwyimHKlxBBAepFKaPdVMWGVakNrRxTD81GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw35SVcft54MisfBsg44+XeHpJSLyOGlr5vJJe7gtA5TzmeSfLf
	6x6puHmga5L1gfqfBUs+AYc0YqvSvJo6SUBtcA7IbL6Chjb3+j/SgB5J2szVO2LpM9A=
X-Gm-Gg: ASbGncsFA2PyT1PEgC1rXIywE/t5SwUU/KaBeSJAbzq2N+fYHDURlL/MPjGJzdwE1+I
	pS/q+pZm9qvOd/bMap53sq8Y739TULcaNHrKLAZbZ/eDkADOGkIO7OrJxtuRzRXKEGDMCtXSDjr
	F7BBrCi5M2198tWmgs5HL47hjtuHAMAMPxPJtnhyRyx4G5nToDhw+y6u5Ip1oo1jCYo3NnuyW9B
	wZ0F0zErol03BmEhM0Tis2BBPvQXQ4xx0DscT5hXVMf1zzJc7AXVk8ILPYiw7iKpgWZpYQZNXYm
	QF3qSvVAbCSzMwPEBM5AnZdAqn3IULRbmc2dO714SiFJ/3WcAZ40YFXqG7na+zkbPzhS/6FP9Rt
	FZ5VbVU1RmjOetT5zkw3uMW+UHdSKNNRFY8Fop34kzq+n
X-Google-Smtp-Source: AGHT+IF733iTc0Ba1nKB+UFJNP5eZARUzQJ+6hiLMhjJTjgT2pG+RpgGeiBuUhrNLaGjp6P8GrowlQ==
X-Received: by 2002:a17:903:950:b0:242:9bca:863c with SMTP id d9443c01a7336-2429f583a0cmr28973785ad.54.1754468862355;
        Wed, 06 Aug 2025 01:27:42 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e897690csm151958645ad.99.2025.08.06.01.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:27:42 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: anup@brainfault.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 1/2] irqchip/riscv-imsic: Restore the IMSIC registers
Date: Wed,  6 Aug 2025 16:27:25 +0800
Message-Id: <20250806082726.8835-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250806082726.8835-1-nick.hu@sifive.com>
References: <20250806082726.8835-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_012743_122768_D3DD2F10 
X-CRM114-Status: GOOD (  14.48  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 40 ++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index d9ae87808651..62bcbcae8bd4 100644
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
@@ -143,6 +151,22 @@ static int imsic_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
+static int imsic_pm_notifier(struct notifier_block *self, unsigned long cmd, void *v)
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
+static struct notifier_block imsic_pm_notifier_block = {
+	.notifier_call = imsic_pm_notifier,
+};
+
 static int __init imsic_early_probe(struct fwnode_handle *fwnode)
 {
 	struct irq_domain *domain;
@@ -180,7 +204,7 @@ static int __init imsic_early_probe(struct fwnode_handle *fwnode)
 	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_IMSIC_STARTING, "irqchip/riscv/imsic:starting",
 			  imsic_starting_cpu, imsic_dying_cpu);
 
-	return 0;
+	return cpu_pm_register_notifier(&imsic_pm_notifier_block);
 }
 
 static int __init imsic_early_dt_init(struct device_node *node, struct device_node *parent)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
