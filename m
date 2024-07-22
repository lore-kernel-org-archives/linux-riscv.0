Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54592C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rm+MzKrt7WQSstwRDv/hDkz0zJe4p2vumQuy7OfU570=; b=WYz7lsah0pDGYskDANaIxrpyPY
	VOKcHz5egLB5dpoMgVqCL/PE/XPApCM+10ySFMvq7TgtUu4c2EZJDirHSZSmsu5IKEtybyUqtteSy
	Ttb006/4hOy1uwPZjhk5oEan4IEbvJO9NWNT794UuEoH9Gq0C515zsQ6xs+P2qYRM7lmxUxcLxRqv
	rAnqRv8+VWe+I78Jd4OgDO0s8SRn7HfiG/ubhN1HyeUKIoDRDW+b1NQvq+B7llZ9nieig98+cE4NH
	91+SifUzHDPoc6sHB4b95q9ma0rFl0Q3nAQgXvdDhG/fwfft/tD/lqeSWkIWtKszA7ugken5fLS+x
	9ZDnSfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVr7T-00000009Mb3-2D3b;
	Mon, 22 Jul 2024 11:22:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVr7Q-00000009MaM-2lr1
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 11:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721647337; x=1753183337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TSjluSvqQ3OxAtecfmW9t01oCs4V2LAnNclER/7fRvQ=;
  b=vKAzMriR0pb5Dz7sDNg4/uTRezNvg5BuTWo/p+A6+1J4LchZ4IsLgC27
   ESYNcvUsLOgs7pyeICFB4RKPgDYLCx4A5mqQTWcRMHjue6V8xYTuxMFMS
   ujV3S5Vc3Q/+GpAdSUxX/M//Xqfq3i8q112w5NDhUJ/s0kcnEeRnKJ4j0
   kbMByQfp1NsRT4L+LGq+8B93hsydHXWiCCiq2xAJ0PpIuHPOKMwFIssld
   RMVe/FIS1oGVVyg9SufOU3jLnbnADJ8C9pgFd65YgICV6r2k34W81ZjAc
   12G+TEvjPwqAMHh5iqLFb7pPMFbpLkYc44aSft+zTfyV4yqZO3m5QOGcN
   A==;
X-CSE-ConnectionGUID: 88n3YL8ETjOgZf2mQfcPfQ==
X-CSE-MsgGUID: f0NRyWKWTPmVCxK0TqFeIA==
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="asc'?scan'208";a="260412435"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Jul 2024 04:22:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jul 2024 04:21:33 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 22 Jul 2024 04:21:31 -0700
Date: Mon, 22 Jul 2024 12:21:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] RISC-V: run savedefconfig for defconfig
Message-ID: <20240722-unlovely-snowflake-75e44dfd22fa@wendy>
References: <20240717-shrubs-concise-51600886babf@spud>
 <CAMuHMdXc_VPRLg1N_uCerXzzntJ23pq6m3Jb5eSPVZjxuXjHAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXc_VPRLg1N_uCerXzzntJ23pq6m3Jb5eSPVZjxuXjHAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_042216_723824_518AE8D6 
X-CRM114-Status: GOOD (  18.01  )
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
Content-Type: multipart/mixed; boundary="===============6263067899035531124=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6263067899035531124==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zjetONaQtH1+epJ3"
Content-Disposition: inline

--zjetONaQtH1+epJ3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 01:05:10PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Wed, Jul 17, 2024 at 3:29=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > It's been a while since this was run, and there's a few things that have
> > changed. Firstly, almost all of the Renesas stuff vanishes because the
> > config for the RZ/Five is gated behind NONPORTABLE. Several options
> > (like CONFIG_PM) are removed as they are the default values.
> >
> > To retain DEFVFREQ_THERMAL and BLK_DEV_THROTTLING, add PM_DEVFREQ and
> > BLK_CGROUP respectively.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch!
>=20
> Perhaps we should add an rzfive_defconfig?

I dunno, do we want (potentially a bunch of) platform specific
defconfigs? I'd sooner delete the ones that we have than add more!
I would suggest to just turn on NONPORTABLE, but that isn't a solution
given that the RZ/Five support requires turning off Zicbom. Ultimately I
think it is Palmer's decision whether we add a defconfig for the
platform - it is a bit of a special case given the aforementioned
incompatibility.

--zjetONaQtH1+epJ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp5AowAKCRB4tDGHoIJi
0jaMAQDj/lao31dpASHfsg/s6LHzh/a6KomgsOZaKsJPBnapZwD+Jl94C1zmK7X7
i36INAHW9SWtJmxl0iJFRZEYtv30zwo=
=gdzg
-----END PGP SIGNATURE-----

--zjetONaQtH1+epJ3--


--===============6263067899035531124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6263067899035531124==--

