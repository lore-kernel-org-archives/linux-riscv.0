Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E8CC3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 01:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=So6vMP+EKcFe4Mh0SwpEKX/vhFfAW4Y/QcX0pO23Sfc=; b=S/sHa+npylZE5u
	ym5ut9Wz7DMlwJZPBYYR9U/i+dlfJ39r0OLWtsDk8YrxPplYYqwC0TZhPVtftwtwu93Sg0w5uzqmY
	Z3+on2MXgJCTXvEK1kw9ta7TDlEA0oMvYIeMSqZbbLb9LuD22dBSpTfFL/zTpuJ9m76biYLdFqoBE
	/H9VQ46w56rbYZcniaib3m+R6O6aFObqsFrf+8ZouGZ2QLv14Vwv6axPuHof9WGI4cv8U0KKUyZmL
	G2P3FiVfPeYSAjfUfwjfYyY8iJnCtPjKQ5JksP6pVrg4kSa+uhwFfuwcxzukLAuZRMsMip0Gd925x
	tReUhOWcqSq4xjt3AHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDb9d-00GhK6-JF; Fri, 06 Jan 2023 01:04:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDb9I-00Gh4q-SZ; Fri, 06 Jan 2023 01:03:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8589811FB;
	Thu,  5 Jan 2023 17:04:30 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D3243F23F;
	Thu,  5 Jan 2023 17:03:46 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	=?UTF-8?q?Andr=C3=A1s=20Szemz=C3=B6?= <szemzo.andras@gmail.com>,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: sunxi: Add MangoPi MQ-R board support
Date: Fri,  6 Jan 2023 01:01:51 +0000
Message-Id: <20230106010155.26868-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170357_008490_44B30E82 
X-CRM114-Status: GOOD (  12.70  )
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

The MangoPi MQ-R is a small SBC with the Allwinner T113-s3 SoC. That is
a very close relative to the Allwinner D1/D1s SoCs, but with Arm
Cortex-A7 cores, and 128 MB of SIP co-packaged DDR3 DRAM.

This series introduces the missing T113-s .dtsi, which builds on top of
the D1/D1s .dtsi, but adds the ARM specific peripherals, like the CPU
cores, the arch timer, the GIC and the PMU.
This requires to add a symlink to the RISC-V DT directory in patch 1/4,
to be able to easily reference the base .dtsi from other architecture
directories.

After I had written most of the board .dts, I realised that the
MangoPi MQ is almost the same, minus the RISC-V/ARM difference. I am a
bit unsure if we should share more of the board .dts, though, as this
would go cross architectures. I am open to any comments here.

Please have a look!

Cheers,
Andre

Andre Przywara (4):
  dts: add riscv include prefix link
  ARM: dts: sunxi: add Allwinner T113-s SoC .dtsi
  dt-bindings: arm: sunxi: document MangoPi MQ-R board name
  ARM: dts: sunxi: add MangoPi MQ-R board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts | 160 ++++++++++++++++++
 arch/arm/boot/dts/sun8i-t113s.dtsi            |  59 +++++++
 scripts/dtc/include-prefixes/riscv            |   1 +
 5 files changed, 226 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts
 create mode 100644 arch/arm/boot/dts/sun8i-t113s.dtsi
 create mode 120000 scripts/dtc/include-prefixes/riscv

-- 
2.35.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
