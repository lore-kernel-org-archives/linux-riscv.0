Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEF0C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 07:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKbxkkTkJSLA51DkcNMU2GSoSF10U5bqdjOsu+mVDzo=; b=COPYydYLcwxrbz
	rW/wC5xKoN5sMYZbpPL4IsRE3IaY4iAn5++lTOPSu00U4ce/7jJtdEMAxr4TjhqdlXN7AfzBVnT28
	/EeF7tocT8ehhPtwHyrfWOb6gHuZoxyhw2iUoNAo2s/QS9/MRWXW5122ty1OkE9DBkDhG0X5Fej20
	XxkIuKWKmNCF6mR9EFI5RGY29r7TxpeN8zaqE801LtsQDF2m5/b535bsQhqN7PKQB4VD1GJ9GEjIn
	5XiWUKdZbtwgX++uRvfy1wNeJW4B+kkb2ieBimDBEBtRZPdrZ/PtiNmfHSiSZuBWJ1JvLK7NM8wau
	zmr+P5Cz4yiVjxHzWbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvcj-0000000HaQW-07Ml;
	Thu, 08 May 2025 07:24:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvOz-0000000HYH7-00tj
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 07:10:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so4052945e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 00:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688239; x=1747293039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANtxwEr6laRS33/pxu2Fx1NdTAnqeBmRbC8AgVjEito=;
        b=XjE0FNeaB52vj8yx6DgHeVegtwM8jQi8+t7cG38q41TRGolFGXtEK00lopKR6bdPBN
         XWPyzgYg9SzHvqsPgVUFaVzK58yUM/pWMZiAM8POWb2vYU3KS1JdHspQpjLt22KuybDa
         hMosDs39EcnbRoXdN2d1r2zE59OmYVmvHiwQLQfI0Ea40EVVf+fMaP606ScN33f7zH8t
         Ksip8RgGrAV3O1kdt3CpAoD1og9VSBNHFZGBfopu4cfP3TJPyyf20v8vCHITctJjEVaE
         EYKtAz5cG06pjcley6vkbibNF4hGKEVMPpG1tblU8EBLVBHlCKccGd9l+7GvAm5FcXbP
         qsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688239; x=1747293039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANtxwEr6laRS33/pxu2Fx1NdTAnqeBmRbC8AgVjEito=;
        b=wBz6L2srAnlNJm7mw5GeOTucy6XUQgDNM0Bzy4HZ6NZ6w4w3mKj8gzjJHdU+qZ4J7l
         506S/9ESLAIzZA9h448GXuJ/ak8mYBKv0cPYOy3QJEWwGktZLg42cugdGzP/cDiZOJB4
         MsTTHjPo40InW//vGppV3nFpywu3jBJzG/VV9c6Gmm5EqCRiGRUOqta6Ys3We+78z26a
         oRTu6x4fv5FG3cbzSi9Lp2xV76fKIcNcEssnezsbtQN9bfsUib6Rdc/CCQO4haZlT2bR
         eeI3M0MXc7fRsuwMs19MYxda4kesgCHMY7crdutgk+cMZOAOdgsXSR2G5o7FB9C6TJbI
         4S0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSKHur0pmv8UaVgAy7kHCjIDWj7Z6CXEF7L6h4/VXZMLoIU+JwjddwLqnzWV9YI6yClAQD1Xw4bmsjaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1gvYsmfRxO2WXTi6sAdoqG2pWmL2GoWRkX4lW0WeXAr7OhqrE
	5eojEZ3qAkyDmA2hAx2BnrpQIZpGn/4FKzndfMKy9S8W3P0BCVvGb5O1JQ1IAQ==
X-Gm-Gg: ASbGncvdFjSxJJ+RV9CY45MylvWJJIpAgbZtY+iOzhIcmJjMHs10/pZRVX5GPqII5Mt
	QTS6xkV/Ps9unfAxodBuxSCNyTruybYQikpw6m4us4gOkquMrHiQaWwrRj3uIDmtGzPKmgf+uTc
	Ghp5T+oaq1ZxVnolqQdi6/7/fIteKefWmGUxoGFKM+nzFMQwo2HUJ+OiSL9YQSJitzRmp3xj86g
	4iAzdDUd8g8HqbQuw4Jk2bWoxzLn171fD2/q+GLk2TSnVTvif0ckN6FaIyI6BiPa9KzlSOJPBYQ
	46Bx24rBJX7HCDOoMVGHEFIRpjHuC0/cTrnCjYmXiBWFITTct7xzTuSWozTtvrFByGsOZX6cREe
	oZuPYdnjLE3EYY0C2mlqUc1GnXBo=
X-Google-Smtp-Source: AGHT+IEzLeXl64VuG3LDBY0EBEtsib+I2DE0INi6/ZnHENyuUXbkLuxvlx2tOJR3jgevvW/m5m9a1A==
X-Received: by 2002:a05:600c:5111:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-442d034ad4fmr13925925e9.20.1746688239310;
        Thu, 08 May 2025 00:10:39 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:38 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:33 +0530
Subject: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
MIME-Version: 1.0
Message-Id: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5013;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=3LL1EMi315Z/B5zK3zsxrKW113WDL+SEaQ+1pl/P2Rg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjpL07zvpNmz80RZq+CJ23rDNKQ4rbWHFYvk
 WEYaovGi+WJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9TldB/0enq4tJZ2uTvuG8JYQU+8hIIEyWbBv64ohIiJ9BqvlzzpZxAmt8uyb0qahy2kubec5Boj
 avyvEzax3nAwi5ldUbHq7FXTSTXx8LCRlABHPcw9wmG91cGx16OfkgnM3FUKgIfEO9YVsD65aVW
 hB3ecw9FGLzTLX/x2ywNimLi3H2pQK5LFPgsfYyWd54qJ+oWgFNzT/OXKVDjzrgDDKMskxj2P7p
 QJ7/UAOOlUhxcSmCfawGsRN43aCRDBvW4uO0c6YViOIz/cfYgfrAhcmXt/ge3QP0PbwEGZvqfe+
 bAfEPRFBQTvnwJgd3CK6yQ8dGSbCpx4cQgfIduSe8Ne8/aEQ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_001041_052575_7B667966 
X-CRM114-Status: GOOD (  18.14  )
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

The PCI link, when down, needs to be recovered to bring it back. But that
cannot be done in a generic way as link recovery procedure is specific to
host bridges. So add a new API pci_host_handle_link_down() that could be
called by the host bridge drivers when the link goes down.

The API will iterate through all the slots and calls the pcie_do_recovery()
function with 'pci_channel_io_frozen' as the state. This will result in the
execution of the AER Fatal error handling code. Since the link down
recovery is pretty much the same as AER Fatal error handling,
pcie_do_recovery() helper is reused here. First the AER error_detected
callback will be triggered for the bridge and the downstream devices. Then,
pci_host_reset_slot() will be called for the slot, which will reset the
slot using 'reset_slot' callback to recover the link. Once that's done,
resume message will be broadcasted to the bridge and the downstream devices
indicating successful link recovery.

In case if the AER support is not enabled in the kernel, only
pci_bus_error_reset() will be called for each slots as there is no way we
could inform the drivers about link recovery.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/pci-host-common.c | 58 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  1 +
 drivers/pci/pci.c                        |  1 +
 drivers/pci/pcie/err.c                   |  1 +
 4 files changed, 61 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index f93bc7034e697250711833a5151f7ef177cd62a0..f916f0a874a61ddfbfd99f96975c00fb66dd224c 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -12,9 +12,11 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
+#include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "../pci.h"
 #include "pci-host-common.h"
 
 static void gen_pci_unmap_cfg(void *ptr)
@@ -96,5 +98,61 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+#if IS_ENABLED(CONFIG_PCIEAER)
+static pci_ers_result_t pci_host_reset_slot(struct pci_dev *dev)
+{
+	int ret;
+
+	ret = pci_bus_error_reset(dev);
+	if (ret) {
+		pci_err(dev, "Failed to reset slot: %d\n", ret);
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
+	pci_info(dev, "Slot has been reset\n");
+
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static void pci_host_recover_slots(struct pci_host_bridge *host)
+{
+	struct pci_bus *bus = host->bus;
+	struct pci_dev *dev;
+
+	for_each_pci_bridge(dev, bus) {
+		if (!pci_is_root_bus(bus))
+			continue;
+
+		pcie_do_recovery(dev, pci_channel_io_frozen,
+				 pci_host_reset_slot);
+	}
+}
+#else
+static void pci_host_recover_slots(struct pci_host_bridge *host)
+{
+	struct pci_bus *bus = host->bus;
+	struct pci_dev *dev;
+	int ret;
+
+	for_each_pci_bridge(dev, bus) {
+		if (!pci_is_root_bus(bus))
+			continue;
+
+		ret = pci_bus_error_reset(dev);
+		if (ret)
+			pci_err(dev, "Failed to reset slot: %d\n", ret);
+		else
+			pci_info(dev, "Slot has been reset\n");
+	}
+}
+#endif
+
+void pci_host_handle_link_down(struct pci_host_bridge *bridge)
+{
+	dev_info(&bridge->dev, "Recovering slots due to Link Down\n");
+	pci_host_recover_slots(bridge);
+}
+EXPORT_SYMBOL_GPL(pci_host_handle_link_down);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index d8be024ca68d43afb147fd9104d632b907277144..904698c1a2695888a0fc9c2fac360e456116eb1d 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -12,5 +12,6 @@
 
 int pci_host_common_probe(struct platform_device *pdev);
 void pci_host_common_remove(struct platform_device *pdev);
+void pci_host_handle_link_down(struct pci_host_bridge *bridge);
 
 #endif
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 13709bb898a967968540826a2b7ee8ade6b7e082..4d396bbab4a8f33cae0ffe8982da120a9f1d92c9 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5781,6 +5781,7 @@ int pci_bus_error_reset(struct pci_dev *bridge)
 	mutex_unlock(&pci_slot_mutex);
 	return pci_bus_reset(bridge->subordinate, PCI_RESET_DO_RESET);
 }
+EXPORT_SYMBOL_GPL(pci_bus_error_reset);
 
 /**
  * pci_probe_reset_bus - probe whether a PCI bus can be reset
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index b834fc0d705938540d3d7d3d8739770c09fe7cf1..3e3084bb7cb7fa06b526e6fab60e77927aba0ad0 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -270,3 +270,4 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	return status;
 }
+EXPORT_SYMBOL_GPL(pcie_do_recovery);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
