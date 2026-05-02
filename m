Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D57CD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xf9dyAzH6T54VkofE77obFkpQWlGHafU46fsPe6Nm8=; b=Ip0iBkFJ5ZNgWC
	Q4sRsKmRxEz1GUtzvmYefbrGzIGCidPlS3/W0ogyVf7EPTJQi9QEkzdP+FXoiuhwBl/XM6VbOA8I2
	2/RVZl5cx8FYLJloMf2wOFOjGkihG5uZU6aFzJNq9Qinu8u2LvJGZGWJmouldWT7FY9mrOGJo/6KM
	g5b7GgfLfeJEHuL4LsUdiz+WF3kKG0XrdhEt4sqgK6qQlOYWxo0/o1JOo8pRA8PyC5f/E56+GpdPw
	9gibjVT6TbpewnNdL2w3gtouip2TZ1zDxtgtR57QNPuGXVJIyHofhLa9xSR+vk70GvQ/IwYToHxl1
	/ppcr2tFGZNBfqoqY8Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7M2-00000008m2N-3rCe;
	Sat, 02 May 2026 10:13:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7M1-00000008m1h-06eJ
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 10:13:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b788a98557so22600265ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 03:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716824; x=1778321624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcMticRbbnlhc13eC+umkLKNNwt7Hul0SNRld9/CX3o=;
        b=q0l2nN5scgrbtWLyXo9D7fX19hn/9Oy7T/rO4hcjIKTAS/mxDFZkotNoMTaqHpTg6v
         MSgJiJW+Cfev75ptKdigSKUSx9Z8hmQVAOr6Kg3LN12Z96GdsN/oTOJxu/d26HKKNeC/
         CaY/tNC8p2D/e8yf1PAUY6MHiOUsn91cknRoO37HVnZ90IMAJpiYTaWAM3Avup48DaJh
         1zCPF5l4fWW0srz19hvh2B7hSQcH1m66FeZScsOHLkFH96wAeCI9cN1oy+eHnXrBnHlz
         TZY0K3iMhcBDFO60XCmSpvRiVzUXRtxceF+P9VfZG3dcxjEmowdHaapuW4ATeSJh7nEM
         V0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716824; x=1778321624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WcMticRbbnlhc13eC+umkLKNNwt7Hul0SNRld9/CX3o=;
        b=aGiv81NkgauNw8QXqAzFpVzuxoZ1WwTnORX44j9THlyNb12zvwnFVLmsVnZwgLcP3l
         +ObmidAkZVjfDq+MN2yXyR84ILaqgf+jto4M36LkJ9EB3eCZ2t+n+dDQQveL98RMsmIh
         y/omXhB1wXDjeCLNyHVwV+lqnQs8OSi732BB5cxsu1D9iNmvdK04TubudTnHEDs984Ua
         ZtIcRLcv2NhabiaYRR8g1wVHUoUD9Kr1byosaJcofruxYe3BKI7YesejqsiighJOUxbv
         xkDZrDTb9c80GUVFTcF9URah97qWPr2jCrOaGEmB1nqW5PhNbQqntmLpS6K/joP3suui
         wRTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yUTLaaOMIGhSV3zL//7L4QIx8L0YTxhR1FxvCoKwaDux+V1oAXNgx9miIkzqcxPAVnbQTCBPajiUmSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRSDhDb+ES19G18J31uSGVu5qPT6KvtOEi5XGRecQon7dd0/Td
	6zan73AenQpa3x/QByJhC1Cxe47oIefzDN4s7I9kdnKxeW3li90m6i3l
X-Gm-Gg: AeBDieu0ckIzjs2DDYUz/llCd2mCFH+ZP5yNsBRz4KD3gTEoD8EBhkEwHwG03ha1Yig
	xEfS6pfHsyUzKr2toXFepOcUycvW4vzlQMMo8ZZQFJml19L0rB4ZSyqiZbYvfzmVJfOw/VReVMM
	hO3nNjCswLonYuki0Fsd7AlgdflcAMY7Yjf8FxLNUvbLZOHEt6ITx15JSzwjetDBbb7YQUMr4vT
	iQ8JHCNj5seHmwiG4lwsDK3ci9YMQuZjhFZGvjqco1Gkyxcc2EiVbi0BnKu0Sks62cyBaYoNXKr
	sKTXjHr+bmVvylkzTWmeseexYJaaDWM2zPYiYD6k8Lj1CTpQvKWQrctleB9CzT8TnpyEy99/QjI
	YTRx39wUJI5eANGuPq/ANz+C0Gh998hQdH6rBt1oLGR13v80ICaoiuK/JeEk7iTd2C7hlEFVpiU
	Hg/lsDY22rmdXvjZ82ItvfJQFYTISA3JYJEg==
X-Received: by 2002:a17:903:2ecc:b0:2b2:4dd2:dcf5 with SMTP id d9443c01a7336-2b9f260b757mr24434785ad.20.1777716824197;
        Sat, 02 May 2026 03:13:44 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae68476sm45629345ad.80.2026.05.02.03.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:43 -0700 (PDT)
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
Subject: [PATCH 1/5] PCI: spacemit-k1: Add device data support
Date: Sat,  2 May 2026 18:13:14 +0800
Message-ID: <20260502101319.2364052-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502101319.2364052-1-inochiama@gmail.com>
References: <20260502101319.2364052-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_031345_068973_F169CF27 
X-CRM114-Status: GOOD (  16.35  )
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

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 35 ++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index be20a520255b..cd3cd038ad2b 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -57,6 +57,13 @@ struct k1_pcie {
 	u32 pmu_off;
 };
 
+struct k1_pcie_device_data {
+	const struct dw_pcie_host_ops *host_ops;
+	const struct dw_pcie_ops *ops;
+	int (*parse_port)(struct k1_pcie *k1);
+	int (*post_init)(struct k1_pcie *k1);
+};
+
 #define to_k1_pcie(dw_pcie) \
 		platform_get_drvdata(to_platform_device((dw_pcie)->dev))
 
@@ -278,10 +285,15 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
 static int k1_pcie_probe(struct platform_device *pdev)
 {
+	const struct k1_pcie_device_data *data;
 	struct device *dev = &pdev->dev;
 	struct k1_pcie *k1;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
 	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
 	if (!k1)
 		return -ENOMEM;
@@ -299,11 +311,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
 				     "failed to map \"link\" registers\n");
 
 	k1->pci.dev = dev;
-	k1->pci.ops = &k1_pcie_ops;
+	k1->pci.ops = data->ops;
 	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
 	dw_pcie_cap_set(&k1->pci, REQ_RES);
 
-	k1->pci.pp.ops = &k1_pcie_host_ops;
+	k1->pci.pp.ops = data->host_ops;
 
 	/* Hold the PHY in reset until we start the link */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
@@ -320,7 +332,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -328,6 +340,15 @@ static int k1_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to initialize host\n");
 
+	if (data->post_init) {
+		ret = data->post_init(k1);
+		if (ret) {
+			dw_pcie_host_deinit(&k1->pci.pp);
+			return dev_err_probe(dev, ret,
+					     "Failed to post init\n");
+		}
+	}
+
 	return 0;
 }
 
@@ -338,8 +359,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
 	dw_pcie_host_deinit(&k1->pci.pp);
 }
 
+static const struct k1_pcie_device_data k1_pcie_device_data = {
+	.host_ops	= &k1_pcie_host_ops,
+	.ops		= &k1_pcie_ops,
+	.parse_port	= k1_pcie_parse_port,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
-	{ .compatible = "spacemit,k1-pcie", },
+	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
 	{ }
 };
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
