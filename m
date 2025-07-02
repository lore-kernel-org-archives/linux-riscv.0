Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D43EC8303C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 06:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rR/VRTQkTM8StXQTFA3RZPBCWqJX0zf8AWez+SlxSDE=; b=AqSmE5TW75tVDV
	Fmr1ZxNImAIkdieRnw3JJVUf7VFukrIp5woOMTh/2tRYEtpkNK6HwTe3lEBBdvoa0r9p+5XGAM90k
	HKKS/i+GJWQe0o7PIBoacgU1NOD9enhtH6krTo0+cpIhSVWcX4YxIDjs5G2qi2L5IPtXUDBsGrfgm
	ZdWkF4F/42FtgdlIb7k5GOjnCyw/JS0blCezbqykNH3twJcP7xZfR5kk+jAmpv8SGAoUAevhM85SJ
	dE/+USXsmVPPRGdSMeJLUotHHLrPtrqY1rc+lGYBxGRqg6ebCUvKholQY1WDbIn7O/ExJDIJQWwes
	FTtM0ruzSenYbIPLr3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWqYM-00000007LkZ-2DYf;
	Wed, 02 Jul 2025 06:02:42 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWqYE-00000007LfH-3Qhl
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 06:02:38 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAC3pqpny2RomPduAA--.1282S2;
	Wed, 02 Jul 2025 14:02:15 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH net-next v3 0/5] Add Ethernet MAC support for SpacemiT K1
Date: Wed, 02 Jul 2025 14:01:39 +0800
Message-Id: <20250702-net-k1-emac-v3-0-882dc55404f3@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEPLZGgC/3WQ3U7DMAxGX6XKNa7itE1/hKa+B+IiS5wtgrYjy
 crQ1Hcn7UDaJLi07HP82VcWyDsKrMuuzNPsgpvGVBRPGdNHNR4InEk1E1xUXHIJI0V4Q6BBaSg
 IG6x4Q0qWLBEnT9ZdNtsLWwdHukT2eut4+jgnffxp71Ug0NMwuNhls8xRgte4WgYKQW2Lu+z5t
 hcLjohFm6PgWHMBKcC7Id97F3SIyufJtPsbrkQBQqyZgzlqBzMmWhJXxhhbl23ZH2iM05RP/vC
 PQiZF4s2gYH8OFMBbDZ/utLo4aI5lyRuRYto+5VEhVzrX4267/OhCnPzX9uAZt9N/b3r45U2lp
 W2pQi5lfa/aTLO4p5tHWiS6LW1leS1ErZpHelmWb6vpXgbqAQAA
X-Change-ID: 20250606-net-k1-emac-3e181508ea64
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAC3pqpny2RomPduAA--.1282S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur1fCw4fKFyxZr4rWryfWFg_yoWrJFW7pF
	WxurZxuws5Jr4xKws7uw4xuayFganYyw13WFyUKryrXw1q9FWUJrsakr45AF1UZrW5Jw1f
	tr4kZr1xuFsrAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRpyIUUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_230235_241645_B7CC8F47 
X-CRM114-Status: GOOD (  11.51  )
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

Tested on BananaPi BPI-F3 and Milk-V Jupiter.

I would like to note that even though some bit field names superficially
resemble that of DesignWare MAC, all other differences point to it in
fact being a custom design.

Based on SpacemiT drivers [1].

This series depends on reset controller support [2] and DMA buses [3]
for K1. There are some minor conflicts resulting from both touching
k1.dtsi, but it should just both be adding nodes.

These patches can also be pulled from:

https://github.com/dramforever/linux/tree/k1/ethernet/v3

[1]: https://github.com/spacemit-com/linux-k1x
[2]: https://lore.kernel.org/all/20250613011139.1201702-1-elder@riscstar.com
[3]: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn

---
Changes in v3:
- Refactored and simplified emac_tx_mem_map
- Addressed other minor v2 review comments
- Removed what was patch 3 in v2, depend on DMA buses instead
- DT nodes in alphabetical order where appropriate
- Link to v2: https://lore.kernel.org/r/20250618-net-k1-emac-v2-0-94f5f07227a8@iscas.ac.cn

Changes in v2:
- dts: Put eth0 and eth1 nodes under a bus with dma-ranges
- dts: Added Milk-V Jupiter
- Fix typo in emac_init_hw() that broke the driver (Oops!)
- Reformatted line lengths to under 80
- Addressed other v1 review comments
- Link to v1: https://lore.kernel.org/r/20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn

---
Vivian Wang (5):
      dt-bindings: net: Add support for SpacemiT K1
      net: spacemit: Add K1 Ethernet MAC
      riscv: dts: spacemit: Add Ethernet support for K1
      riscv: dts: spacemit: Add Ethernet support for BPI-F3
      riscv: dts: spacemit: Add Ethernet support for Jupiter

 .../devicetree/bindings/net/spacemit,k1-emac.yaml  |   81 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   46 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   46 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   48 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |   22 +
 drivers/net/ethernet/Kconfig                       |    1 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/spacemit/Kconfig              |   29 +
 drivers/net/ethernet/spacemit/Makefile             |    6 +
 drivers/net/ethernet/spacemit/k1_emac.c            | 1884 ++++++++++++++++++++
 drivers/net/ethernet/spacemit/k1_emac.h            |  420 +++++
 11 files changed, 2584 insertions(+)
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
prerequisite-message-id: <20250523-22-k1-sdhci-v1-1-6e0adddf7494@gentoo.org>
prerequisite-patch-id: 53fc23b06e26ab0ebb2c52ee09f4b2cffab889e2
prerequisite-message-id: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
prerequisite-patch-id: 7f04dcf6f82a9a9fa3a8a78ae4992571f85eb6ca
prerequisite-patch-id: 291c9bcd2ce688e08a8ab57c6d274a57cac6b33c
prerequisite-patch-id: 957d7285e8d2a7698beb0c25cb0f6ea733246af0

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
