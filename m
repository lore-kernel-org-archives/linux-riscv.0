Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3548CC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:26:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D284D613C6
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D284D613C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U/PZADWw629svXApLsTFEl1kEVDFbKe1DQ40H0FSrt8=; b=FvUwWpUvjN1FFmANkWR5g59et
	XWihfNzG8VCkDJJ4U9fH3d5S69yGb4qX0pxXaWfAsi9d6tMqaGkLpb2/UYWrbC1jW5KOQVFt+2irk
	d4hzLKHhH0lruBco2Q38tLZEHGT3BdjoMhJx7e70xkR25xi3rhPGAVq/Sf/UAXJN3HeqhVYIr3GQi
	9c+SHD1a0SCWDqwDw5qrqsj7JSNyI4STWHXcyC0JG3sIs/BcqBMK0vfsVseFpVgprAboCnvi7B2Tf
	aPy45CFEq++iO6tDSM1EJYutO9yrmX0yxVvQbT0WaLQE8sntF7iwPi6ooLtBzRAzAcnXLcga11qIf
	fX5qe2suQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzOO-007FcJ-Tx; Mon, 12 Apr 2021 16:26:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzOM-007FbS-VR
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 16:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=U0nzaVFOa6tyE4I5L6k6cEvUuZTngq7RkMMXHGo/j/Y=; b=qi+GKBwbK7U2K3XbbndERkm4Ug
 uUNErDfEGbzbvpMxW4oz4uL1EdN2R58fTLnwIc1prPxFFsPSnys5WD1YMt0ideLadpVyzydyZ9VQC
 Q4Z6xziA0w8eIkc3GL+fASJ9QxvmSebSXDCFVWXsb+7uxoRv6Xju28iYI96SG/qT+zFv7Xb7L4etV
 yaK2SFBAgWGdl7P0Ptcu5ePrB3mIWjomzc6L36fkIb903LEPLxD1pR26DMpEW63UX5qtZHXkpCWQV
 P3PYqh5KauZSCTTtOGsBFWqkrdXtrNFndPJ5oBeei1tgTxRe9tq0F2wVDTc1f/b9/VpWQP7io9o9z
 SY1MqKrA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzOK-006Oce-HF
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 16:26:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66034613BD;
 Mon, 12 Apr 2021 16:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244784;
 bh=vexq6biuKCrPhpSSvklXRx2AKHq6uV5xEqsuRSIWA50=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GtNlz1EKZBN0azJqVEmLZagLSdiWCE5Xgjb1CZUmY5PzMPGUhlfGg50lXJAI4jJdl
 v875g3GB6OVGdrUOvWq+jZPrlU2MSWAN/mgXaJMGjEkJHkB6qED2U+zeb2bFrH2+Sn
 epbPjmddBZyUYXToY3qEeBMJOoUvfyW30AxHrK9NUVFapVPrd80SWGOfvK+tvzX0ZJ
 oxNHsnSIOg0s1duOfS0OTRyu40PQF6xaUBTgPp3RK7iZLQKtkBuWVETP2TmJQLSnnb
 H7tVXRlzchLoYK31dZutn7w3KZoyoT1yYG5Xl/wLT3tDxNs3N2ImwNswif+PzBf69D
 4VoLs5E0Sdc+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 24/28] pcnet32: Use pci_resource_len to validate
 PCI resource
Date: Mon, 12 Apr 2021 12:25:49 -0400
Message-Id: <20210412162553.315227-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162553.315227-1-sashal@kernel.org>
References: <20210412162553.315227-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092624_601413_D2737CA4 
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
index f5ad12c10934..da84660ceae1 100644
--- a/drivers/net/ethernet/amd/pcnet32.c
+++ b/drivers/net/ethernet/amd/pcnet32.c
@@ -1548,8 +1548,7 @@ pcnet32_probe_pci(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 	pci_set_master(pdev);
 
-	ioaddr = pci_resource_start(pdev, 0);
-	if (!ioaddr) {
+	if (!pci_resource_len(pdev, 0)) {
 		if (pcnet32_debug & NETIF_MSG_PROBE)
 			pr_err("card has no PCI IO resources, aborting\n");
 		err = -ENODEV;
@@ -1562,6 +1561,8 @@ pcnet32_probe_pci(struct pci_dev *pdev, const struct pci_device_id *ent)
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
