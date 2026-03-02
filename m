Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A69AEA4E20
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBkWtDAbPGDOMhbLu2cbialYNgwIcZtgkLI/uHlzqvQ=; b=Y8z4zDJO/s2EmO
	6d7iVdWULWEesNa2tqu+dy5lY5UaX0P02uxgNljiVbGLcsuegx9eJ9bxWUNuPzV5an/9zaBCY+L75
	+sLoyB3bZsDe948XVaXmT0QObrt3hWQml5WkCslb45kJmewy1yvxGLR8BGRVEP5vUaKrz2oixEVOW
	dqEY3XvIZKbI4CQK5T8SxXo/TSWfrf9tiI40g4BJcjNyhM66Gl2V/1fwSUghoKX1HLH9UPQ0P6BIX
	mvZoleDf5KCIYQXDaqyVGOsWRK/r3MfGN7cOFitHGcP0f0pgOgFYzdwOhGynIM15OaiGRuoUDhuYB
	gOZKPdadiKpfzoMr4hJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4yF-0000000DKBD-2hUA;
	Mon, 02 Mar 2026 15:14:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4yD-0000000DK7c-27NM
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:14:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so34300545e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464443; x=1773069243; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dz1rwkI02gKLCCAejR8NRcSe9CYDdLI50V/yGcp3k+8=;
        b=lv9idoliJau1zEB/B5b49JFPvdbsJXFRCLD2Mp+V4htInfHhQXMYJlPZ4ClkFk1DpX
         B1RXceOzpVpMvDIsEdZZFaejh6rBggQ8u36wYeoTLib/Yt1jLCJ4IInHgt/GBSOhSVWJ
         NYRGmfXAvcAT5SgfCrzO/CAmBSANGDjFNKprvrFhn7OWWuadvBtJzoRjAFQvak/a/Fvt
         cYQJ8iDICKk1yCA5I0yYAC8+wuNobtWQpq1vATLOSNVmDhmDsWrsdt8vYjKC+Sc0e7MC
         CKq/dGZBQc4QpeUgIeB2ax4yXwsSYLtIiR9+ScVnReMROZ7Iw2/QqJglP/6cSm3cfDJb
         3wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464443; x=1773069243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dz1rwkI02gKLCCAejR8NRcSe9CYDdLI50V/yGcp3k+8=;
        b=qMT3tQcv3y3bSBQWr/7wPcOv0JwXrfAklsA5Ly9wp2fcjWQmrQNktGYZCqMo2J6Ums
         /d3YtyWg0Yi2f//FKvc0g3WyWl/m6rCrTQBSX1zQFYSGSRooysmByF+TdhYa8jf1S+Ed
         moGBabCXo35PlfDq4DStj8nlMpvQ9i9m1IblJsufFT7dUWckvCZ3NbyefMULjjcWk8M7
         aGDXCJ0Zp6EbzWz6i09BE78CV7FjPwUfpuhHi+MpIBLJBE0Go7bOw8bdytwhLd2lrzc4
         r7EFG9sv7NFcdk8R6NNy3NmNI35/1IHyRHadtSfNYVGwLokOpCAQkR8jFXl1rCrcGIo+
         xKoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxpxnqwdSm2/BKBj41g+OmiYxjokMwUdIZ76FD5r3slfOtdAwQS5JwCZiJviIAfBvw+NutxQr8z9eWjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy48stOfnmcYI4MkWDpQERaa2majWahWGCaU5F3TI5/naVKagzG
	sK9F4tA59xS+UBCWObWXPg4hDgBG2gyLTwDw2RmweFmSeWwBuTPM78Zc
X-Gm-Gg: ATEYQzwEXXZ3xbgACgKZDrs/Vl3MyY9aaV99O890srVJxipZoC8mpH1im2gLfFdA4d3
	WcLrvw+URc2IToGxMttIzCyjlnpEkzppqxMNTDNjVGfd33QZIc5ePLaQHpGp4KuJbt/B9O3aBv8
	+a9EX5jcudCd2U8i4MBtWV/JytfOhO2LqVyHDreI8SZMzm2Wh1umRPobZMoVUhK0ymEQ/meEDZq
	dWsNop+VGJFBkU/qPn3idTw5HeHKTtS3PkK/mfveSJqbHpErQDFVd8q8bm9lRg9tsVuCnrxRMOm
	IcjmOZraiDuspejzaP1djB7aZKzFUUjeew/dnCqkxPIcPJ7KV61MQtcca3DESaoU0jEmIGWIj15
	8SRX9oSKhAwykRV9+NsjW8wl1vd2UQsZQ3N2JOxC2+SGjGyBQnd0mzvAik9PyEJKR3AxAS1VZf1
	eEwD5JH6FVCzBLWIxrVfSZakG7TXW3Fb+WIj/29vo16fvehCLaXKSEdD5PeE+ZdaskGQ==
X-Received: by 2002:a05:600c:4e16:b0:47e:e414:b915 with SMTP id 5b1f17b1804b1-483c9bb6564mr218276695e9.2.1772464443134;
        Mon, 02 Mar 2026 07:14:03 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:14:02 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:29 +0100
Subject: [PATCH 08/10] riscv: dts: spacemit: k1: add SD card controller and
 pinctrl support
MIME-Version: 1.0
Message-Id: <20260302-orangepi-sd-card-uhs-v1-8-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071405_573887_7D106D64 
X-CRM114-Status: UNSURE (   9.44  )
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

Add SD card controller infrastructure for SpacemiT K1 SoC with complete
pinctrl support for both standard and UHS modes.

- Add sdhci0 controller definition with clocks, resets and interrupts
- Add mmc1_cfg pinctrl for 3.3V standard SD operation
- Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
- Configure appropriate drive strength and power-source properties

This provides complete SD card infrastructure that K1-based boards can
enable.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d66022d27307de73a6ea3287e97441..8d82011f1af666fb78c282a2abcc0cb88f962053 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,44 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	mmc1_cfg: mmc1-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <7>;
+			power-source = <3300>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <7>;
+			power-source = <3300>;
+		};
+	};
+
+	mmc1_uhs_cfg: mmc1-uhs-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <13>;
+			power-source = <1800>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <13>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 529ec68e9c23eb2a93c04e9ccd3f22a01c4cc4ff..1e9e4f4f41c196326f20c0e5ae6721ea85ea5091 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1207,6 +1207,19 @@ emmc: mmc@d4281000 {
 				interrupts = <101>;
 				status = "disabled";
 			};
+
+			sdhci0: mmc@d4280000 {
+				compatible = "spacemit,k1-sdhci";
+				reg = <0x0 0xd4280000 0x0 0x200>;
+				clocks = <&syscon_apmu CLK_SDH_AXI>,
+					 <&syscon_apmu CLK_SDH0>;
+				clock-names = "core", "io";
+				resets = <&syscon_apmu RESET_SDH_AXI>,
+					 <&syscon_apmu RESET_SDH0>;
+				reset-names = "axi", "sdh";
+				interrupts = <99>;
+				status = "disabled";
+			};
 		};
 	};
 };

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
