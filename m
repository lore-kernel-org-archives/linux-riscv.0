Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62757C7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:MIME-Version:
	Message-Id:Date:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:List-Owner; bh=4PMufLmYez69snA+CXQNd8E1JAr1d/hA+4bnTT4BK7I=; b=3x
	Qh4VB2XS4LG890oXHTMpILGxOKiSbBeGEb8cQdRuydcCbn8HZXZ6OR7EL+sNR7TnJvYL8vuCKm4A5
	JqjueL4KG2aeX9E0nFLFyGPac+3I40wskSy8gvCphotPySC8GwVCYYkqQFDzps+zcPfvC0W3qIbOl
	hCTJhfTSW+LZOssWIwYvJ72aC/UuhszfUMZQexIgnK8tLmyyjRacAorchB8NS+w+MT7PPGVeFlIt5
	ah9lLk6F9UKe8TbC0yb7p4QbY1z3YHmfFyvWjmmfOwHy0ACcBnw9npkcQfAcvViLf9QSv25/G9OYS
	1n2PPIoInFHdT+1QMyBpveH4yCduabog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRu3r-0000000AU9L-2rIz;
	Wed, 18 Jun 2025 14:46:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtg-0000000A7la-0cZw
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To;
	bh=fc+GYlLjyZRxXLbvFOQEzoq3VKRyClWD4SDvFfUQuOQ=; b=PyYXsvLfAKY43Q1xbUgcLDGmsJ
	jbkAhloR2mGdgfMMNxECEaHOXjEq0eiReIVPlVdgW1cXEJkUVWTtrh3Wq9MoGmeRjLnT0yZXFrv3R
	G32SbOQPkOjk7y8iovZIhj57wYQW3jlN5ICvcSNx1QTBgggk4i8EsUdDxqlY5Id5UaHxvsAYP1wCf
	XJyM9UqTGZ/f0eg0CmwQxNHGjpYCd8+jMV6nkkBGBoI1+sGftXr2AMqi2/wxhLHxYjJrBgi73sJxD
	nTWQoyvOFUfJ5RO1pn9Ja2LmI8OvvNEOZx3oX+bes520HD0CI//rn6hm/thvnpAwLfPDeWv7P8VPQ
	PKWn9aIg==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtd-00000004224-1YTJ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:28:07 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618122801euoutp01918b31596b75c3e120c5560c3945a2da~KIs-8OSZd2983429834euoutp01k
	for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 12:28:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618122801euoutp01918b31596b75c3e120c5560c3945a2da~KIs-8OSZd2983429834euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750249681;
	bh=fc+GYlLjyZRxXLbvFOQEzoq3VKRyClWD4SDvFfUQuOQ=;
	h=From:Subject:Date:To:Cc:References:From;
	b=eQ7+B7FY9Gib27C5tudsrlfIw3v9ANXSdUh564DxFY3KH/mMiSCsg+U97Jcmtt/ee
	 HOGyLXk54X48dQ0I0ueFhtwQ49XgXmznz4/GOjPtaZZ9maeFZixBi84hIzv9YUnqLd
	 NOp0NSlGxcLNdnL2tLWxwT2P+tiA9VX1ueOnoL0o=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250618122801eucas1p2f9ca464e9e5c8d954d5150500952aeed~KIs-TuZTH2073320733eucas1p2_;
	Wed, 18 Jun 2025 12:28:01 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250618122759eusmtip1d8e481002c5a1a4e34ed68e0f76b68fc~KIs_HaLXN2180621806eusmtip19;
	Wed, 18 Jun 2025 12:27:59 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v4 0/9] Rust Abstractions for PWM subsystem with TH1520 PWM
 driver
Date: Wed, 18 Jun 2025 14:27:33 +0200
Message-Id: <20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALWwUmgC/5XNuw6CMBiG4Vsxnf1NWyiIk/dhHEoP0Bha0nIyh
	Hu3sKhxwfH7huedUVDeqIAuhxl5NZhgnI0jPR6QqLmtFBgZN6KYMsxoCr4PHVg1ddCODYzOP4y
	tQHML2nkIysp1M0a5pJKUpEhQtFqvtJm2zu0ed21C5/xzyw5kff8tDAQwlDJGGC5SrfNr4E3ob
	XUSrkFrY6BvNyN4r0ujm7NE0YIxTQj+dZNPN9/rJtElQvBzmotMF/rbXZblBUq621CMAQAA
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
X-CMS-MailID: 20250618122801eucas1p2f9ca464e9e5c8d954d5150500952aeed
X-Msg-Generator: CA
X-RootMTR: 20250618122801eucas1p2f9ca464e9e5c8d954d5150500952aeed
X-EPHeader: CA
X-CMS-RootMailID: 20250618122801eucas1p2f9ca464e9e5c8d954d5150500952aeed
References: <CGME20250618122801eucas1p2f9ca464e9e5c8d954d5150500952aeed@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_132805_665351_EA1E5C9D 
X-CRM114-Status: GOOD (  26.15  )
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
[2] - https://github.com/mwilczy/linux/commits/rust-next-pwm-working-fan-for-sending-v8/

---
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
 drivers/pwm/pwm_th1520.rs                          | 320 ++++++++
 rust/bindings/bindings_helper.h                    |   1 +
 rust/helpers/helpers.c                             |   1 +
 rust/kernel/lib.rs                                 |   2 +
 rust/kernel/pwm.rs                                 | 884 +++++++++++++++++++++
 12 files changed, 1376 insertions(+), 2 deletions(-)
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
