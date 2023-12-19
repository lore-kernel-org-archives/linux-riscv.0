Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51D3C41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2U6kJh+mchaJtWuUtalOasSRU8k5Vg0sGvBqLGWTKQ=; b=z6XIG55P+lxUJO
	kxFQ0gO+Nid+8DvzoO554YBR0iYidhHkccc3rsuncBJhByVQv38rs8/0dR59Vpz1a0hyGEx/qUrHR
	hC/3swEwlx1r5cMlN9/zVcBHx2hSNbK7aX1dYjAg+Pv7FSWLJ+0MQAeH0Pi1Qb7gAN+Q2QwKSJvjZ
	KzcF0sBiEfMXCNe5HwKvm/dZVPBkjfMzvptfAv5PjXdc6RjnzEQXtEd830yrpfYM+wNEcea872s03
	5v48XGqK7nVl9P2b3WF8n9q/Ofz0hqLtWrLuoMRzY14d5S9x2wULxklzzpGFVlKqxsxHuxAabvM+j
	8wy39BUZORbk/GbqRyUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAR-00F0jT-1J;
	Tue, 19 Dec 2023 17:46:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAN-00F0gn-0G
	for linux-riscv@bombadil.infradead.org;
	Tue, 19 Dec 2023 17:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EebfT5RsMliPiqXCl62hkrmh6d2gQOm2GsmEL35aFBc=; b=D2PmLkvGwbnBRAQPAYjESnDA8m
	KOV/r6Vo0LuVIZh7Ne5GjBUqmAF8SqlIEoAOIt36Isy9JfusTl9fSFFtL8AQPXpujgG7O0+4vCpd+
	r8oaQbbVtt1MTHEdEeCb+uR0aoPxYERBH8xoOlZXAnS3z1nJsZ8ELprI5OyRLmmFmbDfwfC7g4UhM
	sLP7hb7JEx9dDrAD+pjuuR0Mc3Sy29Je/30vxBDC5HNpXDAdI2XapbiBVje1WiOBkLtAymMS/2rgA
	yP3YqpLPJsdQVo7+nBovIXw3hdqy+Bz+SyWrPeEpj1CUlqvaB1u49L4r9wbD2lKI7yetA9v9OdZIW
	44efKzqw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAJ-00DXx6-2x
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:46:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d3b547cd4cso13559995ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703007958; x=1703612758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EebfT5RsMliPiqXCl62hkrmh6d2gQOm2GsmEL35aFBc=;
        b=LucRnn4AP8hZLYQDdPgslNrAe/m6I2CshNJYbNeCd69sEa0eAox/hfbw2xsQosI8Sm
         uxp8Jnlgn7GCddKR+Mht69mBcerqvAUuWsck9xKrgj/R8GxC4GPJ4/Z4CbDrNcy287ue
         6Oy9MW8LHeYrUhn3HIY3wiJ8o2SVfj5BOCZ/jHgzk7tPt35Y2QQ70wxTzyTAFveyE60y
         E+go27vAdV2jXfeITBHc7yGdaGxsqUe3RiAtC3qX8VsQ7Hn+KEi4wXuw/PXeEqMvcx6l
         FISlzn0bXmuPCzohQkfCMKu0WZUXHP8H9GoVsXf9umxRTiv09KUUP0gGgSQuJ4hFi5HN
         +sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007958; x=1703612758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EebfT5RsMliPiqXCl62hkrmh6d2gQOm2GsmEL35aFBc=;
        b=oXnDcIEvX6vA+z3l6lPlGzVSqq+gQZR8xGkPYMMjLYlzHAMV84ru8vHIxuz1pbkr/w
         0Rt59ASdAku2+DJkMkOUJQ1KTQ3kFNo3GvQcFYTtb4ZNaCjJYEN8loIIsx9vgi//0S0M
         wF1FW107lujNHfDqQ7+E34VwvsUMng05fsLkwo0DqtEGaE8zWhmyBp3WEQHyzie3aFht
         mB8Wv3g+f3OanFtJChbVjV5oGWYHUXSSSYc6kgZ/N6ygIZ+KV0smdD2UhcoWMOpedR7s
         yqcQg//kKRRNexm4OF5QDkPTHWJ6Y5BEGWx+Ozgkl/LjPQ5BBZ5db/P9br54TpYEpaPq
         jXyQ==
X-Gm-Message-State: AOJu0Yy+pizeQbM9pfXY4Q0HWoGdiYrpTb6JKYg+3CQ2kA8bxXem/2Si
	KX8pm5dh+MVgDzUrFxJI8L7m1A==
X-Google-Smtp-Source: AGHT+IFzyQR9Vgnsqa5WmyfTr/Nm6o19oAodCnDVZm95vLyPUVPinYImx8yjTiAOib7HfgdqSjZW3g==
X-Received: by 2002:a17:902:7c8c:b0:1d2:ec9b:92e with SMTP id y12-20020a1709027c8c00b001d2ec9b092emr9877603pll.115.1703007957846;
        Tue, 19 Dec 2023 09:45:57 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:45:57 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 04/17] ACPI: Add fw_devlink support for ACPI fwnode for IRQ dependency
Date: Tue, 19 Dec 2023 23:15:13 +0530
Message-Id: <20231219174526.2235150-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_174600_002109_E7C1EC28 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently ACPI doesn't support fw_devlink infrastructure which helps in
ordering the driver probe in the order of dependencies. One of the
dependency between devices in ACPI is GSI interrupt source. This
interrupt source can be another device and mentioned as part of
ResourceSource in the ASL. Or it can be indirectly determined by the GSI
mapping. In either way, adding the link for this dependency avoids
modifying all drivers to handle EPROBE_DEFER. So, add this new interface
into ACPI's fwnode handlers.

Currently, this is necessary for RISC-V architecture. So, kept the
interface functional only for RISC-V. But in future other architectures
also can enable this functionality or can be made common.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/irq.c      | 18 ++++++++++++++++++
 drivers/acpi/property.c | 20 ++++++++++++++++++++
 include/linux/acpi.h    |  9 +++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
index 1687483ff319..b3409e2e2041 100644
--- a/drivers/acpi/irq.c
+++ b/drivers/acpi/irq.c
@@ -354,3 +354,21 @@ struct irq_domain *acpi_irq_create_hierarchy(unsigned int flags,
 					   host_data);
 }
 EXPORT_SYMBOL_GPL(acpi_irq_create_hierarchy);
+
+int acpi_get_gsi_parent_fwnode(acpi_handle handle,
+			       unsigned int index,
+			       struct fwnode_handle **parent)
+{
+	struct irq_fwspec fwspec;
+	unsigned long flags;
+	int rc;
+
+	fwspec.fwnode = NULL;
+	rc = acpi_irq_parse_one(handle, index, &fwspec, &flags);
+	if (rc || !fwspec.fwnode)
+		return 0;
+
+	*parent = fwspec.fwnode;
+	return 1;
+}
+EXPORT_SYMBOL_GPL(acpi_get_gsi_parent_fwnode);
diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 413e4fcadcaf..88769acb13d4 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -1572,6 +1572,25 @@ static int acpi_fwnode_irq_get(const struct fwnode_handle *fwnode,
 	return res.start;
 }
 
+static int acpi_fwnode_add_links(struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *parent_fwnode;
+	unsigned int i;
+
+	/* This is needed primarily for RISC-V. Other architectures can
+	 * be enabled or made this generic if required.
+	 */
+	if (!IS_ENABLED(CONFIG_RISCV))
+		return 0;
+
+	for (i = 0;
+		   acpi_get_gsi_parent_fwnode(ACPI_HANDLE_FWNODE(fwnode), i, &parent_fwnode);
+		   i++)
+		fwnode_link_add(fwnode, parent_fwnode);
+
+	return 0;
+}
+
 #define DECLARE_ACPI_FWNODE_OPS(ops) \
 	const struct fwnode_operations ops = {				\
 		.device_is_available = acpi_fwnode_device_is_available, \
@@ -1597,6 +1616,7 @@ static int acpi_fwnode_irq_get(const struct fwnode_handle *fwnode,
 		.graph_get_port_parent = acpi_fwnode_get_parent,	\
 		.graph_parse_endpoint = acpi_fwnode_graph_parse_endpoint, \
 		.irq_get = acpi_fwnode_irq_get,				\
+		.add_links = acpi_fwnode_add_links,			\
 	};								\
 	EXPORT_SYMBOL_GPL(ops)
 
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index afd94c9b8b8a..e9a9659314f2 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1463,12 +1463,21 @@ static inline int acpi_parse_spcr(bool enable_earlycon, bool enable_console)
 
 #if IS_ENABLED(CONFIG_ACPI_GENERIC_GSI)
 int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res);
+int acpi_get_gsi_parent_fwnode(acpi_handle handle, unsigned int index,
+			       struct fwnode_handle **parent);
 #else
 static inline
 int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res)
 {
 	return -EINVAL;
 }
+
+static inline
+int acpi_get_gsi_parent_fwnode(acpi_handle handle, unsigned int index,
+			       struct fwnode_handle **parent)
+{
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_ACPI_LPIT
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
