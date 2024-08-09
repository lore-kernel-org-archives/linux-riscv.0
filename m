Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F3CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 07:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iwsN2GxhMVybg8WqcPuI6XrvlvgfgMNbTSWxTnHWZ7s=; b=39x2CB+GI4/5Xq
	kZ6ZNwPO1bVvGdy/wfRxNT1gTzlcxxmlrcA+VamcNmV+pNzJxrEOqjw7161Nzy6AabUHyL6z0YJXg
	D0CZEHzr0vAgeOyon1CZPBrePSXt0PLq1rHDRmc93hHQVTEGU2Mh4/hKbYYYkf+c16NVbtilOHdal
	QU97RGnS5cAeq+x/MTjXNuXHgJwrUp1k0D2s7OpV3xHBryT48X/Z2jYiX6LN5Y/2YXdqh4Jrn0j3X
	+aEKcpLEz650OclMECY9wOVoqvn1ufRuSycg1LitvJVacKaUehJCxSCOLnspS7B6Gjt5EXyd+B5nY
	Pbxd8QWdju1TetYV04VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scJm9-0000000AVFN-2FKI;
	Fri, 09 Aug 2024 07:11:01 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scJm3-0000000AVEI-1zWL
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 07:10:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7a18ba4143bso1440052a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 00:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723187454; x=1723792254; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK3MDCV2rpOHu2qy4K9eeOFj7ftebBMKk/Vr4qOeqzg=;
        b=CKPkQe+decZtg3/67Qbm1ogVgbvgm7r5PUUoudgOWeuK9oGDcX5/ObtDUDZUsBRTbv
         iLetfNcfzFF75/WNDnOaKiY19ceQH2hWEoMOF++QZvia4h6ZijlHWN6lRmGSj5d0ya2s
         3afFwyyZhsnmdbndbr+z65L1kvra4x4OvYQzNcRlHYBU+bwRwpdjlPcZk2fDYmRMxhEc
         1aYnpFZLDxt7lNc0oLPrmsVrchxdx2oz0AHLFlbPNG74ljRzqBQKnfnfBZRbN53SqvQ/
         gTPxobelJrOUq1sVXP3CeeeM6704hqY6iwXPC6aJ8P/e6ty++UlOYHGI/ELZB2X6kIXw
         OzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723187454; x=1723792254;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SK3MDCV2rpOHu2qy4K9eeOFj7ftebBMKk/Vr4qOeqzg=;
        b=Sg6TD/ge36VxAUvpKDhKEt4kYaqi4Er5nZ3TCuJHj8GajX9hQ85DC8W4LLXtlHuHb0
         kSq1JTdAJTXKriPVgJ9wNMUFKcWZDe/flRN6oOdSXLaRYF5eQ45TzkqozBIvSJOlJfnD
         M5MCBkMRUTSQdcBDF7F7kafiAIuJacBSkoxTnsRQmrtF67wktue28RPbJHkerZQJR9t5
         P6xUKXCBdgVjvCu7DV+tPIuQXybgaPQnl8M13RNux1Tol76C0DSuGqSyYrAtO2xFTqWz
         ENV4wnt2jmngffZ6Qiepkg9dT+9Kn3fnbnAoMFhVFnzGTAM+kAuJrt/QGICz0LJu8PSO
         3tkw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ3BExvfZPf27yegjvGz55TdjW3G+pHpI6PRhaJJb1jTQGnYPGn0A7HMAssDEfEwuLmAvYvzsSseThFsGY3TWdLYX+MViROuYug1dU5E51
X-Gm-Message-State: AOJu0YwBz4BuKLN2EENSQL/zxBUnFF18iJjGIpefqbTKCbJi7bJCBHvU
	tZmIXB6387yFJ7OP4dxDMxbK/JbPXCpDRYbxMhljYs/Sq7j9fA5deknrA0+tZmE=
X-Google-Smtp-Source: AGHT+IEY4TBF7ra6jOH+IWRmf/XQhCq6io9RLd5FW+CdEtFQTLVV5A2SEkQOUfMGT3hVBJ8eZ2Qvow==
X-Received: by 2002:a05:6a20:c916:b0:1c3:b26d:82ad with SMTP id adf61e73a8af0-1c89fd2693amr941315637.3.1723187454381;
        Fri, 09 Aug 2024 00:10:54 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e7490sm2079259b3a.164.2024.08.09.00.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 00:10:54 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 1/1] irqchip/riscv-aplic: Retrigger MSI interrupt on source configuration
Date: Fri,  9 Aug 2024 15:10:47 +0800
Message-Id: <20240809071049.2454-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_001055_704524_ECF57317 
X-CRM114-Status: GOOD (  16.77  )
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

The section 4.5.2 of the RISC-V AIA specification says that "any write
to a sourcecfg register of an APLIC might (or might not) cause the
corresponding interrupt-pending bit to be set to one if the rectified
input value is high (= 1) under the new source mode."

When the interrupt type is changed in sourcecfg register, the APLIC
device might not set the corresponding pending bit, so the interrupt
might never become pending.

To handle sourcecfg register changes for level-triggered interrupts in
MSI mode, manually set the pending bit for retriggering interrupt if it
was already asserted.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
v2:
- update commit message (Anup, Thomas)
- rename aplic_retrigger_asserting_irq() to aplic_msi_irq_retrigger_level()
  and make it as a static function since only APLIC MSI mode require it.
  (Anup, Thomas)

---
 drivers/irqchip/irq-riscv-aplic-msi.c | 35 +++++++++++++++++++++------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index 028444af48bd..9d63dc37dea5 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -32,15 +32,10 @@ static void aplic_msi_irq_unmask(struct irq_data *d)
 	aplic_irq_unmask(d);
 }
 
-static void aplic_msi_irq_eoi(struct irq_data *d)
+static void aplic_msi_irq_retrigger_level(struct irq_data *d)
 {
 	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
 
-	/*
-	 * EOI handling is required only for level-triggered interrupts
-	 * when APLIC is in MSI mode.
-	 */
-
 	switch (irqd_get_trigger_type(d)) {
 	case IRQ_TYPE_LEVEL_LOW:
 	case IRQ_TYPE_LEVEL_HIGH:
@@ -59,6 +54,32 @@ static void aplic_msi_irq_eoi(struct irq_data *d)
 	}
 }
 
+static void aplic_msi_irq_eoi(struct irq_data *d)
+{
+	/*
+	 * EOI handling is required only for level-triggered interrupts
+	 * when APLIC is in MSI mode.
+	 */
+
+	aplic_msi_irq_retrigger_level(d);
+}
+
+static int aplic_msi_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	int rc;
+
+	rc = aplic_irq_set_type(d, type);
+	if (rc)
+		return rc;
+
+	/*
+	 * Updating sourcecfg register for level-triggered interrupts
+	 * requires interrupt retriggering when APLIC is in MSI mode.
+	 */
+	aplic_msi_irq_retrigger_level(d);
+	return 0;
+}
+
 static void aplic_msi_write_msg(struct irq_data *d, struct msi_msg *msg)
 {
 	unsigned int group_index, hart_index, guest_index, val;
@@ -130,7 +151,7 @@ static const struct msi_domain_template aplic_msi_template = {
 		.name			= "APLIC-MSI",
 		.irq_mask		= aplic_msi_irq_mask,
 		.irq_unmask		= aplic_msi_irq_unmask,
-		.irq_set_type		= aplic_irq_set_type,
+		.irq_set_type		= aplic_msi_irq_set_type,
 		.irq_eoi		= aplic_msi_irq_eoi,
 #ifdef CONFIG_SMP
 		.irq_set_affinity	= irq_chip_set_affinity_parent,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
