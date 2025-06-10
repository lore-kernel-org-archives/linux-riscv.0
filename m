Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D6EC678DA
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yN8dlltcUygKAjMoEN9iU6q6jXrtyHqatTX8g7ERhME=; b=WPkn5DhBaz42Ok
	T1WWhHWOC48Zy3HjcmnKIkC73YdLffQDWJa/QOOfxfHmP3Oqk01xMB2de51W50Ye5txHeAGoTN/Gp
	M8nVOA9t93P/w14nTYUVBOlFnw4SmkaDWCEXoYVbyFcS/Zy2gq4yrHJbhm0RSGHx2xxSHYkaEHKC7
	9LH8JQR/6rg0McVb+gx4uKCBWSTupPYyevxbuZxOrOk5XWrqS40f2zY6DQJj/kGAJ+1V0UALGOeK5
	VxN6WBq/h3OiDALg9crl2c1Cub75spF950rQ8AdIxZVvJ2WjueoRe6jcyfTdMd7X6YSPPnGLPhxuD
	0unA/XM7unBd2XAsatZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0lR-00000007Gmd-0RjJ;
	Tue, 10 Jun 2025 15:19:49 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyTy-00000006qZ2-2aFl
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:53:40 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250610125334euoutp017b999a35fd5eaab331cedd20605f725b~Hr5Aycakw1187711877euoutp01Z
	for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 12:53:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250610125334euoutp017b999a35fd5eaab331cedd20605f725b~Hr5Aycakw1187711877euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749560014;
	bh=XnU++sOJANJB3QM+54tjoJboUyue4aR10yImzgN9Ir0=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=O7f2QURTPGaH/+zJRRJBq6EnMgQyJqep+z4jwzQnCufOvHJVCASyfYb7TLCwLAWoP
	 XGLgGNweTFUsG6tF/qM2zGg8kRlfK8Og8Ivl0lc0Pc4zwR9x3NShbd8k6IcRcC3Uzt
	 nAfbMmbmjrJ9co98lXBtDW+FbbatBqnjE5G49xFM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d~Hr5ALMeiU0875208752eucas1p16;
	Tue, 10 Jun 2025 12:53:33 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250610125332eusmtip1870d7d868d8f899ab0bd39780d123beb~Hr4_9rhV10363103631eusmtip1P;
	Tue, 10 Jun 2025 12:53:32 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 10 Jun 2025 14:52:50 +0200
Subject: [PATCH v2 2/7] pwm: Add Rust driver for T-HEAD TH1520 SoC
MIME-Version: 1.0
Message-Id: <20250610-rust-next-pwm-working-fan-for-sending-v2-2-753e2955f110@samsung.com>
In-Reply-To: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
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
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d
X-Msg-Generator: CA
X-RootMTR: 20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d
X-EPHeader: CA
X-CMS-RootMailID: 20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
	<CGME20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_055338_948585_88AAA5FB 
X-CRM114-Status: GOOD (  21.77  )
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
 drivers/pwm/Kconfig       |  10 ++
 drivers/pwm/Makefile      |   1 +
 drivers/pwm/pwm_th1520.rs | 287 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 299 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5589c0d2253bcb04e78d7b89ef6ef0ed41121d77..966ce515c8bfefdff1975bb716a267435ec0feae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21319,6 +21319,7 @@ F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
+F:	drivers/pwm/pwm_th1520.rs
 F:	drivers/reset/reset-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/power/thead,th1520-power.h
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 03c5a100a03e2acdccf8a46b9c70b736b630bd3a..be05658a568cb9156ef623caf54ff1aaba898d01 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -719,6 +719,16 @@ config PWM_TEGRA
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-tegra.
 
+config PWM_TH1520_RUST
+	tristate "TH1520 PWM support (Rust)"
+	depends on RUST_PWM_ABSTRACTIONS
+	help
+	  This option enables the driver for the PWM controller found on the
+	  T-HEAD TH1520 SoC. This driver is written in Rust.
+
+	  To compile this driver as a module, choose M here; the module
+	  will be called pwm-th1520. If you are unsure, say N.
+
 config PWM_TIECAP
 	tristate "ECAP PWM support"
 	depends on ARCH_OMAP2PLUS || ARCH_DAVINCI_DA8XX || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 96160f4257fcb0e0951581af0090615c0edf5260..d41b1940df903ba2036d8e3ed93efcd66834b7ab 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -73,3 +73,4 @@ obj-$(CONFIG_PWM_TWL_LED)	+= pwm-twl-led.o
 obj-$(CONFIG_PWM_VISCONTI)	+= pwm-visconti.o
 obj-$(CONFIG_PWM_VT8500)	+= pwm-vt8500.o
 obj-$(CONFIG_PWM_XILINX)	+= pwm-xilinx.o
+obj-$(CONFIG_PWM_TH1520_RUST)	+= pwm_th1520.o
diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
new file mode 100644
index 0000000000000000000000000000000000000000..9e43474f5123b51c49035d71219303a606c20a5a
--- /dev/null
+++ b/drivers/pwm/pwm_th1520.rs
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2025 Samsung Electronics Co., Ltd.
+// Author: Michal Wilczynski <m.wilczynski@samsung.com>
+
+//! Rust T-HEAD TH1520 PWM driver
+
+use core::ops::Deref;
+use kernel::{
+    c_str,
+    clk::Clk,
+    device::{Bound, Core, Device},
+    devres,
+    error::{code::*, Result},
+    io::mem::IoMem,
+    math::KernelMathExt,
+    of, platform,
+    prelude::*,
+    pwm, time,
+};
+
+const MAX_PWM_NUM: u32 = 6;
+
+// Register offsets
+const fn th1520_pwm_chn_base(n: u32) -> usize {
+    (n * 0x20) as usize
+}
+const fn th1520_pwm_ctrl(n: u32) -> usize {
+    th1520_pwm_chn_base(n)
+}
+const fn th1520_pwm_per(n: u32) -> usize {
+    th1520_pwm_chn_base(n) + 0x08
+}
+const fn th1520_pwm_fp(n: u32) -> usize {
+    th1520_pwm_chn_base(n) + 0x0c
+}
+
+// Control register bits
+const PWM_START: u32 = 1 << 0;
+const PWM_CFG_UPDATE: u32 = 1 << 2;
+const PWM_CONTINUOUS_MODE: u32 = 1 << 5;
+const PWM_FPOUT: u32 = 1 << 8;
+
+const TH1520_PWM_REG_SIZE: usize = 0xB0;
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
+/// The driver's private data struct. It holds all necessary devres-managed resources.
+struct Th1520PwmDriverData {
+    iomem: devres::Devres<IoMem<TH1520_PWM_REG_SIZE>>,
+    clk: Clk,
+}
+
+impl pwm::PwmOps for Th1520PwmDriverData {
+    type WfHw = Th1520WfHw;
+
+    fn get_state(
+        chip: &mut pwm::Chip,
+        pwm: &mut pwm::Device,
+        state: &mut pwm::State,
+        parent_dev: &Device<Bound>,
+    ) -> Result {
+        let data: &Self = chip.drvdata().ok_or(EINVAL)?;
+        let hwpwm = pwm.hwpwm();
+        let iomem_guard = data.iomem.access(parent_dev)?;
+        let iomap = iomem_guard.deref();
+        let ctrl = iomap.read32(th1520_pwm_ctrl(hwpwm));
+        let period_cycles = iomap.read32(th1520_pwm_per(hwpwm));
+        let duty_cycles = iomap.read32(th1520_pwm_fp(hwpwm));
+
+        state.set_enabled(duty_cycles != 0);
+
+        let rate_hz = data.clk.rate().as_hz();
+        let period_ns = (period_cycles as u64)
+            .mul_div(time::NSEC_PER_SEC as u64, rate_hz as u64)
+            .unwrap_or(0);
+        state.set_period(period_ns);
+
+        let duty_ns = (duty_cycles as u64)
+            .mul_div(time::NSEC_PER_SEC as u64, rate_hz as u64)
+            .unwrap_or(0);
+        state.set_duty_cycle(duty_ns);
+
+        if (ctrl & PWM_FPOUT) != 0 {
+            state.set_polarity(pwm::Polarity::Normal);
+        } else {
+            state.set_polarity(pwm::Polarity::Inversed);
+        }
+
+        Ok(())
+    }
+
+    fn round_waveform_tohw(
+        chip: &mut pwm::Chip,
+        pwm: &mut pwm::Device,
+        wf: &pwm::Waveform,
+    ) -> Result<(i32, Self::WfHw)> {
+        let data: &Self = chip.drvdata().ok_or(EINVAL)?;
+        let hwpwm = pwm.hwpwm();
+
+        if wf.duty_offset_ns != 0 {
+            dev_err!(chip.device(), "PWM-{}: Duty offset not supported\n", hwpwm);
+            return Err(ENOTSUPP);
+        }
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
+        let rate_hz = data.clk.rate().as_hz();
+
+        let period_cycles = wf
+            .period_length_ns
+            .mul_div(rate_hz as u64, time::NSEC_PER_SEC as u64)
+            .ok_or(EINVAL)?;
+        if period_cycles > u32::MAX as u64 {
+            dev_err!(
+                chip.device(),
+                "PWM-{}: Calculated period {} cycles is out of range\n",
+                hwpwm,
+                period_cycles
+            );
+            return Err(EINVAL);
+        }
+
+        let duty_cycles = wf
+            .duty_length_ns
+            .mul_div(rate_hz as u64, time::NSEC_PER_SEC as u64)
+            .ok_or(EINVAL)?;
+        if duty_cycles > period_cycles {
+            dev_err!(
+                chip.device(),
+                "PWM-{}: Duty {}ns > period {}ns\n",
+                hwpwm,
+                wf.duty_length_ns,
+                wf.period_length_ns
+            );
+            return Err(EINVAL);
+        }
+
+        let mut ctrl_val = PWM_CONTINUOUS_MODE;
+        if pwm.state().polarity() == pwm::Polarity::Normal {
+            ctrl_val |= PWM_FPOUT;
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
+            "wfhw -- Period: {}, Duty: {}, Ctrl: 0x{:x}\n",
+            wfhw.period_cycles,
+            wfhw.duty_cycles,
+            wfhw.ctrl_val
+        );
+        Ok((0, wfhw))
+    }
+
+    fn write_waveform(
+        chip: &mut pwm::Chip,
+        pwm: &mut pwm::Device,
+        wfhw: &Self::WfHw,
+        parent_dev: &Device<Bound>,
+    ) -> Result {
+        let data: &Self = chip.drvdata().ok_or(EINVAL)?;
+        let hwpwm = pwm.hwpwm();
+        let iomem_guard = data.iomem.access(parent_dev)?;
+        let iomap = iomem_guard.deref();
+        let was_enabled = pwm.state().enabled();
+
+        if !wfhw.enabled {
+            if was_enabled {
+                let mut ctrl = iomap.read32(th1520_pwm_ctrl(hwpwm));
+
+                ctrl &= !PWM_CFG_UPDATE;
+
+                iomap.write32(ctrl, th1520_pwm_ctrl(hwpwm));
+                iomap.write32(0, th1520_pwm_fp(hwpwm));
+                iomap.write32(ctrl | PWM_CFG_UPDATE, th1520_pwm_ctrl(hwpwm));
+            }
+            return Ok(());
+        }
+
+        let ctrl = wfhw.ctrl_val & !PWM_CFG_UPDATE;
+
+        iomap.write32(ctrl, th1520_pwm_ctrl(hwpwm));
+        iomap.write32(wfhw.period_cycles, th1520_pwm_per(hwpwm));
+        iomap.write32(wfhw.duty_cycles, th1520_pwm_fp(hwpwm));
+        iomap.write32(wfhw.ctrl_val | PWM_CFG_UPDATE, th1520_pwm_ctrl(hwpwm));
+
+        if !was_enabled {
+            iomap.write32(wfhw.ctrl_val | PWM_START, th1520_pwm_ctrl(hwpwm));
+        }
+
+        Ok(())
+    }
+}
+
+impl Drop for Th1520PwmDriverData {
+    fn drop(&mut self) {
+        self.clk.disable_unprepare();
+    }
+}
+
+static TH1520_PWM_OPS: pwm::PwmOpsVTable = pwm::create_pwm_ops::<Th1520PwmDriverData>();
+
+struct Th1520PwmPlatformDriver {
+    _registration: pwm::Registration,
+}
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
+        let iomem = pdev.ioremap_resource_sized::<TH1520_PWM_REG_SIZE>(resource)?;
+        let clk = Clk::get(pdev.as_ref(), None)?;
+
+        clk.prepare_enable()?;
+
+        let rate_hz = clk.rate().as_hz();
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
+        let chip = pwm::Chip::new(dev, MAX_PWM_NUM, 0)?;
+
+        let drvdata = KBox::new(Th1520PwmDriverData { iomem, clk }, GFP_KERNEL)?;
+        chip.set_drvdata(drvdata);
+
+        let registration = pwm::Registration::new(chip, &TH1520_PWM_OPS)?;
+
+        Ok(KBox::new(
+            Th1520PwmPlatformDriver {
+                _registration: registration,
+            },
+            GFP_KERNEL,
+        )?
+        .into())
+    }
+}
+
+kernel::module_platform_driver! {
+    type: Th1520PwmPlatformDriver,
+    name: "pwm-th1520",
+    author: "Michal Wilczynski <m.wilczynski@samsung.com>",
+    description: "T-HEAD TH1520 PWM driver",
+    license: "GPL v2",
+}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
