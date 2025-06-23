Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D880C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:MIME-Version:
	Message-Id:Date:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:List-Owner; bh=bTQErd2fED7+XgLOf0VjEqdK4++f+03+AeTbSVy1rzU=; b=VP
	qVZ1eXpr6e6T4O6e40Ry31pR0i4U/4QcMCN52iJv/3F4Rrrfm4dftTI7QSC7x3buHNWFNRoJ/Y7YU
	P7IXOto3jE2R2QQ0sTMsJYIhULTlFP7ghTRQpUaKM9BSzw4QPrl3jQI2SpnKWgFqXuwncFAkkoxlw
	h8CzNPWar6Ts4G4bq/CBjEDVCuKo+/noPhboozAsKx1LT60gaNWh2kZTyaskkTXvABKeI/8fEi1fJ
	BJeJhmz7zlvxUpacsNI9zCOJwp4a8BzT3lrexbFopEoZO9yHAcAcc3D82S7hXQEltc+YQmBd5BCCD
	p3s+HMbE9VZQyQ2hocmYGsZIISMCzVSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZj-00000004FkU-1kyw;
	Tue, 24 Jun 2025 00:31:47 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlbO-00000003e8N-0VZO
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 18:09:10 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250623180857euoutp02520e5a26c3ac4ce9055b5b355f63003f~LvlGTJVyT2670826708euoutp02H
	for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 18:08:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250623180857euoutp02520e5a26c3ac4ce9055b5b355f63003f~LvlGTJVyT2670826708euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750702137;
	bh=gnd9AgBLlzI9gRNy4DOqDUc3dGypeF45QUvYRkKrTAw=;
	h=From:Subject:Date:To:Cc:References:From;
	b=jLJfdr72ggBJPhW5buoCnL6kTDBrdxJ5v2DO7UMHggWtrZzzoZMdsmKEVR4F4C7Y7
	 FP7hYK6KjHuOPxn3/TOFh5zyL3Gb3d4ypUNzDejkv/sI/7oiId8aEUt2vdvI0YOmtq
	 I0hnLCU57uwRb8k6N2jZMs3x46rI/PjRIdT2yjIY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250623180857eucas1p2e3e9ddad89b5f055af801cb97dbfc7cc~LvlFplo4O0102201022eucas1p20;
	Mon, 23 Jun 2025 18:08:57 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250623180855eusmtip1afa4b6d035233e5b46c8bb061eb13572~LvlEe3H7R0652006520eusmtip1r;
	Mon, 23 Jun 2025 18:08:55 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v5 0/9] Rust Abstractions for PWM subsystem with TH1520 PWM
 driver
Date: Mon, 23 Jun 2025 20:08:48 +0200
Message-Id: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADCYWWgC/5XNvW7DIBSG4VuJmHsiOAb/ZMp9VB0wcBxUGSJwn
	FSR7704S1JlccfvG573zrJL3mV22N1ZcrPPPoYy1MeOmZMOgwNvy2bIUXGFEtIlTxDcbYLzdYR
	rTN8+DEA6AMUE2QW7bqVQW7SiF13FinVOjvzt0fn8Kvvk8xTTzyM7i/X9b2EWwKG3JaJ4J4maY
	9ZjvoRhb+LI1saMT7cWfKuLxW1U5bBTioTg72716jZb3aq4whjdysbU1NG7K1/ddqsri6trjS1
	hX9tW/3WXZfkF0ZwkhOQBAAA=
X-Change-ID: 20250524-rust-next-pwm-working-fan-for-sending-552ad2d1b193
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>,  Guo
	Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>,  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Alexandre
	Ghiti <alex@ghiti.fr>,  Marek Szyprowski <m.szyprowski@samsung.com>,  Benno
	Lossin <lossin@kernel.org>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,  Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250623180857eucas1p2e3e9ddad89b5f055af801cb97dbfc7cc
X-Msg-Generator: CA
X-RootMTR: 20250623180857eucas1p2e3e9ddad89b5f055af801cb97dbfc7cc
X-EPHeader: CA
X-CMS-RootMailID: 20250623180857eucas1p2e3e9ddad89b5f055af801cb97dbfc7cc
References: <CGME20250623180857eucas1p2e3e9ddad89b5f055af801cb97dbfc7cc@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_110906_912828_5941E127 
X-CRM114-Status: GOOD (  26.56  )
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

This patch series introduces Rust support for the T-HEAD TH1520 PWM
controller and demonstrates its use for fan control on the Sipeed Lichee
Pi 4A board.

The primary goal of this patch series is to introduce a basic set of
Rust abstractions for the Linux PWM subsystem. As a first user and
practical demonstration of these abstractions, the series also provides
a functional PWM driver for the T-HEAD TH1520 SoC. This allows control
of its PWM channels and ultimately enables temperature controlled fan
support for the Lichee Pi 4A board. This work aims to explore the use of
Rust for PWM drivers and lay a foundation for potential future
Rust based PWM drivers.

The core of this series is a new rust/kernel/pwm.rs module that provides
abstractions for writing PWM chip provider drivers in Rust. This has
been significantly reworked from v1 based on extensive feedback. The key
features of the new abstraction layer include:

 - Ownership and Lifetime Management: The pwm::Chip wrapper is managed
   by ARef, correctly tying its lifetime to its embedded struct device
   reference counter. Chip registration is handled by a pwm::Registration
   RAII guard, which guarantees that pwmchip_add is always paired with
   pwmchip_remove, preventing resource leaks.

 - Modern and Safe API: The PwmOps trait is now based on the modern
   waveform API (round_waveform_tohw, write_waveform, etc.) as recommended
   by the subsystem maintainer. It is generic over a driver's
   hardware specific data structure, moving all unsafe serialization logic
   into the abstraction layer and allowing drivers to be written in 100%
   safe Rust.

 - Ergonomics: The API provides safe, idiomatic wrappers for other PWM
   types (State, Args, Device, etc.) and uses standard kernel error
   handling patterns.

The series is structured as follows:
 - Rust PWM Abstractions: The new safe abstraction layer.
 - TH1520 PWM Driver: A new Rust driver for the TH1520 SoC, built on
   top of the new abstractions.
 - Clock Fix: A necessary fix to the TH1520 clock driver to ensure bus
   clocks remain enabled.
 - Device Tree Bindings & Nodes: The remaining patches add the necessary
   DT bindings and nodes for the TH1520 PWM controller, a thermal
   sensor, and the PWM fan configuration for the Lichee Pi 4A board.

Testing:
Tested on the TH1520 SoC. The fan works correctly. The duty/period
calculations are correct. Fan starts slow when the chip is not hot and
gradually increases the speed when PVT reports higher temperatures.

The patches are based on mainline, with some dependencies which are not
merged yet - platform Io support [1].

Reference repository with all the patches together can be found on
github [2].

[1] - https://lore.kernel.org/rust-for-linux/20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com/
[2] - https://github.com/mwilczy/linux/commits/rust-next-pwm-working-fan-for-sending-v9/

---
Changes in v5:
- Reworked `pwm::Chip` creation to take driver data directly, which
  allowed making the `chip.drvdata()` accessor infallible
- added missing `pwm.c` file lost during the commit split (sorry !)
- Link to v4: https://lore.kernel.org/r/20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com

Changes in v4:
 - Reworked the pwm::Registration API to use the devres framework,
   addressing lifetime issue.
 - Corrected the PwmOps trait and its callbacks to use immutable references
   (&Chip, &Device) for improved safety.
 - Applied various code style and naming cleanups based on feedback

- Link to v3: https://lore.kernel.org/r/20250617-rust-next-pwm-working-fan-for-sending-v3-0-1cca847c6f9f@samsung.com

Changes in v3:
 - Addressed feedback from Uwe by making multiple changes to the TH1520
   driver and the abstraction layer.
 - Split the core PWM abstractions into three focused commits to ease
   review per Benno request.
 - Confirmed the driver now works correctly with CONFIG_PWM_DEBUG enabled
   by implementing the full waveform API, which correctly reads the
   hardware state.
 - Refactored the Rust code to build cleanly with
   CONFIG_RUST_BUILD_ASSERT_ALLOW=n, primarily by using the try_* family of
   functions for IoMem access.
 - Included several cosmetic changes and cleanups to the abstractions
   per Miguel review.

- Link to v2: https://lore.kernel.org/r/20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com

Changes in v2:
 - Reworked the PWM abstraction layer based on extensive feedback.
 - Replaced initial devm allocation with a proper ARef<Chip> lifetime model
   using AlwaysRefCounted.
 - Implemented a Registration RAII guard to ensure safe chip add/remove.
 - Migrated the PwmOps trait from the legacy .apply callback to the modern
   waveform API.
 - Refactored the TH1520 driver to use the new, safer abstractions.
 - Added a patch to mark essential bus clocks as CLK_IGNORE_UNUSED to fix
   boot hangs when the PWM and thermal sensors are enabled.
- Link to v1: https://lore.kernel.org/r/20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com

---
Michal Wilczynski (9):
      rust: pwm: Add Kconfig and basic data structures
      rust: pwm: Add core 'Device' and 'Chip' object wrappers
      rust: pwm: Add driver operations trait and registration support
      pwm: Add Rust driver for T-HEAD TH1520 SoC
      clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED
      dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM controller
      riscv: dts: thead: Add PWM controller node
      riscv: dts: thead: Add PVT node
      riscv: dts: thead: Add PWM fan and thermal control

 .../devicetree/bindings/pwm/thead,th1520-pwm.yaml  |  48 ++
 MAINTAINERS                                        |   8 +
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  67 ++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  18 +
 drivers/clk/thead/clk-th1520-ap.c                  |   5 +-
 drivers/pwm/Kconfig                                |  23 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm_th1520.rs                          | 318 ++++++++
 rust/bindings/bindings_helper.h                    |   1 +
 rust/helpers/helpers.c                             |   1 +
 rust/helpers/pwm.c                                 |  20 +
 rust/kernel/lib.rs                                 |   2 +
 rust/kernel/pwm.rs                                 | 890 +++++++++++++++++++++
 13 files changed, 1400 insertions(+), 2 deletions(-)
---
base-commit: 79b01ff21368605a62b76535ab1ab5f1f726de60
change-id: 20250524-rust-next-pwm-working-fan-for-sending-552ad2d1b193

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
