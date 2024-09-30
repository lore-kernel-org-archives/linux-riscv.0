Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BB4CDD1D6
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 19:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+C61/gczo7lNYc0mSJ5zVqpulgEpL2koOWHsZG/8Pk=; b=0HwEidP0Zx2hZ2
	Iu3XFd5fZqsIf1JKhi7juusLOypii6zMttgeH7W6ub5jgvfSCJv9Dhy2HbcQYIFbZjBg2ZmnlfPdi
	4gOq0gDlld6QRgZZSujOvjkBZ/ZAfnbTo/BPVHVMxs3syL9na+El56wrXrdYc+b39K85lHv4mw9W6
	PgnK1R34QK2mwFn9HykpQvB/zDbBnsCDye21YYbx8r20yCtKTU8GoUfQi7joJ+Nv8J2HHuM3USl9K
	jbWnwiUGgIZb6pZ0sEUeO1KCQn1UNM2NQS1D3oGzzeJNL7a7hHxNNYML0/oyD2A+WgbB2Mnghaynm
	8PiajSGui7fpUrlA8e0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svMRV-00000000gDZ-2J8s;
	Mon, 30 Sep 2024 19:52:25 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svMQK-00000000g4K-1QBZ
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 19:52:23 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so4020234b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 12:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727725871; x=1728330671; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+zkS9utG+elVqaNRPa3m7+e8A7ib0BG9HxHBkPLUws=;
        b=OPg4I0No7a1QaB76XGNS6iA1ak96mBi4piieSZRFTEGFd9xmGMg+Jp9jgKSjwHh5hA
         OuqWGy1X/jH88/YMEkguv1bHaarEBz6MqtDNcpQkWg2XWDmz5ZnFgjyst51SPl9HvokZ
         0GS2wGDdv/Gpgw8I2QwXpA3VUdvRLY+7H3IMIVxWGQqWrN/0FxAR1lMadZRNEZbQquiH
         aZ/c305xOo4QJPIwMPaFPX134O4AcC1mpuXOSMjTcodLF9Tv2zEkiE5UrE8PkHU6X3R4
         JWWD9p9KEDeC84mZEq/NTh7LTXLtx61ke8zyXIpS7dhe8oLz2YzGNsCyjr3H6iJ9+zl2
         p3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727725871; x=1728330671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+zkS9utG+elVqaNRPa3m7+e8A7ib0BG9HxHBkPLUws=;
        b=hc0qloUCORQyMKGLRbnPGakBPB9gqiLaXVBx2+5IkWBXD7GjoofMSey2aPJ2UtTh4M
         CCoCcFpjDBqaoL5ngl7dQrSyAh3ZdfkZFxO/7LpgqO1OIazr89+grCtiDRyp688OjDX7
         li4ZDY+XarpExJjVWxCmXqOBtDhJyQJh6vcm/SIcAJHi4m/ogs3vlU+u4/5XtBTV3wUi
         8b9+YrYvqWOSgrJ2rSZgPLXwFDIjyWfhrP5HDieVZPe4NmgKcuUi7HksZ6VAb1ZTCXgC
         PoGZaHGXaUKHL2ooLYl05UWrEKkHxqMRKrWXWKU8XIR4oJzpaMDiudaMUt77rEOCtduE
         JTgw==
X-Gm-Message-State: AOJu0Yz9qVTjoYzwMM0kAr8y4FCSMiWI1FPRqhcf1WSXMYcOmahha5qs
	Yzx8EMMyUs1AdZuzJ32MeN4HakLY4Stxsu3YrL4CrAUb2qvf5ExykCO1fe8jNbU=
X-Google-Smtp-Source: AGHT+IF2PKvsM6PB9HusoaPkI2XmTv9Pzg0C6UKFCwW+Q9Ek7QSJq0D9CPuTemm5tass/l1zHCN4Rg==
X-Received: by 2002:a05:6a21:1706:b0:1d5:1250:44b4 with SMTP id adf61e73a8af0-1d52d19a5f7mr1108919637.24.1727725871417;
        Mon, 30 Sep 2024 12:51:11 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26529d4bsm6630213b3a.158.2024.09.30.12.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 12:51:11 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 30 Sep 2024 12:50:54 -0700
Subject: [PATCH v3 4/8] riscv: dts: thead: Add TH1520 GPIO ranges
MIME-Version: 1.0
Message-Id: <20240930-th1520-pinctrl-v3-4-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_125112_418116_94E568C7 
X-CRM114-Status: GOOD (  10.17  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add gpio-ranges properties to the TH1520 device tree, so user space can
change basic pinconf settings for GPIOs and are not allowed to use pads
already used by other functions.

Adjust number of GPIOs available for the different controllers.

Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index e4eda2a76595..7dcc250ee1d1 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -334,6 +334,7 @@ portc: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl0_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -352,7 +353,8 @@ portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl0_apsys 0 32 23>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -379,6 +381,7 @@ porta: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl1_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -397,7 +400,8 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <31>;
+				gpio-ranges = <&padctrl1_apsys 0 32 31>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -550,7 +554,8 @@ porte: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <16>;
+				gpio-ranges = <&padctrl_aosys 0 9 16>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -575,7 +580,8 @@ portf: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl_aosys 0 25 22>, <&padctrl_aosys 22 7 1>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
