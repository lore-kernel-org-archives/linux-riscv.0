Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B66C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GRZ2OHsMREbV+swwtcj5HzGg07ZiABFuf05ehGKmlok=; b=Gkq
	Jdj3CfiIukoEVxTTTFRbYtNz7IJNuXsqHlH0ja/QsjNn6DNoHRrW/KQjErMOnUomhf+lmlSnN/GhT
	rCYDr2hLVhaAHbk48qU+nRWcvMc4rHWFAxCAK1RI5iITB/BzM03ah3s/BLmQpVALpggoTFVx39P8q
	CYNbPb+0JncT9aGh+CwreRTKSX75P2Zd+djY/hyNgp/mT6Q6yWmtsxqsGdsEW1v/YTEhnkMifIkjf
	FYShkM+m2a1IwAJOnbnvQm+wsoOpQRAd9iU5ATEf7Oqb2kOtJr4T3MxbZ9TEuyuej3zjM+PojJNXr
	dk/JW+drNQ0CyMFHx3wVDfc9I6vooDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3crJ-00AaTV-2Q;
	Mon, 29 May 2023 13:24:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3crF-00AaRn-0h
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 13:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685366662; x=1716902662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hAMWc4Ga7yb4Jybd/RVgsugLijfi/KS/8IbdDKyHI8=;
  b=cNU2kQ+smm4ztb1u3FXueNtfsoD/Dvbu+koyDuZbNZFV85TLzFxhJNbX
   HTv2qMT1tnmI1wc0SXvHyGqq+JEpNSnL4HbAXKFityaNHxT+YXHCir5rh
   7eCXGw6L9z5rcH1VgsVi1vBI3jBpLe6si8MmjaB0BPgy5I2O5G12MRwxb
   qwx29xknxkN8g5H7hg1buKlPATa+Q3xxolwKdAnz1L5RzT/hTBd9EQP4E
   GNvA7DkogaJkt6XVJXKBLOflxbEp3MUBMChI5HsOqM8dcwWyXrb6xbXgW
   5bLnYgz8OOGsALOdeyDABAEIG+YheRkisCWxogPeTfy+hqMC9ou/Gh4CK
   w==;
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="asc'?scan'208";a="215911567"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 May 2023 06:24:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 29 May 2023 06:24:18 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 29 May 2023 06:24:17 -0700
Date: Mon, 29 May 2023 14:23:54 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <palmer@dabbelt.com>, <conor@kernel.org>
Subject: weird backtrace during kernel panic, possibly due to mapping symbols
Message-ID: <20230529-glare-modify-653f50de5602@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_062421_507285_4461892F 
X-CRM114-Status: UNSURE (   5.35  )
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
Content-Type: multipart/mixed; boundary="===============1262590647050147597=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1262590647050147597==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VdI678gQAly5yJr8"
Content-Disposition: inline

--VdI678gQAly5yJr8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey!

I posted this weird backtrace on IRC over the weekend & Palmer thinks
the blame lies with binutils 2.40 emitting mapping symbols that the
stack dumper cannot handle:

[<ffffffff800048c4>] $xrv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0_zmmul1p0+0x0/0x7e
[<ffffffff800048c4>] $xrv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0_zmmul1p0+0x0/0x7e
[<ffffffff806062b6>] $xrv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0_zmmul1p0+0x34/0x4e
[<ffffffff806062b6>] $xrv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0_zmmul1p0+0x34/0x4e
[<ffffffff805f92f2>] $xrv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0_zmmul1p0+0xe2/0x280
[<ffffffff805f92f2>] $xrv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0_zmmul1p0+0xe2/0x280
[<ffffffff808012ac>] mount_block_root+0x174/0x206
[<ffffffff808012ac>] mount_block_root+0x174/0x206
[<ffffffff8080139c>] mount_root+0x5e/0x15c
[<ffffffff8080139c>] mount_root+0x5e/0x15c
[<ffffffff808015c6>] prepare_namespace+0x12c/0x162
[<ffffffff808015c6>] prepare_namespace+0x12c/0x162
[<ffffffff8060767e>] $xrv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0_zmmul1p0+0xb6/0xba
[<ffffffff8060767e>] $xrv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0_zmmul1p0+0xb6/0xba
[<ffffffff80607698>] kernel_init+0x16/0x10c
[<ffffffff80607698>] kernel_init+0x16/0x10c
[<ffffffff8060767e>] $xrv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0_zmmul1p0+0xb6/0xba
[<ffffffff8060767e>] $xrv64i2p0_m2p0_a2p0_c2p0_zihintpause2p0_zmmul1p0+0xb6/0xba
[<ffffffff80003406>] ret_from_fork+0x6/0x1c
[<ffffffff80003406>] ret_from_fork+0x6/0x1c

The panic itself is just a missing rootfs, so nothing to be concerned
about :)

Cheers,
Conor.


--VdI678gQAly5yJr8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHSnagAKCRB4tDGHoIJi
0rhJAP4kqr4u49G1ZBiT+cbO61KKmbMfftxrnMVTjSplU36yJAEAoK7ZccRkB1Et
XcH7UeaKY4AnAi1/XOjGTymNVOdAhgE=
=CehR
-----END PGP SIGNATURE-----

--VdI678gQAly5yJr8--


--===============1262590647050147597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1262590647050147597==--

