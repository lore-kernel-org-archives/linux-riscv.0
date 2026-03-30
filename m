Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED5AF3D61F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6O8XMvZUhEIP2sl1cD/VRZ+6Y2++v2I3pArgnSCRHw=; b=xHFc87aaldUuPj
	NuXvykke5d9TiiBvoF93GAUhYq04vLovsrtB2/oNBJdGkUnaeI4z2QT9B/Fh8g6Po6OrzUf63T8WH
	opb/UoxCS+zyEGn5MEgFx2F+5oheqO3oVGYtirBbdvlNurYyVgrqiB47qZt7mA5nx1YcH5NuT01DD
	frL842ySgQvWzwdEdJqSP4tr5Z2L+1Sf2gUoViv114Bh/FnfRwzfOOVxYMfBhIBx43ZdME5XE3RZT
	dyVsdFL0+3Yhe4WznHk6eepDbUSXRpPrT7d/OkfXu2v3+UWx9V1vaWzHVPSW9jFisEkEDvB1DIrBD
	E0YuouYP56UeEyf00jAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788r-0000000AsxG-2eUD;
	Mon, 30 Mar 2026 08:38:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788n-0000000AsuO-2zcx
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:38:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-486fb439299so37891715e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859912; x=1775464712; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LD8Z/sB/L94aUjRnY0i7hrh3m0eioschCBJ3Qi7mtuM=;
        b=FugUopCCY2X3mZt78d67kZc53iBG1RzM8qTgoEo+zlzhoIIt0dx8BwPlVHPbsu0urV
         qugqb7L5h9gT1vG3JjyRBpWrliDqXToAj/HtOzgfhXt9K+kHAiu8Zv4fpq7teHwl0PwJ
         gJPV1zd33W8mw7S6uraiFau+foPaBO47deji5om5IPLCbvL8ymZfZlwqvSe2+tZ0OSKV
         5qhhFGt/z+f3QWSQ1TPPZ3z163UysK3qCCbuvJ5Usz0diR09h9XzMxYOWJRqPZLvi02z
         hcPpAq/GmNavwj8TGpBwFo3sNns07+43S5JCcLX4zwoKfs/dbFYE9/ofU65uPaghVc0k
         +iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859912; x=1775464712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LD8Z/sB/L94aUjRnY0i7hrh3m0eioschCBJ3Qi7mtuM=;
        b=hdxshqzp0GUg9B/36cJg/ko9h7ujJZ0QtjiKsxtyhmRt3lYq+g1W0Cj9/vspBIJnVA
         LP4ST7jPqFkQXt1KN16KNg6T/dKnCSLY50G5137z4e/z9+UGdVA5Xmsi5vyY7A6Aalvt
         w6V15hMnWQ01kIEhVEdkv+g45Lj2D4UysUnbeVN79UnEU80QO4Sw3ffrXMx234Ab+X9+
         /AJVsFewkI5UEcZ6z7FNSHdmnXZK/lbL8nvIbBHxSjkZlTNCtpnkPn1+RW8v4B/9NksD
         mVO7YrvJOxhuPx/KMmeIPb9sa8udEkuSZczBnVDVjKvnfujLB2HIZBA/J8EDiDMTfmpE
         Xycw==
X-Forwarded-Encrypted: i=1; AJvYcCXt26kElNGxRLoW6VE0N13AIhajHQdh+acpvhx8YkaZ8qEHv3YndekMf91voN4ujtqhUdKNe/4pdSPciw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2+HUwcccKM5RmeFBUQoM0CTLNdDUwcmgxQW3rPv1MsDMU54hn
	9BianZHOKtWk3jgZDjy2YCutviVv0z7f3K9Kl4y3hqayJyH46hONrTjM
X-Gm-Gg: ATEYQzx5wr0f6dX8Ij2nlGamp5Zx685GjM/Y1JNFxUxlKktzDW4hgCW3wQBw1VB7aXp
	RuPBmXfA4BnePPzD7aJOP07xA5CTqsB52l764ZroEfAWCRpvsYVvLoFAv15EIUGwbNT8bndm8yI
	JwEAuk7QMaqgkwYy+NUnVqvmqUSWxajU1tMmTXi2x5Epwxy/vKOZQMuP/cezgRdP9nVG2omoMbR
	CSqhdfCMF8QGJW8iD269B/lR+2ISCucdEOXpU9URLCgb7sa8amYBmlUDfDHW1Mt0vb+bTLLpEHq
	BaO7cczThivguNst+xpPBkAnfir1tejp9OkxVeqcTulxX6OFwIZaKM+vMTQaCR01mtD1/18R9q2
	dU1sAyHOs5WquWd6+TCBUDTtBit3QIUwztEt1CUa4PuxYjyJKyrwlxgHUfYjHC1cXdUkWpZn54q
	+9sOneT7QIjhF29PeFqSuuobuvTZ3QsdtWkzdwSB7Jx5qAlwGU6O7am9afv8MCd+4s
X-Received: by 2002:a05:600c:1393:b0:485:3c8f:e4d9 with SMTP id 5b1f17b1804b1-487280a09a2mr194916195e9.26.1774859911875;
        Mon, 30 Mar 2026 01:38:31 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:31 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:06 +0200
Subject: [PATCH v5 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
MIME-Version: 1.0
Message-Id: <20260330-orangepi-sd-card-uhs-v5-5-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
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
X-CRM114-CacheID: sfid-20260330_013833_773140_B526BB8D 
X-CRM114-Status: UNSURE (   9.54  )
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
index f0bad6855c970a609253d4b0ca2a4fcbf06bb8e3..28949f804610c60b7fa89d957507be32e3b49f34 100644
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
