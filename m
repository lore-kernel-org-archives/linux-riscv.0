Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D360A2630
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 03:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GX4EW0IA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IQAGmgt4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=up07PQzz5iUghSNNU8z2iGwY4mgqMgFIq2dPyfV0M/0=; b=GX4EW0IAdH2BasuMxaGkpUpqxE
	MJJfcrWP5rjrK1riTXu9ThZ+9XU3hZdRPAriCPUvNVtT/EeJCPrCmNAqTD4BUMHWxYzWCwu812Qmz
	BdsKEmos3mCKV/MujSZ+zucOJl/uBS+3K/6wdwDgBMNR70EgMRwn/SkB8OzbmkS37Bx5joj4GsmOv
	Xrmq1lcIEHfc9P2Pw1aTa7Md/WBH1JWJmo+g3/SgzBqWvGP80Ww2Hj0dk/oD0bwxfEeqJmOWdw2+J
	BBLhlHU8Z3lj7JKFWg5vYP3OOd2phRCwNj3oZ1VoX0hvT7/4sz9cY4LOQYal2mtLm955Wk3CWTQ5V
	4rYftl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu16-000000069tl-3TTa;
	Wed, 28 Oct 2026 03:07:56 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0e-000000068lN-1m02;
	Wed, 28 Oct 2026 03:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lA
	mxH5StbC92YG4VwJJRjtxwLxu+DmfhuOFV/GCQrHU=; b=IQAGmgt4PNZWbso6+V
	pffK2rsO3R0sJtHr69fYShXhUdAZQYnX+4I+/tJXe36UNjjKRCZS8pASyZkOJqZw
	5wAgwiIxCroZtGVTERPriDLYCOVguaN84E1UpII75b3Y/1GlQdZMPZiBlolV1mrd
	meokRbdBJrzjJFIhQr1h7lQwk=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnVwncZuFqLzE4DA--.33198S8;
	Wed, 28 Oct 2026 11:07:15 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v5 14/16] PCI: dwc: spear13xx: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:50 +0800
Message-ID: <20261028030652.2917756-15-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnVwncZuFqLzE4DA--.33198S8
X-Coremail-Antispam: 1Uf129KBjvdXoWruw17Zr17XFWkuFW5ZF47Jwb_yoWDCFXE93
	s8WFnrAr4UGFy5GFnFyryrXryYva4fWw1jga9aqFZxAFn7Xw1kWr92qrZrAF95Cr1DXF97
	Jr1qvF4rJ3y8KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM89NtUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7APkiGrhZuPTEwAA3N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_200728_985500_D60CD872 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

spear13xx_pcie_host_init() runs from the .init callback with the
controller already enabled. Replace the capability search with
dw_pcie_get_pcie_cap() and store the offset in a u8.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-spear13xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index 01794a9d3ad29..6e4c11b497d45 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -122,7 +122,7 @@ static int spear13xx_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct spear13xx_pcie *spear13xx_pcie = to_spear13xx_pcie(pci);
-	u32 exp_cap_off = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 exp_cap_off = dw_pcie_get_pcie_cap(pci);
 	u32 val;
 
 	spear13xx_pcie->app_base = pci->dbi_base + 0x2000;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
