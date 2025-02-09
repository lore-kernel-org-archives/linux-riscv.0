Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58470C02199
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 04:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlZP8SZYetYktHDMy89E58QpaLzD7a5abBH6Ap8cJUQ=; b=JZJ2fXZqolslFs
	vsOy5r51w5+JPX4UR8hSs3YUMZodT3nf5Ebj+yu2EEbEFiFgSXQ+NTZG8yUWPS4Ah7xr/ayD4emDv
	aiLVUG8sYpI4cg/YNle4Rt3WxP5wR+A5HJa0/VOF4gyFozFy80IZoTEn9XTo5KO0YSV3hFk9r8/cZ
	BLq+Ozwrk+wJfvOxX6VdmiibdixzMegx7iqaGdIGsmSnfbQf6MP1PM7vKV4sPQLhc95ChSQvch1cB
	OTj1IC6MpUjC21LRxp5qa+wybwqpQIBl+5GgYV285XO28BatH+evr1rr1mXUTzgLx651Pc3EWG/jy
	JuVLNqdgugcNiuUIEv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyp2-0000000E3Fh-2l5c;
	Sun, 09 Feb 2025 04:21:32 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyl9-0000000E2K5-2rOk
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 04:17:32 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2fa44590eebso1822228a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 08 Feb 2025 20:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074651; x=1739679451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=;
        b=OC6WOEOI6P393eaTXBXRGTPIDJ49XDZsrAlE43coLCU+uCTk7LhUpBGpoe1QJ653nO
         0JdgH/z0q8Ei64fhhj4RnC257Q7j7SuTbAW+otzjnZOTI01nuShezbOqszx44YdMF2WD
         XyY8kjSBLj9e1O16fIFiJ2pVfxc5eUwyzvzgZBAtBlFCQq6Mbp3UCAn/giUKG4RnwbeF
         778rChqeGXmtfTBmP5VS3f3kYDv+SruGjLlnRdSHcJdNRCQcEbOZ5fUcCLcjuPI9h3YK
         mCMMGD2l69UNoW6b2F9aIrWk6FGw6/EXTlYj9JEvI+4Cai4AzcymOOLx/3j3B3y/B0I8
         gP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074651; x=1739679451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=;
        b=aDXiAmmKudz7QaLg0nVz0NVBZDssFx8u3KeuxuOOTsvi7xGiXMlo5O14nQonFx0wqm
         zJt6xDrUsBZ1+tZsW/9zCvv0b5H7DbKUT9daKlDc/olqp/9N/Mgz+3tFDPRP9ZJLqz0E
         8w4MG0hmOXORagos0ySq/ffYtFm95E0wICQF4ZjBu4IRLZHCcAezdknYALf7XOBing9d
         G8F2+z2FEBKbvzUn/Yclm86vWyujRZPbaJrewB4OqFTojHPtd1SvpastNohKYV5KtZWy
         7lWkjpC7F4YsNk5C+vhXxSZQH1raH7hN4+dxPiDOhmBhVbZNRWWCu5cpPq/5mkcfTYLX
         +juQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8wNGoCF6UmfAYGUcUCT/ob3swiArw6S5mTN0qxPAxYN9lQPGUGU8G4sXsxrrr25pAEXEz0pUWCQHomQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4GwZqKTwgr/+PR+oS7/pbA5NHqxP5afoQQk+UbT4t82h4gLbU
	bv7fSHCyaxBYZfJtakUSRXma0Msun327HQxKkkj95rjnNikRItige5/Ik+ZOB8k=
X-Gm-Gg: ASbGnctG4zWWgcJjGO4AymhiEnwppjiVQYiQbX6ANaS+grrq+Liah2ENIIwspZDAQCH
	xqM6bg+/QGeVrZhC4zePTpUIKfdbHovn7zVjog6mKUe2b94ZRJozQ6PiiSq3W5mJy926QW6+Olk
	OUI/stv0HCe+wxbG9jeVMoElPVXgzW+U7chD/8OqwPHBA6YYhu8B5tESpOR2QDhijMJpoHjKCWX
	1Z9BiAyqdhn2oLGAqNbaTmyNlwuASR6dn8QWVFUkd8Iiu55qJdTZQ11Epnn6k4sBEFQGO9zPahr
	w5i3CQHrkAfvZPShxVdCO7RHQJ8m8u2OjSlnZwvZlYT9CcttnnZsHs0=
X-Google-Smtp-Source: AGHT+IG1pX64iVcHBvRjhghD+pT2OaoFkAmw6b8bnet5SDDEvBV2yIiEcMLZqESX2yxzwT//jElybA==
X-Received: by 2002:a05:6a00:cd1:b0:725:e444:2505 with SMTP id d2e1a72fcca58-7305d431970mr12792467b3a.4.1739074650717;
        Sat, 08 Feb 2025 20:17:30 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:30 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v5 02/11] irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
Date: Sun,  9 Feb 2025 09:46:46 +0530
Message-ID: <20250209041655.331470-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201731_712120_75DAE0AF 
X-CRM114-Status: GOOD (  16.83  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, Atish Patra <atishp@atishpatra.org>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, hpa@zytor.com, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

Introduce chip_flags in struct msi_parent_ops. This allows
msi_lib_init_dev_msi_info() set default irq_eoi/irq_ack
callbacks only when the corresponding flags are set in
the chip_flags.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-gic-v2m.c    |  1 +
 drivers/irqchip/irq-imx-mu-msi.c |  1 +
 drivers/irqchip/irq-msi-lib.c    | 11 ++++++-----
 drivers/irqchip/irq-mvebu-gicp.c |  1 +
 drivers/irqchip/irq-mvebu-odmi.c |  1 +
 drivers/irqchip/irq-mvebu-sei.c  |  1 +
 include/linux/msi.h              | 11 +++++++++++
 7 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index be35c5349986..1e3476c335ca 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -255,6 +255,7 @@ static void __init gicv2m_teardown(void)
 static struct msi_parent_ops gicv2m_msi_parent_ops = {
 	.supported_flags	= GICV2M_MSI_FLAGS_SUPPORTED,
 	.required_flags		= GICV2M_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
 	.prefix			= "GICv2m-",
diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index 4342a21de1eb..69aacdfc8bef 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -214,6 +214,7 @@ static void imx_mu_msi_irq_handler(struct irq_desc *desc)
 static const struct msi_parent_ops imx_mu_msi_parent_ops = {
 	.supported_flags	= IMX_MU_MSI_FLAGS_SUPPORTED,
 	.required_flags		= IMX_MU_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token       = DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "MU-MSI-",
diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index d8e29fc0d406..51464c6257f3 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -28,6 +28,7 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 			       struct msi_domain_info *info)
 {
 	const struct msi_parent_ops *pops = real_parent->msi_parent_ops;
+	struct irq_chip *chip = info->chip;
 	u32 required_flags;
 
 	/* Parent ops available? */
@@ -92,10 +93,10 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	info->flags			|= required_flags;
 
 	/* Chip updates for all child bus types */
-	if (!info->chip->irq_eoi)
-		info->chip->irq_eoi	= irq_chip_eoi_parent;
-	if (!info->chip->irq_ack)
-		info->chip->irq_ack	= irq_chip_ack_parent;
+	if (!chip->irq_eoi && (pops->chip_flags & MSI_CHIP_FLAG_SET_EOI))
+		chip->irq_eoi = irq_chip_eoi_parent;
+	if (!chip->irq_ack && (pops->chip_flags & MSI_CHIP_FLAG_SET_ACK))
+		chip->irq_ack = irq_chip_ack_parent;
 
 	/*
 	 * The device MSI domain can never have a set affinity callback. It
@@ -105,7 +106,7 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	 * device MSI domain aside of mask/unmask which is provided e.g. by
 	 * PCI/MSI device domains.
 	 */
-	info->chip->irq_set_affinity	= msi_domain_set_affinity;
+	chip->irq_set_affinity = msi_domain_set_affinity;
 	return true;
 }
 EXPORT_SYMBOL_GPL(msi_lib_init_dev_msi_info);
diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index 2b6183919ea4..d67f93f6d750 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -161,6 +161,7 @@ static const struct irq_domain_ops gicp_domain_ops = {
 static const struct msi_parent_ops gicp_msi_parent_ops = {
 	.supported_flags	= GICP_MSI_FLAGS_SUPPORTED,
 	.required_flags		= GICP_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token       = DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "GICP-",
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odmi.c
index ff19bfd258dc..28f7e81df94f 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -157,6 +157,7 @@ static const struct irq_domain_ops odmi_domain_ops = {
 static const struct msi_parent_ops odmi_msi_parent_ops = {
 	.supported_flags	= ODMI_MSI_FLAGS_SUPPORTED,
 	.required_flags		= ODMI_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "ODMI-",
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index 065166ab5dbc..ebd4a9014e8d 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -356,6 +356,7 @@ static void mvebu_sei_reset(struct mvebu_sei *sei)
 static const struct msi_parent_ops sei_msi_parent_ops = {
 	.supported_flags	= SEI_MSI_FLAGS_SUPPORTED,
 	.required_flags		= SEI_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.bus_select_token	= DOMAIN_BUS_GENERIC_MSI,
 	.prefix			= "SEI-",
diff --git a/include/linux/msi.h b/include/linux/msi.h
index b10093c4d00e..9abef442c146 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -558,11 +558,21 @@ enum {
 	MSI_FLAG_NO_AFFINITY		= (1 << 21),
 };
 
+/*
+ * Flags for msi_parent_ops::chip_flags
+ */
+enum {
+	MSI_CHIP_FLAG_SET_EOI		= (1 << 0),
+	MSI_CHIP_FLAG_SET_ACK		= (1 << 1),
+};
+
 /**
  * struct msi_parent_ops - MSI parent domain callbacks and configuration info
  *
  * @supported_flags:	Required: The supported MSI flags of the parent domain
  * @required_flags:	Optional: The required MSI flags of the parent MSI domain
+ * @chip_flags:		Optional: Select MSI chip callbacks to update with defaults
+ *			in msi_lib_init_dev_msi_info().
  * @bus_select_token:	Optional: The bus token of the real parent domain for
  *			irq_domain::select()
  * @bus_select_mask:	Optional: A mask of supported BUS_DOMAINs for
@@ -575,6 +585,7 @@ enum {
 struct msi_parent_ops {
 	u32		supported_flags;
 	u32		required_flags;
+	u32		chip_flags;
 	u32		bus_select_token;
 	u32		bus_select_mask;
 	const char	*prefix;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
