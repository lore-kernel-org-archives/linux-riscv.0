Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2E3ECAAD2
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 22:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QY9wKnSi6gCt+Z7wb4+1BuS+6lCzEM+gN4K3BfdzV4o=; b=yELpqgln/xH55O
	0LPLFIV0KwT7zczzAYZAWCcH2GgWLeFm8a1GIPUolBX7b2LToVMVWIfuWXZ8h7T+KdcwC6m8BW8yb
	hDEG/lPF9OSt0M0e0ZidP01vs5kMHVjiwb4kFAgKUyEqnvMrCvN5PhuRcsU08GslC2viAACoVicMw
	6q4lpCOV4s+FoC2IM5X29NPfkfedNntgrBEPw+Ds9TUxlZRn4MKwuhQeze9iGGG8hMkiyxgO1+Zkp
	RX+abkWGnDAuTIdJ1eCbszTtJ/OfKJe7IWBbka+FHyWjGmoAmED13c4RG4To64FgsVk8WzXWbbely
	uZ3xwwO625UA+WmfomLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsuU-00FUn2-1A; Thu, 01 Sep 2022 22:43:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsuR-00FUhw-1O
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 22:43:40 +0000
Received: from localhost (unknown [188.27.54.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C7FB96601EAE;
	Thu,  1 Sep 2022 23:43:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662072210;
	bh=Se+P/2OSMvzpNPBSCpKRrCFWILF2FxskQ8Df/RF/9Lg=;
	h=From:To:Cc:Subject:Date:From;
	b=LVv576YF5B6AqEwx5ElJjwCiOFMBHSLVVhBFxXTqueF9ZVLGGkSAt2AcQyQ+RNhMN
	 q3uEgPvJGXBC8ZnuI8DkcTDvygvMmxtn4qRD9YKGceUQdNkm/3FI0kGhlCEdv0OlTS
	 k2f1QEWXlJaXcHBFwsq/5HwMuK/5m3CStFraoTzlRtVSdd+TmUc7ktTONuBOfy2l28
	 D1Is/8oshHQZYKa52DwMKW6g5HILCxaYU81+dffXuPKY7LwiW8nuwNyGgId5GoXzqe
	 jNnaUzm1eUlrMVA/7auhJAm9k/0azYBRuwpr2PmNh6KlYoD+NqqgzNVmck0HeFwJwY
	 nGoSnYe9X12wg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/3] Enable initial support for StarFive VisionFive V1 SBC
Date: Fri,  2 Sep 2022 01:42:50 +0300
Message-Id: <20220901224253.2353071-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_154339_228762_40D3F965 
X-CRM114-Status: GOOD (  12.21  )
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

The StarFive VisionFive V1 SBC [1] is similar with the already supported
BeagleV Starlight Beta board, both being based on the StarFive JH7100 SoC.

In addition to documenting the necessary compatibles, this patch series 
moves most of the content from jh7100-beaglev-starlight.dts to a new file
jh7100-common.dtsi, to be shared between the two boards.

No other changes are required in order to successfully boot the board.

[1] https://github.com/starfive-tech/VisionFive

Cristian Ciocaltea (3):
  dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
  riscv: dts: starfive: Add common DT for JH7100 based boards
  riscv: dts: starfive: Add StarFive VisionFive V1 device tree

 .../devicetree/bindings/riscv/starfive.yaml   |   3 +
 arch/riscv/boot/dts/starfive/Makefile         |   2 +-
 .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +----------------
 .../boot/dts/starfive/jh7100-common.dtsi      | 161 ++++++++++++++++++
 .../jh7100-starfive-visionfive-v1.dts         |  20 +++
 5 files changed, 186 insertions(+), 153 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-common.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
