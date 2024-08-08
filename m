Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603DDC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JdV0bLlGePXwSxOCuW8pSWk32EwLjz7/GCStmomLJsk=; b=QsMnCrNSdOaNfw
	tg4wdT6NYRR5/g2fnWB5tJZ7HDC7FeGlrf6DQSN2hGFpZNHu+Oh3XNdrcUjrZedpIbrdNzp6a6Xu0
	SYLVVCjEmZV8ust/w1hnPx6dld2KhC3L5C+qYdjEnumW8e8x3TruY6N7Gb9xymlAB3OepxiGKlivD
	W/ksHCqdsx8wXqpLVe5Nm1BKQf6r9xZHU6wF5VYd2UlIGgxq19IqlZmH0pKbdOMC5BVptzvDopwXE
	IfmJvvsV0r9yJJKVV6pCFo1SiTAckw2J3hJnKZlpFvrflL2gKcwXPCVHjG09o4CoyogGQRY1YUTi9
	TrZbkBtNkynLAFRaPZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzFQ-00000007gaM-0lzA;
	Thu, 08 Aug 2024 09:15:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbyHx-00000007YHi-0rp8
	for linux-riscv@bombadil.infradead.org;
	Thu, 08 Aug 2024 08:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=L06iRpcXp4wDOtq52LfqR0JCUA0KWw53oMcDFbT/jsk=; b=Fh5KNkHgIkP63UYcQIrZPkJJvW
	Iua5azyd5zyaad27kxnuXfUKbMw/PDEyU1VCDTtq7aaRZ69XEYspQC/E9BIia5rjv9nyhmjPHDxM1
	QFOqb0EycbLu/e9c7df4maRb2FLiQpTg2epzoL7bzkeX3RYEU8+ukyC4rtHTDaYeL3ruWJKTWQZ5U
	1BLmvfPYHpUApEMhJBvFFto/5LttmniTckGTPJHOrY5YwW77jR2FviBnjA3wRI9vJNrwXCgxE8jsz
	DldK5oGmzS6iy0ah6IOdWMJMwR2p9iVa7cb7hlM8hDl7q8c+BGoPr1TMcOhTuAUi4rItNtrX+Rbwy
	WabTtmmQ==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbyHt-00000006mOM-2TUW
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 08:14:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc56fd4de1so4728615ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 01:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723104857; x=1723709657; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L06iRpcXp4wDOtq52LfqR0JCUA0KWw53oMcDFbT/jsk=;
        b=BUq9xwr0We+gtm8pP0eI8sSW5VkuPAnDwRaWaZ6rKx2sSwC4cu5iYZZ9wKCP/FFE71
         SNkbXXR6EcRQPDe/1RIic9SE8fJ4epy2V7qUuWh5bcvd1Yo+cGVVACttjcPaDCFMgkFV
         zGpHn9pTcvqrtM1LRxRBth1ChrXcabkRbutFrM3HUPRzvPCE/i7HZH3Lpj4NTu4YKw9+
         OOIIjBfGGMMeAqzz2Bh3T9iL+aYSlXEVYixXH5Ndva83LDbgWEGlLGu49djEvrQEmDDU
         gYH4rWHX0S26K4FxSGVdUooVr7megPqGcIGnMnIhkWDi24EzdjnXFQWHKYWJ+TCx/Fcl
         Q87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723104857; x=1723709657;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L06iRpcXp4wDOtq52LfqR0JCUA0KWw53oMcDFbT/jsk=;
        b=L7OoKCbhf7QwZqp1R+PZFDvLFpttYtKSbIeZ9RGBpnDKNG4hnBhn7W9G+mwQQeK2ou
         V3rkCUROb2+gCN1/lpsItXvA5mHFZ+Y3icpp2k9/odLobHJ2vF1/xJbMmBafpBgWHqXT
         GnEUrYJHfn0wlcDmVf+ApdAPEXmwg9sIttNFrJ/1yMi41hM1oO8ssCshnWfva4sbNMtQ
         W3wsSDJzoEj8zjog99yxl/6sqrSogPt6XT9O1G2YnKuN2cLJ3AmcMKNU1wNeiXotYNLm
         QlpaZhq6erRYcgrhZxh01XdOuNV38XSaj5PlKtQHwneii75cdZ+he/jB7KZD13KwBSnl
         wpTg==
X-Forwarded-Encrypted: i=1; AJvYcCVShnwKp29PC9ZON55CnsGh3WjZzB3qqbZ738itekwHwnlS7pscCmHT1TPBQ0HDk5XvweZtNr93v+UT5BUDNqkJryrYqg52bkD/fNW0GbN1
X-Gm-Message-State: AOJu0YxvUgNBNYrutv5B99PtIcSbmVkMd3sozOCu99fDhZ/z6UMiEcnE
	nE3+5Ga+40LC+orVvwLirRZF0IyLD8QLYFmhsRm4tdThwhc04OkOCB/EQyTRg1wF0uIoGrAMrnK
	aXLk=
X-Google-Smtp-Source: AGHT+IExV3OPKIR8JzFCixCb8ACKBz3qNOqbDKw7Xw+FuNSf4ZKD+4Q38oowFAWILoK8vzCKRreVZA==
X-Received: by 2002:a17:902:e5c3:b0:1f2:fcc0:66f with SMTP id d9443c01a7336-20096d523d5mr16005225ad.31.1723104857346;
        Thu, 08 Aug 2024 01:14:17 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592b65c5sm118803795ad.292.2024.08.08.01.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 01:14:17 -0700 (PDT)
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
Subject: [PATCH 1/1] riscv-aplic: manually set pending for the pre-existing interrupts
Date: Thu,  8 Aug 2024 16:14:11 +0800
Message-Id: <20240808081412.24553-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_091421_808842_07A529CD 
X-CRM114-Status: GOOD (  18.95  )
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

The section 4.5.2 of the RISC-V AIA specification says that any write
to a sourcecfg register of an APLIC might (or might not) cause the
corresponding interrupt-pending bit to be set to one if the rectified
input value is high (= 1) under the new source mode.

If an interrupt is asserted before the driver configs its interrupt
type to APLIC, it's pending bit will not be set except a relevant
write to a setip or setipnum register. When we write the interrupt
type to sourcecfg register, if the APLIC device doesn't check and
update the pending bit, the interrupt might never becomes pending.

For the level interrupts forwarded by MSI, we can manually set the
pending bit if the interrupts have been asserted before the interrupt
type configuration.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
 drivers/irqchip/irq-riscv-aplic-main.c |  4 ++++
 drivers/irqchip/irq-riscv-aplic-main.h |  1 +
 drivers/irqchip/irq-riscv-aplic-msi.c  | 17 +++++++++++------
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 28dd175b5764..46c44d96123c 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -58,6 +58,10 @@ int aplic_irq_set_type(struct irq_data *d, unsigned int type)
 	sourcecfg += (d->hwirq - 1) * sizeof(u32);
 	writel(val, sourcecfg);
 
+	/* manually set pending for the asserting interrupts */
+	if (!priv->nr_idcs)
+		aplic_retrigger_asserting_irq(d);
+
 	return 0;
 }
 
diff --git a/drivers/irqchip/irq-riscv-aplic-main.h b/drivers/irqchip/irq-riscv-aplic-main.h
index 4393927d8c80..c2be66f379b1 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.h
+++ b/drivers/irqchip/irq-riscv-aplic-main.h
@@ -34,6 +34,7 @@ struct aplic_priv {
 
 void aplic_irq_unmask(struct irq_data *d);
 void aplic_irq_mask(struct irq_data *d);
+void aplic_retrigger_asserting_irq(struct irq_data *d);
 int aplic_irq_set_type(struct irq_data *d, unsigned int type);
 int aplic_irqdomain_translate(struct irq_fwspec *fwspec, u32 gsi_base,
 			      unsigned long *hwirq, unsigned int *type);
diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index 028444af48bd..eaf4d730a49a 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -32,15 +32,10 @@ static void aplic_msi_irq_unmask(struct irq_data *d)
 	aplic_irq_unmask(d);
 }
 
-static void aplic_msi_irq_eoi(struct irq_data *d)
+void aplic_retrigger_asserting_irq(struct irq_data *d)
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
@@ -59,6 +54,16 @@ static void aplic_msi_irq_eoi(struct irq_data *d)
 	}
 }
 
+static void aplic_msi_irq_eoi(struct irq_data *d)
+{
+	/*
+	 * EOI handling is required only for level-triggered interrupts
+	 * when APLIC is in MSI mode.
+	 */
+
+	aplic_retrigger_asserting_irq(d);
+}
+
 static void aplic_msi_write_msg(struct irq_data *d, struct msi_msg *msg)
 {
 	unsigned int group_index, hart_index, guest_index, val;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
