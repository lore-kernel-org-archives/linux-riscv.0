Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67818D1813A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+xgxqmumHSJTuqdQBl4JissFJ00CZCrVAysN7nQC4w=; b=ECklecaPSOIKxe
	urSl1liadZtZMarsaj5z9doMHX5BXN5h62I9oYoF/x1yhZiUQyEwvPZOw3fiYGbRYtlBGAm++oN9g
	otaC5WV9XESImkLkRrPZtMsXDViKcByqPDIYs/GPwbQMBLaH4wb9Pc0Qp2DPSTokUX3NIpNZeNIjm
	OZzb+f9p4mIBgiUAuNxrZwJMw2DOAAyorAraMb/F91LGXd9HzbysMmRIAWtzCpkgWe3TPJzihayDT
	L4wuuKYLlBHQKBaQKoZKW1NhfO3sfT5rpmDXyyk58UIz5mIPWWmdboDdAzAsHI9xK0B37odRAvszv
	ozWDLIiDI+qiliIbMZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHC-000000066aq-3vSR;
	Mon, 14 Oct 2024 17:54:38 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PH5-000000066ZC-3sGE
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 17:54:33 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so3417517a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728928471; x=1729533271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+7+aI2goYVETl1ESrIWHcJXGhurCjTtQoKSWjYidEU=;
        b=O43jn+uYskiqDWHO5WigErzevRf7qQ4Cd6PV5DXQVJvYPajrdUGwx3DqcvZjGST5Cl
         x3GuBKqjXc2RmK/xMPSgZMxP6opFs5sSwI+kNocMEfPJ2NOm6P/IfCUFf1/T0a3YzOEq
         0cb1NP6sjs0vdfKc7qe8x6aMwrlhDXYAAeOqxZFJxsj9zRuexLZF4th7kBKLWWPj36Wb
         PviMwx6sYveMdzhfZ93+N1vilv1k5zb4qzKypYFzGeMSBMDSe93lvh/8TuO26CjpUfTl
         tUTVCHe8fvAkgT6bHmRlHREsNHGT43Z5gsjxVNAenSokwtv0dSWSF3B/kUhV3UTb5h4Q
         8glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728928471; x=1729533271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+7+aI2goYVETl1ESrIWHcJXGhurCjTtQoKSWjYidEU=;
        b=hXieTzjA5xdCRtjCCserLaQ61lWoO/wx1fsRCEpGaarDcHGfHDjXj7DsyzKuUG7bwt
         4fCjvpFmsleB7EVG8ZkYzYzLJyVRVOpiyOXnOugUhT/JcM2g83X/sA6yfhMpdZSzqJzm
         Mb3rV2hRUqrgUpNj+A3pdwSfSOz0Mf8d1InbDdwyr1oEUIlI1NQmB2YL787xugS/4e0c
         026oGNy/VjOW0f6FrGvSFFp4vNVdBxtv1UNdtE6QDgqAV3iFJCkCS9qz9DsOSB6APsJ6
         i4mqqAPAennRsIDzVuUwnlPiG1tFCblNeLA9DdpPMX4HDSLm4bN6Dw+PM5TdKpP9un91
         IcKA==
X-Gm-Message-State: AOJu0YzTU4Nlv4Fdxe6PO7uYdebaIfegpqJxG6IONK0Uy5bZRsl6tIRw
	rrb6jscB0XeSwNX1DS2N+txd99umxA3eZo/xSwdVWvm+VtfZ0glQo7RZoNK53lg=
X-Google-Smtp-Source: AGHT+IEDEyLAWAXRtlVu5TZl1MBkJtvx2nNHhq3aaLbB9MKtoZHJDovyGpjRpi0gWo50xwyIzVYcQA==
X-Received: by 2002:a05:6a21:a34c:b0:1d2:ea37:95f5 with SMTP id adf61e73a8af0-1d8bcf13272mr17676827637.11.1728928470948;
        Mon, 14 Oct 2024 10:54:30 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e49a7e5e7sm5611109b3a.179.2024.10.14.10.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:54:30 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 14 Oct 2024 10:54:19 -0700
Subject: [PATCH 2/8] riscv: dts: thead: Add TH1520 GPIO ranges
MIME-Version: 1.0
Message-Id: <20241014-th1520-pinctrl-dts-v1-2-268592ca786e@tenstorrent.com>
References: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
In-Reply-To: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_105432_002783_22779972 
X-CRM114-Status: UNSURE (   9.77  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add gpio-ranges properties to the TH1520 device tree, so user space can
change basic pinconf settings for GPIOs and are not allowed to use pads
already used by other functions.

Adjust number of GPIOs available for the different controllers.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 93c17f52fbe9..9c6cbb4fc3d7 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -335,6 +335,7 @@ portc: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl0_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -353,7 +354,8 @@ portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl0_apsys 0 32 23>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -380,6 +382,7 @@ porta: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl1_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -398,7 +401,8 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <31>;
+				gpio-ranges = <&padctrl1_apsys 0 32 31>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -551,7 +555,8 @@ porte: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <16>;
+				gpio-ranges = <&padctrl_aosys 0 9 16>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -576,7 +581,8 @@ portf: gpio-controller@0 {
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
