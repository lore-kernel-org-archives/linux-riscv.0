Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE19CD4842
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7wnlmLjyoGxz9CZiE8Gne1bvSqxsmoBdWAT2kD7Um7s=; b=cNFl3LFhaFjqkV
	gq0eQaTeAuaMeSvMp5fa7IdCTdfkXM57OFiWasQGHFvftxUNRGzisSdpUs4u1ucS0KJvQYDLMt6Z0
	dNkDNFMuBlMen811/nSjMIkxWmRWT3BuuCDPjY8ACOrFLz53Rnr6hG5B4g4htqqPdW54l/2ABnWfG
	gkoz2olWiU9dHLjTUM4vNyBTw57ubTmahsGUrWVhbw1c+UY5fvsqmC3opo6aEpupvb09fx/HINDUp
	Wb2F39Bx8DIGqo40Z0rEag/m8MX73bRzrjJbFEMiS5Ffw52VWlQ4tX2P8Nv8LOYZysIy6zZWMXyXb
	Q2lSOC7DGxdId4vs4ltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXl-0000000DEv0-3F0S;
	Mon, 11 May 2026 11:11:26 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXi-0000000DEpF-2gFl
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 11:11:24 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso38115125e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497879; x=1779102679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0C1bHVka4WkqxKLcjiVrRtNUHdq3msbMLuP2fSIT1mk=;
        b=W+01UIXk9m4NDw5T6jZ+xbhZs5EFnIPvRk6joRmKMBjFkw9IgdorQ13ILD16V/hZeg
         XCECORkFkhUiJEZY5SBnTkagrsGSOII1DLa1iEnRX8x1OkhMr3ZiPo0goFR5k7M2++Ut
         QgLb6T+vinFkRXvJRX0Z1SQ4fIDJxsz6YQl8wC/s9wYVaIYXf7AxaTrmP6/l8ye4QSVH
         4zwEoCjdWpaUzr2w+df2ZH82zFxZdkIWOEpZcULCDhq5aS1rojxPHifc2J9E2YPy8VzA
         cMzopKmRKeDWlSd8shKGUEPezgkvzJaad6zC8y2jiYAyLnNbjuZ3PQ8KnDNKsog3+kz/
         PuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497879; x=1779102679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C1bHVka4WkqxKLcjiVrRtNUHdq3msbMLuP2fSIT1mk=;
        b=BZtmpMwxHDxiKz175BsQ+IOIKQJWGtr5SJFvDdxGrqtmJIntmJROUt9iXwiqI5OvQ4
         vAcuSR5zh0GKWINRIq0haitHPBMKVtG0EJj8dsT+fGZqvjGbotwGJq9KIOCpqtrDoT3T
         l3uAY5ep4+jlK9tWvqx+2PPYdmRh9Wm7z9W/YbcN3pDqQChaSZFEoOwDMtWeqE4rF7/6
         NqzginGxJ6WifUCwTPxn5KyKMKDJrot+kB5Nw0zV+iHGNejYidQPoZ/9Sop8goDiVW9C
         YsxX0VVgHllHi//CE2mVfwouIC/VGkGKDqpLZENQq2B+opSuMldp5ipFEvqw6g8ObLnY
         61ZA==
X-Gm-Message-State: AOJu0YyYOqkapqaM/8mPlURBnAGhqMDv2veVP+nqCmRsK89Diz2slx2g
	CXDsaP1Db5/ecWpF9jNHRALvD1UZ3OhkDHUJ1/lC1pzpj7ndKA5sayk3
X-Gm-Gg: Acq92OHFc5IaZCByOTbQ8yeZZVOc/PinoHB3WQ6S6yeSB4YHCGkMSH6R0kry7kXxf04
	sRiZSaqAdeIOC5q6BKgYdkDaEyF3YRGEZdtzMd9GftWzlOlCZRYi2tD75oCUeJIMZlt0xlugQCE
	i4Okiwg8CsqRNtOt3puOk7aYpodgLLySInCBxJQglqF57Ul/LMh7bhovfthlokhbrjhRO+mYX08
	i+qFkAu6t57kxt8sWT92+VMT5bfkTtd1t16nlOmkNc6FhsABTDfbRvJPKdTQo4Wa8SoaXaDEa0j
	OG7XbtRqQCJm+l9V5jDxVUzs01SDba1BSlAOtFgH0DpbcBh3SuXD6d1WDS3i2OaGU/+V1oj04zO
	xYQGd4WGvjXWRKTq70Y0DweaJUJchePNSnrI2yng973hDaD/evngn97isu6LXnfqY9mFEHf7tmu
	P5MlyH9l4HF7QmfRttHtCtaGHEzC+PByh+sW0dWiSZhClqa+Mq+JCF4DGy6e6Q+Tv0Ng==
X-Received: by 2002:a05:600c:8b65:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48e51f4e5fdmr424568565e9.28.1778497878900;
        Mon, 11 May 2026 04:11:18 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:18 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 0/6] spacemit: k1-musepi-pro: add missing devices
Date: Mon, 11 May 2026 13:11:07 +0200
Message-ID: <20260511111116.1109643-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041122_701166_2B6EFE94 
X-CRM114-Status: UNSURE (   5.97  )
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

Add the missing devices with their required regulators. The regulators are named after
their label in the vendor schematics[0].

v2:
- drop reg_vcc_5v0_sys as per "non-controllable" review comments on
  similar patches for other boards (kept the root reg_usb_vbus for though)
- add reg_vcc_4v0 instead as p1 vin?-supply, misread the schematics
- drop mpcie_vcc_3v3 and use pcie_vcc_3v3 for pcie2* too
  ("non-controllable" again)
- all of the above makes it consistent with other k1 boards

v1: https://lore.kernel.org/spacemit/20260505160623.1369347-1-a.heider@gmail.com/T/#t

root@OpenWrt:~# cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
 USBVBUS                          5    4      0 unknown 12000mV     0mA 12000mV 12000mV
    PCIE_VCC3V3                   5    4      0 unknown  3300mV     0mA  3300mV  3300mV
       ca400000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
       ca800000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
       ca400000.pcie-vpcie3v3     1                                 0mA     0mV     0mV
       ca800000.pcie-vpcie3v3     1                                 0mA     0mV     0mV
    VCC4V0                        8   10      0 unknown  4000mV     0mA  4000mV  4000mV
       buck1                      1    0      0 unknown  1050mV     0mA   500mV  3450mV
       buck2                      1    0      0 unknown   900mV     0mA   500mV  3450mV
       buck3                      1    1      0 unknown  1800mV     0mA   500mV  1800mV
          2-0050-vcc              0                                 0mA     0mV     0mV
       buck4                      2    2      0 unknown  3300mV     0mA   500mV  3300mV
          spi0.0-vcc              1                                 0mA     0mV     0mV
          d4280000.mmc-vmmc       0                                 0mA  3300mV  3300mV
       buck5                      3    7      0 unknown  2100mV     0mA   500mV  3450mV
          dldo1                   0    0      0 unknown  1200mV     0mA   500mV  3400mV
          dldo2                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo3                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo4                   1    0      0 unknown  1800mV     0mA   500mV  3400mV
          dldo5                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo6                   1    0      0 unknown  1800mV     0mA   500mV  3400mV
          dldo7                   0    0      0 unknown   500mV     0mA   500mV  3400mV
       buck6                      1    0      0 unknown  1100mV     0mA   500mV  3450mV
       aldo1                      1    1      0 unknown  3300mV     0mA   500mV  3400mV
          d4280000.mmc-vqmmc      1                                 0mA     0mV     0mV
       aldo2                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       aldo3                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       aldo4                      0    0      0 unknown   500mV     0mA   500mV  3400mV
    5V_VBUS                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
       c0a00000.usb-vbus          1                                 0mA     0mV     0mV
    VCC5V0_HUB                    2    1      0 unknown  5000mV     0mA  5000mV  5000mV
       c0a00000.usb:hub@1-vdd     1                                 0mA     0mV     0mV

[0] https://github.com/spacemit-com/docs-product/blob/main/en/k1_muse_pi_pro/pi_pro_hw.md

Andre Heider (6):
  riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
  riscv: dts: spacemit: k1-musepi-pro: add 24c04 eeprom
  riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
  riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
  riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
  riscv: dts: spacemit: k1-musepi-pro: set default console baud rate

 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 324 +++++++++++++++++-
 1 file changed, 323 insertions(+), 1 deletion(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
