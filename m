Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B4AC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+AgmrYE1BqVjBfDmlEtkMW3Mw4VSCe1ICHx4y0LA+w=; b=EqcfdglEVRLSiK
	dtxgb8Ib7uvUkP/S7dL3tLtFk+CaRKA01S7Ms8jT81REjsU9cfEQj9w1l76DT4SjaRhdiqVAf1LMp
	BrVgngXhtilUDBxjN6cpj/0XaDmzs1Fci2PfVS2r3iB6OsI/M4j8c9GE50I7vlN9Wd7om/th/5MXS
	SOXFWcxp5FPn68y/RCR4mcF0kVa5JwNgngtqaUSryQO6rpCFgQHRIz4pSo2uKdyiZ0r4MzIdK3FSh
	8qtlyZ9ui78reUzhVCk+F+THJZdJsDXRiYLHyvUbtHUhhLmsp3u0CUuv24Sv1iEw4ycrcwwlVedvT
	SiwBRTwzPcPHSoeigXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlQx-00000007m2b-3c42;
	Sat, 27 Jan 2024 16:21:31 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOb-00000007kP1-297K
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:19:17 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2901f9ea918so727968a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372345; x=1706977145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23M+0gXGV/RoYlzBP/uez72ZRf4lEwzw20QI/B+WyQg=;
        b=gIjwv5gmW1aLoNJ59jVDPZ/24O3ESSfBMuKYBcaFDrisOvPvzoGq79eZuVcSh7ZO3S
         X6Yy5vXnRphZPxSZpiTu1fFMbkHd5da5rnWt9C7r0Gi/3Pjohqia7ZGBV6T5bN7go+AA
         XYtpnhdGqS8iRJE5lUfzyZLyGUzIPyGU6lT7LvQc2WYzCWLqaJWFRLnCdXBjIqOJWOJS
         01RNPjMt9ft3lcJaq/3jDXdU3g4uDU9/5x34DqNiM2JLP+1hIZ3ti4sZHnd7iz2eVLNp
         dEQZQFA6RPC8H0PLoCTa0t2zGu9yjyTBbQ6nMaxHrCikySyyqiogG6Cy0SemEEYgKgQv
         Vixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372345; x=1706977145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23M+0gXGV/RoYlzBP/uez72ZRf4lEwzw20QI/B+WyQg=;
        b=bt/PtPbRIQ0uWH4YCuzQjsHt/7mT7+ERP0gLqoKVDxvRsNUuN7TwhLaH2arnYgAeUs
         hqLEcTmMYR7sf8DUELzXuoTby1w10wO89GJrJYbJ2ppZvbQombEbyOzNVoSOu7qpUo5S
         Zyn+zsHaaLwfA0s7DoMxuUvkQCvAZOTjMCRwY9mdoZr5uKjqHNUJQMTT9jtCR0N64daG
         ifx2/gypdVoSxmAsxdwDJG7Afo6LcOWedg+ozJVoX7Pxgf/wUI2J+oIu3bSikHbuNEMn
         rvqX+L6S06BGUOPmOWWYWVB4qiTL6jWlDyUPeCvNcK/rrjAH9OZ9FXV+8CCVinRDyAvo
         ujJg==
X-Gm-Message-State: AOJu0Yxmv5+IYAKsoWqjPkgnCxrSDU9Tu2XmCZWSlwpPiQooZVgPse4C
	3yTOJ7sVETaZnsnHQtTIH5LynN9ybU8ZgmhAiL++Uw/MwvRA0Y2PK7Xhjt2yvP4=
X-Google-Smtp-Source: AGHT+IGxyReUlRjncQOCaYSxlVLq+2NqHNbCh2EbsUwV16mHxFH7X7d8RBQAnkbApl0UltR3WftXHg==
X-Received: by 2002:a17:90b:3cd:b0:294:f682:b349 with SMTP id go13-20020a17090b03cd00b00294f682b349mr832564pjb.1.1706372344606;
        Sat, 27 Jan 2024 08:19:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:19:04 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 08/25] genirq/msi: Split msi_domain_alloc_irq_at()
Date: Sat, 27 Jan 2024 21:47:36 +0530
Message-Id: <20240127161753.114685-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081905_900036_383F8FC3 
X-CRM114-Status: GOOD (  18.98  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

In preparation for providing a special allocation function for wired
interrupt which are connected to a wire to MSI bridge, split the inner
workings of msi_domain_alloc_irq_at() out into a helper function so the
code can be shared.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 kernel/irq/msi.c | 76 +++++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 33 deletions(-)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index c0e73788e878..8d463901c864 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1446,34 +1446,10 @@ int msi_domain_alloc_irqs_all_locked(struct device *dev, unsigned int domid, int
 	return msi_domain_alloc_locked(dev, &ctrl);
 }
 
-/**
- * msi_domain_alloc_irq_at - Allocate an interrupt from a MSI interrupt domain at
- *			     a given index - or at the next free index
- *
- * @dev:	Pointer to device struct of the device for which the interrupts
- *		are allocated
- * @domid:	Id of the interrupt domain to operate on
- * @index:	Index for allocation. If @index == %MSI_ANY_INDEX the allocation
- *		uses the next free index.
- * @affdesc:	Optional pointer to an interrupt affinity descriptor structure
- * @icookie:	Optional pointer to a domain specific per instance cookie. If
- *		non-NULL the content of the cookie is stored in msi_desc::data.
- *		Must be NULL for MSI-X allocations
- *
- * This requires a MSI interrupt domain which lets the core code manage the
- * MSI descriptors.
- *
- * Return: struct msi_map
- *
- *	On success msi_map::index contains the allocated index number and
- *	msi_map::virq the corresponding Linux interrupt number
- *
- *	On failure msi_map::index contains the error code and msi_map::virq
- *	is %0.
- */
-struct msi_map msi_domain_alloc_irq_at(struct device *dev, unsigned int domid, unsigned int index,
-				       const struct irq_affinity_desc *affdesc,
-				       union msi_instance_cookie *icookie)
+static struct msi_map __msi_domain_alloc_irq_at(struct device *dev, unsigned int domid,
+						unsigned int index,
+						const struct irq_affinity_desc *affdesc,
+						union msi_instance_cookie *icookie)
 {
 	struct msi_ctrl ctrl = { .domid	= domid, .nirqs = 1, };
 	struct irq_domain *domain;
@@ -1481,17 +1457,16 @@ struct msi_map msi_domain_alloc_irq_at(struct device *dev, unsigned int domid, u
 	struct msi_desc *desc;
 	int ret;
 
-	msi_lock_descs(dev);
 	domain = msi_get_device_domain(dev, domid);
 	if (!domain) {
 		map.index = -ENODEV;
-		goto unlock;
+		return map;
 	}
 
 	desc = msi_alloc_desc(dev, 1, affdesc);
 	if (!desc) {
 		map.index = -ENOMEM;
-		goto unlock;
+		return map;
 	}
 
 	if (icookie)
@@ -1500,7 +1475,7 @@ struct msi_map msi_domain_alloc_irq_at(struct device *dev, unsigned int domid, u
 	ret = msi_insert_desc(dev, desc, domid, index);
 	if (ret) {
 		map.index = ret;
-		goto unlock;
+		return map;
 	}
 
 	ctrl.first = ctrl.last = desc->msi_index;
@@ -1513,7 +1488,42 @@ struct msi_map msi_domain_alloc_irq_at(struct device *dev, unsigned int domid, u
 		map.index = desc->msi_index;
 		map.virq = desc->irq;
 	}
-unlock:
+	return map;
+}
+
+/**
+ * msi_domain_alloc_irq_at - Allocate an interrupt from a MSI interrupt domain at
+ *			     a given index - or at the next free index
+ *
+ * @dev:	Pointer to device struct of the device for which the interrupts
+ *		are allocated
+ * @domid:	Id of the interrupt domain to operate on
+ * @index:	Index for allocation. If @index == %MSI_ANY_INDEX the allocation
+ *		uses the next free index.
+ * @affdesc:	Optional pointer to an interrupt affinity descriptor structure
+ * @icookie:	Optional pointer to a domain specific per instance cookie. If
+ *		non-NULL the content of the cookie is stored in msi_desc::data.
+ *		Must be NULL for MSI-X allocations
+ *
+ * This requires a MSI interrupt domain which lets the core code manage the
+ * MSI descriptors.
+ *
+ * Return: struct msi_map
+ *
+ *	On success msi_map::index contains the allocated index number and
+ *	msi_map::virq the corresponding Linux interrupt number
+ *
+ *	On failure msi_map::index contains the error code and msi_map::virq
+ *	is %0.
+ */
+struct msi_map msi_domain_alloc_irq_at(struct device *dev, unsigned int domid, unsigned int index,
+				       const struct irq_affinity_desc *affdesc,
+				       union msi_instance_cookie *icookie)
+{
+	struct msi_map map;
+
+	msi_lock_descs(dev);
+	map = __msi_domain_alloc_irq_at(dev, domid, index, affdesc, icookie);
 	msi_unlock_descs(dev);
 	return map;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
