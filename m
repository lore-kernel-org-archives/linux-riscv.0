Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E23C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mh8fqeM9GWNp6Lol8ajIgn1vTvNQqr9f3/pDxX4bAz4=; b=etKbdgwuH0axqsieY59iR4+8NO
	CNe6PYtjTauNibN2ylofZUSR0zYrXIryaKD20LE97KRY065R1k/hrKTMRnjZi7pZIfQG1SGkN7iNt
	QOubC6CiyoRyWvOLh/3n9Mhf30c/B8M4OmuD0fYo6EkUMa+C5FsfiumLFnV3Ek9Qde1d96JqH56DW
	UAXF6qzVwyfOJJ5qgbVL2qFRbuJKVmqPMdPr/DtchniFjyQDyEb9TWygaUq5lUbiFId+A8QcYCYs1
	/SWDiM621L4rGZKkEYGdEdZnYA1rpm8vwmhSL5pDZhrjY5c7JH9DoMmEN11w7+Ghg03I67PEdxhHE
	gUYyiL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iCx-00BThs-0r;
	Mon, 29 May 2023 19:07:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iCu-00BThI-0q
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:07:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72B5C60D27;
	Mon, 29 May 2023 19:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA47C433EF;
	Mon, 29 May 2023 19:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685387222;
	bh=DC+0Nz9V+5G1BtqYeJRptzk3vDmLfC8GGcPOFmfLs7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSAVfaEyAVEWoJHatqnJ1OXPiUrRw3iGfdQttQqHXkrQil4SlK2xKjMoqKIO3SIeg
	 WBZ6MZ04Elw/Oeha2r2R6O14rnSKUXt/kHy+Nm/UCnMUsWRopQBfF87gmLZ6J/SU2C
	 QtKJFt/XNtMj45p5Bfa4YU3cxpjcpBfJrYsUao3mtB3sBPJk7JKot6zAWUijPO11+v
	 U1SvmMqLqSAndAlKtdpciB7Rr/CvSAmba+U1Oj41vKrNYQNK1pP9xLeE9MA/8dKefw
	 bnRQ2KcPhBeVXEIHxLS/xMUPK9H4bM1u6o5hEdQ0F1WukUoYeOKeg60jWzGygYWmWq
	 0P5rX4ocLaw1w==
Date: Mon, 29 May 2023 20:06:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Message-ID: <20230529-skillet-quarters-3fbc3b6edb3a@spud>
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
 <20230526-clergyman-wriggly-accc659a3fad@spud>
 <20230526-rockfish-moody-f6d3e71f9d24@spud>
 <f6522c82-01bd-8a03-579d-a5b294784480@ghiti.fr>
 <20230527-hyperlink-doctrine-ef22cfcb508a@spud>
 <CAHVXubgx3uBEjMLHXTxr0192ZHbSb=qK4NggZyWQTDfgrJt2-g@mail.gmail.com>
 <20230528-darkness-grandly-6cb9e014391d@spud>
 <cf0d2d2a-c407-7b3d-a5ab-ea5c19e7b890@ghiti.fr>
 <20230528-uneatable-earpiece-3f8673548863@spud>
 <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_120704_382051_D8451C3D 
X-CRM114-Status: GOOD (  26.37  )
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
Content-Type: multipart/mixed; boundary="===============4371899447299554615=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4371899447299554615==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9orEhVzZm/1dz2G/"
Content-Disposition: inline


--9orEhVzZm/1dz2G/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 08:51:57PM +0200, Alexandre Ghiti wrote:
>=20
> On 28/05/2023 15:56, Conor Dooley wrote:
> > On Sun, May 28, 2023 at 03:42:59PM +0200, Alexandre Ghiti wrote:
> > > Hmmm, it still works for me with both clang and gcc-9.
> > gcc-9 is a bit of a relic, do you have more recent compilers lying
> > around? If not, I can try some older compilers at some point.
> >=20
> > > You don't have to do that now but is there a way I could get your com=
piled
> > > image? With the sha1 used to build it? Sorry, I don't see what happen=
s, I
> > > need to get my hands dirty in some debug!
> > What do you mean by "sha1"? It falls with v6.4-rc1 which is a stable
> > hash, if that's what you're looking for.
> >=20
> > Otherwise,
> > https://github.com/ConchuOD/riscv-env/releases/download/v2022.03/vmlinu=
x.bin
> > (ignore the release crap haha, too lazy to find a proper hosting
> > mechanism)
>=20
>=20
> Ok, I don't get much info without the symbols, can you also provide the
> vmlinux please? But at least your image does not boot, not during the ear=
ly
> boot though because the mmu is enabled.

Do you see anything print when you try it? Cos I do not. Iff I have time
tomorrow, I'll go poking with gdb. I'm sorry I have not really done any
investigating, I have been really busy this last week or so with
dt-binding stuff but I should be freer again from tomorrow.

https://github.com/ConchuOD/riscv-env/releases/download/v2022.03/vmlinux

> I tried with gcc-12 and it still works fine on my end, so frustrating!

Crap! Also, should you not be enjoying a public holiday rather than
debugging?! Or maybe debugging is enjoyable for you...

Cheers,
Conor.

--9orEhVzZm/1dz2G/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHT30gAKCRB4tDGHoIJi
0oE4AQC8kQJqtdm4bfkg8EIJwiDdxoIlxlz5s8mF3AhgqoCiKAD+LAFXAi2wfTUg
PenZcj0zlOE6b84SgfE7oazBo3NcDws=
=OvI/
-----END PGP SIGNATURE-----

--9orEhVzZm/1dz2G/--


--===============4371899447299554615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4371899447299554615==--

