Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D49C47DA9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OscWQ4jBXC/b3jDskSJUW7BdOLsd2drvBmBDnSOPO4A=; b=OOF+M+7+SgrnSR
	5T4a6JyzL1VQHhCysl1DMsWVFGhYmxMPBsTZrChLtl6aSB1le8jbKnKTcClW6PANPuDlseDTmbyuN
	ynY6/vgdt3n9p2Sd4q+V+vznWkSAJewdZUs9gUYGYk0OYA4ceP2y9qglh9THx3JbGHtFt0xwhbZ1K
	abn6PK4rxhdqhK16cG7KsLwpIUlNhYYgsz+NyeaCnGf6IZOXxdB8AqiS62ccRd6EU/n4G5P77DxRf
	mHH4fgdkPbi4QRmBpO6GR/B4FbZWDhFJGh0q6fT/kCub+hQ2A94IvKNl0QQ3BXSW0qKI7H+d9FKAM
	f8M7QDTfxYfLr3IMkz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlPx-00000007lSD-2fGR;
	Sat, 27 Jan 2024 16:20:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOm-00000007kYB-1VT8
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:19:26 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2901ac9ba23so742355a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372355; x=1706977155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSirNz5MKgvKyg3PpEGC1NXiMt4KceVCwKab+ZPE5BY=;
        b=WXK+Y7cwAydxJlqQaL0+cONLMNJw2ugD8yqTqbMx9AM2fgAi5h0B1Tth14dwrhWxJQ
         ls4fUengnl4ONzZNG2cp0ZltDd4MGsiIxNGEkZwB2awD+B3V09uqwkrrvTa9TfDKy54+
         UVVFfqNzeSCGgtUAmKM+5/TP4FTg3bGOa9pT609Y7mqCuz9xX0afa5AejQYP/HVwn3fH
         ODoADmcBy1n7Zvttvd23wUG8F4/umhRgKNIFhy+/OadxsA4OM8IzWVsVtJs4N7/g+Tah
         3xhapoM0X+h2dRpl8xMLqNVoD5oFBEqC2329k3WJe0CaSuZmFF85lDRqecvcO8m6Oihf
         kdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372355; x=1706977155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSirNz5MKgvKyg3PpEGC1NXiMt4KceVCwKab+ZPE5BY=;
        b=Q0juciGo5sWatlUpJPvbDKo8Tsb+RQxN/+5zFdoXZTcUCAz1F1Kn3ev8GmP9MJWxaX
         y8UDgsmTvhTTEK7nil+opfu2fr5jpQBhhzHEEuPqqZIvy2tu8oz5EBCr0iRL3hvv2Kq+
         OucACgScWsG+aFdAXlZPQL7j0YK+XXSykrB60w9eBgmv2oBRKJ+9e8by+2nxHJ1IeuZL
         cEgRk9ybcxy5nDD2u8hjLFqMYuxlX4WOFO85Hlqqwy1pM5nC2UzzgnimPzV3zuPyk7+G
         jCeK/HvUO0ohr3+GQMmn6ZJC7ah6ahf9jL7Q6Zti5ZkTUuqicAw+62m18Tbziri/nRfj
         T+aQ==
X-Gm-Message-State: AOJu0YwDTlE7bKApgg0GBkk9ZAKATkEHK43NO9m1WFaAcUq7qoz4OhKF
	Lqon5DitK+AgYUncCHSIL6+qOqO+zlDzzmALXECygRWr6X/YJ3soVPgdbuaIsOk=
X-Google-Smtp-Source: AGHT+IFTrsCPRXaYv+1mbbajZ/Ou+1apKh4pOIdfDL0/cy8BDEWqpmkz8q2egq9ITcbz+h7wTfrrQA==
X-Received: by 2002:a17:90a:a606:b0:28c:fec9:f205 with SMTP id c6-20020a17090aa60600b0028cfec9f205mr844337pjq.29.1706372355334;
        Sat, 27 Jan 2024 08:19:15 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:19:14 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 10/25] genirq/msi: Optionally use dev->fwnode for device domain
Date: Sat, 27 Jan 2024 21:47:38 +0530
Message-Id: <20240127161753.114685-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081916_880911_180EA34F 
X-CRM114-Status: GOOD (  18.12  )
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

To support wire to MSI domains via the MSI infrastructure it is required to
use the firmware node of the device which implements this for creating the
MSI domain. Otherwise the existing firmware match mechanisms to find the
correct irqdomain for a wired interrupt which is connected to a wire to MSI
bridge would fail.

This cannot be used for the general case because not all devices provide
firmware nodes and all regular per device MSI domains are directly
associated to the device and have not be searched for.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/msi.h |  2 ++
 kernel/irq/msi.c    | 20 ++++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index fd184309a429..ac73f678da7d 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -552,6 +552,8 @@ enum {
 	MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS	= (1 << 5),
 	/* Free MSI descriptors */
 	MSI_FLAG_FREE_MSI_DESCS		= (1 << 6),
+	/* Use dev->fwnode for MSI device domain creation */
+	MSI_FLAG_USE_DEV_FWNODE		= (1 << 7),
 
 	/* Mask for the generic functionality */
 	MSI_GENERIC_FLAGS_MASK		= GENMASK(15, 0),
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 8d463901c864..5289fc2c7630 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -960,9 +960,9 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 				  void *chip_data)
 {
 	struct irq_domain *domain, *parent = dev->msi.domain;
-	const struct msi_parent_ops *pops;
+	struct fwnode_handle *fwnode, *fwnalloced = NULL;
 	struct msi_domain_template *bundle;
-	struct fwnode_handle *fwnode;
+	const struct msi_parent_ops *pops;
 
 	if (!irq_domain_is_msi_parent(parent))
 		return false;
@@ -985,7 +985,19 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 		 pops->prefix ? : "", bundle->chip.name, dev_name(dev));
 	bundle->chip.name = bundle->name;
 
-	fwnode = irq_domain_alloc_named_fwnode(bundle->name);
+	/*
+	 * Using the device firmware node is required for wire to MSI
+	 * device domains so that the existing firmware results in a domain
+	 * match.
+	 * All other device domains like PCI/MSI use the named firmware
+	 * node as they are not guaranteed to have a fwnode. They are never
+	 * looked up and always handled in the context of the device.
+	 */
+	if (bundle->info.flags & MSI_FLAG_USE_DEV_FWNODE)
+		fwnode = dev->fwnode;
+	else
+		fwnode = fwnalloced = irq_domain_alloc_named_fwnode(bundle->name);
+
 	if (!fwnode)
 		goto free_bundle;
 
@@ -1012,7 +1024,7 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 fail:
 	msi_unlock_descs(dev);
 free_fwnode:
-	irq_domain_free_fwnode(fwnode);
+	irq_domain_free_fwnode(fwnalloced);
 free_bundle:
 	kfree(bundle);
 	return false;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
