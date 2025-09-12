Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB421CAC58E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 02:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YodvcwUp8OjhGGecQ19966Vin1lYrEOUhbO70/rZoZw=; b=raJq2dgJC/khKm
	J8IJYucdYnnG0GNTHzBVDzZdOaI+7DXNm6p/GLlN9FSiyR1870Io0GMnTqJBl4LlNl+EMJYnwjMg8
	OQoboxZovGpmWyazm5YkPGXROXnnHWAqcmD5WQJfwZwJbdOInRyea4VxX7Gd8YshANKpFIYKxMcIH
	m9rHk0wQmhBGbqdBdCtcPTkmy3m8hBevligTtyL43BR69mvHCQZHhMuSz5ybtVW3rWPFK1Fl/Lhnx
	dGA+2FQU0WS2Gn7ZfFWrHbsc0BI1ruIr9oRloB3yizsSstNimIGV95ynU9OwmfLfSGVERqpLhZYls
	+6MCrAEWhL9EIB4tf8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwte2-00000006XYa-3kwG;
	Fri, 12 Sep 2025 02:36:14 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwte0-00000006XXe-2yNp
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 02:36:13 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-74382048b8cso1183202a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 19:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644572; x=1758249372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufI02VTMyX7sTfBD7Jn/jEH2YUmO7DVAO0QyMj+WG88=;
        b=JtNQ5dW/wpPa8Bn2S0986SIet/V5yB4x1OMH3ax7l51Dr861I32b43PwO24Dq4iRx3
         MxOoKKZoIzmJF3n3tXWrllpAdrd3+OhN+Z5WNDbsiBs2gfvrpbTL6rjhnYQalyIuvXPT
         NRei4Dag2FSngpIIBpeExeEiiACDKLaewrect0j6YX/B0AdGHYIrKzXALxq/ZYIev+gB
         CgGy0RZiPLjnvWW3+04/ElV6PfoOJmQ7fLh2QHXboqRQImK4KLIduY5ZtlFbX5sQA6ok
         hXc//ZfCAYDSiy3IqOcyD9aD8VMw2vwHDNuD3tZ/Fy+Y+64AYSLaxS7kpGYiohECXi5V
         xDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644572; x=1758249372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufI02VTMyX7sTfBD7Jn/jEH2YUmO7DVAO0QyMj+WG88=;
        b=T+rGhnVawU2rTZ/ecu4cxDaXBOnlv/tlpAR4xqicco0+mC8Elna05WW2RZzf+btwoY
         jX0MfH3W4iiq9w+ZQeeWazJqWL4BxLrgO2TqhBHg34RtmrAvKl+oQfVWE8QT4nK9Of8R
         ftPKKmWd/UoZAYKFaX5FND9MQgpYXdbyEScrEYhV4Ckmm8SUdXCpGCNjOZ1Ee4YyrAeT
         F+ehg1sKL9ASK+Rnc8R8TkzxLXj+KwgsiQSEGmd5Dy/4OyY7Z4QSjIcACz4AADEhfs8y
         4zMAbG7aX7w02prXax6KDaNYzysv/bnth6mPxG1vVNU/onzGdVvf1DqJCeWQEPGbno3d
         E+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUNzJVxvoZvOOKYLBwqFQl+HnHSc8WsQySimqjqxGdQmzGtzYlrKF6KwvxoI1dkvg8Asa5I+vHnRGVcuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVplk17mmiZKoVbsET6U5lmULIP5uTsRAHmfhkiFzAM2zcBuny
	0GBEv+JIPWDDmxoPbd8yFK2ALxETgfm6rCJEBQzjrD5kWp2Mmf3HWMbr
X-Gm-Gg: ASbGncvIgwkIDgQxemg2Qm7gnjQm5ZIGocLlfComAvydtX0tju6L6lPvjwmTOMCGJoB
	lxC3Y+ZdJemaj0Ij9rYL/Qqr/xmXRNTifwckPxDsdclEJsVIiCOQCbixJl7b/waT0wpurUB9nCq
	27+jV35bWMPwvLlE9X6yhcjQwyfTvtUcvxM45RN4/t9/i6AgIHP9kGHzmtFEb+733cx1m6X2uxJ
	aJJaF/+jqSNFQgxAvErJJUga5/W/5abAdjNY6Nj1Ve76m832m6iZSUeZpl8cLi1jZmYgSeeDs6m
	lygRRy/uy6OD1VrKtvEx5W3QAmbTG2AGbcoqyTaUAEv3VFMmbdDzq517u+dhFI7b9+fA8pFddgY
	hamt3bYPtkYmHSiWahcro3s2Chc8bO8QE
X-Google-Smtp-Source: AGHT+IHP2whgLxUbkCPCNG1W78sKOKWUGbVdpP/qwDmDJygd12n8LXTyx57fCwWzBECssKtsoYm6OA==
X-Received: by 2002:a05:6830:d10:b0:745:3cea:c705 with SMTP id 46e09a7af769-75353875ddamr997804a34.14.1757644571861;
        Thu, 11 Sep 2025 19:36:11 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7524986a7cesm752506a34.11.2025.09.11.19.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:36:11 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 2/7] PCI: cadence: Check pcie-ops before using it
Date: Fri, 12 Sep 2025 10:36:01 +0800
Message-Id: <35182ee1d972dfcd093a964e11205efcebbdc044.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_193612_753661_CF614CE8 
X-CRM114-Status: GOOD (  13.05  )
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

From: Chen Wang <unicorn_wang@outlook.com>

ops of struct cdns_pcie may be NULL, direct use
will result in a null pointer error.

Add checking of pcie->ops before using it for new
driver that may not supply pcie->ops.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pci/controller/cadence/pcie-cadence-host.c | 2 +-
 drivers/pci/controller/cadence/pcie-cadence.c      | 4 ++--
 drivers/pci/controller/cadence/pcie-cadence.h      | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 59a4631de79f..fffd63d6665e 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -531,7 +531,7 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_PCI_ADDR1(0), addr1);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(0), desc1);
 
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(12) |
diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
index 70a19573440e..61806bbd8aa3 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.c
+++ b/drivers/pci/controller/cadence/pcie-cadence.c
@@ -92,7 +92,7 @@ void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(r), desc1);
 
 	/* Set the CPU address */
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(nbits) |
@@ -123,7 +123,7 @@ void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
 	}
 
 	/* Set the CPU address */
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(17) |
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 1d81c4bf6c6d..2f07ba661bda 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -468,7 +468,7 @@ static inline u32 cdns_pcie_ep_fn_readl(struct cdns_pcie *pcie, u8 fn, u32 reg)
 
 static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->start_link)
+	if (pcie->ops && pcie->ops->start_link)
 		return pcie->ops->start_link(pcie);
 
 	return 0;
@@ -476,13 +476,13 @@ static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
 
 static inline void cdns_pcie_stop_link(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->stop_link)
+	if (pcie->ops && pcie->ops->stop_link)
 		pcie->ops->stop_link(pcie);
 }
 
 static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->link_up)
+	if (pcie->ops && pcie->ops->link_up)
 		return pcie->ops->link_up(pcie);
 
 	return true;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
