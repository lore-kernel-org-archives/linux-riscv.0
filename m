Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1306C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XY1DSRHOTHzPus/h2sIiNLpd2o942+EIvnJHk/vfsek=; b=uinNSGtggkj1H9
	SuflCq5dc9uPKbRjRlCcqIGNr8mCA5DimCb8uY+dSCMBx/bYivxs9SBYYQe6HrxToW/PrsJD9my6v
	fy6zVkQpPYzYmMMFA6i3OIbVoSIaUB4/bgQK0QLs+QvV4iHXxAovAeRNPhdATkUPODYyfs92tuY6o
	NzetZwoPRUDN9jEUsSJ4NhQQYO/U2Tkm3czZClrsjawMq/eTpmodP6eev7MqJA2oOQ+90SyWYd8vL
	MbHxoglzXWlp07sdzPQonujEVMTO4sN3nqlMuBIn6ieqCqHelK2qEOLwpv8PZoy96971FsVP5qLvD
	bR7LgwhJopHR8wddpSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvao-0000000Ha9B-0qTQ;
	Thu, 08 May 2025 07:22:54 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvOx-0000000HYER-0Amq
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 07:10:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso7076875e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688237; x=1747293037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2xdDt4RdWfJikzYadK7Wm2Dj/LeNHY+o4TedGbXhPE=;
        b=V6mbPKZCecbeSVczC7gN6yU9+wNHpKeKpf5G4lE2S8fx4F3Hp3Cw5TaDEyLrgSHtau
         HxF+JypcssmhahxdYCeojj+JxXyay1rekpgg7gYE5ZTiLt13pRPyDzBgnxD1RC13Rwvx
         LxNwP69KLEEbfkr8RYBvCuTKHLTDw8V9tQCOJC5cmGEfL6xHVkF47xk9NNHXxpoZ9jZr
         w/TLb1Ta9L97Ma+3RC5DtiADULmDx9jzO5WxmWs6jK1mh18MQQ7/znMIK89KM9rzFqge
         xUPpjqOkdcGzSZYgzSbQn0gAwdkh2VEico7NBktHU/NNCfPFiM/BZv31eQaSBP064R7k
         Lxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688237; x=1747293037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2xdDt4RdWfJikzYadK7Wm2Dj/LeNHY+o4TedGbXhPE=;
        b=Pd6ymaafPqVv8HHInZ1/mZISsNEk7Fx05NzSNVh6xz8pQ90uNI8kQmIArKD7aYHQ+x
         7Ymghk0l12puyw3ctIaLzcPlmWMNtuPgaz4NgQzh/vV7nkTqdSnIH4dbN8kEoj6w1aOp
         zhvViAfOB/p011bttBC2JYgAvmUY+YtiWdpmPRmJU3SemOzsCaqVHZdnpIH2DKWyddtA
         4F3WQH9JHFyLSQ9u/k9qXkW+f4SVgGD/HsVSej4P0Gt7MnovrDujvvKeIrMthx7aKSCc
         aTPILAtOglw2JA++9wVICAVw9Ooy3NL2R1gD+HIUtEzLP55HfGxU4G14eYI6I16wJEw1
         yuJw==
X-Forwarded-Encrypted: i=1; AJvYcCUvIRknv0Po2Av5Hrcf1xI/Q426t15zJl3P/Rtkysfl75aT+p6Y7SayLFyUY76u9uA9cPNaSNmgnFeHuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6wxeUEpt+iLOndFNtaPxFcdAdn8vIBOu7jGJgO6ubKF156+2L
	yi7q548n492WPHdPTSrwCATZH6C+Jl4XwqJ/eRW+sQ7fI4emNiUacKtMl+x3Yg==
X-Gm-Gg: ASbGncvvf1W0MvuXh5J4/nsCWCgIYeLFP6I0JGLhvAHwBZk8dyceEv/lmzqwjqMGF5y
	KjzRwlbTNG2hxM+4M6m332AA+r4/HKyJramil047qYvQGL97evyO2AlTVA22Om9elW6vicEq6Rx
	xXP9ckHqr9hAvl6qkXV4UDdbDjioMPRUBsy1RDnnYPUqiJId47immJZTisD8v9nfgJHoLZHCYDh
	TK50O5CucjG0uCHx3Bkp1VGfToNCGf6cDC9RKCB1K9GFG/60sOBFqyYC1Y4FRBMzp8rnLg7CcPP
	hanSm9NRxz+p7mC8Ytbxy9Gar3ocOrD+MWjiC14XnJq61u5biqpot80/EuurwHF4dSsJT1B1k5j
	KPKAy6B6lEt4CW7gBnWdHVXvL3YHJ6iDh3G/gGA==
X-Google-Smtp-Source: AGHT+IFU6Tfiix8kiA6qL1KyPENFK6H5A0dQpfBujyLXJD3m07n9Que2XUBEh0Jtu1ubwVrnoTFrSw==
X-Received: by 2002:a05:600c:3d9b:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-442d02f421emr16664105e9.18.1746688237328;
        Thu, 08 May 2025 00:10:37 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:36 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:31 +0530
Subject: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in a
 platform specific way
MIME-Version: 1.0
Message-Id: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2766;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=DxjgbttCz+WbWbTBQh3uh5PZxc6tk82mAeHt4QTMKaE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjpfv/vQkWgyV/Hq0GucliJi+U/7FE1Skrvp
 pJ+nrHeneGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9UI+CACk0xFNBFRLakdLLAf9Ya1C7nW/+a/VQ4SxfviZzgiZSwQ3wAKQ1nn3pFJTctodOrYHrYt
 L3jspau7qSV/E69KaX8cHFBStVMmk8Ey9z4rzTqwgNJTiZu1osrkc0SiKydSeqMot1pRreGsKhv
 w6jmJPaJL6AL5/Wc44rKPtCqMktlSapMC4oZdAwUzr+ZolkNNdqp3Ptf12CclgABbIy0YDvrotC
 GnquyUFgI1V0jIOUvvcsv/n1eLtFUktxnxLDS83usEfAJ1WpRavyboLRCrmQ1K00Gvk58fZaWkN
 /w9ORtH6GykTqjVpzegZfHZz6+OjWKawa8B4PrmHhI29wJoR
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_001039_157073_7ABA5F75 
X-CRM114-Status: GOOD (  13.26  )
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

Some host bridge devices require resetting the slots in a platform specific
way to recover them from error conditions such as Fatal AER errors, Link
Down etc... So introduce pci_host_bridge::reset_slot callback and call it
from pcibios_reset_secondary_bus() if available.

The 'reset_slot' callback is responsible for resetting the given slot
referenced by the 'pci_dev' pointer in a platform specific way and bring it
back to the working state if possible. If any error occurs during the slot
reset operation, relevant errno should be returned.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pci.c      | 12 ++++++++++++
 drivers/pci/pcie/err.c |  5 -----
 include/linux/pci.h    |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 4d7c9f64ea24ec754a135a2585c99489cfa641a9..13709bb898a967968540826a2b7ee8ade6b7e082 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4982,7 +4982,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
 
 void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	int ret;
+
+	if (host->reset_slot) {
+		ret = host->reset_slot(host, dev);
+		if (ret)
+			pci_err(dev, "failed to reset slot: %d\n", ret);
+
+		return;
+	}
+
 	pci_reset_secondary_bus(dev);
+
 }
 
 /**
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-		/*
-		 * TODO: Should call platform-specific
-		 * functions to reset slot before calling
-		 * drivers' slot_reset callbacks?
-		 */
 		status = PCI_ERS_RESULT_RECOVERED;
 		pci_dbg(bridge, "broadcast slot_reset message\n");
 		pci_walk_bridge(bridge, report_slot_reset, &status);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0e8e3fd77e96713054388bdc82f439e51023c1bf..8d7d2a49b76cf64b4218b179cec495e0d69ddf6f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -599,6 +599,7 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	int (*reset_slot)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
