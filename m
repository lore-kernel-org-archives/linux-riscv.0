Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03154C7EE3A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4HNO/vFe67Pwb++zDlkvKl59NqWKHLhr0pvRob5uH6E=; b=zyVGJIoWq0SBxN
	ZJ4c92ZK/KVBLjvxOrh91CtIlcBxdQcgQXT6pBSERvNbo0dz7gK1kYxvcZy84rJEZh+gl7TsXwBMi
	AMH6lxeAAibrCWBWoSHPzW1UPvp67ufN31y4qe6IlT5NRdapppHXUciIEkxg27YkBFTnHwXr7BKko
	Z3IIwteJl1GlTJXrWMaeod6Bmx9ktFvu6DJ6VsFeAR69S7R/MfUaHRTDiG8hKamA82g48sga4T8gj
	gImz0fCxu815HW/IUqSAjeLJCiIp9VhbR7lMf76tzZjUyUsB+VsVOLo5Q6sngdqbWv2Xi6fq4X0bU
	UqyKGfmd51Z7j/WkK29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAWF-0000000Eydh-1uF6;
	Fri, 27 Jun 2025 14:57:35 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9z0-0000000EtvN-0JxX
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 14:23:15 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6fadb9a0325so20083216d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034192; x=1751638992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xyZq4ZAe7ICNNo6naMBuUx3eFwikmrrS2wObQQXZubE=;
        b=GeaKuzQwfQlPC/wJpBYOYOiUemlDdnsCd2RfhOc0riQp72lM3zaP7jSIiZGApwLhps
         MjtI63Hoo6TtzZzhJaTXtD9D3ShAZJ3PuUd4hYG5TUEFS+bmtx4GfRIjCe6eMJujC4W5
         4UGEa0VmN5pp6SAfZXZAxc2pQE9GvM6aJRI3BGjqkM44BKYUA9vMGK60ExqiPM3vNKOB
         hD3eO/InoV87sMHfccRZo7RrsZxcYVTr0LlHGGXqomigvtw5eFcKc5yY6Yqg78Z0xqFg
         uxxkzALBp2jODkOxlf7jlUHa/J1BAn9ZuD7F1sRI6M0XhB+cd46D/q6GTwL3yqs7xZUI
         T/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034192; x=1751638992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyZq4ZAe7ICNNo6naMBuUx3eFwikmrrS2wObQQXZubE=;
        b=QL4q4pMTdV4Ty6MV+4m5vvQdc0fY2tNmqbZiLgyoTCJ/0h6nGtoFgGswO6nTsqwcgD
         zGky6XlPoAplP9kIB+7byZh+i2XmdpMctxS4/uCeC8342Rh9NvLwTtD10rCbK4x/xi0W
         LNxz+3VsMmaf21D+IUMUwl7GgS3Fx/gd/YArC8/LD2NSN+2cgkaMNbWGi9u3ADqT68Mk
         Lp3DFziZ7u4AeNA96OPCyTP9w/wbWZH8FQk3p5ga5yveE96lVbz6ql92jOmimFxI6hfc
         Ti4M0g907pt7iV+0NAh8FFuOyGGPPMkhHFv4n8sIPs+pZVeQB7LLG1R+ol8LVCUtPQTv
         iqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUweFfgJwfVgsfSBOZz2h4Gy6NtNSpksO4FveOgqwMWSzNSauhqWdPNutZ6zDgF9jfl8vrNdTzYLQXO2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3yFqpo18zVSuXrvxYomitzAJIHunTKcCHI/73yGwS6yNlnO7I
	XT78XcRkFiVO+SZYdsGaJM0h2lCKRdnOsHAR0ndWMSLoSQXDUWBbOaLQSxtftJyVoCw=
X-Gm-Gg: ASbGncvn0gBnraUZzh5w1EkgrgiwbSxJjvcCmgzjqCPnx9AbhZNOhp56KdGcpD/GMbs
	V2sNvYGv4mZY5lRfbFhTgokvzleG0lJEAaco028AEqUXYWyuow56a/nqshorVHbTpyMUkNM/rm1
	UpBT/AD49PvddUU0AHWt8uflbq0ru2NxphKoaojfsSJQymZbmYB2wqumigDVq/WviIr0YHCO+D5
	uKnj5AkDY25DSJygiNtlAVjVTPrpmnupP8EZMjoAWVlyCRaLZdL1qQwKKuKViFlc5Ne52i8/hIU
	xDVQ4A3zzUIcatKU0iuxZt+CCG4rdl1qQmthR7tkjNdW7SEV0VS+ABuc7UJteHbnnE6wCk0LzUI
	rymfr4rtTwe/EjVJ3cB2b3BiV56zIxJcY0sE=
X-Google-Smtp-Source: AGHT+IHDtikB0oMUAvmWbAoxLBUqg4pB9xk/P6eVhjckLobTee+bJmH7aBt6iZAeNjzgw6e4ZS5Fcg==
X-Received: by 2002:a05:6214:2e43:b0:6fb:6114:1034 with SMTP id 6a1803df08f44-700131c4812mr68071916d6.39.1751034192321;
        Fri, 27 Jun 2025 07:23:12 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:11 -0700 (PDT)
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
Subject: [PATCH v6 0/8] spacemit: introduce P1 PMIC support
Date: Fri, 27 Jun 2025 09:22:59 -0500
Message-ID: <20250627142309.1444135-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_072314_118625_F3543E72 
X-CRM114-Status: GOOD (  14.79  )
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

This version adds a new patch to change the simple MFD driver as
suggested by Lee Jones.  Rather than specifying a full regmap config
for each simple MFD, specify the max_register value desired in the
simple_mfd_data structure.  That supports all existing devices (which
don't use the regmap_config option), as well as the SpacemiT P1
(which specifies the max_register).

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v6

Between version 5 and version 6:
  - Added Rob Herring's reviewed-by to patch 1
  - Add the simple MFD functionality suggested by Lee Jones
  - Update patch 3 (previously 2) accordingly

Here is version 5 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

Between version 4 and version 5:
  - Only check the seconds register for change when looping on read
  - Return without re-enabling the RTC if writing registers fails
  - If the RTC is disabled when reading, return an error

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250625164119.1068842-1-elder@riscstar.com/

More complete history is available at that link.

Alex Elder (8):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: specify max_register
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
 drivers/mfd/simple-mfd-i2c.c                  |  30 ++--
 drivers/mfd/simple-mfd-i2c.h                  |   2 +-
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-spacemit-p1.c                 | 167 ++++++++++++++++++
 13 files changed, 620 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c


base-commit: 2aeda9592360c200085898a258c4754bfe879921
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
