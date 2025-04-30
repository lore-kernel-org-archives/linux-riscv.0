Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4984FC3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 01:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxNUQWOO9S5Sa5sTVlb9SmetfqMpCUdj3p8Xi1C9Gvc=; b=2HBrcYmSE2iGBp
	FsSboYUkLYDKtCSBMynRaXDToTBVzTHpHfXUiNoZ7l1krXbgv4vjboh4mUprSsAAIiNr0zLZqhAql
	NY0VZGsjY4rOrfZ8VJG2pU5K3S8T7yPFAZGl7N6S/1Ac8dcSG+GKmgsmIh/e2qnRJWU92wtgsYU5M
	AD9LvXXgsgisO81Tqfp+hBOEutCf3gf/Ed1icOBnFJVK2/R7ouFfpd3LJYFo3BFS8bwmJsv9MRDyh
	PFNfhDvs2JqWP4CXhnhJRxcL1f7GCeyTaOSM/zQHjc3mnz3X/B2RnrVheUaJCY3YbjAFzaFkYZPuI
	dCKQFxziwA1PQ8J+CicQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wEL-0000000BRI6-44yV;
	Wed, 30 Apr 2025 01:27:21 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wEJ-0000000BRHU-3QqG
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 01:27:20 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so92631996d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 18:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745976438; x=1746581238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orpHQEMmNk+tEK2xMIKeEAE44ZnWvB5Dmosx1GmhpwY=;
        b=ldII4Wap3XVBtOjZGniue9peL731GbFjoAYoitII3F90J4Ic6+yrlICXuJCE2z4CN+
         K/JqdN3N7IPMoFdYKaL/B95PIVo6McBuXQ/jD5/8QeoRD4VICVJ4jddJS0kyUIUDy5ev
         vHMMpLdXV2/2kwSpH/7JjjRID1qW+aDQkikiAowYKn3fYp9svUaSFNXtSfRIWoDN0pQF
         U7i/i4f4YaRhSQoeptYzZmuR9Z1Eakm9CCPtokNRi85zkj1uwm4qHkUJn5MPnrmxf0Sj
         vOqYfcdoXPIIa3GXiaQYZV4UZ8A5t3TGuuolVPLVcg5YysbBuW+siGKNwG6qBZJinUjD
         3p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976438; x=1746581238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orpHQEMmNk+tEK2xMIKeEAE44ZnWvB5Dmosx1GmhpwY=;
        b=BZRg4JdrYKxxuCbxp3teFtjChYcuj7mWxOdSDBcRXiD5uB/3um+xjPJz25s97P6YEs
         EMDJrF2ALwSLFoKetRSaoxvqJVRzrWij5NyU+DSAVPNKTogEfPAYkHaGrPZwQCaMEHKa
         xPFv6gna2jp8+lUoxt5ntJxpR5Bdr5097wa4HoQU+mwYrVhKdLp2iGBkDfsE3wyVkN5s
         +GAB41sGqsXBXnSAazheAP+lgkUTvvwcuUGx24DJ23NK2TkkaYEL/MrtOAO4DjDzyw9J
         N2ABQGNmyP4LO41u8h9CViHSgUa1ovst4+vnAykZn48qjjyeBF7Cas/iif210C6V9ve4
         Dg4A==
X-Forwarded-Encrypted: i=1; AJvYcCU0tJ9uQRqoOltCu3hu7NeiM5YFw82bfka8QSyC3nZlI1vyhhjMPjl3XmhYHBYGsB5a8DQSv145aRZXbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjUFBEkHeh9EWRoq9g1zNa+3TazMooGTztGpG8HxuKn2wu7BqF
	IQcN2sccvEKYWaZ9RmqdloqZdIIDghpY2RC3Rc5y4jsL0lTfF0au
X-Gm-Gg: ASbGncs0hVNbwXTA/IGaJetK1MAA253SR+PBmnHCzaVT/nqOpq1ecs62E6YMfi6I+gK
	0gxrKL10EBSDZX4LWy7xmtd4Of4t3lhIhfsXY8ZWCKdRoKvouO3CAn5dSFE/dhnPJ5Lt1PHvCYF
	U3vjR6qqQ+OZ76lh251Eh3P3xu++eh+govP/kO46yXUxnTqP+sT26mVg7EymGGggxM/6P94udki
	tqPkLUaNpylZWUw+vpRdPVt4+gsKO+cZDSU7pfSP1+IhdqoCXcfoeImMfw8Sbnq60WfRv7vuKHT
	L5puuOG5NwPJSWB4
X-Google-Smtp-Source: AGHT+IG5DRNOVSoHk6dnbQr8qugQsnAj2sLbMuWUDrmOn3IKUQ4BY0+JJwN+xKvvekVcatvxNq51sQ==
X-Received: by 2002:a05:6214:21ea:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6f4fe116d0fmr17281516d6.32.1745976438475;
        Tue, 29 Apr 2025 18:27:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe85d875sm2414586d6.107.2025.04.29.18.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:27:18 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/4] riscv: dts: sophgo: Move riscv cpu definition to a separate file
Date: Wed, 30 Apr 2025 09:26:51 +0800
Message-ID: <20250430012654.235830-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430012654.235830-1-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_182719_858557_12E118DD 
X-CRM114-Status: GOOD (  17.42  )
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

As sg2000 and sg2002 can boot from an arm a53 core, it is not
suitable to left the riscv cpu definition in the common peripheral
header.

Move the riscv related device into a separate header file, so the
arm subsystem can reuse the common peripheral header.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi     |  1 +
 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi | 36 +++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi     |  1 +
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi      | 29 -----------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi      |  1 +
 5 files changed, 39 insertions(+), 29 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index fc9e6b56790f..91bf4563e1f9 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
+#include "cv180x-cpus.dtsi"
 #include "cv18xx.dtsi"
 
 / {
diff --git a/arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi b/arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
new file mode 100644
index 000000000000..93fd9e47a195
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+/ {
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <25000000>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index fcea4376fb79..cc094b3f585f 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
+#include "cv180x-cpus.dtsi"
 #include "cv18xx.dtsi"
 #include "cv181x.dtsi"
 
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 805b694aa814..a4f957302094 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -12,35 +12,6 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	cpus: cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		timebase-frequency = <25000000>;
-
-		cpu0: cpu@0 {
-			compatible = "thead,c906", "riscv";
-			device_type = "cpu";
-			reg = <0>;
-			d-cache-block-size = <64>;
-			d-cache-sets = <512>;
-			d-cache-size = <65536>;
-			i-cache-block-size = <64>;
-			i-cache-sets = <128>;
-			i-cache-size = <32768>;
-			mmu-type = "riscv,sv39";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
-
-			cpu0_intc: interrupt-controller {
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-				#interrupt-cells = <1>;
-			};
-		};
-	};
-
 	osc: oscillator {
 		compatible = "fixed-clock";
 		clock-output-names = "osc_25m";
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index df133831bd3e..6f02de9b0982 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
+#include "cv180x-cpus.dtsi"
 #include "cv18xx.dtsi"
 #include "cv181x.dtsi"
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
