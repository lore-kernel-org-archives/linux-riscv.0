Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80EDC021A6
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YK4uqwi85lRSoJpzUsvQNjpSYynLY4mEbnT8CQFAczE=; b=fpf9PCk9dT8qEr
	E0LZKtTaKogyof8Y6RN8+UY4lZnEeWBBgGjNMbuXqtOENV2tvsHnT/gyG9FyHSSKqEPuFiMQkCnOc
	QtFpE8QGOgRQCBSXRA0908G3BAPTrxUO7uhK/eq6Y85/AXBEJVt+6+jByUqx9AWJbPHPMnDqDKJpk
	2oR50M5j8R7kRyqCgu/cklwou6CEnrS1H/0FrkPL5M2gd90L7qJk1fP/RRE+kno7P8FAeXhRhbDtE
	JpWyJegTEQKSHzW+e3BO1Q1OwjCIPFOblSB4nHxhmp6MygiGw7Yx0ez3xBWDLLJMrzU3TuFtvTESm
	vDYYA1NdVWwCxEYUWDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVbU-0000000D6US-1CPA;
	Mon, 24 Feb 2025 10:22:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVSY-0000000D4Zw-43jl
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 10:13:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-220c92c857aso70403895ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 02:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740391990; x=1740996790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHH1Bo2ngh238ZBojTHJqWRsImuzKw7MT/RetGGhdDs=;
        b=KJqV4S2JGfJsEniturIA9APHST3uMcgDne78VfY6rohKANkOWsArvUreW4LyHm3G9K
         +BI60gO+Ht4pRlWzubRrIbmjdjR8q2mAQx7h+NulQo03+ZpJtaYSGN9gS4rs2RPMoA0g
         5k/QnT8XDIZlJ8ER7Ped4t45dw0fGvbFpokvPfHZvArA0xtZEZwHf6lzOe5wywPMhX8w
         bQ7Qh6RQIvV9o59roGCc8zpjK23poL7Ytk6nMY9RlNBNzi+vWsy6m0k1RP5+cIlj5MDM
         uUKwRimcgNTHk3HSaaEpI6n4lqNgkwKnNvg1gQG3Shldt0oXrp1elWGGWxyYlnkp+NsE
         PjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391990; x=1740996790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHH1Bo2ngh238ZBojTHJqWRsImuzKw7MT/RetGGhdDs=;
        b=XoibucjgxM6q9m7XxRwQMADmjAALHXb8bVVjMsx77P8Y6AA9DGtMre8pfvzrz7Ft5u
         R2OAkqvMBpktCwZLd4nS9plGmZ7npGbgW8vamL1UltLsJBzT1M7YDJpExJTYCNGInv3s
         8StMmHvMnc6taNl5n+ypvwO2os/ub2c+rPN3H85Zv/ueZwJxA+bvnmFzAdcqQ+VZf2MO
         G2PA0MB1o/Pog0aNZO0PSd34jiR5z6sRGa+JSA6b7Xs3x8IPhvFfZpipuvrJS45VBV5j
         W55V3QKFlu0GmGE2Iwh1QaZ5XZjevbTnSXxKFFWsooOoDKYJn+c+SR6WOXCq9VfmmxUZ
         4Ztg==
X-Forwarded-Encrypted: i=1; AJvYcCWRQs+OwLClk3wD20nOCL57UyVNxRUn3QZuTjga9iQBVZlAtxgWchGPJlmJKTjksgTj5Gkkc+z/a9La8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9nc/lMRlZbgXL/NRsX661wX8lzzBnuhouumQaDm6sypvl0coO
	7bjDNU3WesrMS/xRfxLfPXrPqOhvl+HaK33WBECg0rdhKL08Twu/
X-Gm-Gg: ASbGncvYd1Fcu7RZFLvqza/TkGgBylR9bvt0JAD2koQ5maOLzSnsI9BxwgxmIMK1gsm
	qgextNZh7scjZFUJJv6yAMjUuo0bQ5Y+bnZnTUVipGkoJ2hwEiW0GcmqmP4N//A8nYsffJE5h3W
	FLwCNT08Spew5Svp8Agpi/kZduhGqHFG0xbqMCimy2iGiIrfxshOX+9aAJBSQcwLbGKzf4/ve7I
	lYTU3yTbZIEbEtxPkEFnQn2dmO6hmRxdTJLbpQjT80usfQ5eQPfTzf7pZcrZ00G5ChfVY2OpgG+
	SwOzAFbgg7drnrf4DDdF
X-Google-Smtp-Source: AGHT+IGtCyZFRUi+gbIX4aSNZJGXzCxJh7yxdOzB199I7UFF6fkdtprcsgYmp8oGaKiLKViiu8/0JA==
X-Received: by 2002:a17:902:f547:b0:215:6c5f:d142 with SMTP id d9443c01a7336-2219fff87c0mr224305655ad.20.1740391990140;
        Mon, 24 Feb 2025 02:13:10 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d7a464f1sm173274365ad.206.2025.02.24.02.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:13:09 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] riscv: dts: sophgo: add Sophgo SPI NOR controller driver
Date: Mon, 24 Feb 2025 18:12:02 +0800
Message-ID: <20250224101213.26003-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224101213.26003-1-looong.bin@gmail.com>
References: <20250224101213.26003-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_021311_006431_5FDFC191 
X-CRM114-Status: UNSURE (   8.80  )
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

Add SPI NOR device node for Sophgo.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../boot/dts/sophgo/sg2044-sophgo-sd3-10.dts  | 18 ++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 24 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
index c50e61a50013..9c634920f37e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
@@ -80,6 +80,24 @@ &sd {
 	status = "okay";
 };

+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
 &uart1 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 6eaf92dd0a90..e45f7218de04 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -33,6 +33,30 @@ soc {
 		dma-noncoherent;
 		ranges;

+		spifmc0: spi@7001000000 {
+			compatible = "sophgo,sg2044-spifmc-nor";
+			reg = <0x70 0x01000000 0x0 0x4000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_AHB_SPIFMC>;
+			interrupt-parent = <&intc>;
+			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPIFMC0>;
+			status = "disabled";
+		};
+
+		spifmc1: spi@7005000000 {
+			compatible = "sophgo,sg2044-spifmc-nor";
+			reg = <0x70 0x05000000 0x0 0x4000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_AHB_SPIFMC>;
+			interrupt-parent = <&intc>;
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPIFMC1>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@7020000000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0x70 0x20000000 0x0 0x10000>;
--
2.48.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
