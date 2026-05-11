Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C17CD37B5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fx1V842vBQtiLN0gc4AUyp0PutzcyLyaLO4ltpVpYyA=; b=1f3iFp1vvpGrdt
	XHyyBQvA3iP5BV3QUxfpprWLcdPcU9Hm6L6fP7XY23f3frC8LnJTntRB+BW0fTLRFx86am36Ea7dO
	iXXmvHX3u1LyweKK+ySHR0YWkG/GdMe8x9DUfRj292MLwWBB9Os9lv3h54dBstRRHnzInv41tbNdJ
	ClWVXS64RhufVGpPem1W6/aLMWUgH6TToikEo0bRVODUoi3K8xIZ+vxRskX6y9I1NkYDTnwV68cum
	JVkrDeu66/LMFZycCrY2GrkHuCnCuQMGrOxXdm+jbMpzXDiTZDICY7ERdTEIq9TjtThyrTeTlgcUX
	rvqf4uUIOda3LGsNjZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPQ-0000000Co75-2qb1;
	Mon, 11 May 2026 08:54:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPN-0000000Co3P-2dpo
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 08:54:38 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2266197f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 01:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489676; x=1779094476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHZBSgDtUIrOhP/YxIJOEaKWgx2xyCzMyAWUTKPESJY=;
        b=podbmz30Kk4YV5fOAx4NbIo5xgsnKgnppMumm3GtXvx2uOBwzIbmISAMANNSpq2L2j
         0CjIRZm/yFDazv+qrFM9Pj1JaBN0GZRMPsiw7yF+25g0PYB1LkLNULo+EOlBUiWY9M4N
         t6cbzqJEHQfbewRViRSCDZBv7SKdeCra6zPZSl3zJv3+fViNjIIETxX4XeUvS6SkBfjE
         rlE16aQwRue7DqA3cCIfLmvjasmyB0Wy5mvpcUgLAx3Z0/s3NBBSc6WOWA1uFy78fQc7
         l6j3gfoAgnf0Gj6yAdAGrbXjmv19xDlj4NyoJgx9AzpmGpsmMc8uis3ptDJeW+a+G+sR
         fRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489676; x=1779094476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eHZBSgDtUIrOhP/YxIJOEaKWgx2xyCzMyAWUTKPESJY=;
        b=C+6KZnozShxBrceVGqTDbf+FbFsXRPahdeqERTco6soNqH64L0J2Nk9Gb4AQwmGX0D
         URfVaQyHtpC9qLV9rITNN1sN0J3sjXAZHLjANIvbijyEHSsSNWFitakWiwGwte8kP6FL
         QFiGVejgXqVMG3cOswUR8F99vCDZeyVHItwihy59jKzHmd67Hd035wfdlgzEjqoLPifq
         WfzTMvgqLub5ZKeerysGReaACY7qfJSlFgtz1O0Y9PUeDf41X6HjllJqzgV4WM3jeUPi
         5s9Ig9rztzhFPiuW8LVFbwJY5ZDxh/EJ+D4MiQIR4CROWw4Iq/N7BtMuzZZWP+q528Y8
         Q3pg==
X-Forwarded-Encrypted: i=1; AFNElJ8BlaGFFjjVemaHT5YxjL+RI0QwWLfdHl4ddqJnxcrHO29oA+KkSq6m5IImFBFZBHeI8jYxSfavyWaQeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcXf3ivbu9FFvxhTAOY2Xn7c4CIbDqR2HpzqBrYhnIOohd73EL
	arr2e8NDnLYAMKtMYVlnxGRuw+ciLTxQX9PPHyeNMKtL1gLZ6b3kWQdw
X-Gm-Gg: Acq92OFPXa7/AOfs4aq60/PsZoZVvIlWxESsZNkg7Nt9X7B28lmJ1IlQesU11IA7dr3
	AUnYKIGyHa/NH7dxhLR/JMDNVkrDnINLBvt0iq/6isZtjKTPsjPt5EluV51gj4ukai6npPRY40L
	ZJzrh95FRZD8S0i/JSiT76jMtpMogsUyLBTvY9RPClHxU3b9goGwy8balOvRnI3NagmXXIfhFbC
	YLyuc1H20+2d0quPmmMsJMYqrl7lpWKbXrKp858j+XZlpPgz4eiB0I8ib6YZlSz7hBrzsU1OQUP
	CdkYIevG+KKfVv08WVQt/8g4nm32KBVX+s1k8FtxwnlZIsg3gE+Si2UFWMc5Uqy4hYxB3Fk4GKC
	qTJedCh/1x5zTa7oiWfNoxLAdnAEHVx2TdS59k9Q55OEHMcQ2/YDe/GHjl+mgu8/P1HoDnUzJEX
	beO01I470enoRcF8K6i/uHEPcrdnKfSBiyIRTT1ICg0F97xykwryYdqE3NgdxYhZDstw==
X-Received: by 2002:a05:6000:310e:b0:43e:aa88:f1a1 with SMTP id ffacd0b85a97d-4568ca51624mr12522568f8f.30.1778489675606;
        Mon, 11 May 2026 01:54:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:35 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:54:00 +0200
Subject: [PATCH v9 5/8] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
MIME-Version: 1.0
Message-Id: <20260511-orangepi-sd-card-uhs-v9-5-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_015437_704026_0AF48F87 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, devicetree@vger.kernel.org, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
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
index 34d88334e95e..4e9a62d0e85b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -590,4 +590,44 @@ ssp3-0-frm-pins {
 			power-source = <3300>;
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
index 24becab4c959..6ded5c06b797 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1226,6 +1226,19 @@ emmc: mmc@d4281000 {
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
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
