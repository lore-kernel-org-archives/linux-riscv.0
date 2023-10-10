Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1305BCD98C0
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 21:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuXeAQDyGslP+oMubUGouTrjYZfKZ+v/cHBwlMSCAKU=; b=WUvqH1p0pE1Yjx3shQzapl3yXY
	C7oA8jaKzHuul6ZIGlIP0eODAmPwWSxdleNYt3thXcfiAfWF9xa8miVCQOQQw0muYbEtCNwDujx12
	DnAnSeWXIaUyqbEohDksXImNe2WQEKtxVrui5blhk5ouF1c9qacXXN+ei5gSiQvhxODUSweSuVU0R
	M0oosD4lAEIai1YXG74ixPeunIYSFUigeGqXkPjbcyGGDZRChb1esQTB+kDaMtFK8FygReHcSDQdu
	FtLccR1Fnf+gSSbfqlNJHYrjQtfTPj6tvtQRdH9KqcKLzjkPnR45II6yBVMak6Yrcs/HeZ04kgsCl
	Ka2ARSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqJsN-00EA3r-3A;
	Tue, 10 Oct 2023 21:02:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqJsK-00EA3W-1x
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 21:02:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28B106182C;
	Tue, 10 Oct 2023 21:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769CEC433C7;
	Tue, 10 Oct 2023 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696971762;
	bh=Z7ej04uU0GR3MOipg+o+WcIRoRs95S+/l2+VMvWDCoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6nC8pqvOlM/9XRukSpgRh43PP4yI3ATygMSOJfkqmN4KZxsCLRDSS04U+9/g0asx
	 vO50wlxbdKx5IfrB0mJWx8awqb0DI1oIbcy0n6sbnGyYAWbpYTl3cVX/OrglUq1vyy
	 MGdqSH5n8nsj+x5Pels4uL2PBLljgGfdd37Cv9tCGhyswXtbgg2n6dAZVtAIFZoOCB
	 mm0UdVs+3YpHMkLku9MsMoqW8xTXFxtIRu/0hGZmgYnlLTLNL+lGtddPcubog4m1JS
	 4BTSUO7CNslJGygvLxunmlJJpNRxdfxfXgQB5U2CiyMuIVC3OnA7CuIjpWbFlWBj1h
	 1VArvghic6maA==
Date: Tue, 10 Oct 2023 22:02:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, trix@redhat.com,
	samitolvanen@google.com, twd2.me@gmail.com,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH v3] RISC-V: build: Allow LTO to be selected
Message-ID: <20231010-ungloved-tropical-c731e05d86d6@spud>
References: <20231003-riscv-lto-v3-1-8aca61a4ecb4@kernel.org>
 <CAKwvOdnMeM4YArw=hyVkev11cLfks5gaXWXNK+Wo0bcbeuMZHg@mail.gmail.com>
 <20231010195247.GA2233717@dev-arch.thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <20231010195247.GA2233717@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_140244_758347_E246056F 
X-CRM114-Status: GOOD (  21.79  )
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
Content-Type: multipart/mixed; boundary="===============3669402403679677794=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3669402403679677794==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R1zu76Uiutz83xFt"
Content-Disposition: inline


--R1zu76Uiutz83xFt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 12:52:47PM -0700, Nathan Chancellor wrote:
> On Tue, Oct 10, 2023 at 10:03:15AM -0700, Nick Desaulniers wrote:
> > On Tue, Oct 3, 2023 at 12:17=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > >
> > > From: Wende Tan <twd2.me@gmail.com>
> > >
> > > Allow LTO to be selected for RISC-V, only when LLD >=3D 14, since the=
re is an
> > > issue [1] in prior LLD versions that prevents LLD to generate proper
> > > machine code for RISC-V when writing `nop`s.
> > >
> > > I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~=
3GiB
> > > on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The i=
mage
> > > can boot to shell using an archriscv rootfs on QEMU.
> > >
> > > I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> > > KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
> > > successfully producing a 1.7GiB Image. Unfortunately, we cannot boot =
this
> > > image because the `create_kernel_page_table()` -> `alloc_pmd_early()`=
 ->
> > > `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it i=
n a
> > > separate patch further.
> > >
> > > Disable LTO for arch/riscv/kernel/pi, as llvm-objcopy expects an ELF
> > > object file when manipulating the files in that subfolder, rather than
> > > LLVM bitcode.
> > >
> > > [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LL=
VM
> > >     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops=
")
> > >
> > > Tested-by: Wende Tan <twd2.me@gmail.com>
> > > Signed-off-by: Wende Tan <twd2.me@gmail.com>
> > > Co-developed-by: Nathan Chancellor <nathan@kernel.org>
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >=20
> > Perhaps worth a v4 due to linker relaxation resulting in boot failures
> > you observed:
> > https://github.com/ClangBuiltLinux/linux/issues/1942 ?
>=20
> Yes, agreed. RISC-V patchwork folks, consider marking this as "Changes
> Requested" or whatever other status there is that indicates that I need
> to send a v4 working around that issue, at least until we better
> understand the issue.

Done.

--R1zu76Uiutz83xFt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSW77gAKCRB4tDGHoIJi
0sxoAQDKAL6kBoEjgZZtq5CheMsG86H6TjIzBjzK4JtxTI1LqAEAmG8ct09mDd3B
hLJi7x7mXPeC4/yBKNHTDjodzgrLDgY=
=C53g
-----END PGP SIGNATURE-----

--R1zu76Uiutz83xFt--


--===============3669402403679677794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3669402403679677794==--

