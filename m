Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E8BC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jun 2022 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mEEx2Y9pETklAVQDbGZNR03I+JvUNrmcLPJ3h0vQJYM=; b=Zqa6IGalfTnNfo
	KQ1Xd4R9FVaBUHBayYJo/P45CPvTQYqMb4iUsblCpHO6I+G2k8qXX9lwtnSD+x4otVzgoZD8+KiUi
	ennZIFIh3WJB9cVeO5hzAoih9mYg8I2yViLM8aGmF5SEFAEiDF4SvxmBxfg8k6FfFkyfGY2T3t0wn
	Yj52MA+7Ng6yjmc3UzSDYQ4IJ5ghSR4tPGUO2gERFR6/X9fI7TBuPVh0oMsEjtMPnOrABtq/MRqG4
	gpT3YyK27HbrvUS72jKyuW2EL3sE79HXNqIN3u+udpafaKwyaS3Nwnk+Kal4K8lnT1r9DRCNRpc0o
	nhuf/VjyZpqlnCWb4opw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNd-00EYIy-84; Sun, 05 Jun 2022 13:33:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNa-00EYHA-2u
	for linux-riscv@lists.infradead.org; Sun, 05 Jun 2022 13:33:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id a10so3808276wmj.5
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jun 2022 06:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbA7wh6jY57A81MjAXEOdG7Q5joLo5XSqFmERYe0yms=;
        b=KUt8AZOzNgbQqIXStUVCuFGSgDZ2GjKz/m7+3s++R2lHfDBG9uRWnD4abumwN/BtDD
         sm+WhmB6LHlbFKIIMVxc/XdGG9t5tPqKMQfHhVQNCHaM+x+ztHA09HkGuQikZ7z5PR2I
         j9FsPbeVBsRZ6Zf6MpPv0sbilYeqPuyR627Bhupbrkjl87E/h19SDQD25s1DZbv8HcgA
         qhm2RsHyaapoLYtz8k4VipUibyDnHbDUGuGglW7lu6aPe1w5oIU7ce1mWQtkwZQqXlIZ
         ZtOtz7LczF/LuLJkCgyOjiMvxH9QpzXQxCS6XmDRURKG5EqgkoMY4Qc4RTINiNl1JGDd
         fnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbA7wh6jY57A81MjAXEOdG7Q5joLo5XSqFmERYe0yms=;
        b=hUR2DRi41dwKxHSToiM7CmBrTYuU6HDaQKobS8/SaD7ekQwYcZiaAhEnLDKfC76tnp
         1P9SujFAWrbkc19qaBR5x7uTLoTWgRJkY0NQ8Wj5RHeWZBaCno/YmQDp6xm+2DW2yoSM
         TwT4cu64GK7vWPmMnT4NV6+61Bt7fa6j7hDDZzi7odVbc89ddu6EeG1wCXDt9yujiKNC
         0XOrupJSVrvBCpZTjovl6lJ/RqPpEnK22fuK3F825YNlFxoo3C7N0lUGtwmQfhNZVN4T
         AFMtB0EIXynbqS2PkCFin3bzjgY+H8akDj5ngtIMks0fdIrGqDiCPKojEpzZDT9NCSoj
         2AAQ==
X-Gm-Message-State: AOAM532XDTzU13uxho26TDqQSavxZeTH+5PLd5nh50EjWZAeYVEPn5Vf
	RVVYUmyumDWFgAv3UIMkDcJEtw==
X-Google-Smtp-Source: ABdhPJw10bY4o1/w1XS51daNaShBW8xHRcfsZfqKIJEbYDaIL1gaYDHaYsbiQI0FgXSBT2fsoaPqMw==
X-Received: by 2002:a05:600c:19cc:b0:39c:3022:1b23 with SMTP id u12-20020a05600c19cc00b0039c30221b23mr16534325wmq.106.1654435995365;
        Sun, 05 Jun 2022 06:33:15 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:14 -0700 (PDT)
From: mail@conchuod.ie
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
Subject: [PATCH v1 0/6] clear riscv dtbs_check errors
Date: Sun,  5 Jun 2022 14:32:55 +0100
Message-Id: <20220605133300.376161-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_063318_201055_B7BA0171 
X-CRM114-Status: GOOD (  10.27  )
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
the dtbs_check warnings for riscv. Atul Khare already sent patches for
the gpio-line-names & cache-sets (which went awol) and will clear the
remaining two errors.

Rob/Krzysztof:
Have I correctly expressed the mutually exclusive properties?
I had a look around, but wasn't able to find an obvious binding to ape.

Wasn't sure if a txt -> yaml conversion's MAINTAINERS update was meant
to be in the same patch or not, so feel free to squash.
Thanks,
Conor.

Conor Dooley (6):
  dt-bindings: mmc: convert mmc-spi-slot to yaml
  dt-bindings: i2c: convert ocores binding to yaml
  MAINTAINERS: convert ocores i2c dt-binding to yaml
  dt-bindings: mfd: convert da9063 to yaml
  MAINTAINERS: convert da9063 to yaml
  riscv: dts: sifive: "fix" pmic watchdog node name

 .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
 .../devicetree/bindings/i2c/i2c-ocores.yaml   | 132 ++++++++++++++++++
 .../devicetree/bindings/mfd/da9063.txt        | 111 ---------------
 .../devicetree/bindings/mfd/da9063.yaml       | 123 ++++++++++++++++
 .../devicetree/bindings/mmc/mmc-spi-slot.txt  |  29 ----
 .../devicetree/bindings/mmc/mmc-spi-slot.yaml |  76 ++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   2 -
 MAINTAINERS                                   |   3 +-
 .../boot/dts/sifive/hifive-unmatched-a00.dts  |   2 +-
 9 files changed, 334 insertions(+), 222 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/da9063.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
