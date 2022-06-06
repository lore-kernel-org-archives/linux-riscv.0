Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60850C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 20:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yo4B0IGU/hf4gwlqLt8a7M6bzlw4ig4npTGrZLWOt3M=; b=fRC3ENdARf5hxR
	XYOklf/pVc/3BOUqzlt0a4mY2iZMWSBbTgGaYOoTxCp94xs8HRklq/uD5Mg2QuuC48rAZL4VDNwi5
	IH+wTU7EgYrqfJ46OgGXfKf2Vi2coYgnuQ359szw6hz013ZlXx1dXkMzqXstqisLbu4qsSL7zfNo0
	fQGnHVH3i1+FN9lGl/PPX7gE9W2MDfOa1n3Ua1SwPRGmRzLCSVGLyNkR2egY0Na5FEUH5bBVmoexf
	0VyosRj0Dz6h9XKbvS7/rX5MUE3sG916QNP2opr87NpPY4foWXqbrAf+vCSCxF13GpjYrybRsmPem
	LX4faDhMItRK8HhoyKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJ71-002YIm-GU; Mon, 06 Jun 2022 20:14:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJ6z-002YHk-0o
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 20:14:06 +0000
Received: by mail-wr1-x429.google.com with SMTP id u8so16947073wrm.13
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BI7QjWVmpuIIWqYE8RAGE9+KBCb5m1yaNT/iNRoF5ZQ=;
        b=CurdJRrwRpbC0c4Itoz9kpdvNjjrqwG0W4Bxx7JyZo7MHvXz6QE91X5Do/ZmFIibkB
         YT4ptws23TVyHtMEK2dfTg51Wdm9O0VoEXQtId9PMthGhtUcAFUhRQwkiiN4KGw6iQFS
         g5kwKs6MTUAvWSGdpghRjR++l8WmEA4NOMDiJt9B/dEQh1IBmDN5JF9JyNDj7jQDgpDl
         tfyb6FEpySUePsx3ZFl8a10KI9x6dc9sCYtQbwfubvyUk1OpdMngAYhgHkaW4wKDT404
         X9QryiFgRhIq2iu2Lndy2/BwW2FPv9gdbcG96G3K/gYrOxokyN5wGRW+nKKqor7EXwT3
         B8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BI7QjWVmpuIIWqYE8RAGE9+KBCb5m1yaNT/iNRoF5ZQ=;
        b=AuvM4vuSl9/Zw+2tT4bPkn/PuLCxqYeCpqgZZyjCirkcc0n1gOOJ1613f55SSMgWN6
         HFYNSxTGTYMerTi6qWxDTqr8vUos902eWEbuGC/OURaRitDw0zunmJNdycMzSfvqpID7
         4bYB0I+rT3bqFpYiV3cTAwdlbAHbDBn3JlTH+iM1rONDPA5dEcrsxxHjl+dOuKNS+70Q
         hdtHNf9xec/2VtSTA3C0BN0DiGAYLfD/iZfaM5NrG0of2rRPbb8LAqf7nFcZ8WWEJrjw
         Z2DPL8iLt2r208XdzKKvbTqPfgvui9nVXgyUlF+5H5utirAcEuYagXKDck5eBValCH9I
         /Jgw==
X-Gm-Message-State: AOAM532LXDfvq/xsvBXC2zKViXdwOKly5pqRyQsVC0+QBTPFKb9Bc1TO
	2LD1Zwhz5JzkPO75eKNYVfp5uQ==
X-Google-Smtp-Source: ABdhPJx4Tj3fXU8Oa81ZJEnl1+5UHUvX/FBSXyCX7Oaw5uHbxBpQhAWUOZNwRRlTlfhdRjet9ZyAFg==
X-Received: by 2002:a5d:4087:0:b0:213:983f:2198 with SMTP id o7-20020a5d4087000000b00213983f2198mr21509092wrp.399.1654546442102;
        Mon, 06 Jun 2022 13:14:02 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d4589000000b0020fcf070f61sm16038489wrq.59.2022.06.06.13.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:14:01 -0700 (PDT)
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
Subject: [PATCH v3 0/4] clear riscv dtbs_check errors
Date: Mon,  6 Jun 2022 21:13:40 +0100
Message-Id: <20220606201343.514391-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_131405_127041_136BB45C 
X-CRM114-Status: GOOD (  11.76  )
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

Apologies for sending v3 so quick on the heels of v2, but I realised
I screwed up copy paste in the i2c clock-frequency description & wanted
to rectify that.

Thanks,
Conor.

Changes from v2:
- ocores: remove part of clock-frequency description that was added by accident
  while copy pasting as a template...
- ocores: remove the enum (added in v2) for clock-frequency since that
  limitation was incorrectly copy pasted
- ocores: drop #{size,address}-cells
- mmc-spi-slot: use an array rather than a matrix for voltage-ranges

Changes from v1:
- squashed the maintainers changes
- dlg: added da9063 changes that landed in 5.19 (dlg,use-sw-pm)
- dlg: use absolute paths to schemas & unevaluatedProperties: false
- dlg: added vendor prefix to filename
- ocores: dropped "dummy" devices
- ocores: added vendor name to filename
- ocores: use enum for compatibles
- ocores: add enum for clock-frequency
- ocores: add reg-shift default
- ocores: reorder properties in examples
- mmc-spi-slot: use common gpio defines
- mmc-spi-slot: add ref to peripherl schema
- mmc-spi-slot: removed unneeded quotes, fixed a line length & s/spi/SPI

Conor Dooley (4):
  dt-bindings: mmc: convert mmc-spi-slot to yaml
  dt-bindings: i2c: convert ocores binding to yaml
  dt-bindings: mfd: convert da9063 to yaml
  riscv: dts: sifive: "fix" pmic watchdog node name

 .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
 .../bindings/i2c/opencores,i2c-ocores.yaml    | 113 +++++++++++++++
 .../devicetree/bindings/mfd/da9063.txt        | 114 ---------------
 .../devicetree/bindings/mfd/dlg,da9063.yaml   | 132 ++++++++++++++++++
 .../devicetree/bindings/mmc/mmc-spi-slot.txt  |  29 ----
 .../devicetree/bindings/mmc/mmc-spi-slot.yaml |  77 ++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   2 -
 MAINTAINERS                                   |   3 +-
 .../boot/dts/sifive/hifive-unmatched-a00.dts  |   2 +-
 9 files changed, 325 insertions(+), 225 deletions(-)
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
