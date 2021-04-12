Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C5EC43460
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:27:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4454A613EF
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4454A613EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jbXN2EeuVH8YgI+F5LQNCRSaAnmlXOfftzVhacfYwP0=; b=B6ruYL2hmvN8rEHmjvqgSn2G6
	NahgM5PCh8DYLi6hKiQ+vJ9T9WZG3oWVfdpJKQYoJhyvBO+/Xm/f6eEaE2NxGVbowZHPCmdMG97QX
	WXu3Kxw9bdmHphO9s0Ki2HuYhSEre9QPcVkH0QGqzIr0ygpLVO2gyS+VfX/23mIv6ZdUfFdOBD+fn
	uBbpAAoxtDHRYg1hln6jLT240E7Z3zfijuClc+fb+ulQh1QuZ6BrrSteBMurtymHDt/lBzVYQ9KA1
	8uoLlID0dVF+1NLUFVDNW/7yJEzsKvyg+/NLYqxulcK2+E4rfRiqfrDY8JXwdYCjmepSTTn/CtQ4E
	T09BA4b/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVzPW-007G7E-Hz; Mon, 12 Apr 2021 16:27:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzPS-007G5F-6S
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 16:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=AyBLNF6IJGD4IrWwWN061crFc5WTX3+jT5iHMF3Zj9Y=; b=kAoHL5EE3vvd12kSDwH84a/OTw
 suNE0LIwT4w2oMzyXt2WjEs1ksoPPMi1QgGOzy1GeOhiLJRlDqEiJsGir0mZcR8JHCyJ7Cbch8blW
 SOMwlEVozVPRJNyaeREB5vVu/hfXStKH4/H3ifqb4RQhMKEYmOWPTDiZdTx2y0tiYxAys2PWUJ5ID
 +rNGNf1dLTmRRdhiNfw7NuLRZtJ4liJJFbSC+aWyLZ672pxerTZ6U4XfbxfLClKhI9e2RkWcqI6+L
 hsCz/XONEFgH1hurJw/Iz95MRk8vSZibAUfCXwwZFEJZS1aA5r/nJg1arRO+dfI9mmqMJ0QrXIH8I
 96SwBpUQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVzPP-006Oqt-MR
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 16:27:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88BF3613ED;
 Mon, 12 Apr 2021 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244851;
 bh=/MG3KWNNLYHNW9Rh6BkTYR1TFQXUkcBfuNY6i+S1LtU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t/SwGlg/MAW+B0kS8x6vNAj1HvleUufq/OVYBM+Bav0Lsngg7e/iFt5wqJF5V+d0W
 ZdpYAUyehm1uV2G+BL6+ZcFKd7gQ3Ls/mcu+5UFSYXSLgGk+2dxMSZ1ppGdXUknMPO
 cLEmCIq03OhWAHHlxOXIWx3MtYiKri47EGm4bKq/Jl1Fw0qRvlMDoG8EDsAbs+pbpq
 6/zhpFHjhnEBpJUs0XhTje10rTa8d4/xL+aPyZSQht+hcQn0l2C9MM063OXu3eYxdg
 TcyUSyMZXCubGmVCnKAdLVuWbl8XaP/B1vJlD0kfKilLmL6sREtlqW0irPu+hMcRh7
 BhZfmnvodjeTA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 4.9 20/23] pcnet32: Use pci_resource_len to validate
 PCI resource
Date: Mon, 12 Apr 2021 12:27:01 -0400
Message-Id: <20210412162704.315783-20-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162704.315783-1-sashal@kernel.org>
References: <20210412162704.315783-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_092731_776034_3B37B8A7 
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
index c22bf52d3320..c3887ac3d04d 100644
--- a/drivers/net/ethernet/amd/pcnet32.c
+++ b/drivers/net/ethernet/amd/pcnet32.c
@@ -1493,8 +1493,7 @@ pcnet32_probe_pci(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 	pci_set_master(pdev);
 
-	ioaddr = pci_resource_start(pdev, 0);
-	if (!ioaddr) {
+	if (!pci_resource_len(pdev, 0)) {
 		if (pcnet32_debug & NETIF_MSG_PROBE)
 			pr_err("card has no PCI IO resources, aborting\n");
 		return -ENODEV;
@@ -1506,6 +1505,8 @@ pcnet32_probe_pci(struct pci_dev *pdev, const struct pci_device_id *ent)
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
