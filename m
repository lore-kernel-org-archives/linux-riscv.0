Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA4BC433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:27:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F83613DC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F83613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kgycZtBY+So80+JzJbBdDbpgyL7sJK5Y8jAGwzGyhqc=; b=hNQPe9+lTtWdgJFF82JmQoZ1z
	xGnEC6v8uHrQJmXYc8s9LPun5r9mP3e+aLkQYof8YwzIZqcVAgYYeICAF4pQczVOaUo3Zz6Qj2tUT
	/Fz2Wqk7bf6tQlW/Dh04KAUSd9NhalcXghLggjUglwxxJLdFP2OAzj9ucmW131pgLXr8mQ5dSFP4y
	mxikj/9QV2HQOqqwJhgVn5ERvc8XSaSDC58D9X6bdjcKh2K4JpeBWHXaXhjmtguD8SmhGj3sO0kUh
	OZrqHsNb76x2JhJmgZL9cpUYT+hVfwE7ptQJBslr43rbKTvZy/pMLSCwDRq+Eoain9FBc437uE+6S
	RrYV0ELZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzP4-007FtP-PD; Mon, 12 Apr 2021 16:27:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzOu-007FpY-My
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 16:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=v+X659bJufr96HHkT7r1rvBWI6JDhcZPPGMPzSMHTo8=; b=0HGPTfvQ3HyKRQjmDEsKXNrdTL
 xacmNOMtr5xG+UDUMY+KeGezOZoiR8K9l/v9uWWDZmSp9iCyz0LFMcGqoYoLwnlvyb269u9VBjb+I
 2Dea/uFTqloA/ioGe+a5ttT4ZZcpNCBsNnsF9U3zDQ4efD3BQQbasVxpUITWbQ/RbLZQ1FhKuZD+l
 z6AlegUoTcDCeshLAb19PLkOVx77oHN8vBJenqIDWWnp2T3bk3sJjXz2dffQzK0IAlKwjyTyytJju
 eMdul0/KgdJk4bQRFz38SSZjQGoJ3fEV+BbjQpfBLSTbMNaPg24dMGv0en72dbX+2ZfSN4Fnc14K+
 Qn858jxg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzOs-006OjP-9X
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 16:26:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23486613A3;
 Mon, 12 Apr 2021 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244817;
 bh=Brccmkfl5v+MBaeCytBTAt8JwT1Gq/R+gMUC5cpIjYE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dsY7NKH3rjymTWCn4mV/MQ+Op181tO555mGsn52+zSlk23bA5JfFQtK8Wg7tfOxNw
 052Qe3d5tlqU9IvNkUj783ErdvgUMUuFUuTKDkq9tDvsJPgUsbbLVU3OUz9f8/Jss5
 DX29nhEu0Gtd9TTJ+P+au7+O/BH6dCkXMN2D9DqkpuzxkrmriagNrKoIhmPjaOhcjg
 4LUwRkWjsdKPJVUeIlyDPYMRrqvLbWYM2c62+/eqXF14byNw2t+mUELWZq+plYYrta
 D6PCwer4chMo//9k9hLIAPbngusqv62Q/NWMspL9lD2hMH4BUqePg0l6oIl7hBiAO9
 sXvIFgS8Zm2OQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 21/25] pcnet32: Use pci_resource_len to validate
 PCI resource
Date: Mon, 12 Apr 2021 12:26:26 -0400
Message-Id: <20210412162630.315526-21-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162630.315526-1-sashal@kernel.org>
References: <20210412162630.315526-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092658_372610_E920881A 
X-CRM114-Status: UNSURE (   9.77  )
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
index 7f60d17819ce..073184f15c64 100644
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
 		return -ENODEV;
@@ -1561,6 +1560,8 @@ pcnet32_probe_pci(struct pci_dev *pdev, const struct pci_device_id *ent)
 			pr_err("architecture does not support 32bit PCI busmaster DMA\n");
 		return err;
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
