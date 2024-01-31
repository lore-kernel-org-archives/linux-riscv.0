Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B02C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a8cOF/qKwEaWRcp/E5BM+J0ZgnoYdu6d05TyK4TX3dI=; b=kEGG4c+oW2YzPA
	3JcUCeiJ0y3MTSgmiokO/HqEZ+01qNXaGBiLPh3TkIWydUZXQUxniILimObhGEfMbFPuUqjGabLSW
	YGxcFvC2m54DEBjGNWGPMHGT5eD655gkjAiYDH+X+nc9v/hYkmPs8KhyRmP5073KEX6DIHjKLLnpH
	mgpDEgwKrm3oEAmf4Hc3SXNyXb3TyDReiKPF6lbnqbkGB/HC4A70ZIiOsaTQg15JEuBQd1raRlKfS
	Ns7SJfM0vBuLuF6JZs4smkepqAiA8tOk2Tls4bgXhQrTCETAgZmOfDL5qFV8XbCZt286zbsWjJvBc
	GffiZ23gta7pzQ2lzWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAno-00000003eox-0dGP;
	Wed, 31 Jan 2024 13:38:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAnl-00000003eo2-3Nt4
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA5B16176E;
	Wed, 31 Jan 2024 13:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E8DC43390;
	Wed, 31 Jan 2024 13:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706708332;
	bh=CPLp+9AYzGX3pEeWi3wlU4ZtwP5lMB44GA9+1lDqg0Q=;
	h=From:To:Cc:Subject:Date:From;
	b=N7wOeWfNFJ1SeWiKk+cAW/43kh5X4RTcseKgUBBaK7HVu8FeyNgcglzNeEXM2iNbt
	 /ER/FBSdTbD8zxzkp1m6hGF1ZbEtJSt7LAvN2RjY2ZHhsrsNdnZHICJU+dntMNj7Kt
	 +bLM6GbahqHupXQ7NAX9OsINU4u47fu2bsiiphcj6GOc8UdGxxor1JYAuTz7gx6rcs
	 FhgUs3L3O5eFGUyU/cWIHpOxgcVw+mLwH1L/2Aek4/sHOodoDgoCWjByU2tar/oc/z
	 aRKNv5zBHnxLe7jwzcZLyvci/++PNsc4zB8TtQyQPxkFeSjQZOUqTewp7WxDy9MBBR
	 MeDQYGadFcmHg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] riscv: dts: starfive: add Milkv Mars board device tree
Date: Wed, 31 Jan 2024 21:25:54 +0800
Message-ID: <20240131132600.4067-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_053853_920741_3A7925F5 
X-CRM114-Status: GOOD (  10.47  )
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

Since v2:
 - add a common board file which can be used by vf2 and mars

Since v1:
 - add two new patches which add "cpus" label and board dt-binding
 - adopt Krzysztof's suggestions, thanks

Jisheng Zhang (6):
  riscv: dts: starfive: add 'cpus' label to jh7110 and jh7100 soc dtsi
  dt-bindings: riscv: starfive: add Milkv Mars board
  riscv: dts: starfive: visionfive 2: update sound and codec dt node
    name
  riscv: dts: starfive: visionfive 2: use cpus label for timebase freq
  riscv: dts: starfive: introduce a common board dtsi for jh7110 based
    boards
  riscv: dts: starfive: add Milkv Mars board device tree

 .../devicetree/bindings/riscv/starfive.yaml   |   1 +
 arch/riscv/boot/dts/starfive/Makefile         |   1 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |   2 +-
 .../boot/dts/starfive/jh7110-milkv-mars.dts   |  35 +
 .../jh7110-starfive-visionfive-2.dtsi         | 600 +----------------
 .../jh7110-visionfive2-mars-common.dtsi       | 617 ++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   2 +-
 7 files changed, 657 insertions(+), 601 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-visionfive2-mars-common.dtsi

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
