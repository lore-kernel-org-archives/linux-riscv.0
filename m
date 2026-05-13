Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7232DCD4F24
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUvQQSyO5RQquRAl1MnGRlynH1EWjg/AID97wg5T+3g=; b=NCwIarWYjSzP6G
	P1e2PdQ0B5JN5GGACxcNbCP3lB/lkwE3mlKFwDxv/5bhh+HpFQUUrlctxzCj0XN85l7dyVJcWJ79+
	gxPkTi5AVRJYh3aa8mol4FBeMUbpwFyhB5wX70ICTi7Il66+gdRjLMY5yjLMANsKbNlV4F3o5YeTy
	sd5/Ouy5wrWGvvtWNWeW0FuRgAz6FQ0U7vU+UscDl2MTmwOL+CcMPTgcxog1XyB4sWmuKfsrKlnfw
	RLF4TdqxcCH1HSGsVexiCTfpHu+kN+IL5yIPu6RXWP/VwUOXP/BFB5MvvgOKPFhuifRd1uyunfzMG
	pzF2SPirlkqklMlMoaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t3-00000001Xmc-40LV;
	Wed, 13 May 2026 07:20:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t1-00000001Xkw-2Q1n
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:20:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48909558b3aso64076125e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656805; x=1779261605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTREOXSgwxN5P0eOv/Eor7AYmmvvClB/UMV1LwJRNDE=;
        b=S2TVepkkki0+j/epzKF87qLOb4U28fZ9Fzm3uGWVk19qWrdz/UHUCqPAcspPaFTTYs
         l+WloTQF16nf62fichhkySQGliAoqeve8/T8VXOqC90or3bPp923+XsQF73mZo24xBw8
         1QZCvKrzhxMWRirGe5M7yO9YZ2Mjt7/FrLLtLS0Ha05EPCGs1AuVDEDkqfeeLvdKzRm+
         Z8c+OUaacVNngx5dMJ82sCRvHXYWqPhh9lbP/t0SrnhEHBg+a2u0YkyR4x60z+qpiX87
         Z59Ybiop7G5SA94l3VpLgQrLzqHCMpfIiSCMYG7UhK72E4dpbZOtTYhLA/CgqpuCt3Eu
         XIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656805; x=1779261605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MTREOXSgwxN5P0eOv/Eor7AYmmvvClB/UMV1LwJRNDE=;
        b=miOx1cNFm0KFHfIpvy5SaPeZP3bv6TWaJ/iq9HergWdpp3gmOeZjdVgmLjlBBtJ65I
         KYAXfGpqj47E8JMuh4GZWT12fvgCiUM22oJlChqmrxUbLg89ETcZDBMFtbiKdcvOt+6I
         Br8h9D0/wNpvc5UPFgZtGrOeYYvQzV9Q6FVjLOfEj6u328ZUsgHNca6CtLSzTPTyS0/b
         0qCbAKL+1tS4DSjSv0qHImVXrYJbysO61HcLdZzF+Hy98uNYjamSPliIG5Nmu2IuN7bI
         lu8L11UKCGDuOFZsR8EC8GFi4EQRJeoWOeR5dYAhPaoGPJEGzdPkVOoXkMOJsNPMCPME
         pKgA==
X-Forwarded-Encrypted: i=1; AFNElJ+UxLFNQXKz47cow8JrOd475plzel7FTPfTPUNxPq82sjuZ5GVewW+TBk+0dX0o6nL/z8nff4PKg7OpNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsiChKx6rkMwhXu8yCXa2Y+7VN5ILqpvsnTnOr7cPLRJpUWdCw
	itmed69y+1mKe0nIpIrtBuH9rBxovggpLr2vvQpKvyTuDgXdoMEj2D3g
X-Gm-Gg: Acq92OHgkqgJFtd2iTrqQK3T8e5MEC8rregCgpfH/Wf1qJZE95a3jkxQ7vIA3s4e89U
	WztuHTamVjMJ9mhHdNWXbfz6BBDNrAig4u8PRPaXj+qxQ5hQSpPHIXbERJD7Gk3uV2S8vRdyCfk
	R2ji3aOJ6Rt9tPR803p4sDE2vaj1r+HjnLBJv6mUxcqaFoFwFWVoJwp826FPAhdFyWXFiOX+Xj1
	OE9zgjSfNHL/a2hGAP+PXc2YBSIYTsJ3S5nd8i/bhIsPc7DCEgQtxuV5w8NSkw8yST8a49YDMcd
	1+P1f/dwMeVyazPEB1avnrpTApjf7huEc95qRcENVlTUoKOYLyeWOWyfzSqY2wgVADPIgkbzwvf
	6Q/m/NXjtokRo6L9nAIPMDDOTVpWd+pbMn3oPBWtn4M8GvIag337SNIkJplDtkMbwekFVpHn1sJ
	FeQ2nwlCxdvQgDHvSEnTdqmwLbBiFvC3D/pueV14tg3kuWOGL5f0RGZG0uWhQuKxsu1Q==
X-Received: by 2002:a05:600c:4583:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-48fce9b30eemr18812985e9.5.1778656805095;
        Wed, 13 May 2026 00:20:05 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:04 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
Date: Wed, 13 May 2026 09:19:51 +0200
Message-ID: <20260513071958.29574-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_002007_672644_685F4B3D 
X-CRM114-Status: UNSURE (   8.39  )
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

Add the QSPI controller node and describe the attached SPI NOR flash
(Winbond W25Q64FWSSAQ).

Add a corresponding vendor flash partition layout.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 41d7d6d20a797..b0f66f49db4b7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -44,6 +44,15 @@ reg_vcc_4v0: regulator-vcc-4v0 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	reg_qspi_vcc1v833: regulator-qspi-vcc1v833 {
+		compatible = "regulator-fixed";
+		regulator-name = "QSPI_VCC1833";
+		regulator-min-microvolt = <1833000>;
+		regulator-max-microvolt = <1833000>;
+		regulator-always-on;
+		vin-supply = <&buck4_3v3>;
+	};
 };
 
 &emmc {
@@ -239,6 +248,47 @@ dldo7 {
 	};
 };
 
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
+		vcc-supply = <&reg_qspi_vcc1v833>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a0000 {
+				reg = <0xa0000 0x760000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
