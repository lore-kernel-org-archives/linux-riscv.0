Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A71E810A8
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 09:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6kcGy1/UiWtGAfZQQJTVbhdQLelxS5OclVjzFIG9cw=; b=VnqfGyyxzIBBPr
	zPO0imCxzICJZnjutVS0T+fZUN6tIFgyjcumr0Kf4umZFKiFbbNhl7lzghAlHWLCX3tetIIplD22B
	TVivpgW3Qwx4PgA2GOm4FUSvpzPxDR0Ma0Ok11u9QcWLGTrvUg29VjmfB9sTGsPqWhj9JFY0FZqVE
	dRm+6kDQM1LkNhYagD6VEHnbz+nbdDdqVa9gxJGVJ5vFU9BIuqToUBMytBpjhLSiLVOXDjnmwE6r3
	xf+iCB5G92Wy+jE9zfZ5jCGKmphMPe3tWGP0RYTDYoQspzY7AW3QbxYb91qzvrGWPy7i8wxBwJKYi
	JpX+P29BlZAYAl0X9G1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQRO-000PvS-0e;
	Wed, 27 Sep 2023 09:02:42 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQRI-000PtD-14
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 09:02:41 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3af57c5c2b8so497775b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805355; x=1696410155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UkW0ME77tEdP9jqhtFX+dKSGmkZo+pd7VelBukenYI=;
        b=RfDi136z0Flvb80QNDNFrNV2hcfUF/2S0IWdJbJpvJsGiogMxpLaReqgaW7Lxldgkh
         bz1svTJI1kjo0JzUCwz87RQ4uF4IkhJoxiMVHKrgWCDjhNaBG4CzZRLkjXDqDIt380WO
         zKRlmfYfqXvvgb4tqg4++F95Y36mJaUsKd8+lk9Yr5jCbk7oKcpve2VK3lVobmheHdwN
         O5JHXeEVrYoMf0hPY1RCAR9vYp7RaDIVmhwSE6DDv15xwbtoRJMXExQYYIyIbcNiZjvc
         +afVkJILLH+KzkRmm1FES0DboxXBxzS4TKOQ2PSlpUTLOngHkpljWpEPyoWKqmR/Je4P
         yN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805355; x=1696410155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UkW0ME77tEdP9jqhtFX+dKSGmkZo+pd7VelBukenYI=;
        b=YC9MsHFA44RxeV27bCxpr1lOhctb/Hf5+aMbdmzi3cSWiwzS+JAp1A9k4p6BzNbMqr
         a8oSHyBXo7GaYXfoGEr0qY/StYUnEMLuzQXWBaFNP3mnOesYcVyL296/qAWJG9XQLPyp
         gAEj9iAnnqmKMxpEQbK4MRuf4nf1yOFVY5Q4jSBsfs3HfqzvWX3OoNkWlvD5lOuPnj4v
         mge8BOsDuwUFwA2FMPKzf6FIbKj1jSP+D/YrbdQ645UUOs4nksrXfk/EX2OPsMQMRkXi
         2Ycyu4JT7CgIKnuaHbFoGde7I8WdJUWbfzpndkJh3zVV20ErVVbH2eFZjgBSUxT2vsMY
         Bneg==
X-Gm-Message-State: AOJu0YyuNQSvTzombp/XgFH6aPRpcvILhpNYQ7yYQqp7c2aUR3K4U4Du
	1OgO7cl2orI0wHhl83o2fiI=
X-Google-Smtp-Source: AGHT+IE/99mLMAzQlR4fHjMMV76ZqLqyB7Fu5dHtGFVBvbPxLObYxaS0tObe1MB1bseOGLarW1Amyg==
X-Received: by 2002:a05:6808:242:b0:3a8:1727:5af4 with SMTP id m2-20020a056808024200b003a817275af4mr1554414oie.24.1695805354874;
        Wed, 27 Sep 2023 02:02:34 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id ca15-20020a056830610f00b006b9443ce478sm2177602otb.27.2023.09.27.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:02:34 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicornxw@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v3 09/11] riscv: dts: add initial Sophgo SG2042 SoC device tree
Date: Wed, 27 Sep 2023 17:02:26 +0800
Message-Id: <e71955fb3a7bb9ed9b6cab0cc81fd60d05d3310a.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_020236_386030_1D628233 
X-CRM114-Status: GOOD (  17.22  )
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

Milk-V Pioneer motherboard is powered by SG2042.

SG2042 is server grade chip with high performance, low power
consumption and high data throughput.
Key features:
- 64 RISC-V cpu cores
- 4 cores per cluster, 16 clusters on chip
- More info is available at [1].

Link: https://en.sophgo.com/product/introduce/sg2042.html [1]

Currently only support booting into console with only uart,
other features will be added soon later.

Reviewed-by: Guo Ren <guoren@kernel.org>
Acked-by: Chao Wei <chao.wei@sophgo.com>
Co-developed-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Co-developed-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
---
 MAINTAINERS                                 |    1 +
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 1880 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi      |  325 ++++
 3 files changed, 2206 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 3fed8e3d273f..08f8fabb54b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20067,6 +20067,7 @@ SOPHGO DEVICETREES
 M:	Chao Wei <chao.wei@sophgo.com>
 M:	Chen Wang <unicornxw@gmail.com>
 S:	Maintained
+F:	arch/riscv/boot/dts/sophgo/
 F:	Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-clint-mswi.yaml
 F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
 F:	Documentation/devicetree/bindings/timer/sophgo,sg2042-clint-mtimer.yaml
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
new file mode 100644
index 000000000000..d2348acea527
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -0,0 +1,1880 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
+ */
+
+/*
+ * c920 declares "rv64gcv", but the version of it's v-ext
+ * is 0.7.1. It's not supported by kernel so we remove "v".
+ */
+#define ISA_BASE	"rv64i"
+#define ISA_EXTENSIONS	\
+	"i", "m", "a", "f", "d", "c", "zicntr", "zicsr", "zifencei", "zihpm"
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <50000000>;
+
+		cpu-map {
+			socket0 {
+				cluster0 {
+					 core0 {
+						cpu = <&cpu0>;
+					 };
+					 core1 {
+						cpu = <&cpu1>;
+					 };
+					 core2 {
+						cpu = <&cpu2>;
+					 };
+					 core3 {
+						cpu = <&cpu3>;
+					 };
+				};
+
+				cluster1 {
+					 core0 {
+						cpu = <&cpu4>;
+					 };
+					 core1 {
+						cpu = <&cpu5>;
+					 };
+					 core2 {
+						cpu = <&cpu6>;
+					 };
+					 core3 {
+						cpu = <&cpu7>;
+					 };
+				};
+
+				cluster2 {
+					 core0 {
+						cpu = <&cpu16>;
+					 };
+					 core1 {
+						cpu = <&cpu17>;
+					 };
+					 core2 {
+						cpu = <&cpu18>;
+					 };
+					 core3 {
+						cpu = <&cpu19>;
+					 };
+				};
+
+				cluster3 {
+					 core0 {
+						cpu = <&cpu20>;
+					 };
+					 core1 {
+						cpu = <&cpu21>;
+					 };
+					 core2 {
+						cpu = <&cpu22>;
+					 };
+					 core3 {
+						cpu = <&cpu23>;
+					 };
+				};
+
+				cluster4 {
+					 core0 {
+						cpu = <&cpu8>;
+					 };
+					 core1 {
+						cpu = <&cpu9>;
+					 };
+					 core2 {
+						cpu = <&cpu10>;
+					 };
+					 core3 {
+						cpu = <&cpu11>;
+					 };
+				};
+
+				cluster5 {
+					 core0 {
+						cpu = <&cpu12>;
+					 };
+					 core1 {
+						cpu = <&cpu13>;
+					 };
+					 core2 {
+						cpu = <&cpu14>;
+					 };
+					 core3 {
+						cpu = <&cpu15>;
+					 };
+				};
+
+				cluster6 {
+					 core0 {
+						cpu = <&cpu24>;
+					 };
+					 core1 {
+						cpu = <&cpu25>;
+					 };
+					 core2 {
+						cpu = <&cpu26>;
+					 };
+					 core3 {
+						cpu = <&cpu27>;
+					 };
+				};
+
+				cluster7 {
+					 core0 {
+						cpu = <&cpu28>;
+					 };
+					 core1 {
+						cpu = <&cpu29>;
+					 };
+					 core2 {
+						cpu = <&cpu30>;
+					 };
+					 core3 {
+						cpu = <&cpu31>;
+					 };
+				};
+
+				cluster8 {
+					 core0 {
+						cpu = <&cpu32>;
+					 };
+					 core1 {
+						cpu = <&cpu33>;
+					 };
+					 core2 {
+						cpu = <&cpu34>;
+					 };
+					 core3 {
+						cpu = <&cpu35>;
+					 };
+				};
+
+				cluster9 {
+					 core0 {
+						cpu = <&cpu36>;
+					 };
+					 core1 {
+						cpu = <&cpu37>;
+					 };
+					 core2 {
+						cpu = <&cpu38>;
+					 };
+					 core3 {
+						cpu = <&cpu39>;
+					 };
+				};
+
+				cluster10 {
+					 core0 {
+						cpu = <&cpu48>;
+					 };
+					 core1 {
+						cpu = <&cpu49>;
+					 };
+					 core2 {
+						cpu = <&cpu50>;
+					 };
+					 core3 {
+						cpu = <&cpu51>;
+					 };
+				};
+
+				cluster11 {
+					 core0 {
+						cpu = <&cpu52>;
+					 };
+					 core1 {
+						cpu = <&cpu53>;
+					 };
+					 core2 {
+						cpu = <&cpu54>;
+					 };
+					 core3 {
+						cpu = <&cpu55>;
+					 };
+				};
+
+				cluster12 {
+					 core0 {
+						cpu = <&cpu40>;
+					 };
+					 core1 {
+						cpu = <&cpu41>;
+					 };
+					 core2 {
+						cpu = <&cpu42>;
+					 };
+					 core3 {
+						cpu = <&cpu43>;
+					 };
+				};
+
+				cluster13 {
+					 core0 {
+						cpu = <&cpu44>;
+					 };
+					 core1 {
+						cpu = <&cpu45>;
+					 };
+					 core2 {
+						cpu = <&cpu46>;
+					 };
+					 core3 {
+						cpu = <&cpu47>;
+					 };
+				};
+
+				cluster14 {
+					 core0 {
+						cpu = <&cpu56>;
+					 };
+					 core1 {
+						cpu = <&cpu57>;
+					 };
+					 core2 {
+						cpu = <&cpu58>;
+					 };
+					 core3 {
+						cpu = <&cpu59>;
+					 };
+				};
+
+				cluster15 {
+					 core0 {
+						cpu = <&cpu60>;
+					 };
+					 core1 {
+						cpu = <&cpu61>;
+					 };
+					 core2 {
+						cpu = <&cpu62>;
+					 };
+					 core3 {
+						cpu = <&cpu63>;
+					 };
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <0>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <1>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <2>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <3>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu4: cpu@4 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <4>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu5: cpu@5 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <5>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu6: cpu@6 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <6>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu7: cpu@7 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <7>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu8: cpu@8 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <8>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache4>;
+			mmu-type = "riscv,sv39";
+
+			cpu8_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu9: cpu@9 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <9>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache4>;
+			mmu-type = "riscv,sv39";
+
+			cpu9_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu10: cpu@10 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <10>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache4>;
+			mmu-type = "riscv,sv39";
+
+			cpu10_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu11: cpu@11 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <11>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache4>;
+			mmu-type = "riscv,sv39";
+
+			cpu11_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu12: cpu@12 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <12>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache5>;
+			mmu-type = "riscv,sv39";
+
+			cpu12_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu13: cpu@13 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <13>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache5>;
+			mmu-type = "riscv,sv39";
+
+			cpu13_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu14: cpu@14 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <14>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache5>;
+			mmu-type = "riscv,sv39";
+
+			cpu14_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu15: cpu@15 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <15>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache5>;
+			mmu-type = "riscv,sv39";
+
+			cpu15_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu16: cpu@16 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <16>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache2>;
+			mmu-type = "riscv,sv39";
+
+			cpu16_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu17: cpu@17 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <17>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache2>;
+			mmu-type = "riscv,sv39";
+
+			cpu17_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu18: cpu@18 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <18>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache2>;
+			mmu-type = "riscv,sv39";
+
+			cpu18_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu19: cpu@19 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <19>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache2>;
+			mmu-type = "riscv,sv39";
+
+			cpu19_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu20: cpu@20 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <20>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache3>;
+			mmu-type = "riscv,sv39";
+
+			cpu20_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu21: cpu@21 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <21>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache3>;
+			mmu-type = "riscv,sv39";
+
+			cpu21_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu22: cpu@22 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <22>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache3>;
+			mmu-type = "riscv,sv39";
+
+			cpu22_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu23: cpu@23 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <23>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache3>;
+			mmu-type = "riscv,sv39";
+
+			cpu23_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu24: cpu@24 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <24>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache6>;
+			mmu-type = "riscv,sv39";
+
+			cpu24_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu25: cpu@25 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <25>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache6>;
+			mmu-type = "riscv,sv39";
+
+			cpu25_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu26: cpu@26 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <26>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache6>;
+			mmu-type = "riscv,sv39";
+
+			cpu26_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu27: cpu@27 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <27>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache6>;
+			mmu-type = "riscv,sv39";
+
+			cpu27_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu28: cpu@28 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <28>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache7>;
+			mmu-type = "riscv,sv39";
+
+			cpu28_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu29: cpu@29 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <29>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache7>;
+			mmu-type = "riscv,sv39";
+
+			cpu29_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu30: cpu@30 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <30>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache7>;
+			mmu-type = "riscv,sv39";
+
+			cpu30_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu31: cpu@31 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <31>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache7>;
+			mmu-type = "riscv,sv39";
+
+			cpu31_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu32: cpu@32 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <32>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache8>;
+			mmu-type = "riscv,sv39";
+
+			cpu32_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu33: cpu@33 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <33>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache8>;
+			mmu-type = "riscv,sv39";
+
+			cpu33_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu34: cpu@34 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <34>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache8>;
+			mmu-type = "riscv,sv39";
+
+			cpu34_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu35: cpu@35 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <35>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache8>;
+			mmu-type = "riscv,sv39";
+
+			cpu35_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu36: cpu@36 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <36>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache9>;
+			mmu-type = "riscv,sv39";
+
+			cpu36_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu37: cpu@37 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <37>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache9>;
+			mmu-type = "riscv,sv39";
+
+			cpu37_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu38: cpu@38 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <38>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache9>;
+			mmu-type = "riscv,sv39";
+
+			cpu38_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu39: cpu@39 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <39>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache9>;
+			mmu-type = "riscv,sv39";
+
+			cpu39_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu40: cpu@40 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <40>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache12>;
+			mmu-type = "riscv,sv39";
+
+			cpu40_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu41: cpu@41 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <41>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache12>;
+			mmu-type = "riscv,sv39";
+
+			cpu41_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu42: cpu@42 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <42>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache12>;
+			mmu-type = "riscv,sv39";
+
+			cpu42_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu43: cpu@43 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <43>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache12>;
+			mmu-type = "riscv,sv39";
+
+			cpu43_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu44: cpu@44 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <44>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache13>;
+			mmu-type = "riscv,sv39";
+
+			cpu44_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu45: cpu@45 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <45>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache13>;
+			mmu-type = "riscv,sv39";
+
+			cpu45_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu46: cpu@46 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <46>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache13>;
+			mmu-type = "riscv,sv39";
+
+			cpu46_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu47: cpu@47 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <47>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache13>;
+			mmu-type = "riscv,sv39";
+
+			cpu47_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu48: cpu@48 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <48>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache10>;
+			mmu-type = "riscv,sv39";
+
+			cpu48_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu49: cpu@49 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <49>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache10>;
+			mmu-type = "riscv,sv39";
+
+			cpu49_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu50: cpu@50 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <50>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache10>;
+			mmu-type = "riscv,sv39";
+
+			cpu50_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu51: cpu@51 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <51>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache10>;
+			mmu-type = "riscv,sv39";
+
+			cpu51_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu52: cpu@52 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <52>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache11>;
+			mmu-type = "riscv,sv39";
+
+			cpu52_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu53: cpu@53 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <53>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache11>;
+			mmu-type = "riscv,sv39";
+
+			cpu53_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu54: cpu@54 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <54>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache11>;
+			mmu-type = "riscv,sv39";
+
+			cpu54_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu55: cpu@55 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <55>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache11>;
+			mmu-type = "riscv,sv39";
+
+			cpu55_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu56: cpu@56 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <56>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache14>;
+			mmu-type = "riscv,sv39";
+
+			cpu56_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu57: cpu@57 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <57>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache14>;
+			mmu-type = "riscv,sv39";
+
+			cpu57_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu58: cpu@58 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <58>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache14>;
+			mmu-type = "riscv,sv39";
+
+			cpu58_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu59: cpu@59 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <59>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache14>;
+			mmu-type = "riscv,sv39";
+
+			cpu59_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu60: cpu@60 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <60>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache15>;
+			mmu-type = "riscv,sv39";
+
+			cpu60_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu61: cpu@61 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <61>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache15>;
+			mmu-type = "riscv,sv39";
+
+			cpu61_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu62: cpu@62 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <62>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache15>;
+			mmu-type = "riscv,sv39";
+
+			cpu62_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu63: cpu@63 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = ISA_BASE;
+			riscv,isa-extensions = ISA_EXTENSIONS;
+			reg = <63>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache15>;
+			mmu-type = "riscv,sv39";
+
+			cpu63_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		l2_cache0: cache-controller-0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache1: cache-controller-1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache2: cache-controller-2 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache3: cache-controller-3 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache4: cache-controller-4 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache5: cache-controller-5 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache6: cache-controller-6 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache7: cache-controller-7 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache8: cache-controller-8 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache9: cache-controller-9 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache10: cache-controller-10 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache11: cache-controller-11 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache12: cache-controller-12 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache13: cache-controller-13 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache14: cache-controller-14 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_cache15: cache-controller-15 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
new file mode 100644
index 000000000000..92935ceac941
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
+ */
+
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "sg2042-cpus.dtsi"
+
+/ {
+	compatible = "sophgo,sg2042";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	dma-noncoherent;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		clint_mswi: interrupt-controller@7094000000 {
+			compatible = "sophgo,sg2042-clint-mswi";
+			reg = <0x00000070 0x94000000 0x00000000 0x00004000>;
+			interrupts-extended = <&cpu0_intc 3>,
+					      <&cpu1_intc 3>,
+					      <&cpu2_intc 3>,
+					      <&cpu3_intc 3>,
+					      <&cpu4_intc 3>,
+					      <&cpu5_intc 3>,
+					      <&cpu6_intc 3>,
+					      <&cpu7_intc 3>,
+					      <&cpu8_intc 3>,
+					      <&cpu9_intc 3>,
+					      <&cpu10_intc 3>,
+					      <&cpu11_intc 3>,
+					      <&cpu12_intc 3>,
+					      <&cpu13_intc 3>,
+					      <&cpu14_intc 3>,
+					      <&cpu15_intc 3>,
+					      <&cpu16_intc 3>,
+					      <&cpu17_intc 3>,
+					      <&cpu18_intc 3>,
+					      <&cpu19_intc 3>,
+					      <&cpu20_intc 3>,
+					      <&cpu21_intc 3>,
+					      <&cpu22_intc 3>,
+					      <&cpu23_intc 3>,
+					      <&cpu24_intc 3>,
+					      <&cpu25_intc 3>,
+					      <&cpu26_intc 3>,
+					      <&cpu27_intc 3>,
+					      <&cpu28_intc 3>,
+					      <&cpu29_intc 3>,
+					      <&cpu30_intc 3>,
+					      <&cpu31_intc 3>,
+					      <&cpu32_intc 3>,
+					      <&cpu33_intc 3>,
+					      <&cpu34_intc 3>,
+					      <&cpu35_intc 3>,
+					      <&cpu36_intc 3>,
+					      <&cpu37_intc 3>,
+					      <&cpu38_intc 3>,
+					      <&cpu39_intc 3>,
+					      <&cpu40_intc 3>,
+					      <&cpu41_intc 3>,
+					      <&cpu42_intc 3>,
+					      <&cpu43_intc 3>,
+					      <&cpu44_intc 3>,
+					      <&cpu45_intc 3>,
+					      <&cpu46_intc 3>,
+					      <&cpu47_intc 3>,
+					      <&cpu48_intc 3>,
+					      <&cpu49_intc 3>,
+					      <&cpu50_intc 3>,
+					      <&cpu51_intc 3>,
+					      <&cpu52_intc 3>,
+					      <&cpu53_intc 3>,
+					      <&cpu54_intc 3>,
+					      <&cpu55_intc 3>,
+					      <&cpu56_intc 3>,
+					      <&cpu57_intc 3>,
+					      <&cpu58_intc 3>,
+					      <&cpu59_intc 3>,
+					      <&cpu60_intc 3>,
+					      <&cpu61_intc 3>,
+					      <&cpu62_intc 3>,
+					      <&cpu63_intc 3>;
+		};
+
+		clint_mtimer0: timer@70ac000000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac000000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu0_intc 7>,
+					      <&cpu1_intc 7>,
+					      <&cpu2_intc 7>,
+					      <&cpu3_intc 7>;
+		};
+
+		clint_mtimer1: timer@70ac010000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac010000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu4_intc 7>,
+					      <&cpu5_intc 7>,
+					      <&cpu6_intc 7>,
+					      <&cpu7_intc 7>;
+		};
+
+		clint_mtimer2: timer@70ac020000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac020000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu8_intc 7>,
+					      <&cpu9_intc 7>,
+					      <&cpu10_intc 7>,
+					      <&cpu11_intc 7>;
+		};
+
+		clint_mtimer3: timer@70ac030000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac030000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu12_intc 7>,
+					      <&cpu13_intc 7>,
+					      <&cpu14_intc 7>,
+					      <&cpu15_intc 7>;
+		};
+
+		clint_mtimer4: timer@70ac040000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac040000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu16_intc 7>,
+					      <&cpu17_intc 7>,
+					      <&cpu18_intc 7>,
+					      <&cpu19_intc 7>;
+		};
+
+		clint_mtimer5: timer@70ac050000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac050000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu20_intc 7>,
+					      <&cpu21_intc 7>,
+					      <&cpu22_intc 7>,
+					      <&cpu23_intc 7>;
+		};
+
+		clint_mtimer6: timer@70ac060000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac060000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu24_intc 7>,
+					      <&cpu25_intc 7>,
+					      <&cpu26_intc 7>,
+					      <&cpu27_intc 7>;
+		};
+
+		clint_mtimer7: timer@70ac070000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac070000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu28_intc 7>,
+					      <&cpu29_intc 7>,
+					      <&cpu30_intc 7>,
+					      <&cpu31_intc 7>;
+		};
+
+		clint_mtimer8: timer@70ac080000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac080000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu32_intc 7>,
+					      <&cpu33_intc 7>,
+					      <&cpu34_intc 7>,
+					      <&cpu35_intc 7>;
+		};
+
+		clint_mtimer9: timer@70ac090000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac090000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu36_intc 7>,
+					      <&cpu37_intc 7>,
+					      <&cpu38_intc 7>,
+					      <&cpu39_intc 7>;
+		};
+
+		clint_mtimer10: timer@70ac0a0000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac0a0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu40_intc 7>,
+					      <&cpu41_intc 7>,
+					      <&cpu42_intc 7>,
+					      <&cpu43_intc 7>;
+		};
+
+		clint_mtimer11: timer@70ac0b0000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac0b0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu44_intc 7>,
+					      <&cpu45_intc 7>,
+					      <&cpu46_intc 7>,
+					      <&cpu47_intc 7>;
+		};
+
+		clint_mtimer12: timer@70ac0c0000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac0c0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu48_intc 7>,
+					      <&cpu49_intc 7>,
+					      <&cpu50_intc 7>,
+					      <&cpu51_intc 7>;
+		};
+
+		clint_mtimer13: timer@70ac0d0000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac0d0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu52_intc 7>,
+					      <&cpu53_intc 7>,
+					      <&cpu54_intc 7>,
+					      <&cpu55_intc 7>;
+		};
+
+		clint_mtimer14: timer@70ac0e0000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac0e0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu56_intc 7>,
+					      <&cpu57_intc 7>,
+					      <&cpu58_intc 7>,
+					      <&cpu59_intc 7>;
+		};
+
+		clint_mtimer15: timer@70ac0f0000 {
+			compatible = "sophgo,sg2042-clint-mtimer";
+			reg = <0x00000070 0xac0f0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <&cpu60_intc 7>,
+					      <&cpu61_intc 7>,
+					      <&cpu62_intc 7>,
+					      <&cpu63_intc 7>;
+		};
+
+		intc: interrupt-controller@7090000000 {
+			compatible = "sophgo,sg2042-plic", "thead,c900-plic";
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			reg = <0x00000070 0x90000000 0x00000000 0x04000000>;
+			interrupt-controller;
+			interrupts-extended =
+				<&cpu0_intc 0xffffffff>,  <&cpu0_intc 9>,
+				<&cpu1_intc 0xffffffff>,  <&cpu1_intc 9>,
+				<&cpu2_intc 0xffffffff>,  <&cpu2_intc 9>,
+				<&cpu3_intc 0xffffffff>,  <&cpu3_intc 9>,
+				<&cpu4_intc 0xffffffff>,  <&cpu4_intc 9>,
+				<&cpu5_intc 0xffffffff>,  <&cpu5_intc 9>,
+				<&cpu6_intc 0xffffffff>,  <&cpu6_intc 9>,
+				<&cpu7_intc 0xffffffff>,  <&cpu7_intc 9>,
+				<&cpu8_intc 0xffffffff>,  <&cpu8_intc 9>,
+				<&cpu9_intc 0xffffffff>,  <&cpu9_intc 9>,
+				<&cpu10_intc 0xffffffff>, <&cpu10_intc 9>,
+				<&cpu11_intc 0xffffffff>, <&cpu11_intc 9>,
+				<&cpu12_intc 0xffffffff>, <&cpu12_intc 9>,
+				<&cpu13_intc 0xffffffff>, <&cpu13_intc 9>,
+				<&cpu14_intc 0xffffffff>, <&cpu14_intc 9>,
+				<&cpu15_intc 0xffffffff>, <&cpu15_intc 9>,
+				<&cpu16_intc 0xffffffff>, <&cpu16_intc 9>,
+				<&cpu17_intc 0xffffffff>, <&cpu17_intc 9>,
+				<&cpu18_intc 0xffffffff>, <&cpu18_intc 9>,
+				<&cpu19_intc 0xffffffff>, <&cpu19_intc 9>,
+				<&cpu20_intc 0xffffffff>, <&cpu20_intc 9>,
+				<&cpu21_intc 0xffffffff>, <&cpu21_intc 9>,
+				<&cpu22_intc 0xffffffff>, <&cpu22_intc 9>,
+				<&cpu23_intc 0xffffffff>, <&cpu23_intc 9>,
+				<&cpu24_intc 0xffffffff>, <&cpu24_intc 9>,
+				<&cpu25_intc 0xffffffff>, <&cpu25_intc 9>,
+				<&cpu26_intc 0xffffffff>, <&cpu26_intc 9>,
+				<&cpu27_intc 0xffffffff>, <&cpu27_intc 9>,
+				<&cpu28_intc 0xffffffff>, <&cpu28_intc 9>,
+				<&cpu29_intc 0xffffffff>, <&cpu29_intc 9>,
+				<&cpu30_intc 0xffffffff>, <&cpu30_intc 9>,
+				<&cpu31_intc 0xffffffff>, <&cpu31_intc 9>,
+				<&cpu32_intc 0xffffffff>, <&cpu32_intc 9>,
+				<&cpu33_intc 0xffffffff>, <&cpu33_intc 9>,
+				<&cpu34_intc 0xffffffff>, <&cpu34_intc 9>,
+				<&cpu35_intc 0xffffffff>, <&cpu35_intc 9>,
+				<&cpu36_intc 0xffffffff>, <&cpu36_intc 9>,
+				<&cpu37_intc 0xffffffff>, <&cpu37_intc 9>,
+				<&cpu38_intc 0xffffffff>, <&cpu38_intc 9>,
+				<&cpu39_intc 0xffffffff>, <&cpu39_intc 9>,
+				<&cpu40_intc 0xffffffff>, <&cpu40_intc 9>,
+				<&cpu41_intc 0xffffffff>, <&cpu41_intc 9>,
+				<&cpu42_intc 0xffffffff>, <&cpu42_intc 9>,
+				<&cpu43_intc 0xffffffff>, <&cpu43_intc 9>,
+				<&cpu44_intc 0xffffffff>, <&cpu44_intc 9>,
+				<&cpu45_intc 0xffffffff>, <&cpu45_intc 9>,
+				<&cpu46_intc 0xffffffff>, <&cpu46_intc 9>,
+				<&cpu47_intc 0xffffffff>, <&cpu47_intc 9>,
+				<&cpu48_intc 0xffffffff>, <&cpu48_intc 9>,
+				<&cpu49_intc 0xffffffff>, <&cpu49_intc 9>,
+				<&cpu50_intc 0xffffffff>, <&cpu50_intc 9>,
+				<&cpu51_intc 0xffffffff>, <&cpu51_intc 9>,
+				<&cpu52_intc 0xffffffff>, <&cpu52_intc 9>,
+				<&cpu53_intc 0xffffffff>, <&cpu53_intc 9>,
+				<&cpu54_intc 0xffffffff>, <&cpu54_intc 9>,
+				<&cpu55_intc 0xffffffff>, <&cpu55_intc 9>,
+				<&cpu56_intc 0xffffffff>, <&cpu56_intc 9>,
+				<&cpu57_intc 0xffffffff>, <&cpu57_intc 9>,
+				<&cpu58_intc 0xffffffff>, <&cpu58_intc 9>,
+				<&cpu59_intc 0xffffffff>, <&cpu59_intc 9>,
+				<&cpu60_intc 0xffffffff>, <&cpu60_intc 9>,
+				<&cpu61_intc 0xffffffff>, <&cpu61_intc 9>,
+				<&cpu62_intc 0xffffffff>, <&cpu62_intc 9>,
+				<&cpu63_intc 0xffffffff>, <&cpu63_intc 9>;
+			riscv,ndev = <224>;
+		};
+
+		uart0: serial@7040000000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x00000070 0x40000000 0x00000000 0x00001000>;
+			interrupt-parent = <&intc>;
+			interrupts = <112 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <500000000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
