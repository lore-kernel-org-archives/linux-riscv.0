Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DD8CA0FE2
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 02:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zfk0vouS7+xnchrx2qjX5eN6cbxy41WkzZ4aCBzh/iU=; b=ERaRKBzjF25zFi
	M471P3f5OVQX3hTDgrO8qwZT1DfDe0yyoMMy78rGTvzfbGBQxYKLuhsn1ZzjMu1rHEokyY9x0dlgW
	zy2IuMGkPIHSN4wU+1BozSmUaYUHwm8w1UTuTU1eQQ5YbSxIoKKkU9FAkVd0J5RHY1O1Ze8RAowqz
	KOT6poLUX4f0tNZI4F/iwA2Is1myS/a7O2otIX5atPB+dIhHGzmdf2KCPqeJA5Umn7afAUEqujZph
	uyoQT7sWHXY8z1raF7tqrBQbyjMTudEM8oTXInW+4h+ZA17DUReFjfcSroXowv+IirA11EjuSBkHE
	mqMpXYpcwq5ro7e13bMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbu5U-00GLIx-13;
	Fri, 01 Sep 2023 02:40:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbu5Q-00GLHx-2z
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 02:40:42 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 610D324E281;
	Fri,  1 Sep 2023 10:39:53 +0800 (CST)
Received: from EXMBX167.cuchost.com (172.16.6.77) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 1 Sep
 2023 10:39:53 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX167.cuchost.com
 (172.16.6.77) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 1 Sep
 2023 10:39:52 +0800
Received: from EXMBX168.cuchost.com ([fe80::1869:e641:8a12:96d6]) by
 EXMBX168.cuchost.com ([fe80::1869:e641:8a12:96d6%16]) with mapi id
 15.00.1497.044; Fri, 1 Sep 2023 10:39:52 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Aurelien Jarno <aurelien@aurel32.net>, Conor Dooley
	<conor.dooley@microchip.com>
CC: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"kernel@esmil.dk" <kernel@esmil.dk>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "davidlt@rivosinc.com"
	<davidlt@rivosinc.com>
Subject: RE: starfive crypto list_add corruption
Thread-Topic: starfive crypto list_add corruption
Thread-Index: AQHZ2yzjjWDz/x6w9kGlTSbBzWx+s7AEQLcAgAECsiA=
Date: Fri, 1 Sep 2023 02:39:52 +0000
Message-ID: <292c90859f2e4135b40307d61488692c@EXMBX168.cuchost.com>
References: <20230830-track-glutinous-39f536b4ced1@wendy>
 <ZPDlSLQQkYuIVLYJ@aurel32.net>
In-Reply-To: <ZPDlSLQQkYuIVLYJ@aurel32.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [161.142.156.69]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_194041_276719_6437E203 
X-CRM114-Status: GOOD (  16.78  )
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

Hi Aurelian/Conor,

Thanks for bringing this up.

> On 2023-08-30 11:26, Conor Dooley wrote:
> > Hi,
> >
> > There's been a report on the irc fedora-riscv irc of list_add
> > corruption with the starfive crypto stuff:
> > 	list_add corruption. next->prev should be prev (ffffffff02f65320), but
> was ffffffd8eef15848. (next=ffffffd8eef15840).
> > 	------------[ cut here ]------------
> > 	kernel BUG at lib/list_debug.c:29!
> > 	Kernel BUG [#1]
> 
> [snip]
> 
> > I feel like this isn't the first report I saw, but the other might've
> > been for the equivalent driver in the vendor tree & I probably didn't
> > pay any attention to.
> 
> I got this issue, if I remember correctly, I fixed it by enabling
> CONFIG_ARM_AMBA and CONFIG_AMBA_PL08X. It improved things a bit,

Thanks for bringing this up.
I'll submit a patch to fix the Kconfig dependencies.

> but now the driver is still not functional and instead I get this kind of trace
> appearing during the self test of the driver:
> 
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 292 at crypto/api.c:176
> crypto_wait_for_test+0x8e/0x92 Modules linked in: nvme_fabrics ad7418
> binfmt_misc jh7110_tdm snd_soc_core snd_pcm_dmaengine ofpart spi_nor
> snd_pcm starfive_wdt mtd watchdog jh7110_crypto(+) snd_timer
> jh7110_trng crypto_engine rng_core snd soundcore sfctemp cpufreq_dt drm
> loop fuse drm_panel_orientation_quirks configfs ip_tables x_tables autofs4
> ext4 crc32c_generic crc16 mbcache jbd2 rtc_ds1307 dm_mod dax nvme
> xhci_pci nvme_core t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_generic
> crct10dif_common xhci_hcd usbcore axp20x_regulator dwmac_starfive
> stmmac_platform usb_common dw_mmc_starfive dw_mmc_pltfm
> axp20x_i2c axp20x mfd_core regmap_i2c stmmac dw_mmc pcs_xpcs of_mdio
> fixed_phy phylink fwnode_mdio mmc_core libphy clk_starfive_jh7110_vout
> clk_starfive_jh7110_isp clk_starfive_jh7110_aon spi_cadence_quadspi
> i2c_designware_platform clk_starfive_jh7110_stg phy_jh7110_usb
> phy_jh7110_pcie i2c_designware_core
> CPU: 3 PID: 292 Comm: (udev-worker) Not tainted 6.5.0-rc7+ #1 Hardware
> name: StarFive VisionFive 2 v1.2A (DT) epc : crypto_wait_for_test+0x8e/0x92
[...]

I'll investigate this error.

Thanks,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
