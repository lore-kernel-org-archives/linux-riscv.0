Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF657C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 00:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BB/Wd9i+TZf9A8E35pxPq2o6mt1KKBPnqRNCTD2VSaY=; b=h6MyuASBsaPa0Z
	H4ChQxPzfekxLL0OiIGCoB0PU5wcIUxI0XLWQUmR5oIGP61x06BIulfdzVeG/vWqdqsPcUcH3rWwW
	GSNE6x4Yw80MnkaDg4feAt/uy5DfTE81z2N9gldgA/30yxLjApaxHs6o/OKRy/+4HvmfFAnSfEEmG
	+cNM1l0BafDaaI4f51Vbu1bKX/k+55ZF3mPLpnco9CVBYtUeFAa38QKuSJcgeXTbvz13YDm0dMOkT
	OE29550dJ9g6OoHBP5pZbHotjmdJzZMgqTYZFa8KEJXosfeZqXjUYJAi8Q/5fshzBpAd79+9oi7bK
	bnpgwfHEW891HxwQC7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErC-000000012fB-2Gah;
	Mon, 29 Apr 2024 00:26:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Er5-000000012dz-28Na
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 00:26:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA3CB60BA3;
	Mon, 29 Apr 2024 00:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C63C113CC;
	Mon, 29 Apr 2024 00:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714350407;
	bh=+4O/HYaERDN6eRkgGqOsfuJ2sG6F1FBLC5XSIYkRN5s=;
	h=From:To:Cc:Subject:Date:From;
	b=ebDfLKTSrQ4dlmo8LT/Y9amkpau0ccnbEOaESUZdtP4sZcxWdK3M8bMVFmAMff4tj
	 lgdwkBbfMHFJ22JCywEJkfewrx4J37L0zOAsEOrGHv21lhTeNpujFKK8aSAXI0y72G
	 uxYzihnHhoSct8uMGr+QVS14M3U9ckhgzPenN12CuEUkRC8yq/g7I+T7/K6WaZrDJL
	 JVhgnsKvPYmeqcjo8Ee5uUkc2TaNgDqEpra+qNoevSBx+IQrJBDgZSUXlTLOtz0II+
	 GjKeqQijPxKQjtk5xw5/QVJ9I8jklnw+p/1b0rRdPJ3GZpLh7twHzRcRtzMiJGGT67
	 +5bzJ3MvtNY9Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/8] riscv: dts: starfive: add Milkv Mars board device tree
Date: Mon, 29 Apr 2024 08:13:09 +0800
Message-ID: <20240429001317.432-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_172651_636526_9D74226E 
X-CRM114-Status: GOOD (  10.89  )
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

The Milkv Mars is a development board based on the Starfive JH7110 SoC.
The board features:

- JH7110 SoC
- 1/2/4/8 GiB LPDDR4 DRAM
- AXP15060 PMIC
- 40 pin GPIO header
- 3x USB 3.0 host port
- 1x USB 2.0 host port
- 1x M.2 E-Key
- 1x eMMC slot
- 1x MicroSD slot
- 1x QSPI Flash
- 1x 1Gbps Ethernet port
- 1x HDMI port
- 1x 2-lane DSI and 1x 4-lane DSI
- 1x 2-lane CSI

patch1 adds 'cpus' label
patch2 adds "milkv,mars" board dt-binding
patch3 ~ patch4 adopt Krzysztof's suggestions to DT node names
patch5 introduces a board common dtsi for visionfive2 and mars
patch3 adds the mars board dts file describing the currently supported
features:
Namely PMIC, UART, I2C, GPIO, SD card, QSPI Flash, eMMC and Ethernet.

Since v3:
 - collect Reviewed-by tag
 - rename the common dtsi to jh7110-common.dtsi
 - mv cd-gpios and disable-wp into jh7110-common.dtsi
 - fix "gmac1-rgmii-rxin-clock: 'clock-frequency' is a required property"
   warning

Since v2:
 - add a common board file which can be used by vf2 and mars

Since v1:
 - add two new patches which add "cpus" label and board dt-binding
 - adopt Krzysztof's suggestions, thanks

Jisheng Zhang (8):
  riscv: dts: starfive: add 'cpus' label to jh7110 and jh7100 soc dtsi
  dt-bindings: riscv: starfive: add Milkv Mars board
  riscv: dts: starfive: visionfive 2: update sound and codec dt node
    name
  riscv: dts: starfive: visionfive 2: use cpus label for timebase freq
  riscv: dts: starfive: visionfive 2: add tf cd-gpios
  riscv: dts: starfive: visionfive 2: add "disable-wp" for tfcard
  riscv: dts: starfive: introduce a common board dtsi for jh7110 based
    boards
  riscv: dts: starfive: add Milkv Mars board device tree

 .../devicetree/bindings/riscv/starfive.yaml   |   1 +
 arch/riscv/boot/dts/starfive/Makefile         |   1 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |   2 +-
 .../boot/dts/starfive/jh7110-common.dtsi      | 599 ++++++++++++++++++
 .../boot/dts/starfive/jh7110-milkv-mars.dts   |  30 +
 .../jh7110-starfive-visionfive-2.dtsi         | 584 +----------------
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   2 +-
 7 files changed, 634 insertions(+), 585 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-common.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
