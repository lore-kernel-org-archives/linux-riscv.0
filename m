Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA34C001DE
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 11:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4L5RWc9frydcv/jdSSJqHyPVtbQl68CV7WY6RwY2ys=; b=kowvcFgwviz0lJ
	PccgNf98PbPzH0VaytYG5Z+cvEswkVMokcaflZkuQcDLXPLsK27szXyLut4RFr4MnVpkOgCl6suiM
	QEwKr1nxoJkhexoh6JbOXhnhUJu4NTe49l6GuF1FtnsGDocT4DP59hShe3Yj+udRLLf4jX9+40PnO
	1D7IeBg9l/VKAsr9pXnEHK8kbCYKr8idxRDaRhcSjuoKwiax0/6/2H8OOHZlfOe1UXdptgVcLTX30
	Pv9VCqwVGA3sbYeUY7nf8EUaEq+HDJVaZsh7bDAxASGCV7K4NMSi9GMnoc62lEYy39wymgMBoNnN1
	ycDnETcCwUSLEShJdVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKdPY-008Z5T-2p;
	Sat, 15 Jul 2023 11:26:04 +0000
Received: from out-39.mta0.migadu.com ([2001:41d0:1004:224b::27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKdPW-008Z3b-1j
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 11:26:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689420356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Je1IK6lfysTXxuDNeexeifoUO9/0LoHKaSsEoi0nLA=;
	b=qjycuv7C8MM478tu7GZ1iqbtbkEH02oqYIe20ph/cC2vFNuIxx52ibutHnTswTA4rQLA8I
	SsFzX6UX0QW6GYj8F2KcCuLrIaAUjvEEEyy9okx6KhDymZuFjSaJUyYXN7KGvt7qAFLT3q
	oyjtrZ6w7jXwzXWmG2cIghULR3qyVuFa7G46ocL0A2F3teNFe83XRvCaYt//6g/JOHq27y
	SnItJKe0g0v0tcURmWZLayi7iiK1q00R5S9otEUbzcQtKm1IFZIA6uoywdccEfu8lzFawV
	g1lTX62UuAZ1Z/WMNXDDZJKNSoEbHohkPD2kQDqby6emGFu7c2UJv6XxSXtW3w==
From: Jookia <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Cc: John Watts <contact@jookia.org>,
	devicetree@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Date: Sat, 15 Jul 2023 21:25:20 +1000
Message-ID: <20230715112523.2533742-3-contact@jookia.org>
In-Reply-To: <20230715112523.2533742-1-contact@jookia.org>
References: <20230715112523.2533742-1-contact@jookia.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_042602_718347_E1CE8006 
X-CRM114-Status: UNSURE (   7.94  )
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

From: John Watts <contact@jookia.org>

The Allwinner D1, T113 provide two CAN controllers that are variants
of the R40 controller.

I have tested support for these controllers on two boards:

- A Lichee Panel RV 86 Panel running a D1 chip
- A Mango Pi MQ Dual running a T113-s3 chip

Both of these fully support both CAN controllers.

Signed-off-by: John Watts <contact@jookia.org>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 1bb1e5cae602..b185398334be 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -131,6 +131,18 @@ uart3_pb_pins: uart3-pb-pins {
 				pins = "PB6", "PB7";
 				function = "uart3";
 			};
+
+			/omit-if-no-ref/
+			can0_pins: can0_pins {
+				pins = "PB2", "PB3";
+				function = "can0";
+			};
+
+			/omit-if-no-ref/
+			can1_pins: can1_pins {
+				pins = "PB4", "PB5";
+				function = "can1";
+			};
 		};
 
 		ccu: clock-controller@2001000 {
@@ -879,5 +891,23 @@ rtc: rtc@7090000 {
 			clock-names = "bus", "hosc", "ahb";
 			#clock-cells = <1>;
 		};
+
+		can0: can@2504000 {
+			compatible = "allwinner,sun20i-d1-can";
+			reg = <0x02504000 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(21) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CAN0>;
+			resets = <&ccu RST_BUS_CAN0>;
+			status = "disabled";
+		};
+
+		can1: can@2504400 {
+			compatible = "allwinner,sun20i-d1-can";
+			reg = <0x02504400 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CAN1>;
+			resets = <&ccu RST_BUS_CAN1>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
