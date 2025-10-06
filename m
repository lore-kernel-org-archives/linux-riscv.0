Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92822CCA472
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6qaP5gwguHqpGzSPMiqug4kxXPc9sHSerCy2yEh76og=; b=bVdXUNlD//DMs+
	VTUJzNO4rZEkpRwKNbnzwsf47TSaCFmwbmhdoLwnu5SXJ9ojVteuOwYSLBS9pCHPavJIJJh9yu74I
	Uyu3hijJ5XqppZzt1pistgzbewHYwuKTBXklSGA1XEMTPXws5eFuwM/ShZKmjRMXjJCqElh9s1yi4
	osKkeJCZ0xVyr5JZBlxZDMg1VI0TvKtgHU8MCSb4b9+P3bzwWV/QXGkTc5ZDaYLLmlmNatsFqqsPc
	gxp9VYXy6Exytjj13DvoD9byU2kCZkrN1L18iisfiE9dBLWHrM1m1q6vyGUajaQ+NWeB0jNlZ5uy7
	XhScpVYxiV3nD//FhDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seW-00000000pdM-2Vca;
	Mon, 06 Oct 2025 21:21:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seV-00000000pck-2vZU
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 21:21:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6A2760365;
	Mon,  6 Oct 2025 21:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB735C4CEF5;
	Mon,  6 Oct 2025 21:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759785710;
	bh=7iJ32YGIikjrp2pA/xgAb9df77t5CNdRAnigY3veHVs=;
	h=From:Subject:Date:To:Cc:From;
	b=a51IRUo+m3fzUtlIqyu7hTsuI0Kotsc4avj1QeyZpLfi8el1ganISGiFgKnzlB5nh
	 CagOQrcM+9xfVqCjukG9xSh8Y1GjtuJKxjRNpXJ7+jOKbs7kzg6qA3/Vfx4beQVRVU
	 AuMQWhVYDp/uCQcs06JR20kYcLS8Nkqv2acD/Gx93gwE7853q8odmuhV8NKC26n0pu
	 hnBExmqVdHC7DZfTo3wA7fNiBWBoxwHZ5ISVq2DbhDTBbSjfuAR8wJlFbyOaeXLE8/
	 Ui0rXaBIrOU58Ib7R1+F3dsStYCyQTucV+FBhVAB19fCbtkFUmitkpBygT1R6/EiMo
	 1hucKPNv2hjzg==
From: Drew Fustini <fustini@kernel.org>
Subject: [PATCH v2 0/8] RISC-V: Add support for Tenstorrent Blackhole SoC
Date: Mon, 06 Oct 2025 14:21:40 -0700
Message-Id: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOUy5GgC/x3MQQqAIBBA0avIrBuwARd2lWhROuZsLFQiEO+et
 Hzw+Q0KZ+ECi2qQ+ZEiVxqgSYGLezoZxQ8DaTLaksVa8Yjoa8HAZLzTs3E+wOjvzEHe/7VuvX+
 MKOzZWwAAAA==
X-Change-ID: 20250929-tt-bh-dts-fe25dc015cdf
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@oss.tenstorrent.com>
X-Mailer: b4 0.14.2
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

Enable support for the Tenstorrent Blackhole SoC in the Blackhole P100
and P150 PCIe cards [1]. The Blackhole SoC contains four RISC-V CPU
tiles consisting of 4x SiFive X280 cores. Each tile is capable of
running an instance of Linux.

There is a public Linux-on-Blackhole project [2] that enables users to
boot Linux on Blackhole PCIe cards. A boot script on the PCIe host
loads the kernel image and the rootfs into DDR memory and then takes
the X280 cores out of reset.

All the low-level SoC initialization is handled by firmware [3] running
on a separate management core in the Blackhole SoC. Linux on the X280
cores does not need to deal with any clocks, reset, etc. The management
core firmware also controls the PCIe EP functionality. The tt-kmd Linux
kernel driver [4] on the PCIe host allows the host to interact with the
DDR memory on the Blackhole PCIe card along with other tiles in the SoC
accessible from the NoC [5].

There is a virtual UART implemented in OpenSBI [6] that allows a console
program on the PCIe host to communicate through shared memory with Linux
running on the Blackhole. This does require CONFIG_HVC_RISCV_SBI which
is currently hidden behind CONFIG_NONPORTABLE. I would like Blackhole to
work with defconfig, so I'm looking into possible ways of solving the
issue that caused HVC SBI to be guarded by NONPORTABLE [7].

The public Linux-on-Blackhole project does also make use of virtio to
provide networking and storage. However, this relies on changes in our
downstream kernel branch [8], so I've removed those dt nodes from this
upstream dts series. We hope to eventually leverage the virtio-msg spec
to upstream the virtio functionality, too.

I have also dropped the bootargs from this series. Instead, I will add
the ability to fixup the dtb to the boot script on the host [9]. It does
need 'console=hvc0' to ensure the full boot output appears in the
console program on the host. I also dropped the pmem node from this
series as I don't see any upstream users of pmem. I have been using pmem
for the rootfs, so I'll update the boot script to add the pmem node and
amend 'root=/dev/pmem0' in bootargs.

TL;DR:
The goal for upstreaming this rather minimal device tree in this series
is to make it possible to boot mainline kernel builds. I attended the
recent KernelCI workshop, and there are not currently many RISC-V boards
doing boot tests. I think the Blackhole cards could help improve the
situation once Blackhole is able to boot important trees like mainline
and next. The HVC SBI console is sufficient for boot testing.

[1] https://tenstorrent.com/hardware/blackhole
[2] https://github.com/tenstorrent/tt-bh-linux
[3] https://github.com/tenstorrent/tt-zephyr-platforms
[4] https://github.com/tenstorrent/tt-kmd
[5] https://github.com/tenstorrent/tt-isa-documentation/blob/main/BlackholeA0/
[6] https://github.com/tenstorrent/opensbi/
[7] https://lore.kernel.org/all/20240214153429.16484-2-palmer@rivosinc.com/
[8] https://github.com/tenstorrent/linux/
[9] https://github.com/tenstorrent/tt-bh-linux/blob/dfustini/kernelci/boot.py

Changes in v2:
 - Remove '-a0' from compatible strings as Rob advised silicon revisions
   are not normally included in compatibles
 - Add ARCH_TENSTORRENT to defconfig per Conor's suggestion
 - Fix unit address for memory device tree node
 - Remove legacy 'riscv,isa' property from cpu dt nodes
 - Remove 'riscv,cboz-block-size' as the cores do not support Zicboz
 - Link to v1: https://lore.kernel.org/linux-riscv/20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com/

To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
To: Anup Patel <anup@brainfault.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Joel Stanley <jms@oss.tenstorrent.com>
To: Joel Stanley <joel@jms.id.au>
To: Michael Neuling <mikey@neuling.org>
To: Nicholas Piggin <npiggin@gmail.com>
To: Michael Ellerman <mpe@kernel.org>
To: Andy Gross <agross@kernel.org>
To: Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org

Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
Drew Fustini (8):
      dt-bindings: vendor-prefixes: Add Tenstorrent AI ULC
      dt-bindings: riscv: Add Tenstorrent Blackhole compatible
      dt-bindings: riscv: cpus: Add SiFive X280 compatible
      dt-bindings: timers: Add Tenstorrent Blackhole compatible
      dt-bindings: interrupt-controller: Add Tenstorrent Blackhole compatible
      riscv: dts: Add Tenstorrent Blackhole SoC PCIe cards
      riscv: Kconfig.socs: Add ARCH_TENSTORRENT for Tenstorrent SoCs
      riscv: defconfig: Enable Tenstorrent SoCs

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/tenstorrent.yaml     |  28 ++++++
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   9 ++
 arch/riscv/Kconfig.socs                            |   8 ++
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/tenstorrent/Makefile           |   2 +
 arch/riscv/boot/dts/tenstorrent/blackhole-card.dts |  14 +++
 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi     | 104 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 12 files changed, 172 insertions(+)
---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20250929-tt-bh-dts-fe25dc015cdf

Best regards,
-- 
Drew Fustini <dfustini@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
