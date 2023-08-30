Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C62C6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vBytVCDXjWNjWWke2tH3LMYbMvpSMMxr1Bq3n8tWyts=; b=Ik+
	+0er+EjcaZb0fkYrTcrvPo6uwf0JiRsdG0OKIbjefYRDSvbLBii5bbqfQhJprYpL1IEOqv6tI/eRh
	WVLTS8DlL7MMZ/9STyG251H74D5602SSJOQAkFF//1UGE15WyiYh6K06+Ivw8cIWFHcwO5IMnKgHL
	+rTd3/C4fLGfIBQGZ1ZqxHqqfNZgW3KEnog6SufHxmf19VTgy0MCrMfiYt8uqiYnBsw2ecQG/exNQ
	nRl3TnQPmWJ9jyj+0iCkKQMKG/UFkORSBEs/i3FcJad3cTCdFs1xiimYlGX+fydfNIk5UKjlx0YQu
	jN7oEg6DhZ8L00nWr4xXqUEW2k/SXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbIQW-00DGI8-2L;
	Wed, 30 Aug 2023 10:27:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbIQT-00DGFW-2q
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 10:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693391274; x=1724927274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HP9Iur1Q7Nq1MElrF98R8N/vWYvb9inNU3hcETlvDqs=;
  b=VtmReYz1+0ajgtVkUri+U3R9IjPv80HhoBBHAJrl8e1UWNMo3Pmg7bhy
   uSnM5PNPIQ8JsosVptp2gLhY48JYLlrz9EG5UX7ykob3qoe3EEnmE6FZm
   GgDq7t/S0tsF2fFFy4KYog8niYjIoTgiMdS+xxg9WUkC9BEUx48WAoCTH
   2cauP07Uakv2YPGTM4wY4TrhV5UgKi+KnsJn3U+N780QoFp98plHdJEOt
   ftR0q7ZpNoP51l3q/4BDZWjxR9SYXLM0hdlqTgQ3FSh9ntAeepoPsbHw5
   llzfwe9bSg/F3hf5VO5FvmvxXqUbczhY91TcoV3qHNCpxXhvDSIMlapCP
   w==;
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="asc'?scan'208";a="2012796"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2023 03:27:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 30 Aug 2023 03:27:21 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 30 Aug 2023 03:27:19 -0700
Date: Wed, 30 Aug 2023 11:26:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <jiajie.ho@starfivetech.com>, <huan.feng@starfivetech.com>
CC: <herbert@gondor.apana.org.au>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <conor.dooley@microchip.com>,
	<kernel@esmil.dk>, <linux-riscv@lists.infradead.org>, <davidlt@rivosinc.com>
Subject: starfive crypto list_add corruption
Message-ID: <20230830-track-glutinous-39f536b4ced1@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_032754_110457_38102D95 
X-CRM114-Status: UNSURE (   8.26  )
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
Content-Type: multipart/mixed; boundary="===============2711016157321101742=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2711016157321101742==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DM+rVJfmyKcOsa+w"
Content-Disposition: inline

--DM+rVJfmyKcOsa+w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

There's been a report on the irc fedora-riscv irc of list_add corruption
with the starfive crypto stuff:
	list_add corruption. next->prev should be prev (ffffffff02f65320), but was=
 ffffffd8eef15848. (next=3Dffffffd8eef15840).
	------------[ cut here ]------------
	kernel BUG at lib/list_debug.c:29!
	Kernel BUG [#1]
	Modules linked in: jh7110_crypto spidev pcs_xpcs clk_starfive_jh7110_aon p=
inctrl_starfive_jh7110_aon clk_starfive_jh7110_stg crypto_engine phylink dw=
_mmc_starfive dw_mmc_pltfm clk_starfive_jh7110_vout phy_jh7110_pcie spi_
	pl022 clk_starfive_jh7110_isp dw_mmc phy_jh7110_usb i2c_designware_platfor=
m pinctrl_starfive_jh7110_sys i2c_designware_core sunrpc ip6_tables ip_tabl=
es i2c_dev fuse                                                            =
           =20
	CPU: 2 PID: 53 Comm: kworker/u8:2 Not tainted 6.5.0-next-20230829 #13
	Hardware name: StarFive VisionFive 2 v1.3B (DT)
	Workqueue: events_unbound deferred_probe_work_func
	epc : __list_add_valid_or_report+0x82/0x96
	 ra : __list_add_valid_or_report+0x82/0x96
	epc : ffffffff80640808 ra : ffffffff80640808 sp : ffffffc8002dbb10
	 gp : ffffffff81f9ea48 tp : ffffffd8c0ac3a00 t0 : ffffffff80c8f5fc
	 t1 : 0720072007200720 t2 : 206464615f747369 s0 : ffffffc8002dbb20
	 s1 : ffffffd8ecf11040 a0 : 0000000000000075 a1 : ffffffd8fdd71a48
	 a2 : ffffffd8fdd7e728 a3 : 0000000000000000 a4 : 0000000000000000
	 a5 : 0000000000000000 a6 : ffffffff81fc3818 a7 : 0000000000000034
	 s2 : ffffffd8eef15840 s3 : ffffffff02f65320 s4 : ffffffd8c02a3c10
	 s5 : ffffffd8ecf11178 s6 : ffffffd8ecf11150 s7 : ffffffff02f65250
	 s8 : ffffffff823953d8 s9 : ffffffff8109ba08 s10: ffffffd8c0154000
	 s11: ffffffd8c0b1c540 t3 : ffffffd8c0161f00 t4 : ffffffd8c0161f00
	 t5 : ffffffd8c0161000 t6 : ffffffc8002db918
	status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
	[<ffffffff80640808>] __list_add_valid_or_report+0x82/0x96
	[<ffffffff02df646c>] starfive_cryp_probe+0x1e0/0x4bc [jh7110_crypto]
	[<ffffffff80835062>] platform_probe+0x5e/0xba
	[<ffffffff8083205c>] really_probe+0xa0/0x35a
	[<ffffffff80832398>] __driver_probe_device+0x82/0x140
	[<ffffffff8083248e>] driver_probe_device+0x38/0xb6
	[<ffffffff8083258e>] __device_attach_driver+0x82/0xe4
	[<ffffffff8082fe90>] bus_for_each_drv+0x72/0xc8
	[<ffffffff8083299e>] __device_attach+0x94/0x18a
	[<ffffffff80832c92>] device_initial_probe+0x1a/0x22
	[<ffffffff80830e9a>] bus_probe_device+0x96/0x98
	[<ffffffff80831c6a>] deferred_probe_work_func+0xb2/0x102
	[<ffffffff800542be>] process_one_work+0x18a/0x32a
	[<ffffffff80054fe2>] worker_thread+0x2fc/0x44a
	[<ffffffff8005e3e0>] kthread+0xc4/0xe4
	[<ffffffff80003c12>] ret_from_fork+0xe/0x20
	Code: 9002 86be 1517 0157 0513 b685 1097 0065 80e7 92a0 (9002) 1517=20
	---[ end trace 0000000000000000 ]---
	Kernel panic - not syncing: Fatal exception in interrupt
	SMP: stopping secondary CPUs
	---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

I feel like this isn't the first report I saw, but the other might've
been for the equivalent driver in the vendor tree & I probably didn't
pay any attention to.

Thanks,
Conor.

--DM+rVJfmyKcOsa+w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZO8ZXQAKCRB4tDGHoIJi
0uWyAQDLG+15QTN5S4Z0wIHbcqLoIoh3iffMQHeyCU0L99Wz3gD/Q11hJJkZxo1b
DU0aa6xvaC+lmR5QVnU667BbHAtoew8=
=+fCB
-----END PGP SIGNATURE-----

--DM+rVJfmyKcOsa+w--


--===============2711016157321101742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2711016157321101742==--

