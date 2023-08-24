Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01657C6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LoACEIRyimoU2v+LnacaDy8HrNq2BK+XGSFYH+hyRpE=; b=gqc33Xfoy/dwoe
	E4ISIkmVgPMW7fMSsq9ZXaztYpYmG2CyV6VhMuerbrjGtaJyllum7tJWx/oSoo16qT6SMufRn8Omn
	6QC+YxBLDBN58yNn6yQREsBFcLA+O6j9dQmc39z5lQj3C4MZM/WNOXtJhu2xuWN7xjh9ASUPFQkTf
	zW0YY7RClUUluam1UfTxYd4noH/n22vFk3m71WMv3MrqOOb4OJ0rzHeyJ758oifbd2JJ6sNWlyzuE
	17XCmHHVByMLxLiNValSrBclD2PCSKqnYIa8DUZDY85EfCCZ49jkrWLPBzqEHzeD1DK5p4F8ElQrE
	vNtN9k9y/+gMFLSlAuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ8hr-002zHW-2K;
	Thu, 24 Aug 2023 11:40:55 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ8ho-002zGS-24;
	Thu, 24 Aug 2023 11:40:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bceca8a41aso3866511fa.0;
        Thu, 24 Aug 2023 04:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692877247; x=1693482047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUBPftbqiVDHPFOQPydkZ4vgpp9Vl66RXM1E4eqnDFs=;
        b=XVNVisAYzFTW7+/m1W01itYhKhboMCitrCdEtMNkEO0Urd5h1pROw/hrX1K5lDp94b
         5Wuo+7FY3IN8YJbgRXNUVRxLCTnyyk14nMVzf3+yVjQDplXQxfVJWA8To9duw3Ey9iqv
         CvEk2vE0EwiHV9qSQ3S/sFTpkqYVUpXH3W9dBRpq/rc3RqyyLLBH+M6Pb1KsH0JOQPf/
         9QxyRNMEns0v4iP6DjgTruBxR0NxaV/SFvGvG6ya+wpO7/pMg48I5gYkKbpuypmOWKcd
         EjrD3CAdnoZyeSty7e0DAoMnsBQOXe4bPCmvciY3m7aec267sQ6LydvRBV+mEyKPAUFs
         Wn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692877247; x=1693482047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUBPftbqiVDHPFOQPydkZ4vgpp9Vl66RXM1E4eqnDFs=;
        b=QxS7or9i++fr3IP/S2fNOATNnQUods3bBMDsMIFnRZfxQvHicCC24nBm0vHZ3GqK0X
         Q9lryDiGkpszwOZuC5xvknocIGqRi1yUCijejn5oIaxfUGN8Cz5GvinGWsb3UIBOcQ6/
         +gVC2S557ugcbyGxTZEPMOh9ok29VsAwteqOrrYCUec8qO0O7PB6Zwh+MdN0oT2PQtlR
         Mn8l1RBWo55KzpIFdgFSFYFLNuZ11nnYRNY9Qh/YsqHEKUJ7rq2S+aBzl7wSuk7V5A8V
         8EiWW4FCJOExxS++JcSP1SaM2G2Ajk/V++PPDvhB3Ydl42MZ8yXy7riuXPUtxIK0AaEL
         3/gg==
X-Gm-Message-State: AOJu0Yzxqev3XhtdjTKCBoCwP54XnfWoMUW/wwbwlkmLBYHwFMenu3rQ
	WuOQLieV6TbxSoITvWiP2w==
X-Google-Smtp-Source: AGHT+IEjEXjcTrhVknpjRsjFOnmLOykW5okJzmpKyLYFRnIsDAMt738D7JOkHqHLGYF3nIO298FHyA==
X-Received: by 2002:a2e:88cb:0:b0:2bc:be3c:9080 with SMTP id a11-20020a2e88cb000000b002bcbe3c9080mr8558507ljk.27.1692877247191;
        Thu, 24 Aug 2023 04:40:47 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id o17-20020a2e0c51000000b002ba053e1f9bsm534568ljd.35.2023.08.24.04.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:40:46 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Thu, 24 Aug 2023 14:40:24 +0300
Message-Id: <20230824114038.891493-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_044052_685992_02FB232A 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

This series adds support for PWM controller on new
Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
provides basic functionality for control PWM channels.

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

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  87 +++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 328 ++++++++++++++++++
 5 files changed, 438 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
