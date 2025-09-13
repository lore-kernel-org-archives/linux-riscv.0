Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F42BCAC587
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 21:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VCqB/RVJmPZzcOI4K+JntMspIv3ZnCgYguulVB1jlc4=; b=NhZJeJhdkke0nC
	8BOe+ocn98ODL0AnZAwNs8Q6PAT5NMFPobtnHEklIhiIIjZ/DUHQ3GLwUSpz2gHXOI18tUeqO4Wb9
	P99ycsxyhBpSkKJCLXASB963jv/lkM/YLGsKi91fvklDstxUxnyQZ13T2bstYlWTq/0TpiJBsr1/g
	ToH7msh3dMg4NLpudI+t05ALZzrqaJlHi+6aUHBRN2VRCnFTF2kfIyiHF6kg/cf8iXosg1kUXf2Gw
	35iRKfbP7RCsH4Yh6QQM5oWEBSAqf7/wW2jl42CaqyQSmjobDw7P47tSDL4nGl1FXvM0YRLyXVcf5
	sKHchCQerrUk8+3C+xqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpq-0000000GM6Y-0Ktc;
	Sat, 13 Sep 2025 21:31:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpo-0000000GM5o-3TPl
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 21:31:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73DBE60145;
	Sat, 13 Sep 2025 21:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8639BC4CEEB;
	Sat, 13 Sep 2025 21:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757799063;
	bh=yUB0oiV+jJoMJE08L8bBpTc+q1SYI6i7A8rySQva7O0=;
	h=From:Subject:Date:To:Cc:From;
	b=e6UTUvixqFYIx3PHG7oc40893xzdel8KZkNh+FEfkvTW8VYf94VFUb2Wvc+vzAzD7
	 NJRTBw5Iht42v8LtwpddLYLibKRvaMDy3WrX+duKLJ6SX/VX/83GwAiK7UKTycmXal
	 T77kMffyyVCaXs+yMJhAiPpSCqlz8fIkvHkhROrmggTB9x1XDe1VKrU2u6X8TpBBG1
	 usfXQEMBmcCNTfhJdzP90FWXJtPj7Nf+737wiOS52pnRhjQkuw89WQQWJJwvar+8UN
	 x2KNSjDIonNcraqKz02PFiJQzNyDxk1QsN0vBpp7vSbIMW1RnLviRq7Zofq6PVVA0s
	 JVTKxxqon3dLg==
From: Drew Fustini <fustini@kernel.org>
Subject: [PATCH 0/7] RISC-V: Add support for Tenstorrent Blackhole SoC
Date: Sat, 13 Sep 2025 14:30:59 -0700
Message-Id: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJPixWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0Mj3ZIS3aQM3ZSSYt0U86TkZFMD80RTUzMloPqCotS0zAqwWdGxtbU
 ABTUqKlsAAAA=
X-Change-ID: 20250912-tt-bh-dts-d7bcc507a556
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
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

Enable support for the Tenstorrent Blackhole A0 SoC in the Blackhole
P100 and P150 PCIe cards [1]. The Blackhole SoC contains four RISC-V
CPU tiles consisting of 4x SiFive X280 cores. Each tile is capable of
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

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Drew Fustini (7):
      dt-bindings: vendor-prefixes: Add Tenstorrent AI ULC
      dt-bindings: riscv: Add Tenstorrent Blackhole compatible
      dt-bindings: riscv: cpus: Add SiFive X280 compatible
      dt-bindings: timers: Add Tenstorrent Blackhole compatible
      dt-bindings: interrupt-controller: Add Tenstorrent Blackhole compatible
      riscv: dts: Add Tenstorrent Blackhole A0 SoC PCIe cards
      riscv: Kconfig.socs: Add ARCH_TENSTORRENT for Tenstorrent SoCs

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/tenstorrent.yaml     |  28 ++++++
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   9 ++
 arch/riscv/Kconfig.socs                            |   8 ++
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/tenstorrent/Makefile           |   2 +
 .../boot/dts/tenstorrent/blackhole-a0-card.dts     |  14 +++
 arch/riscv/boot/dts/tenstorrent/blackhole-a0.dtsi  | 112 +++++++++++++++++++++
 11 files changed, 179 insertions(+)
---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250912-tt-bh-dts-d7bcc507a556

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
