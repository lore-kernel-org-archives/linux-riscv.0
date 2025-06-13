Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6664C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 02:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tW04QpKpl2g8L1gyLWQnZZVkqrJE8z4IXHZHM1qF4jM=; b=v0vBTQ595iZt6h
	GYD2ty85+PcqpOU1C2n+4vwwtocorq9r0AwliYj3Vw34kXteyHaOJupWY9jhX5fmVXmnnsEmwhS0Q
	7AzU/AdLCHsbjtU3Lhk10ya2VjBE0oiFRoKDdeuSPPcIz/OjgBuU31jJW42MnKeofhMATiWPPsWGh
	RR1iZpu/eHP6OxyF0Hy/IvU5BFHK85KXhyQtT7z8QDxsHOwAeYng8+A/+YyJhW0KFL7+J+85JovJ2
	LHIP75wD76FXYfIALB6cOBKn2t90AitJooppoIZ5g2CQwUe1TgIdGz7qlCeqHMnJcSTp4ye/N/24m
	Y51Xv2p7Iw3qfL0wS8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPu1L-0000000F86k-0Akr;
	Fri, 13 Jun 2025 02:19:55 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPu1G-0000000F84U-2MTB
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 02:19:53 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowABXB9aviktoIvMtBg--.44541S2;
	Fri, 13 Jun 2025 10:19:27 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH net-next 0/4] Add Ethernet MAC support for SpacemiT K1
Date: Fri, 13 Jun 2025 10:15:06 +0800
Message-Id: <20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKqJS2gC/y2OQQ7CIBREr0L+Who+tVgbY7yH6QLpV4lCFdA0a
 Xp3aetyMjNvZoRIwVKEho0Q6Guj7X0WuGFg7trfiNsua5BCVkIJxT0l/kBOThteEtZYiZq02kJ
 uvAJd7bDQzjAHPQ0J2tUJ9P5kfPrbFx2Jm945mxr2VQUqHgzOFEcx6mW4YYd1F0uBiOW+QClwJ
 yTPB54dhVOw0cSkQ5FJR2in6QfrjN4y0QAAAA==
X-Change-ID: 20250606-net-k1-emac-3e181508ea64
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Vivian Wang <uwu@dram.page>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowABXB9aviktoIvMtBg--.44541S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur1fZr15Kr13tF13WrW3Jrb_yoW5AFy5pF
	W7ZrZI9wn3Jr47tws3uwsru3yfW3WvyFy5WF1jyr1rXr1q9a48Jr1SkFW5tw18ZrWfJ34Y
	qr4vvws3CFs8Ar7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4UMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRiMmh5UUUUU==
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_191950_967048_CB981648 
X-CRM114-Status: GOOD (  11.74  )
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

SpacemiT K1 has two gigabit Ethernet MACs with RGMII and RMII support.
Add a driver for them, as well as the supporting devicetree and bindings
updates.

Tested on BananaPi BPI-F3 (but see "Known issues").

I would like to note that even though some bit field names superficially
resemble that of DesignWare MAC, but all other differences point to it
in fact being a custom design.

Based on SpacemiT drivers [1]. This series depends on reset controller
support for K1 [2]. These patches can also be pulled from:

https://github.com/dramforever/linux/tree/k1/ethernet/v1

Known issues:

- RX fails to achieve close-enough-to gigabit performance for unknown
  reasons. The 6.6-based Linux in the vendor distribution "Bianbu" can
  do over 900 Mbps, so this should be a software problem, but I haven't
  figured out why yet. A cursory look at "top" tells me that ksoftirqd
  takes up almost one entire core, which suggests that RX could be
  compute-bound.

  Tested with Banana Pi BPI-F3:

    # On the BPI-F3
    taskset -c 2 iperf3 -s

    # On the other side
    iperf3 --bitrate 0 --time 10 {--reverse,} {--udp,} -c [ip]

  Results (TX/RX from BPI-F3 perspective):

    TCP TX: 941 Mbits/sec
    UDP TX: 948 Mbits/sec
    TCP RX: 617 Mbits/sec
    UDP RX: 647 Mbits/sec

- No DT for Milk-V Jupiter. I do not have this hardware to test yet.
  If I get access to it later I will add its DT changes.

[1]: https://github.com/spacemit-com/linux-k1x
[2]: https://lore.kernel.org/all/20250613011139.1201702-1-elder@riscstar.com

---
Vivian Wang (4):
      dt-bindings: net: Add support for SpacemiT K1
      net: spacemit: Add K1 Ethernet MAC
      riscv: dts: spacemit: Add Ethernet support for K1
      riscv: dts: spacemit: Add Ethernet support for BPI-F3

 .../devicetree/bindings/net/spacemit,k1-emac.yaml  |   81 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   46 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   48 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |   22 +
 drivers/net/ethernet/Kconfig                       |    1 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/spacemit/Kconfig              |   29 +
 drivers/net/ethernet/spacemit/Makefile             |    6 +
 drivers/net/ethernet/spacemit/k1_emac.c            | 2059 ++++++++++++++++++++
 drivers/net/ethernet/spacemit/k1_emac.h            |  416 ++++
 10 files changed, 2709 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250606-net-k1-emac-3e181508ea64
prerequisite-message-id: <20250613011139.1201702-1-elder@riscstar.com>
prerequisite-patch-id: 2c73c63bef3640e63243ddcf3c07b108d45f6816
prerequisite-patch-id: 0faba75db33c96a588e722c4f2b3862c4cbdaeae
prerequisite-patch-id: 5db8688ef86188ec091145fae9e14b2211cd2b8c
prerequisite-patch-id: e0fe84381637dc888d996a79ea717ff0e3441bd1
prerequisite-patch-id: 2fc0ef1c2fcda92ad83400da5aadaf194fe78627
prerequisite-patch-id: bfa54447803e5642059c386e2bd96297e691d0bf

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
