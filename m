Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8374BD3EE75
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0h80XxW3iwLr21HHy1JVGt+jrpRojTSir48Xv301nRY=; b=104+zbi+OeAuno
	ekeoYumIoMuniu7JU9vfOU2I5jinTDB3nVBezWBCgrk9MVGAf6A429BkApWey84l1vyr4bA3+M5tD
	IwbSC8v1lK/La6Ed2WF8CQcPweBBam3c5NV5CPDfpKsE8MG7b5mpeK+U+lzpoiET/fkLLO0C2SRF1
	xrXYsm85EgeUQjh/AikbIxqmExVy2v7jtPhQ/Otnck9swiiHxbZbLBtbuYEYReR2wr03hfSFS4MMl
	pqiv5XT4NOFYzj0ZqhtJvwcYhFKtwdMv4cDIUYcF+NJhF9r+tD3vriGQj8rkfy4YrvW1OsjOvLUHK
	fROzeL2KLVDh6aTrTewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwGI-00000007IVd-2QsX;
	Thu, 22 Jan 2026 15:06:18 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwGF-00000007IVD-2QZB
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 15:06:17 +0000
Received: from localhost.localdomain (unknown [116.25.94.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 319dee97a;
	Thu, 22 Jan 2026 23:06:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: andrew@lunn.ch
Cc: amadeus@jmu.edu.cn,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dlan@kernel.org,
	edumazet@google.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	spacemit@lists.linux.dev,
	wangruikang@iscas.ac.cn
Subject: Re: [PATCH 1/1] net: spacemit: display phy driver information
Date: Thu, 22 Jan 2026 23:06:01 +0800
Message-Id: <20260122150601.586846-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b4e0b1d2-cd6d-40f3-89fc-c1bd41c82480@lunn.ch>
References: <b4e0b1d2-cd6d-40f3-89fc-c1bd41c82480@lunn.ch>
MIME-Version: 1.0
X-HM-Tid: 0a9be63dc98403a2kunm36ae2a8f92c99
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUgeVktPGh8ZHRhDSEMZGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070615_858482_C93F2341 
X-CRM114-Status: UNSURE (   5.45  )
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

Hi,

> > Print the PHY driver used and interrupt status after connection.
>
> The standard way to do this is call phy_attached_info(). Is it missing
> some information you need?

I initially used phy_attached_info(), but it was too long and printed
phydev_name() "cac80000.ethernet:01" twice:

YT8531 Gigabit Ethernet cac80000.ethernet:01: attached PHY driver (mii_bus:phy_addr=cac80000.ethernet:01, irq=POLL)

So I referenced a part of phylink_bringup_phy() to make it look better:

k1_emac cac80000.ethernet eth0: PHY driver [YT8531 Gigabit Ethernet] (irq=POLL)
k1_emac cac80000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off

If we're going to use phy_attached_info(), I think `mii_bus:phy_addr`
is redundant. What's your opinion on this?

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
