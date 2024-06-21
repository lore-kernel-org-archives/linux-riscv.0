Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE09C2BA1A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bF0oXsIFkymTp5aFQch1MaSiLnLNDl1tmaDhMwrrV2U=; b=MeQUb0eMcVwDmUGHgnjQ2irYZn
	e4gqW80u+TL7aiJrJoCs8tMtXXSxItqzg+Q8YSQUq/xaiXQp83S34jOdQJ2pABkZBOlA9Y09NUcpf
	aWR+MwoksvSTVlJKnFeKfkHn7Fnqnx1MmCd3nrO5zAP003ZmVgX5IrYWRZSmaNTOCxunhOyVSRZMZ
	32ZfKfV5Ji1JsyB2sZpLZdHJSPhPsLKYgzX5sDMdlsaWgQv3QStiTn+TWTbHi6OOmEwiePBAVx3Ys
	RJNV+b+yvCAaPBxMJLdOiCtww4UgrQsuyBOeRBVRzAnbCvHtOzH4TsRSk+0yD4d4xNbfAHLi4x4J4
	6jvJ+/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfid-00000009cgV-3gv7;
	Fri, 21 Jun 2024 14:58:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfia-00000009cfT-29eU;
	Fri, 21 Jun 2024 14:58:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2DA1616DB;
	Fri, 21 Jun 2024 14:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3495CC2BBFC;
	Fri, 21 Jun 2024 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718981903;
	bh=/N0zW1HmRgZHiAuUDZ099fGXSiJzEZf+VzrO/OmldTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBmZ5TVueSExguMe00HI/IeWnKyG1SljHOkXRRoVKSsOdWOuj8tb0neCxlwDuyVLv
	 dJheJL/AA37THMdxMcMKAa0Cn0zSZRunsIcIvAuIuzfUNDAojnWJBznoabATc0Nde0
	 DS4zcDnK6RTxSDPdrrjnr8JW/Uskz2gwqdSLQGAdDQXAKIpE+Yw91n9F1E8tSfZF0a
	 9CS6EGVny5WzwWhbr9AhZypkGqMnXeWB28TF5s9ldQtCzkPaZaIB69jEMfd1pJFI3M
	 ofQvPbmNzlLx+Kuo134BHChi8Q8KrI7FG9tXkY4DX5cSiP0XAt6w/SUQs4wMMfvnun
	 gsKru6MwVcq6Q==
Date: Fri, 21 Jun 2024 15:58:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	greentime.hu@sifive.com, vincent.chen@sifive.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240621-surging-flounder-58a653747e1d@spud>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <40a7d568-3855-48fb-a73c-339e1790f12f@ghiti.fr>
 <20240621-viewless-mural-f5992a247992@wendy>
 <edcd3957-0720-4ab4-bdda-58752304a53a@ghiti.fr>
 <20240621-9bf9365533a2f8f97cbf1f5e@orel>
 <20240621-glutton-platonic-2ec41021b81b@spud>
 <20240621-a56e848050ebbf1f7394e51f@orel>
MIME-Version: 1.0
In-Reply-To: <20240621-a56e848050ebbf1f7394e51f@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_075824_674525_0D3AA439 
X-CRM114-Status: GOOD (  29.63  )
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
Content-Type: multipart/mixed; boundary="===============4859791207506667817=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4859791207506667817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8hAPi/SVNrIs/7zQ"
Content-Disposition: inline


--8hAPi/SVNrIs/7zQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 04:52:09PM +0200, Andrew Jones wrote:
> On Fri, Jun 21, 2024 at 03:04:47PM GMT, Conor Dooley wrote:
> > On Fri, Jun 21, 2024 at 03:15:10PM +0200, Andrew Jones wrote:
> > > On Fri, Jun 21, 2024 at 02:42:15PM GMT, Alexandre Ghiti wrote:

> > > I understand the concern; old SBI implementations will leave svadu in=
 the
> > > DT but not actually enable it. Then, since svade may not be in the DT=
 if
> > > the platform doesn't support it or it was left out on purpose, Linux =
will
> > > only see svadu and get unexpected exceptions. This is something we co=
uld
> > > force easily with QEMU and an SBI implementation which doesn't do any=
thing
> > > for svadu. I hope vendors of real platforms, which typically provide =
their
> > > own firmware and DTs, would get this right, though, especially since =
Linux
> > > should fail fast in their testing when they get it wrong.
> >=20
> > I'll admit, I wasn't really thinking here about something like QEMU that
> > puts extensions into the dtb before their exact meanings are decided
> > upon. I almost only ever think about "real" systems, and in those cases
> > I would expect that if you can update the representation of the hardware
> > provided to (or by the firmware to Linux) with new properties, then upd=
ating
> > the firmware itself should be possible.
> >=20
> > Does QEMU have the this exact problem at the moment? I know it puts
> > Svadu in the max cpu, but does it enable the behaviour by default, even
> > without the SBI implementation asking for it?
>=20
> Yes, because QEMU has done hardware A/D updating since it first started
> supporting riscv, which means it did svadu when neither svadu nor svade
> were in the DT. The "fix" for that was to ensure we have svadu and !svade
> by default, which means we've perfectly realized Alexandre's concern...
> We should be able to change the named cpu types that don't support svadu
> to only have svade in their DTs, since that would actually be fixing those
> cpu types, but we'll need to discuss how to proceed with the generic cpu
> types like 'max'.

Correct me please, since I think I am misunderstanding: At the moment
QEMU does A/D updating whether or not the SBI implantation asks for it,
with the max CPU. The SBI implementation doesn't understand Svadu and
won't strip it. The kernel will get a DT with Svadu in it, but Svadu will
be enabled, so it is not a problem.

--8hAPi/SVNrIs/7zQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnWVCQAKCRB4tDGHoIJi
0vOtAQDlXct24q3+5xwPuu3xdxQDI0UlyBOK0l80As/W7VUFAgD/dg4Zzqtg9N+j
ocw/Xv5W3AHDcfI4joWSya+p51csqww=
=er2I
-----END PGP SIGNATURE-----

--8hAPi/SVNrIs/7zQ--


--===============4859791207506667817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4859791207506667817==--

