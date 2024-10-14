Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7968AD18138
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 17:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNurWOF5zqIhyh4xuW7mMxxceHqU9MEeBcRfTk7HWTI=; b=y70E7NoO5flEUg
	Z04c1WyYBKjynD37qjIH+RIKnqc1FQ9WNi8L/TXsUs7wNsw4inDB1TOxcePBexazMsqeAG8yP5yU8
	GklC9lbMRonrdv8aL5fJklpkdJa7aIBwx0ijQ6n0fw69IlOSnOB6Tz/AnvSFOpgsrq2bv0wd0i8TY
	JcmpXN+FJHj5GfsTwCEnXQ4IiapwhXIoHwQ6sfnXfABQ7W4AiQ5yihQPSTTwgwfojx9nFbWJ/88wl
	QAqdU35f9nsZJdp33HyRmEhLQHpQj31UsQ7bKFzpzeZq9tCIzOR1zvcYF9wZ6Ac6ptnIo7bVLkJFP
	Sul2nnvqe0/uAAy7wo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHI-000000066dz-3FG9;
	Mon, 14 Oct 2024 17:54:44 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHF-000000066cI-3eRT
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 17:54:43 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso2829738a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 10:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728928481; x=1729533281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7m8GT3iOgjI/IPeeAm/PS7DBYs1L+bHOJpi9gTXeTlU=;
        b=ROK9uqZmfqVOZ/lGpJ6vw6bpkKJxeqfp8YdM9bm37PBDb/wFfPP/zudy7RxJ1G3IgV
         Ulh5GTzcVcFOjMgy2rEpgb4NoqIzjVPkjbSQtWTldFNfWZHHS33Dxdgj2xUEHJLh3pQW
         MFJkhFpSbAud1G207oCsf/gePp/HTlxAtRwNEcAzIiSXbdpjz7JDC1sYCzpOHi0q22qk
         mGmyj5LeNW5AtbFjhpXpY2zqWQRvXPCF29emwK3og1A1iMUNRV0kvr9aHNZbosF9dHuT
         FG6Ygdlrf7iMUj+0wr0KquISK92ux03TCZKIYKQ8G0ZtlQH7oLflSH0t6cpqtATagC6a
         gZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728928481; x=1729533281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m8GT3iOgjI/IPeeAm/PS7DBYs1L+bHOJpi9gTXeTlU=;
        b=ULXxIcwe9LQHxBBRHthu0bHfGtosvLpUeJpczDEzC4hpNBGwduKN9qTBy5A+CaixgH
         Obe+Vpm1EMkPxupASN/FivS7S2CRzWx8jYxx8zd/tvpfTbGThu4FneHpaCgQJBTmrEp5
         TC20/UKRUIp2zGtuvtzG3foMzhjdXtKTDCVFFckSTe9cnJw0cNzofeIsDqTud1oYsI9X
         EYjHbHX9KeMvFr11NPbzEnLGZ4NeUaKhtYf8LAyxXy1jg8MYYbsMJYRk6x5lkkZUQAUm
         Uy6oVJYMuJmlE9mKxzSZy7memyOHIySHhEcIG5rBmICSzsBnVfHBTTT6eMVIzJRYY164
         s2dQ==
X-Gm-Message-State: AOJu0YymwLExMfiKwmw1MO70XFs6huvx12dcqRGlzzrLnKczDgt5DafN
	QBI/D6nTOgjWhrqCQUyT9dx1rfRamVpr0e+EaOYlxNIbR3jC5av/cmHsLxUQMmA=
X-Google-Smtp-Source: AGHT+IFubZZsgfE7zPBcM+amVvU61DR9WiXpW7a/nxs9sPE09jRp+jNHKlzxRB5yg+eKUqCa8ihbtA==
X-Received: by 2002:a05:6a21:3942:b0:1cf:1250:80a7 with SMTP id adf61e73a8af0-1d8bc85d2abmr19634037637.12.1728928480675;
        Mon, 14 Oct 2024 10:54:40 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e49a7e5e7sm5611109b3a.179.2024.10.14.10.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:54:39 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 14 Oct 2024 10:54:22 -0700
Subject: [PATCH 5/8] riscv: dts: thead: Add TH1520 pinctrl settings for
 UART0
MIME-Version: 1.0
Message-Id: <20241014-th1520-pinctrl-dts-v1-5-268592ca786e@tenstorrent.com>
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
X-CRM114-CacheID: sfid-20241014_105441_950124_CE8CB53D 
X-CRM114-Status: UNSURE (   9.27  )
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

Add pinctrl settings for UART0 used as the default debug console on
both the Lichee Pi 4A and BeagleV Ahead boards.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 26 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 26 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 1a4154a6ff3b..0484fb390be4 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -61,6 +61,30 @@ &emmc {
 	status = "okay";
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-pull-up;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &sdio0 {
 	bus-width = <4>;
 	max-frequency = <198000000>;
@@ -68,6 +92,8 @@ &sdio0 {
 };
 
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 58ad381fc1c3..f60b1879192d 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -30,7 +30,33 @@ chosen {
 	};
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
