Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4238DC001DE
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 10:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ozp7HnDjFH3TPs3wee2odpG4MF4HIBuRkAylvjFwKQ=; b=qs+qsnL9kK1ZVVyhivlGKBdFC0
	FZVmHh46rNl7zJDCbc+2Orcg9IBjVTnwMgKmv6DF8Q/KurFnno/1EHyv9Pk3F8xmo2SPNX7F9K2oy
	d/5ROAQv9YCSRCetIEqEptwZlOcVIl4J3rX4k9Anw4ZM6rZ716xgrN6UH3DGuoRZjzVqa8irf4jS7
	zdIofyHtQxKxhcZscZhUQkm8wo+1cqpPDIMotMHrt1O+iTSKrpUIRGruVA5KLgYtDIEUWYt49JxdR
	GGBUjD9AebEjPtdJy9J8bjU74iv3h7RcNis9pTqvl1ncNTizwGvV1BNKANpWiaz0QA2YNcwlyehdi
	lymq9Z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNWJ4-000l5p-1e;
	Sun, 23 Jul 2023 10:27:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNWJ1-000l5H-1E
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 10:27:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38D1A60B9F;
	Sun, 23 Jul 2023 10:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68553C433C7;
	Sun, 23 Jul 2023 10:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690108029;
	bh=8VJc2tD2YELzixtvQn5M61U40vb9YcAHPcXQfgf7Q44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNXCXw5BJNcKTo+7KeMYXFsbJ1F79bgksCry1yFSSu+tXu0WRMfqPOBPfiPjadaEo
	 O8v6w0Cc+uo9jKBm1NG4wejosRkIX7kvyju1eQX/L4AMV0sOyEflpq7/dOYSUm9lbi
	 7Ov9Reh+bFumn16h1HCg4tUH0b2qtcN3PYzZf3tpbU0uH4fyQs/iily+vaO8uEV/63
	 VeeUezUzGamNHKzB59HYiJjyForQ+pAQ22+qPtgKtS8/K+bYBS480DSSEghZPcQt6S
	 p3f0sgAkEtLDPb5XyHgmbLLxlFaVJ1zqIpwFNMRma35fhIZl221G4JWRxMwkwRNCHA
	 rNc9SFrTDYAZA==
Date: Sun, 23 Jul 2023 11:27:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Torsten Duwe <duwe@lst.de>, Palmer Dabbelt <palmer@dabbelt.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Li Huafei <lihuafei1@huawei.com>,
	Liao Chang <liaochang1@huawei.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, liubao918@huawei.com
Subject: Re: [PATCH] riscv: relocate R_RISCV_CALL_PLT in kexec_file
Message-ID: <20230723-sprig-audacious-4fff0306735d@spud>
References: <20230310182726.GA25154@lst.de>
 <e02fdfce-4574-8e7e-ec96-8e8eaa4067bc@huawei.com>
 <20230321160349.3b3a46df@blackhole.lan>
 <fc1a945d-368c-4385-b1cc-69978e0f4657@spud>
MIME-Version: 1.0
In-Reply-To: <fc1a945d-368c-4385-b1cc-69978e0f4657@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_032715_530338_DF1A8D61 
X-CRM114-Status: GOOD (  30.33  )
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
Content-Type: multipart/mixed; boundary="===============2958512978965085647=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2958512978965085647==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w/YJr8pXLUA/bSjV"
Content-Disposition: inline


--w/YJr8pXLUA/bSjV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Torsten,

On Tue, Mar 21, 2023 at 03:35:38PM +0000, Conor Dooley wrote:
> On Tue, Mar 21, 2023 at 04:03:49PM +0100, Torsten Duwe wrote:
> > On Mon, 13 Mar 2023 11:13:17 +0800
> > Li Zhengyu <lizhengyu3@huawei.com> wrote:
> >=20
> > > On Fri, 10 Mar 2023 19:27:03 +0100, Torsten Duwe <duwe@lst.de> wrote:
> > > > Depending on the toolchain (here: gcc-12, binutils-2.40) the
> > > > relocation entries for function calls are no longer R_RISCV_CALL, b=
ut
> > > > R_RISCV_CALL_PLT. When trying kexec_load_file on such kernels, it w=
ill
> > > > fail with
> > > >
> > > >   kexec_image: Unknown rela relocation: 19
> > > >   kexec_image: Error loading purgatory ret=3D-8
> > > >
> > > > The binary code at the call site remains the same, so tell
> > > > arch_kexec_apply_relocations_add() to handle _PLT alike.
> > >=20
> > > R_RISCV_CALL has already been deprecated, and replaced by R_RISCV_CAL=
L_PLT.
> > >=20
> > > See Enum 18-19 in Table 3. Relocation types from=20
> > > https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/risc=
v-elf.adoc=20
> > > .
> > >=20
> > > It was deprecated in ("Deprecated R_RISCV_CALL, prefer=20
> > > R_RISCV_CALL_PLT")=20
> > > https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a0dced850=
18d7a0ec17023c9389cbd70b1dbc1b0
> > >=20
> > > >
> > > > fixes: 838b3e28488f702 ("Load purgatory in kexec_file")
> > > > Signed-off-by: Torsten Duwe <duwe@suse.de>
> > > > Cc: stable@vger.kernel.org
> > > >
> > > > ---
> > > > --- a/arch/riscv/kernel/elf_kexec.c
> > > > +++ b/arch/riscv/kernel/elf_kexec.c
> > > > @@ -425,6 +425,7 @@ int arch_kexec_apply_relocations_add(struct pur=
gatory_info *pi,
> > > >   		 * sym, instead of searching the whole relsec.
> > > >   		 */
> > > >   		case R_RISCV_PCREL_HI20:
> > > > +		case R_RISCV_CALL_PLT:
> > > >   		case R_RISCV_CALL:
> > > >   			*(u64 *)loc =3D CLEAN_IMM(UITYPE, *(u64 *)loc) |
> > > >   				 ENCODE_UJTYPE_IMM(val - addr);
> > > >
> > > > .
> > >=20
> > > Palmer, please apply these references to the commit message.
> > >=20
> > > Reviewed-by: Li Zhengyu <lizhengyu3@huawei.com>
> > >=20
> >=20
> > Ping?
>=20
> It's not been all that longer than a week & you're in patchwork so you
> won't be forgotten,

Turns out it did get forgotten, or more accurately, marked as "Changes
Requested".

> but I noticed a complaint when I went looking on
> patchwork about your fixes tag:
>=20
> Commit: f28b81e30b4b ("riscv: relocate R_RISCV_CALL_PLT in kexec_file")
> 	Fixes tag: fixes: 838b3e28488f702 ("Load purgatory in kexec_file")
> 	Has these problem(s):
> 		- Subject does not match target commit subject
> 		  Just use
> 			git log -1 --format=3D'Fixes: %h ("%s")'
>=20
> The fixes tag should be:
> Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
>=20
> Note the capital F & the missed RISC-V: prefix, checkpatch should have
> complained about this.
> Checkpatch also complains that your suse email in the Signoff doesn't
> match the lst.de email that you used to send the patch (IOW you're
> missing a From: header that send-email would add).
>=20
> Could you fix those things up please & I suppose you can take the
> opportunity to make the changes that Li Zhengyu suggested to the commit
> message itself at the same time.

Would you mind resending this with the Fixes & Signoff corrections?

Thanks,
Conor.

--w/YJr8pXLUA/bSjV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL0AdQAKCRB4tDGHoIJi
0tfSAP0QWC0Z93lHBZdkNOp+3L2ooUp4Y6wLUlFIEnzmb0yAlgD9GLB8lnvQSQHj
8tpflQZTVoJmy3fz+qAd/hsh/AE0GA0=
=PHll
-----END PGP SIGNATURE-----

--w/YJr8pXLUA/bSjV--


--===============2958512978965085647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2958512978965085647==--

