Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB80CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5DOGXUc6ziUJO8IkO4AfDLFDzxEvqdbhz0+Bo/aBQc=; b=r95sKlmvl0q/en
	0nYdrN24hNcyOsiHIV+UWqFRwWaWEij4/OVLSF6AbZaYS/0f3mKJlsOjbQw19k2/SIdCcl8AYfRXt
	dcsN7VUB01CrZkmWNvFvp0sW1zTmhAwJO2//+2D2u1k7ITbMhsUWAsMkTr/CFb6H1bWr0C1FOD+O6
	OeEIt5IafYrLge4pZt1y0GqHlRP6991mNoLD0cJ14RW7KVhjfgvMI7b7kF8qLNsct1MTCwAQOTWo3
	XuNj0RJKr7e4RpSvPAyLvcmU/VhBoEqD2EIZtpkrAlMnqmDvR0czf14/c3HErzX9RC7b1a1Gf3eXB
	tzdDGgFCNW6zx4HEIiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLv-00000002oBb-0TlA;
	Tue, 29 Sep 2026 08:38:19 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLs-00000002oAO-3BM7
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:38:17 +0000
Received: by mail-pj2-x2b.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso405177a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671096; x=1791275896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=ZKHnLTxBARuUO3OD76u0lKfeJfRLTbx0SvWrhbwjo04fLMvSEcodPYeEUyVwF632h3
         /rJQ9T7+HmmS4CS6kb4lfQO6PjfnqFd4Fx15SeejFa4C/21zFoIuTqcJ9aZC79mAm/Ky
         IQKmWQ7PAB2aUbc2KfigVpFhuHqs4G5UQzDjyyfGGn7CePhAOmHE0CPWyVRTqnMNtYwO
         4ZqlIdRmbcMKfRB5J5xPMsqzEpucnwmwDYrF4ySsvJLz43Rdh6ic2lojme2V5lwgbebG
         4JH4pMS0yJf8h3SIRbJAiOVbN0H5kuvS5xeR0niD33GyUgJdhM/iJdsBi0MnN0gPO9w2
         sZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671096; x=1791275896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=LVRNzZzcbE+SX51NJaRUr7ekE5w0mGGTCcWDIMYHkT8OFCK/F9K1RIQUnhQJ8Cx7I3
         aT8EKjNSf9qucGk8TkjJ8hkuzwI7Kk4dgera67m/UszVyU6fQraqy3SElKPk35clDhLy
         cGkkOJI6MttuQgudAeWthKGseuHRjDqGsgW/KeiyonHkEbnUt79JmVTMNuN/KJ6GhuWV
         xGkJdFskR8nrO/Q8noz9ZdSr1S8pcu0dA8BVU1jw+T5cWO8bVReqtCydsTXqOsrTTHDM
         QzeG5Qpl4fK+cGwl0cLLajNrsBqDg45h+Ljfj1LxZzNOKqay79SiuAXtj9PePFFi783y
         EuMQ==
X-Forwarded-Encrypted: i=1; AKwUvByolxJAWWyM4/mr4hsE2NeeKgFej4BVfvJakc5v+LkoV25EQFEBlOFkQsL2mp11qUy8y5+0xFzp1Lqd2w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKQvBn1sW0myeARj5RS94OblPyBky1WoEz4FxYMMxSq+Whggc90
	DfQV9pd4y1a9hVvrjX3XbE1JMOfcSAD2N6ayL0K9CwrVNWp5KUQjGNuO
X-Gm-Gg: AYBFou3A2kvctwDsNpO/GrmcSiUcCcGr7N1ZDHlWfExH7i/A1UlUZP53MOIvXHYAdkQ
	9aeZSe+Xd6bXEAVP9Frppw0pzcYt+oapNK+s1mgpAMm+GhGhnRYwWaPoV9LibBER5nJ948zLEN3
	2vM1GMIANXYCHHm5x3NgBT5cS++GNcmwNCQQIMMQjEhc/ldiGspiTvFZgiCDwru/Sume9jg/FJ/
	cR72RiMd98luMgTex9FCU9K8+JZzx275bYe4EBr5cSQrProoNQPmKeRjJfrKoFnWwTAB9z2piHa
	lcY3UvJFuQrPAYZa+xjXGugjtSXpRyvckLNKaWs8f3gUmdtuQinl+XkNtlVFhAO6OtLbFY7YJec
	h+MTeQ3wH4wugjDHR3cdsHXPTnKGESCwaq6zce/HTQOpxlp8xoHkvqQ9X0EpQgfn+yluGb/bYpX
	0/Yz3LQOvqizpgAK6Ci1tBqQwfojiuavtE+EiRwhGDSxLZNJ/2ApFOfmpO7yRcWKE+WNC+
X-Received: by 2002:a17:90b:17c6:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3a098761df2mr11251455a91.26.1790671095882;
        Tue, 29 Sep 2026 01:38:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2c9d06766sm5127845ad.54.2026.09.29.01.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v7 3/6] PCI: spacemit-k1: Add device id update helper
Date: Tue, 29 Sep 2026 16:37:49 +0800
Message-ID: <20260929083755.458238-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_013816_800387_A1EA16ED 
X-CRM114-Status: GOOD (  13.74  )
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

Both K1 and K3 need to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 8c4f0b09fe24..ec59ccb710ec 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -52,6 +52,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -153,6 +154,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void k1_pcie_set_device_id(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int k1_pcie_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -168,10 +179,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -381,6 +389,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
