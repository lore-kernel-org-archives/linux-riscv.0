Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2DDC54ED1
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:MIME-Version:
	Message-Id:Date:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:List-Owner; bh=JDSPH4IXWZV62ffPEQc93wtH3pwKryOl+yoK6WZjiDY=; b=Ux
	v42w0e0bYG6Fl2YaaQatAn4jx1QfVrv1Cyvxw3odHUSagI/4NoRRE2ISzkjTO3qQk27qb1JMnupYW
	r6LgNX7BwdQ56CyIfVuH4lTX6R4jdQyQLjWJkp/XObAUAq3eLIAqGc7WxS6Zp3wA/IeOf+11VXy54
	EMMk0xKNfp6ieM7+mG2+1ZGAgyoLl5ubC+P/ITnJbbTzj0I4unsj9Z2cpJZcUDu5fI05d/CHM4nty
	iwkCuNT3C4DPmPr2r+y+0Yc9qGbMc+n/yObT3+AlSrEFgw1sJlSuYZia4nL6kJ8kshBphNz+LOYDa
	PYWbADOD5z8ed3i8aBt/xpoPRSxNHQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIwDP-00000006HC8-37YR;
	Sat, 24 May 2025 21:15:35 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIwDH-00000006H96-3aY9
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 21:15:33 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250524211520euoutp01c74c4715655deaf5b3ac4e952edd9b31~CkxRFig2D1009110091euoutp016
	for <linux-riscv@lists.infradead.org>; Sat, 24 May 2025 21:15:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250524211520euoutp01c74c4715655deaf5b3ac4e952edd9b31~CkxRFig2D1009110091euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748121320;
	bh=LIr9lMjTF7O5NejxvO4VQjTJnbf2W8BRLqWDMWxSh4Q=;
	h=From:Subject:Date:To:Cc:References:From;
	b=ZoFKZZ9q/OdqYy0aov6l5nIwQDv1/QSaLs0W0EE5ooPz5YE9LPpJfz+TmmBcxA0Sx
	 INaLSeeByskA5yvdTAC7Oh0VY2YtuRRd6pluE/pJj9jLIbR7oDnnAQ/mNPvDWyvizC
	 xln6nxs1ciMgxmLhGu/bcHeWwZqC5S9Urn+77/G0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187~CkxQAQcej3005230052eucas1p2S;
	Sat, 24 May 2025 21:15:19 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250524211518eusmtip2a617d171be64487ab018985485f2cae7~CkxPAWrLi0676606766eusmtip2l;
	Sat, 24 May 2025 21:15:18 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH RFC 0/6] Rust Abstractions for PWM subsystem with TH1520 PWM
 driver
Date: Sat, 24 May 2025 23:14:54 +0200
Message-Id: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM42MmgC/x3NMQ7CMAxA0atUnrHUGDLAisQBWBFDSpxiIZzKK
	W2lqncnML7l/xUKm3CBU7OC8SRFsla4XQOPZ9CeUWI1UEu+9XRA+5QRlZcRh/mNc7aXaI8pKKZ
	sWFjjz95TiBRd5457qK3BOMny/9zgejnDfdu+QwqYRXwAAAA=
X-Change-ID: 20250524-rust-next-pwm-working-fan-for-sending-552ad2d1b193
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Benno Lossin
	<benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>, Danilo
	Krummrich <dakr@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Drew Fustini <drew@pdp7.com>,  Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187
X-Msg-Generator: CA
X-RootMTR: 20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187
X-EPHeader: CA
X-CMS-RootMailID: 20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_141529_312331_C4103C41 
X-CRM114-Status: GOOD (  16.66  )
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

The series is structured as follows:

Patch 1/6: Introduce basic PWM abstractions
This patch lays the groundwork by adding a Kconfig option for Rust PWM
abstractions, necessary C helper functions, and a new Rust module
(rust/kernel/pwm.rs). This module provides initial safe wrappers for
core PWM data structures (Chip, Device, State, Args, Polarity) and
functions (devm_chip_alloc, devm_chip_add), along with a basic PwmOps
trait focusing on the .apply callback needed by PWM chip providers.

Patch 2/6: Add PWM driver for TH1520 SoC
This introduces the Rust based PWM driver for the T-HEAD TH1520 SoC.
It implements the PwmOps trait using the abstractions from the first
patch and handles the specifics of the TH1520 hardware for configuring
period, duty cycle, and polarity. Resource management leverages devm
for the PWM chip and Rust DevRes for I/O memory, and RAII for clock
handling.

Patch 3/6: dt-bindings: Add PWM T-HEAD controller dt-binding
This patch adds the Device Tree binding documentation for the T-HEAD
TH1520 PWM controller.

Patch 4/6: riscv: dts: thead:: Add PWM controller node
This patch adds the actual Device Tree node for the TH1520 PWM controller.

Patch 5/6: riscv: dts: thead: Add PVT node
Add pvt node for thermal sensor.

Patch 6/6: riscv: dts: thead: Add PWM fan and thermal control
This final patch adds the Device Tree configuration for a PWM controlled
fan to the Sipeed Lichee Pi 4A board DTS file. 

Testing:
Tested on the TH1520 SoC. The fan works correctly.

Points for Discussion:
The rust/kernel/pwm.rs abstraction layer is currently minimal,
focusing on the immediate needs of this driver. Feedback on its design,
scope, and potential for generalization would be highly appreciated.
General feedback on the Rust implementation, FFI wrapping patterns, and
adherence to kernel development practices is very welcome.

The patches are based on rust-next, with some dependencies which are not
merged yet - platform Io support [1] and clk abstractions [2]. 

Reference repository with all the patches together can be found on
github [3].

[1] - https://lore.kernel.org/rust-for-linux/20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com/
[2] - https://lore.kernel.org/rust-for-linux/0ec0250c1170a8a6efb2db7a6cb49ae974d7ce05.1747634382.git.viresh.kumar@linaro.org/ 
[3] - https://github.com/mwilczy/linux/commits/rust-next-pwm-working-fan-for-sending/

---
Michal Wilczynski (6):
      rust: Add basic PWM abstractions
      pwm: Add Rust driver for T-HEAD TH1520 SoC
      dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM controller
      riscv: dts: thead: Add PWM controller node
      riscv: dts: thead: Add PVT node
      riscv: dts: thead: Add PWM fan and thermal control

 .../devicetree/bindings/pwm/thead,th1520-pwm.yaml  |  48 +++
 MAINTAINERS                                        |   8 +
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  67 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  18 +
 drivers/pwm/Kconfig                                |  14 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm_th1520.rs                          | 272 +++++++++++++++
 rust/bindings/bindings_helper.h                    |   1 +
 rust/helpers/helpers.c                             |   1 +
 rust/helpers/pwm.c                                 |  20 ++
 rust/kernel/lib.rs                                 |   2 +
 rust/kernel/pwm.rs                                 | 376 +++++++++++++++++++++
 12 files changed, 828 insertions(+)
---
base-commit: 9416c85e2767adcf72a21bce15f9c56ed085c5d4
change-id: 20250524-rust-next-pwm-working-fan-for-sending-552ad2d1b193

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
