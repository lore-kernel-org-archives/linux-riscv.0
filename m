Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90977C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z11s1uKG56Ei0YMZCRNws/ip5o8HQLt5U2vBoAcRVbw=; b=rsyDSzcgeUVBMPD2Snyxe0q0/R
	zMoN/bYnwerxzrQu5xzmN55PHiUI/LrgFFJJBC3FA7K8/BiFZVBFCyG+hG826IGDZid7WDZFkDufh
	Oc3bLBfKqKcR61vwndljKMr9Sc5ZsXPja9Gd0j7THIplDzPMqABD/pGBtpwiEHY7ZRrtv/bnCSYyI
	QKcF9MqZSGGeKPM5wzZh2QK4P/5yLcheB9RAhfLwJEcgD0Qod1xHVpLET1ZAo7xYpJ1J2daJDhFHu
	R996HTj0sP4ogC/ANu9mwBVeyLxi+gDaZKGAal2/KbyTyw+i3xgB/LQsAXRW6N4n06N8V4EIWyTXb
	S6s7N4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vvF-000000099kB-2Ctx;
	Tue, 08 Sep 2026 13:31:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vvD-000000099jp-3TOT
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 13:31:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 400CC40DF6;
	Tue,  8 Sep 2026 13:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2751F00A3F;
	Tue,  8 Sep 2026 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788874295;
	bh=dhnWJnXaxw0P0j3PLR7CX+ym7THKxl9bQFROIbM+/WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R5U01osIbt5PuHbUuvi3dOa6NmTHxEkdlxiS4OxJq7O4CtPyM11gvISLypnLLVUch
	 9f+U2awUKAxMe5mj1CTQSmW/HSW/SmhoOu5soJvA8codtKhqg4bgcPs+Wl/VHBLmvR
	 7WdMvqvp0g4RT/2n5shIRHPNQ4ZifvWcpMkMOLrX/FI5dR7Vc77UhFTaFLegL0/0Gt
	 Je2JuXmRs2jw0OhsIH/QtSZqcMabWJ/4YWs6Dp9oYXS3sfAiGXf9cOYLZICsBTmLIN
	 Gp+gTgxt/c71SF6Ws54Nk3RMvjDKMxsxvDUoKHh0nVapv+gSrvfNGSdCLGu9u55EAr
	 CJ0Isos76BhqQ==
Date: Tue, 8 Sep 2026 14:31:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] riscv: support EIC770X/JH7110 noncoherent
 devices with XPbmtUC
Message-ID: <20260908-zebra-reacquire-f534e563a4d0@spud>
References: <20260316060328.1173634-1-ganboing@gmail.com>
 <ee2b42b0-1489-478d-8c88-ced6b77824b3@gmail.com>
 <20260324-marshland-stretch-cc21ae7fdc2e@spud>
 <1a7cf36f-aef3-4837-8390-5d063fab3e14@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1a7cf36f-aef3-4837-8390-5d063fab3e14@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1645524182054453813=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1645524182054453813==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oro6JpDkbVfVmUyg"
Content-Disposition: inline

--Oro6JpDkbVfVmUyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 07:15:14PM -0700, Bo Gan wrote:
> On 3/24/26 10:49, Conor Dooley wrote:
> > On Mon, Mar 23, 2026 at 04:08:33PM -0700, Bo Gan wrote:
> > > Hi All,
> > >=20
> > > Any suggestions/comments on this?
> >=20
> > I'll get to it at some point, just busy sorry!
>=20
> Hi Conor,
>=20
> It's been quite a while, and I almost forgot about this. Any new
> suggestions? Comments?

Oh god, I completely forgot about this - sorry.

I'm unfortunately not available really until the 22nd, but I'll do my
best to take a look before LPC.



--Oro6JpDkbVfVmUyg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqAOMgAKCRB4tDGHoIJi
0r5NAQDALbANihieHP5lxczzb36m0lZZrnbbEhBSfYQ59A55NgEAlj4ZiKRgN2Sc
7B4cksPhhSqM9X9AUI8QciYw4K6j3g8=
=JpNz
-----END PGP SIGNATURE-----

--Oro6JpDkbVfVmUyg--


--===============1645524182054453813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1645524182054453813==--

