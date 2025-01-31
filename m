Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1DCC0218A
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 00:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fioPKyWwNh0DxCWOgttF5NA2UP4zZwz3xNw3qN1vmJw=; b=qO9PGNajuzDZpxTxGfOFw1bLnQ
	MFIJC7okEkBXvHgVY45GxphQxuMDCmtcRXM+W0ZD6D//plYLjvNNglwQqKtAwN5tYReScwo96DdHP
	MMGizkExgQCdc7tw84tBjPGqRe+HZMeRgmUakvE2EIK7Q9mtfx20vFpAEcVNpIP97VyV4CBvzs7dL
	z867hnqsl+tlceItyETKFk3MWoLfQEGPfl2zuy919mf9y9d2W84ijOBdiFlMrlHFJ5YHyFr/EXKOs
	9v0nNVgKZqEGI9SPpqkXDycJgFmnVKXvysUr1d62XMZ7lWMJirYtHChsjiOr4BGwIrNMEv9Ca5TZa
	EUsKM3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdf7v-00000009rCz-2WtG;
	Fri, 31 Jan 2025 00:43:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdf7t-00000009rCf-38CH
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 00:43:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59ED6A40A1B;
	Fri, 31 Jan 2025 00:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DFFC4CED2;
	Fri, 31 Jan 2025 00:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738284196;
	bh=osraKWffuRHi5+Fhgf1LBp5HE5wFaVm6SYw/LayD9sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jP2AQrKj6JoQ+QiZt4GZH8uInvOkEkg9jcocIfDTt+/9FLrG4JPI1USmF7qLYjb1K
	 68GGOzKwtKzBC9yusZjLtcDt3fWF4yioMk6TlL/tFJO4Zo/X4wY8CTVpF+K7ytz/I7
	 IMkYyrD+72HNyMg3esuosSBrf3wMbGSZE9CzhriFYxVcawtBr8PLCzZlA76lhsIXMu
	 c8zTwSd+/ZEllWdPFRjxHIvoUd7NWluRdUgEfRISLcVoZ6exTTIkDmFr+NESdMrSa+
	 NKr5NnuzE3iuTHjCjdYWtX2nJ2xhgqw16qgsfb8jnlvkTKDF5V2/jbUhUdSrCzywqy
	 /l57sIdJzg0AQ==
Date: Fri, 31 Jan 2025 00:43:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Fix the PAUSE Opcode for MIPS P8700.
Message-ID: <20250131-unknotted-yoga-bccacad0c6d3@spud>
References: <20250129131703.733098-1-arikalo@gmail.com>
 <20250129-museum-slider-3bb634d124de@spud>
 <Z5wEKS9q8-nYPO7h@ghost>
MIME-Version: 1.0
In-Reply-To: <Z5wEKS9q8-nYPO7h@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_164317_926657_695D4501 
X-CRM114-Status: GOOD (  34.16  )
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
Content-Type: multipart/mixed; boundary="===============8943735309950411931=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8943735309950411931==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AWGKnN15am8RC/Ax"
Content-Disposition: inline


--AWGKnN15am8RC/Ax
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 02:58:49PM -0800, Charlie Jenkins wrote:
> On Wed, Jan 29, 2025 at 04:19:58PM +0000, Conor Dooley wrote:
> > On Wed, Jan 29, 2025 at 02:17:03PM +0100, Aleksandar Rikalo wrote:
> > > From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> > >=20
> > > The riscv MIPS P8700 uses a different opcode for PAUSE.
> > > It is a =E2=80=98hint=E2=80=99 encoding of the SLLI instruction, with=
 rd=3D0, rs1=3D0 and
> > > imm=3D5. It will behave as a NOP instruction if no additional behavior
> > > beyond that of SLLI is implemented.
> >=20
> > You say p8700, but the erratum will be applied on all systems that are
> > identified as using a mips cpu. Why's that?
> >=20
> > > +void mips_errata_patch_func(struct alt_entry *begin,
> > > +					     struct alt_entry *end,
> > > +					     unsigned long archid,
> > > +					     unsigned long impid,
> > > +					     unsigned int stage)
> > > +{
> > > +	struct alt_entry *alt;
> > > +
> > > +	BUILD_BUG_ON(ERRATA_MIPS_NUMBER >=3D RISCV_VENDOR_EXT_ALTERNATIVES_=
BASE);
> > > +
> > > +	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> > > +		return;
> > > +
> > > +	for (alt =3D begin; alt < end; alt++) {
> > > +		if (alt->vendor_id !=3D MIPS_VENDOR_ID)
> > > +			continue;
> > > +
> > > +		if (alt->patch_id >=3D ERRATA_MIPS_NUMBER) {
> > > +			WARN(1, "MIPS errata id:%d not in kernel errata list\n",
> > > +			     alt->patch_id);
> > > +			continue;
> > > +		}
> > > +
> > > +		mutex_lock(&text_mutex);
> > > +		patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt), alt->alt_len=
);
> > > +		mutex_unlock(&text_mutex);
> > > +	}
> > > +}
> >=20
> > > diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/ar=
ch/riscv/include/asm/vdso/processor.h
> > > index 662aca039848..880f26a24f69 100644
> > > --- a/tools/arch/riscv/include/asm/vdso/processor.h
> > > +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> > > @@ -14,7 +14,10 @@ static inline void cpu_relax(void)
> > >  	__asm__ __volatile__ ("div %0, %0, zero" : "=3Dr" (dummy));
> > >  #endif
> > > =20
> > > -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> > > +#ifdef CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE
> > > +    /* MIPS P8700 pause opcode */
> > > +    __asm__ __volatile__ (".4byte 0x00501013");
> > > +#elif CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> > >  	/*
> > >  	 * Reduce instruction retirement.
> > >  	 * This assumes the PC changes.
> >=20
> > What about when the erratum is enabled and the toolchain supports
> > Zihintpause?
>=20
> So the other way to do this is having an hwprobe call to check if the
> currently running processor is effected by this. However I was concerned
> about the performance penalty of calling hwprobe here in the previous
> version so I had suggested to use a flag instead so there is not the
> penalty on other architectures. This does make it invalid to enable
> this errata in the defconfig. This is a precedent for how we want to
> handle errata in tools.

Gonna have to be marked non-portable then, if enabling it results in
tools that might malfunction on other platforms.

> > Why don't you use the same implementation as the !tools
> > copy of the header? (I'm not sure why they're different in the first
> > place).
>=20
> It is different because the headers in tools are userspace so it doesn't
> make sense to have alternatives.

I assume that's an answer to the first part, and not the bit in
brackets since the "first place" difference is about using the .4byte
versus having an ifdef/else and you're talking about alternatives.
That looks to have been some sort of sync issue or oversight in
6da111574baff, no?

--AWGKnN15am8RC/Ax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5wcoAAKCRB4tDGHoIJi
0kGxAP9gLiRmKNud2bm4Gduu7MiGiDBQE0OTEQ+uFliEN11tFwEA4ORbhIgElazM
/i2u5edP/3BVuE3y6mhHA1KLijH4Ewg=
=et18
-----END PGP SIGNATURE-----

--AWGKnN15am8RC/Ax--


--===============8943735309950411931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8943735309950411931==--

