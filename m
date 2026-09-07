Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D95C79F99
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 11:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abUvMa8BzQUe5h2EdYZ/3YCzveUe87HSbkyIsTEkDsQ=; b=qR9g5ddZYA2GEf
	Y/tnGl8NgloFdbIOhXhYdmFvz6Dnqzx8QiuU8/npK8LZZmX2Hmj/SgtPTIFWjgrI65VzGa8r5UGp5
	71okTg1E0chd/kzNWT0ygLoCQnzHBJMYd4Sjj29XIYsesdiZRTe5WQeUF8kep7Djp6DVwqu4w1uNA
	FNW6IWLH1JmOODR206Hnf55bujDsnWLIaTsHGWmzfkSsdSAjMn0BlJgrnX39sm/WicWkZ9L6Znvkn
	bW6ttdcNWgVPq1DlhEOjRWKpb5rzcRQkgaRFYvMRPv+YoPe3ZhEvDx5z4ZwAWf31G7kUo5nZL6eia
	b/GwI05NkXm9nxsA/0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUt-00000006e92-1LFL;
	Mon, 07 Sep 2026 11:26:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUr-00000006e7i-0axT
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 11:26:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2d9db539a54so27031675ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 04:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780404; x=1789385204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4ROjh0Txn+cURQwAkggsPhj+gLlvJP/O4avQg1uNi4=;
        b=UOMm1DGr7C85dkBYZcL7W3W4383LN5pFqW24fby068/8DHK1aVqXXx/lRtDu7KF1oL
         tIhyajdU1CbUfi3W4DvuGkz2Ad26KyWpscJXSOmRIN9s6RmAI76/J5dqXzHi0U07IBi6
         ILodWCU9a08RFu3C7hFY6tz8KBH35N5XSgfDeXynKUE+h0gAEGtS/Y9f8TS9eZsIPJq2
         434AQODRoU5DoN34apks/UqkQmcTmFNdyRK1q78Itkt+WYFihHsYLbEh1ybjI037s9mP
         csHI6S+/XHlR4FcEIgGHcuvvr+pwbUKcGv+kE7rDGDE4FsVfikjDNmmEpupSbHsdF/s4
         XnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780404; x=1789385204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D4ROjh0Txn+cURQwAkggsPhj+gLlvJP/O4avQg1uNi4=;
        b=sIy+NZs45jL+NtI8uSlEnWqFTYNzbzcr1DzhBfBSWM57jkT6uTXTBqDMjBOTKzcGqQ
         B6qobiSko/97YBo3j721FfmymWqu0fHlht9MLiXQfxo5c37qec3bFAzHQFGFQVoSfaZO
         Q/8fWe1DqLHsIEHPHksFb/HDIID3hvuJeat6U5NFNng5/PNgLkm1ti5TGwESQK6Jpmg0
         H/SvcGQLs4ipSXLplEHzTy5rPccLX54j3desldXxFpSag7unyyJh2cMAXIbcYEcMY976
         CtcYBxVtMG2PHeDjvUOYhcBHVPnb67WA5bqJumeq18uJdZLXNUa/XEC1E24foKsh+aF1
         WqDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQR86PcdixmLbO+BDxGndwZqMDqQ9iCJPanzojNMR+QN/PFLXA7BpKbRgF+y5n1VEGWb/hOyVT1c5wuQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lZJnrK9Os9FJbj2u2jeE5LPx2x9oQPxbPK3Dv0meSYGkJZZvGT
	6RpwPigwcciTAf6aLTW0gaEgyN8m6ggXteVJti+xco+i1ATvIozEhPub
X-Gm-Gg: AYBFou2dmcG+4pq8ReD5LqmmD7Ws7wYlkmx+tgst0/p2jRsBNrelp2qY9RxFS1q9i3t
	kSTYpk/T1K3xya6bsSIB0+d/0IpUWuxP4GrcKAWd6KGxPk+BH74Cm0RbpzA+rEnizRjeRXwV4aX
	wr5zjaUahJWidQlOwrHSsU+NI6Byzdopk4ncGjoGm2nxALKk+vVclqtQbQfgGhtBzv1OcBxtyLp
	Factf4vrinqsHfUd1xUQIHn8y1AD5rI99pckyDl7CnFk3Ec/ChtMhJ0uEO0qz6STHSFSlTQX40i
	2k6k9WMZcaNnLif+zczz9dsbuw4JfKD1h631pftLDa0UyaWhGyYKXQ7q1DR5rNlQH1haYvjVHRL
	Vi0gaI3JSmNTIPPhCS9NMWEhdwGpCs2aVpbybvVDVyeYHkdusz4g3iJnfx1iwu3Rk60Pdu9q3WT
	LfFPyhupkgAalGN0B/lWk/S+MouQZKXmm/0EyP
X-Received: by 2002:a17:903:2c6:b0:2d8:d4d3:da50 with SMTP id d9443c01a7336-2db126aae2dmr385170325ad.20.1788780404053;
        Mon, 07 Sep 2026 04:26:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499dad4sm44234655ad.55.2026.09.07.04.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:43 -0700 (PDT)
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
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 3/6] PCI: spacemit-k1: Add device id update helper
Date: Mon,  7 Sep 2026 19:26:02 +0800
Message-ID: <20260907112606.465778-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_042645_213074_92BF403B 
X-CRM114-Status: GOOD (  13.34  )
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
index 1049391beee8..c610b367412a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -52,6 +52,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -151,6 +152,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
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
@@ -166,10 +177,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -369,6 +377,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
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
