Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2518CD4851
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 01:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2sMiF+UQvRv6TQNL/pdZgynMwmSRYHfUoqW9Z4PDE4=; b=LdPsIbwnqvzWLE
	GBoxkKfJd4g5t02XYeAtEHL8rCP5gamtq8m8hpPrG1+rVCEKwxwT3lhdKIiRkOV/hevIQfRGhDEIG
	PEpB3vnLdg+/QovYQUr1gGIQZ7rBOiyJLpPbcsdq+uIhKmKovPp4NJgTc8Z4LNyg+4ZCOAprZxO8w
	m2bHwsHAwEmWprKzi+txBWHS2LzqPbmy2fq9VeQ37fp6IqGq3440jZ7ZO3FA9lPaXkZmVXV4JJZUo
	u3Mg5IYc+JmWhTLoDksG0GiuP76OogJFpS3MLjofSTDZS0yFTI9ni2G+X6DfjjUW7u4ohnSjcb7Rb
	/FUNN1hyAErzqfXuerWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOQd8-0000000BsEF-31kP;
	Sun, 17 May 2026 01:49:22 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOQd6-0000000BsDQ-42Zx
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 01:49:22 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c7980c060cfso407633a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 18:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982560; x=1779587360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soU3PERBuMP9kXvFqB8tDnXdMIQE2fWpQSLyN/x1tn8=;
        b=h1bSPe2GGFQfMC8zxuErSQL5TAguPagUeB53jqBmH95IzGNCWQhPsKVs0hp3r8GE84
         m+A4ET2tC/hvvQUHs4Bw4U8zJB/pH6Fm/0FPMJENAlj+YPoTbzLw6/21v03UaFLz3Rif
         yu+iXHKuadzzSLMIMzKGPPjBoltwmMEggpywSWgUgGoIHyTSChsJyim+OWTWiSxaEy6k
         2ZmWpviqIM9dVRQfHpxqt8aKY8jLnjj9Iw1p6PRuWpX++4u3YiRtykoNh2vV2YRBJZrB
         AtyVWvNhOVXHiOqxNYJXNsw4kY+4T6TS8bfRq10QAv4cey7+tGiuJnrqXZvmng+15TiY
         3IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982560; x=1779587360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=soU3PERBuMP9kXvFqB8tDnXdMIQE2fWpQSLyN/x1tn8=;
        b=nQpxq7oA46jHpWO+71Ha3zHv8Q/atQmMaiDViNlRioeSvc5wCVdDddYkodE4oAaf73
         NN5GJRb0YxGLqpH1Q9/b4uS8McGY8LyGxBszrVm7qZihGJaho1sS/vIugxmFHEt2mNz9
         Q8RFV6iH8c0qTJKy6gejRYkn/10sBgIYQNeVMcCDw1Pe0rybrxPf9WQx8a3L1N13+pgb
         78Qsi8fVcCKIsmZwfGv/f3jETOMdXLC3Z7bHiZkVvh8/AbWDRDOah/qVzxV4loYlmVK5
         if3ql4H+x6ZTXWsfswwbbzJVbjVPEeKgv8ncmgeu4nb2+fQeegvW3sNz61R7hPXxq/Ao
         DPEg==
X-Forwarded-Encrypted: i=1; AFNElJ9y9oskoRaPmtZvnpBnUwpG/fP+LBc425aEyw5Qv9LehMTaHNDkE5GYLoFufaw9GUUWo1ZqwPi+oDj5bA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU+tEG91Q/B6LmFzWb+7NWD/ufPClZD1lkqmdI0SKf9CKjil56
	R6wThoFjURNqhQmQzrnEdlur9VqVJjCtFshvEip6rwjD4EoXvyYGU6Gd
X-Gm-Gg: Acq92OFM4drMlwdKuKusPorndPQIL+Bq2sbThTcjsj2u3BI2fVowj9JmFfQ+AVCnTbA
	wOQZL7kz8l6nM8Zvdx3+xNahqJPlwK5Xo8orrK5H2mg/uObexlSE+b65Z+vOZsGRE0g87mcdtsD
	dzsiz9A/XjPUp5IUFKvUDEEUYBFD+vp52++7gDXeYY5ZxvrV7rsvUub+PBi9QPn/T0NKvCXdm/n
	UnTLja/OS4lY+F5W/kJxILLIWU/iH9WmfFMiIwHyL2rPEa2snCq2iVQCnx981f7+4Cw1Sgc6tXw
	KrE1DxlZhd0PnVdCrzFDz4Y9Tz7c0p8k1R+nrt3gKF4fq9Z+C25ybWnT8Y/38Gp1eCprcp1ZY7q
	tKDJIUuCvxE4+aVNKjUqi08K2Vna4w3uDaeudaYU1GT+5PFuytUHhvhjHuH643fOZEUmrOnrnjq
	XGd2A0OwZvs6owc294X+H0WV4=
X-Received: by 2002:a05:6a00:a1b:b0:81e:f1c3:89df with SMTP id d2e1a72fcca58-83f33de1258mr9305811b3a.50.1778982559999;
        Sat, 16 May 2026 18:49:19 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778ad1sm10531320b3a.17.2026.05.16.18.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:19 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/5] PCI: spacemit-k1: Add multiple PHY handles support
Date: Sun, 17 May 2026 09:48:37 +0800
Message-ID: <20260517014841.254085-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517014841.254085-1-inochiama@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_184921_002228_83F4F053 
X-CRM114-Status: GOOD (  16.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not support by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 1b519d49dcc0..7f6f1df31cd8 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -51,7 +51,8 @@
 
 struct k1_pcie {
 	struct dw_pcie pci;
-	struct phy *phy;
+	struct phy **phy;
+	int phy_count;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
 	u32 pmu_off;
@@ -171,7 +172,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
+	ret = phy_init(k1->phy[0]);
 	if (ret) {
 		k1_pcie_disable_resources(k1);
 
@@ -191,12 +192,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct k1_pcie *k1 = to_k1_pcie(pci);
+	int i;
 
 	/* Assert fundamental reset (drive PERST# low) */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	for (i = 0; i < k1->phy_count; i++)
+		phy_exit(k1->phy[i]);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -277,7 +280,12 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	k1->phy = phy;
+	k1->phy = devm_kmalloc_array(dev, 1, sizeof(*k1->phy), GFP_KERNEL);
+	if (!k1->phy)
+		return -ENOMEM;
+
+	k1->phy[0] = phy;
+	k1->phy_count = 1;
 
 	return 0;
 }
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
