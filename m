Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8241CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 10:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JPRTvTtMj8tDR+wVHOygRccGHIo0OcE2PLTjVkDiofU=; b=X/loyOWuI/FFJq
	mTad/mZlkimql0pL5VkjC5e6soke5zuZkppDfmWCrtNb6esP1OZXROjAbROAoL63lcVnj2WKETQoj
	tGCcSpU+SgjAm0tJHnLwTQeJ+xup4EtKwm8UueYpA9Bg3lfcHRX9kpT4xvWk3RosnvmF7Jto7n7/P
	Z5rM/apnxlSVpAVIJKOjXG4Kfiz/XklyGnmnBMhX94F1khj6v90ZORN/DduOZFUBUl9akh5VMIw3R
	M76L+ANLl3EpHsOO+gdrjcU5s3gbVOTnEmnTr1Vt4xbJtF1KZwfPyKHkZBwHPOKiPI+Ns4tusXsYT
	injCa8hnWHeekoiEj/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplBP-00000004bBn-3NQq;
	Sat, 23 Aug 2025 10:09:11 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upl5a-00000004aht-0Yo2
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 10:03:11 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 48AE0B4E1E32;
	Sat, 23 Aug 2025 12:03:05 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 RESEND 0/3] riscv: dts: starfive: jh7110: More U-Boot downstream changes for JH7110
Date: Sat, 23 Aug 2025 03:01:40 -0700
Message-ID: <20250823100159.203925-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_030310_312766_57DF8326 
X-CRM114-Status: UNSURE (   5.65  )
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

Bring in additional downstream U-Boot boot loader changes for StarFive
VisionFive2 board target (and related JH7110 common boards). Create a
basic dt-binding (and not any Linux driver) in support of the
memory-controller dts node used in mainline U-Boot. Also add
bootph-pre-ram hinting to jh7110.dtsi needed at SPL boot phase.

Changes since v2:

- patch 1/3 "add StarFive JH7110 SoC DMC": wrap at 80 col, clock-names
  const is 'pll'.

- patch 2/3 "add memory controller node": memory-controller node follows
  sorting style by reg address, between watchdog and crypto nodes. Update
  clock-names to 'pll'.

- patch 3/3 "bootph-pre-ram hinting needed by boot loader": add missing
  hints for syscrg dependencies 'gmac1_rgmii_rxin', 'gmac1_rmii_refin',
  and 'pllclk'.

E Shattow (3):
  dt-bindings: memory-controllers: add StarFive JH7110 SoC DMC
  riscv: dts: starfive: jh7110: add DMC memory controller
  riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot
    loader

 .../starfive,jh7110-dmc.yaml                  | 74 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 24 ++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml


base-commit: 481ee0fcbb9a0f0706d6d29de9570d1048aff631
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
