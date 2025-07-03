Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96783C83F04
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q4DX6wiJdtT9JTffxX8jR1aNKDBwZTBC7MtxZGvqWIE=; b=Rxc0fIXbRJq1Hf
	uWVe0ObJZdaGohvPezFUfy6hb+D2V28luZhHQ73qX4YFIbcrR9NaCB6nXIq4OzSnLGw28RSdzNgQL
	1RIwrwp/GlSyU96NNcKjk6RsQj81/FyQ9q1G1WrclJNac2wcIq81NsLy+BsPhs8JDLc9swxCQRz+2
	dxur1xVTEepQdE8qc6Elpp6cVtAY+zUkhYV9YSD/kTT9MWApXEhJgSX3bxiHm58PxLfOqOWVeGfj5
	mRH3LaOStSk7akJW6Y7KoWdBhDLWnu/cbEcQS4seQYAq41vWJPvicwgws1B60Wg4dM1FOc6HUYLzN
	ChBVZKjmaDKiSYCkg68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGcU-0000000AtXl-0MJM;
	Thu, 03 Jul 2025 09:52:42 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGUG-0000000ArxJ-44ZG
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 09:44:14 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHX4DWUGZouhe1AA--.40630S2;
	Thu, 03 Jul 2025 17:43:51 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH net-next v4 0/2] Add Ethernet MAC support for SpacemiT K1
Date: Thu, 03 Jul 2025 17:42:01 +0800
Message-Id: <20250703-net-k1-emac-v4-0-686d09c4cfa8@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGlQZmgC/2XOTW7DIBAF4KtYrIvFv0lWvUfVBZ0MCaqMU6AoV
 eS7l5BIrZXlaN73Zq4kYwqYyX64koQ15LDENqiXgcDJxSPScGgzEUxoZpihEQv95BRnB1Qit1w
 zi84o0sQ5oQ+X3vZGbsGIl0Le75uEX9+tvjzWHy4jhWWeQ9kP1Yzc0AS8h08hlyX99J8q7+n7e
 S435yunjAIYv0PNmTHTa8jg8uhghNibqviv7VaLpnfKa88mISZnn7X80xMTWy2btlYcQGvFlJd
 bva7rL/PpObxbAQAA
X-Change-ID: 20250606-net-k1-emac-3e181508ea64
To: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vivian Wang <uwu@dram.page>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CM-TRANSID: rQCowAAHX4DWUGZouhe1AA--.40630S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur43Kw1ftw13Jry5Jr1DWrg_yoW5GryUpa
	y8AF9akw48trW2gFs7Aw4xuF4fXan5tw13WF13t395Xa1qyFyUJryFkw45Cr1UZrZ3Jry7
	tr45ZF1kCa4DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwV
	W8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnb1nUUUUU
	=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_024413_380675_BFDA811E 
X-CRM114-Status: GOOD (  10.15  )
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
Add devicetree bindings and driver for it. DTS changes will be submitted
separately.

Tested on BananaPi BPI-F3 and Milk-V Jupiter.

I would like to note that even though some bit field names superficially
resemble that of DesignWare MAC, all other differences point to it in
fact being a custom design.

Based on SpacemiT drivers [1].

For convenience of testing, these patches and related DTS changes are
also available at:

https://github.com/dramforever/linux/tree/k1/ethernet/v4

[1]: https://github.com/spacemit-com/linux-k1x

---
Changes in v4:
- Resource handling on probe and remove: timer_delete_sync and
  of_phy_deregister_fixed_link
- Drop DTS changes and dependencies (will send through SpacemiT tree)
- Minor changes:
  - Remove redundant phy_stop() and setting of ndev->phydev
  - Fix error checking for emac_open in emac_resume
  - Fix one missed dev_err -> dev_err_probe
  - Fix type of emac_start_xmit
  - Fix one missed reverse xmas tree formatting
  - Rename some functions for consistency between emac_* and ndo_*
- Link to v3: https://lore.kernel.org/r/20250702-net-k1-emac-v3-0-882dc55404f3@iscas.ac.cn

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
Vivian Wang (2):
      dt-bindings: net: Add support for SpacemiT K1
      net: spacemit: Add K1 Ethernet MAC

 .../devicetree/bindings/net/spacemit,k1-emac.yaml  |   81 +
 drivers/net/ethernet/Kconfig                       |    1 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/spacemit/Kconfig              |   29 +
 drivers/net/ethernet/spacemit/Makefile             |    6 +
 drivers/net/ethernet/spacemit/k1_emac.c            | 1891 ++++++++++++++++++++
 drivers/net/ethernet/spacemit/k1_emac.h            |  420 +++++
 7 files changed, 2429 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250606-net-k1-emac-3e181508ea64

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
