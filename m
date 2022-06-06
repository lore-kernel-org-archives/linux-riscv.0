Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DABC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3vGSCrFDTfoiw/gU9uwW3MGFD2mFwUM/7cNf/Zkp7+g=; b=Zq6vAF02z8wb2n
	+ndkxsVC5aL8H3hmU+bMz4RepDoQkVgDrA6UwxEfK3J+R1D8YcglL4NP7daUtvZDvl8LrPEAQREvK
	Z2QCPql5YtNgxxkmUjaqfUXn890F+5eEei/qSiOo0sd4vTsC5GMcZnrPWtPAWCFfsTDmn3VbNwfaK
	krd4XcMCZfeX6wkk+cItt3BIb5OofxsyYou/xsNwJrrjVVNQhjlp5QnZHZFaQYh+qssBFKJ0q6IGC
	erKv7K6qrD467Vi6MaW6WUR4bLbk43Ip0RNvIsqqXbA8BD5s8RTBZ8FMUi4in7iCMF7mAjQwf8LTM
	sGXkaUWeL0Dy1I0K6Cng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEff-001osm-ND; Mon, 06 Jun 2022 15:29:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEcO-001nAs-Jj
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 15:26:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id q15so4717560wmj.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 08:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oggV4sOjieyiC3zjEdHQHSt2OuXT3mEVI982IJ/c+54=;
        b=NaB7ujjGsLox+28AdLK9IidwX+NJOkUleLjf4urIgEJUy6CHXhH2EePr22m74qQdEA
         79mv33qy/xswvfwMxz168siPdwUK7Krz2iUEUbL9+0RK6LltHN1Qqo1e2xXu3s9VCK/z
         NIJWNpW8d1FTfwhqQ7UccQcdKWY7CLUuNH3z7hTLi+k5MVHte1kWZZOptTtRM2sWmlwW
         pXAtWMrUN74gUFYtK/9l2Xp7uV0zy5f7NglOI//BfmebbOrBcDQL5jVG6NmVlz/J+oZD
         dLBPOOPbqxl3xt2MG/bFypavTjAOyw++V0cBBF7Bnu8/rcewEjYER1C7DDYUalMDV95C
         IAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oggV4sOjieyiC3zjEdHQHSt2OuXT3mEVI982IJ/c+54=;
        b=1eglokXQOBGjcOOgVzOHTsMFwWtI3CVUrBPnM89lcvDpsaTj7A18uxXb7bDU8RrbLl
         2WawgnTeCYBmQRw/hk5sjEgBnwkiyyeQeKevD3XdfysBB7EBwCcLeGXFxwO9fPeWk4KV
         EDhjB/srQWgalc8p5u7952ve+nQh6XXB81Ipdlnwvy2L6VBcARpxBh+SS01G48pZWHUr
         eiWSBKUBwm3eSqdkb0ueY8H0SdK1RRb/9b2fE2CqCtOV5stNqhDktD6hg9fFa1j5MJTv
         QGJwYJoBfNPd4YDmn4F6845PDTWe6XRuGugjzMCNvCutoMpfCW174H0YcVyAb6d4EV/1
         RpKA==
X-Gm-Message-State: AOAM531qPmD7sMmCcGj78aMRQd9lxmyA0rY51BOTNTW5b2OdIfLmid+N
	kz7Ca3IEW1YZYzhBsGnggOUqMkkw/m80IWMZ
X-Google-Smtp-Source: ABdhPJxQXtq89heOMKFlrzvEzPMju6ZggXxjIjVWhm/vncfRX5ffcbpunfZrkktl/6NLqBfuUMH5Dw==
X-Received: by 2002:a05:600c:5021:b0:397:54e1:8274 with SMTP id n33-20020a05600c502100b0039754e18274mr52631051wmr.15.1654529169099;
        Mon, 06 Jun 2022 08:26:09 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id h1-20020adffd41000000b002103aebe8absm15623944wrs.93.2022.06.06.08.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:26:08 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee.jones@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Atul Khare <atulkhare@rivosinc.com>
Subject: [PATCH v2 0/4] clear riscv dtbs_check errors
Date: Mon,  6 Jun 2022 16:25:54 +0100
Message-Id: <20220606152557.438771-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082612_775971_4710AB5A 
X-CRM114-Status: UNSURE (   9.06  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey,
Couple conversions from txt to yaml here with the intent of fixing the
the dtbs_check warnings for riscv when building with "defconfig".
Atul Khare already sent patches for the gpio-line-names & cache-sets
(which went awol) and will clear the remaining two errors.

Thanks,
Conor.

Conor Dooley (4):
  dt-bindings: mmc: convert mmc-spi-slot to yaml
  dt-bindings: i2c: convert ocores binding to yaml
  dt-bindings: mfd: convert da9063 to yaml
  riscv: dts: sifive: "fix" pmic watchdog node name

 .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
 .../bindings/i2c/opencores,i2c-ocores.yaml    | 123 ++++++++++++++++
 .../devicetree/bindings/mfd/da9063.txt        | 114 ---------------
 .../devicetree/bindings/mfd/dlg,da9063.yaml   | 132 ++++++++++++++++++
 .../devicetree/bindings/mmc/mmc-spi-slot.txt  |  29 ----
 .../devicetree/bindings/mmc/mmc-spi-slot.yaml |  79 +++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   2 -
 MAINTAINERS                                   |   3 +-
 .../boot/dts/sifive/hifive-unmatched-a00.dts  |   2 +-
 9 files changed, 337 insertions(+), 225 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
