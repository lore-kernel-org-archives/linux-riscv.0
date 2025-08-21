Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F776CA0EFA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 19:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UXnWMuswQuO1Xr4F8Pq64LXlVS5wankMYDYpiMvTwqs=; b=VIZULp16+itbG8
	oe83HrvINncpEZaZIPI3qRAfYN/1Iw7K7gAbOMvYBkro22Fic+GI9X9l0b8KfS3XGpJByu0r/h0eI
	BYe3pEyl12KUw22zd9YC+ZH5qy6h32/0WAk0Ox4NxaDGuJ3UOycMxCjvRhwU6Bt15h8fti5djkXzb
	lr7pmkrajMpsKNcRzb4u+y0xi0g4qwvNVM89oxqtDm67F5agBbaolgvHNd8dQETheF61LMbesNSAe
	VMipRS9EoWFBvHX6bs4eoWsOMbOotelUiLzYlQ+KheXFmPlGfG2DAvvB0m+NWLR+0+N+jfHoy93FE
	V3mia5gU7jCtHbyQCObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBAe-00000000Kcu-1fBs;
	Thu, 21 Aug 2025 19:42:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Bw-0000000HLgw-0YP5
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 15:27:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso8980105e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755790022; x=1756394822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sjxBGydTfjruOh7OE8E/RbRzU+dSv4jaJNJXDHUfdU=;
        b=gpc4DNEI0i33aQ6yimIbtahd8d2Fm7Ai1wkyJR9S/tW8pNTOTsksLeyz71w0KaTYlx
         2dEmLKm8ilM7TYp9PVwnaxZgJe6hyD0fvABjPM6rczArKD9PVQMVGh+OjejAipUHhZlo
         HgD6YLKJ2dUavbu+86Jnu64tXQdJpONBQ40hZNKe5jyh9eamXccTQDjui8s/PgvKukDV
         ymmvo84XX3HLQDr6qITpGH4vhXzf7hHUEjLyo7JTgGFIqkfJTG6y7mwH9gsjHH0sh/uY
         ELB/gLp6W/j3Dl18f9GjD0SU1/8l2GeBEAY5nX4r5S8UhF9YFQD13Ku7+sosbszajRJC
         MutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790022; x=1756394822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sjxBGydTfjruOh7OE8E/RbRzU+dSv4jaJNJXDHUfdU=;
        b=u5uslCXaEsUYr33RmDAF9DPjLqDcSYo129dSa++mSoNTspkBZT2a80qq/iUpiLP1xF
         ofTiR/Oz2U9ukzOZ/tXx16Gh3GPiuaDwSnCED1jhAmhwOGIqiXDpoPU8axrLV32+Vbrr
         PDcJIsqTX91QV+zen8bk7TJmTHxRvkZeVuPoZeW0alEPaxSDz7p0iAtE2ERjfOdY8nRp
         VTLrbvspy2bWngjEeREGrCPCDvaZiJPJgvO1m+gMefuDfRyC8Y3ePcghND2qUifrpL/h
         rCd3Cy9jA/I6zc7iSxIT9yFnVEDn1/d0D1z+876P4rupsBRdqDscdhzFBGwtrLWCfEy5
         5c/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3gWqHtHjptk1VxfDoPMjiUGsqnJZipzxZLRZ6rnEUe905bIAcf+HzaLjFahzMbibTV0QB3N5v7x0WdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YycYDgBtjVw02dt20enm2l4iHjo1GmSmUHCXZ4rT1/Nlyp43f/Z
	yI+rQk5RCEsqADor9vavczr3WcGOWuc+5iISNw2inHqX6bV3GjzwlofiEjgAB1flDfI=
X-Gm-Gg: ASbGnct6z0ZbMpcJYaVUumVPN6uUbZO3eOXQ0L5BuuR255X04PF/4ngmlhqSu8nnMx0
	lbuC2xZ+6czZNaganLrljXL/7vQdsoBWfF4PgavKqhM3I3ssAIMsJfm1jv71cHnJRiq6DjPaVBf
	/1uWxg3uYatStokct4czKgQXK3NvXO0kZJnCFHJksqU8Snqswh9Z/fMe6R5PW7a1uO2zjwE5n0t
	nMRYGubQhzKaym9NJixkQteRoam6rt44mHT2fBoXtsf8xK9DcA2ZQzoif6u9idMtzvuUTeWDIH5
	ryW33ori/KX3Un+a2O3AD2DXP+WIZdeg2yWET2OilKJCsQOClHGjxbMf+FKkEm7rE14bun8iVsE
	fpbZJrTpdUCu/SSbbp+f3xBulEt3K/8TDtyKqgySPsny4oEq57g==
X-Google-Smtp-Source: AGHT+IE+4ute/Nv5CZt5NNaDUwvVYtWu4YiNVI45PLItPoW2P50dq71Gb9k2LF4AVVqf2Lr512IxQQ==
X-Received: by 2002:a05:600c:1c90:b0:45b:4282:7b60 with SMTP id 5b1f17b1804b1-45b4fcc3244mr15901095e9.34.1755790022155;
        Thu, 21 Aug 2025 08:27:02 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:f5e3:b428:f4bc:eb5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50dc00b6sm1538345e9.2.2025.08.21.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:27:01 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] riscv: dts: spacemit: add UART resets for Soc K1
Date: Thu, 21 Aug 2025 17:26:19 +0200
Message-ID: <20250821152619.597051-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_082704_406152_3B3FDBB8 
X-CRM114-Status: UNSURE (   8.50  )
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

The UARTs in the SpacemiT K1 device tree are probed by the 8250_of driver,
but without reset lines they remain non-functional.

Add reset control entries so that the UARTs can operate when mapped to
devices. UART0 is already de-asserted by the bootloader, but include its
reset as well to avoid relying on bootloader state.

Tested on Orange Pi RV2 and Banana Pi BPI-F3 boards, with UART9 enabled
and verified functional.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
Changes in v2:
- Improved changelog
- Omitted current-speed property for UART0
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95..6c68b2e54675 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -667,6 +667,7 @@ uart0: serial@d4017000 {
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART0>;
 				interrupts = <42>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -680,6 +681,7 @@ uart2: serial@d4017100 {
 				clocks = <&syscon_apbc CLK_UART2>,
 					 <&syscon_apbc CLK_UART2_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART2>;
 				interrupts = <44>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -693,6 +695,7 @@ uart3: serial@d4017200 {
 				clocks = <&syscon_apbc CLK_UART3>,
 					 <&syscon_apbc CLK_UART3_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART3>;
 				interrupts = <45>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -706,6 +709,7 @@ uart4: serial@d4017300 {
 				clocks = <&syscon_apbc CLK_UART4>,
 					 <&syscon_apbc CLK_UART4_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART4>;
 				interrupts = <46>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -719,6 +723,7 @@ uart5: serial@d4017400 {
 				clocks = <&syscon_apbc CLK_UART5>,
 					 <&syscon_apbc CLK_UART5_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART5>;
 				interrupts = <47>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -732,6 +737,7 @@ uart6: serial@d4017500 {
 				clocks = <&syscon_apbc CLK_UART6>,
 					 <&syscon_apbc CLK_UART6_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART6>;
 				interrupts = <48>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -745,6 +751,7 @@ uart7: serial@d4017600 {
 				clocks = <&syscon_apbc CLK_UART7>,
 					 <&syscon_apbc CLK_UART7_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART7>;
 				interrupts = <49>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -758,6 +765,7 @@ uart8: serial@d4017700 {
 				clocks = <&syscon_apbc CLK_UART8>,
 					 <&syscon_apbc CLK_UART8_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART8>;
 				interrupts = <50>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -771,6 +779,7 @@ uart9: serial@d4017800 {
 				clocks = <&syscon_apbc CLK_UART9>,
 					 <&syscon_apbc CLK_UART9_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART9>;
 				interrupts = <51>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
