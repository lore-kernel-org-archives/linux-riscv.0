Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EFCC001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 11:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kxSdMICDzEHZT/ZIXql46Vi0VoDV5wRH4iSBfoLv7gU=; b=geKqyuyP5beBCn
	CvlXjA/cLy7Gw0rZ8/W26KAGQwPhPIkFGajtqGqPUiGOVQU8cSpjg0dw9/t4d7YiEIp9/vA5A8fw/
	Y50m87Dj4VdVlUyaf5gJ6U7az1O6XItdXW8uqLpw2F2XfwlrWdznNzi7zckzZZu8ziHymSJzdMyWd
	ZKZR3nTBozCIXoQIrMVktqL8DgI9m6m0vzAgLpvmGOWTL/vgHs5WNkfd2unjoRY0roHM4SASJfmbG
	Q3Rblcbdni0m+m8d0y3yDsN2Lv98CyISFLvxVoME4nZVRkZ8zlo+d7EvnaznktrCmMS3fSZG1wOtF
	AlqN/KibWtJPDOVYISWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKdPK-008Z1d-1Q;
	Sat, 15 Jul 2023 11:25:50 +0000
Received: from out-35.mta1.migadu.com ([2001:41d0:203:375::23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKdPG-008YzV-1J
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 11:25:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689420338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GgBO3Tv3/nsdAMW9tPe+lkrolQmS53lBma06VUwvC6g=;
	b=BGr2PYcU7+0kv8jkoFJfhlV6lSU6LE26y/Zn4QHuOARBOFVEufACvFoaFPQ03GKTgy0Orf
	D9/R7Q9AAugyYX7ImfpFW7VUj5RNdddS7CMgaq4Os/2p39UHy9va2IIB6sJTsFNRxlNgm2
	LJY4KGVzSO6bgrk1rmhGB/tIbBIEBQ5NVuWvexlKoh5s60FewFQBN4jGWgHqSyOTjBWcYn
	1M7mfwmDg8rcM1SC3Yyp5T0a8M7sqF1Pq1SS0C4VEz14rzgc7BOeMnSFiZXuuRNmA005kd
	EAWHZS2Mmr7LIB5hiXP8gYu3IBVMlJEJCFLUf56reT01yZjHq/ASdstF4vIFnA==
From: Jookia <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Cc: John Watts <contact@jookia.org>,
	devicetree@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 0/4] Add support for Allwinner D1 CAN controllers
Date: Sat, 15 Jul 2023 21:25:18 +1000
Message-ID: <20230715112523.2533742-1-contact@jookia.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_042547_560494_373A604F 
X-CRM114-Status: UNSURE (   7.36  )
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

From: John Watts <contact@jookia.org>

This patch series adds support for the Allwinner D1 CAN controllers.
It requires adding a new device tree compatible and driver support to
work around some hardware quirks.

John Watts (4):
  dt-bindings: net: can: Add support for Allwinner D1 CAN controller
  riscv: dts: allwinner: d1: Add CAN controller nodes
  can: sun4i_can: Add send support for the Allwinner D1
  can: sun4i_can: Correctly set acceptance registers on the D1

 .../net/can/allwinner,sun4i-a10-can.yaml      |  6 ++--
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 30 +++++++++++++++++++
 drivers/net/can/Kconfig                       |  4 +--
 drivers/net/can/sun4i_can.c                   | 22 ++++++++++++--
 4 files changed, 55 insertions(+), 7 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
