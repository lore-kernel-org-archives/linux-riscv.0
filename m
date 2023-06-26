Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EFEEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVDLWpY/xVrr8Ds870yN2KuYLkMGmgn/j320U2ZpjbM=; b=Zot5jCFWQuz3Tw2tM6AT7+NoVb
	vGie4N4iyBX+Ak4/hx2xbjn1RXgCltg4qBn3TNj1umFhiQjcSWAJQFle4T2SH4En8Ri0nmAjutmnr
	7uhiXv8yCiZaLhw4ggM4uJT63ojYSRE/fd96tffN65nReEJma3xoQZqZWEG/3aibqX3QLP924NRHm
	rAinR5oF0clBrqobHWnfb3Fr72EGDsqW+cnyKyqvyDL2iCNSaEu4tPZoPmxuP/76REqZx2PrvkA+3
	7UbfIuysOoyV767H7JRP+qHWOOqVyv4j2TMDgPgG0mUDdZG4temFX/D/mGxkm3oRrR3rfPw5SpVSa
	h1qJN+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDsux-00B0jN-0B;
	Mon, 26 Jun 2023 20:34:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDsut-00B0iw-0i
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 20:34:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 122EB60EF2;
	Mon, 26 Jun 2023 20:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2E3C433C0;
	Mon, 26 Jun 2023 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687811669;
	bh=ISmdUkrKULCJCFTkPXJstD36z/Ol6+a+XD6GmTrJ0hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTomys7hl8SzPESX2Q1yZS+c0t4HNU1KFDJJYOqv3uNFQkRi1XOBXeQQaJzMFjd48
	 05Adq+J66LpNyYfmTDdgzmE0o3OtP8UY1dCHn6qZ9shmFupGQWoPAJsnUEeXh4mdOR
	 XB6IoAgZCf96uS4EhMtYFRMRIV3AXPAbMBS5/yoQvF3pxl64WnJFdqy175+E/VR2nh
	 k3fFitMguY/l4+ZpL1cEIDQfN+NXMCF4zsHP5i4MSPqXSzh9Oh1oxqTM7xjohBJ0CK
	 nFh0aTivx9kS14Pc2m8hJuUfZ2TkfShfnFxpfzAjSKrwivmH3Boa1ZXm9nVyDF2S0B
	 yrA9xi0vYW2Kw==
Date: Mon, 26 Jun 2023 21:34:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230626-nature-seventh-6102e17bb4be@spud>
References: <20230623222353.3742384-1-evan@rivosinc.com>
 <20230624-mortally-parking-68f6bc1dd5ee@spud>
 <CALs-HstvXcwBa+h0u4mz_Pjm-bNd=9DX49Xy-=Fq0t3ECmAi2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HstvXcwBa+h0u4mz_Pjm-bNd=9DX49Xy-=Fq0t3ECmAi2w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_133431_335375_B4B38FAB 
X-CRM114-Status: GOOD (  27.77  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============6688599520904461153=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6688599520904461153==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ThNQzj7TlCUVJnph"
Content-Disposition: inline


--ThNQzj7TlCUVJnph
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 12:25:42PM -0700, Evan Green wrote:
> On Fri, Jun 23, 2023 at 5:12=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Fri, Jun 23, 2023 at 03:23:53PM -0700, Evan Green wrote:
> > > In /proc/cpuinfo, most of the information we show for each processor =
is
> > > specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> > > compatible, and the mmu size. But the ISA string gets filtered throug=
h a
> > > lowest common denominator mask, so that if one CPU is missing an ISA
> > > extension, no CPUs will show it.
> > >
> > > Now that we track the ISA extensions for each hart, let's report ISA
> > > extension info accurately per-hart in /proc/cpuinfo.
> >
> > No, you can't do this as it breaks the assumptions of userspace that
> > this shows the set supported across all harts.
> > Sorry, but NAK.

> My hope was that we were still early enough that no production systems
> existed (yet) that actually had different ISA extensions in the set we
> track, and therefore usermode would have been unable to make those
> assumptions at this point. If such a system exists, and I don't know
> if it does or not, then I agree it's too late to make a change like
> this.

You should put this information into your commit messages & not just
hope that people understand your intent.
Userspace does actually make these assumptions already, see for example
this Google "cpu features" repo:
https://github.com/google/cpu_features/tree/main
To be quite honest, I really dislike the fragility of what they have
implemented - with only one of the reasons being they made the mistake
of assuming homogeneity.

There's got to be a line somewhere for what constitutes buggy userspace
and what's a regression. Up to Palmer I suppose as to what constitutes
which.

> I thought I'd put this out here and see if someone could point at such
> a system; but if not it'd be great to keep /proc/cpuinfo accurate and
> consistent with hwprobe (which does return accurate per-hart ISA
> extension info).

Just another nail in the coffin for a bad interface :)
There are apparently some mixed c906 chips that support vector on one
core and not the other - although it is thead vector which is not
supported upstream yet...

Other than that, SiFive stuff technically can be mixed - rv64imac &
rv64imafdc on a bunch of the older stuff. I don't think anyone actually
runs those sort of configurations on them though.

--ThNQzj7TlCUVJnph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJn2UAAKCRB4tDGHoIJi
0pskAP9yYAMoQpZtM2yirifXI40NwXG+IUQu+cgL6UmPh9EW2wD/Z827GT2WKF1f
hGcH5gWmZgcxkEy40e2oUyNZf5rwnwM=
=+W66
-----END PGP SIGNATURE-----

--ThNQzj7TlCUVJnph--


--===============6688599520904461153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6688599520904461153==--

