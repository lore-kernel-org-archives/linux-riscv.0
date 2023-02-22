Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D59C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbK11d9gFmT4ecVfzihU5eFYVleLZ8XAEi0/3x4ntNQ=; b=07o0YVaKlPXpiAi3a5q558Rbyd
	sgDipcL7d5ZvjgkM8z02oHsCR2Bb22TZQgLlrNMiM1fBZU3XUncgET/VwqOIWfJLvz/608WU/5cdP
	TselT+5fNk9xZS1K03Pcl1pAu0sFWLX5UOpH5x5GdhjIvQ/6C0FppOEWoc8jLsmbu0Oo0waZPBytZ
	nOld8hFXPVNo7z7mByefU02lGSIPoj+hAfazu+tqlRhtasZ4Ot6G8JFb0XXBGcI4lBJawWv4JF2Ao
	wXAG7Rk9OQqC96kC02xwUc7e1oVaVTDBi5g0iP8uTcIrEr59XYVUyovJsKMvHR0ZpBmwRVmz2VENn
	4itfjg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrZo-00CxMw-75; Wed, 22 Feb 2023 16:02:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrZl-00CxMM-04
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 16:02:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4CDC9B81233;
	Wed, 22 Feb 2023 16:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613AEC433D2;
	Wed, 22 Feb 2023 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677081754;
	bh=6LGlHzxZNINwfMiEzngNCsuQZ1HqkPO0BsKe3s0szao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIVk4q5LZm7TsKDuXXBajKwEN9fw/fFUM3LecOh4kXVxpn2xmb5M131vgL3gcAkRB
	 1ja/SlxSEy90e7kKb+Sn2/hCog4FmEhUJvh4ZHJAz6COcqDyAiKS92gh02pB9YRGWR
	 IKPoL01U9IKBJXJd5ZEPRvqM59lLavHTKYEGiZN6g+IG2Khk1j+75/KOEoj29VutiT
	 B0dpQDoQ6qWi95cpgcOwhzxUq29TpOz1aJ6y0PuBv1S+NUqiYyAmC6ShpEKg1/A39l
	 TvGPLDiPNRoMQ6JyYOZ2nBFgbAR7nTVZh7yPyusmjdlSUmlL9SS3sY0K/9jzRACKz4
	 2lX12kySD7TTw==
Date: Wed, 22 Feb 2023 16:02:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, mpe@ellerman.id.au,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	Rob Herring <robh+dt@kernel.org>, Christoph Hellwig <hch@lst.de>,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] riscv: Set dma_default_coherent to true
Message-ID: <Y/Y8lEndecMfD+Ur@spud>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
 <20230222133712.8079-3-jiaxun.yang@flygoat.com>
 <Y/YrvDBJcYUQt4WC@spud>
 <6BBA7BEA-8595-436D-B4BF-D7DB95069C53@flygoat.com>
MIME-Version: 1.0
In-Reply-To: <6BBA7BEA-8595-436D-B4BF-D7DB95069C53@flygoat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_080237_354026_014BD079 
X-CRM114-Status: GOOD (  24.77  )
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
Content-Type: multipart/mixed; boundary="===============5754871462876954709=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5754871462876954709==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8CVdK4UNNn5wJH7y"
Content-Disposition: inline


--8CVdK4UNNn5wJH7y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 03:55:19PM +0000, Jiaxun Yang wrote:
>=20
>=20
> > 2023=E5=B9=B42=E6=9C=8822=E6=97=A5 14:50=EF=BC=8CConor Dooley <conor@ke=
rnel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > On Wed, Feb 22, 2023 at 01:37:11PM +0000, Jiaxun Yang wrote:
> >> For riscv our assumption is unless a device states it is non-coherent,
> >> we take it to be DMA coherent.
> >>=20
> >> For devicetree probed devices that have been true since very begining
> >> with OF_DMA_DEFAULT_COHERENT selected.
> >>=20
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >> arch/riscv/kernel/setup.c | 3 +++
> >> 1 file changed, 3 insertions(+)
> >>=20
> >> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> >> index 376d2827e736..34b371180976 100644
> >> --- a/arch/riscv/kernel/setup.c
> >> +++ b/arch/riscv/kernel/setup.c
> >> @@ -300,6 +300,9 @@ void __init setup_arch(char **cmdline_p)
> >> riscv_init_cbom_blocksize();
> >> riscv_fill_hwcap();
> >> apply_boot_alternatives();
> >> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> >> + dma_default_coherent =3D true;
> >> +#endif
> >=20
> > Do we really need to add ifdeffery for this here?
> > It's always coherent by default, so why do we need to say set it in
> > setup_arch() when we know that, regardless of options, it is true?
>=20
> Because this symbol is only a variable when:
>=20
> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
> defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
>=20
> Which is only true if  CONFIG_RISCV_DMA_NONCOHERENT is selected.
>=20
> Otherwise this symbol is defined to true and we can=E2=80=99t make a assi=
gnment to it.

Maybe I am just slow today, but I don't get why you need to add
ifdeffery to setup_arch() to do something that is always true.
Why can't you just set this in riscv/mm/dma-noncoherent.c? What am I
missing?

Cheers,
Conor.

> >> if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
> >>     riscv_isa_extension_available(NULL, ZICBOM))
> >> riscv_noncoherent_supported();
> >> --=20
> >> 2.37.1 (Apple Git-137.1)
>=20
>=20

--8CVdK4UNNn5wJH7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/Y8lAAKCRB4tDGHoIJi
0oePAP42rA2ROm6m4zS7iIWPZsgocfrVux+zYLf1x32I0aaNfgEA0pHQJ6qmRcbp
jMVC52QsYSdhJDdgid2lUqBOpWTfbwo=
=hwwY
-----END PGP SIGNATURE-----

--8CVdK4UNNn5wJH7y--


--===============5754871462876954709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5754871462876954709==--

