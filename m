Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CE8D5E151
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JajgC5+E0fnNo43Uu56T99Odbm7yMUcQljQfJocrElE=; b=v8afRRA9WazJyq
	unT+zfjL6NwsZWR/2u+SPy0qz8eUMpfS02VsLltz/+2FHOhWMHfOpkWLBvcT5dxMvJNC56HEm1mp5
	m/FqmzACytLZxXx/NcMFAtyNU0RCrWayI3k81SS1gq5DVlBhPm6HVpkF2Hf/EMUZfSYoyX/LsEC8U
	wWrAJi7xC9RzdafvxHkengp2nIt80QJtZIO5OIbJz2TqD+LDCGuDo4OxCqUPgeRpiYSsYXdsBI0Eg
	4Vz04cn5f+/xkbEkQdsi5KraWiMh/b6tYIBuksXz5M5Pns0lrsmzmkNUMAQQKQj8b8iSbi3daMOeL
	0Y9ZFo9wOnsqRAKuz8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVBz-00000005GzI-1uQb;
	Tue, 16 Dec 2025 13:34:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVBx-00000005GxP-0QaI
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 13:34:18 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a099233e8dso26514225ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892056; x=1766496856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qQ3eHhisvmtOWqdlBLmEdp33CsXRSkulBff6gjbNnc=;
        b=BIjPhjV0LqWtmZXV77ZhTEAdT6oFF5T7MKlv2QtKRZeRCvALlSRCDXzNkoj7gZegFb
         F+bzBh9dRsiSiPqKIFn56UrhaqsiCzpc55i8n93wI86r1CKmUX5Tlw5+0xnH5bp0Byph
         zMqA+xnnBG2/97rmyV8lCNuu+UAgdzM4zGma49iNYcupqYIKoK9k2LehwdQFzY5TNiRT
         PcWeWHYxSNc8kOAcVByyQ62GU+3kHZTknLNrHLs0H90qMBWJb5eAbrrmwrUS1684lahV
         rdMpUWlARv1hVKRfNuTqeI/p+EDoIISFraT8Ca3MRX2r+m0oql7L3pV03EMnocHfx2+Q
         CqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892056; x=1766496856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+qQ3eHhisvmtOWqdlBLmEdp33CsXRSkulBff6gjbNnc=;
        b=KcaeZITXwkU+eil27hhR0V8dqqVRi/fUbRPXxjsnzkhj4Yj21riQmLzkJ1XbaYK/wh
         N7d7D9FkzS7IaTqBpGDlS8e4kBPhOhUSPaoHX+5zJjxAnHl5nReBrl8VsJZIRx+iYqDW
         7wKOv0q/pUlTlDBa0a+/TCi2kPE7rVMqEKLPwQ3Q4/FUAhWW0fpBG/7jWPytua7ymU2p
         tghOgWzYtbLGi3J/b4g4tstPswGQWuH8bUnfyW4Cuep08DMsBrVdQvQI00+X540zFvv2
         4l9T/gYLfXN3f0mVznt2nMQsgnf9G6bbDAG+McLinNh+EWvp7gCIHEdy56c8s8Im+RsU
         bWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfQIepWhAUkH1Y8Rbbs10eSfYx+SzViEd4Spep2Fpg/X8L7Qb80j7YXqT8rej+MaE6Oh2G2jSnzAD7Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRFuzsoy4Uzsoz9Z+JNAoWqaoQqwKCfb9zx5xWL9TwffzneUss
	RPtgc+Ezqa+EPvmmIL3rAdEq7yknleD6c8fKNWTbWqQX+G01NmD1CaTwKRvIEQAjngM=
X-Gm-Gg: AY/fxX4LBjXj6NEHP7/osUT/qyY5zXMOgvbe+anIKrkex7LpjB3YJEgRsZdfGYgQN+H
	SEGzEv/9Cpkc/zr2MpQSm6epQ1pajKmspCX8xZm4zvwciTgoG1+mtAgNzgdleeO/rE1BMFjyh2/
	v0NsDMNpw8JRaLWxTy1MvznR0IA1rHGRknRbRqT/1vXt5ANyrKe3duVASR72m3gCabUTkebLuUq
	sVC83HwJPWLwdDr0CauVVSIAcadB+qwhTi8kQGrpasr9z3SXPm/SrqMJncemxcLF5lxVGHylm0q
	JKmwHbhZgZBBwld2pIu/uvAtFqLlOpzyo8l9VMRVsVAZ/m3xhrv6UqZqyWHADpw+X5/z7PlCmeN
	8CJKqIA3wZqa8mMFMYgwYlcYw/yDTaVGncrvqK2dJJChprqduEBpBVG08iukfqsX2O6VH8+bX2B
	TW/hbgwLemnzI8kANc68Shd6z93Ipuo/ktWWVZDL7ARQ==
X-Google-Smtp-Source: AGHT+IEeOBOd3s5RHNSYePxmYi+3w5U0r2lvSZOjKCgBznCRlzMR+LVjww93EvvVn9vTLNkucmTX5A==
X-Received: by 2002:a17:903:4b27:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-29f2435b8d6mr145169125ad.47.1765892056026;
        Tue, 16 Dec 2025 05:34:16 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:34:15 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:31 +0800
Subject: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
MIME-Version: 1.0
Message-Id: <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053417_176398_A3705D59 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
Add nodes of uarts, timer and interrupt-controllers.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 529 +++++++++++++++++++++++++++++++++++
 1 file changed, 529 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..cb27b790716fdd6dc2bc89c28dd2588a596a5af9
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -0,0 +1,529 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "SpacemiT K3";
+	compatible = "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+		serial6 = &uart6;
+		serial7 = &uart7;
+		serial8 = &uart8;
+		serial9 = &uart9;
+		serial10 = &uart10;
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <24000000>;
+
+		cpu_0: cpu@0 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_1: cpu@1 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <1>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_2: cpu@2 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <2>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_3: cpu@3 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <3>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_4: cpu@4 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <4>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_5: cpu@5 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <5>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_6: cpu@6 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <6>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu_7: cpu@7 {
+			compatible = "spacemit,x100", "riscv";
+			device_type = "cpu";
+			reg = <7>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "h",
+					       "smaia", "smstateen", "ssaia", "sscofpmf",
+					       "ssnpm", "sstc", "svade", "svinval", "svnapot",
+					       "svpbmt", "zawrs", "zba", "zbb", "zbc", "zbs",
+					       "zca", "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicond", "zicsr", "zifencei",
+					       "zihintntl", "zihintpause", "zihpm", "zimop",
+					       "zkt", "zvbb", "zvbc", "zvfbfmin", "zvfbfwma",
+					       "zvfh", "zvfhmin", "zvkb", "zvkg", "zvkn",
+					       "zvknc", "zvkned", "zvkng", "zvknha",
+					       "zvknhb", "zvks", "zvksc", "zvksed",
+					       "zvksg", "zvksh", "zvkt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <256>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		l2_cache0: cache-controller-0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <4194304>;
+			cache-sets = <4096>;
+			cache-unified;
+		};
+
+		l2_cache1: cache-controller-1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <4194304>;
+			cache-sets = <4096>;
+			cache-unified;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu_0>;
+				};
+				core1 {
+					cpu = <&cpu_1>;
+				};
+				core2 {
+					cpu = <&cpu_2>;
+				};
+				core3 {
+					cpu = <&cpu_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu_4>;
+				};
+				core1 {
+					cpu = <&cpu_5>;
+				};
+				core2 {
+					cpu = <&cpu_6>;
+				};
+				core3 {
+					cpu = <&cpu_7>;
+				};
+			};
+		};
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&saplic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-noncoherent;
+		ranges;
+
+		uart0: serial@d4017000 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017000 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart2: serial@d4017100 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017100 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart3: serial@d4017200 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017200 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart4: serial@d4017300 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017300 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart5: serial@d4017400 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017400 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart6: serial@d4017500 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017500 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart7: serial@d4017600 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017600 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart8: serial@d4017700 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017700 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart9: serial@d4017800 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd4017800 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart10: serial@d401f000 {
+			compatible = "spacemit,k3-uart", "intel,xscale-uart";
+			reg = <0x0 0xd401f000 0x0 0x100>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <14700000>;
+			interrupts = <281 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		simsic: interrupt-controller@e0400000 {
+			compatible = "spacemit,k3-imsics","riscv,imsics";
+			reg = <0x0 0xe0400000 0x0 0x00200000>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
+					      <&cpu2_intc 9>, <&cpu3_intc 9>,
+					      <&cpu4_intc 9>, <&cpu5_intc 9>,
+					      <&cpu6_intc 9>, <&cpu7_intc 9>;
+			riscv,num-ids = <511>;
+			riscv,num-guest-ids = <511>;
+			riscv,hart-index-bits = <4>;
+			riscv,guest-index-bits = <6>;
+		};
+
+		saplic: interrupt-controller@e0804000 {
+			compatible = "spacemit,k3-aplic", "riscv,aplic";
+			reg = <0x0 0xe0804000 0x0 0x4000>;
+			msi-parent = <&simsic>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			riscv,num-sources = <512>;
+		};
+
+		clint: timer@e081c000 {
+			compatible = "spacemit,k3-clint", "sifive,clint0";
+			reg = <0x0 0xe081c000 0x0 0x0004000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>,
+					      <&cpu4_intc 3>, <&cpu4_intc 7>,
+					      <&cpu5_intc 3>, <&cpu5_intc 7>,
+					      <&cpu6_intc 3>, <&cpu6_intc 7>,
+					      <&cpu7_intc 3>, <&cpu7_intc 7>;
+		};
+	};
+};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
