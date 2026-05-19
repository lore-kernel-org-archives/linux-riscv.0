Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE7BCD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 06:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlyPbooZCGt2Su8iqYdeK234F97AROF2ydWxaPwmsyM=; b=FYBqYc3xpkpiKE
	Ksy8HCzT3xnopqgFQfp4gVKDSHE9U1SJkMc0lgv5tMoaErZc3NIqLj1UkFtljmzKcpXH2ACCR6tg2
	dKJiqHnrauixp11lxPm5kMWjSs8rRI38XMr1inc4YYPgHghWQTfEcuzjFiRwoznFNj8Pb/fAr/Eaa
	6J/BQecQNS89H4Wyzr2UiAraqfb82Ge+IApG1YAMVCoHDSWKE2uIm1Sd3UCDquFHZ/uZ3ztNAOw2p
	nL7ctLBuWFzzQ34mhO88gYWqRPPuOYKJjB1eQWVGCgXq7RiOfqLgPQPBTTpGMEzT6j8OipGOzMtQO
	2rqQOONGmyDOP3GlGnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDlZ-00000000IgW-1jpa;
	Tue, 19 May 2026 06:17:21 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDlW-00000000IeX-2qnX
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 06:17:19 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so1334114b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 23:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171438; x=1779776238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUJ15hFl2aQqTBGBClvDVjCEGpr2/Wz0MRwXGiLFc2Y=;
        b=njU59u4x08uXczWZmIQg3TWnELdM4uCgXXFyVaVdSAllnoY0qQ8D7o8H4CfXii+JKX
         rCYprsKbuO0VSZx5GUdYEhbDmapfGqwUUweZ6iRrMqZz87oTSxb7Mzrf+BlXTEhZ0XDq
         6D0qLZtmlBAQjUaeHx9zAWfO89w3SJrozcxhYJ9gM9LZJLlPLlXJ9xpp7ecoQLu14Vbm
         1yYrLRo/xUs7mmBA2se4MaHzWwXVmk3aDpkJrK0wdhy7KkofLcAdw2m3LU7UT/TtrM4u
         6jrF0SB5PAPEvdNK6Oqs3WVWEUP6Yqeddv6BYWIMHBbAwcYU/03lmVwK+DwPq5GSQ3tX
         0EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171438; x=1779776238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mUJ15hFl2aQqTBGBClvDVjCEGpr2/Wz0MRwXGiLFc2Y=;
        b=aDr9daBAmxi/j+X39FQYGrJ6D7Au2w1LlkntzC7qoyIkNm4KK/0gnL1wkDDeNp77WZ
         nA/kbXpJPv1zhW1nEK3TpqgbrKhNE6RPf6l0+lpFgxPx2ubE4W8WtyoOvyGZOhLIpe8G
         XXmNfAT5jWSnWjAUC3zujo9fn79qfsVNY9nBxXXViESQCTOzIaGyYiyjOY11XCATeK1x
         QOWfuw0bBLJfnY0ZBMMLONiAKyQF2dW34LNuNgj41aEr/syn+n4K3MlWlkTBO7NCKCQd
         ZuiiIqHuyDB2+tYxfiTk9NrPytMPCw6u1CEtS12RJt8nYLQOP3G9sh0DAkQT2o55McS6
         rz9g==
X-Forwarded-Encrypted: i=1; AFNElJ/JUsihc47gwaoatbGJCK2alUHASxoNin7K2Vigj5j3pYMRgUePynO15vtc/psWOqGahMmlJ/c+glSWdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrydhY538SAlpyuOJMsnN5Dtr90TrMAm9FhK1Ja61CemZZHpQ9
	u0+o/nwKWV6E3455Rr0/ai6Qw/BxA+wmd8+HZur2WXzhDCXZ63JMBrcx
X-Gm-Gg: Acq92OF5tcxAMBzDdtMTJJex4qlONeEm/gb2omBSSRrQVvaYz1TSGlUoF0E2wvZ34Xs
	UBIRfGGdxpOLWR+ZxjP7ZbqGIzl0eTm4n1ghUmfUtMCQrAzFq/dDLgBZvEH3NP3Tz78NVXmcJrG
	Uwjid4puaBDVXk7lYR1/Gi9msbqvHeQ5453CwOewJVEWnBy2dDvV8+27434RY3+VH6cMDGiDv8q
	/8G6au547TQvYE4pLdRgSkNx2QpFc2nX9O3unsNQwSsTmJptgG8W9juUZk0IOnNcwju+wCEZMxo
	k99NURUHFGjWa6Na9WDjKuo3tEHko8s6tqha1wlEFPoA8rOc4dnRmpYtpc9RhQcwGBbN+YrcGs8
	O1ZxuhdZv5h5VEAj9m4lQ/fn2f5YfOCHSNHAAiz3eZPwopuuDjQ9KThpIR2mCNymotHKxL0JjKv
	sS6gg4rJHCyAknQf6VHEMPiHEELv9aoQ==
X-Received: by 2002:a05:6a00:8c2:b0:835:a682:a6d7 with SMTP id d2e1a72fcca58-83f33bae2camr18840919b3a.4.1779171437826;
        Mon, 18 May 2026 23:17:17 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm16112266b3a.43.2026.05.18.23.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:17:17 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Tue, 19 May 2026 14:15:57 +0800
Subject: [PATCH 3/3] riscv: dts: spacemit: add QSPI support for K3 Pico-ITX
MIME-Version: 1.0
Message-Id: <20260519-k3-pico-itx-qspi-v1-v1-3-c32afeeaf741@gmail.com>
References: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
In-Reply-To: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Zhengyu He <hezhy472013@gmail.com>, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3723; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=bU61JmNF1c+b4KWRcgOhA/JRURr6NwQdOpuIqG8oVJ4=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDABauY3HTSzF9IaJjmTv1VlCI5XJKn47n09ne
 KmVVyHfeyaJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCagwAWgAKCRDN9pw2gLgN
 2LWxEACmEhpN3JONYcq7jJHX5BvuRUB0L5LCma+xBmD6vLDsejxKAsYsj4bSMJH7uS86Nu93PB6
 rvMXUOwBVqLAnumCrq+tNZFMJhMLQJaxVVf7bh8r6TJZvfbLmCzvl4MuZcBgVqAZqtqfdyBXLL0
 Re9uZbYv6ljHvmt52PZtbP9nj/ubdZ4CmauirDVhKchu9NZr+/ZEWiq5CdfRMhKriMBx6JYkQ5P
 A9tOrxhELRH+pHDWuSpCoMYayyZcFsuj1BbCziBG1/92yLzzjQNtKQFMTLehN3gEmZWBYKoBmBQ
 ja4bHaSYSs1YoLHgKy/G5KeCenUxE2PWEpVRfaWebd4c+tQQCOhx+M/xoRRob+KbS7sY5avYAEL
 Csv1PyAqYa6woB/tm9aaDBxGSR8a7a60q/C7KlYQPFVxF46s+SDr7u/6P76ZlW926hM1EC1WgLu
 4tibWXk8npcEO/rlfVF/QX9HcJn8grFS9ArAoL3C1XWGoIwTEWBsGbGRh64SHYK3pqIPrCG+tMz
 C64OjXm5meqKr3zVeQrAnqyaw4FFtzKdW1Fyi7OV0YXwEOyM+4AH7v4FO7Ij0FMqy7KlBy5+7+J
 YjiaP/FS40AjJTj86I8VSyEYguOroOdif5NVgdJMz6LnZ9Ic2liTq2jYy0AWZtR2jjrTzxuYpiR
 OV9Z1ET8NUMcOQQ==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_231718_731507_FCDADCC3 
X-CRM114-Status: GOOD (  11.36  )
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

Describe the K3 QSPI controller and the pin configuration needed by
boards.

Enable the bus on Pico-ITX because the board wires QSPI to NOR flash
powered from the board 1.8 V QSPI rail.

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 58 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 21 ++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 16 ++++++++
 3 files changed, 95 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 4486dc1fe114..61cbf924830b 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -192,6 +192,64 @@ phy0: phy@1 {
 	};
 };
 
+&pinctrl {
+	qspi-cfg {
+		qspi-pins {
+			power-source = <1800>;
+		};
+
+		qspi-cs0-pins {
+			power-source = <1800>;
+		};
+	};
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&aldo2>; /* PMIC_VCC1V8_QSPI */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x20000>;
+			};
+
+			fsbl@20000 {
+				reg = <0x20000 0x80000>;
+			};
+
+			env@a0000 {
+				reg = <0xa0000 0x10000>;
+			};
+
+			esos@b0000 {
+				reg = <0xb0000 0x100000>;
+			};
+
+			opensbi@1b0000 {
+				reg = <0x1b0000 0x60000>;
+			};
+
+			uboot@210000 {
+				reg = <0x210000 0x5f0000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 23899d3f308a..5d9763791180 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -56,6 +56,27 @@ i2c8-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	qspi_cfg: qspi-cfg {
+		qspi-pins {
+			pinmux = <K3_PADCONF(138, 0)>,	/* qspi dat0 */
+				 <K3_PADCONF(139, 0)>,	/* qspi dat1 */
+				 <K3_PADCONF(140, 0)>,	/* qspi dat2 */
+				 <K3_PADCONF(141, 0)>,	/* qspi dat3 */
+				 <K3_PADCONF(144, 0)>;	/* qspi clk */
+
+			bias-disable;
+			drive-strength = <25>;
+		};
+
+		qspi-cs0-pins {
+			pinmux = <K3_PADCONF(142, 0)>;	/* qspi cs0 */
+
+			bias-disable;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 815debd16409..800efc2929a4 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -836,6 +836,22 @@ pll: clock-controller@d4090000 {
 			#clock-cells = <1>;
 		};
 
+		qspi: spi@d420c000 {
+			compatible = "spacemit,k3-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xd420c000 0x0 0x1000>,
+			      <0x0 0xb8000000 0x0 0xc00000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			clocks = <&syscon_apmu CLK_APMU_QSPI_BUS>,
+				 <&syscon_apmu CLK_APMU_QSPI>;
+			clock-names = "qspi_en", "qspi";
+			resets = <&syscon_apmu RESET_APMU_QSPI>,
+				 <&syscon_apmu RESET_APMU_QSPI_BUS>;
+			interrupts = <117 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k3-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
