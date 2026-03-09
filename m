Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB8FEFCD9B
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBkWtDAbPGDOMhbLu2cbialYNgwIcZtgkLI/uHlzqvQ=; b=moCmrfa7FTMKwp
	S2kOHM/KsUuM/MBTLIfInnyHBGEN/A8ksMn0YMn7zR+tRV8LeNT0fF9gLUjN7nLL3QQio8imWv4Oc
	y/JOmFucK5dXU4TL1crxOandVswFF+6+E4YaA5w+Sj2opdHaW6IHTo3QwD9+UA8qX6aBcAo3HNolX
	w1npwMd72P6qVUqJjBhiHVA+f06ovS5KYB3iJlwnBeUFoUuG07OgR1TS0C0qCYS+5t5AJKWVsJ2sP
	MGxJFTJ8zMmIeJfeZohHzgJDGThm32ZNuUlDm63mncUtQxurbKGv4X1m3zHUhok2CM4IaXNXctRqM
	Sq6ysy0j94ikcjw3skRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyX-00000007Cuq-0z9B;
	Mon, 09 Mar 2026 11:40:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyV-00000007Cte-0B9r
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 11:40:40 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso3706781f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056437; x=1773661237; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dz1rwkI02gKLCCAejR8NRcSe9CYDdLI50V/yGcp3k+8=;
        b=WA+DNf7xLzWpwGcUqzoBe8HYbICtfcjdEjgjqUeltMqBLuxQ3uZktaYtgfIEu56B1E
         iqisUYg4hLkABRhEoGrIMOey7O2+WebfYjI9m9mILTFLMHmT/mLpuj+xAi8j+licuDmY
         RK2TsnJcL0j5f1HHwbiEIf6wdYY+88JotWsv8bkNy/iSZA1NrGBcgV2GgzXTtL1aF819
         JiEDX8khjb+lagoCfrXz5pzkPBqrddVEmLbtpsgzbojMmYaqZsXPqy7deTK9uGKCoLA2
         CWoV1PzorLmXHR91Xomj/cuj5lymhRckSw2JBOWu+m+A4VyjiLT/79z0iKw+2OJpBJwO
         UPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056437; x=1773661237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dz1rwkI02gKLCCAejR8NRcSe9CYDdLI50V/yGcp3k+8=;
        b=RB+hB4kMUDk0Cz+vg90rknLQryXcQXfz8/XU+75H3jNNqhgIt+7ySgk70R8VnGaIHl
         njjvzPuCogREOtyfMxbZ71iX8qnLpIvst33bIrp6awwlvz0Zc4BxACvGDh/q0CBIVozX
         LpMOfxrPG92yAHDLKtlFMPvo3aShBPyb/wRRlJoIsFdKQIUb17wsz/yr70zti50ff41q
         SLJkH5vNsFFt606XoEFV++R3J8+nvSx5qyId6gNPQm2PAAPjR//XNLiCErG1xGtusJqC
         Ghxx7EVbp0fq1G+K2yBMof8FyaO2APcE9GK8h1k+92ZuV/hA0LRshAIb/PYzLJSl9j4S
         z6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXxyb8hDIXqjVFwX6q3jt9/MpCbo5Gr8QrDbX/hj1CS0ZbmlafUG4zbWMykDstXVBOuPCeI/fg4hec3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRg4puCrPl8528uqwmqS2k+jWZdqhIlfRcBb8vdd7ZVRiZQ81y
	UtdvH5hwibaHrDTLf/xyCmII5KfFzz89UgiT3pz7AZDvBLeMB/QW962t
X-Gm-Gg: ATEYQzz/7F+svxqNVN+zL2X/RCS9wbyevCQfQFAsxsX5Rja1gUdlMEPzCqs08BpjBBw
	Y2lyB++QptZ7UoQrqYtLsaghPxeibCUzhWN7MoW85SGnSnpV+1SX/Ox1k/joywRlFXx+0yvpRGL
	m5j+D9VLbOmfP+lB8I9rtR+FDAw0/BnK7KBv5m4zG6nj1JyWsgv10n2s+eEKAQWAUot/Y17ezOr
	GIkr0QGdD27+UcSIxDF83V9NwT7lc/vVX+SOlhr+s3sMASGeg7UOkqtnYloptV6W0CidpOJohAy
	YOs4tCBheVIcX96JzlF11CKhYmqO7nwql3wxOBN3W3sjNgwvQUylW73BmwTEABv6Nz42oMPusl1
	ugAktWvMH/K9jtU7tXPwxhVwcue6gSis4oJaptNJ/EDndbJmEQ8AJkILQc2jSeon0pDMbvMu5Ym
	bymcC8os0n/6CUrqO0NzqHFkibhpidQoxBQS08bcVBZIZ9Sqd+rp4SPj0yik6nlVHawNTl2NErv
	v8=
X-Received: by 2002:a5d:5d06:0:b0:439:bb14:23ed with SMTP id ffacd0b85a97d-439da6694afmr18775197f8f.24.1773056437144;
        Mon, 09 Mar 2026 04:40:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:36 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:15 +0100
Subject: [PATCH v2 5/7] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
MIME-Version: 1.0
Message-Id: <20260309-orangepi-sd-card-uhs-v2-5-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_044039_107179_D51BE010 
X-CRM114-Status: UNSURE (   9.62  )
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
