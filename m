Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93600EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 19:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwQLZgOWtzSgsJgtWCoFBn2oZ6m7oCr3UrvTP+HZzbE=; b=fXg6wtHjkMBtQNoX5hQDMZ7/U5
	/znsG+vxV4osyXphuL4XY3YZ53p1l3494VUlgPKf4RXZzeuZ7WZhhiEK5fBScrRBX7+Xyelq5QWWe
	vTO70CZ+0dEGCfQEXQie/JD72FxiagNMzpXJUsQXiz+0J/M82fnHG8Saxx3N2S2UoeYLINC4zMYHn
	clJdZ9beIr/FpCjxWhqo+VLkQZAYxpW7KLKbFsjfVwwz9nIetagp5Ik4pK3rUN0iaOThp8x5ALk9T
	JVB6fTeOyGxYo3e8Qm6DwShTzB11dtk7ke4YsrmSwQW88yeqZ8rnT6R8DeI+rRRybFzD0Mug+6amw
	FnvctcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFK3J-004Qaq-2z;
	Fri, 30 Jun 2023 19:45:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFK3H-004QaT-1N
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 19:45:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 798996179C;
	Fri, 30 Jun 2023 19:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3291C433C8;
	Fri, 30 Jun 2023 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688154305;
	bh=Gz3EGjK0wDfPFqqPSFx9EN34bJyDZae+TOOU/oFUqkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5/CBbIcmZzqWROpNGgc/CmzTwFgP9rZyUp8A1QdPu09GeFAvlgHUKihV/9/2Aw6u
	 R+PXolwZe2WHbRCTHJoUfCMuGRw0mDVGN66Yq88BTSVGEbUmY5EQv2I2QAFL9NJuDD
	 TH2dhHu7yOItVSw/NKDvESkPX/CnEiJC5zQ0SsvYhRXAZ5SDR4QeYW8w/FDFnf/pJw
	 zX0/cp+PhPwofjT0SfaQc9vFU3+4trABpM5XZGlQ8+exl/2CZO1QXVJtPmwhzp8tYm
	 sl0n+0EPVyol/zkeqcPIFHdVCTR4bOSZvgoU6Qkl+S/aFrSC4qVYiS7jyyCubZD0CF
	 SjJI/7ADIBSYQ==
Date: Fri, 30 Jun 2023 20:45:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] riscv: KCFI support
Message-ID: <20230630-imprecise-ibuprofen-98f70a8665da@spud>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230630-phrasing-strung-12e53988ad81@spud>
MIME-Version: 1.0
In-Reply-To: <20230630-phrasing-strung-12e53988ad81@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_124507_527827_4F954A30 
X-CRM114-Status: GOOD (  17.63  )
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
Content-Type: multipart/mixed; boundary="===============7453561180882009543=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7453561180882009543==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5RH3lh36f2f8cAFF"
Content-Disposition: inline


--5RH3lh36f2f8cAFF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 07:48:23PM +0100, Conor Dooley wrote:
> Hey Sami,
>=20
> On Thu, Jun 29, 2023 at 11:42:45PM +0000, Sami Tolvanen wrote:
> > This series adds KCFI support for RISC-V. KCFI is a fine-grained
> > forward-edge control-flow integrity scheme supported in Clang >=3D16,
> > which ensures indirect calls in instrumented code can only branch to
> > functions whose type matches the function pointer type, thus making
> > code reuse attacks more difficult.
>=20
> > base-commit: c6b0271053e7a5ae57511363213777f706b60489
>=20
> Could you please rebase this on top of v6.5-rc1 when that comes out?
> This base-commit is some random commit from Linus' tree, that because we
> are currently in the merge window has is not in the RISC-V trees yet,
> and means the series wasn't applied by our CI stuff.

In other news, I gave it a go with 03b118c7e456 ("[SLP] Fix crash on
attempt to access on invalid iterator state.") & have been running it
for a bit. All seems in order so far, nice :)

--5RH3lh36f2f8cAFF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8wvQAKCRB4tDGHoIJi
0n7sAPoCIPcrVQj6zFZMwpWtS5syPkfKJvsn7z+aOpGtLJuswgEA0cHVGWrRG5F/
7pkuFFiHmNuHKoATNB+0d+B3WOzhAAA=
=a0Pn
-----END PGP SIGNATURE-----

--5RH3lh36f2f8cAFF--


--===============7453561180882009543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7453561180882009543==--

