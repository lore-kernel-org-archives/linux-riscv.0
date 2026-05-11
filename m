Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654FACD4841
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOvPj3Fpa5aoLoiaoB6dRFe9LbpzDwZk8HoQ5HgN37Y=; b=jxwnOW0/6mm+pb
	xyT8aw+xDBVjAYfkRbR/RvJcwXVJDnNFsAJAC3azm59TPaPphi6qXB8yKQxxio89YMqLLuyvK3vyu
	Y26d342z2D8sPxVlQ9TX8uZ/wG31iaWzz9ciqKzL0/KYWYXXEtm+GG8m+iWHGUcDlYp0NlJRSUBab
	gsWPMsic8amZ3zm0ijWZumsUwlx0zDM/Xu7lWztaDtUjTbAlg+YKCn/V8lgiQSCX0MhkhzwU7UE1B
	jElDmJNTcOrggcFhKlOATGY8zTbDkopQb9BBVwbdl63nxjT3Z1qT/rqoN3Bk10KstAqT5Mr3GsAnZ
	ncCuKsGJbPaBHnoA4KUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPU-0000000CoBr-0jeB;
	Mon, 11 May 2026 08:54:44 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPQ-0000000Co6a-3lvk
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 08:54:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2934942f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 01:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489679; x=1779094479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEIrqqD5+9V93nbJhziz0GoVKNocn+oS9pnFRNj6sLI=;
        b=hzPXb2mldFBMKda8wpl8QQEzsDYtRUf168gtWqDvALiYclk96feQzFkzGS8DOcpP2c
         xfJA165aDJEWh3XzmB6WTIkwYsjPOAjtj8b09olrCDIJGZF8LhhcXewLBsSvTFuz3I0p
         37/nJXC8H3mdeZTGTskfyfc7Q+CX9NNxIX4XFj1u6/fDqsJwKYkpaCgxfcrh0HLDENlb
         EKJhnZmysrAAD+J2sSkMI8tg3lXxOYRnSXk0XH+Ezs3N7wKdOGghqb0So/x9uI7dxvtx
         NCuS7RJ6f34ZUl+NWjPcZ19ZlwS+5DSvt/4RlVuFtrRnPQLPlemmd0zcVuidDack0vIQ
         HJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489679; x=1779094479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TEIrqqD5+9V93nbJhziz0GoVKNocn+oS9pnFRNj6sLI=;
        b=FCoxx+4gTJZy17BL16UY/xU03Y4YkqiYUz8K3R9das04zdzc/ZUvjAH7IwBBpPSrxZ
         i94BceKba4VqUHqRDuWrD4TdMnKV43leaXS/y9OK4hDUFWUicfMMgJoJkNCGkyWifhSL
         YEWz9PNDfST8P9JHSjZblel1rVo46VW5c1kJbCRONKYd+J6lbVrrDGxqlJr60Gp101b7
         i/UX4+WIYalkNYZtySQmqcARYzkl1fCjbYUh4cHe1QCjvU+t/0UmlfiZnaJW4Q8N44WJ
         t5WnCiIKmr16R8rzUuYQWCkos5QDZdBHgKpoGkcZuxOr5UZy4WdMjnrByXirE7nMa5FN
         MVxw==
X-Forwarded-Encrypted: i=1; AFNElJ8QZTM/3d/rEqAHskDntAass32F5Tr1G8c0xybAh9dxyZqyZslUroLpImsHTRWUU3sak3jhqBxLFFpLzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBaNIZXDMMA/1Yvxiyg/0+V/t8IonhKoM06ij+Pu+UhHbEaQoO
	Tq/senQkSQabHMfHZ5Mye+TCbx7h+HVsLvr2rjM/xcxvHjYB2dqVppYP
X-Gm-Gg: Acq92OHfqI6SeU++QCzOATb9lknetQe/qhV8QUKHfIfaF+/eoOaCajb+AmaJlfkSizc
	fkDV9fCbUrh6XdpWOxMQDGFRp9PmpDJeUqueipQOblOj+n7RrVWuFkua9aY9nyZJfzAmiSyZPAL
	gsRFJ9bEYNa3DTV918bI8wVLpXsqK/x+StXoZvk5KRhyb86YLj2C2ztgJX0HtJ3TC5XcBJgS94/
	0hhhyJswHcwIoMz7vBjNDAKGFnayffO5mZ2+WE3w0uSb0wZlNSNFoQvrGMmRcxgAuNNSC6TkVL4
	I4d/g4eM0XdN5i66kZO1yV04YvTDaxU01WIvzBIjMTCsnj6nBHwofVkucPVqZN+FbxTETLEtjLj
	p4l+MNNLhw7eVtDDCiF+T3l6mwjAlsRTaF08u4cOz0lKYXaPzAUlcHLY0r1U3Su0iZwDGZMTHXM
	CzwostCVrHtjMrV6n7by1rydJyXze2V5H7aFdotzpB0DKyFrwfkQt5/+kH1j164HlTX6T8SO+65
	kAmW/PNJTFRX3o=
X-Received: by 2002:a05:6000:4014:b0:44f:db87:8919 with SMTP id ffacd0b85a97d-4515b056a63mr33531534f8f.4.1778489679107;
        Mon, 11 May 2026 01:54:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:38 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:54:02 +0200
Subject: [PATCH v9 7/8] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260511-orangepi-sd-card-uhs-v9-7-ae48c0b2b2cf@gmail.com>
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
X-CRM114-CacheID: sfid-20260511_015441_008664_8AB86858 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: devicetree@vger.kernel.org, Margherita Milani <margherita.milani@amarulasolutions.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index e20daa50a152..8fea6e87acec 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -221,7 +221,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -242,7 +242,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -374,3 +374,21 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
