Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FBDEBFD10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAYbMofQ3eHoIjp+Ia2oXXfNnTcp+YrlzTrumzk4CBM=; b=Vb4m1rlRotwS5t
	iaUi/Q6SSmAQekHINnHSXrFwawpQZPXT9N4qckBHKvFCsZ3yuJyPxHpVBpP19p8xxndlqDgkllpak
	Te4Gsud10GRd4NPwD5AU3pcwQhTCHf5neyDYf8wsYo650iHni8zkMejtZOcE9ks/SAyNl9e5Ubh1A
	nXUNAPnYVvPi+aHztWUhwSniH2d+J3EIg86Jbsj51dIrfAYmRsb4dmznh740EV2swBgzH6u7s+7Fw
	U9aBWge6erzcNTNto8IsFEf9kHLrCUbNb9hDZh2bckeMCVx1hPkpOI2P90pyocAbFM6jft2aOMmm4
	6OA8Gxb/1CVvSCfab/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCGF-0000000FDSW-0fqo;
	Mon, 13 Apr 2026 08:03:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCGD-0000000FDQ0-0KiP
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=; b=CDLpyENMhxjm4JW33j69nSES2m
	2AknD+6lnA9d/sHnKLEUnmX7/E2fqrWFS/29CV8dvINyuwq3ERjkM4xCNG5qPeEao8T7i4xGK7fqT
	XRVPGlurlUapeUfK2fccMML79A7hleYZepT+pk2WLTjtYA7dOWA2lN9qHj3Xoyrb7145TSVfrf68E
	2w/FnlprwsiX69lo/haa9EKXsTX3wiZXSJ4du1AScK6EonN6YrRY91zv8p3OaklpJZibjbAEvn6WZ
	2bqChgc6aaX8TomMbf0DDzX5pdNz6+7nOfdb6/ZaeYGufWRIdDujZgcK2k3Z7W457kOO7tnR68iXy
	AqUFOcmw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFr-0000000GLDm-1PFx
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:03:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so758754f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 01:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067364; x=1776672164; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=kPBDfTdee4wQkZtmJzEo1bku0IlfoxOylJEW0JUUaRK0fmukfqTXAVr+6rZ84Sx9nL
         c4qvMafLgT/0oPNf1jx5WLraIdGiCNfdTDcFEIwSsfeR8lD1v9hNJy6ewQtpE2oh/ZQ+
         EYCUfHZiCiauKP4le/mL5+MMnLYO2Z5ocAOQGYpunzpZCD5duhX01P13jrgUtThSsM2K
         NAQs5EIMgQ9D6DAiBXqWWTuasdQ/y2qznLfAa6d2f1XMgdE6rmaDnujZmd6+HcVxB90D
         KDwEcIjVkkGA8LCG/amyWKcbrfIOfD38Yund3joERGe1Hj7zYxyzam53bs4OWf7wB860
         fjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067364; x=1776672164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=LoE5ZZ86Q+2aQrLfbQiIavVmbKGGZ5+3Se5ea9rwqtz+EqhMjFrRvkEvQa9FDTYgfP
         ICmfBhCmF0iDf/NdItFYJshg4UJvgD0ImeauN+xbSBCAwloeFajNlxkYU5WyzrKk99Vd
         igdnIeFA9FdE+Pl/840VHNGkyf1KxOMsoGCfrxm69t8evewvBDpReImS/bp+O9yGIlYb
         AIYcDoGnnwf+Odgibv+nmEnAyWC/z0n2wrQ6Lhg/5NjzY5NW5UmOHkB+4m/HEmZZImVb
         2WGFHrpPoSRDQwR+b1k9zfyJTBmanXuc9bHRl76zsiBJH/ohIizhOGdzCIVatjwv4jcn
         3s+w==
X-Forwarded-Encrypted: i=1; AFNElJ973bsaN6ahEqI8QNRBpq79BCV+WTrY83JOMxXonc0TOpgp+nZeRiC1QvIH1sdVDmg4vZbqmme8WXGePQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk3D/fFEGHER5E4yC2xZIDlsXBOMVxKSiCLBFCbtMzREMO0PA5
	qwfNJYRb587gCobf3rCdDA+LoyYGXm3+bqFrAC1//wbewHNVY9uWZmOs
X-Gm-Gg: AeBDievqgUTTdRIZDz83jag/ckZA816mAs+D+aiHCaPpMl4E7pSzTPORIvCkTVKTmXQ
	0RpZmkzfz/cCpLmsc6RiNDoekZsfqwi0BbAU/dNq9bZopVn1BU36V6EoSwo0VzFDKBSCFbxC9B/
	HzdkjRL717ykclkRmiNOpKAAmxDizYNIKQcH26Zraueo4hG39XMol3ULJIHrBi3UmeXWutaKf2T
	Dh3UOlZqwkHOs9LpBIn3jWjir5nnhnCUcrxi+cFvOM67kfABJnnesUZRtJ0b5LiXXQq97wZtCyv
	3fbqYjGH9NnyeSeoQ5nJxH+pAJ/orLNTLjkqbM2aDbUTjkP9w0HrY8QYATAaOopfPFpiq9nAq0U
	YQ+IVxDJSM2bb1Xl+cX+HJbzxKiLZoCSCyZ+9XQAqg8mletQ7O91qa5YxZHed2XpPC/BokyisIR
	R+sVw0y96rftrzTklcruHTCzFRzh7aJlX5WesCFtmmoM8GTURhS2SxsNt3mJpge5wM
X-Received: by 2002:a05:6000:40cd:b0:43b:912c:25c7 with SMTP id ffacd0b85a97d-43d642c4f22mr17696379f8f.25.1776067363780;
        Mon, 13 Apr 2026 01:02:43 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:43 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:14 +0200
Subject: [PATCH v8 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
MIME-Version: 1.0
Message-Id: <20260413-orangepi-sd-card-uhs-v8-5-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_090301_274064_C6098DA3 
X-CRM114-Status: UNSURE (   9.30  )
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
