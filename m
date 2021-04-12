Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43049C43460
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:25:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED0F461391
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED0F461391
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uW2tgZyHpciqqC//XQpAUcJ+Eilt4muPrHcZuONmvRU=; b=kf5CnGXVZeFMs3lomgNV2VZQe
	GrR+HDN2nL2nDlGlt3hsw7T7+EFBT/h2aWk5sYN5VVvMfbJp9Qgn8cxThvJ0Dcg+pfeKdVlZeFFds
	DIb4KIeHxRUSYBHWPdBZV99bS4MzMFyMxy+Splh4VwFasS4qMgS4w3EJ7cOPK98BLRa/BCjpxw4G3
	x7IvSsZ35qdYxmGy+HTUR4YcpQcBo1k1HZQ+rCrT1gNC+vX33ilMdd2swprrSeWCbmUdF0KcED1e2
	q56MFicRiNNg3z7QD98ALxHWoD3gdlPdku1p2mYht/oqcQAWm2MTFM4O6M7PNQbKx24lFtbtZLmON
	TZ13+QJgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzNE-007F9H-Rn; Mon, 12 Apr 2021 16:25:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzMr-007F0O-U2
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 16:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RW2H5XIPY6QsH7gM+Z0AnWNbza6KDYPFp5A3VyD9w6w=; b=RbKgUGi5FDYXtpgq4kHFdF6RK1
 tnzQHpwcBz+G/U8L9ddO51qtxImJr1blGpvAaE7On+okk0j4IyWh/xSzXUvJDCVGvlSNqv2xVYzpx
 PMladK2YHC3kc6gyb0xF2sQ/hcgNA1YoudrT0NGOH6p4cJZuNTm+popHqACXh0eus/NAS03zJ9g1d
 v2FKu2leDmZEXSUs5yXwJURkKUCubpPoBJHoyUog672ACN5+1WgG0atOb7SWeDmFMptT05E615rG4
 3MVTmaBmh/a5b/fsMTch5ZQDIpF7ANec2RkYKlZwiILD67/XyL+33hHc1XVzJ9z9myk2IJKqNv6Zb
 8EKjx1Kw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzMp-006OKT-Gx
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 16:24:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 677A761381;
 Mon, 12 Apr 2021 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244691;
 bh=h/oMOtZ4b3Lu1QUgWmshCmfFJ+JNBlKbRPav86MrSsw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VDQ7FqzioNUgGRSDGSD0i+NCakoKWcpZGyXLK9fZe/IA1L+FCsWNRgFIQ6h6nCRfs
 6NamS9JpftrrSBojjbb2/R9r58hnkBKVE+bbV/zKUv8eOFQJUvq2/4IHRSsk+cJT0p
 5LwttMbwCeRzowbaDVtXQM0zBH4pIbtQDB0/AXFQKOEDWu8zUutT2tLH1IgROdpaoH
 vPbO/tpBqtVPCHAlTjoW262VercUzESNOcBdHASb2MIa3aBx84sBymo4Nlhn6J2W+0
 x1ifpBcihTVK+YLq8rrmeyrbYxGkapUObO7CV7BBGKklUlQlMfeafYBiH6X6fYCZ4t
 oag7DatVPGFGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 39/46] pcnet32: Use pci_resource_len to validate
 PCI resource
Date: Mon, 12 Apr 2021 12:23:54 -0400
Message-Id: <20210412162401.314035-39-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162401.314035-1-sashal@kernel.org>
References: <20210412162401.314035-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092451_586628_50C479AA 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

From: Guenter Roeck <linux@roeck-us.net>

[ Upstream commit 66c3f05ddc538ee796321210c906b6ae6fc0792a ]

pci_resource_start() is not a good indicator to determine if a PCI
resource exists or not, since the resource may start at address 0.
This is seen when trying to instantiate the driver in qemu for riscv32
or riscv64.

pci 0000:00:01.0: reg 0x10: [io  0x0000-0x001f]
pci 0000:00:01.0: reg 0x14: [mem 0x00000000-0x0000001f]
...
pcnet32: card has no PCI IO resources, aborting

Use pci_resouce_len() instead.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/amd/pcnet32.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/amd/pcnet32.c b/drivers/net/ethernet/amd/pcnet32.c
index 187b0b9a6e1d..f78daba60b35 100644
--- a/drivers/net/ethernet/amd/pcnet32.c
+++ b/drivers/net/ethernet/amd/pcnet32.c
@@ -1534,8 +1534,7 @@ pcnet32_probe_pci(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 	pci_set_master(pdev);
 
-	ioaddr = pci_resource_start(pdev, 0);
-	if (!ioaddr) {
+	if (!pci_resource_len(pdev, 0)) {
 		if (pcnet32_debug & NETIF_MSG_PROBE)
 			pr_err("card has no PCI IO resources, aborting\n");
 		err = -ENODEV;
@@ -1548,6 +1547,8 @@ pcnet32_probe_pci(struct pci_dev *pdev, const struct pci_device_id *ent)
 			pr_err("architecture does not support 32bit PCI busmaster DMA\n");
 		goto err_disable_dev;
 	}
+
+	ioaddr = pci_resource_start(pdev, 0);
 	if (!request_region(ioaddr, PCNET32_TOTAL_SIZE, "pcnet32_probe_pci")) {
 		if (pcnet32_debug & NETIF_MSG_PROBE)
 			pr_err("io address range already allocated\n");
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
