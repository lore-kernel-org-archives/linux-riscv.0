Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83887CD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTTjQBALXV1B/6mWbcv3yLM5wpg9hyLFsg3fPafq4+0=; b=uyTSNEo2URmHw7
	7GgJ41i6hSIpdzz3xMTSm+rJHFeVXD0pmZvWcdu44SM1M5QDYx9CilKflTXHsvBK9vkV7dOoldR1w
	sS4g/Q/s1GVJr8ETlsA70ShmB7AHamEGlJq3568g+ZFVVkggucmxlhGBGwMP2UagZudAPaFadFhh/
	HTiWrH0of+KD+A5TOvHDGe7rxrtqmf+gOeWkumgCAZTVP0Iciz/KJ4r/qnwn+Hs0fsvFjFqO6wTRJ
	KwPZQ7veypHxqhChkCOvxkYd96c1TrapK//5JOf4ooDuCBUv7usVk7ujE7eZaN+xA14Xql3R+F05Q
	Q5KFsoWc/iNq+s98mPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII9-0000000GmKp-2D4y;
	Tue, 05 May 2026 16:06:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII6-0000000GmIN-2Y5u
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:06:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488b0046078so47347725e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997193; x=1778601993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Elff6sJSJLFcwOZe6Ulwo5Af/tGUXh4RTvYGAUpcEAQ=;
        b=IxctAwGcDmBSX4LGdRkAtimG+J5yjeu9C0oL7u7JOdYbtHdCqo4SGyqn2aVQUMq0uO
         62OmHEKPv50iMv3XpCkyS0prbEeA24NAoCS7+0SxvXhASaBdMuNS+IAjH00Rs2zf1Azr
         N0DosL41BMKZ/g8MUTOleKY6dwytkuLWqyC/2nmWhzz9PninFl5NPRILkjkEWUCu6qmO
         5vKNXx3hx4Yg0WPsMuoLYgR/Z61H/Jqo4DbJQH3O2FnL28H/JUEP/vMIRO0RXdi9zsyt
         p5D/omwnCkcsZOUTqVvGWNfd1uKmh2ZUDqfWZP5DNU2wz7RXu7iM73K4xTDKN1brtA0W
         PLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997193; x=1778601993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Elff6sJSJLFcwOZe6Ulwo5Af/tGUXh4RTvYGAUpcEAQ=;
        b=oeaMe+cB3JJqTZ0yPBhVdxQOe1QSbKDH8mSbqidt0asZMRl4UpUca2e8ALMti9LBL7
         R7qLIEINty7xjsyrq54UwVQl4UZrfDjz1VEgx9syWeiGWsqznOQY/+CFSkN2nFyVdozb
         u3mpafEkPxVcrhVjcVoYSpd1J1o1S5t1Q9GXW9CMjSUPtMlx8yO5WwD/w0w1cfmWEodr
         C+gkGryYJXMHF/54kq38eQcqtEviotizpHyJZ0lZ+5Nm/csUG1aJnk57pm0We33MKQfc
         xx7LzCxSS1lUWGnmZkJbRQA240/HmIK6WT1XHjYr50pjRs+dtnLuNq52XUB/AeouIZFF
         Nilw==
X-Forwarded-Encrypted: i=1; AFNElJ+gGESZxRxDcUYn5V2swoCVXOaHVm4sLW8OyPvPZA5V4sl0JSyW5+z9dhAF7qldIVydFxcXGsl0s9kwYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzcmiifcMelQj/W511H4di+448WP4VVhEOuRRF8jj2zF0ytQgR
	cKuYd08XXW66xQdbDm+QQeAsF2a4xP0OZAI7QGuZrBra3EJa23gUTiYV
X-Gm-Gg: AeBDieungFX7O9Oc00xnyh4LZvgcMrMEzddYYzlbo/Efct2hfRYi9wIas59KWi6Zcx7
	qL55c6YWljtseJTK8TJ41pHDzwhk9OEUbewOKJeRzhQ/l0d4njH9F4qso0HBOEaYqw/oJnERnfU
	H6Xqddi2psWy+qTs1Uvp25wnsO4ivWu8wNk1tkiDkoqIEILi3y69S8N98eVfhlwfc9M3Ku0JSqU
	z06K6BSpMKAphXj1LhF6MzNhfW17lsNy01+5RKZXfBpz4+0ARJLNNQBWxr+/MECtXc/i/GxoOLS
	M6rUwrz4DF/zxSUbj/QlNzviRLnhC8La1IyQtntBjc0qNN5vY0KePXoWQPfJ11VCMpPX/2IOdhc
	vmataxUlXcVziCA4V6pTL5r/sL7o4BThxidMf8X+GPc9gGhW+KrB4AL4+R3poxkG+ayir2SesWw
	qvSqV06QlQ4vBUeV0ulHd20D6LnNS1rVgVVubRjY5iZgqWb3B73YDjK/q62pULPL44vXtJfW82f
	lGe3/iJB9pUm9fp3A==
X-Received: by 2002:a05:600c:83c3:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48a986713e7mr250556915e9.26.1777997192411;
        Tue, 05 May 2026 09:06:32 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:32 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
Date: Tue,  5 May 2026 18:06:19 +0200
Message-ID: <20260505160623.1369347-6-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090634_940115_B7192E34 
X-CRM114-Status: UNSURE (   8.25  )
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

Enable the two PCIe controller along with and their associated PHYs. They
are routed to the M.2 M-key connector and to the PCIe slot.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 869172d23e259..3ba6244952b63 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -36,6 +36,24 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
+	mpcie_vcc_3v3: regulator-mpcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "MPCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
 	reg_usb_vbus: regulator-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USBVBUS";
@@ -275,6 +293,38 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
