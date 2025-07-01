Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D042C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCIGSad6xOHlzUVFmyWIQbB6J1Cm8820Ml/UrZ6/6tg=; b=yM0xGtc41IpGs/
	cnJhCA5A+g4UbYQS9Iv6RYmG6j7Kwj8HBe6PPncjmjvSr3Dh2nwJO492bFVa0nly30BM5VYbWYOGp
	gx64oH2Wvw4/MfTCEmgo8r8O84MFxkMB8kMm5nrSmewaj+YlvA2aeuGLNj46Ktvp9nWKzjDbsHzWB
	T1XvJ1shjzp6ebhn1kQqkzrPpSsZ4eeIO4ijkEFvkv/4iebOgsrVWJzy8t5S/8RkNWt4fQ3M31Su+
	sb6x+9hazkXuFjUlb/tqVuEBhP0uKzRk2VU7h4s0I7MUCCISmpJK3jI3H0o7dTpJWdd7hHRVDsWJe
	QDPjaAA1iylrwOCZzRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzU-00000006Mt1-0RQk;
	Tue, 01 Jul 2025 18:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdR0-00000005xrc-1zwZ
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Jul 2025 16:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1ahmzo5Vz24RWTOnm/eKIKUAnEik3RqLi+QEvnFpepo=; b=Kg0BPgs8sTrKJHfmlUAbkrdLVZ
	m7tWA37sG5DQ0h3IBZnbBNj1gnzkFXyk8A0W/KiQOKnJ+SrVfckE6gDiHeF0S0Gn3Ynqc+PEy8HpI
	eh3ZAy+txjNf6zdCHhbgq6gslkNu4gk7qcDmmjvSlQ+5WcVc0C9URwcFCDpZp6lHdJExcSfkBdaDe
	xyDH7z51vBW45SqbOfGoh1+q+RP0vUTy1ylcxLylqUFc5SX7hmGET7sOXHYF5RHZ/nun6ZaVlxgD+
	nDwmS5n6MNRLMEW8Tp0waNwQenw5+UuDuXl1qOCwNXyDG8PNcA0PZCqU6qtyDczX/HmaUBpeHuLFO
	ceU5t+2A==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQw-000000077Dm-2Mij
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 16:02:13 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250701160204euoutp020212901262f88326189e6e69fab69bb7~OLAmRWdLt3181331813euoutp02N
	for <linux-riscv@lists.infradead.org>; Tue,  1 Jul 2025 16:02:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250701160204euoutp020212901262f88326189e6e69fab69bb7~OLAmRWdLt3181331813euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751385724;
	bh=1ahmzo5Vz24RWTOnm/eKIKUAnEik3RqLi+QEvnFpepo=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=MDdWzk/NbirWjc8EKFWFupVSoFwfXv+ZZeYmEpFrs1jAyyyevfTQ/pF5Omf5czVsg
	 /UQc3uRBQn7KT9D/3s7CUp8Ia6Z6sBzSqsBaN2CmMgFgELEYQtTil9yjpW0v7bb4SH
	 KzPd+wxT9d6m8kgC9CICKvhZ/F25Jui+ARkpNXeY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250701160204eucas1p2d0f1ec8ab7310927f497040bb879ba05~OLAl0EqmD3262732627eucas1p2B;
	Tue,  1 Jul 2025 16:02:04 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701160202eusmtip1c0f1192158cd031ea5c25b8a5fa94351~OLAko6P5K2322723227eusmtip1K;
	Tue,  1 Jul 2025 16:02:02 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 01 Jul 2025 18:01:42 +0200
Subject: [PATCH v6 5/8] pwm: Add Rust driver for T-HEAD TH1520 SoC
MIME-Version: 1.0
Message-Id: <20250701-rust-next-pwm-working-fan-for-sending-v6-5-2710932f6f6b@samsung.com>
In-Reply-To: <20250701-rust-next-pwm-working-fan-for-sending-v6-0-2710932f6f6b@samsung.com>
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
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250701160204eucas1p2d0f1ec8ab7310927f497040bb879ba05
X-Msg-Generator: CA
X-RootMTR: 20250701160204eucas1p2d0f1ec8ab7310927f497040bb879ba05
X-EPHeader: CA
X-CMS-RootMailID: 20250701160204eucas1p2d0f1ec8ab7310927f497040bb879ba05
References: <20250701-rust-next-pwm-working-fan-for-sending-v6-0-2710932f6f6b@samsung.com>
	<CGME20250701160204eucas1p2d0f1ec8ab7310927f497040bb879ba05@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_170210_886155_FA836856 
X-CRM114-Status: GOOD (  25.28  )
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

Introduce a PWM driver for the T-HEAD TH1520 SoC, written in Rust and
utilizing the safe PWM abstractions from the preceding commit.

The driver implements the pwm::PwmOps trait using the modern waveform
API (round_waveform_tohw, write_waveform, etc.) to support configuration
of period, duty cycle, and polarity for the TH1520's PWM channels.

Resource management is handled using idiomatic Rust patterns. The PWM
chip object is allocated via pwm::Chip::new and its registration with
the PWM core is managed by the pwm::Registration RAII guard. This
ensures pwmchip_remove is always called when the driver unbinds,
preventing resource leaks. Device managed resources are used for the
MMIO region, and the clock lifecycle is correctly managed in the
driver's private data Drop implementation.

The driver's core logic is written entirely in safe Rust, with no unsafe
blocks.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS               |   1 +
 drivers/pwm/Kconfig       |  11 ++
 drivers/pwm/Makefile      |   1 +
 drivers/pwm/pwm_th1520.rs | 338 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 351 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe47833a341f7d25f0f65877ea6bc3dc77261732..ebbc24f3ef4752cae1b1028939f58f5587074371 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21511,6 +21511,7 @@ F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
 F:	drivers/power/sequencing/pwrseq-thead-gpu.c
+F:	drivers/pwm/pwm_th1520.rs
 F:	drivers/reset/reset-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/power/thead,th1520-power.h
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index c32655566d6ab9eff9d10f29e469f9aef89cecfa..02faf93600b6464d3c02495eeb5824ea541cff35 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -728,6 +728,17 @@ config PWM_TEGRA
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-tegra.
 
+config PWM_TH1520
+	tristate "TH1520 PWM support"
+	depends on RUST
+	select RUST_PWM_ABSTRACTIONS
+	help
+	  This option enables the driver for the PWM controller found on the
+	  T-HEAD TH1520 SoC.
+
+	  To compile this driver as a module, choose M here; the module
+	  will be called pwm-th1520. If you are unsure, say N.
+
 config PWM_TIECAP
 	tristate "ECAP PWM support"
 	depends on ARCH_OMAP2PLUS || ARCH_DAVINCI_DA8XX || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index ff4f47e5fb7a0dbac72c12de82c3773e5582db6d..5c15c95c6e49143969389198657eed0ecf4086b2 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_PWM_STMPE)		+= pwm-stmpe.o
 obj-$(CONFIG_PWM_SUN4I)		+= pwm-sun4i.o
 obj-$(CONFIG_PWM_SUNPLUS)	+= pwm-sunplus.o
 obj-$(CONFIG_PWM_TEGRA)		+= pwm-tegra.o
+obj-$(CONFIG_PWM_TH1520)	+= pwm_th1520.o
 obj-$(CONFIG_PWM_TIECAP)	+= pwm-tiecap.o
 obj-$(CONFIG_PWM_TIEHRPWM)	+= pwm-tiehrpwm.o
 obj-$(CONFIG_PWM_TWL)		+= pwm-twl.o
diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
new file mode 100644
index 0000000000000000000000000000000000000000..c4381d4aa101323a599f1d1836896bafc33f9706
--- /dev/null
+++ b/drivers/pwm/pwm_th1520.rs
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2025 Samsung Electronics Co., Ltd.
+// Author: Michal Wilczynski <m.wilczynski@samsung.com>
+
+//! Rust T-HEAD TH1520 PWM driver
+//!
+//! Limitations:
+//! - The period and duty cycle are controlled by 32-bit hardware registers,
+//!   limiting the maximum resolution.
+//! - The driver supports continuous output mode only; one-shot mode is not
+//!   implemented.
+//! - The controller hardware provides up to 6 PWM channels.
+//! - Reconfiguration is glitch free - new period and duty cycle values are
+//!   latched and take effect at the start of the next period.
+//! - Polarity is handled via a simple hardware inversion bit; arbitrary
+//!   duty cycle offsets are not supported.
+//! - Disabling a channel is achieved by configuring its duty cycle to zero to
+//!   produce a static low output. Clearing the `start` does not reliably
+//!   force the static inactive level defined by the `INACTOUT` bit. Hence
+//!   this method is not used in this driver.
+//!
+
+use core::ops::Deref;
+use kernel::{
+    c_str,
+    clk::Clk,
+    device::{Bound, Core, Device},
+    devres,
+    io::mem::IoMem,
+    of, platform,
+    prelude::*,
+    pwm, time,
+};
+
+const TH1520_MAX_PWM_NUM: u32 = 6;
+
+// Register offsets
+const fn th1520_pwm_chn_base(n: u32) -> usize {
+    (n * 0x20) as usize
+}
+
+const fn th1520_pwm_ctrl(n: u32) -> usize {
+    th1520_pwm_chn_base(n)
+}
+
+const fn th1520_pwm_per(n: u32) -> usize {
+    th1520_pwm_chn_base(n) + 0x08
+}
+
+const fn th1520_pwm_fp(n: u32) -> usize {
+    th1520_pwm_chn_base(n) + 0x0c
+}
+
+// Control register bits
+const TH1520_PWM_START: u32 = 1 << 0;
+const TH1520_PWM_CFG_UPDATE: u32 = 1 << 2;
+const TH1520_PWM_CONTINUOUS_MODE: u32 = 1 << 5;
+const TH1520_PWM_FPOUT: u32 = 1 << 8;
+
+const TH1520_PWM_REG_SIZE: usize = 0xB0;
+
+fn ns_to_cycles(ns: u64, rate_hz: u64) -> u64 {
+    const NSEC_PER_SEC_U64: u64 = time::NSEC_PER_SEC as u64;
+
+    (match ns.checked_mul(rate_hz) {
+        Some(product) => product,
+        None => u64::MAX,
+    }) / NSEC_PER_SEC_U64
+}
+
+fn cycles_to_ns(cycles: u64, rate_hz: u64) -> u64 {
+    const NSEC_PER_SEC_U64: u64 = time::NSEC_PER_SEC as u64;
+
+    // Round up
+    let Some(numerator) = cycles
+        .checked_mul(NSEC_PER_SEC_U64)
+        .and_then(|p| p.checked_add(rate_hz - 1))
+    else {
+        return u64::MAX;
+    };
+
+    numerator / rate_hz
+}
+
+/// Hardware-specific waveform representation for TH1520.
+#[derive(Copy, Clone, Debug, Default)]
+struct Th1520WfHw {
+    period_cycles: u32,
+    duty_cycles: u32,
+    ctrl_val: u32,
+    enabled: bool,
+}
+
+/// The driver's private data struct. It holds all necessary devres managed resources.
+#[pin_data(PinnedDrop)]
+struct Th1520PwmDriverData {
+    #[pin]
+    iomem: devres::Devres<IoMem<TH1520_PWM_REG_SIZE>>,
+    clk: Clk,
+}
+
+impl pwm::PwmOps for Th1520PwmDriverData {
+    type WfHw = Th1520WfHw;
+
+    fn round_waveform_tohw(
+        chip: &pwm::Chip,
+        _pwm: &pwm::Device,
+        wf: &pwm::Waveform,
+    ) -> Result<(c_int, Self::WfHw)> {
+        let data: &Self = chip.drvdata();
+
+        if wf.period_length_ns == 0 {
+            return Ok((
+                0,
+                Th1520WfHw {
+                    enabled: false,
+                    ..Default::default()
+                },
+            ));
+        }
+
+        let rate_hz = data.clk.rate().as_hz() as u64;
+
+        let period_cycles = ns_to_cycles(wf.period_length_ns, rate_hz).min(u64::from(u32::MAX));
+        let mut duty_cycles = ns_to_cycles(wf.duty_length_ns, rate_hz).min(u64::from(u32::MAX));
+
+        let mut ctrl_val = TH1520_PWM_CONTINUOUS_MODE;
+
+        let is_inversed = wf.duty_length_ns > 0
+            && wf.duty_offset_ns > 0
+            && wf.duty_length_ns + wf.duty_offset_ns >= wf.period_length_ns;
+        if is_inversed {
+            duty_cycles = period_cycles - duty_cycles;
+        } else {
+            ctrl_val |= TH1520_PWM_FPOUT;
+        }
+
+        let wfhw = Th1520WfHw {
+            period_cycles: period_cycles as u32,
+            duty_cycles: duty_cycles as u32,
+            ctrl_val,
+            enabled: true,
+        };
+
+        dev_dbg!(
+            chip.device(),
+            "clk_rate: {}Hz Requested: period {}ns, duty {}ns, offset {}ns -> HW: period {} cyc, duty {} cyc, ctrl 0x{:x}\n",
+            rate_hz,
+            wf.period_length_ns,
+            wf.duty_length_ns,
+            wf.duty_offset_ns,
+            wfhw.period_cycles,
+            wfhw.duty_cycles,
+            wfhw.ctrl_val
+        );
+
+        Ok((0, wfhw))
+    }
+
+    fn round_waveform_fromhw(
+        chip: &pwm::Chip,
+        _pwm: &pwm::Device,
+        wfhw: &Self::WfHw,
+        wf: &mut pwm::Waveform,
+    ) -> Result<c_int> {
+        let data: &Self = chip.drvdata();
+        let rate_hz = data.clk.rate().as_hz() as u64;
+
+        wf.period_length_ns = cycles_to_ns(u64::from(wfhw.period_cycles), rate_hz);
+
+        let duty_cycles = u64::from(wfhw.duty_cycles);
+
+        if (wfhw.ctrl_val & TH1520_PWM_FPOUT) != 0 {
+            wf.duty_length_ns = cycles_to_ns(duty_cycles, rate_hz);
+            wf.duty_offset_ns = 0;
+        } else {
+            let period_cycles = u64::from(wfhw.period_cycles);
+            let original_duty_cycles = period_cycles.saturating_sub(duty_cycles);
+
+            // For an inverted signal, `duty_length_ns` is the high time (period - low_time).
+            wf.duty_length_ns = cycles_to_ns(original_duty_cycles, rate_hz);
+            // The offset is the initial low time, which is what the hardware register provides.
+            wf.duty_offset_ns = cycles_to_ns(duty_cycles, rate_hz);
+        }
+
+        Ok(0)
+    }
+
+    fn read_waveform(
+        chip: &pwm::Chip,
+        pwm: &pwm::Device,
+        parent_dev: &Device<Bound>,
+    ) -> Result<Self::WfHw> {
+        let data: &Self = chip.drvdata();
+        let hwpwm = pwm.hwpwm();
+        let iomem_accessor = data.iomem.access(parent_dev)?;
+        let iomap = iomem_accessor.deref();
+
+        let ctrl = iomap.try_read32(th1520_pwm_ctrl(hwpwm))?;
+        let period_cycles = iomap.try_read32(th1520_pwm_per(hwpwm))?;
+        let duty_cycles = iomap.try_read32(th1520_pwm_fp(hwpwm))?;
+
+        let wfhw = Th1520WfHw {
+            period_cycles,
+            duty_cycles,
+            ctrl_val: ctrl,
+            enabled: duty_cycles != 0,
+        };
+
+        dev_dbg!(
+            chip.device(),
+            "PWM-{}: read_waveform: Read hw state - period: {}, duty: {}, ctrl: 0x{:x}, enabled: {}",
+            hwpwm,
+            wfhw.period_cycles,
+            wfhw.duty_cycles,
+            wfhw.ctrl_val,
+            wfhw.enabled
+        );
+
+        Ok(wfhw)
+    }
+
+    fn write_waveform(
+        chip: &pwm::Chip,
+        pwm: &pwm::Device,
+        wfhw: &Self::WfHw,
+        parent_dev: &Device<Bound>,
+    ) -> Result {
+        let data: &Self = chip.drvdata();
+        let hwpwm = pwm.hwpwm();
+        let iomem_accessor = data.iomem.access(parent_dev)?;
+        let iomap = iomem_accessor.deref();
+        let was_enabled = pwm.state().enabled();
+
+        if !wfhw.enabled {
+            if was_enabled {
+                iomap.try_write32(wfhw.ctrl_val, th1520_pwm_ctrl(hwpwm))?;
+                iomap.try_write32(0, th1520_pwm_fp(hwpwm))?;
+                iomap.try_write32(wfhw.ctrl_val | TH1520_PWM_CFG_UPDATE, th1520_pwm_ctrl(hwpwm))?;
+            }
+            return Ok(());
+        }
+
+        iomap.try_write32(wfhw.ctrl_val, th1520_pwm_ctrl(hwpwm))?;
+        iomap.try_write32(wfhw.period_cycles, th1520_pwm_per(hwpwm))?;
+        iomap.try_write32(wfhw.duty_cycles, th1520_pwm_fp(hwpwm))?;
+        iomap.try_write32(wfhw.ctrl_val | TH1520_PWM_CFG_UPDATE, th1520_pwm_ctrl(hwpwm))?;
+
+        // The `TH1520_PWM_START` bit must be written in a separate, final transaction, and
+        // only when enabling the channel from a disabled state.
+        if !was_enabled {
+            iomap.try_write32(wfhw.ctrl_val | TH1520_PWM_START, th1520_pwm_ctrl(hwpwm))?;
+        }
+
+        dev_dbg!(
+            chip.device(),
+            "PWM-{}: Wrote (per: {}, duty: {})",
+            hwpwm,
+            wfhw.period_cycles,
+            wfhw.duty_cycles,
+        );
+
+        Ok(())
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for Th1520PwmDriverData {
+    fn drop(self: Pin<&mut Self>) {
+        self.clk.disable_unprepare();
+    }
+}
+
+static TH1520_PWM_OPS: pwm::PwmOpsVTable = pwm::create_pwm_ops::<Th1520PwmDriverData>();
+
+struct Th1520PwmPlatformDriver;
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <Th1520PwmPlatformDriver as platform::Driver>::IdInfo,
+    [(of::DeviceId::new(c_str!("thead,th1520-pwm")), ())]
+);
+
+impl platform::Driver for Th1520PwmPlatformDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        pdev: &platform::Device<Core>,
+        _id_info: Option<&Self::IdInfo>,
+    ) -> Result<Pin<KBox<Self>>> {
+        let dev = pdev.as_ref();
+        let resource = pdev.resource(0).ok_or(ENODEV)?;
+
+        let drvdata = KBox::pin_init(
+            try_pin_init!(Th1520PwmDriverData {
+                iomem <- pdev.ioremap_resource_sized::<TH1520_PWM_REG_SIZE>(resource),
+                clk <- Clk::get(dev, None),
+            }),
+            GFP_KERNEL,
+        )?;
+
+        drvdata.clk.prepare_enable()?;
+
+        // TODO: Get exclusive ownership of the clock to prevent rate changes.
+        // The Rust equivalent of `clk_rate_exclusive_get()` is not yet available.
+        // This should be updated once it is implemented.
+        let rate_hz = drvdata.clk.rate().as_hz();
+        if rate_hz == 0 {
+            dev_err!(dev, "Clock rate is zero\n");
+            return Err(EINVAL);
+        }
+
+        if rate_hz > time::NSEC_PER_SEC as usize {
+            dev_err!(
+                dev,
+                "Clock rate {} Hz is too high, not supported.\n",
+                rate_hz
+            );
+            return Err(ERANGE);
+        }
+
+        let chip = pwm::Chip::new(dev, TH1520_MAX_PWM_NUM, 0, drvdata)?;
+
+        pwm::Registration::register(dev, chip, &TH1520_PWM_OPS)?;
+
+        Ok(KBox::new(Th1520PwmPlatformDriver, GFP_KERNEL)?.into())
+    }
+}
+
+kernel::module_platform_driver! {
+    type: Th1520PwmPlatformDriver,
+    name: "pwm-th1520",
+    authors: ["Michal Wilczynski <m.wilczynski@samsung.com>"],
+    description: "T-HEAD TH1520 PWM driver",
+    license: "GPL v2",
+}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
