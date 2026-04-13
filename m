Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D17EBFD0A
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 07:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAYbMofQ3eHoIjp+Ia2oXXfNnTcp+YrlzTrumzk4CBM=; b=p3p89QEY9S+/cf
	vN/VXl7DZaOhZbpqKGKsiZbxscQ6d/yWS45Ek8gd/gSp1dfqxYXmrZtdeUpybQanWILED1Pkwc14Q
	Es75jVMM1G/6HnY0QHt367iqqyz5DW5oFHxLV85uq0EvGzYWfgmEXyuXViuKiN2/NOBofomW6GIX1
	h0djbJZx8UesyvvLgIdOh29iYI3I3eByCXQ38wKcmSl4/VXlElV+qCgwJAITJXVwuRV5/biZDetMF
	iexoz/RcpPPPX8c62QHYeZmEUSBE2JzpLlsRStaEhz/ng2KuFy/fTQsiYpVcv1qa9m59wkMcqJ4EV
	DebF6rxmkH3KUz5cC0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBgj-0000000F8bu-1nYP;
	Mon, 13 Apr 2026 07:26:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBgg-0000000F8aM-486Z
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 07:26:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48374014a77so57158135e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 00:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065185; x=1776669985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=ApFz7IFAyFwMIjoFGr3jidC3PKPjtOeTC/x+9aWYiwmpl2izVPMPZZnNDZnKi5R+g6
         mxcUB7RF45WItHhhflB9P9uujgVVftvL0V8tXNHjXYDoJxMgkcfCR3fa2wxl8PSwzXoq
         HRB1oNhpW0ncE6UsHQcKYeJsBT+0ZbPChwJqETfAPpSfypIdmXawHvWUbvv2v7+Q8klw
         3ELOTcmMaigzlUGGjD89uhpUHwKhOrceqlsdo8fWA2J3dwlUslV/Z+1KhMpP/VMF2Ttl
         h9u7ujLr0zVW9Xwxyy+X9QXGPy8ojIhFloWDvHkEJIJpCH50ur+aW484zvrNyFD8scWE
         0TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065185; x=1776669985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=iAyC8l39FZ1KSykmlH9I/RpfEb4TvML4mmAjyxx2WmwyjdieiYsuApf1lkDkC3X7Wy
         MJFqUbfivaifDAw140d7qqK6QxfYT7FtLo2cNEFm8roBnQHBIJgRziGTAK8FDbayHYo3
         2fiWos7WRe0JAXRJYyUAtV/E3+ZfD3sVjf975gbAa1H/9Up0GHWJKhCXEYVEAGVU43JB
         FNyn8JKYcTvKMFDu5hSTOQs+ufgMPPYQlzjNLSc4WO99u80eQSplyFTOphPpszeIUYJI
         Ng1I/1JNEMuApV8CD1lc+ybLnivNMtBX8Yn0v1LgOBknVO9g1C/ZX9uQMNd0IdM5c7NF
         oT3w==
X-Forwarded-Encrypted: i=1; AFNElJ945vm6burZeOt7PS9QZRT2gwhRbvOMjCdllh95E8lL4Ly4PQPsS2CiawWZa/nIFxCvBCmjROJ9pJmEEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YygJlzE61XS5BRi+3zmXpaTBNyuAojS58gw6/Q0tR33nTFpqbbP
	eHlujJr1WBN3/nXeyb4S66Jj2u8Figx28FnZgo+n20q2+sA788D/FcaW
X-Gm-Gg: AeBDieuDNE9uvjcOTh7TyB2RwkmgbGfc/aVHCtBWSCMuoPmFv7B9elXkWdN3+tJMDGU
	rsjhr9fzquOFO8M6uY9BkoRtN+2cWkVDhTw8+CadjjHrRrinEjt8LbkvCHZ/LlGhLVxY7TOyVbF
	BsuA3BoKeaJi3DtoKfkf2qvOIFGIblDVU3GuveknSeDA0n/rmqU0trbjMft73ebeH6uCjEs/xi3
	Lg6y46JolJ3ef6io6z9UcAw6J9+r6BjEz6m+QXgaN7g+L2T0NalNRV6vVqL2x8eQCAXdDPQMNAr
	io1gnyxRCcdjnDrPPuCPtYLEq9sdICwbF2hX0XTGJf3IbW7Se4FuZIb3Jpqgzg33oDby7ebP8tJ
	BUk3bucI4C6ng+gi0y/WOA1Dzib4JKzl5VlitrmI7fU0+Di6gOSmVe5mxkhJJWyPe+sAiWK56AK
	v1Hnxzal2MEvfw96hJ8r9pZarFyomAw0ZjXi9ea/y/uAgHg70SIvDNfiK6uU+P63O5
X-Received: by 2002:a05:600c:528f:b0:488:a82f:bbb4 with SMTP id 5b1f17b1804b1-488d689d0b8mr164261225e9.26.1776065184991;
        Mon, 13 Apr 2026 00:26:24 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ef00sm308602325e9.5.2026.04.13.00.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:24 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 5/9] riscv: dts: spacemit: k1: add SD card controller and pinctrl support
Date: Mon, 13 Apr 2026 09:24:47 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-5-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_002627_053092_12F6F5A7 
X-CRM114-Status: UNSURE (   9.55  )
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
Tested-by: Vincent Legoll <legoll@online.fr>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d6..b3c472a0783b 100644
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
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <19>;
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
+			drive-strength = <42>;
+			power-source = <1800>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <42>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f0bad6855c97..28949f804610 100644
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
