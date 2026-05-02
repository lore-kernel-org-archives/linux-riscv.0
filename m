Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AE6CD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyqNfRUPzyGlLGH+d64Xb54Ij0FYkIQjRAsakjFfxdU=; b=f1x/Hr99Lt1LHW
	w2IQyOhIQvJms1i26rG3v+m+/gRg+y7XJ9WTL4AsZwGtIxiHUynV1BjUNQz4BuZJfXIMBcb7Nwoch
	dvdwMp7GJwFybetzya7c8OkDv+NjPSCa2kGil9qBKTKnRZ6Y2QcLMFpCvZ6klxs6g49UlvNjHWtI3
	AwVxh90PnzKYYIAf1MdG+QEYeeyVnMu+3w3RCIQSJE40eGtldPbz/hwvY7HSSm0OIDMOU1Ob2/g/h
	dTlxPhSqgJZ4m0yC0tQ6TQrBE7HpfBQmEF1jlMOvM3qJq7ms6c42fq1hniR7MmquaKH+gYpdnGPPJ
	whZEh4GtsIAfZ8YtNbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7M5-00000008m3M-0rOw;
	Sat, 02 May 2026 10:13:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7M3-00000008m2L-1yLW
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 10:13:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b24fdac394so21212435ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 03:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716826; x=1778321626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmMzz9kPOMJ2V6hEeqZMS4vdi4snOlkMyKNu1sYiAzY=;
        b=CbXtRp3YT07+toZnLW3WcBu/m1awgVQNevabalicPRMNSoq3qpPFxa2cyKpm8aAPZI
         9SUjlT7J+f2R7lSgcUyKLNGg9pBuPrF5jHNw07JoTQ4KR4fSfp7Iavpt2nf2QuJpTSOU
         F0ii3HWKo4fxuWFC8VsaQRUobls6Ss0Sndcbu5S580VVQZDFZAiWPheHeKXhktlaYIpC
         2Jr5qX27janQ6uLzm1n7Fe7sgtwsJDRqC4luF8fLVu5GEmjj+zOviUSFy3Ofp1CJ3edV
         kwALGIXkZtZOuBRrpydO4eTfgwiM7PchooM3Ztl5S46eoZDwq32ushblan7BLhxouWhr
         3xfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716826; x=1778321626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KmMzz9kPOMJ2V6hEeqZMS4vdi4snOlkMyKNu1sYiAzY=;
        b=MH4ZnSxFl4V/EGCH1061W268WZ2AsNdv/4EV+oQ9XZjYIRraeOX1C2sVZj1Ttqbcr5
         blM0NSiAPwjDFq/2omZnqe9WOoM3ZZK32dnbImqfIXlCDp7CR4crQcx70StUdUUDbr1v
         OpA7odL0QgKqREM+y7LeZ9gPjLDBjttHECEaNbcdSVNIIngmeMKawItvna4xiBzAgh7N
         lQNEeu18jMpcfCGtuLoc3uTn8BT4y4/0Bizzmec3AYDeVTtX2TglPzF6XRJYvU5AAquR
         hPmomR89LggjvLyqaPE7yXnWq0NiSxnPMSUvdDXr0mEw0ubFhT8wBA61Y/QwMXBeu5E1
         b2Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/TD4NChrRm0R3ClZmJ3RZLZA8WNADd/oysH2DTnu5dkNSHRl9ZhTH2fUWQYINHF9tQWYpTHV/GnHO9RQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9QcU00+1wB7xDbUaVXKQaYZsEXmN6XMhD3vfUqoq44dEW6/FK
	EOzZqVIckyNP2m+YKfjLMymJn72J3Gohgub/7akaaR0udPWX01gAIAvO
X-Gm-Gg: AeBDieu+jMTMoEyTCYCzywPN39DbbCeY8jo6WAGxVpUQJ02Px3DjAMiDpp9b0H/RJtd
	3LJfjxC+rXz5ujJ0/tRhZZnRAoQfnnhyEe2mQ9G6OA0SKidS2WWjuJpXEcgCnD1ErAT5r/q9ll6
	g+sTDtx09OGh1svOiifxjKw0iKu5Q/uqhCvt5MGrikNQnRvGm0ttL9wmhoLiJ88ko9Dx5dw/65H
	ryQ4MhyzSIUNJ3LlmBNCx7d8JUA4echO4oPL4jCZ6+kKrR8FOhJZhkN6g8T6rIytRE8B2p5oq4C
	O1rQGw5xh2bLjG1nMCmZSopFOxB2rSjdDuT48NGJ+PDTP/DVS2qgDjVygs13m1K0ZY12izakT/v
	Um8ZUnDTf7DgQJSdwrJI5/qatrE8n/DjvTSmhdFcDo2PZPZmaG57uxMt9lsCJvDgxBZPq6fRDAN
	aEWH+yzF3HxDI0RFprho6w0PldmvUOvgU5jA==
X-Received: by 2002:a17:903:3d4c:b0:2b7:ade8:2407 with SMTP id d9443c01a7336-2b9f25e8353mr15599855ad.19.1777716826438;
        Sat, 02 May 2026 03:13:46 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadb1esm48776715ad.20.2026.05.02.03.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:46 -0700 (PDT)
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
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/5] PCI: spacemit-k1: Add multiple phy handles support
Date: Sat,  2 May 2026 18:13:15 +0800
Message-ID: <20260502101319.2364052-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502101319.2364052-1-inochiama@gmail.com>
References: <20260502101319.2364052-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_031347_513155_EBC8CC47 
X-CRM114-Status: GOOD (  16.40  )
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

The PCIe controller on Spacemit K3 may use multiple phys at the
same time. The feature is not support by the current driver.
So extend the phy definition to support multiple phy handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index cd3cd038ad2b..f2a722e5edb5 100644
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
@@ -172,7 +173,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
+	ret = phy_init(k1->phy[0]);
 	if (ret) {
 		k1_pcie_disable_resources(k1);
 
@@ -192,12 +193,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
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
@@ -278,7 +281,12 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	k1->phy = phy;
+	k1->phy = devm_kmalloc_array(dev, sizeof(*k1->phy), 1, GFP_KERNEL);
+	if (IS_ERR(k1->phy))
+		return PTR_ERR(k1->phy);
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
