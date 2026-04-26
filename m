Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9FCFF885A
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Apr 2026 01:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFM1afM4KGV0I+jUd1mqtN+wf3Hnp5uuxxRNRGGRvT0=; b=iouKYqhwi30UFv
	wpQRc/hKn4vXpqOJCCSz5uZDWnA6p7xlp7WSgHVT9YZQyC0pdbgB9ToDYHWOwgtVADaw6fsfXf/N6
	aLn6bfx50wvpAn8JJ3AGRk4DWhq470s2AuRWMRoLdTs1Z02ot2FL3V4FGzn7blqRh6OZ23gPPxcSO
	r31DMeV1Cf9278If7kyvFkpvmCV++kG9W3L3cReyr265gNOnXlYV5lX85PjOLJlEERLJbaMJPF0xS
	eic2nK1zC0viqqYvPmqBZi8q+adXmWna1P9uqiAWNRsbXEMiNnmKwZjsZunEZeEBTomEn6R+iNRo6
	NwsYS5wryXqw/ShnJ9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGoOm-0000000FARR-1E7r;
	Sun, 26 Apr 2026 01:35:04 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGoOj-0000000FAQL-0vrr
	for linux-riscv@lists.infradead.org;
	Sun, 26 Apr 2026 01:35:02 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82f83bd32efso6878327b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Apr 2026 18:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777167300; x=1777772100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h23U7/BOcI+zsk5LnebynlNQCLHR4FUSDfFI8G5xS2I=;
        b=WzWK+W1XnPV4y0Jo1PN1dVYXmtY49xyplzy2YsXuJMfjE7SuPw5bByKFrmQtsmM7EB
         zEDl9YVnNo4Ni0UmDPSk+JEWGN8uNP3eF726MGkMEIt6hoWJDSYB3fJF2hSkM/NWIBky
         dy9T3UWzcLRAQhevS22P/J2YMRa6qDjNGCcrEZjjYYdUctZ0HVF1nVuNPKfw9d7gRW3K
         YJjE6k23npbllgYHf/f2uJOq1RFtbJP8ljtCE5+w+ZdOfs8d7PWVlYpxLFW3KWfLzInD
         4UPhIZrOS4I/wxL8StiZWyahE0SahNYrL28BQa2isDhr2Ax+MNhYEeXvUxVVW8mv8Wuf
         cwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777167300; x=1777772100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h23U7/BOcI+zsk5LnebynlNQCLHR4FUSDfFI8G5xS2I=;
        b=AxIEIy4cUpYLJL1pWWUf7P5Z30nc6M4jGtAn93TzTlBx0+sWuIBENsA33PY1CYEnNp
         1yI9p0csrLo2cA7uw0NW29WhVNk1q7eEemFQ0Wqg8+XlaG4l3BI4gF+ibBFaK7FJl29h
         nJu7kq43Zuaa39vTqe+q0O/P0uZs83ciZEHnUTSTyjTyzl/D0dRkjqqlxv5w0FkS/o/u
         t9u4g4okYeEX+T27ZbREIeHN7el0ENhqCgnDOl3wLhNNo8L5lLNBwR2BznprfUyjsX8g
         2LHLPDj/uFbMg2RpXMWMjWJg56kdItr2+7VM5Pjc5jsnzdWypeX5V9yCHDwAVUX4xDAE
         kZAA==
X-Forwarded-Encrypted: i=1; AFNElJ9wy+VPPpbtrFVx0Aso8eVXKVux+ZO6UCqGIePvUTCfIuH5HlPFlHDvE67Vk4pFp/r+iLF4PE02d3B33A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUKJhFqFCdEeQgwAzHrb4F+bwZbMlNsfdjQRIwaten5t8qGKli
	RtdpCf/9zGzaeyt758boci8v/R+jn1uM3U6fPunat3gAMEeJ0Iel84ki
X-Gm-Gg: AeBDieuV+JVMygMr4kDQpWy0JMTdhESlRIA+iZINnYMBR4UGd8kVpGlxOWtiqkC08Ey
	KLsdxij2xYmJ32PxNZsKuoH7sjVoSA6O9E5JRjNvrN8H3tfoGXk3/XkayuNSG88r8ImQapUmJ6b
	YFtKlhMVlnsulTz87FQWuaPN+XF4Ux2x4nVymuZMpctT2yZbuCKiUEztKHO9gjAxSMvgEbSmkqb
	KU7YOARpZjdMsPRIljJp3Nrix1mn/E60BzmA5d6hAa+q3qkWxZS27zslEPRpr5GQVs9US4vMq27
	HeROGz0TULs+iD7vceNIcHUFLD78NTDsdUDphMLSjD6BgYA5Rl8J+jskrD6LNU6B09e1JNeYOs1
	dvgKzcJdq7QSx2IqP0fcxf4gl7Y0VbsuKJ/8wW1T+FXqX5Ww++LM7AOzxxFRWLIEqYhXBMII3fl
	d0z22MU2/Jck1d0DHl46NqS74TFA4MFp6FEA==
X-Received: by 2002:a05:6a00:4186:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-82f8c81d952mr42469403b3a.12.1777167300215;
        Sat, 25 Apr 2026 18:35:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe74d8sm28368597b3a.46.2026.04.25.18.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 18:34:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit address
Date: Sun, 26 Apr 2026 09:34:49 +0800
Message-ID: <20260426013449.694435-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426013449.694435-1-inochiama@gmail.com>
References: <20260426013449.694435-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_183501_307546_5F907052 
X-CRM114-Status: UNSURE (   9.52  )
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

Previous the CPU unit address cpu of sg2042 use decimal, it is
not following the general convention for unit addresses of the
OF. Convent the unit address to hex to resolve this problem.

The introduces a small change for the CPU node name, but it should
affect nothing since there is no direct full-path reference to
these CPU nodes.

Fixes: ae5bac370ed4 ("riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com> # Pioneerbox.
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 236 ++++++++++----------
 1 file changed, 118 insertions(+), 118 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index 509488eee432..fd8906b313d2 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -263,7 +263,7 @@ cpu0: cpu@0 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <0>;
+			reg = <0x0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -291,7 +291,7 @@ cpu1: cpu@1 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <1>;
+			reg = <0x1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -319,7 +319,7 @@ cpu2: cpu@2 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <2>;
+			reg = <0x2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -347,7 +347,7 @@ cpu3: cpu@3 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <3>;
+			reg = <0x3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -375,7 +375,7 @@ cpu4: cpu@4 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <4>;
+			reg = <0x4>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -403,7 +403,7 @@ cpu5: cpu@5 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <5>;
+			reg = <0x5>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -431,7 +431,7 @@ cpu6: cpu@6 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <6>;
+			reg = <0x6>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -459,7 +459,7 @@ cpu7: cpu@7 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <7>;
+			reg = <0x7>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -487,7 +487,7 @@ cpu8: cpu@8 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <8>;
+			reg = <0x8>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -515,7 +515,7 @@ cpu9: cpu@9 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <9>;
+			reg = <0x9>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -533,7 +533,7 @@ cpu9_intc: interrupt-controller {
 			};
 		};
 
-		cpu10: cpu@10 {
+		cpu10: cpu@a {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -543,7 +543,7 @@ cpu10: cpu@10 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <10>;
+			reg = <0xa>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -561,7 +561,7 @@ cpu10_intc: interrupt-controller {
 			};
 		};
 
-		cpu11: cpu@11 {
+		cpu11: cpu@b {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -571,7 +571,7 @@ cpu11: cpu@11 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <11>;
+			reg = <0xb>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -589,7 +589,7 @@ cpu11_intc: interrupt-controller {
 			};
 		};
 
-		cpu12: cpu@12 {
+		cpu12: cpu@c {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -599,7 +599,7 @@ cpu12: cpu@12 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <12>;
+			reg = <0xc>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -617,7 +617,7 @@ cpu12_intc: interrupt-controller {
 			};
 		};
 
-		cpu13: cpu@13 {
+		cpu13: cpu@d {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -627,7 +627,7 @@ cpu13: cpu@13 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <13>;
+			reg = <0xd>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -645,7 +645,7 @@ cpu13_intc: interrupt-controller {
 			};
 		};
 
-		cpu14: cpu@14 {
+		cpu14: cpu@e {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -655,7 +655,7 @@ cpu14: cpu@14 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <14>;
+			reg = <0xe>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -673,7 +673,7 @@ cpu14_intc: interrupt-controller {
 			};
 		};
 
-		cpu15: cpu@15 {
+		cpu15: cpu@f {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -683,7 +683,7 @@ cpu15: cpu@15 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <15>;
+			reg = <0xf>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -701,7 +701,7 @@ cpu15_intc: interrupt-controller {
 			};
 		};
 
-		cpu16: cpu@16 {
+		cpu16: cpu@10 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -711,7 +711,7 @@ cpu16: cpu@16 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <16>;
+			reg = <0x10>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -729,7 +729,7 @@ cpu16_intc: interrupt-controller {
 			};
 		};
 
-		cpu17: cpu@17 {
+		cpu17: cpu@11 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -739,7 +739,7 @@ cpu17: cpu@17 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <17>;
+			reg = <0x11>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -757,7 +757,7 @@ cpu17_intc: interrupt-controller {
 			};
 		};
 
-		cpu18: cpu@18 {
+		cpu18: cpu@12 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -767,7 +767,7 @@ cpu18: cpu@18 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <18>;
+			reg = <0x12>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -785,7 +785,7 @@ cpu18_intc: interrupt-controller {
 			};
 		};
 
-		cpu19: cpu@19 {
+		cpu19: cpu@13 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -795,7 +795,7 @@ cpu19: cpu@19 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <19>;
+			reg = <0x13>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -813,7 +813,7 @@ cpu19_intc: interrupt-controller {
 			};
 		};
 
-		cpu20: cpu@20 {
+		cpu20: cpu@14 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -823,7 +823,7 @@ cpu20: cpu@20 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <20>;
+			reg = <0x14>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -841,7 +841,7 @@ cpu20_intc: interrupt-controller {
 			};
 		};
 
-		cpu21: cpu@21 {
+		cpu21: cpu@15 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -851,7 +851,7 @@ cpu21: cpu@21 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <21>;
+			reg = <0x15>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -869,7 +869,7 @@ cpu21_intc: interrupt-controller {
 			};
 		};
 
-		cpu22: cpu@22 {
+		cpu22: cpu@16 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -879,7 +879,7 @@ cpu22: cpu@22 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <22>;
+			reg = <0x16>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -897,7 +897,7 @@ cpu22_intc: interrupt-controller {
 			};
 		};
 
-		cpu23: cpu@23 {
+		cpu23: cpu@17 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -907,7 +907,7 @@ cpu23: cpu@23 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <23>;
+			reg = <0x17>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -925,7 +925,7 @@ cpu23_intc: interrupt-controller {
 			};
 		};
 
-		cpu24: cpu@24 {
+		cpu24: cpu@18 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -935,7 +935,7 @@ cpu24: cpu@24 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <24>;
+			reg = <0x18>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -953,7 +953,7 @@ cpu24_intc: interrupt-controller {
 			};
 		};
 
-		cpu25: cpu@25 {
+		cpu25: cpu@19 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -963,7 +963,7 @@ cpu25: cpu@25 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <25>;
+			reg = <0x19>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -981,7 +981,7 @@ cpu25_intc: interrupt-controller {
 			};
 		};
 
-		cpu26: cpu@26 {
+		cpu26: cpu@1a {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -991,7 +991,7 @@ cpu26: cpu@26 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <26>;
+			reg = <0x1a>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1009,7 +1009,7 @@ cpu26_intc: interrupt-controller {
 			};
 		};
 
-		cpu27: cpu@27 {
+		cpu27: cpu@1b {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1019,7 +1019,7 @@ cpu27: cpu@27 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <27>;
+			reg = <0x1b>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1037,7 +1037,7 @@ cpu27_intc: interrupt-controller {
 			};
 		};
 
-		cpu28: cpu@28 {
+		cpu28: cpu@1c {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1047,7 +1047,7 @@ cpu28: cpu@28 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <28>;
+			reg = <0x1c>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1065,7 +1065,7 @@ cpu28_intc: interrupt-controller {
 			};
 		};
 
-		cpu29: cpu@29 {
+		cpu29: cpu@1d {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1075,7 +1075,7 @@ cpu29: cpu@29 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <29>;
+			reg = <0x1d>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1093,7 +1093,7 @@ cpu29_intc: interrupt-controller {
 			};
 		};
 
-		cpu30: cpu@30 {
+		cpu30: cpu@1e {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1103,7 +1103,7 @@ cpu30: cpu@30 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <30>;
+			reg = <0x1e>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1121,7 +1121,7 @@ cpu30_intc: interrupt-controller {
 			};
 		};
 
-		cpu31: cpu@31 {
+		cpu31: cpu@1f {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1131,7 +1131,7 @@ cpu31: cpu@31 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <31>;
+			reg = <0x1f>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1149,7 +1149,7 @@ cpu31_intc: interrupt-controller {
 			};
 		};
 
-		cpu32: cpu@32 {
+		cpu32: cpu@20 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1159,7 +1159,7 @@ cpu32: cpu@32 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <32>;
+			reg = <0x20>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1177,7 +1177,7 @@ cpu32_intc: interrupt-controller {
 			};
 		};
 
-		cpu33: cpu@33 {
+		cpu33: cpu@21 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1187,7 +1187,7 @@ cpu33: cpu@33 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <33>;
+			reg = <0x21>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1205,7 +1205,7 @@ cpu33_intc: interrupt-controller {
 			};
 		};
 
-		cpu34: cpu@34 {
+		cpu34: cpu@22 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1215,7 +1215,7 @@ cpu34: cpu@34 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <34>;
+			reg = <0x22>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1233,7 +1233,7 @@ cpu34_intc: interrupt-controller {
 			};
 		};
 
-		cpu35: cpu@35 {
+		cpu35: cpu@23 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1243,7 +1243,7 @@ cpu35: cpu@35 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <35>;
+			reg = <0x23>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1261,7 +1261,7 @@ cpu35_intc: interrupt-controller {
 			};
 		};
 
-		cpu36: cpu@36 {
+		cpu36: cpu@24 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1271,7 +1271,7 @@ cpu36: cpu@36 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <36>;
+			reg = <0x24>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1289,7 +1289,7 @@ cpu36_intc: interrupt-controller {
 			};
 		};
 
-		cpu37: cpu@37 {
+		cpu37: cpu@25 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1299,7 +1299,7 @@ cpu37: cpu@37 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <37>;
+			reg = <0x25>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1317,7 +1317,7 @@ cpu37_intc: interrupt-controller {
 			};
 		};
 
-		cpu38: cpu@38 {
+		cpu38: cpu@26 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1327,7 +1327,7 @@ cpu38: cpu@38 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <38>;
+			reg = <0x26>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1345,7 +1345,7 @@ cpu38_intc: interrupt-controller {
 			};
 		};
 
-		cpu39: cpu@39 {
+		cpu39: cpu@27 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1355,7 +1355,7 @@ cpu39: cpu@39 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <39>;
+			reg = <0x27>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1373,7 +1373,7 @@ cpu39_intc: interrupt-controller {
 			};
 		};
 
-		cpu40: cpu@40 {
+		cpu40: cpu@28 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1383,7 +1383,7 @@ cpu40: cpu@40 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <40>;
+			reg = <0x28>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1401,7 +1401,7 @@ cpu40_intc: interrupt-controller {
 			};
 		};
 
-		cpu41: cpu@41 {
+		cpu41: cpu@29 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1411,7 +1411,7 @@ cpu41: cpu@41 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <41>;
+			reg = <0x29>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1429,7 +1429,7 @@ cpu41_intc: interrupt-controller {
 			};
 		};
 
-		cpu42: cpu@42 {
+		cpu42: cpu@2a {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1439,7 +1439,7 @@ cpu42: cpu@42 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <42>;
+			reg = <0x2a>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1457,7 +1457,7 @@ cpu42_intc: interrupt-controller {
 			};
 		};
 
-		cpu43: cpu@43 {
+		cpu43: cpu@2b {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1467,7 +1467,7 @@ cpu43: cpu@43 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <43>;
+			reg = <0x2b>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1485,7 +1485,7 @@ cpu43_intc: interrupt-controller {
 			};
 		};
 
-		cpu44: cpu@44 {
+		cpu44: cpu@2c {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1495,7 +1495,7 @@ cpu44: cpu@44 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <44>;
+			reg = <0x2c>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1513,7 +1513,7 @@ cpu44_intc: interrupt-controller {
 			};
 		};
 
-		cpu45: cpu@45 {
+		cpu45: cpu@2d {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1523,7 +1523,7 @@ cpu45: cpu@45 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <45>;
+			reg = <0x2d>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1541,7 +1541,7 @@ cpu45_intc: interrupt-controller {
 			};
 		};
 
-		cpu46: cpu@46 {
+		cpu46: cpu@2e {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1551,7 +1551,7 @@ cpu46: cpu@46 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <46>;
+			reg = <0x2e>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1569,7 +1569,7 @@ cpu46_intc: interrupt-controller {
 			};
 		};
 
-		cpu47: cpu@47 {
+		cpu47: cpu@2f {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1579,7 +1579,7 @@ cpu47: cpu@47 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <47>;
+			reg = <0x2f>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1597,7 +1597,7 @@ cpu47_intc: interrupt-controller {
 			};
 		};
 
-		cpu48: cpu@48 {
+		cpu48: cpu@30 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1607,7 +1607,7 @@ cpu48: cpu@48 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <48>;
+			reg = <0x30>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1625,7 +1625,7 @@ cpu48_intc: interrupt-controller {
 			};
 		};
 
-		cpu49: cpu@49 {
+		cpu49: cpu@31 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1635,7 +1635,7 @@ cpu49: cpu@49 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <49>;
+			reg = <0x31>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1653,7 +1653,7 @@ cpu49_intc: interrupt-controller {
 			};
 		};
 
-		cpu50: cpu@50 {
+		cpu50: cpu@32 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1663,7 +1663,7 @@ cpu50: cpu@50 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <50>;
+			reg = <0x32>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1681,7 +1681,7 @@ cpu50_intc: interrupt-controller {
 			};
 		};
 
-		cpu51: cpu@51 {
+		cpu51: cpu@33 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1691,7 +1691,7 @@ cpu51: cpu@51 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <51>;
+			reg = <0x33>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1709,7 +1709,7 @@ cpu51_intc: interrupt-controller {
 			};
 		};
 
-		cpu52: cpu@52 {
+		cpu52: cpu@34 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1719,7 +1719,7 @@ cpu52: cpu@52 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <52>;
+			reg = <0x34>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1737,7 +1737,7 @@ cpu52_intc: interrupt-controller {
 			};
 		};
 
-		cpu53: cpu@53 {
+		cpu53: cpu@35 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1747,7 +1747,7 @@ cpu53: cpu@53 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <53>;
+			reg = <0x35>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1765,7 +1765,7 @@ cpu53_intc: interrupt-controller {
 			};
 		};
 
-		cpu54: cpu@54 {
+		cpu54: cpu@36 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1775,7 +1775,7 @@ cpu54: cpu@54 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <54>;
+			reg = <0x36>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1793,7 +1793,7 @@ cpu54_intc: interrupt-controller {
 			};
 		};
 
-		cpu55: cpu@55 {
+		cpu55: cpu@37 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1803,7 +1803,7 @@ cpu55: cpu@55 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <55>;
+			reg = <0x37>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1821,7 +1821,7 @@ cpu55_intc: interrupt-controller {
 			};
 		};
 
-		cpu56: cpu@56 {
+		cpu56: cpu@38 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1831,7 +1831,7 @@ cpu56: cpu@56 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <56>;
+			reg = <0x38>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1849,7 +1849,7 @@ cpu56_intc: interrupt-controller {
 			};
 		};
 
-		cpu57: cpu@57 {
+		cpu57: cpu@39 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1859,7 +1859,7 @@ cpu57: cpu@57 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <57>;
+			reg = <0x39>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1877,7 +1877,7 @@ cpu57_intc: interrupt-controller {
 			};
 		};
 
-		cpu58: cpu@58 {
+		cpu58: cpu@3a {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1887,7 +1887,7 @@ cpu58: cpu@58 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <58>;
+			reg = <0x3a>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1905,7 +1905,7 @@ cpu58_intc: interrupt-controller {
 			};
 		};
 
-		cpu59: cpu@59 {
+		cpu59: cpu@3b {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1915,7 +1915,7 @@ cpu59: cpu@59 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <59>;
+			reg = <0x3b>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1933,7 +1933,7 @@ cpu59_intc: interrupt-controller {
 			};
 		};
 
-		cpu60: cpu@60 {
+		cpu60: cpu@3c {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1943,7 +1943,7 @@ cpu60: cpu@60 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <60>;
+			reg = <0x3c>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1961,7 +1961,7 @@ cpu60_intc: interrupt-controller {
 			};
 		};
 
-		cpu61: cpu@61 {
+		cpu61: cpu@3d {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1971,7 +1971,7 @@ cpu61: cpu@61 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <61>;
+			reg = <0x3d>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -1989,7 +1989,7 @@ cpu61_intc: interrupt-controller {
 			};
 		};
 
-		cpu62: cpu@62 {
+		cpu62: cpu@3e {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -1999,7 +1999,7 @@ cpu62: cpu@62 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <62>;
+			reg = <0x3e>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
@@ -2017,7 +2017,7 @@ cpu62_intc: interrupt-controller {
 			};
 		};
 
-		cpu63: cpu@63 {
+		cpu63: cpu@3f {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
@@ -2027,7 +2027,7 @@ cpu63: cpu@63 {
 					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
-			reg = <63>;
+			reg = <0x3f>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
 			i-cache-sets = <512>;
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
