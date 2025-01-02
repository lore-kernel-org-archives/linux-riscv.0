Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F0EE77198
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 18:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mt54gbBatSZGXzT6vlPu21MverMtt4Rq1oB3Yk2LvXU=; b=MqG3gNNm0MDlXE
	KHGRaY1CMFJVtovsebxqn2iS1gFMgNuQ76LQTfwWU6yzSJuidyeVHJ33lxqPPa1O23x2GlXKLRKIk
	Yx15zJRKPE2vCohVHkBtyVz1SGyJget0rT9TW4mWbdIuc1ttYgIlI7tsF997APLn6MD3dsuG0drTW
	fcJ77kziiOdM0AW2iOXK62jtyhpN4I7CbjA4cDVBzKJ0Kgtu35aF+jEa592gQs3mj8MJRSUTHC6LW
	NIGaawBYEocV0riRPReru4z++ipkUrLC/taM/9nujrJ0fMCnxHKOmF9f1iCSgVdiBtaHVlUf9Znr3
	djkNfFsSM5ufCeCUECWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQ55-0000000BA5k-2LHl;
	Thu, 02 Jan 2025 18:38:03 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQ52-0000000BA3T-11mJ
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 18:38:01 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 1FEEFB4B3DFC;
	Thu,  2 Jan 2025 19:37:53 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/2] riscv: dts: starfive: Enable USB3.0 for Pine64 Star64
Date: Thu,  2 Jan 2025 10:37:35 -0800
Message-ID: <20250102183746.411526-1-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_103800_428626_DEE9EEF1 
X-CRM114-Status: UNSURE (   5.40  )
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

Add PCIe configuration of USB3.0 registers for pciephy0 mode on all
JH7110 targets:

VisionFive2 1.2a, not applicable (USB-C peripheral mode power input)
VisionFive2 1.3b, not applicable (USB-C peripheral mode power input)
Milk-V Mars, one USB-A port USB3.0 disable (USB2.0 + PCIe0 peripheral)
Pine64 Star64, one USB-A port USB3.0 enable (USB3.0 + PCIe0 disable)

Star64 dts is needing changes and the others are as-is; no information
about DeepComputing FML13v01 what is expected for that.

Not covered in this series is setting of the USB overcurrent register,
which is board-specific and so assumed to have been done at the
bootloader phase.

E Shattow (2):
  riscv: dts: starfive: jh7110: pciephy0 USB 3.0 configuration registers
  riscv: dts: starfive: jh7110-pine64-star64: enable USB 3.0 port

 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 5 +++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi              | 2 ++
 2 files changed, 7 insertions(+)


base-commit: 708d55db3edbe2ccf88d94b5f2e2b404bc0ba37c
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
