Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12135606A32D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TU+NvU/7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEy+YjKj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qLLzMRtHZh2LfS3+Nmwp1bZzGKIm1W9ntxyi5nn0Cgs=; b=TU+NvU/7RRVlRaYryRAeFzQMxD
	DPDZ4gdg+R4zVgw1FnLoSH2DtH5PoNf0oT84xE4172M6fszLB+ORZlyXRKqKq2E9pXG4R0wycn7U+
	Na8Q9YpDjwxxflQshVvJknWDhAMvuwgBfDpNtL/YVkXIhveM532kt1Njo7ruL5ZPQnEcmkKauo67p
	d3UsnPH4L5Q5nfUglpB8eFUYOIZkeOb6hUrGuRkXqqt1BjjjJktublCxsHEcu/PSUUeNOfntvzRO1
	IAFcxhBcrXVWfbw2Tg3YEWmanduo9GpwBqGecg4bXmoQ8ngQt9SPPGIjxEoPtRlCTS0BHoUIgDe1w
	pFU0HW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILq-00000008Mxd-3TQX;
	Thu, 29 Oct 2026 05:06:59 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILn-00000008Mv4-254l
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:06:57 +0000
Received: by mail-pj2-x0a.google.com with SMTP id d9443c01a7336-2eb0981df4aso2462455ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250414; x=1793855214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1HpC8OctDgrucLKXFCuwI9p/x3lA/iI3ZaNcaH9r4Q=;
        b=eEy+YjKjrbNiZGzxK67XAO3SwG4nppBXv/MZDGYGOUTUkbHf8fgW+G0p4N+vcyRs37
         GtunMGtu+KfGgH6btmrKZH39ANFzR67F8hbAwaRrzf6A9BmMFZsZMfCsLNuWA5G38s4c
         eKglgMgK97gXwdMvQ4I8jCGI9J8oaTYA/ZNbzDeeMjLxpXPcL0+3a3Gh/0YUapzb6kzm
         +rTORwSaHfiIIET8Wu0gqWl4ZMjPAEeQHvt+J2ZFlINxD0gXL2+qctWoEXBTpstw7pyP
         YHgNDLN0m5KR/5HO7PkFOseY0az0vKXI3RYuG7PMZC0grtbrgbANrrdVdF/sjuDGkbae
         sY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250414; x=1793855214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1HpC8OctDgrucLKXFCuwI9p/x3lA/iI3ZaNcaH9r4Q=;
        b=1NS9HCjjhcvYXKET5eoHXc+t9N+t4N5rOWXOHSoJ7xUOsB0Nm/27PFcslHaMVw277K
         UQv3nMLp+XSXS8gjwJlEeITYDoiMNpvlhRuY3IHc3lJg3omqRbu2y+vtm3BzwydQ6kxt
         /nnKLJrd+ZuX/sHvyK+OEBjDrJXlUvKZTSEaNNh+WLaEcxfCUOZT4yeR04iN8WnXc2Bf
         guhPcWkxVpL3gM8WbDX0nF1487yEb+KxHYwznRJbPoV0iKpGyqT8LNwXMMhM7HbaXQ5Z
         CB7VxWc364KQ5XAuRAUM+53FTvn4tGBqJhlrbA69prnGVFaXOueKK4g810SjMD7kxTQo
         77Pw==
X-Forwarded-Encrypted: i=1; AKwUvBw99QYgFxH0jveq90QpXtpAiP7uJOb4wDippgFfzqJOyeXcG/UNDGLjmhWnbo7WicK3wfVb3xey0rNsLA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKgPYuOdVonGfHRgpl8EGjtvJlGIZrycm//bFaMgq3mHwZ8YNUf
	wqrx/adQeIcwgKSemxMo/OyJLmkTr8HvgyO3tvJvHpdo1LrTEc7xzO84
X-Gm-Gg: AYBFou0ks/qhohnRLySdtP4wtB7T2xnTuDzwtzXknRjB906t+fpEtkb6AsqtADOAfOs
	pv1taAuJ5ea2Prrxd1p7vWPLENh57+2QXD232/QV8XnXS1+YAtsWQOigwLfowFLAWBbNdqM2GNS
	FHsyauI/mdvef4O/wsLsVSigqhaFUGiwoiBfcHE5dbqIVtWk0KdmzVY2PZQSpLAFPhPAfs1h2Ep
	yv+J31MRQEfLHsrLdekH0y/mUPNpfNA+IdqHaO9BER80f5WDD8yv/LZ4otPf0toG7rWoLGmzDQr
	ZNi4PZ6+U5i5BTLNITSYAyrQO+f6OX4bTmHZjTheROHFQwlIMjRS4cZgxSnpd+R9P0G4NK6p3Dr
	ZmC92QJoYKSA5mUVXVQrTEhveO7V8Jk4v/29w9CFgA2ajdJ4yIzhDagYSptnPqsbvCznsqgc+nU
	lrb+ysyuYwMPhoMkHIK0jTNUDH4yOHz/K3a9/Kl+5y/kLxRZ/VyEOxhEt2533hXom6il55XuBeX
	UIJR1Em8XXRn8K2KbP4+y8b5GSdWgDc/hKv0ZBv99B9TjyN74K8dxGH2jE0rrikMjwtSf5rdXK0
	WnrxreEucQr5LH+04qOe0SXgt9OUOcXfyKlcEBuvEJzKIvxV5Q==
X-Received: by 2002:a17:902:e848:b0:2e6:943:39df with SMTP id d9443c01a7336-2eb00488b94mr42201205ad.25.1793250414083;
        Wed, 28 Oct 2026 22:06:54 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:52 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:48 -0400
Subject: [PATCH RFC 07/12] serial: bflb: Add Rust BL808 polling console
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-7-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_220656_625152_0990BBB4 
X-CRM114-Status: GOOD (  19.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a Rust driver for the Bouffalo Lab BL808 UART controller with polling
console support. Register UART3 as ttyBFLB0 and provide bounded polling
and newline conversion.

The driver uses an exclusive MMIO mapping and a baud clock supplied by
the device tree. Firmware configures clock routing, gates, reset and
pinmux. Userspace TTY I/O, RX, interrupts and DMA are not implemented.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 drivers/tty/serial/Kconfig      |   8 +
 drivers/tty/serial/Makefile     |   2 +
 drivers/tty/serial/bflb_uart.rs | 334 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 344 insertions(+)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 9b17d451f19df6575bc8a4a08245065f9b8e3715..9f549c5033fc077e921f5b6f3e72bad2144f83b7 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -26,6 +26,14 @@ config RUST_SERIAL_ABSTRACTIONS
 	help
 	  This enables Rust abstractions for the serial core API.
 
+config SERIAL_BFLB_RUST
+	bool "Bouffalo Lab polling serial console in Rust"
+	depends on RUST && OF && COMMON_CLK && HAS_IOMEM
+	select RUST_SERIAL_ABSTRACTIONS
+	help
+	  Say Y here to enable kernel console support for the Bouffalo Lab
+	  BL808 UART controller.
+
 config SERIAL_AMBA_PL010
 	tristate "ARM AMBA PL010 serial port support"
 	depends on ARM_AMBA || COMPILE_TEST
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index d63b126f40caf55b44c9ac2e6a484a0c13ca1b57..36364fe714c85df5029f2ac95a027a3787f331c7 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -99,3 +99,5 @@ obj-$(CONFIG_SERIAL_MCTRL_GPIO)	+= serial_mctrl_gpio.o
 
 obj-$(CONFIG_KGDB_SERIAL_CONSOLE) += kgdboc.o
 obj-$(CONFIG_SERIAL_NUVOTON_MA35D1) += ma35d1_serial.o
+
+obj-$(CONFIG_SERIAL_BFLB_RUST) += bflb_uart.o
diff --git a/drivers/tty/serial/bflb_uart.rs b/drivers/tty/serial/bflb_uart.rs
new file mode 100644
index 0000000000000000000000000000000000000000..4e34aa9a95cab665e18230453af5706b0061049a
--- /dev/null
+++ b/drivers/tty/serial/bflb_uart.rs
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+//! Bouffalo Lab UART3 polling console.
+
+use core::num::NonZeroU32;
+
+use kernel::{
+    clk::Clk,
+    device::{
+        Bound,
+        Core,
+        Device, //
+    },
+    devres::DevresGuard,
+    driver,
+    io::{
+        mem::{
+            DevresExclusiveIoMem,
+            ExclusiveIoMem, //
+        },
+        poll::read_poll_timeout_atomic,
+        Io,
+        IoBase, //
+    },
+    of,
+    platform,
+    prelude::*,
+    serial::{
+        self,
+        DriverConfig,
+        LockedPort,
+        Port,
+        Termios, //
+    },
+    sync::Arc,
+    time::Delta, //
+};
+
+const REG_SIZE: usize = 0x90;
+const FIFO_DEPTH: u32 = 32;
+const PORTS: u32 = 1;
+const DEFAULT_BAUD: u32 = 115200;
+const POLL_RETRIES: usize = 100_000;
+const MAX_BIT_PERIOD: u32 = 65536;
+const MAX_BAUD: u32 = 4000000;
+
+const UTX_CONFIG: usize = 0x00;
+const URX_CONFIG: usize = 0x04;
+const BIT_PRD: usize = 0x08;
+const DATA_CONFIG: usize = 0x0c;
+const SW_MODE: usize = 0x1c;
+const INT_MASK: usize = 0x24;
+const INT_EN: usize = 0x2c;
+const STATUS: usize = 0x30;
+const FIFO_CONFIG0: usize = 0x80;
+const FIFO_CONFIG1: usize = 0x84;
+const FIFO_WDATA: usize = 0x88;
+
+// BL808 UART register fields, named after the reference manual.
+const UTX_EN: u32 = 1 << 0;
+const UTX_FRM_EN: u32 = 1 << 2;
+const UTX_PRT_EN: u32 = 1 << 4;
+const UTX_PRT_SEL: u32 = 1 << 5;
+const UTX_BIT_CNT_D_SHIFT: u32 = 8;
+const UTX_BIT_CNT_P_SHIFT: u32 = 11;
+const UTX_STOP_ONE: u32 = 1 << UTX_BIT_CNT_P_SHIFT;
+const UTX_STOP_TWO: u32 = 3 << UTX_BIT_CNT_P_SHIFT;
+const UTX_BUS_BUSY: u32 = 1 << 0;
+const TX_FIFO_CNT_MASK: u32 = 0x3f;
+const URX_BIT_PRD_SHIFT: u32 = 16;
+
+kernel::sync::global_lock! {
+    // SAFETY: Initialized once in module init, before registering the platform driver.
+    unsafe(uninit) static SERIAL: Mutex<Option<Arc<serial::Driver<Hardware>>>> = None;
+}
+
+struct SerialOwner;
+
+impl SerialOwner {
+    fn new(module: &'static ThisModule) -> Result<Self> {
+        // SAFETY: Module init runs once per load, before any access to SERIAL.
+        unsafe { SERIAL.init() };
+        *SERIAL.lock() = Some(Arc::pin_init(
+            serial::Driver::new(
+                DriverConfig {
+                    name: c"bflb_uart",
+                    device_name: c"ttyBFLB",
+                    ports: PORTS,
+                    default_baud: DEFAULT_BAUD,
+                },
+                module,
+            ),
+            GFP_KERNEL,
+        )?);
+        Ok(Self)
+    }
+}
+
+impl Drop for SerialOwner {
+    fn drop(&mut self) {
+        SERIAL.lock().take();
+    }
+}
+
+#[pin_data]
+struct UartModule {
+    // Fields drop in declaration order: remove platform devices and drain their
+    // serial callbacks before releasing the module's serial-driver reference.
+    #[pin]
+    _platform: driver::Registration<platform::Adapter<Uart>>,
+    _serial: SerialOwner,
+}
+
+impl kernel::InPlaceModule for UartModule {
+    fn init(module: &'static ThisModule) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            // Publish the serial driver before platform registration can probe.
+            _serial: SerialOwner::new(module)?,
+            _platform <- driver::Registration::new(c"bflb_uart", module),
+        })
+    }
+}
+
+module! {
+    type: UartModule,
+    name: "bflb_uart",
+    authors: ["Kwanghoon Son"],
+    description: "Bouffalo Lab polling serial console",
+    license: "GPL",
+}
+
+struct Uart;
+
+kernel::of_device_table!(OF_TABLE, (), [(of::DeviceId::new(c"bflb,uart"), ())]);
+
+impl Uart {
+    fn register(pdev: &platform::Device<Core<'_>>) -> Result {
+        let dev: &Device<Bound> = pdev.as_ref();
+        let mapbase = pdev.resource_by_index(0).ok_or(ENODEV)?.start();
+        let io = pdev
+            .io_request_by_index(0)
+            .ok_or(ENODEV)?
+            .iomap_exclusive_sized::<REG_SIZE>()?
+            .into_devres()?;
+        let baud = EnabledClock::get(dev, c"baud")?;
+        let clock = u32::try_from(baud.0.rate().as_hz())?;
+        if clock == 0 {
+            return Err(EINVAL);
+        }
+        let serial = SERIAL.lock().as_ref().ok_or(ENODEV)?.clone();
+        serial::register_port(
+            serial,
+            dev,
+            serial::PortConfig {
+                line: 0,
+                mapbase,
+                clock,
+                fifo_size: FIFO_DEPTH,
+            },
+            Ok(Hardware {
+                io,
+                clock,
+                _baud: baud,
+            }),
+        )?;
+        Ok(())
+    }
+}
+
+impl platform::Driver for Uart {
+    type IdInfo = ();
+    type Data<'bound> = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe<'bound>(
+        pdev: &'bound platform::Device<Core<'_>>,
+        _info: Option<&'bound ()>,
+    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
+        Self::register(pdev)
+    }
+}
+
+struct EnabledClock(Clk);
+
+impl EnabledClock {
+    fn get(dev: &Device, name: &CStr) -> Result<Self> {
+        let clock = Clk::get(dev, Some(name))?;
+        clock.prepare_enable()?;
+        Ok(Self(clock))
+    }
+}
+
+impl Drop for EnabledClock {
+    fn drop(&mut self) {
+        self.0.disable_unprepare();
+    }
+}
+
+struct Hardware {
+    io: DevresExclusiveIoMem<REG_SIZE>,
+    clock: u32,
+    _baud: EnabledClock,
+}
+
+impl Hardware {
+    fn registers(&self, dev: &Device) -> Option<Registers<'_>> {
+        if !core::ptr::eq(self.io.device(), dev) {
+            return None;
+        }
+        Some(Registers {
+            io: self.io.try_access()?,
+        })
+    }
+}
+
+/// Keeps the mapping alive for the entire non-sleeping register operation.
+/// Unbind can revoke other resources before the serial port itself is removed.
+struct Registers<'a> {
+    io: DevresGuard<'a, ExclusiveIoMem<'static, REG_SIZE>>,
+}
+
+impl Registers<'_> {
+    fn read<const REG: usize>(&self) -> u32 {
+        (&*self.io).as_view().read32(REG)
+    }
+
+    fn write<const REG: usize>(&self, value: u32) {
+        (&*self.io).as_view().write32(value, REG);
+    }
+
+    fn wait_for(&self, ready: impl Fn() -> bool) -> Result {
+        read_poll_timeout_atomic(|| Ok(ready()), |ready| *ready, Delta::ZERO, POLL_RETRIES)?;
+        Ok(())
+    }
+
+    fn write_byte(&self, ch: u8) -> Result {
+        self.wait_for(|| self.read::<FIFO_CONFIG1>() & TX_FIFO_CNT_MASK != 0)?;
+        (&*self.io).as_view().write8(ch, FIFO_WDATA);
+        Ok(())
+    }
+
+    fn tx_empty(&self) -> bool {
+        self.read::<FIFO_CONFIG1>() & TX_FIFO_CNT_MASK == FIFO_DEPTH
+            && self.read::<STATUS>() & UTX_BUS_BUSY == 0
+    }
+
+    fn write_record(&self, bytes: &[u8]) -> Result {
+        for &ch in bytes {
+            if ch == b'\n' {
+                self.write_byte(b'\r')?;
+            }
+            self.write_byte(ch)?;
+        }
+        self.wait_for(|| self.tx_empty())
+    }
+
+    fn mask_interrupts(&self) -> u32 {
+        let saved = self.read::<INT_MASK>();
+        self.write::<INT_MASK>(u32::MAX);
+        saved
+    }
+
+    fn enable_tx(&self) {
+        self.write::<UTX_CONFIG>(self.read::<UTX_CONFIG>() | UTX_EN);
+    }
+
+    fn console_write(&self, bytes: &[u8]) {
+        let saved_mask = self.mask_interrupts();
+        self.enable_tx();
+        let _ = self.write_record(bytes);
+        self.write::<INT_MASK>(saved_mask);
+    }
+}
+
+impl serial::SerialOps for Hardware {
+    fn tx_empty(&self, port: &Port<'_>) -> bool {
+        let Some(registers) = self.registers(port.device()) else {
+            return false;
+        };
+        registers.tx_empty()
+    }
+
+    fn set_termios(&self, port: &LockedPort<'_>, new: &mut Termios, old: Option<&Termios>) {
+        let Some(registers) = self.registers(port.device()) else {
+            return;
+        };
+        new.disable_mark_space_parity();
+        new.disable_hardware_flow_control();
+        let mut tx = (new.char_size() - 1) << UTX_BIT_CNT_D_SHIFT;
+        if new.parity_enabled() {
+            tx |= UTX_PRT_EN;
+            if new.odd_parity() {
+                tx |= UTX_PRT_SEL;
+            }
+        }
+        tx |= if new.two_stop_bits() {
+            UTX_STOP_TWO
+        } else {
+            UTX_STOP_ONE
+        };
+        tx |= UTX_EN | UTX_FRM_EN;
+        let Some(baud) = port.baud_rate(
+            new,
+            old,
+            self.clock.div_ceil(MAX_BIT_PERIOD),
+            self.clock.min(MAX_BAUD),
+        ) else {
+            return;
+        };
+        let baud = baud.get();
+        let divisor = ((u64::from(self.clock) + u64::from(baud) / 2) / u64::from(baud))
+            .clamp(1, u64::from(MAX_BIT_PERIOD)) as u32;
+        let Some(actual_baud) = NonZeroU32::new(self.clock / divisor) else {
+            return;
+        };
+        let _ = registers.wait_for(|| registers.tx_empty());
+        registers.write::<INT_MASK>(u32::MAX);
+        registers.write::<INT_EN>(0);
+        registers.write::<FIFO_CONFIG0>(0);
+        registers.write::<URX_CONFIG>(0);
+        registers.write::<DATA_CONFIG>(0);
+        registers.write::<SW_MODE>(0);
+        registers.write::<BIT_PRD>((divisor - 1) | ((divisor - 1) << URX_BIT_PRD_SHIFT));
+        registers.write::<UTX_CONFIG>(tx);
+        port.configure(new, actual_baud);
+    }
+
+    fn console_write(&self, port: &Port<'_>, bytes: &[u8]) {
+        let Some(registers) = self.registers(port.device()) else {
+            return;
+        };
+        registers.console_write(bytes);
+    }
+}

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
