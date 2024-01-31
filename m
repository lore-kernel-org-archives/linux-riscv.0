Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F9BC47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k+CYHHiNsZWZtkc5VcCPFVOc316psgsW0498GCNlyj0=; b=Wcp4HDFGtSlO8A
	iqa3mB5xgsc6Ty1WVZo73fhQBEUWMefK4CfksuBgLhj0FBqtiVvNqRci8uyFr4EspJ7f0T4fWM0Cr
	C2EbFMurGR0LBgCpuZcXx67gEWKJjKwNmYpm5KHz+MAYHFRUHnw37fS4dUSpOL0SGZMEpDQcDTxPV
	8+0n7FuQGl/1B+BeP0a+zBtfg5eC9lB3uMfwVG6TYnf9Jjq4jmwdzqYHTBX50/XIYD+GY87uTzi7y
	/5QceTlxEYSoe2oRBaQHpGTLs92e/3pXis2dgV4Lfjy5hkCQhVqzYI6oXuya3w+LINIdcvanq1d/6
	x9rtXTODuP3fq6Zb12Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVABp-00000003TGS-21DO;
	Wed, 31 Jan 2024 12:59:41 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVABl-00000003TDG-3Vgn;
	Wed, 31 Jan 2024 12:59:39 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-511234430a4so1375550e87.3;
        Wed, 31 Jan 2024 04:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706705974; x=1707310774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qiLW6Y7RRXrik6dDAtU4CB215hHq9HP/DTZOIjF86/s=;
        b=BTpz3EKdHTCaRaluh18dTwLF4cB/rPDXS+b94lBhLQGVYIJK38T12m9f5TRcsAV/IX
         yWSTR8ZcrY3SLqeVgsDN2jgMw8LiNbVghDDJ9Wpu9upQ6t1oXlA4mezkiFIaq9HI2Zx4
         2se7WwtrIVgQSOv1vWvYRq13FlLH9n1n04qtQQetdHca2yYqoPBk/yLUCJLblzLkmLhz
         vcjHxaG2E2wkkPrS0E/xhC1E8aUOe4UoRvXUgXvauUMI3zUnlyyHPZaEEQWRK32SC8HR
         llldf/j9heOYfS7IEQe40xp3SDAYb3oQU8WZWISfTiipp+MhxktcdDb/BlCVKGqEdkGF
         R+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706705974; x=1707310774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiLW6Y7RRXrik6dDAtU4CB215hHq9HP/DTZOIjF86/s=;
        b=qMJSM8yD5wL9Pf+EjYQ0asp1izY+L0BbQgAyjNeBMm71Vu2h1x4q487GBqtV0OtaD5
         Fp+iX79lp8OuyZcWHSogOsb7Nczta77rntSa0979l/ZnlZlA5h9sVqgbjHOYKN3kB3tF
         m0aYtEU0BnS8Qtg7pFNRhNX5hkUaPa0eLKAGppfZpp0i3nWvjSrCTWwGSdQ8X/ZJoryn
         gLicruVMhk4LkIvZuQgIm6dpiTpgocelM1DogrghdE5qHpBDHokzghFfzZJLjjVX5UBS
         dKwhJKyi6D8Gbk5qjAG1QlHrZ56MTdujbmJ4xGxPBcWXKFrTiiX90l/vkAjjnWLJeCHn
         ZilA==
X-Gm-Message-State: AOJu0YxEXFo7eCtDn222C+dw8YrdQl2NjqYhI5F4mZxwMnLCBY5mZEfu
	dn6VBmHopidQ/etJoB6fu5JHggGxDY+aWZfRMAztm0nRYrAkUic=
X-Google-Smtp-Source: AGHT+IEZD1EYbijfOfTXbD+S2VDVznBXDRi9jVFPUhgu9Z0dahqmdHXj7u5Cz0Un4MBqxKqBijOh6w==
X-Received: by 2002:a05:6512:282a:b0:511:863:4a0b with SMTP id cf42-20020a056512282a00b0051108634a0bmr1358837lfb.60.1706705973568;
        Wed, 31 Jan 2024 04:59:33 -0800 (PST)
Received: from localhost.localdomain ([188.162.49.60])
        by smtp.gmail.com with ESMTPSA id h25-20020a19ca59000000b00510faaa62cfsm1361135lfj.222.2024.01.31.04.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:59:32 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Wed, 31 Jan 2024 15:59:13 +0300
Message-Id: <20240131125920.2879433-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_045937_897741_6000CE4C 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: devicetree@vger.kernel.org, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


v2:
 - fix dt-bindings
 - fix a remark in the driver

v3:
 - fix dt-bindings
 - fix sunxi-d1s-t113.dtsi

v4:
 - fix a remark in the driver

v5:
 - dropped unused varibale in the driver
 - fix dt-bindings

v6:
 - add apb0 clock

v7:
 - fix a remark in the driver
 - add maintainer

v8:
 - fix compile driver for 6.8-rc

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  88 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 380 ++++++++++++++++++
 5 files changed, 491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
