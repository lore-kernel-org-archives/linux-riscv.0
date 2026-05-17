Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C849CD4851
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 01:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdmSwZIn1ModXw8oW41EVFL4RE1qbLg+S1gqS4lNSjc=; b=OMjPNEvkcA+JOU
	z2SWfM72FQGFNixQ8NghabJtft2Cx73tshx4MPwh3gCKhzFz+paBCPDod0QaMCTozFuIHYwtJ2RTg
	RRsg0aznfwtyPDw1/TDnCGjNfWPkU6DiRPCrfdyJAPEz+O+Plxf26cgdGkrShvDBVkjJxOcdIdkU8
	1O74x2b4xDvKGdjamA74wCYYNeHRSux4QavUSXtLyj48Cu8eZtbNmk7uR5IXqFOl3D7O965rBP1SA
	3O9RlhWLu186BzSH0iM5gP5nkenQfxw0V6j7DaaCiTDt0MJ7hX7yy7caZYaIEGJQA3POrvnAMyn8C
	UweMDLxLARnlG6A8dNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOQd6-0000000BsDR-2dsk;
	Sun, 17 May 2026 01:49:20 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOQd4-0000000BsCp-1kmn
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 01:49:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b45cb89f7eso6966555ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 18:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982557; x=1779587357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=holLKJOKlFbzdQi8DERchaO2LakweIJGKpZqbMi14i4=;
        b=LBdBkpGEiCPkrTllqG6LIcaUuuY7s+i6r7uZ+0wVSUabW8HBUpdMIWC7iCmE2xVQ3d
         q2i5hIRmzof/WBt+cw0P++V1MZvvGztOgaQngj9MMhByLRMQmVrW9CgtmN8Jyp2Mfq1a
         9bvFYSf7fcxNIc2ZH9LrpogkCuUV5Z6of8H88/LhMcEhUzjjuLtwsS5slEkMRWKPmcBb
         1hnNUs5QzGDgfeKpffpKGyWCsTWOzus7de9aW7Q7o7L2i8rvbZqeFL7ZcQGEr4Lkeymw
         b2Y2RjAbM0Ps4HevIObc0dWa4lEaAHQrHFM1J2Vy1p6NlI1CePqvRD2o9Z5+Pbn4pONg
         nlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982557; x=1779587357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=holLKJOKlFbzdQi8DERchaO2LakweIJGKpZqbMi14i4=;
        b=epihdDQnamC4HV2U998dnep/zYTCyTpmEZYsHK7Sl6mV1GBqtMRVNLQWJe3ey9e+gg
         G3PufEa66NOjF8F2XDNFFn1MOW7y9u1OrQzpx3bvHx+cWQ5oJdlI7O2+H3PaPyR18Ho6
         jdAEcR7U99exCHbTYj9+a6/vueLt8DqLpH748s9FiiGrk5b0kzK3hkP0WKZlhOmhoXp1
         NoSPpOPDsJW7wjOEdNlA5+PLB5N8BQvKofQWDFmtvUEhl+s5x7qy+r0lJOsbz36A8oNk
         B10ACUbk1awZSBVLYpZgPyAjT/9OejPAFLNG3LIoLV+0R3Y5OstOLpWbCgZp4sdORSFC
         iX2g==
X-Forwarded-Encrypted: i=1; AFNElJ+cweHMYGbOPmv7sPasG7N0wI4jJdS9bKEhY9RWPIfIU1jIYt9LkLheGTPqoXjfwp8uEgW8pklYXLM+Mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLZYpfPVnRKHHE8bUIzJZ0f9bpujmoqMcC0HabXkUHOZIflAwo
	rTnqIMTT6ugwnmNwV9KxwR4ndQemhs5CtJIbNla+j1RrKvsx+ArXzuOa
X-Gm-Gg: Acq92OHEiPDGBL2FBtSXxVYljrS1T/O7xmzbwnOOCVcq6q0a8ywbBbK3nr/++tZFru0
	6YOMOE2fCFpVIFeKmysqp5DDdy4ThOzr9cSxpVyTv0Z2HEefbx8Bcci8TTG22pOeT2aypXzJ67I
	VhRLcPhT5bzjkoaDAaYNMR/pFeJPgLTo2zPvrAEGw5w9Wuo7Aj3bhOsbtW4s9xWtAHTPNgPeEAl
	Mix2X/FV1TL0qWOKOjN9NKcHFYgeBrRcZ/zE3eVcmaobA4ayFJmscPYoIwIRYGi4yPT3DM04uwV
	Ks/7MvHoVmoYPV5m8WU3ZtC4/PcWOWTrwYwkabNVgF7wFnmLXm2qfqdcdMC8+6jdQDupXwyb8w3
	ilKpyyb6RuKVNxO/ThkKH1qDVJE5NzbDg97U02Z3qVTpyy+KMWevhy96/+kCZ5YPiHh9keJuuBb
	TF+93kfoQOYm2CgRVzlpsklok=
X-Received: by 2002:a17:902:d702:b0:2b9:ef36:434b with SMTP id d9443c01a7336-2bd7e7de8f2mr75213045ad.12.1778982557515;
        Sat, 16 May 2026 18:49:17 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm107831685ad.47.2026.05.16.18.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:17 -0700 (PDT)
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
Subject: [PATCH v2 1/5] PCI: spacemit-k1: Add device data support
Date: Sun, 17 May 2026 09:48:36 +0800
Message-ID: <20260517014841.254085-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517014841.254085-1-inochiama@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_184918_460457_91F6292A 
X-CRM114-Status: GOOD (  15.01  )
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
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index be20a520255b..1b519d49dcc0 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -57,6 +57,12 @@ struct k1_pcie {
 	u32 pmu_off;
 };
 
+struct k1_pcie_device_data {
+	const struct dw_pcie_host_ops *host_ops;
+	const struct dw_pcie_ops *ops;
+	int (*parse_port)(struct k1_pcie *k1);
+};
+
 #define to_k1_pcie(dw_pcie) \
 		platform_get_drvdata(to_platform_device((dw_pcie)->dev))
 
@@ -278,10 +284,15 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
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
@@ -299,11 +310,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
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
@@ -320,7 +331,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -338,8 +349,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
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
