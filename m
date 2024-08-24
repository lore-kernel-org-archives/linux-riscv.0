Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CAEC52D6F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Aug 2024 20:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CkfbXd3xmZz17D1bRYtiTvUWN9FMeze8vpMYeVd9eG8=; b=oP4xO8G4plEEv4
	Sykg5y1Gq15v2ZpY5xSGu3JUKQxOAn3uCRE8G592G68Rry6Mo6SLrhnCzPGkIZHHl+/m+bKkne8cs
	gUXKIGmt5fNLJtU1kKP+RAVywW3naAFAKtsBwYgG0ezfenbwa3P6+SRw3zPK2AJfE/EUvDFmhugH+
	HRMfmty5yyaFeE/5l0dcZKOotnGgEpRQoM4LToBKsP7zg2lTo0W2ncww+KIqnV7nFl8ILUBJ6z/hk
	6WFvUIJh9BT/Nu1p6I6Hr2oVTCjPxKW3AWJhWmc0Qalf/ZgxuZFaM0k6oQQOs+y1vMJ9aFPdQVY3w
	UWkr7uz+AAEaxujAjxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shxT2-00000002suY-1gBf;
	Sat, 24 Aug 2024 20:34:36 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shxSy-00000002ssl-0BCa
	for linux-riscv@lists.infradead.org;
	Sat, 24 Aug 2024 20:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=4nY5++i41dpTSS2mCdP2J5oQwyTFedfkauL833e59jQ=; b=Td3BzZrhq4hX0mgcTctq35mRN9
	L701ZYvwOg9vdtyhQfIKbM4GpkHr5mjbGvyboRMC8JZiXB9UmyfcI7WiODG1TiIjFMQd4BMDF5j3d
	rxEGUEtHxz0hvpcCvp9zxdvTulFxyr/SUpRijPKTgiq8OhJK0skLsxruDc1pETHp2Xn2YcRXUsUw2
	9h4Wndz7xAdXTDmpmLetta7NW/ximrgp3Z5g+m4Z8drRs04LR417TEFDn4BXIaSBtwaBRvAc4+R4O
	5/EzOrcmn3dQlqVrZb8K9Earz7UULxTZ4/gCv2oKFsQY5VuqJp17wEaLmYL71YNLrgdp/8cy2YjNJ
	wGD+AAdg==;
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::2] helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1shxSj-00363Z-0o;
	Sat, 24 Aug 2024 22:34:17 +0200
Date: Sat, 24 Aug 2024 22:34:16 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	E Shattow <lucent@gmail.com>
Subject: crypto: starfive: kernel oops when unloading jh7110_crypto module
 and loading it again
Message-ID: <ZspDyIZiG8kvXaoS@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240824_133432_565767_FAE8C1F8 
X-CRM114-Status: UNSURE (   6.18  )
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

Hi,

I have been testing the jh7110_crypto module on a VisionFive 1.2a board,
running a 6.11-rc4 kernel. To benchmark the crypto with and without
acceleration, I have unloaded the module, and later on I loaded it
again. Unloading it works fine, but when loading it again, I get the
following kernel oops:

[ 1379.354601] jh7110-crypto 16000000.crypto: will run requests pump with realtime priority
[ 1379.397261] alg: aead: starfive-ccm-aes encryption test failed (wrong result) on test vector 0, cfg="in-place (one sglist)"
[ 1379.408481] alg: self-tests for ccm(aes) using starfive-ccm-aes failed (rc=-22)
[ 1379.408490] ------------[ cut here ]------------
[ 1379.420469] alg: self-tests for ccm(aes) using starfive-ccm-aes failed (rc=-22)
[ 1379.420523] WARNING: CPU: 2 PID: 1402 at crypto/testmgr.c:5908 alg_test+0x5aa/0x5fa
[ 1379.420545] Modules linked in: jh7110_crypto(+) xts twofish_generic twofish_common serpent_generic algif_skcipher af_alg ad7418 binfmt_misc sm3_generic sm3 nls_ascii nls_cp437 vfat fat snd_soc_simple_card sha512_generic snd_soc_simple_card_utils jh7110_pwmdac snd_soc_spdif_tx sd_mod cdns3 snd_soc_core sg udc_core cdns_usb_common roles snd_pcm_dmaengine ccm snd_pcm ofpart ghash_generic gf128mul spi_nor gcm crypto_null cdns3_starfive dw_axi_dmac_platform ctr snd_timer mtd snd starfive_wdt watchdog crypto_engine jh7110_trng soundcore sfctemp cpufreq_dt drm nvme_fabrics configfs drm_panel_orientation_quirks nfnetlink efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 uas usb_storage crc32c_generic scsi_mod scsi_common rtc_ds1307 dm_mod dax xhci_pci xhci_hcd motorcomm nvme nvme_core dwmac_starfive stmmac_platform stmmac usbcore axp20x_regulator axp20x_i2c axp20x mfd_core usb_common regmap_i2c pcs_xpcs dw_mmc_starfive dw_mmc_pltfm mdio_devres of_mdio dw_mmc fixed_phy phylink mmc_core clk_starfive_jh7110_vout
[ 1379.420856]  fwnode_mdio clk_starfive_jh7110_isp libphy phy_jh7110_dphy_rx clk_starfive_jh7110_aon spi_cadence_quadspi clk_starfive_jh7110_stg i2c_designware_platform phy_jh7110_usb i2c_designware_core phy_jh7110_pcie [last unloaded: jh7110_crypto]
[ 1379.420903] CPU: 2 UID: 0 PID: 1402 Comm: cryptomgr_test Not tainted 6.11-rc4+unreleased-riscv64 #1  Debian 6.11~rc4-1~exp3
[ 1379.420915] Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2024.01+dfsg-3 01/01/2024
[ 1379.420921] epc : alg_test+0x5aa/0x5fa
[ 1379.420930]  ra : alg_test+0x5aa/0x5fa
[ 1379.420938] epc : ffffffff8045db18 ra : ffffffff8045db18 sp : ffffffc6008dbd60
[ 1379.420945]  gp : ffffffff81ba8980 tp : ffffffd6c3978000 t0 : ffffffff81a30570
[ 1379.420951]  t1 : ffffffffffffffff t2 : 2d2d2d2d2d2d2d2d s0 : ffffffc6008dbe80
[ 1379.420958]  s1 : ffffffffffffffff a0 : 0000000000000043 a1 : ffffffff81a95888
[ 1379.420964]  a2 : 0000000200000022 a3 : ffffffff81c1d158 a4 : 0000000000000000
[ 1379.420971]  a5 : 0000000000000000 a6 : 0000000000000001 a7 : 0000000000057fa8
[ 1379.420976]  s2 : ffffffd6d00e0a00 s3 : 0000000000000383 s4 : ffffffd6d00e0a80
[ 1379.420983]  s5 : 000000000000017f s6 : ffffffffffffffea s7 : 0000000000000003
[ 1379.420989]  s8 : 000000000000002f s9 : 00000000000000c0 s10: 00000000000000c0
[ 1379.420995]  s11: ffffffff81063b08 t3 : ffffffff81bbedef t4 : ffffffff81bbedef
[ 1379.421001]  t5 : ffffffff81bbedf0 t6 : ffffffc6008dbb68
[ 1379.421006] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
[ 1379.421013] [<ffffffff8045db18>] alg_test+0x5aa/0x5fa
[ 1379.421024] [<ffffffff8045a026>] cryptomgr_test+0x28/0x4a
[ 1379.421034] [<ffffffff8004906e>] kthread+0xc4/0xe2
[ 1379.421046] [<ffffffff80a1333e>] ret_from_fork+0xe/0x20
[ 1379.421059] ---[ end trace 0000000000000000 ]---

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
