Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C9AC001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tvOGcwe17Mi9aqQ4+uNdStykaNlvhC6MWU54FwAuJjk=; b=TMGYCGn1W2dUrr
	JQEpIp5B2pNMBT28N/GawkOiQm3UU+NZu2L6hz1pV+UDRCjUXwJtnIs7w1VAc4uT18yGZAEFcjyWL
	ukQukqtb9xaZNhSbxNyhg/ZoGTCoMis0TOZXUI2Rjl9wwdS2Cl0FnsCwjHRgdOcmKl0/jAOQP9RGD
	cBncnJdaoXQmkpe46VGAAvPuWQScChqgWGJZlat2cLqsCsIJakovIeS8JBLElc9Um3A1dCFc2b+4L
	SwHlQN/rON9D5Hp9fgUnf8h9oFJ0Kz67vlCyxj94kZvU8o7/75gS0SXddnUZVRU2OjkUNP9Iu9cv6
	qPCQN9ypXMV6k2biZ3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXgq-00HAFC-1G;
	Mon, 14 Aug 2023 13:33:00 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXgn-00HADt-3C;
	Mon, 14 Aug 2023 13:32:59 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe9f226cdbso2782083e87.0;
        Mon, 14 Aug 2023 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692019969; x=1692624769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jFB+OiQyX+/XOrvqOgAzluwmxlG/0gir8mZMAan80sw=;
        b=U/rESK8k1FcKUXYvqdeMCVajTRetZeGOxB+NAqre7b5Avu8pjh1fznhzzqdL7+jXRM
         7iOeud9RvZs0+jpxBHfZnfdUQmbeaWfyPzGTeZqkcMT63XFi6QEJRhneB4eUE+IsIm+L
         WCdzRTSJ67MsAmYPdnkbwmvhp3MhYPlShrtJBqBly7E1yHp/3ypR7L5BB55G3pzIdVih
         ow1hpaxh95eoq3qPBvs2lsDwDs975vvxisoBF0tNhy6v7Hl1dVOIKAF0WCiYc8hVW2hW
         yt3+Ui6aMWk2PiMzlamcz5mEasUhcGS1nnW1YKxx/thPPWBmiTxE7hjm1/fJ6c+C/EMv
         pd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692019969; x=1692624769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFB+OiQyX+/XOrvqOgAzluwmxlG/0gir8mZMAan80sw=;
        b=d2mdbz0le6OYNiy5U5ln1mU65bSvpXGL55JXCQ+FBIlyInTPNlp5i0nHPJmTtAMdBU
         lptj+06BgahCUfkvtvyhlZ5pmNqJrWIBq+YwZpFozcD2i+GrCYPUgKTH1D+sDEeDWYBz
         BOnFqoHXSx/A5JzwGxUFfCEsSp9ywILrskM5jfizELAe9hWOWykFGroBOb6NX9TdNx6D
         FuOPWVcAzEAcKUk4nyu23WbA2upZ8oDNy7i7GJ6MZNlZy5d167Kp/sKdfKwOrAeoAW0Z
         PTafNT6Mc3SaqJ+k/yjiyGg+dCioX96pL1KbWxlWXf1zmWuEvDHu5NeSLUtZCdq+lIm/
         NWrA==
X-Gm-Message-State: AOJu0YznRqy65oSMn+VktTkpbf/TTP8JCigBW93SlIjVtzYYh8PKtDM6
	H8hgAeJfQ0/AQwahYiJ8QA==
X-Google-Smtp-Source: AGHT+IGvM+UlcUf8ntbiSxA6/SMSxnY9ei7EEuEEOrWYCEafQ/pnVMuFaoNipOnzOCOeqUFUMFKAgg==
X-Received: by 2002:ac2:58c6:0:b0:4fe:85c:aeba with SMTP id u6-20020ac258c6000000b004fe085caebamr5580767lfo.21.1692019969086;
        Mon, 14 Aug 2023 06:32:49 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id eo12-20020a056512480c00b004f858249932sm1990566lfb.90.2023.08.14.06.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 06:32:48 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Mon, 14 Aug 2023 16:32:15 +0300
Message-Id: <20230814133238.741950-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_063258_032290_560C1A97 
X-CRM114-Status: GOOD (  12.46  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
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

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  85 +++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  11 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 323 ++++++++++++++++++
 5 files changed, 430 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
