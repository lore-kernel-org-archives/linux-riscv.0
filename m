Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44274C761A6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 00:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qZOSIgpkvVUR6XS1+jM6BYDYSkMG9gVrXjpCNdNbJL4=; b=gh2iwZqcUFmuVc
	8aPhzDkYPm7KjiIZyXpf6QxC01ypzB8w2nOszJ8pWq0mB/PadB6trIZkVeI8Sgb++2VLq5LtVzujK
	ziFMy1qZN23psfITQmtdZMnMC8W1jiFL0ziBljhmSMUCnqDng740xZY2gu2+DZP+vvmVd0cZIEag2
	uQxhR+Q02wlfQ8+hTThv5WvzPX/6Snj6tIbjt4fj50EaQ2bBmKm/ReQrYsvq8F7mbyLICyOnf7NVm
	/mg+t8of6+vTr4PjZdGgDsLh6hR0NZOqfW+RlY11PYhokiMx/s8njC0AXagWh2rO/MwqzPUazUrWp
	ROcAzFZ5hdc6Fsbf4JMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe3lz-007npK-1J;
	Mon, 20 Mar 2023 00:53:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe3lt-007nm6-2E;
	Mon, 20 Mar 2023 00:53:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BF40FEC;
	Sun, 19 Mar 2023 17:53:46 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3DD53F885;
	Sun, 19 Mar 2023 17:52:59 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/4] ARM: dts: sunxi: Add MangoPi MQ-R board support
Date: Mon, 20 Mar 2023 00:52:45 +0000
Message-Id: <20230320005249.13403-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_175309_802881_A410E5F5 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?q?Andr=C3=A1s=20Szemz=C3=B6?= <szemzo.andras@gmail.com>, Belisko Marek <marek.belisko@gmail.com>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

this is v2, mostly acknowledging the fact that there is an Allwinner D1s
version of the board as well, thus splitting the board .dts into a
shared .dtsi and a stub .dts for the ARM version. I don't have the RISC-V
version, so cannot provide (nor test) this .dts file, but creation should
be easy, being based on the shared board .dtsi file.
Since the D1/D1s .dts files are now merged, this patch set should compile
cleanly now.

======================================

The MangoPi MQ-R-T113 is a small SBC with the Allwinner T113-s3 SoC.
That is a very close relative to the Allwinner D1/D1s SoCs, but with
Arm Cortex-A7 cores, and 128 MB of SIP co-packaged DDR3 DRAM.

This series introduces the missing T113-s .dtsi, which builds on top of
the D1/D1s .dtsi, but adds the ARM specific peripherals, like the CPU
cores, the arch timer, the GIC and the PMU.
This requires to add a symlink to the RISC-V DT directory in patch 1/4,
to be able to easily reference the base .dtsi from other architecture
directories.
Since there are versions of the MQ-R boards with the Allwinner D1s,
there is shared .dtsi describing the board peripherals, plus a small
stub .dts to tie together all bits for the actual board.

Cheers,
Andre

Changelog v1 ... v2:
- rebase on top of v6.3-rc3 (including now merged D1/D1s .dtsi files)
- refine board naming, stating both RISC-V and ARM versions
- move board .dts into a shared .dtsi (to cover RISC-V version)
- fix 5V regulator node name

Andre Przywara (4):
  dts: add riscv include prefix link
  ARM: dts: sunxi: add Allwinner T113-s SoC .dtsi
  dt-bindings: arm: sunxi: document MangoPi MQ-R board names
  ARM: dts: sunxi: add MangoPi MQ-R-T113 board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/riscv/sunxi.yaml      |   5 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/sun8i-t113s-mangopi-mq-r-t113.dts     |  35 +++++
 arch/arm/boot/dts/sun8i-t113s.dtsi            |  59 ++++++++
 .../boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi | 126 ++++++++++++++++++
 scripts/dtc/include-prefixes/riscv            |   1 +
 7 files changed, 232 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r-t113.dts
 create mode 100644 arch/arm/boot/dts/sun8i-t113s.dtsi
 create mode 100644 arch/arm/boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi
 create mode 120000 scripts/dtc/include-prefixes/riscv

-- 
2.35.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
