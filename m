Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A92CA5506
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fN+sxRxL2X5CSbPRHYbq+LddnfP5zKXMfjUgFqR7rnU=; b=GSmad7LnuJumweCOpfi2cDVvgC
	d+EPwFMylVAUf4oA2Qgz8PdlZuhtqi6x/g9pmhn4KmYY4u5PSFynIHWvJnPCAMvFiCgYzZVt1R6NK
	UpetB4oVYH14SUbqASxLpi4qM5vwpghSGbZ+OG2K9vMGMTnplZ3sybqFMjdSiRXpAyAkQ0RO0SkDU
	qpXGI1RV7RUJUMqhtTh4wOLvd+QGF536vz2SMpuC9uq8t1rDwKLi/CYk/D9p2YQtIQmx+gsKW/Czd
	pynLS5IkVB/Dar3/U4RCOxSy9xeVuLOoj9r/laa1nxV8HPZtoBsJ63dU+SM/1rhHzYwmD26zW23TE
	vnHCmA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgm2c-008PBj-2j;
	Thu, 14 Sep 2023 13:05:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgm2a-008PB3-1J
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 13:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694696753; x=1726232753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bFjx+SY72hetzAF5+8Myb01ScB2LpuX1/USvMPO9Sl4=;
  b=PHGnv6sztGvdMdja69sZDVOeFra5f6RH+y96Ho8Rf0pNG5SZUh8YI2tY
   R4ULhYIvcy/qg9tVTdSSOTfxtJdrFivihvR4Rrd8n6MgI2N53wrW90XTM
   FmmyrpVxU3fDOUWq8SxMbeKiIiEtv2Qca0mDPeWb5VPwupLQk2UemJ298
   UeO4Kbi+PWOIVTSWdy/zJzkUyeTgjJdZeTL9Q05iEL05paptI5f2K0t+L
   hrVxeOqQoulpP2WqMfwd11+JWiBg6o/8W5unH3HqXNGUzxzbnGCoB1S7m
   0XLnpq9xuL6Fd8xD4D79j3ps4rcXaYInHIIZTPo7oGpFGZ3tFVVY3SJtN
   g==;
X-CSE-ConnectionGUID: FF6xf1diS2Ob62pF01zcqQ==
X-CSE-MsgGUID: ADYnQ6GcSYyCRIyV8oyr1A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="asc'?scan'208";a="4664425"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2023 06:05:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 14 Sep 2023 06:05:50 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 14 Sep 2023 06:05:47 -0700
Date: Thu, 14 Sep 2023 14:05:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, "Jason A . Donenfeld"
	<Jason@zx2c4.com>, Samuel Neves <sneves@dei.uc.pt>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Heiko Stuebner
	<heiko@sntech.de>, Herbert Xu <herbert@gondor.apana.org.au>, "David S.
 Miller" <davem@davemloft.net>, <linux-crypto@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/6] RISC-V BLAKE2s Vector implementation
Message-ID: <20230914-float-uneven-7cd1a18b3978@wendy>
References: <20230912115728.172982-1-bjorn@kernel.org>
 <20230914-roaming-plunging-948c78d9831c@wendy>
 <87pm2kap1p.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <87pm2kap1p.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_060552_447009_1743B8B3 
X-CRM114-Status: GOOD (  17.00  )
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
Content-Type: multipart/mixed; boundary="===============6387873949124131685=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6387873949124131685==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Z89i+AmwxS2DNN/"
Content-Disposition: inline

--4Z89i+AmwxS2DNN/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 02:59:30PM +0200, Bj=F6rn T=F6pel wrote:
> Conor Dooley <conor.dooley@microchip.com> writes:
>=20
> > On Tue, Sep 12, 2023 at 01:57:22PM +0200, Bj=F6rn T=F6pel wrote:
> >> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> >>=20
> >> Hi,
> >>=20
> >> This is Andy's kernel mode vector V2 series [1], with my BLAKE2s
> >> AVX-512-to-RISC-V translation patch appended.
> >>=20
> >> I've tagged it as RFC, since Andy's series is still not in-tree yet.
> >>=20
> >> It's a first step towards a Vector aided Wireguard! ;-)
> >
> > This has the same problems as Andy's stuff & doesn't build properly for=
 the
> > automation. What is the plan between yourself and Andy for submitting a
> > version of the in-kernel vector support that passes build testing?
>=20
> I'll synch up with Andy! I'm not even sure the blake2s patch should part
> of the "in-kernel vector" series at all.

The in-kernel vector stuff should come with a user, otherwise it's dead
code :)

--4Z89i+AmwxS2DNN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQMFGwAKCRB4tDGHoIJi
0nmFAQDHF1wBd2jJ7LQfLaP8C74vxNiAF9XKvsbMGR3MThqnJgD+JLe5EToa4Wse
m9FpUzukIIhTCC5Xsq+aCiT+wUzQcAA=
=2kdw
-----END PGP SIGNATURE-----

--4Z89i+AmwxS2DNN/--


--===============6387873949124131685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6387873949124131685==--

