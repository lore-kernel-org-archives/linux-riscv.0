Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337C9C369B7
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRgWt3/dh21E/E88elyg6oKr6ZYD80zg0ZXEZDBXBiU=; b=D9Cx2UfrxY2xSu
	MspGRay/sBHuuYx4sU1wr1+N/6Cjg3DnjTLihxzmXvvd9chnNnf31i+WGisXGPCQIZubi9SKBEfJN
	RuUOOZ2H1pgISrDd4egi3qexQ4O7f5IlQg0/HJTJGo3hc6yT+4ZeR0o++YjKOthAIN8N/fRRIx5pL
	yD646ndp3qSlbmqyV74CuPCyw7f/fXPIDz3ec5KBm0Fg8CTHPwNeKVISsHcpZKDFGKgHknc40Ji4w
	yY53gfEktblVvZT1MGE59Z2eShQu/pMscQmpLMwAtIWWJ87omJ6eJN1LO5g7fvpRlgXscv/o+Ttma
	Wcy/0XHibFz8yjDznNdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESG-0000000DvIB-2aQg;
	Fri, 11 Apr 2025 13:30:00 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EEw-0000000DsbA-431l
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 13:16:16 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2255003f4c6so21338585ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377374; x=1744982174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L81sw7HLh9+LhiB6MR/QGvuJQdrXF+C64yrUzRsSA2I=;
        b=VdGM1mvPQXF5GY7nmRXhL1D5GhF9au4KBnr6beJNe3JMkUMpqA+Obh17KbCzZYJzG+
         AhPqWa1XWJK41OTd+JI9ElngcKdt9v6kDxs+mWsIAdw1rkevmla/1h8mFA1AtBa1unl6
         9OEGCOcuITRxgP3aL0T9YPu33RavPCZvjj1Y2yOQvfoDdKVkk7m5Q9GaDbhkWopgOQg8
         FgNAlz6xYdw5nQccjblZKKIaniaLN43KhRKlYYf4JJ3x4DKMvIZkl38v20YVqTHHZ1Wb
         SAp74MMBpcKW6vv0mHxxUq2RNpWWsSP3LjUN28H/3woqNgo6xpIA5R/vvPXZDcqdu1bX
         iivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377374; x=1744982174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L81sw7HLh9+LhiB6MR/QGvuJQdrXF+C64yrUzRsSA2I=;
        b=R2RnrFYHaRhBfr6PquowWnBoiIJLMeiotLMx/y8+o05ciRbyiUJd0bY+u43UrxRpRM
         No6UfsMQ3fsFH4D5179v4rFk0YJxbBE3DWtaH2iEILfjQu6h9P+yXY/yRRNj/9RXcQL3
         XySoCF64icvu31E3X+s5J7dsXtwo9FoDMqe9V8py4B5aW24+ZAOphZ7aYOSSzvfrNWSv
         0tmciaGKQE/qMAzhgIelAjON+c5hztbfJSegeM7eAlIw7stSOxfQh14bX5p8gmjq+EpW
         Ki4E+j9hFbjaqj6x7DmtpsUmbr6Twn0B3fJrcuO+UCdF+ADtY9toeqgIEaYhV2wGBRzY
         8GGg==
X-Forwarded-Encrypted: i=1; AJvYcCVVsAj/x4SG3mOhZqDkfsfDH9iVGNuv6MqV/QnGIqVfjdRD14gqjxKLokQH9FaW4tKOPoIGP1EE8l3KTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV//TBNCvrgnq25dWSWkqmd/rdDUP7LceUBfgpIxj18Sala5Cy
	pJcQnCn/lmH1cWBCH7Xs7OP89wZkRzdGJjz1fiAHt9tnbA90wjGx6KlD63cQ/VSiq85xz4ONqc2
	NtwmXVOHc
X-Gm-Gg: ASbGncsQ5dwGy0FIYEoQyI/BuNlpeYeKkRXov9DXinsqVlR7O7EI6tNlgyJjNx+ekfK
	H7aFITb94P8LZp4cm2OOADHu+F6Wn4pX6d7gFcOKNTLij4ipGZ+HEDJSAkrBoqrpVIxI/ZeuUWF
	PjH6oHIIv4GkjLJ3GBTpOYAAhgIuU9krP1+QtIzBx+XJJHFQnfst8I02BW9NatgZop1gd8V0rQm
	T3+wka6oRhqgHSvJ/Pg8RqRSgxZYrKZGKPfb3YO6Gpq2+OjWEvtBSaRmdZ5g/XW7q7kbGcgpSyy
	8yABFoT9CdZwl5bBuzjT0ReJrL1uW2VpUgT+u0U7Zg==
X-Google-Smtp-Source: AGHT+IEmLwAHBY89tjHCSmST4XI9krTWMwziLaJxfMz91MwbguhjP76VbrqQ0QFcdTjWcsDUD+s2Rw==
X-Received: by 2002:a17:902:d4c2:b0:223:26da:4b8e with SMTP id d9443c01a7336-22bea493893mr42628305ad.4.1744377374221;
        Fri, 11 Apr 2025 06:16:14 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:16:13 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 6/9] riscv: dts: spacemit: Add pinctrl configurations for PWM0-PWM19
Date: Fri, 11 Apr 2025 21:14:20 +0800
Message-ID: <20250411131423.3802611-7-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061615_006069_87171DDC 
X-CRM114-Status: UNSURE (   8.51  )
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

Add pinctrl configurations for PWM0 to PWM19 in the SpacemiT K1
device tree source file. Each PWM instance is assigned multiple
pinmux configurations corresponding to different GPIOs and
function modes.

Configurations include:
- Mapping GPIOs to appropriate pinctrl nodes for PWM functionality
- Specifying bias-pull-up and drive-strength attributes

These updates ensure proper pin multiplexing and drive strength
settings for PWM signals on the SpacemiT K1 SoC when selected.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 315 +++++++++++++++++++
 1 file changed, 315 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86..294e05409933 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -20,4 +20,319 @@ uart0-2-pins {
 			drive-strength = <32>;
 		};
 	};
+	pwm0_0_cfg: pwm0-0-cfg {
+		pwm0-0-pins {
+			pinmux = <K1_PADCONF(104, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm0_1_cfg: pwm0-1-cfg {
+		pwm0-1-pins {
+			pinmux = <K1_PADCONF(14, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm0_2_cfg: pwm0-2-cfg {
+		pwm0-2-pins {
+			pinmux = <K1_PADCONF(22, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm1_0_cfg: pwm1-0-cfg {
+		pwm1-0-pins {
+			pinmux = <K1_PADCONF(105, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm1_1_cfg: pwm1-1-cfg {
+		pwm1-1-pins {
+			pinmux = <K1_PADCONF(29, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm1_2_cfg: pwm1-2-cfg {
+		pwm1-2-pins {
+			pinmux = <K1_PADCONF(23, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm2_0_cfg: pwm2-0-cfg {
+		pwm2-0-pins {
+			pinmux = <K1_PADCONF(106, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm2_1_cfg: pwm2-1-cfg {
+		pwm2-1-pins {
+			pinmux = <K1_PADCONF(22, 2)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm2_2_cfg: pwm2-2-cfg {
+		pwm2-2-pins {
+			pinmux = <K1_PADCONF(30, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm2_3_cfg: pwm2-3-cfg {
+		pwm2-3-pins {
+			pinmux = <K1_PADCONF(24, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm3_0_cfg: pwm3-0-cfg {
+		pwm3-0-pins {
+			pinmux = <K1_PADCONF(107, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm3_1_cfg: pwm3-1-cfg {
+		pwm3-1-pins {
+			pinmux = <K1_PADCONF(33, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm3_2_cfg: pwm3-2-cfg {
+		pwm3-2-pins {
+			pinmux = <K1_PADCONF(25, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm4_0_cfg: pwm4-0-cfg {
+		pwm4-0-pins {
+			pinmux = <K1_PADCONF(108, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm4_1_cfg: pwm4-1-cfg {
+		pwm4-1-pins {
+			pinmux = <K1_PADCONF(34, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm5_0_cfg: pwm5-0-cfg {
+		pwm5-0-pins {
+			pinmux = <K1_PADCONF(109, 5)>;
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+		};
+	};
+	pwm5_1_cfg: pwm5-1-cfg {
+		pwm5-1-pins {
+			pinmux = <K1_PADCONF(35, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm6_0_cfg: pwm6-0-cfg {
+		pwm6-0-pins {
+			pinmux = <K1_PADCONF(88, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm6_1_cfg: pwm6-1-cfg {
+		pwm6-1-pins {
+			pinmux = <K1_PADCONF(36, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm7_0_cfg: pwm7-0-cfg {
+		pwm7-0-pins {
+			pinmux = <K1_PADCONF(92, 2)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm7_1_cfg: pwm7-1-cfg {
+		pwm7-1-pins {
+			pinmux = <K1_PADCONF(37, 2)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm8_0_cfg: pwm8-0-cfg {
+		pwm8-0-pins {
+			pinmux = <K1_PADCONF(0, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm8_1_cfg: pwm8-1-cfg {
+		pwm8-1-pins {
+			pinmux = <K1_PADCONF(38, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm9_0_cfg: pwm9-0-cfg {
+		pwm9-0-pins {
+			pinmux = <K1_PADCONF(1, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm9_1_cfg: pwm9-1-cfg {
+		pwm9-1-pins {
+			pinmux = <K1_PADCONF(39, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm10_0_cfg: pwm10-0-cfg {
+		pwm10-0-pins {
+			pinmux = <K1_PADCONF(2, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm10_1_cfg: pwm10-1-cfg {
+		pwm10-1-pins {
+			pinmux = <K1_PADCONF(40, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm11_0_cfg: pwm11-0-cfg {
+		pwm11-0-pins {
+			pinmux = <K1_PADCONF(3, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm11_1_cfg: pwm11-1-cfg {
+		pwm11-1-pins {
+			pinmux = <K1_PADCONF(41, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm12_0_cfg: pwm12-0-cfg {
+		pwm12-0-pins {
+			pinmux = <K1_PADCONF(4, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm12_1_cfg: pwm12-1-cfg {
+		pwm12-1-pins {
+			pinmux = <K1_PADCONF(42, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm13_0_cfg: pwm13-0-cfg {
+		pwm13-0-pins {
+			pinmux = <K1_PADCONF(5, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm13_1_cfg: pwm13-1-cfg {
+		pwm13-1-pins {
+			pinmux = <K1_PADCONF(43, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm14_0_cfg: pwm14-0-cfg {
+		pwm14-0-pins {
+			pinmux = <K1_PADCONF(6, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm14_1_cfg: pwm14-1-cfg {
+		pwm14-1-pins {
+			pinmux = <K1_PADCONF(44, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm15_0_cfg: pwm15-0-cfg {
+		pwm15-0-pins {
+			pinmux = <K1_PADCONF(7, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm15_1_cfg: pwm15-1-cfg {
+		pwm15-1-pins {
+			pinmux = <K1_PADCONF(45, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm16_0_cfg: pwm16-0-cfg {
+		pwm16-0-pins {
+			pinmux = <K1_PADCONF(9, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm16_1_cfg: pwm16-1-cfg {
+		pwm16-1-pins {
+			pinmux = <K1_PADCONF(46, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm17_0_cfg: pwm17-0-cfg {
+		pwm17-0-pins {
+			pinmux = <K1_PADCONF(10, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm17_1_cfg: pwm17-1-cfg {
+		pwm17-1-pins {
+			pinmux = <K1_PADCONF(53, 2)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm18_0_cfg: pwm18-0-cfg {
+		pwm18-0-pins {
+			pinmux = <K1_PADCONF(11, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm18_1_cfg: pwm18-1-cfg {
+		pwm18-1-pins {
+			pinmux = <K1_PADCONF(57, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm19_0_cfg: pwm19-0-cfg {
+		pwm19-0-pins {
+			pinmux = <K1_PADCONF(13, 3)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+	pwm19_1_cfg: pwm19-1-cfg {
+		pwm19-1-pins {
+			pinmux = <K1_PADCONF(63, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
