Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1416EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAxl/9urk4lxRwIngGNq4KeKpnamQQC1qbeJu++b1ZE=; b=hfACVF+73VcKeA2fK9NPXzrJhK
	6bcX+HZdV2pxooW2ay/27lP8OYVKxWAUVqSTu3deV3QzwHv92qxAy9snr0wegkRKOUfB0LCJjMoNe
	z+Jn3ayjE7O7LJuS74DoHYVtWtEA5XmORvZHQMVBv9C0FCllmnFQ5thetoi7CYzGZ+79rrCpZn0Jh
	L0iCMPHE3/doJ+lbC0TWC+LdfS82Uuqvy3zX+cu/XNjdUsVT33vI1Qaw8Q626h3Ku+MMITn8U+ljr
	j8Brj7fkjJ1Usy3Wi2ZzvcVE1D8+3msjxE4tMsL0IicuwntYy16aYd+ICpza5vKz+b5S3T0rp+xPB
	xwpH5FGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKLyk-006gKJ-2M;
	Fri, 14 Jul 2023 16:49:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKLyi-006gJ4-2W
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 16:49:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A6DE61D61;
	Fri, 14 Jul 2023 16:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60D6C433C8;
	Fri, 14 Jul 2023 16:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689353351;
	bh=wrvm85rpUKJvNzsGJuulgx0fZzfIPbGow1TQ3F7WIZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMP2dQXQX3KksnQ87Yf0g7ixHYTfgbww5O56hL6BURnGRgHcnVky9wlSXdx7ZcAXH
	 N/qhftW6TcSy1FVC+SRqpr64zkUGGt5MsaRCGS/5WcGR00wp33TNfQblT41z4FWwFM
	 nXx80vBxitiuugAHjDz+Fwx5NGlQgUmhKFrXItdizdQXIfLkF9kobmLWtwFfW+b3oA
	 zYWdsZmNI6y19wLU3pATzhjJQRom/VDea5JEE1rFHNf5xiKUbarYNck51gTMuggTbV
	 k6PBp9jkI8SK1L33RKiMa9SSEcjGIHiFJbcfbkYHOr1O+53imE4THl2kbn09WINwul
	 cbvStONnN6JsA==
Date: Fri, 14 Jul 2023 17:49:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: Re: [PATCH v5 0/4] RISC-V: mm: Make SV48 the default address space
Message-ID: <20230714-tapering-driller-474e5581587b@spud>
References: <20230714001430.75798-1-charlie@rivosinc.com>
 <20230714-hangnail-stinking-60f9725ac0d5@spud>
 <ZLF5nS12R37loA9I@ghost>
MIME-Version: 1.0
In-Reply-To: <ZLF5nS12R37loA9I@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_094912_883296_39993B3D 
X-CRM114-Status: GOOD (  18.85  )
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
Content-Type: multipart/mixed; boundary="===============0861076407517944907=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0861076407517944907==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fWc2GpvHl7O6XfFi"
Content-Disposition: inline


--fWc2GpvHl7O6XfFi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 09:36:45AM -0700, Charlie Jenkins wrote:
> On Fri, Jul 14, 2023 at 12:17:00PM +0100, Conor Dooley wrote:
> > On Thu, Jul 13, 2023 at 05:13:59PM -0700, Charlie Jenkins wrote:
> > > Make sv48 the default address space for mmap as some applications
> > > currently depend on this assumption. Users can now select a
> > > desired address space using a non-zero hint address to mmap. Previous=
ly,
> > > requesting the default address space from mmap by passing zero as the=
 hint
> > > address would result in using the largest address space possible. Some
> > > applications depend on empty bits in the virtual address space, like =
Go and
> > > Java, so this patch provides more flexibility for application develop=
ers.
> >=20
> > The patchwork automation failed to apply this, what is the base for the
> > series?
>=20
> I forgot to pull in the changes to the riscv selftests so the conflict
> is in that Makefile. I will send out a v6 with the correct base.

If you don't actually _depend_ on the content of those changes to the
self tests, then just submit on top of v6.5-rc1 & Palmer can sort out
the conflicts.

--fWc2GpvHl7O6XfFi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLF8ggAKCRB4tDGHoIJi
0m07AQCj+lIfVeQE4qpYSA7caL2Mx/b/6avQrccHw0jj58/tHAEAySe+TvuXvxDU
vH9Tt3i4AfDoonrbuk1+fvb154INugw=
=GRef
-----END PGP SIGNATURE-----

--fWc2GpvHl7O6XfFi--


--===============0861076407517944907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0861076407517944907==--

