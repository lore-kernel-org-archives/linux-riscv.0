Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBCEC10DC1
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WWRrjHnHfd66cMbE87R3XQFVmZ97TyO9PqwtZdK69fI=; b=TV+gqtaQAwiD4L
	n4qt+rnifxm1kqg9VIAALNS5+wtCcLQKPBN/VtlCwsHe5/L1GdnptIxN6aKP0Ne3ART3l9f0VSmUH
	/faDnTNrIE/igd01wmqUXidrGULG6K0pUbsCjfAcgR+tATAEfTcuqkYPGCbkIR9HAB4kyMHADyekT
	ZnXVvaZeca+EXpn/Brknw6+dJI2fvx9DbUMvmFjaOl/wdkbxs4anEP4Dc+6jSMWctUjVOVx+Ocypb
	2KFDKsXK0N/q5TyqxHiqaabeQQHiRVgt5mgBssXIHVF+efrQYoyX/rRy2ms3gDSYyLixXs11qNKpk
	Dm3sDWgVmPKkSydct2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9SCL-00FrVZ-1V;
	Sat, 02 Dec 2023 15:46:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9SCI-00FrUe-0f
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 15:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 75A92B81C1B;
	Sat,  2 Dec 2023 15:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7A5C433C8;
	Sat,  2 Dec 2023 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701531981;
	bh=1EqA9rvqYVRln0P1uLXrqlcy9RJ9TXHPL4bOBzuuWnI=;
	h=From:To:Cc:Subject:Date:From;
	b=lkH1vk7xmSD9/+2gTsQUPCBnMNa+96XkPFIFGUts5ED3+qCbcIyalDundPG5UbapV
	 jRS7/DujAccErlR6gcF+GDlD5uxELE30r4byHdmWtWdGqC0UzmOnWKB9nMfEux5AAb
	 7Pt62tcvmjvhdUiLRWzSW13QTQqkgCKgxBOSGe3o98OiOVmeVWo5Kahqpj2GPoibEM
	 mnMQ/uCvgn4AtF64DRLyzvoSo79Ahm+NEbRMKTFeBz6QqLnQ1Y9qvVrl+MCp9s9OWY
	 6RHCilnCQKbGrYAd0LuLHxhw8itRrC4mCh2eUmS0+ruggIEyZ/dAoSl4SZnnr+UBzm
	 HXPz806s9oMRg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] riscv: dts: starfive: add Milkv Mars board device tree 
Date: Sat,  2 Dec 2023 23:33:50 +0800
Message-Id: <20231202153353.635-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_074626_402675_41B016A6 
X-CRM114-Status: GOOD (  11.83  )
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
patch3 adds the devicetree file describing the currently supported
features:
Namely PMIC, UART, I2C, GPIO, SD card, QSPI Flash, eMMC and Ethernet.

Since v1:
 - add two new patches which add "cpus" label and board dt-binding
 - adopt Krzysztof's suggestions, thanks

Hi Conor,

I see you have sent a patch which moves the timebase-frequency property
to soc dtsi, but this series doesn't rebase on that. I can update it
once your patch is merged.

Thanks

Jisheng Zhang (3):
  riscv: dts: starfive: add 'cpus' label to jh7110 and jh7100 soc dtsi
  dt-bindings: riscv: starfive: add Milkv Mars board
  riscv: dts: starfive: add Milkv Mars board device tree

 .../devicetree/bindings/riscv/starfive.yaml   |   1 +
 arch/riscv/boot/dts/starfive/Makefile         |   1 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |   2 +-
 .../boot/dts/starfive/jh7110-milkv-mars.dts   | 637 ++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   2 +-
 5 files changed, 641 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
