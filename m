Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ACBCDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbpK0YFGQ7w+5RkbdmK169isKhrXXirmSHwjO/z9xCc=; b=yTvtyaRptVMoh7stNDzdOAOJfN
	wjuIM8XxXXzDJBJWrPcDPcALVR+fBsAUM9qGssFNuDtp0dvz83tKqwGi3enhQIB486ut/9BJCT6py
	D74tN/ccPpC1GgVy2B8Z7/YZfiiothyV5bY0vJQnhaxW1fP28azTYOWzE1dQI+H2oK+O+1k9Vxlm+
	j5SGAw1EhlQ5MNS8CnNmDlO1Nc/1OiuC/1FsoHE0QJ6sSouZGewb0lvRckipAAWOZ5GhYfnEwQ5j0
	NasXaFB02DylKFCtdqq2bNEAu/ZwTUqZn0XKVB4yafvF+GuzY6USsksIWMWKe+7lw9KZOn+ybi2/L
	rwdIkQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsRCf-00ADdU-0e;
	Mon, 16 Oct 2023 17:16:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsRCd-00ADdA-13
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 17:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 975AB60FC9;
	Mon, 16 Oct 2023 17:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9E5C433C8;
	Mon, 16 Oct 2023 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697476586;
	bh=MRy3up7oqUohj1XgFS/GiBFKY4NG7WbUD1k/7sSM8yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipMf8FZsx8iTVB3wSbylZBSCHdrLB9w4rvDfkqnc8OEH92i+lx+zxbGvLA3SWLgf7
	 inKovQXXDMyiOl88agX16f0oLzdYGl0f/kKBwYw79ppGjETfOyJ8krtmvDh8M+C7sR
	 o1xcU2etDt1GGUk7m/x2cShFClEqOmPkkZT1XVfdJS5xgt6beKobBf+FlARHSh+9vt
	 lP/OevPV6O3qMwS2fzL4p1WRYsP4pjlBRiAJHZ4IC6TVRZqftsbLYewdNCH3EIM0g7
	 fsEq5bObLfsAlf2jYlRrxk6Kh53CEmpcwkdc9QoozbLHqM2eYAn9KDpqGNJSrXDFo5
	 U0u0JM/pkIv8Q==
Date: Mon, 16 Oct 2023 18:16:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH 01/12] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't
 depend on RISCV_DMA_NONCOHERENT
Message-ID: <20231016-outwit-bungee-b46cf212c292@spud>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-2-hch@lst.de>
 <20231016-walmart-egomaniac-dc4c63ea70a6@wendy>
 <20231016131716.GA26484@lst.de>
MIME-Version: 1.0
In-Reply-To: <20231016131716.GA26484@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_101627_454856_8BA27829 
X-CRM114-Status: GOOD (  23.61  )
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
Content-Type: multipart/mixed; boundary="===============2777373068165453581=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2777373068165453581==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n9y3/cEO82Secmi+"
Content-Disposition: inline


--n9y3/cEO82Secmi+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 03:17:16PM +0200, Christoph Hellwig wrote:
> On Mon, Oct 16, 2023 at 01:49:41PM +0100, Conor Dooley wrote:
> > Hey,
> >=20
> > On Mon, Oct 16, 2023 at 07:47:43AM +0200, Christoph Hellwig wrote:
> > > RISCV_NONSTANDARD_CACHE_OPS is also used for the pmem cache maintenan=
ce
> > > helpers, which are built into the kernel unconditionally.
> >=20
> > You surely have better insight than I do here, but is this actually
> > required?
> > This patch seems to allow creation of a kernel where the cache
> > maintenance operations could be used for pmem, but would be otherwise
> > unavailable, which seems counter intuitive to me.
> >
> > Why would someone want to provide the pmem helpers with cache
> > maintenance operations, but not provide them generally?
> >=20
>=20
> Even if all your periphals are cache coherent (very common on server
> class hardware) you still need cache maintenance for pmem.  No need
> to force the extra text size and runtime overhead for non-coherent DMA.

Ah, right.

> > I also don't really understand what the unconditional nature of the pmem
> > helpers has to do with anything, as this patch does not unconditionally
> > provide any cache management operations, only relax the conditions under
> > which the non-standard cache management operations can be provided.
>=20
> They simply were broken if a platform had non-standard cache mem but
> only coherent DMA before.  That's probably more a theoretical than
> practial case, but still worth fixing.

And this part of it makes more sense with the above use-case explained.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--n9y3/cEO82Secmi+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS1v5AAKCRB4tDGHoIJi
0uu/AQDsd+QvHSok4Q8k4HHYfsUMrdFaeTVLhvRpSi+kRG+LLwD/T6ws6vJoKrWg
ZkwzD5bj5QIZjaHiwVcDzL6nh9r1gAo=
=qQsV
-----END PGP SIGNATURE-----

--n9y3/cEO82Secmi+--


--===============2777373068165453581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2777373068165453581==--

