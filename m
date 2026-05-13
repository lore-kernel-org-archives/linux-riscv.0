Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB35CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lq5KbPRkLsG0Fkl1NFOZLdIZ4lFLJ/rx+m+1dkjWNI4=; b=wPROtzWnWM2hKy
	Y500GvYNqFmgTVpTvbhGSLuKLqpv6iUOoJFOaYVQ6AMFHN/wIijG0O4K4uROLUheoOh4SzyviBTGs
	9Z2zkNbItG6XmwdMq4fUJUNc/VIX0nB2OoXYKYajBqPhW/IxSFcFZ7gZ1/Nfh/3qe2cuyjN03Kq02
	kVHJzGnHRRcVSQa5w8lGVw97HanAPDfOK5AKONdNHRF7LhXV0gVby8rXvbPTT8ykgjo3+mQ504iRC
	VhO5Jw5BHv9FIYBJ/qzN7uoZU9B1QclqGMYOx0auPg1NcH1kDAcPJGMgCY+bhSMqSLh/Vj4J6+u9q
	/Y3DMYHgrajFlxGawCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Iw-00000001d3e-0Duv;
	Wed, 13 May 2026 07:46:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Ir-00000001d1i-0zMP
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:46:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6895960128;
	Wed, 13 May 2026 07:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5F1C2BCB7;
	Wed, 13 May 2026 07:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778658408;
	bh=okQCgt6yxURc/y97vTYFaSc8Vj718GsG1uHahX3Yywg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJ0lNdoc+0TRBSMlrJ/StV1MeP1FeShPal37k87Wj/7mZ8+0d/ZEfC/C8KhUr7FBH
	 1948BZbOsoq4bycnwljWIlE+PoP5X9Wmb+UlAMbvDhAerPkB86xzpIKSGQZnUFxOgF
	 9G+T982Fn50PRmF3/ZSFWw+TIvKXM6dRjtkitDv364y+tWb3/we+chaFaMe9RKzEN9
	 KhNM8M+AbqLCT7uILxpnNzoxA85PifrVx1ZC5Tqvo9KmHIowE7N/FH3TIbwhoYB9+N
	 Ya4PhbbgedFAYrYEZCOq61p1jlP/G1Fwk4BUNQrfEF0ZnkEGM5M7i8eQFNHxuaLq/A
	 F9UmtjJOKEANw==
Date: Wed, 13 May 2026 07:46:44 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/6] spacemit: k1-musepi-pro: add missing devices
Message-ID: <20260513074644-GKA3624092@kernel.org>
References: <20260513071958.29574-1-a.heider@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
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

Andre,
 
 Thanks for pushing this new version, overall, this series looks good to me,
Although there are few quite trivial issues, which I could help to fix it while
applying, let's give community some time to test and review..

 P.S I haven't run it on musepi board, but trust you tested all functions..

On 09:19 Wed 13 May     , Andre Heider wrote:
> Add the missing devices with their required regulators. The regulators are named after
> their label in the vendor schematics[0].
> 
> v3:
> - drop reg_usb_vbus, non-controllable and served only as vin-supply
> - fixed regulator-vcc-4v0 typo
> - fold addition of pmic regulator labels into the pmic patch
> - eeprom is a GT24C02B, fixed commit message
> - added reg_qspi_vcc1v833
> - fixed uboot nor name offset
> - add missing "reg_" prefix for reg_pcie_vcc_3v3
> - drop pcie{1,2}'s vpcie3v3-supply, it's already specified on the root ports
> 
> v2:
> - drop reg_vcc_5v0_sys as per "non-controllable" review comments on
>   similar patches for other boards (kept the root reg_usb_vbus for though)
> - add reg_vcc_4v0 instead as p1 vin?-supply, misread the schematics
> - drop mpcie_vcc_3v3 and use pcie_vcc_3v3 for pcie2* too
>   ("non-controllable" again)
> - all of the above makes it consistent with other k1 boards
> 
> v1: https://lore.kernel.org/spacemit/20260505160623.1369347-1-a.heider@gmail.com/T/#t
> 
> $ cat /sys/kernel/debug/regulator/regulator_summary
>  regulator                      use open bypass  opmode voltage current     min     max
> ---------------------------------------------------------------------------------------
>  regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
>  PCIE_VCC3V3                      5    4      0 unknown  3300mV     0mA  3300mV  3300mV
>     ca400000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
>     ca800000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
>     ca800000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
>     ca400000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
>  VCC4V0                           8   10      0 unknown  4000mV     0mA  4000mV  4000mV
>     buck1                         1    0      0 unknown  1050mV     0mA   500mV  3450mV
>     buck2                         1    0      0 unknown   900mV     0mA   500mV  3450mV
>     buck3                         1    1      0 unknown  1800mV     0mA   500mV  1800mV
>        2-0050-vcc                 0                                 0mA     0mV     0mV
>     buck4                         2    2      0 unknown  3300mV     0mA   500mV  3300mV
>        d4280000.mmc-vmmc          0                                 0mA  3300mV  3300mV
>        QSPI_VCC1833               2    1      0 unknown  1833mV     0mA  1833mV  1833mV
>           spi0.0-vcc              1                                 0mA     0mV     0mV
>     buck5                         3    7      0 unknown  2100mV     0mA   500mV  3450mV
>        dldo1                      0    0      0 unknown  1200mV     0mA   500mV  3400mV
>        dldo2                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>        dldo3                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>        dldo4                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
>        dldo5                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>        dldo6                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
>        dldo7                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>     buck6                         1    0      0 unknown  1100mV     0mA   500mV  3450mV
>     aldo1                         1    1      0 unknown  3300mV     0mA   500mV  3400mV
>        d4280000.mmc-vqmmc         1                                 0mA     0mV     0mV
>     aldo2                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>     aldo3                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>     aldo4                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>  5V_VBUS                          2    1      0 unknown  5000mV     0mA  5000mV  5000mV
>     c0a00000.usb-vbus             1                                 0mA     0mV     0mV
>  VCC5V0_HUB                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
>     c0a00000.usb:hub@1-vdd        1                                 0mA     0mV     0mV
> 
> [0] https://github.com/spacemit-com/docs-product/blob/main/en/k1_muse_pi_pro/pi_pro_hw.md
> 
> Andre Heider (6):
>   riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
>   riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
>   riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
>   riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
>   riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
>   riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
> 
>  .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 309 +++++++++++++++++-
>  1 file changed, 308 insertions(+), 1 deletion(-)
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
