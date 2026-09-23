Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E0FC98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 01:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5DOGXUc6ziUJO8IkO4AfDLFDzxEvqdbhz0+Bo/aBQc=; b=xXB8LdtUNbMmbq
	esgcosI+xWdd1U5TuuUJ6TpeMFPTeBfNKG0K9i8cL9IJ84u1Leon2QJ0ByQn7tq8cIA0M4DgtELBr
	WzutLx7RYUhPFjqnf+1UabDRsuSfYyEI0Ve6Q1A7CalBN8zWVKFfCH8P1zZ/REGDee+JTz404tdi/
	GmqyuR2SHPuj2nAo1XnESzEPUa2RL51shfkNyk7S+FwpJgkzSmfCwjqX+eFShumeHbWOhwnp7XQbU
	5Heh5WE2AKVKvn2sk+IRaWocO59Hl1mUHmXZq3PUHDm96/h2alzak3eOyHBRpjrU3xObsSfxHFBD1
	ayZkrwBY1Ahdu9FyCUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8p-00000006t3E-3DEW;
	Wed, 23 Sep 2026 01:51:23 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8m-00000006t0y-2LMt
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 01:51:21 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so326407a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 18:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128280; x=1790733080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=NVaoslOBj9ArJbRZVeuXWoTZPSqABrMqnGgfixa0hJJxBjEcURFrHBI5nsDazWCBBI
         MMJVkNvkyTQ7e4oYxoEI61lPeE9ZUjJqfjBXbG/asdhs+ErnUIeJE9nYdXJhUhx7zn4Q
         wPDxiXwhRcAaOiUHABJUZ8IyXcxiQ3bF6eF3/jtuUDF7iMcGMl5uBeVlReI9e5S9LshA
         SI+1Oyvqwj3e6GWpoMqUPY7nk33zAV6dRNrHPEsG4FEEAH+RUiSQmVUmv2m8pUxd3sLj
         oZdgmITBtC6ViViFEtol3fkeTCTu+fim9If5dygo5C52CVQ9iFD27MvbdT+AnNJsII0K
         QatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128280; x=1790733080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjSZP90MeKeabAnBLqvA1Hzeszd2ueVzqTRJsmZUKHU=;
        b=HZtdYsi+HfoNz+BvlCjpJJPy2op1kOv7qhXMBSVooDL6nFxUPnw4NGPLTECIzP295r
         6YsCduez3cOM3P7mFjwuyXpGHHh5eH4odWhMO5aFuWLxG20w6KouZ0rrjDTLPq2Aqj/p
         j4rUw8CoyQYN2AEB0MSo9y8b6Cav0BkT84tGXf6PcyH53+eaawGnlmEoMxkC8Lt16thO
         pS9H3Zp3XDswP3fzMoNdaCbnHQ9b3U3viZ7C72OkP61B+U4to0+rHbezVTSlmsQEzRxo
         P40HjXD2ldGzCUlMw+PqPI7CDxa13m9pfgTwhjCdWHf9hsEY83BPJ2x3gM6B5qBv2q6y
         P+FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO32tIXZDY5PGQimnYBxz3a8vFcICHgkbCd7CDeRTena79xLxS9sG4WOVIUTn5mtjq3yxVQDLlzvYYuw==@lists.infradead.org
X-Gm-Message-State: AFuF++kpe+Vp/7U9qUogk+ScvBDl0/drgmi3jNnZz/CYIWp5M3W7AWbt
	FJzHrTx0ZnJpwPIrRxM67i+3x0pGo/PXVXDDwMPrBOviYzmypqK/HgZp
X-Gm-Gg: AYBFou3SgyIsr5C5svNhFFlPUaYKhRMeCyFkWJnxYe4mLKlIYxhC60NvfkFvlFnRtY/
	rW0NRDYgTQgyVkv4X07I1Trqbo7HZ3Ty+sL7Gi6SipkNfa4wkyvHQ71OBHUEbSyOWU5aqMyWvgy
	utqu8VRKMyg+1VWOZ/R4S/e8tsYlLb14Deu9V9IUgCud9850BrdlZkIgs7JrwsjeYokkZu/sGMy
	yUME6tPziuMZ4k+qY63emEpaR/g2uXd/OlBOyoEa9JSh0g5opoODm5Tqax/lRKSKYYN5e9ZrgA4
	nBTexp/oaOlrBlePaYh+79Pf5RUNPZmJy88r4GfKGTdBbjGRwiTFANWgcvXnmp6NjHORLyteOSh
	e/zltkobQgsO0pUBi3pyRy05gI6TXXEvWmT5f1vMFpNp4peRSbzOoauoVrbE6cDK2feWenw6Hsy
	Zz3hM4ps49jT+zM83emzYpqW3WOKy+QknkIlYNSvg7ICrwTb6d+/EcErtTUg==
X-Received: by 2002:a17:90b:3f0e:b0:39e:6c6a:6572 with SMTP id 98e67ed59e1d1-3a07e6563dcmr1112630a91.53.1790128279914;
        Tue, 22 Sep 2026 18:51:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a085b5694dsm266746a91.6.2026.09.22.18.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:19 -0700 (PDT)
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
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
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
Subject: [PATCH v6 3/6] PCI: spacemit-k1: Add device id update helper
Date: Wed, 23 Sep 2026 09:50:12 +0800
Message-ID: <20260923015016.64069-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_185120_616472_70A1A57A 
X-CRM114-Status: GOOD (  13.73  )
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
