Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEA6C7113C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rv4T/lLUoipNOTbJvOR4UgOXRpVIHgnUIRJ3Ezc4gzI=; b=lC3hGvi+n+G8cZ
	WUbRqHSCdbe+DazAwGgjU1U0BqYfJWkZvessz38adaLlikaP21Of+5f3eXSE51HR1njRxVbbBwRLq
	BE3evfUqg5aNJUXN6/k6MgvPJBJoCVy93ZTbnEWNeDU9YXs7RBwHulgU/Y2EJ/YudxK/0UgODHXOI
	KD9LPmHGTZsXTvtbwHiaQZ7GFcYtRyYsWaWFK/ax88rGCCYK+QxQmyc2dnugnygZG99r0z4CSni0q
	KyTOsD9dwYTic55ZFWhr3DsRicK82myzTNknvem8peIDJpRvxeLyQsvYXNL+E88OKleCGKVsKNKZn
	XH+xJ3WD1BcY9ZzS3Udw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5q-0000000AZHe-1cXm;
	Wed, 11 Jun 2025 16:14:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL42-00000009u1K-0I1w
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 13:00:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23633a6ac50so32712605ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646821; x=1750251621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wfkuc3Nm6XNXxPvRJIgpzIHQXi51C7ZBujG/Lertj5Y=;
        b=F1vIqMrSICl5A1juaONpzIjVeW0Xu5V2n0HT37h0ymoe5R2fiG2mMZ5EQ3m2EuBLZB
         AxvP9Kg++L9F/Y4d1c4Ny/jYcCYM+D8UjmQcOZ4oSDB/YhrKZYtsb2cz7DVs66ozPvpq
         e5tq1WYXGN94fORpK+4jo2NOY1vU2x0pVr8SNPsGfmoU+zU9haX2sx1CLJZFVSQtQmst
         UxUEmjVJ/3hGeq+BNFGMGS67G3gf4HM096igRz2EQe/NIcrKZYxNLNu/zTjL4nwILcEC
         YuEuvezG0RWuky2etLQV8GaBOPfga0L3eRJsAp3Il/h/d5JXpekD9E06KBgp2G8HlNPI
         oIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646821; x=1750251621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wfkuc3Nm6XNXxPvRJIgpzIHQXi51C7ZBujG/Lertj5Y=;
        b=Ur8YxMsskjQn79B/9irqAlwDkO0bLBozaiRi0LnMjzTUSty9Ox5BauNAv9ce+FHvV2
         XfFRQAUpDEFXIaNpjWcdhlvlhP8W3lSAwQSFy6B8mhMPFQF8rphU8WWNWEez0UdnjWWU
         hwl+swMtGeGVBtrjfnFnYKHSGK8ROJB6oFTV2x6YMAgqBEXdh4Ojw6OSPERSBfzjyuj2
         VXigSKJEeuEuZloExNElC54dzby1QCClfMzaBAlBKCvSSpe2S3h6wNR5I5jk2FoYudaa
         XhzIWNr+hEhaFovUuYGMa8QPeqwlMB7mErBDDx7lBZck1GXnQdXt0avZFGKpiJJLWsyb
         GWUw==
X-Forwarded-Encrypted: i=1; AJvYcCWFH17XCZeMT088pCrsOV/7FNJrb8sGNCg+eYLzuD1NzrObtTXV+jvn++W6+HcBTrDQA66Ljk2HwKFBfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzARIFTo6lCxagDgpre/LwwgDNM9Sy6eae9GxpTrwcxXxt+RiuT
	IJ0HNzD4enl2ZKxmxadm4S/J8oQjyIAy2mUFQYQBttRB9N/mK9WNFtFJkkdGq8l6WJ4=
X-Gm-Gg: ASbGncsO3SIEMHTePL+bgkLuEyOx/Onw9R3aysKZs7PgXqv1t/9EZpq2TQBwJ6jgbtl
	wUIzBxPoEvTdWYgwZRIjziEkkWeHq3NlK6S+GTPeoiPpW/xWdh6VJsOuFYt3PqXWHK4tMFUgnZv
	nHg3VAlbQL2u5KI/aTikDj9KirHACqzdc6GHn2doCXDuZkaSCSryYKi6tsljxaRanNPgmcXrLi3
	WdoIDkDvLLRfUU7LOmeXaDbfGD412I52iod2ueCJLh9Zv0aNIy2s5lwEz1Mast7zTdY4ro936RQ
	y0cTh74JqjvCmUYfOR5HVcHYb/sE1AxgcBX1a7EYvB58kBpROhm9ax7D49WGPvNFvpv37XhwwAM
	gqW9vxK4QjePGtuZWTqlYNg==
X-Google-Smtp-Source: AGHT+IGTQR16JIfczgjiJDhE97qKg0H9XYRosojidd3FLQgGETflIpsSTEjq5mENRWeE6+WcGFS80A==
X-Received: by 2002:a17:902:e5c6:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23641b19943mr43885485ad.30.1749646821466;
        Wed, 11 Jun 2025 06:00:21 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:00:21 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for K1 SoC
Date: Wed, 11 Jun 2025 20:57:20 +0800
Message-ID: <20250611125723.181711-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_060022_106186_C8C0503D 
X-CRM114-Status: GOOD (  11.08  )
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

Reorganize the K1 SoC device tree to better reflect the hardware topology
by introducing a dedicated dma_bus node that groups devices sharing
the same address translation scheme. This change aligns with the actual
hardware organization where devices are physically connected to different
bus segments with different address translation characteristics.

The changes include:
- New dma_bus node with:
  * DMA address translation ranges:
    - First range:  0x0_00000000 -> 0x0_00000000 (size: 2GB)
    - Second range: 0x1_00000000 -> 0x1_80000000 (size: 12GB)
  * All UART devices moved under this bus to reflect their shared address
    translation domain

- New PDMA controller node under dma_bus with:
  * Base address and interrupt configuration
  * Clock and reset controls
  * 16 DMA channels
  * Required DMA cell properties

The PDMA node is marked as disabled by default, allowing board-specific
device trees to enable it as needed.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 234 +++++++++++++++------------
 1 file changed, 128 insertions(+), 106 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index dead05a3c816..557feac860de 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -369,112 +369,13 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
-		uart0: serial@d4017000 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017000 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART0>,
-				 <&syscon_apbc CLK_UART0_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <42>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart2: serial@d4017100 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017100 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART2>,
-				 <&syscon_apbc CLK_UART2_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <44>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart3: serial@d4017200 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017200 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART3>,
-				 <&syscon_apbc CLK_UART3_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <45>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart4: serial@d4017300 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017300 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART4>,
-				 <&syscon_apbc CLK_UART4_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <46>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart5: serial@d4017400 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017400 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART5>,
-				 <&syscon_apbc CLK_UART5_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <47>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart6: serial@d4017500 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017500 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART6>,
-				 <&syscon_apbc CLK_UART6_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <48>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart7: serial@d4017600 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017600 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART7>,
-				 <&syscon_apbc CLK_UART7_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <49>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart8: serial@d4017700 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017700 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART8>,
-				 <&syscon_apbc CLK_UART8_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <50>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart9: serial@d4017800 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017800 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART9>,
-				 <&syscon_apbc CLK_UART9_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <51>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
+		dma_bus: bus@4 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
+			ranges;
 		};
 
 		gpio: gpio@d4019000 {
@@ -792,3 +693,124 @@ pwm19: pwm@d4022c00 {
 		};
 	};
 };
+
+&dma_bus {
+	pdma0: dma-controller@d4000000 {
+		compatible = "spacemit,pdma-1.0";
+		reg = <0x0 0xd4000000 0x0 0x4000>;
+		interrupts = <72>;
+		clocks = <&syscon_apmu CLK_DMA>;
+		resets = <&syscon_apmu RESET_DMA>;
+		#dma-cells= <2>;
+		#dma-channels = <16>;
+		status = "disabled";
+	};
+
+	uart0: serial@d4017000 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017000 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART0>,
+			 <&syscon_apbc CLK_UART0_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <42>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart2: serial@d4017100 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017100 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART2>,
+			 <&syscon_apbc CLK_UART2_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <44>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart3: serial@d4017200 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017200 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART3>,
+			 <&syscon_apbc CLK_UART3_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <45>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart4: serial@d4017300 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017300 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART4>,
+			 <&syscon_apbc CLK_UART4_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <46>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart5: serial@d4017400 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017400 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART5>,
+			 <&syscon_apbc CLK_UART5_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <47>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart6: serial@d4017500 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017500 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART6>,
+			 <&syscon_apbc CLK_UART6_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <48>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart7: serial@d4017600 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017600 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART7>,
+			 <&syscon_apbc CLK_UART7_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <49>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart8: serial@d4017700 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017700 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART8>,
+			 <&syscon_apbc CLK_UART8_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <50>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart9: serial@d4017800 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017800 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART9>,
+			 <&syscon_apbc CLK_UART9_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <51>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+}; /* &dma_bus */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
