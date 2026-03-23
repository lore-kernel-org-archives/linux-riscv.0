Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780D5EC01C0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQ+k5nhIsJ36riVvT+te7OI5dz0lO16l+r8yOY+TfvQ=; b=LQvgHfe4G7WUCI
	6jQbjnBv+aWlLmw3tXQK+Zysz/g3rIhpK+WuwbHLBWIm0vCJXYx2c7y3FooKKAGb3cYtzbPQjwOud
	z3OWvMvYXWkokiEapDb3PtS+AepYG/hNB0sKh2iLo65Dhz0h1jiJoqZxtr10/7gvB+4FAkyCMsiEI
	dc6uK+Maq5F8gRmehN4YzZqwzDAsTQvUk091sXnWs5s6liDpzoHo8BN0GglFpkzq4zQVCoCFGOEIa
	gzAqmKYaj9ocY6pRMb4u6kR43G/bDtv8YzmW7ixEeT0spTg4hm859NGrMyqmxUM8o5tJxRkyU2ZWo
	ONKHFF5dwqrPsbmP4u8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNr-0000000GU4S-1M75;
	Mon, 23 Mar 2026 10:19:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNm-0000000GU24-03k2
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 10:19:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so29141665e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261176; x=1774865976; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qk6FKFUlfen7jg7q4m1JiKEm7wDVFQJ1+nZHyEziSco=;
        b=hFypcH25P9aHX2+tuYyTU8k49r0+M7uy3txadv2/7CHfnT/WRQ6xBK+kh9gYMFo6y5
         9U7ZoBU0mY2FlO6qk2FDr5LpoMNEEbTJhcNErNhXpIVQcEidJTl3Qa6PjU3xsR3hlrHh
         wJYj4DGnlwiGVZQ/t3yfch1HUdzO2X92ku67i3qHXgB3FnK+sMjwAUCer/0/dkJi2vwc
         47hlYWurw/8KdK2lz6uLHehapVAtTG7D4xkn9oO/5UTyS8PUFzOLt3Ld3K/pe69I0Tc3
         YLn+nmtbhwDe1j4xEnNrM+sgr4ATpE3oyzmRU1/hbZxG5b2BmdWUbZjyoS3p+hGzp4IO
         +DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261176; x=1774865976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qk6FKFUlfen7jg7q4m1JiKEm7wDVFQJ1+nZHyEziSco=;
        b=MjrnTWFse/1QtiJstmFExqcQ4cLsVdUvofQqM0HEqQoxw772QXCylapy0iyLAZ/6sb
         bbADG4MylP/ix/8wkqZmGJfhl3XKyHbRfovFAzOIn1A4l0ujT91/gbJ4iFAkyuWFGBPk
         2J9rnoK8b8lgnVcjjI1Tj4mvENQkOq4iKMNogOxskzzCq47pxHgd8hLN/SwsEwPCOq4T
         Kd7At+kYjiq5Ydwoeh7poGwDT+crA9YKIkgI6jxv+NgckasuhZ/hB2cWVIyWCQhKdddZ
         nbsc72CI+ZyEQ7dVIckptBoggzHjr+dp343SFVVw+ExFohxXHG/L+7tneggOgz5Q2S3H
         VeSw==
X-Forwarded-Encrypted: i=1; AJvYcCUFJ4IyC2W3iDm1v+f9wbfqiO/1On00WwXhstceqQbA3fDadM9EC6Ovf5vE70yUh/G+H76YkwWINQxOvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybExT8xSKYr0UvjwmHhzIaJMSgR6IwqrBgwXuDkuxMSERGufWa
	GVXRoG0erWsQfJSuetgaa1+xgy2ArANRai/Vcqgx/+Y8jcATR5pXS8vzwsU9Zw==
X-Gm-Gg: ATEYQzxYdRn3tCNasZYicoIpNpZ9B9wmHJErI3LSd+LBAt2ZQazenZ5xFbXK11/OmLv
	hO9nb+ZUo8iRms//Z0zKAKUq8+64gvLJ6H6e3astG3EbRAfai7jXXiCp6e8aQIzo8fRLXQdmZRV
	jzQjBsuzEWLR3dz14KOjaKOLwEs/7FqSY7POXzqgk6ZS2ZqOlveCnY6C8yyhjoixZWoDIp99XoT
	pDFNZGcwCyAfG8T1ynJhXEfgjKE9BgYSc4bP6Kj4WJQpYdFvfqf3dfYU327sPnSLZeptan9s46i
	0lhaad3fqRHA0sXWaXrGJyd2bfRCW61z+hcUBQTufGXUyUrIhK+MHLDc2+Kx3y2RFzsCD2lABlr
	oYfNw6gOn+JRt1AZYCkm+5va5+aLJEFjuWp7q1XzNGZf8fjZF4uXOhCURaIZvAH51ag3J9B19or
	p2uCb149q3X1R6Vg7vq6Y+ZFVHLSNfUsv8dp+BpmdZo7l9ctFNx6c89o/NyT4+BLoL
X-Received: by 2002:a05:600c:c167:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-486fedd4143mr159160715e9.14.1774261176024;
        Mon, 23 Mar 2026 03:19:36 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:35 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:07 +0100
Subject: [PATCH v4 4/8] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
MIME-Version: 1.0
Message-Id: <20260323-orangepi-sd-card-uhs-v4-4-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_031938_078547_8C5DFDCB 
X-CRM114-Status: UNSURE (   9.50  )
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

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
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
index d2015201f8e5adff8bda75712036b8dc2b79bcb5..3952c4d0ecfb26e9d215955ca8791243bbd1dab7 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1211,6 +1211,19 @@ emmc: mmc@d4281000 {
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
