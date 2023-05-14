Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4BCC77B7F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 21:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cryksPbbLvqmjmJkGsC7RJHjdYZCLo+H+xWTywfoMcU=; b=ksC+oCDVvBuI2q
	bwwb3wtsdv0kQmPJnLOPIhKdEv5ZM8FEn2W2wC5OvyQU731Hd2y4gB9yp8xOwE2RzTMeY23xwRNX8
	iFI4fflerpks25Q8jwhRD26bLXtxkEKtRqNi+uF2becHWbtfpqTelGVZOnf/DGwOMWqnl4QdI4PYH
	14sHlJmx7U9grWs8Tz7DwafysC2qIBkEVBif5L65yUJEkhuug2zXC7qhXT8g8hFJVgpQfBMvz66Z1
	WWzvo8ZhpAZ9YQCNRWM48u+ja1z6mJ5aaql136IEnuaCi4geqLeqBEoCR/LRCA9WlA/ROBIXUsuQv
	y/sQSEdrWq6wXgQWoFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyJYa-000JO0-25;
	Sun, 14 May 2023 21:47:08 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyJYS-000JLv-1q
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 21:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Le/EDFx24rD9UDUsnqI9SxJ9Hh1UhhshlO7B1XJaioE=; b=O5HpHVhGQsxuePlD8N1aIBPW9l
	XWTN4LRjYLi4I7HVM06cfSX7UvoPTvI8tyVVnwIk5yrYs4bia0UcvjQPMPg937Kat8fkcM/ZkZrE7
	gymTZ6OXc7j/874dsbvVTwCTl2/gg8HdgbOcxNGgnWKk3Vr54le6KLJoZcbxYMN7TntPJV1Jsfo8l
	bO1/EOXwNRu6rI507iXCIrUwEhFX9ZID973uB509beemwmfQSFP/uv8VpBChFjTiTFgsasb7t+uXU
	IAJBRzj6FuBYzGXgt4X7ydhk+QtuFjXhUu1/qN01Bv/0HolOW0iidrBB8TmREmglipTebV9T1TqPa
	caU+v1dQ==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1pyJYG-00Ajbr-Sb; Sun, 14 May 2023 23:46:49 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1pyJYG-00AqI7-21;
	Sun, 14 May 2023 23:46:48 +0200
Date: Sun, 14 May 2023 23:46:48 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 06/10] clk: starfive: Add StarFive JH7110 Video-Output
 clock driver
Message-ID: <ZGFWyPbeEOxxqwQK@aurel32.net>
Mail-Followup-To: Xingyu Wu <xingyu.wu@starfivetech.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
References: <20230424135409.6648-1-xingyu.wu@starfivetech.com>
 <20230424135409.6648-7-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424135409.6648-7-xingyu.wu@starfivetech.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_144701_665961_E6A5C7FA 
X-CRM114-Status: UNSURE (   9.90  )
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

On 2023-04-24 21:54, Xingyu Wu wrote:
> Add driver for the StarFive JH7110 Video-Output clock controller.
> And these clock controllers should power on and enable the clocks from
> SYSCRG first before registering.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

There seems to be something wrong with this patch. Building the kernel
with the whole series applied and with CONFIG_FORTIFY_SOURCE=y triggers
the following kernel bug: 

[   75.705103] detected buffer overflow in __fortify_strlen
[   75.710497] ------------[ cut here ]------------
[   75.715117] kernel BUG at lib/string_helpers.c:1027!
[   75.720083] Kernel BUG [#1]
[   75.722879] Modules linked in: clk_starfive_jh7110_vout(+) nvme_fabrics binfmt_misc starfive_wdt jh7110_trng watchdog sfctemp rng_core drm loop fuse drm_panel_orientation_quirks configfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 dm_mod nvme nvme_core t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_generic crct10dif_common xhci_pci xhci_hcd mmc_block dwmac_starfive stmmac_platform stmmac usbcore pcs_xpcs of_mdio fixed_phy fwnode_mdio phylink libphy usb_common dw_mmc_starfive dw_mmc_pltfm clk_starfive_jh7110_isp dw_mmc clk_starfive_jh7110_aon ptp phy_starfive_dphy_rx mmc_core pps_core phy_jh7110_pcie i2c_designware_platform clk_starfive_jh7110_stg phy_jh7110_usb i2c_designware_core
[   75.785411] CPU: 1 PID: 419 Comm: insmod Not tainted 6.3.1+ #1
[   75.791241] Hardware name: StarFive VisionFive 2 v1.2A (DT)
[   75.796809] epc : fortify_panic+0x1a/0x1c
[   75.800828]  ra : fortify_panic+0x1a/0x1c
[   75.804838] epc : ffffffff80874242 ra : ffffffff80874242 sp : ffffffc80454b6a0
[   75.812054]  gp : ffffffff8157f008 tp : ffffffd8c1214f80 t0 : 6465746365746564
[   75.819269]  t1 : 0000000000000064 t2 : 2064657463657465 s0 : ffffffc80454b6b0
[   75.826483]  s1 : 0000000000000020 a0 : 000000000000002c a1 : ffffffd8fdd63688
[   75.833697]  a2 : ffffffd8fdd6f8e8 a3 : 0000000000000000 a4 : 0000000000000000
[   75.840912]  a5 : 0000000000000000 a6 : ffffffff81426a38 a7 : 0000000000000000
[   75.848126]  s2 : ffffffff80ec4e00 s3 : ffffffd8d9e28008 s4 : 000000000000001f
[   75.855340]  s5 : 0000000000000000 s6 : ffffffff81580798 s7 : 0000000000ffffff
[   75.862555]  s8 : ffffffd8d9e29ab0 s9 : 0000000000000011 s10: ffffffff017312a0
[   75.869770]  s11: ffffffff01731450 t3 : ffffffff81592df7 t4 : ffffffff81592df7
[   75.876984]  t5 : ffffffff81592df8 t6 : ffffffc80454b4a8
[   75.882290] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
[   75.890199] [<ffffffff80874242>] fortify_panic+0x1a/0x1c
[   75.895513] [<ffffffff805c7e20>] auxiliary_match_id+0x70/0xcc
[   75.901262] [<ffffffff805c7f22>] auxiliary_match+0x1e/0x2a
[   75.906749] [<ffffffff805bd6b0>] __device_attach_driver+0x2c/0xe4
[   75.912841] [<ffffffff805bb04e>] bus_for_each_drv+0x70/0xc4
[   75.918418] [<ffffffff805bdb0a>] __device_attach+0x94/0x198
[   75.923989] [<ffffffff805bde68>] device_initial_probe+0x1a/0x22
[   75.929908] [<ffffffff805bc146>] bus_probe_device+0x96/0x98
[   75.935482] [<ffffffff805b971e>] device_add+0x56a/0x722
[   75.940710] [<ffffffff805c7fc4>] __auxiliary_device_add+0x40/0x92
[   75.946803] [<ffffffff80556ff4>] jh7110_reset_controller_register+0x92/0xca
[   75.953765] [<ffffffff0173034c>] jh7110_voutcrg_probe+0x236/0x2fa [clk_starfive_jh7110_vout]
[   75.962228] [<ffffffff805bfb40>] platform_probe+0x5e/0xa6
[   75.967629] [<ffffffff805bd1e6>] really_probe+0xa0/0x342
[   75.972940] [<ffffffff805bd508>] __driver_probe_device+0x80/0x138
[   75.979031] [<ffffffff805bd5f8>] driver_probe_device+0x38/0xc4
[   75.984863] [<ffffffff805bd83a>] __driver_attach+0xd2/0x1a8
[   75.990436] [<ffffffff805baf92>] bus_for_each_dev+0x6c/0xb8
[   75.996011] [<ffffffff805bcab6>] driver_attach+0x26/0x2e
[   76.001325] [<ffffffff805bc384>] bus_add_driver+0x10c/0x1ee
[   76.006900] [<ffffffff805be5e2>] driver_register+0x52/0xf4
[   76.012386] [<ffffffff805bf78e>] __platform_driver_register+0x28/0x30
[   76.018827] [<ffffffff01b72028>] jh7110_voutcrg_driver_init+0x28/0x1000 [clk_starfive_jh7110_vout]
[   76.027802] [<ffffffff8000281a>] do_one_initcall+0x5c/0x1c8
[   76.033377] [<ffffffff800a7612>] do_init_module+0x4c/0x1f6
[   76.038867] [<ffffffff800a9396>] load_module+0x1a6c/0x1ebe
[   76.044356] [<ffffffff800a99ea>] __do_sys_finit_module+0x9c/0xf8
[   76.050365] [<ffffffff800a9a82>] sys_finit_module+0x1c/0x24
[   76.055936] [<ffffffff80003df8>] ret_from_syscall+0x0/0x2
[   76.061343] Code: 0800 85aa 3517 007a 0513 7ee5 a097 ffff 80e7 fc20 (9002) 7179 
[   76.068735] ---[ end trace 0000000000000000 ]---

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
