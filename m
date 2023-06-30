Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E476EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AQiFkvsShs09TcTEIhTNXLHarog1PEgqLNe4WcUTzyQ=; b=Wvsb5T+zfk0Jhv
	7kvv6HkVcrq5iFd1RtYOTH1OZVfjJ4vT5cZ0dpZzZc6gGToYo4tBtuVLoRUzOhbQ2AUxkPvsnmmd7
	ILLw2IkgtjipxsuMkEiWr7d64OMlXPNDOWs+ISQgd79MOAbgyI2EezO4q9WcH9ffTk/4wsfUIlXsN
	BzsfqfqNa/PFYw/Gt8nh//UrKjBnmJWFB3Z1/xLoDMqcaIsf92HCnLZ3uLX+kLq1hrS0XXGK4mxRG
	DBFxT33ISakXX2Ub5qUN1gWNq/lsD6DWAckuq0Gr+iYBZDssnF2AJZjd5lJ70ap7JyElS1d0Goy+9
	+BZ2G75bj8FIu2CO9r3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCrs-003eUp-0P;
	Fri, 30 Jun 2023 12:04:52 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCrp-003eSW-0y
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 12:04:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso8470185e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688126687; x=1690718687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XeWX/R3ALNQW7TMdg+WDALqzh4Qvq/B6Wn9m1S92myA=;
        b=JoLxtruYLIlTTHRqsCr+TZ6lLDf8IIj/rhFiwETu3Qp7dNG/lRPnCyfHxdG9aPgJB6
         GU6V1HDHQVP+/fmNPyCMlRtR01ZJFwB6zSQdKhfmmF+I64oT/LZgQmLsnXPdUA56A4Lw
         2VYwy6fOQ+IHOk22ddL0HSVBkQzaVy6e2EgtFHKtRSJlNW1XIerKAtPTSdTESwQZtqjO
         4nLDPvDASO64ceaPyBAoBkkW+CoS7rCOUMXP+8PMHSw50Fn6Nzqufe3IkFgaXUjv+igp
         PP17+yS3HmaVMEFX/M5qfduAK2KcImCsvNMCFwAcwFdpAUOvm8GtlljoNCKcBA76oND9
         YRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688126687; x=1690718687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeWX/R3ALNQW7TMdg+WDALqzh4Qvq/B6Wn9m1S92myA=;
        b=TwSLbI/XRLPiwcjQ6TNhOCeZFFmP24TliKF18tGqRL1CKQlPxogAQmhFknEBZMwVvz
         9q1Z2+v+AhCyNbcH7iOXNkQ9uemam/ex0eu4393PFRWV9uXFMfnuBgp6rtP8qVfwVfex
         SDdPxx5Bb1z2/jHG+X/W+TQg9iJD7pA9J6MeTosARtEzCUvuGJlElV8HSSg+IA1vx5Fo
         Msb/qQJ4prOeIMjua8ozSepKQqKKkhBf7g5j4l2Eu/GLJQdmWoc/PQIae3GkBQuBbkue
         7Xj/BhvDK3D8COsFWI7JBNcagKJi7SbVAzxF7EVitagUvHMU62HVcYcmcrfIgB3c8VUS
         +xHg==
X-Gm-Message-State: AC+VfDwuo2RJiiakiMK3TCUceLYlh8ym28iP5ro1mU/YaMecPf9BpmL1
	h8zcfU9i1W75xw0Yq5Lf3wrQYRZTUZMMAQ==
X-Google-Smtp-Source: ACHHUZ4/eJQGJDNAiNsJSdVSI4ZAtA7L30Wt/03YbJalDCSU7kF5tE/eLGUmDlr4nRGqTwyJlmnqCw==
X-Received: by 2002:a05:600c:21ce:b0:3f8:d0e7:dad8 with SMTP id x14-20020a05600c21ce00b003f8d0e7dad8mr1784038wmj.3.1688126687111;
        Fri, 30 Jun 2023 05:04:47 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:dbbb:7082:18ec:f407])
        by smtp.gmail.com with ESMTPSA id k22-20020a05600c0b5600b003fb40f5f553sm11766912wmr.31.2023.06.30.05.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 05:04:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 0/4] Add missing pins for RZ/Five SoC
Date: Fri, 30 Jun 2023 13:04:29 +0100
Message-Id: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_050449_345671_C1BA5BB4 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Geert,

This patch series intends to incorporate the absent port pins P19 to P28,
which are exclusively available on the RZ/Five SoC.

I am submitting this series as an RFC (Request for Comments) as the port
pins P19 to P28 cannot be utilized as GPIO but can be utilized as
multiplexed pins. Additionally, certain attributes such as setting the
ISEL would necessitate a device tree property to indicate ISEL. Therefore,
before proceeding with the addition of comprehensive support, I would
appreciate some input on whether an alternative approach could be considered.

Cheers,
Prabhakar

Lad Prabhakar (4):
  pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK()
    macro
  pinctrl: renesas: pinctrl-rzg2l: Add validation of GPIO pin in
    rzg2l_gpio_request()
  pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
  riscv: dts: renesas: r9a07g043f: Update gpio-ranges property

 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi |   4 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 263 +++++++++++++-------
 2 files changed, 176 insertions(+), 91 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
