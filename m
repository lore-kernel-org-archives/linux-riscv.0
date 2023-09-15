Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361BCEE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xD+bEEDS0YVCdN7hE0qs/dnnK5E1QMwOyv2AfyZTTp4=; b=LlNEYCRdZ4W0Vf
	7BhVS0XGOjJxDuF8lgHiINgtwf30epyQR2eWyEGFb90GQUD62L8ivjygNZ+4wiRumBCKyBuFbIcRJ
	RxK8PnijgtwACnt+3GQyxDOem0DuGEfl5ZXPw55OYFWrYa699ye885fpgTYrKtEIkbXPIos5oLzPE
	MgLmrXmBgIeMKSeHJfuBjOlgiyVoBtG2WLQgCxREmIXyuNQN6LrxnaVOb6tbSLrj3pjhJDKivw/wp
	/7mwmz6xT53zmaE4vQmcZkGxKwAU42VdD9Jv44evuzEO2WFfYVvxCJ1EdmytgmlkuDQlu0UuK0ezC
	qq7v4/jjq2AjglYuctQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3C9-00A1SV-1A;
	Fri, 15 Sep 2023 07:24:53 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3C3-00A1PE-0Z
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:24:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c43fe0c0bfso393595ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694762683; x=1695367483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BzajMisiYeyOfx91NpM7YBF02GOQGnydbW4ZOzgVsp8=;
        b=ULBt9Y86qDqHjaCMQaH6IIXXroC2iKGoiiC3TCwxT6fxKlBIYvJ3LZDTtoN61PeLey
         u/sgGmh9958FqAI5gltIZoTixAqQpwjAZ5++i15scQ5wzJlxb407TsOv7FqLKGEnnnNr
         ElXP8iobDIwn9888CF3py79ltBH24VSrHkt9c1Bv7jFBZvaCd4NzSpV3FrtDxj30lb/7
         7BWy0rvjj+OVaIsiv7sUKAYlgI9x81Eypm4otzCKmkYrZht2w2566Z/OCFgWMHZSgE73
         meB1geUsaQEkGllqiiO3Ft0abGeWGzr7Kgrw1WLASG7HbO4fJ/Ro7itNQc6lGX+CIMkj
         K+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762683; x=1695367483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzajMisiYeyOfx91NpM7YBF02GOQGnydbW4ZOzgVsp8=;
        b=Gk8TmaqCDkc3TvnQseN6gxukz935mDsB3tfO5lwLtk+Npw4QAenlc439NeFFE/NfVi
         /UbDmbSHmnEgPp18ZQWHB/PdP2yA17/Pml4ED8p9mTqA2WdByBii/l31SQbfoR9aOdfS
         dhnV30P3mtihwesjNL0ikeqrVFM1I/sKg3GvNqIoSiHbHFHIMqUE6qgPOe+rLqLfq8rn
         Zhy9AUjQjwpBy7PYBkrUqPxOvKemZBhf9wzytUBZKfxzHlgOoOFctKNzPccNCz+8boGe
         jaagopgmRmnz4sC5vrGHReSAFB76xXIHpODTXbd9kkHYxJhg4a/8hxAhHNOsA/qt0Xek
         oL0Q==
X-Gm-Message-State: AOJu0YxrWBbbrs7iOLdAfJURFUGdiEp+rb/UPQ/AuT665Fz4Sr+2GHPV
	E8/caxqidjdllxUOK16VA/umOOd/Z50njQ==
X-Google-Smtp-Source: AGHT+IESBxBhrxa+ua5AHwaMhv0XjNrWe0Bw4NNlx2C/FjhGxLTkLq7BmzaKEefPj+NWFlT1v0w7IA==
X-Received: by 2002:a17:902:d34d:b0:1c3:4361:ca1e with SMTP id l13-20020a170902d34d00b001c34361ca1emr832398plk.38.1694762682382;
        Fri, 15 Sep 2023 00:24:42 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id i2-20020a170902c94200b001b81a97860asm2786399pla.27.2023.09.15.00.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:24:42 -0700 (PDT)
From: Wang Chen <unicornxw@gmail.com>
X-Google-Original-From: Wang Chen <wangchen20@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	conor@kernel.org,
	aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Wang Chen <wangchen20@iscas.ac.cn>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [PATCH 07/12] riscv: dts: add initial SOPHGO SG2042 SoC device tree
Date: Fri, 15 Sep 2023 15:24:31 +0800
Message-Id: <20230915072431.118154-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002447_226827_21B80DC1 
X-CRM114-Status: GOOD (  14.37  )
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

Milk-V Pioneer motherboard is powered by SOPHON's SG2042.

SG2042 is server grade chip with high performance, low power
consumption and high data throughput.
Key features:
- 64 RISC-V cpu cores which implements IMAFDC
- 4 cores per cluster, 16 clusters on chip
- ......

More info is available at [1].

[1]: https://en.sophgo.com/product/introduce/sg2042.html

Currently only support booting into console with only uart
enabled, other features will be added soon later.

Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
---
 MAINTAINERS                                 |    1 +
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 1794 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi      |  513 ++++++
 3 files changed, 2308 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e0d477dab38..b74d505003e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20068,6 +20068,7 @@ M:	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
 M:	Chao Wei <chao.wei@sophgo.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
+F:	arch/riscv/boot/dts/sophgo/
 
 SOUND
 M:	Jaroslav Kysela <perex@perex.cz>
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
new file mode 100644
index 000000000000..0b6cd3559693
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -0,0 +1,1794 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
+ */
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
+			reg = <0>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu1: cpu@1 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <1>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu2: cpu@2 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <2>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu3: cpu@3 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <3>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache0>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu4: cpu@4 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <4>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu5: cpu@5 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <5>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu6: cpu@6 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <6>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu7: cpu@7 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <7>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache1>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu8: cpu@8 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <8>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache4>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu8_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu9: cpu@9 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <9>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache4>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu9_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu10: cpu@10 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <10>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache4>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu10_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu11: cpu@11 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <11>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache4>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu11_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu12: cpu@12 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <12>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache5>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu12_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu13: cpu@13 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <13>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache5>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu13_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu14: cpu@14 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <14>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache5>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu14_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu15: cpu@15 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <15>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache5>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu15_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu16: cpu@16 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <16>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache2>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu16_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu17: cpu@17 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <17>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache2>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu17_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu18: cpu@18 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <18>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache2>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu18_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu19: cpu@19 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <19>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache2>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu19_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu20: cpu@20 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <20>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache3>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu20_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu21: cpu@21 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <21>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache3>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu21_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu22: cpu@22 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <22>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache3>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu22_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu23: cpu@23 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <23>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache3>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
+			status = "okay";
+
+			cpu23_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu24: cpu@24 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <24>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache6>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu24_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu25: cpu@25 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <25>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache6>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu25_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu26: cpu@26 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <26>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache6>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu26_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu27: cpu@27 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <27>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache6>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu27_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu28: cpu@28 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <28>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache7>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu28_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu29: cpu@29 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <29>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache7>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu29_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu30: cpu@30 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <30>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache7>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu30_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu31: cpu@31 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <31>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache7>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
+			status = "okay";
+
+			cpu31_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu32: cpu@32 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <32>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache8>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu32_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu33: cpu@33 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <33>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache8>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu33_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu34: cpu@34 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <34>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache8>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu34_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu35: cpu@35 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <35>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache8>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu35_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu36: cpu@36 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <36>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache9>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu36_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu37: cpu@37 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <37>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache9>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu37_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu38: cpu@38 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <38>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache9>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu38_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu39: cpu@39 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <39>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache9>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu39_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu40: cpu@40 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <40>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache12>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu40_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu41: cpu@41 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <41>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache12>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu41_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu42: cpu@42 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <42>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache12>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu42_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu43: cpu@43 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <43>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache12>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu43_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu44: cpu@44 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <44>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache13>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu44_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu45: cpu@45 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <45>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache13>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu45_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu46: cpu@46 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <46>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache13>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu46_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu47: cpu@47 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <47>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache13>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu47_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu48: cpu@48 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <48>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache10>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu48_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu49: cpu@49 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <49>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache10>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu49_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu50: cpu@50 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <50>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache10>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu50_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu51: cpu@51 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <51>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache10>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu51_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu52: cpu@52 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <52>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache11>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu52_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu53: cpu@53 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <53>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache11>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu53_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu54: cpu@54 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <54>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache11>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu54_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu55: cpu@55 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <55>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache11>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
+			status = "okay";
+
+			cpu55_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu56: cpu@56 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <56>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache14>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu56_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu57: cpu@57 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <57>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache14>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu57_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu58: cpu@58 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <58>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache14>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu58_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu59: cpu@59 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <59>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache14>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu59_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu60: cpu@60 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <60>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache15>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu60_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu61: cpu@61 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <61>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache15>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu61_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu62: cpu@62 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <62>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache15>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu62_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+		cpu63: cpu@63 {
+			compatible = "thead,c920", "riscv";
+			device_type = "cpu";
+			riscv,isa = "rv64imafdc";
+			reg = <63>;
+			i-cache-block-size = <64>;
+			i-cache-size = <65536>;
+			i-cache-sets = <512>;
+			d-cache-block-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-sets = <512>;
+			next-level-cache = <&l2_cache15>;
+			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
+			status = "okay";
+
+			cpu63_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		l2_cache0: l2-cache@0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache1: l2-cache@1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache2: l2-cache@2 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache3: l2-cache@3 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache4: l2-cache@4 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache5: l2-cache@5 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache6: l2-cache@6 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache7: l2-cache@7 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache8: l2-cache@8 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache9: l2-cache@9 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache10: l2-cache@10 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache11: l2-cache@11 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache12: l2-cache@12 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache13: l2-cache@13 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache14: l2-cache@14 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+		l2_cache15: l2-cache@15 {
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
index 000000000000..5c4b82f13207
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -0,0 +1,513 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
+ */
+
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "sg2042-cpus.dtsi"
+
+#define SOC_PERIPHERAL_IRQ(nr) (nr)
+
+/ {
+	compatible = "sophgo,sg2042";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	dma-noncoherent;
+
+	distance-map {
+		compatible = "numa-distance-map-v1";
+		distance-matrix = <0 0 10>,
+				  <0 1 15>,
+				  <0 2 25>,
+				  <0 3 30>,
+				  <1 0 15>,
+				  <1 1 10>,
+				  <1 2 30>,
+				  <1 3 25>,
+				  <2 0 25>,
+				  <2 1 30>,
+				  <2 2 10>,
+				  <2 3 15>,
+				  <3 0 30>,
+				  <3 1 25>,
+				  <3 2 15>,
+				  <3 3 10>;
+	};
+
+	/* the mem node will be updated by ZSBL. */
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x00000000 0x00000000>;
+		numa-node-id = <0>;
+	};
+	memory@1 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000001 0x00000000 0x00000000>;
+		numa-node-id = <1>;
+	};
+	memory@2 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000002 0x00000000 0x00000000>;
+		numa-node-id = <2>;
+	};
+	memory@3 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000003 0x00000000 0x00000000>;
+		numa-node-id = <3>;
+	};
+
+	reserved-memory {
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		ranges;
+		linux,cma {
+			compatible = "shared-dma-pool";
+			size = <0x00000000 0x10000000>;
+			alloc-ranges = <0x00000000 0xc0000000
+					0x00000000 0xd0000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	pmu {
+		compatible = "riscv,pmu";
+		riscv,event-to-mhpmevent =
+			<0x00003 0x00000000 0x00000010>,
+			<0x00004 0x00000000 0x00000011>,
+			<0x00005 0x00000000 0x00000007>,
+			<0x00006 0x00000000 0x00000006>,
+			<0x00008 0x00000000 0x00000027>,
+			<0x00009 0x00000000 0x00000028>,
+			<0x10000 0x00000000 0x0000000c>,
+			<0x10001 0x00000000 0x0000000d>,
+			<0x10002 0x00000000 0x0000000e>,
+			<0x10003 0x00000000 0x0000000f>,
+			<0x10008 0x00000000 0x00000001>,
+			<0x10009 0x00000000 0x00000002>,
+			<0x10010 0x00000000 0x00000010>,
+			<0x10011 0x00000000 0x00000011>,
+			<0x10012 0x00000000 0x00000012>,
+			<0x10013 0x00000000 0x00000013>,
+			<0x10019 0x00000000 0x00000004>,
+			<0x10021 0x00000000 0x00000003>,
+			<0x10030 0x00000000 0x0000001c>,
+			<0x10031 0x00000000 0x0000001b>;
+		riscv,event-to-mhpmcounters =
+			<0x00003 0x00003 0xfffffff8>,
+			<0x00004 0x00004 0xfffffff8>,
+			<0x00005 0x00005 0xfffffff8>,
+			<0x00006 0x00006 0xfffffff8>,
+			<0x00007 0x00007 0xfffffff8>,
+			<0x00008 0x00008 0xfffffff8>,
+			<0x00009 0x00009 0xfffffff8>,
+			<0x0000a 0x0000a 0xfffffff8>,
+			<0x10000 0x10000 0xfffffff8>,
+			<0x10001 0x10001 0xfffffff8>,
+			<0x10002 0x10002 0xfffffff8>,
+			<0x10003 0x10003 0xfffffff8>,
+			<0x10008 0x10008 0xfffffff8>,
+			<0x10009 0x10009 0xfffffff8>,
+			<0x10010 0x10010 0xfffffff8>,
+			<0x10011 0x10011 0xfffffff8>,
+			<0x10012 0x10012 0xfffffff8>,
+			<0x10013 0x10013 0xfffffff8>,
+			<0x10019 0x10019 0xfffffff8>,
+			<0x10021 0x10021 0xfffffff8>,
+			<0x10030 0x10030 0xfffffff8>,
+			<0x10031 0x10031 0xfffffff8>;
+		riscv,raw-event-to-mhpmcounters =
+			<0x00000000 0x00000001 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000002 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000003 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000004 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000005 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000006 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000007 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000008 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000009 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000a 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000010 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000011 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000012 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000013 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000014 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000015 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000016 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000017 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000018 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000019 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001a 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001b 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001c 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001d 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001e 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001f 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000020 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000021 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000022 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000023 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000024 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000025 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000026 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000027 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000028 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000029 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000002a 0xffffffff 0xffffffff 0xfffffff8>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		clint_mswi: clint-mswi@7094000000 {
+			compatible = "sophgo,sg2042-clint-mswi", "thead,c900-clint-mswi";
+			reg = <0x00000070 0x94000000 0x00000000 0x00004000>;
+			interrupts-extended = <
+				&cpu0_intc 3
+				&cpu1_intc 3
+				&cpu2_intc 3
+				&cpu3_intc 3
+				&cpu4_intc 3
+				&cpu5_intc 3
+				&cpu6_intc 3
+				&cpu7_intc 3
+				&cpu8_intc 3
+				&cpu9_intc 3
+				&cpu10_intc 3
+				&cpu11_intc 3
+				&cpu12_intc 3
+				&cpu13_intc 3
+				&cpu14_intc 3
+				&cpu15_intc 3
+				&cpu16_intc 3
+				&cpu17_intc 3
+				&cpu18_intc 3
+				&cpu19_intc 3
+				&cpu20_intc 3
+				&cpu21_intc 3
+				&cpu22_intc 3
+				&cpu23_intc 3
+				&cpu24_intc 3
+				&cpu25_intc 3
+				&cpu26_intc 3
+				&cpu27_intc 3
+				&cpu28_intc 3
+				&cpu29_intc 3
+				&cpu30_intc 3
+				&cpu31_intc 3
+				&cpu32_intc 3
+				&cpu33_intc 3
+				&cpu34_intc 3
+				&cpu35_intc 3
+				&cpu36_intc 3
+				&cpu37_intc 3
+				&cpu38_intc 3
+				&cpu39_intc 3
+				&cpu40_intc 3
+				&cpu41_intc 3
+				&cpu42_intc 3
+				&cpu43_intc 3
+				&cpu44_intc 3
+				&cpu45_intc 3
+				&cpu46_intc 3
+				&cpu47_intc 3
+				&cpu48_intc 3
+				&cpu49_intc 3
+				&cpu50_intc 3
+				&cpu51_intc 3
+				&cpu52_intc 3
+				&cpu53_intc 3
+				&cpu54_intc 3
+				&cpu55_intc 3
+				&cpu56_intc 3
+				&cpu57_intc 3
+				&cpu58_intc 3
+				&cpu59_intc 3
+				&cpu60_intc 3
+				&cpu61_intc 3
+				&cpu62_intc 3
+				&cpu63_intc 3
+				>;
+		};
+
+		clint_mtimer0: clint-mtimer@70ac000000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac000000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu0_intc 7
+				&cpu1_intc 7
+				&cpu2_intc 7
+				&cpu3_intc 7
+				>;
+		};
+
+		clint_mtimer1: clint-mtimer@70ac010000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac010000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu4_intc 7
+				&cpu5_intc 7
+				&cpu6_intc 7
+				&cpu7_intc 7
+				>;
+		};
+
+		clint_mtimer2: clint-mtimer@70ac020000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac020000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu8_intc 7
+				&cpu9_intc 7
+				&cpu10_intc 7
+				&cpu11_intc 7
+				>;
+		};
+
+		clint_mtimer3: clint-mtimer@70ac030000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac030000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu12_intc 7
+				&cpu13_intc 7
+				&cpu14_intc 7
+				&cpu15_intc 7
+				>;
+		};
+
+		clint_mtimer4: clint-mtimer@70ac040000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac040000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu16_intc 7
+				&cpu17_intc 7
+				&cpu18_intc 7
+				&cpu19_intc 7
+				>;
+		};
+
+		clint_mtimer5: clint-mtimer@70ac050000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac050000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu20_intc 7
+				&cpu21_intc 7
+				&cpu22_intc 7
+				&cpu23_intc 7
+				>;
+		};
+
+		clint_mtimer6: clint-mtimer@70ac060000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac060000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu24_intc 7
+				&cpu25_intc 7
+				&cpu26_intc 7
+				&cpu27_intc 7
+				>;
+		};
+
+		clint_mtimer7: clint-mtimer@70ac070000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac070000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu28_intc 7
+				&cpu29_intc 7
+				&cpu30_intc 7
+				&cpu31_intc 7
+				>;
+		};
+
+		clint_mtimer8: clint-mtimer@70ac080000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac080000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu32_intc 7
+				&cpu33_intc 7
+				&cpu34_intc 7
+				&cpu35_intc 7
+				>;
+		};
+
+		clint_mtimer9: clint-mtimer@70ac090000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac090000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu36_intc 7
+				&cpu37_intc 7
+				&cpu38_intc 7
+				&cpu39_intc 7
+				>;
+		};
+
+		clint_mtimer10: clint-mtimer@70ac0a0000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac0a0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu40_intc 7
+				&cpu41_intc 7
+				&cpu42_intc 7
+				&cpu43_intc 7
+				>;
+		};
+
+		clint_mtimer11: clint-mtimer@70ac0b0000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac0b0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu44_intc 7
+				&cpu45_intc 7
+				&cpu46_intc 7
+				&cpu47_intc 7
+				>;
+		};
+
+		clint_mtimer12: clint-mtimer@70ac0c0000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac0c0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu48_intc 7
+				&cpu49_intc 7
+				&cpu50_intc 7
+				&cpu51_intc 7
+				>;
+		};
+
+		clint_mtimer13: clint-mtimer@70ac0d0000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac0d0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu52_intc 7
+				&cpu53_intc 7
+				&cpu54_intc 7
+				&cpu55_intc 7
+				>;
+		};
+
+		clint_mtimer14: clint-mtimer@70ac0e0000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac0e0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu56_intc 7
+				&cpu57_intc 7
+				&cpu58_intc 7
+				&cpu59_intc 7
+				>;
+		};
+
+		clint_mtimer15: clint-mtimer@70ac0f0000 {
+			compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
+			reg = <0x00000070 0xac0f0000 0x00000000 0x00007ff8>;
+			interrupts-extended = <
+				&cpu60_intc 7
+				&cpu61_intc 7
+				&cpu62_intc 7
+				&cpu63_intc 7
+				>;
+		};
+
+		intc: interrupt-controller@7090000000 {
+			compatible = "sophgo,sg2042-plic", "thead,c900-plic";
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			reg = <0x00000070 0x90000000 0x00000000 0x04000000>;
+			interrupt-controller;
+			interrupts-extended = <
+				&cpu0_intc  0xffffffff &cpu0_intc  9
+				&cpu1_intc  0xffffffff &cpu1_intc  9
+				&cpu2_intc  0xffffffff &cpu2_intc  9
+				&cpu3_intc  0xffffffff &cpu3_intc  9
+				&cpu4_intc  0xffffffff &cpu4_intc  9
+				&cpu5_intc  0xffffffff &cpu5_intc  9
+				&cpu6_intc  0xffffffff &cpu6_intc  9
+				&cpu7_intc  0xffffffff &cpu7_intc  9
+				&cpu8_intc  0xffffffff &cpu8_intc  9
+				&cpu9_intc  0xffffffff &cpu9_intc  9
+				&cpu10_intc  0xffffffff &cpu10_intc  9
+				&cpu11_intc  0xffffffff &cpu11_intc  9
+				&cpu12_intc  0xffffffff &cpu12_intc  9
+				&cpu13_intc  0xffffffff &cpu13_intc  9
+				&cpu14_intc  0xffffffff &cpu14_intc  9
+				&cpu15_intc  0xffffffff &cpu15_intc  9
+				&cpu16_intc  0xffffffff &cpu16_intc  9
+				&cpu17_intc  0xffffffff &cpu17_intc  9
+				&cpu18_intc  0xffffffff &cpu18_intc  9
+				&cpu19_intc  0xffffffff &cpu19_intc  9
+				&cpu20_intc  0xffffffff &cpu20_intc  9
+				&cpu21_intc  0xffffffff &cpu21_intc  9
+				&cpu22_intc  0xffffffff &cpu22_intc  9
+				&cpu23_intc  0xffffffff &cpu23_intc  9
+				&cpu24_intc  0xffffffff &cpu24_intc  9
+				&cpu25_intc  0xffffffff &cpu25_intc  9
+				&cpu26_intc  0xffffffff &cpu26_intc  9
+				&cpu27_intc  0xffffffff &cpu27_intc  9
+				&cpu28_intc  0xffffffff &cpu28_intc  9
+				&cpu29_intc  0xffffffff &cpu29_intc  9
+				&cpu30_intc  0xffffffff &cpu30_intc  9
+				&cpu31_intc  0xffffffff &cpu31_intc  9
+				&cpu32_intc  0xffffffff &cpu32_intc  9
+				&cpu33_intc  0xffffffff &cpu33_intc  9
+				&cpu34_intc  0xffffffff &cpu34_intc  9
+				&cpu35_intc  0xffffffff &cpu35_intc  9
+				&cpu36_intc  0xffffffff &cpu36_intc  9
+				&cpu37_intc  0xffffffff &cpu37_intc  9
+				&cpu38_intc  0xffffffff &cpu38_intc  9
+				&cpu39_intc  0xffffffff &cpu39_intc  9
+				&cpu40_intc  0xffffffff &cpu40_intc  9
+				&cpu41_intc  0xffffffff &cpu41_intc  9
+				&cpu42_intc  0xffffffff &cpu42_intc  9
+				&cpu43_intc  0xffffffff &cpu43_intc  9
+				&cpu44_intc  0xffffffff &cpu44_intc  9
+				&cpu45_intc  0xffffffff &cpu45_intc  9
+				&cpu46_intc  0xffffffff &cpu46_intc  9
+				&cpu47_intc  0xffffffff &cpu47_intc  9
+				&cpu48_intc  0xffffffff &cpu48_intc  9
+				&cpu49_intc  0xffffffff &cpu49_intc  9
+				&cpu50_intc  0xffffffff &cpu50_intc  9
+				&cpu51_intc  0xffffffff &cpu51_intc  9
+				&cpu52_intc  0xffffffff &cpu52_intc  9
+				&cpu53_intc  0xffffffff &cpu53_intc  9
+				&cpu54_intc  0xffffffff &cpu54_intc  9
+				&cpu55_intc  0xffffffff &cpu55_intc  9
+				&cpu56_intc  0xffffffff &cpu56_intc  9
+				&cpu57_intc  0xffffffff &cpu57_intc  9
+				&cpu58_intc  0xffffffff &cpu58_intc  9
+				&cpu59_intc  0xffffffff &cpu59_intc  9
+				&cpu60_intc  0xffffffff &cpu60_intc  9
+				&cpu61_intc  0xffffffff &cpu61_intc  9
+				&cpu62_intc  0xffffffff &cpu62_intc  9
+				&cpu63_intc  0xffffffff &cpu63_intc  9
+				>;
+			riscv,ndev = <224>;
+		};
+
+		uart0: serial@7040000000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x00000070 0x40000000 0x00000000 0x00001000>;
+			interrupt-parent = <&intc>;
+			interrupts = <SOC_PERIPHERAL_IRQ(112) IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <500000000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+		};
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen: chosen {
+		bootargs = "console=ttyS0,115200 earlycon";
+		stdout-path = "serial0";
+	};
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
