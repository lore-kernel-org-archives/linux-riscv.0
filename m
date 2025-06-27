Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3F9C7EE3A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y56WcoUPPG1tcyFwmS2u+2bM7n1/SiEuqod/bBfDWVs=; b=2olvtpbDvYInAk
	rih5AnEK4Ou1U2ksr+hAURUCyuAyteozLokZwvvdv1LSYf0qutwbae2vZ16fLdMfsTDYDPgORMbbA
	bC7VG4PBgYWamzw+C2wUz+A55PpV41JcT4tpHMd6GBYTb40N2Q5yMjTVKdP0QZV79ZQNhivahfNv2
	DtTIBUxwAJ9pVBv1oZ7joPi7Xp0uYrb2k5EstRCU0V1K5eLkj+sZjbOq//F9dr36cCRNJHCiwZLct
	zCpRWbPHzCD9oDDBsLFEiMBjIfz5B6i0uNll4OCi9nXghcax2SgMukUufWPAei86wjSnaIgHR+ZPm
	ls2IM9pJ1v3rqY6ilZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAWJ-0000000Eyg0-0qOE;
	Fri, 27 Jun 2025 14:57:39 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9z8-0000000Etxm-1QYH
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 14:23:23 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7d20f79a00dso286274585a.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034201; x=1751639001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=oyW+HnCnK+wyRoSd7EMgkLIe/ABuBaYgV35wBsWOMKdER0fmVwan1mpOLStRQdw38t
         eis1bSsuyY76K0iYVa4F0xcmjxwssyuqTuDDpdhKN2mzqhNEHRx8Ic0qdVS3OcNWBrMv
         CMlbQCwngd0sfMdfDdk1Mucyzsqrmw71pvan3jMIvEAwFH28jXo00SLYbwRdj6p6eDoU
         VJVBecIf6BnV4bof328e9ULyFfQcT/dLT3R0qlZp88JM1/80VtsuC2ci8CYL7dADS1ge
         N/V9QKirWwZYwc4TGWkvDkU1ajV5c+kGvjQKA04RcCEe18Eyfa7+20CIATbm4I2iPO9x
         3zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034201; x=1751639001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=LXkWiL2E3m4Qm9ByhLiYrj1oAduFZdHuqwQbwCQyoy9VScCigIDi97v5wVUWgIbIIU
         XvKZLo5h3uiTpGONuq6Cw3iPalX0UiFaFVx5PGgXs8ZDPXBDZR2vdiQm4CobA5DIL8Pd
         DVgpQ9Qgq53IEQF65IBxSl9PkQypBhOOgmwcpWPtxlghhuR2JPCpxqwJEkFvidxAC6MN
         CAo3YR5P+AbYygI9Cgzw4G+gF53LJShYg6mnsSKRha+NqbZXeE7eyAcu5G8AphW8INRn
         DDza0kJLMuq1218eoFF2o7bT/UqapeAVGTigPTwwlmefGaZ54bpzhGUXPoj/sEUhFTja
         iinw==
X-Forwarded-Encrypted: i=1; AJvYcCWeUkxdjeXN1LkQf1LAOYhysDnYzwUtrRnxQ+AHy7x6B7aoKlrLGYD3Mf+eSV4n5cSSG4LOptNOJTeMLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp3isZ+MdlaYEQZ0H5VmPw9JwU8LLlJUT6Z46McKe7blpZJ576
	YB9dfmEwnQdO9QdsXEscN91+6Qynxxd+E4t38ZH9Rqi5lEOUOlZD3Y9HEKuZKi2DqqU=
X-Gm-Gg: ASbGnctM6G9qh0Bv1McFuJwtUYE71ev4Qllpv/7O+H0SGVu5GKeTDC1CqUl0tO0KhYE
	rC0iv5xgUXwAwOVCIFPmQVzWYN6SAcSDiK/RkYjpz3QCnCD+Iuunnva/18lX8jcoQ6QNbLOaMVL
	PIsXKlF1JdQnu3iDq/EcAHyyU9BbKqbnqLIdIrCVIuQ5s0Zen0XYAYHyZ8bPB/7XfyToEj0k9oM
	cd9/OqMGSnCSo2/T90purEgY7mviunM535CNO9e+BCtwDjSdMb33aBmcxVRLEdC2nJF4bo2W1QF
	ogtBr1d+4MjsiWsxWfZXn4mZCNrVME/xh0L7O46rq4HZXrRARXZg8c7ZO4ZTyOGL84aIOpy96jk
	+jGLAE1540vCDO4d2bEOnwaHrvW1BFM82dOQ=
X-Google-Smtp-Source: AGHT+IGbR8LfUszD/aEIdWwkUQ61eynSIqFyVoyDA8206vPOUxXJejP9vRZ618fRX8/VdY8/tjO/YQ==
X-Received: by 2002:a05:620a:198b:b0:7d3:9113:7902 with SMTP id af79cd13be357-7d44397f5e8mr481566285a.38.1751034201091;
        Fri, 27 Jun 2025 07:23:21 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:20 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Fri, 27 Jun 2025 09:23:05 -0500
Message-ID: <20250627142309.1444135-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_072322_372602_3CB80DF2 
X-CRM114-Status: UNSURE (   9.61  )
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

Define properties for the I2C adapter that provides access to the
SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..7c9f91c88e01a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,21 @@ &emmc {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		status = "okay";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86f..9d6d4503fe751 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,6 +11,13 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	i2c8_cfg: i2c8-cfg {
+		i2c8-0-pins {
+			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
+				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
 			pinmux = <K1_PADCONF(68, 2)>,
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 14097f1f6f447..a85239e8e430b 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -483,6 +483,17 @@ gpio: gpio@d4019000 {
 				      <&pinctrl 3 0 96 32>;
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			interrupts = <19>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
