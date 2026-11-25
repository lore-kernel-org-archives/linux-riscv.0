Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5103606A33D
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 04:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IaFkdbc9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBUILgMQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fiPgBXy5++c7Y6FANLALL55ENZYArViwJlpHrnLYdLc=; b=IaFkdbc9HDs4f+gdI/4z08eHTn
	DdXjtOTAd216aD5bRPVTwK3gPoBDgoRvIizyWDdst5no7A+sa9F42KiYLN+J9lVAQQ6zYW9alf2Fs
	0jaHh86KqizcVBgCnkzbh1O5YE9mZaWtbMU+KYJH0jVwRO/SBQXFYKCUj618TnAEGY1nVoOZ7ah7q
	Apx5m3uiydQBACyUwptEPtCOR0op1SujpfR1d6uHvgO6Ax1F4bg6jtp3/XkwKjwN4niphhfHtwvz4
	Xis22ju0xRB44VHnp2QpySS//HWRbyJq16NlDxEYHGYK3KBGt74eZZu3bat8PS0oZJG9xnOuNOptd
	hm92AP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Pz-00000008N8M-4AiP;
	Wed, 25 Nov 2026 04:15:41 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Pw-00000008N7c-45ti
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 04:15:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2f045b921caso30015585ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 20:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580136; x=1796184936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
        b=CBUILgMQVMPVr9F9mqqpL63hYZQ2HKjovxGINcmwfPrbzvnrxaeXP5gZH/BnKESz05
         QDbSB38L0QtmNet3VwlaDDxB4rQYqYyOVchNnJTVxQBuy00QrSjTmBo1/Fek29I6SeRE
         IwiDFEsKlVZyiWldCkDOX+DLLZDW8HesMII0lJT6BpEOT65wpyfel8sO5DUxx1rkJP69
         OLrYSZB8Qhrwuzq0t6s4l3G9vOrExExl3g2GJnH+vwji3Babiz75ByjGYPvH5tUj+GLQ
         bGZC3q0ShBkU5IbRQxI8OrGAYhUI/6kvbPK/go1RYa8kbET6uVo+3hIf0ocY9dEjSDHd
         58/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580136; x=1796184936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/X9ZyEdnOXOVxwhtJ+XxsYI1vONhPEcHfkavK3jVzU=;
        b=oru+lSjQUkr48mgJLu3wJ3HX8MNkOtIIcIAwzpllTq+E271zKuiTXtzvntAfTGbtlK
         qtga5PXrlk3t+Zqy4BaOp2c8vJX6S/Wzv755Stt2umzwhtIUAMxlefHqwfAUZ2lFJ3e/
         f83RuR7Fon4S/Y6okL8ojX5DKEu77ED9OZwRZYulBpROcOqdcX8xZFk+rzlpXLQqgP6p
         F/s3igrx9OlFK8fdrPB93t/qwEOKPFJPTRZIb2hv8M2e7egEsEz2uGrRtIg29VbmggNn
         sGD8Ty0F+PsjbKzxlkIWVC8OhOObPVnPgl47yCFkMFMSn18Kjq6s7fY3TVsoesO3pNJj
         eZtg==
X-Forwarded-Encrypted: i=1; AL+hErHIZsahUDIRe2ktq7jdF+iGLMhjHr6omZv8vSksZI7hv90Mu4XoRQ3WCyloLmOJC7GhqbOsTPi2o+oUcg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/fGHbmjDwVcHUyYZonpDl+pd/cUKp0723Iuw1NUVN9mPS6qkJj
	7fEVjwJm9Rqh6l0VYhRRtvpHWhVaTU0ruYkHn31jPa0pvj1rZp/4QNmm
X-Gm-Gg: AZFdTZdWY5oGTfqGKbA/65dQaj6J9YLlfFN56n25npDSOUIedAwoe9hwMNPYcSIn6IJ
	eAtvZWLQGlhuaZDgZ4BeitVSHi7APxbOKdbN2TK1TgAigYFl+op7VifN8snJqggnzqnZXyxB+id
	ZKdhXhW2rRRxji2cAc6GcZUBBuA3ST7pstOOUhwrm+u1euJxcvpGHaSsrWot8k3wDxcZFmqb1H8
	xObNgTQqFbOhlWNOCA2w9t336/fMaTxTewrPhHv28LiNSYc0O+c8ftJtsX1C1uqdKGTr0p2YJPF
	4QxtUGrAQNFbO8GOBIN47bdFCXT0vAyyrjnCz8N6jMVolWZNau7hQ08OwNe6c/As5ycCg5QjxZ2
	mDK71QMEVbPIViHAgWleBFC3W80iMe0QCMRjgPXly8MRssyn5UKuYq2RAgfZC98oypM4K1/Oq5w
	afG8JGuFzLJ+lppz/12lHjTLF+lojw23HSBP0Fis+vKQkhLM9njf2/Opsz70xN4TLKlEsJwFulm
	gSeTp3eW/YY4RkS6fy5cvBVpXJ/LUrb1UhcJJLsKuFDHxQUa9vfTwd1H2M9DEYchMPT1AkIbI6f
	DQ5ayPNqGnD3APXw74JJAyxN2SCg
X-Received: by 2002:a17:902:e80b:b0:2eb:1dd7:3aa4 with SMTP id d9443c01a7336-2f03f181759mr177341625ad.34.1795580136016;
        Tue, 24 Nov 2026 20:15:36 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f8aca00sm68640555ad.38.2026.11.24.20.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:35 -0800 (PST)
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
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v8 1/6] PCI: spacemit-k1: Add device data support
Date: Wed, 25 Nov 2026 12:15:15 +0800
Message-ID: <20261125041523.242588-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_201537_026177_628CF557 
X-CRM114-Status: GOOD (  16.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 92a71ea90ac3..658ad2fa87b2 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -48,8 +48,17 @@
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
 
+struct k1_pcie;
+
+struct k1_pcie_device_data {
+	const struct dw_pcie_host_ops *host_ops;
+	const struct dw_pcie_ops *ops;
+	int (*parse_port)(struct k1_pcie *k1);
+};
+
 struct k1_pcie {
 	struct dw_pcie pci;
+	const struct k1_pcie_device_data *data;
 	struct phy *phy;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
@@ -277,14 +286,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
 static int k1_pcie_probe(struct platform_device *pdev)
 {
+	const struct k1_pcie_device_data *data;
 	struct device *dev = &pdev->dev;
 	struct k1_pcie *k1;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODATA;
+
 	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
 	if (!k1)
 		return -ENOMEM;
 
+	k1->data = data;
+
 	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
 						       SYSCON_APMU, 1,
 						       &k1->pmu_off);
@@ -298,11 +314,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
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
@@ -319,7 +335,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -337,8 +353,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
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
+	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
