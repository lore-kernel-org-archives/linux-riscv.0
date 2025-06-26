Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD29C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uIvaG/+BcNZdgU/iXvQ4PQKrJtbTC2jvLGiCgt35vsY=; b=LAcJgiIrcARge3
	8682iccnoPQpAuAp0CD8eMpKvUDAZvQk8rS8EdK3dziTqedBW03fkjgFfCQIqdhA2bfq+taPFpU1H
	7Jqt+sn47Tx8tAXruIe9WRtGXD01du4SVFRngX93H1KiAzNUOChLTMFwyiOaiOUzfq+PQqMd/Ojmq
	tDF9FA7IADl7KfatGae6w4O3iiUcZMqrx+ZwN2SUBT+gaVlBzy18z2uq0WgbaeqAVXrPSfog/lMl1
	KpGoyyYyRwxXvT3iHsNMzLAC7UuAPHvX8oH928OuZZjCF8JGiFhvE7k1bSTxkeierNM0XJU9yRqI2
	M1fxM61xBksUOK4XoovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUncq-0000000Bvdh-22lH;
	Thu, 26 Jun 2025 14:30:52 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnQw-0000000BtPS-1Tq6
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 14:18:35 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4a58f79d6e9so16016941cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 07:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947513; x=1751552313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c1+njo/PU0WQA3UwaVXdY9MyHtDa5fqeWJD6Uqs2k9w=;
        b=WnbUxkdD6E+e3Itrn4DDtpl7IV6iU1TVLDy+2Yxj+ANm4xEXOpjq7xCAZnnDKA9IJN
         gdrcSFCYe+CTgIUk3Iqc851MBKazeBO4RLRLZkjhwjebueIAgX9LRTry9H56Ak0mcXDp
         U8UmIWestVk7Hd6lJ/EVAcFAjjFoYtIAt0tm+/dOTOXStHzDtFIz/pxO4oF0oScSHU2+
         icCpnIstbz6/wXtVHIZmrCg6saAKQ1ch7aMrdKI8yi3fcEM1F6kBe3vSZ8QgJ8QY3XgM
         pFiFLzrlc+u1/u5C+iEkqdYgF28YSKrgHq2pYmpAX5Lmwz6kMQHOLZAf2KRXrB/xSqXi
         nBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947513; x=1751552313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1+njo/PU0WQA3UwaVXdY9MyHtDa5fqeWJD6Uqs2k9w=;
        b=apF9yABQFEJiWOO34uLRuWQCOY3z5URZVW86QSsJ0yQdgKVHU3JdU1dSx57VELwMFf
         pxQqKUu9IMGRPjcV85Ebs50dRpr5c3PZswHJeHWB4Sa3Y26rwQ21HJWLuEBRptRz7ddd
         PW35gV7+bQdVPBpmacTRkWlTn6agu48j3PRpcJ5yEA2JWD7xH3CX1Q+bjajCBigfLD2T
         KJt/jadXuRvuC9uByKUJDVxJUbUwjuZgShADgXD1KZfg/of+8x9MOJ4qZU+riHx0uApt
         skKVvW+VnaIPK8qrZKEi5/ZWcPreSztjyhLJK942UNVDrB6UCDE+b5bLCbaim1A8zpBb
         RQZw==
X-Forwarded-Encrypted: i=1; AJvYcCUKJXrhognWSdaXggRB1O5UbIoZMRjc+46+LR3XFhvLATNm+WW+Lw0SxhXTdbgi7rhYVS9aoPXeGeB3/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNvPLDD2UdE9GrLz/NHIPfWux5+L9inq7YdRFe9gh9KfQaWh7d
	CwOq/Y5D001XcNLDznTFxugt2Pz35qajvnzYQU31nixWrv4A2cguMSC1Z+fXDdz/Nhg=
X-Gm-Gg: ASbGncsgy86E/a93ty1r4u3M4aj3ZyUNMXlM3Lo1igfQXCeI8tPlpLuoLn6alx2haw/
	2wMskAhbWyZXF0BooGp9+1Fi86mpX2r7TqUBgaxezp8nmlMTxf1ei0SzZJUKiy/6EcPTIZ5FouX
	wOlM3WH4PIjx8zSdDm1JW8aBhO6tiGl5DD7kQWuHtv1JrA8hz6xGYtzn/IVL5yXtxQ5xZoibAZz
	rt/NT/lTo+DH7wqOwoMa9bLLyROHnB/ampVuzpoFwO+9w837t3+WTjm8Cwj/1Q9fLkEapwB4awk
	FOqkzj/LMWzpkQLALxIsJZQqHEXD0jzl6CZB+mOhsrSk94AfTxVfZL56nE+Re62bkGzL75Hh3E3
	6hVjT8UZR01JhL9NuexEfllEb7xLVxTNZXbY=
X-Google-Smtp-Source: AGHT+IH50fVe+8buCV/yNDQQL4G1EmkNFITk4SYtG40d0e2VPlg856V2s5HzZ2dfEIhiKOw+A+yqaA==
X-Received: by 2002:ac8:7d43:0:b0:4a5:a7a8:fd83 with SMTP id d75a77b69052e-4a7f2a3c555mr61902301cf.44.1750947512103;
        Thu, 26 Jun 2025 07:18:32 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] spacemit: introduce P1 PMIC support
Date: Thu, 26 Jun 2025 09:18:19 -0500
Message-ID: <20250626141827.1140403-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071834_453531_D9EB2E81 
X-CRM114-Status: GOOD (  11.17  )
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

The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
converters and 12 LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as drivers for its regulators and RTC.

This version updates the RTC code in patch 4 based on a few review
comments from Alexandre Belloni.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v5

Between version 4 and version 5:
  - Only check the seconds register for change when looping on read
  - Return without re-enabling the RTC if writing registers fails
  - If the RTC is disabled when reading, return an error

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

More complete history is available at that link.

Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 +++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 12 files changed, 619 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
