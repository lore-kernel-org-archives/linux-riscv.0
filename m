Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD38C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8d3RCEMR4S39nj9vPbjwQoBXKAG0JlbWeXcekVD26Y=; b=MGR5oNAYdhfeTI
	ng8ppz9LflH5oZLpffwjCcK0qz9DpYlfk9FbKoinjUSCLRcnopFTnFKP7SoUYocoghyh32897k4iL
	Y/wOSETevFd0OOPW1M60ufANOqUuIdTPxQ2UOa80uosfljKdyhLgs8t/gGfqmSdRXysm1LAPPOrtP
	bYOuYWbVedHQVJ56dMJfuTJM21LIhXKSh9KKUkxAc6/UyCado12qxNJBOxli+ABDBP/5XG6hf6Kyk
	edbFgx9sK1V2z/GOJavOswmZhZ4p5JXG0Ya8q5FBSgPaXS3g4s9QzF8c8sQ4X2he6Y3DeDE0IRaWM
	rLq1kfbC+YHfyMV3NL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlQJ-00000007lgl-1aHB;
	Sat, 27 Jan 2024 16:20:51 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOs-00000007kcA-1QqY
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:19:30 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2907a17fa34so1273543a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372361; x=1706977161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEJHdx6IO6bkVVTImbulpm/taR3P8DZhF8xpLu8rn5g=;
        b=AnvvjpGKt0U8Kb6hahW4jpaK7RPkzh/QLRD9nkfd7enJ1qhG23FB3kPZz1GMyhTbDV
         KsemCVTiqUKWq714i9GOjDbqr4gHmMc15GPR3n21qzXduqKd1SKfkhrC7eihsee2ZdXO
         QFBmDkhPklNarIAbcXLB2S9PH6+OeC10uo2wkcv0wodaJSoKNLt338YjdGdrqoJIIOXp
         EeLONy/Yho4omTYKr7lIU5R/o9eobKn4slgBTzPuf0yZ3AxQczbCIef+tLML9OInXc7i
         hmlg1gikTNo+7VF2EKdTf0NAF7mOkZ2GEq1H3ICW6qdAg/GPrsLya9IVP4IniftkHNYL
         WTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372361; x=1706977161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEJHdx6IO6bkVVTImbulpm/taR3P8DZhF8xpLu8rn5g=;
        b=rvNIK/E815UwwVPm4wlFElbKkwgSu0PlInz0q9tqjaYTJREWvNiEP5FvJ+m7nIHw0k
         bujPQOUybofIkIcxfLAWGjfxqOQl5TF3qEhhC+BmGDu8MHjtgcpgy2C+EqD56For4ExG
         ZXyarw5833PmjMroYps/rgUbQRm/SDWq5a3oD5xUoV6qaV5OcKUsg3FExscOvE5446NC
         /pW8Ofvdtvi7UyUU/EpwzjA1b+aRyuzgryFjdnM/UTtTzVj+mPN9TPYlKZjv5dLkkgGz
         dPoyYtFgr+Rf4MUAooZ6KHlO4l4OxfHnqAOAeaOGtCajZYiTEOTqVG/W358kmvHqj7MY
         Ap+Q==
X-Gm-Message-State: AOJu0YzyzGx2AHTMgZcdSU4B/wuunEeNhEvftyaKim8UotV0VSlSTF9E
	9+/VAu4zv1elA3osJqRdnAbIoVUCeTbfuk5qcEojZB4ssk+pkJrUnERuXHQx6PU=
X-Google-Smtp-Source: AGHT+IHIUpc0CrfHqSQkzgTdflfoO24IxiwZWgRJHvY8gpPilqZuNaET7dJ7J6HgrcXpdxUGvM2U8Q==
X-Received: by 2002:a17:90a:780f:b0:293:d89e:349b with SMTP id w15-20020a17090a780f00b00293d89e349bmr1219751pjk.57.1706372360712;
        Sat, 27 Jan 2024 08:19:20 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:19:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 11/25] genirq/msi: Provide allocation/free functions for "wired" MSI interrupts
Date: Sat, 27 Jan 2024 21:47:39 +0530
Message-Id: <20240127161753.114685-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081922_662553_7F027ECB 
X-CRM114-Status: GOOD (  23.22  )
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

To support wire to MSI bridges proper in the MSI core infrastructure it is
required to have separate allocation/free interfaces which can be invoked
from the regular irqdomain allocaton/free functions.

The mechanism for allocation is:
  - Allocate the next free MSI descriptor index in the domain
  - Store the hardware interrupt number and the trigger type
    which was extracted by the irqdomain core from the firmware spec
    in the MSI descriptor device cookie so it can be retrieved by
    the underlying interrupt domain and interrupt chip
  - Use the regular MSI allocation mechanism for the newly allocated
    index which returns a fully initialized Linux interrupt on succes

This works because:
  - the domains have a fixed size
  - each hardware interrupt is only allocated once
  - the underlying domain does not care about the MSI index it only cares
    about the hardware interrupt number and the trigger type

The free function looks up the MSI index in the MSI descriptor of the
provided Linux interrupt number and uses the regular index based free
functions of the MSI core.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irqdomain.h | 17 ++++++++++
 kernel/irq/msi.c          | 68 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index ee0a82c60508..21ecf582a0fe 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -619,6 +619,23 @@ static inline bool irq_domain_is_msi_device(struct irq_domain *domain)
 
 #endif	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
 
+#ifdef CONFIG_GENERIC_MSI_IRQ
+int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned int hwirq,
+				  unsigned int type);
+void msi_device_domain_free_wired(struct irq_domain *domain, unsigned int virq);
+#else
+static inline int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned int hwirq,
+						unsigned int type)
+{
+	WARN_ON_ONCE(1);
+	return -EINVAL;
+}
+static inline void msi_device_domain_free_wired(struct irq_domain *domain, unsigned int virq)
+{
+	WARN_ON_ONCE(1);
+}
+#endif
+
 #else /* CONFIG_IRQ_DOMAIN */
 static inline void irq_dispose_mapping(unsigned int virq) { }
 static inline struct irq_domain *irq_find_matching_fwnode(
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 5289fc2c7630..07e9daaf0657 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1540,6 +1540,50 @@ struct msi_map msi_domain_alloc_irq_at(struct device *dev, unsigned int domid, u
 	return map;
 }
 
+/**
+ * msi_device_domain_alloc_wired - Allocate a "wired" interrupt on @domain
+ * @domain:	The domain to allocate on
+ * @hwirq:	The hardware interrupt number to allocate for
+ * @type:	The interrupt type
+ *
+ * This weirdness supports wire to MSI controllers like MBIGEN.
+ *
+ * @hwirq is the hardware interrupt number which is handed in from
+ * irq_create_fwspec_mapping(). As the wire to MSI domain is sparse, but
+ * sized in firmware, the hardware interrupt number cannot be used as MSI
+ * index. For the underlying irq chip the MSI index is irrelevant and
+ * all it needs is the hardware interrupt number.
+ *
+ * To handle this the MSI index is allocated with MSI_ANY_INDEX and the
+ * hardware interrupt number is stored along with the type information in
+ * msi_desc::cookie so the underlying interrupt chip and domain code can
+ * retrieve it.
+ *
+ * Return: The Linux interrupt number (> 0) or an error code
+ */
+int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned int hwirq,
+				  unsigned int type)
+{
+	unsigned int domid = MSI_DEFAULT_DOMAIN;
+	union msi_instance_cookie icookie = { };
+	struct device *dev = domain->dev;
+	struct msi_map map = { };
+
+	if (WARN_ON_ONCE(!dev || domain->bus_token != DOMAIN_BUS_WIRED_TO_MSI))
+		return -EINVAL;
+
+	icookie.value = ((u64)type << 32) | hwirq;
+
+	msi_lock_descs(dev);
+	if (WARN_ON_ONCE(msi_get_device_domain(dev, domid) != domain))
+		map.index = -EINVAL;
+	else
+		map = __msi_domain_alloc_irq_at(dev, domid, MSI_ANY_INDEX, NULL, &icookie);
+	msi_unlock_descs(dev);
+
+	return map.index >= 0 ? map.virq : map.index;
+}
+
 static void __msi_domain_free_irqs(struct device *dev, struct irq_domain *domain,
 				   struct msi_ctrl *ctrl)
 {
@@ -1665,6 +1709,30 @@ void msi_domain_free_irqs_all(struct device *dev, unsigned int domid)
 	msi_unlock_descs(dev);
 }
 
+/**
+ * msi_device_domain_free_wired - Free a wired interrupt in @domain
+ * @domain:	The domain to free the interrupt on
+ * @virq:	The Linux interrupt number to free
+ *
+ * This is the counterpart of msi_device_domain_alloc_wired() for the
+ * weird wired to MSI converting domains.
+ */
+void msi_device_domain_free_wired(struct irq_domain *domain, unsigned int virq)
+{
+	struct msi_desc *desc = irq_get_msi_desc(virq);
+	struct device *dev = domain->dev;
+
+	if (WARN_ON_ONCE(!dev || !desc || domain->bus_token != DOMAIN_BUS_WIRED_TO_MSI))
+		return;
+
+	msi_lock_descs(dev);
+	if (!WARN_ON_ONCE(msi_get_device_domain(dev, MSI_DEFAULT_DOMAIN) != domain)) {
+		msi_domain_free_irqs_range_locked(dev, MSI_DEFAULT_DOMAIN, desc->msi_index,
+						  desc->msi_index);
+	}
+	msi_unlock_descs(dev);
+}
+
 /**
  * msi_get_domain_info - Get the MSI interrupt domain info for @domain
  * @domain:	The interrupt domain to retrieve data from
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
