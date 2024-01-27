Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BF7C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhnDV4CwvkYe2fzV/vWbEnMRYkanzF0C5C64faocrJo=; b=yOotBtLrUgYSTa
	ytkNpDc5N3bjqeDRWimOCacEbCndZxTamZnj5PRdmH7qUqo+dTqDMNBemGyEBzK0Xp/AHZQ/CYDDC
	CyuUR2wjvzXtH7ozXH8M8hprEgFJ/6kg1xOKEkgJirIaBTan2kUZr4QvfteZH6eFXvwq2OrUdfixr
	3hmS5FP6eUPvB3HtkVyq0WQjhX165WpwhFnG5ifv5215RcNZp8EgG64Am+GgjgHEcUoU9b4YiB1r6
	yPgAXFvV2B9zlIor0v6A/+z4mc2piOIF7Omp0lIgp6rI3ojCOrxqJ/BsWtwvTGYYt0aFlxRPlKgow
	eKysObRawjlhDI1qHeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTmLk-00000007tXz-3uB0;
	Sat, 27 Jan 2024 17:20:12 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOJ-00000007kAE-17kv
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:18:48 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-290b219a60cso893557a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372326; x=1706977126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3xeY9DtBOR7dOD5/FngRjzfNRbevqnFzh0hE75BcjE=;
        b=R6n8kCMjdeC1ZjGe0B3coxgo4E2028dUUlPSLRvCK07K+T34DUH0DXnbwdHqiJq8Fk
         dsnniWTrOjGgmYfioDcMlpuftUETmin7dJ4zv2e0vznPU9HZwdTKoIA/D8wAB28dt0xg
         UxYmTt+iufKIMSBWw5D/DhY5yhhOEXjw2KEOS60WJR+G62aMyPjI75NO+kqHbKmbFRXF
         puLQ0ZeqYsNPSm1wp7C8N952HYGCETq9rkKin+1cVSx/ovIg0B+UuPqrbg3zO6iIRTHA
         uEqjdBU21rV62ScVxMZp/wDzlaGQG7PvYJWMcbiQ6B8z/UZXrQ4UFIjqQg6hjE+1WXiQ
         Wxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372326; x=1706977126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3xeY9DtBOR7dOD5/FngRjzfNRbevqnFzh0hE75BcjE=;
        b=gu3qu/OnCE3jExZm7iXTk+D4tNW5u1f3S+X/ZS+Zhd18i5Oz8WuTs5Ea4pzuenU11+
         WNDLwl54qwHOKqoRxCx3xm8SUMVy7eMIN3OIKm6gikCBHrHqfrGwmPRqepF6rgK7YkP2
         tyfS7h+IyeMlvs8/uPOQaj42T5Y8X0sTigtJ9EgTs52b5Bw5Al8KLlaEIL8ICc7CKAnR
         NBAujnSq17MnFby05Zw5ELOiGzcLtmHNW2wNtkrG0y9ol9kdY9l16PwAIN5tcE/agnXS
         Nid8BPW6cgT21RucixhWyO9VIIkGx3XHg+pHU+7ioX3D9xyXkCoC+mq0DHDP5AzW0jBB
         BLuw==
X-Gm-Message-State: AOJu0Yzi1/nBZFbhv5lBt6eXC7L3PBKFiyJdIrdH+B0RWAj35b3AoGcN
	vSzPcBB0748CuWRmofXd5rKb5GBcpBrWafJXkqT4VisTISg5gAfcRzWFoPpDekI=
X-Google-Smtp-Source: AGHT+IGutpguVMvsJCUKZ8ZBCIT0dr4STx4SckknNX3693K2h9fTv8lXTlkdy/hnWpW7ckuoVkWimQ==
X-Received: by 2002:a17:90a:de08:b0:293:95eb:e363 with SMTP id m8-20020a17090ade0800b0029395ebe363mr840055pjv.72.1706372325855;
        Sat, 27 Jan 2024 08:18:45 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:18:45 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 05/25] platform-msi: Prepare for real per device domains
Date: Sat, 27 Jan 2024 21:47:33 +0530
Message-Id: <20240127161753.114685-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081847_436293_835CCACC 
X-CRM114-Status: GOOD (  25.62  )
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

Provide functions to create and remove per device MSI domains which replace
the platform-MSI domains. The new model is that each of the devices which
utilize platform-MSI gets now its private MSI domain which is "customized"
in size and with a device specific function to write the MSI message into
the device.

This is the same functionality as platform-MSI but it avoids all the down
sides of platform MSI, i.e. the extra ID book keeping, the special data
structure in the msi descriptor. Further the domains are only created when
the devices are really in use, so the burden is on the usage and not on the
infrastructure.

Fill in the domain template and provide two functions to init/allocate and
remove a per device MSI domain.

Until all users and parent domain providers are converted, the init/alloc
function invokes the original platform-MSI code when the irqdomain which is
associated to the device does not provide MSI parent functionality yet.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/base/platform-msi.c | 97 +++++++++++++++++++++++++++++++++++++
 include/linux/msi.h         |  4 ++
 2 files changed, 101 insertions(+)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index f37ad34c80ec..dbd19f329354 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -13,6 +13,8 @@
 #include <linux/msi.h>
 #include <linux/slab.h>
 
+/* Begin of removal area. Once everything is converted over. Cleanup the includes too! */
+
 #define DEV_ID_SHIFT	21
 #define MAX_DEV_MSIS	(1 << (32 - DEV_ID_SHIFT))
 
@@ -350,3 +352,98 @@ int platform_msi_device_domain_alloc(struct irq_domain *domain, unsigned int vir
 
 	return msi_domain_populate_irqs(domain->parent, dev, virq, nr_irqs, &data->arg);
 }
+
+/* End of removal area */
+
+/* Real per device domain interfaces */
+
+/*
+ * This indirection can go when platform_device_ims_init_and_alloc_irqs()
+ * is switched to a proper irq_chip::irq_write_msi_msg() callback. Keep it
+ * simple for now.
+ */
+static void platform_msi_write_msi_msg(struct irq_data *d, struct msi_msg *msg)
+{
+	irq_write_msi_msg_t cb = d->chip_data;
+
+	cb(irq_data_get_msi_desc(d), msg);
+}
+
+static void platform_msi_set_desc_byindex(msi_alloc_info_t *arg, struct msi_desc *desc)
+{
+	arg->desc = desc;
+	arg->hwirq = desc->msi_index;
+}
+
+static const struct msi_domain_template platform_msi_template = {
+	.chip = {
+		.name			= "pMSI",
+		.irq_mask		= irq_chip_mask_parent,
+		.irq_unmask		= irq_chip_unmask_parent,
+		.irq_write_msi_msg	= platform_msi_write_msi_msg,
+		/* The rest is filled in by the platform MSI parent */
+	},
+
+	.ops = {
+		.set_desc		= platform_msi_set_desc_byindex,
+	},
+
+	.info = {
+		.bus_token		= DOMAIN_BUS_DEVICE_IMS,
+	},
+};
+
+/**
+ * platform_device_ims_init_and_alloc_irqs - Initialize platform device IMS
+ *					     and allocate interrupts for @dev
+ * @dev:		The device for which to allocate interrupts
+ * @nvec:		The number of interrupts to allocate
+ * @write_msi_msg:	Callback to write an interrupt message for @dev
+ *
+ * Returns:
+ * Zero for success, or an error code in case of failure
+ *
+ * This creates a MSI domain on @dev which has @dev->msi.domain as
+ * parent. The parent domain sets up the new domain. The domain has
+ * a fixed size of @nvec. The domain is managed by devres and will
+ * be removed when the device is removed.
+ *
+ * Note: For migration purposes this falls back to the original platform_msi code
+ *	 up to the point where all platforms have been converted to the MSI
+ *	 parent model.
+ */
+int platform_device_ims_init_and_alloc_irqs(struct device *dev, unsigned int nvec,
+					    irq_write_msi_msg_t write_msi_msg)
+{
+	struct irq_domain *domain = dev->msi.domain;
+
+	if (!domain || !write_msi_msg)
+		return -EINVAL;
+
+	/* Migration support. Will go away once everything is converted */
+	if (!irq_domain_is_msi_parent(domain))
+		return platform_msi_domain_alloc_irqs(dev, nvec, write_msi_msg);
+
+	/*
+	 * @write_msi_msg is stored in the resulting msi_domain_info::data.
+	 * The underlying domain creation mechanism will assign that
+	 * callback to the resulting irq chip.
+	 */
+	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
+					  &platform_msi_template,
+					  nvec, NULL, write_msi_msg))
+		return -ENODEV;
+
+	return msi_domain_alloc_irqs_range(dev, MSI_DEFAULT_DOMAIN, 0, nvec - 1);
+}
+EXPORT_SYMBOL_GPL(platform_device_ims_init_and_alloc_irqs);
+
+/**
+ * platform_device_ims_free_irqs_all - Free all interrupts for @dev
+ * @dev:	The device for which to free interrupts
+ */
+void platform_device_ims_free_irqs_all(struct device *dev)
+{
+	msi_domain_free_irqs_all(dev, MSI_DEFAULT_DOMAIN);
+}
+EXPORT_SYMBOL_GPL(platform_device_ims_free_irqs_all);
diff --git a/include/linux/msi.h b/include/linux/msi.h
index d5d1513ef4d6..9bec9ca19800 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -664,6 +664,10 @@ int platform_msi_device_domain_alloc(struct irq_domain *domain, unsigned int vir
 void platform_msi_device_domain_free(struct irq_domain *domain, unsigned int virq,
 				     unsigned int nvec);
 void *platform_msi_get_host_data(struct irq_domain *domain);
+/* Per device platform MSI */
+int platform_device_ims_init_and_alloc_irqs(struct device *dev, unsigned int nvec,
+					    irq_write_msi_msg_t write_msi_msg);
+void platform_device_ims_free_irqs_all(struct device *dev);
 
 bool msi_device_has_isolated_msi(struct device *dev);
 #else /* CONFIG_GENERIC_MSI_IRQ */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
