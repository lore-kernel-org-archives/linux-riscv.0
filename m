Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0683EC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtI01dx46U54+C7owxOOyey4tswAX6q/mj85Q3DIyyg=; b=qYD7f5EQVQ5rJBw+NI3zXFmMJk
	9LvpKIpj6MDEOy6t0h9BCxqyOMmret+F43uqgUD8plr4A34TvkejXDZmMb/6B35FfUaV2+Q2Ok8Jn
	opsGqP+h+uCSw90CGmdEdAGJTvswCxhZEnDXNPWcxcPAVVQQr4Q2h/nzDgBzIw3CShnmSS8GEwuor
	u4Z+cVAN9p2qf+WHjkghzv6J9RqfRrNFsHTZJ2BofLXp695th04/qece55xIyBJrTeZr4++7a9GIv
	YQ9DHhhjdS5oBVCVRSGHgdW0RTHZ+8CKmA5ZzMJ4YPSPXYNM6BEQOVuKNflI92+RMl/y9xgefAsqs
	+7IWtVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ZFZ-0028xh-3B;
	Mon, 27 Nov 2023 10:54:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ZFW-0028x0-0n
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701082438; x=1732618438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j6h7XJH1KGAbkowPJJayTY7lvbPQUZj68ski4dlbynw=;
  b=TVWZvTSU5bV/j8w5rXm57GwOX7LpnJWje5bZdn8Uf9UkixP7IP5chglg
   6ULjxVhnd8im5x1lVksTXaRQCrQ7kZtikUXwUaEQ+5JOteGjeSQ1GTiow
   dKsY+rn0nk3Ll4Xp0zFelqVaFLf76DcwCyKX78b9n2GThuu82F1P0djvN
   k2avSMNQaJCW4dR1Q0NdnuDfnoirma24frIpQ6MFltj0ju/Gyy70ulaw3
   z4ohw10cqsQ9698K0YviAyy4qEynu7K+WdvQw/k1ysmkAN3Zct/tHp1n9
   DnNLWzbakNyoUlqhWmmeu81km3mN+6M4+TiegEu18s7QeJnnFwmKTzQrk
   g==;
X-CSE-ConnectionGUID: YPS4VwxDQfOzZE6jz4ztjg==
X-CSE-MsgGUID: MiieKtf4Rwa1i1LyG3VL1Q==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="asc'?scan'208";a="12597666"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2023 03:53:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Nov 2023 03:53:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Nov 2023 03:53:21 -0700
Date: Mon, 27 Nov 2023 10:52:52 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<leyfoon.tan@starfivetech.com>, <jeeheng.sia@starfivetech.com>,
	<apatel@ventanamicro.com>
Subject: Re: [PATCH v1 0/1] riscv: Introduce system suspend support
Message-ID: <20231127-salaried-distill-f8e8a860bd76@wendy>
References: <20231012072148.7010-3-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231012072148.7010-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_025358_352347_ED5656AA 
X-CRM114-Status: GOOD (  14.74  )
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
Content-Type: multipart/mixed; boundary="===============5517029698736729981=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5517029698736729981==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9lpfA/1MdRkgRNvp"
Content-Disposition: inline

--9lpfA/1MdRkgRNvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 09:21:49AM +0200, Andrew Jones wrote:
> OpenSBI v1.3 and later supports the SUSP SBI extension which has recently
> been frozen with the freezing of SBI 2.0. This one patch series adds
> system suspend support to Linux, which implements "suspend-to-RAM". To
> use it, build the kernel with CONFIG_SUSPEND, boot on a platform which
> supports system suspend, and then issue 'echo mem > /sys/power/state'.
> It's also possible to test this Linux support on a platform without
> system suspend by using OpenSBI's system suspend test support. To enable
> test support add
>=20
>       opensbi-domains {
>           compatible =3D "opensbi,domain,config";
>           system-suspend-test;
>       };
>=20
> to the chosen node of the device tree. With the test node present,
> OpenSBI will wait 5 seconds on a suspend and then kick a resume.
>=20
> Note: Resume may fail without the fix for probing misaligned access
> speed[1]. It's best to apply that fix before attempting system suspend.
>=20
> [1] https://lore.kernel.org/all/20230920193801.3035093-1-evan@rivosinc.co=
m/
>=20
> Changes for v1:
>   - Rebase on v6.6-rc1 -- only minor Kconfig change needed

Would you mind resending this rebased on -rc1 again? It looks as if the
patchwork CI threw a fit do to differing expectations about function
signatures for the misaligned access probing.

Cheers,
Conor.

--9lpfA/1MdRkgRNvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWR1BAAKCRB4tDGHoIJi
0oEYAQCbuVwcm2mxWsAge0U3Mhhu9kuA+aKp+mIUhDOJTIwzOwEA3Lerw1ISM1i9
6E805bYiHFf+y6DmbjCCHimKuLxXKg8=
=HvbS
-----END PGP SIGNATURE-----

--9lpfA/1MdRkgRNvp--


--===============5517029698736729981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5517029698736729981==--

