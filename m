Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4BB107BCEC
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 23:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjQixm1rjMZ7zdWkTc1BltIzNsa9DlVEx8z67lYKLjc=; b=qbCCKVKOf4WQeQFfqf1xUzAWx1
	aaXn9j1SXEOGIVTtTLr1ZfBdYmyPXIBfYvqklan/VtKvYeObOVrF7y6APOxXQQrVWaME+nPHfMtpQ
	EL4gTXxV+aCEx+rSwWG2+e5i2QKOZX4ACAaCYygHEeIfBA2hUKJcacOaXNWxAfHK+UZ2a9Tvr+44F
	8ar26Na8IM1KjvseRFB8z6uGfygFmwdrT/nQJbnyfF8lqH4Khm1L7C733V/9jE8XFuW2mRdnyqsGy
	gMwOoV7XnYMLaWmhJQGSfILK0WxE//VygiLkMuqgib3MYmHLsDDo0ml4PJ9EJPzBY5hQlS614tT+T
	xht302rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1CDi-00000001KZC-122c;
	Fri, 13 Mar 2026 23:47:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1CDf-00000001KYQ-3CSr
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 23:47:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2459842DBB;
	Fri, 13 Mar 2026 23:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85039C19421;
	Fri, 13 Mar 2026 23:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773445623;
	bh=PZ+OvZGrUvEAPMTs+GlBLmm3u3TYFzIg6R6x1P7qnXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/Z3sO+UaglZvlfz2KMSdDprHL4j/xNXgrQHtMpmz17+T8rvns23i21Z/dVcf//ok
	 uaKo0k6fPBznhlHKlgrXmt0OabyTVX5HBKINc2Da4MsJ14yy5O9TzgoeGBRDMM0/lO
	 KMr70KX97mIrblqUxrEiLSZcGY1Bbh98WMi4HB75dE3S2pcPBV+1K5fR30WDwMifzJ
	 68A9BM4yL42vkYA6aHVIf3laEoXxDecVQgWdYgDhgYdA5fX/PZiYjkvfg2g2VF7mBU
	 Rzbe7eQMoWzUIcUSk6losXpBk4jaYR/aSvk9DW2xEG37C+eaTbvm1QUVQ4B+9sKPgC
	 EhP/XKIWP3kpg==
Date: Fri, 13 Mar 2026 23:46:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 5/6] riscv: dts: starfive: jh7110: activate XPbmtUC
Message-ID: <20260313-nerd-goggles-b5136fb17833@spud>
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-6-ganboing@gmail.com>
 <20260313-overstep-viscosity-23f4f23e1871@spud>
 <f2cd9698-1200-4752-a61a-e4f311473523@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f2cd9698-1200-4752-a61a-e4f311473523@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_164703_823685_D59D3EC0 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: multipart/mixed; boundary="===============8620002299430216450=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8620002299430216450==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MHTtG1eK8CQHzaai"
Content-Disposition: inline


--MHTtG1eK8CQHzaai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 02:59:44PM -0700, Bo Gan wrote:
> Hi Conor,
>=20
> On 3/13/26 06:48, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 01:44:06AM -0700, Bo Gan wrote:
> > > Set riscv,xpbmt-uncache-bit to 32 to match SoC memory map:
> > >=20
> > >             [0x0,   0x40000000) Low MMIO
> > >      [0x40000000, 0x2_40000000) Cached Mem
> > >    [0x4_40000000, 0x6_40000000) Uncached Mem UC+
> > >    [0x9_00000000, 0x9_d0000000) High MMIO
> > >=20
> > > Signed-off-by: Bo Gan <ganboing@gmail.com>
> >=20
> >=20
> > What I want know is how this whole setup interacts with the existing
> > support that we have for these devices?
> > Samuel's patchetset removed from the devicetree all of the nodes related
> > to having two mappings of the same memory, and modified the existing
> > erratum to only be required for older devicetrees.
> > You've not removed them, only added a new property. The non-coherent
> > peripherals on jh7110 already work prior to this patchset, is there not
> > going to be funky behaviour with both of these things operating in
> > parallel?
> >=20
>=20
> I just want to clarify that Samuel's change is not touching JH7110, but
> *JH7100*. They are very similar chips, can can confuse people sometimes,
> but JH7110 evolved to put more devices such as gmac/sdio/usb/pcie through
> the front port to make them cache coherent. The left over noncoherent

Believe it or not, I know that! I just misread the filename ;)

--MHTtG1eK8CQHzaai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabSh8QAKCRB4tDGHoIJi
0qaUAQCXa8nPCzAFPKlgYhb6cR5eQQzVrPexv4or6Zch7LbePAEAi7pN5/5jCIzT
24xXk/jr+pilgEqNHUS6xdPBQ46v/AM=
=whAx
-----END PGP SIGNATURE-----

--MHTtG1eK8CQHzaai--


--===============8620002299430216450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8620002299430216450==--

