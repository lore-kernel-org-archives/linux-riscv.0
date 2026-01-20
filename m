Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD81DD2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EY+e9WNKua+9WtB6F/KVtJX0lQ6DRy9tEkIvsI5FRr8=; b=4thxufYPDqdEwT
	DBI+6Zt8XhxIi8a9OemFZMIfFxRZYG/EFGDnTDCHhV3ZrZBZVvIfKzQzZN/cTQ4YdHUK8g37QrR1P
	Ys20uUZCwAXHyNBk/1LIMDvjqbueaePBBfkat6AmV4W9t2u6K+cQyk5Hqy6vzw3HfzKqqkPZUv21A
	UCXGR6wuGecPNBQroiwDfKHC6Y8VpThE06mYQsl/jUSnDvlIjzzSmSMtwRHdGShwJrJbdonk6Jyvz
	Nyo6Y4cL8K/JkuoI6/z0iyw5Hyq+fAkXTg0G84Lm+IUIv5T+M4pLReKeW55frpp1qVgOY1FyTKSen
	nf9HpdpNH+uVTi597HiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8X5-00000003ZO4-0D7c;
	Tue, 20 Jan 2026 10:00:19 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8X1-00000003ZMo-14W0
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 10:00:17 +0000
Received: from localhost.localdomain (unknown [116.25.94.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 314af8f15;
	Tue, 20 Jan 2026 18:00:09 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 0/1] riscv: dts: spacemit: Disable ETH PHY sleep mode for OrangePi
Date: Tue, 20 Jan 2026 18:00:00 +0800
Message-Id: <20260120100001.1285624-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Tid: 0a9bdad8f00a03a2kunm541e94ba35e443
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGRoYVh8eTU0dS0kaHR1OHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_020015_494755_ED1948FC 
X-CRM114-Status: UNSURE (   5.00  )
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

On OrangePi R2S and RV2 boards, when the interface link down,
reading statistics will print several timeout logs:

root@OpenWrt:~# ethtool -S eth1
[   71.725539] k1_emac cac81000.ethernet eth1: Read stat timeout
NIC statistics:
     rx_drp_fifo_full_pkts: 0
     rx_truncate_fifo_full_pkts: 0

Both OrangePi R2S and RV2 use the YT8531C PHY. The same issue occurs
when enabling ALDPS mode (Link Down Power Saving Mode) on other boards
that use the RTL8211F PHY, such as the BananaPi BPI-F3 board [1].

So disable PHY sleep mode for OrangePi R2S and RV2 to avoid this problem.

[1] https://lore.kernel.org/all/f63d455c-7593-4382-86ef-9c31a1ebd283@iscas.ac.cn/

Chukun Pan (1):
  riscv: dts: spacemit: Disable ETH PHY sleep mode for OrangePi

 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 2 ++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
