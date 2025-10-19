Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6476CCD195
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VB9aAWeigYAsYkrE5kGqKiDuicGr2IIrnvC4ldzWkvI=; b=E78a7uTIAPXxFr
	XuvE1Dv17BLGCT54YQFtXflrKwBvWhbI6rbDa7/pcxgCfPqVmBoxPVhkpmZFXnOb4+WR0TLKL+S+R
	nAz5b+JWEszISEFOew68qA9hM1EwNF9gC1DykqzFYT2ikVPByDl1CLog8iJCwBnsaUBPg0ukg9p96
	X19Z9H0NFlBhKypxaTRYOGrt04QEOa/aUIDgV325Lacd1CPRtndugYFSQgsAUQOYD2FCWcSzmUVhN
	hyWrYdOY4oyxcjpuRaIOotJ0seUmpvEHexsBW+GcV3MnwqHbhfMPv2t7jr9rGOpU315yp5q42PnfB
	t9qIWivb76GEM2Nd4/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAX8O-0000000BFPm-0wUU;
	Sun, 19 Oct 2025 17:23:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAX8M-0000000BFOr-48Sy
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 17:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 165BF60239;
	Sun, 19 Oct 2025 17:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D43DC4CEE7;
	Sun, 19 Oct 2025 17:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760894619;
	bh=YjwgU07lTttycLobcPqPwzVy5bTSFOQ+Tt11e6IE6kI=;
	h=Date:From:To:Cc:Subject:From;
	b=N+gJzz3ORVwoPCxEgwHELlWleaV/eXlwHdSDnoyEk7zopJVpmaxB1E5YGu6Jus3+h
	 9AJmubMDFHMChgLfXt8EWfNcDiqmGO2Kq8EB31+ApECRdM6uYTpQtBzo5nly75ki2h
	 adHYWL/VaYc2hohr0YtdWNxLWYHLjSyL0tWxKxDFEhBzBChrPjN6NjMTRxwBfUMsip
	 P55eJGfSzy9PYd87YFuEE4/w+hdAGSl1M/9OL75GYYQJLzpcuVueuCacaGK4NCjf/f
	 zioopatQIHDhffQmgmUeyVTZGdVihaKhHxQjn69e/xal7azX95SVU1lisSCLpSpvWu
	 VzMwt7LscrluQ==
Date: Sun, 19 Oct 2025 10:23:37 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Joel Stanley <joel@jms.id.au>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Nicholas Piggin <npiggin@oss.tenstorrent.com>,
	Michael Neuling <mikey@neuling.org>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Paul Walmsley <pjw@kernel.org>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Tenstorrent Devicetree for v6.19
Message-ID: <aPUemXdOFZEdkayE@x1>
MIME-Version: 1.0
Content-Disposition: inline
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

Hi Arnd,

Please pull these changes which add Tenstorrent as a vendor and enable
support for Blackhole. It adds the appropriate entries in MAINTAINERS.
The changes all come from a single series [1] posted by myself. Joel
Stanley has reviewed and tested all the patches. Rob acked or reviewed
all the bindings patches. W=1 dtbs_check and dt_binding_check produce
no warnings.

[1] https://lore.kernel.org/linux-riscv/20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com/

Thanks,
Drew

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git@github.com:tenstorrent/linux.git tags/tenstorrent-dt-for-v6.19

for you to fetch changes up to a71e6e8eea8ae2d624f097911f43357bba06d2a5:

  riscv: defconfig: Enable Tenstorrent SoCs (2025-10-18 10:44:15 -0700)

----------------------------------------------------------------
Tenstorrent device tree for v6.19

Add Tenstorrent as a vendor and enable support for the Blackhole SoC
in Blackhole P100 and P150 PCIe cards. The SoC contains four RISC-V
CPU tiles consisting of 4x SiFive X280 cores.

There is a virtual UART implemented in OpenSBI firmware that allows a
console program on the PCIe host to communicate through shared memory
with Linux running on the Blackhole card.

Link: https://github.com/tenstorrent/tt-bh-linux
Link: https://github.com/tenstorrent/opensbi/
Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
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
 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi     | 108 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 12 files changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 create mode 100644 arch/riscv/boot/dts/tenstorrent/Makefile
 create mode 100644 arch/riscv/boot/dts/tenstorrent/blackhole-card.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
