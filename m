Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B50C8303C
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:MIME-Version:
	Message-Id:Date:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:List-Owner; bh=JbV4nV89IxSeNauRnim7YxPW10iC+tWkfUI8BzFN8bU=; b=nI
	+0gOu4EAJTA/cEOlE2PUlFqIe42KQQ4DQxYYlRC06lLoJ9alp/DzuYxTOf9OPwuHp3ZTQRz4idSj7
	HbQZJp5BKjzOsXPAihOktIBkatESxWdm1ukneJrLhHtuIUrsG2Z54V7zaGxugOFvZQjV2QYOE8tfb
	m1WQmKfNvmsuuI6XkVMJOt1euKeuucdt5NA1er5Vte+sy+LDvzuu0vcZS10M74t0cR9DXPaBijHNF
	7TKncw+txSfEfqcKrNvUMb2LyRC/nTKTaxw/PPisNp9yLAwUPtSC1A/jp9MWdwJ6RkfrUZ21XWGh9
	ZBGfBzaxQGArW04zjeQlweGn4gExLyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzK-00000006MiC-3Iih;
	Tue, 01 Jul 2025 18:45:50 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQo-00000005xlc-3RuI
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 16:02:06 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250701160158euoutp01b00e725551c6cfe60cc641dbf232ed42~OLAgLe9MU0451404514euoutp01X
	for <linux-riscv@lists.infradead.org>; Tue,  1 Jul 2025 16:01:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250701160158euoutp01b00e725551c6cfe60cc641dbf232ed42~OLAgLe9MU0451404514euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751385718;
	bh=2JY0hmDEKtxAbt+YyzeRDCtSLspXLG6myRWdwEK6X+g=;
	h=From:Subject:Date:To:Cc:References:From;
	b=PZM++IsE4GHX9BMUPNhalSX2gbdxGLy+F1pY9LJ6rkuRLtX5IW3V7rsqol4GbsM7L
	 HnSZO7rA5U6XRsUjYKKqjCkyrtG/Ml2Ml0vYTbhkExEz9USsLV+k78tP2eNg1DTWo+
	 qLZRWybZIsEPWgyksUpsr2tnIVbYEsAf1DQFhJDg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250701160157eucas1p1b6dfd8bf3859b07bff0cfcd171d7c939~OLAfhFj9_1816518165eucas1p14;
	Tue,  1 Jul 2025 16:01:57 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701160156eusmtip1ef59cffc0013f5cb7dd114fbf1b32962~OLAeR_eBl1730317303eusmtip1I;
	Tue,  1 Jul 2025 16:01:56 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v6 0/8] Rust Abstractions for PWM subsystem with TH1520 PWM
 driver
Date: Tue, 01 Jul 2025 18:01:37 +0200
Message-Id: <20250701-rust-next-pwm-working-fan-for-sending-v6-0-2710932f6f6b@samsung.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGIGZGgC/5XOTW7DIBCG4atErEsFAxi7q96j6gLz46DKEIHjp
	Ip8946zqStv3OU3i+edB6m+RF/J2+lBip9jjTnhaF5OxJ5NGjyNDjcBBoopkLRc60STv0/0chv
	pLZevmAYaTKIhF1p9cutWCowDx3veCYLWpfgQ78/Oxyfuc6xTLt/P7MzX638LM6eM9g4jinUyB
	P1ezVivaXi1eSRrY4Zft+HsqAvoaiU8dEoFztneFVtXH3UFutxa00ptm9CFvSu3bnvUleiaxkA
	boG9ca/au2rggjroKXWYNCI0Pg/B/3WVZfgAxeRJvPAIAAA==
X-Change-ID: 20250524-rust-next-pwm-working-fan-for-sending-552ad2d1b193
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Benno Lossin <lossin@kernel.org>,  Michael
	Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Benno
	Lossin <lossin@kernel.org>,  Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,  Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250701160157eucas1p1b6dfd8bf3859b07bff0cfcd171d7c939
X-Msg-Generator: CA
X-RootMTR: 20250701160157eucas1p1b6dfd8bf3859b07bff0cfcd171d7c939
X-EPHeader: CA
X-CMS-RootMailID: 20250701160157eucas1p1b6dfd8bf3859b07bff0cfcd171d7c939
References: <CGME20250701160157eucas1p1b6dfd8bf3859b07bff0cfcd171d7c939@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_090204_253376_0BEBCC5C 
X-CRM114-Status: GOOD (  29.47  )
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
 - Expose PWM_WFHWSIZE in public header for bindgen.
 - Rust PWM Abstractions: The new safe abstraction layer.
 - TH1520 PWM Driver: A new Rust driver for the TH1520 SoC, built on
   top of the new abstractions.
 - Device Tree Bindings & Nodes: The remaining patches add the necessary
   DT bindings and nodes for the TH1520 PWM controller, and the PWM fan
   configuration for the Lichee Pi 4A board.

Testing:
Tested on the TH1520 SoC. The fan works correctly. The duty/period
calculations are correct. Fan starts slow when the chip is not hot and
gradually increases the speed when PVT reports higher temperatures.

The patches are based on mainline, with some dependencies which are not
merged yet - platform Io support [1].

Reference repository with all the patches together can be found on
github [2].

[1] - https://lore.kernel.org/rust-for-linux/20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com/
[2] - https://github.com/mwilczy/linux/commits/rust-next-pwm-working-fan-for-sending-v10/

---
Changes in v6:
 - Re-based on top of linux-next, dropped two already accepted commits.
 - After re-basing the IoMem dependent patchset stopped working,
   reworked it to use similar API like the PCI subsystem (I think it
   will end up the same). Re-worked the driver for it as well.
 - Remove the apply and get_state callbacks, amd most of the State as
   well, as the old way of implementing drivers should not be possible
   in Rust. Left only enabled(), since it's useful for my driver.
 - Removed the public set_drvdata() method from pwm::Chip
 - Moved WFHWSIZE to the public include/linux/pwm.h header and renamed it
   to PWM_WFHWSIZE, allowing bindgen to create safe FFI bindings.
 - Corrected the ns_to_cycles integer calculation in the TH1520 driver to
   handle overflow correctly.
 - Updated the Kconfig entry for the TH1520 driver to select the Rust
   abstractions for a better user experience.

- Link to v5: https://lore.kernel.org/r/20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com

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
Michal Wilczynski (8):
      pwm: Expose PWM_WFHWSIZE in public header
      rust: pwm: Add Kconfig and basic data structures
      rust: pwm: Add core 'Device' and 'Chip' object wrappers
      rust: pwm: Add driver operations trait and registration support
      pwm: Add Rust driver for T-HEAD TH1520 SoC
      dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM controller
      riscv: dts: thead: Add PWM controller node
      riscv: dts: thead: Add PWM fan and thermal control

 .../devicetree/bindings/pwm/thead,th1520-pwm.yaml  |  48 ++
 MAINTAINERS                                        |   8 +
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  67 ++
 arch/riscv/boot/dts/thead/th1520.dtsi              |   7 +
 drivers/pwm/Kconfig                                |  24 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/core.c                                 |  26 +-
 drivers/pwm/pwm_th1520.rs                          | 338 +++++++++
 include/linux/pwm.h                                |   2 +
 rust/bindings/bindings_helper.h                    |   1 +
 rust/helpers/helpers.c                             |   1 +
 rust/helpers/pwm.c                                 |  20 +
 rust/kernel/lib.rs                                 |   2 +
 rust/kernel/pwm.rs                                 | 809 +++++++++++++++++++++
 14 files changed, 1340 insertions(+), 14 deletions(-)
---
base-commit: d52ca12c4915f3ee67aeaa5ad9e3597a40e4620e
change-id: 20250524-rust-next-pwm-working-fan-for-sending-552ad2d1b193

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
