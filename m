Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69A6D277D0
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhasoogsumbNeA/BfoLzTQToYkBeKBXhkLFLtSKQYRk=; b=P0xj/3DEx1WqfU
	kdkcJSUKsfx614GVKHZYLAqObvhcyz0SBiQaHjPMbkKjwZuhqq/7/7adEltURcBTlYB4gewVCF0L+
	ytZctXm9Zud1MwLF+qkAWtnkNrSUD6Y67Pe/gjbHH/6Y9SyeT5S1Sz9Cc8OKroMNPribUMrm3rhbV
	0e9eiCJWj1g5ac5Gh56aO+p0+WxFwShsc7CacQYMele3cqowVNd3rWEQNhDjH4zui4XRKETGLU2Kp
	ZoBAiVErUkVbYxjz3TIfNTct4lcB6huyIPRkHC45leHb8GiRj5M4MP7f8br3IOib1QVs6D9qLYsj7
	9qP9yQ9Xsma8aye9t2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRP1-00000003GLH-005a;
	Sat, 10 Jan 2026 05:20:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veROy-00000003GJe-10EW
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:20:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a081c163b0so34013565ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022439; x=1768627239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wN8PVqzzAZZHRjxdINCBCNKySb3WeVOzy7dnQm8uUnI=;
        b=BOt3rFppQeEv2Dze7LNnAgRGEOpzzovSXDbs+jV846uFRWN8eANbTgrg5pTjYrvu7W
         7J/BkatomnVB6yuL+hwyUwmZ4gzARLmTYSHRlN3/tB5SO65GWqJgcVgD+6gployQOxqd
         cPavTL4PRDk6eLi+Q5s2Ouownms0/1uF9EqohVY0DCBk27dutV5Ers7P/WmOq1rEP9Jo
         0fqsq+zhTRmS8rTNNBP4vvKeAoZ5qgVEW69ft8GZ9rzEfakR//zN7JDeY/blY0LnCPwU
         HfoqQ6lxktXyrlkjr1PmosykUCt5OBw1iR/oSgCzlXYI2wV9lQDhYibd2dyzXZpPgqmV
         WvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022439; x=1768627239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wN8PVqzzAZZHRjxdINCBCNKySb3WeVOzy7dnQm8uUnI=;
        b=q9pkqr5K0zyJY499KW60U8B+ktetcO1JSXZBM1tVaIp3ZXZS/NDaWGh3LJdKHTep4j
         xAkPe73iFPLgM1br3pIfffDnJ/Q9ZqKz4vKxIVfTuqwuCSxBSXeWB5fo4lGvNscG/vA9
         qZj5VaZaQSa1uKFjwyI/4JxDPZATBCpFoF1UKNuUTvrRGcY8GvJD+TqddH/rv4zy5jFj
         DatskoE4Kt71wlKQ+BM/vzgHYbs/Vma8HwbAKy9+3iCXkHfgJKdydzCc32FGz/EtPPYU
         jlxaFFQOe3UojDN/B2aHtZFAaBS6D9I9dh1LpvF9OPrnvDmodNu4k+24DrLAprnTPRuh
         VuAg==
X-Forwarded-Encrypted: i=1; AJvYcCWHgspoO/6nRW5Hnv/dDP32TieyyNjYJqqJ7Ab+pXZFAI5IJ92U0Rahmcrd2PTYNrfOcrqLRdpvuEi06g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfCVL0ecaX6AZGr+NwWm2HwRQJfnBQvN9MZ0+GhxBUyIe0z6ff
	aP9Rkqe6qFqCqyiPL5DGa+xTiTcw08ek+gUzb5epQlXHmZw78sUAikcjCU4ziKw+pKI=
X-Gm-Gg: AY/fxX4sT0A6F1F82Ollje37ty5XlFPM+liywJA1cYEWGexTB1jXjJ95ObEOfLgVkyQ
	T6r9B8gjs0psk0UqABZZMnIFVJMJ8AMKyRH1C//RycOoSP0SPeRvcm1E9JIpYdvT68Gk9FGzX/q
	+5ccNTN1NWFMc8ih5H0NJR1RJ9jg3xzVlSAEOC0st97gb4lQ9NGV7iMpX4Ly2rWK3QoahyvHlxz
	DpYmEOo07FSiz/KXQwy6XK5r3wCh+onnwetbkiAWFr2WXlhiGOgsylMwM9j5vI2aU6QBLe3Vihh
	Q6WHJk9UVBQZ28sSVMf84x9+5oYeIQfHS8/+UMyJbAtnB/JXyrmMTaTsGYnh3TO7+JtX+CkqcEl
	OIMyJK63z85jXjYRSVOxsyLWkZkMGL5LxTxrH/Mvv8V3HHbKTrjbtL309GE4ZlRtwqHfYQob9xj
	fFsR8LlJ+HIsv8y+EApnhm1Sj+qfkP2SXCv88r8AiJk38Pw8fmR8hziQ==
X-Google-Smtp-Source: AGHT+IGZtSmMwR6cKIPymm7XZZ9fkMJA6J3bFnj8XPrkJ3tLZRy9i+zl/jYj9RHZFiRlyHqgY3b88A==
X-Received: by 2002:a17:903:2341:b0:2a0:c1ed:c8c2 with SMTP id d9443c01a7336-2a3ee4b4497mr98060915ad.55.1768022439138;
        Fri, 09 Jan 2026 21:20:39 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:20:38 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:22 +0800
Subject: [PATCH v4 10/11] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-10-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
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
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_212040_318700_935488A7 
X-CRM114-Status: GOOD (  10.80  )
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
v4: Fix missing blank space after commas in compatible string.
    Add m-mode imsic and aplic node.
    Reorder properties in simsic, saplic, mimsic, and maplic nodes
     to match DTS coding style.
v3: Remove "supm" from the riscv,isa-extensions list.
v2: Remove aliases from k3.dtsi, they should be in board DTS.
    Updated riscv,isa-extensions with new extensions from the extensions.yaml.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 590 +++++++++++++++++++++++++++++++++++
 1 file changed, 590 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
new file mode 100644
index 000000000000..a815f85cf5a6
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -0,0 +1,590 @@
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "sha", "shcounterenw", "shgatpa", "shtvala",
+					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
+					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
+					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
+					       "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt", "za64rs",
+					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
+					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
+					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
+					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
+					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
+					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
+					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
+					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
+			status = "disabled";
+		};
+
+		simsic: interrupt-controller@e0400000 {
+			compatible = "spacemit,k3-imsics", "riscv,imsics";
+			reg = <0x0 0xe0400000 0x0 0x200000>;
+			#interrupt-cells = <0>;
+			#msi-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
+					      <&cpu2_intc 9>, <&cpu3_intc 9>,
+					      <&cpu4_intc 9>, <&cpu5_intc 9>,
+					      <&cpu6_intc 9>, <&cpu7_intc 9>;
+			msi-controller;
+			riscv,guest-index-bits = <6>;
+			riscv,hart-index-bits = <4>;
+			riscv,num-guest-ids = <511>;
+			riscv,num-ids = <511>;
+		};
+
+		saplic: interrupt-controller@e0804000 {
+			compatible = "spacemit,k3-aplic", "riscv,aplic";
+			reg = <0x0 0xe0804000 0x0 0x4000>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			msi-parent = <&simsic>;
+			riscv,num-sources = <512>;
+		};
+
+		clint: timer@e081c000 {
+			compatible = "spacemit,k3-clint", "sifive,clint0";
+			reg = <0x0 0xe081c000 0x0 0x4000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>,
+					      <&cpu4_intc 3>, <&cpu4_intc 7>,
+					      <&cpu5_intc 3>, <&cpu5_intc 7>,
+					      <&cpu6_intc 3>, <&cpu6_intc 7>,
+					      <&cpu7_intc 3>, <&cpu7_intc 7>;
+		};
+
+		mimsic: interrupt-controller@f1000000 {
+			compatible = "spacemit,k3-imsics", "riscv,imsics";
+			reg = <0x0 0xf1000000 0x0 0x10000>;
+			#interrupt-cells = <0>;
+			#msi-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>,
+					      <&cpu2_intc 11>, <&cpu3_intc 11>,
+					      <&cpu4_intc 11>, <&cpu5_intc 11>,
+					      <&cpu6_intc 11>, <&cpu7_intc 11>;
+			msi-controller;
+			riscv,guest-index-bits = <6>;
+			riscv,hart-index-bits = <4>;
+			riscv,num-guest-ids = <511>;
+			riscv,num-ids = <511>;
+
+			status = "disabled";
+		};
+
+		maplic: interrupt-controller@f1800000 {
+			compatible = "spacemit,k3-aplic", "riscv,aplic";
+			reg = <0x0 0xf1800000 0x0 0x4000>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			msi-parent = <&mimsic>;
+			riscv,children = <&saplic>;
+			riscv,delegate = <&saplic 1 512>;
+			riscv,num-sources = <512>;
+
+			status = "disabled";
+		};
+	};
+};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
