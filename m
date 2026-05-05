Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C9CCD3439
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TF5YbmeFgGFInBLBAyATludaXry17JTtMNoeZgzMDEY=; b=XvsowXymZbbvnV
	ecGdENrnxZv53rPyo4xk1/SDv/iy3uZmKC5HFiPW0XOhZpOByN3cxnY2zmjjVo3Dwa46azxIrGut1
	KPdafSBgMhsVXEoUigX8ZamH+13NFnPOjhsdhj8o4Gc08oCWTrusJLMaiWdyGtR+I+ZzF9ywgwpzO
	RR4SmKkksEl9FBqYFOI8JGlfLJjbRKZWd5JnpqL/Y8KNsOEGZY7pGpiCtAgIsBdlkbvYUbLw+bWHj
	A4EtOZEig9VYRwuYrc07bsNrUNXVs6q+5xKMO8Z1f1kutzLaaJDQj9nG9YkTq77vXK+7y3iNKfNDr
	VAT/h0z7HhpglDUPUmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII2-0000000GmHR-1E4j;
	Tue, 05 May 2026 16:06:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIHz-0000000GmFw-3Lgf
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:06:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-44a5174670eso2286062f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997185; x=1778601985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hV0+0zVBNNCjKEt7Ft390V3lS17ubfm/vB5GKRklvSI=;
        b=sgYOMzVqBAN6CpbbkvKKeP2ftIm0p1RTs0VjV6PwyV+wywipKmq68qqlSYO53sHv3u
         /Okc1IL9ma2la0cLD76xeNTMi1cffX6u7pzQSC63n+ETO+H7FhGu2G9K9N+QcIyiLUdz
         aNn86aPByU8dkRrkAZydzxxm7r8ts2vizD+NxLw/ifY7TWWHPbOV3njcS58tlWgQi8hr
         E+Bb+lxtv81agoci5EkVpnuXkBvlYnWwGSWceZGANWxTZ9QUrWHeePIktguBFDL9bvp2
         F6PIoDaWuv5Uw+wr3oDXbNZTdmlfSl1knXracBbGUBOYwlDHDhb3DKuxm6PzXQlQ7MYX
         fcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997185; x=1778601985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV0+0zVBNNCjKEt7Ft390V3lS17ubfm/vB5GKRklvSI=;
        b=UTm8aVd5a3w60eDXgprfVUYUdmFZF8GNnuEWWWYoaTkg577vcw9TYaChodWTW6nsxO
         nfsoyzbr+kUTB9Eqe1xH7Rwaivlz+BERkgP8D2kSuqfqqa1JBh56ugMDrjGC780wRFSQ
         35Jn5MbILkjYj8RHZ7V3O1prH6ZlWDMFXLK3gEjycLiWmWAv0aagG7GD6P/qi5AXyZPH
         1hpmPmM3ZGDamc2R30U57tRhrUJQr4LYqgul2Saymmqby5JXVT80rH+ENumIWV53+kHS
         ZVfSNSuh3JZGNqMK7API/QlrCgdJhZAR8nyOAdumWJekFUQUr8097WIo5ASifgPWa+kJ
         ItTg==
X-Gm-Message-State: AOJu0YxoNo2wBPbkh3twEhxKTDqhJ1s9Otr4mYv98UGbpNRz7NDjBRl8
	bWSJUDbYXK+TG3aOiXyEnVyt80LyUQbN7SRumSkuFTe7aAx3rqbqxO2/
X-Gm-Gg: AeBDieutQEjwLT8kNhsj0d75NxgyO4uUx4oTSk82rQMMyrgqDuWqsrd8PU9VDX7nOuP
	w5Y9ZeqGVzoAGG2sHMBwU47ox/i2jgHeYF+2fRfy2Ua3N//swTkWBlsPnaJzI7OQeG9nKbLxMsO
	EWQSNx9hIv1FWnxFV+SUq6u3U/xdw93xfdFu4KUwxS/Suhc8cs0aFBZgaYVl+xLv9SCHJ8B7DPf
	HMEhz7mYAKqa1xFtOM6l+pLmrBPLNFHfCIiGsmg6MHRS8h0eKLesEnc7V9NXO3TdcSSx4hSyDP4
	WwHOjkzmLJJHyDCdYRZ1Z2TBiJ8pwv9lHTqsr9w7uTX4usMw906bRFPZOZBtNm0VV+2VTWMNItf
	/a85gDoi89Pwnvaz2CNqo9IrgNnJ3DFoc32uCqgb7giWA5pjLfR2b6RbYaWpeI347P9iNpAlWze
	3YCn/VMT9pGBQnkZ0sNz12zdNzN+fxNVTr28emiUorSwQKp7ZTEgk09UDN5GeP7eRm5cSF2Z/eP
	fX02bU=
X-Received: by 2002:a05:6000:2489:b0:43e:a9ba:b194 with SMTP id ffacd0b85a97d-44bb5c43349mr26253545f8f.34.1777997185280;
        Tue, 05 May 2026 09:06:25 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:24 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/6] spacemit: k1-musepi-pro: add missing devices
Date: Tue,  5 May 2026 18:06:14 +0200
Message-ID: <20260505160623.1369347-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090627_852717_64BDF9E1 
X-CRM114-Status: UNSURE (   5.50  )
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

[0] https://github.com/spacemit-com/docs-product/blob/main/en/k1_muse_pi_pro/pi_pro_hw.md

root@OpenWrt:~# cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
 USBVBUS                          4    3      0 unknown 12000mV     0mA 12000mV 12000mV
    PCIE_VCC3V3                   2    1      0 unknown  3300mV     0mA  3300mV  3300mV
       ca400000.pcie-vpcie3v3     1                                 0mA     0mV     0mV
    MPCIE_VCC3V3                  2    1      0 unknown  3300mV     0mA  3300mV  3300mV
       ca800000.pcie-vpcie3v3     1                                 0mA     0mV     0mV
    VCC5V0_SYS                    9   12      0 unknown  5000mV     0mA  5000mV  5000mV
       buck1                      1    0      0 unknown  1050mV     0mA   500mV  3450mV
       buck2                      1    0      0 unknown   900mV     0mA   500mV  3450mV
       buck3                      1    1      0 unknown  1800mV     0mA   500mV  1800mV
          2-0050-vcc              0                                 0mA     0mV     0mV
       buck4                      2    1      0 unknown  3300mV     0mA   500mV  3300mV
          spi0.0-vcc              1                                 0mA     0mV     0mV
       buck5                      3    7      0 unknown  2100mV     0mA   500mV  3450mV
          dldo1                   0    0      0 unknown  1200mV     0mA   500mV  3400mV
          dldo2                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo3                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo4                   1    0      0 unknown  1800mV     0mA   500mV  3400mV
          dldo5                   0    0      0 unknown   500mV     0mA   500mV  3400mV
          dldo6                   1    0      0 unknown  1800mV     0mA   500mV  3400mV
          dldo7                   0    0      0 unknown   500mV     0mA   500mV  3400mV
       buck6                      1    0      0 unknown  1100mV     0mA   500mV  3450mV
       aldo1                      0    0      0 unknown  3300mV     0mA   500mV  3400mV
       aldo2                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       aldo3                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       aldo4                      0    0      0 unknown   500mV     0mA   500mV  3400mV
       VCC5V0_HUB                 2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb:hub@1-vdd   1                                 0mA     0mV     0mV
       5V_VBUS                    2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb-vbus       1                                 0mA     0mV     0mV

Thanks,
Andre

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
