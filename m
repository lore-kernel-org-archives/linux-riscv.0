Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C90606A331
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 21:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UBINUmGb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fNm36Zy8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y1Wl9GyMqamdbWlittpePjHULnhPQftR57uRG3aZdo4=; b=UBINUmGbWxfL4qVHzSM1gLccS7
	BhPvuTOJ8Xswz6Gspp2cz1Yxijm9qzZOBe1cUjeH8qzfNOHCFCMjpAAAuKWu/lb982fnWN5qW3X/S
	CoalXPi+UZg6WZSys5uoNU2qY5mb154m95h0ePB98WNugy2dryWNEzwPpwpRDws1tTxWLRk+9oLbr
	TwvcvdoShKgtDfZtuI9LewN5yFtzEXMVKJVc2WlVERaN4EzDrB1kn691uCTbaq+bsYh+2Cm5qEJAX
	BmtD//H8/cF+aFogTylzOkB88T16H23td2hfTTM0VGtwJgeJwsDL9BJIHL4Hd2bQRHMVMe/yWUWZO
	kqDjK4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOima-000000075Am-09P8;
	Wed, 04 Nov 2026 21:44:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOimY-000000075AU-3Saa
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 21:44:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48EEF61445;
	Wed,  4 Nov 2026 21:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761E61F00A16;
	Wed,  4 Nov 2026 21:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793828674;
	bh=PY2sdrCi0+0sX7qsNuAbBBVp/LVsxKLCDHHWfHblhQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fNm36Zy877ytogwQ88aKuSZ/ktzojEay7m3d7wRK6ckNpPG3E00aRuHhrsFvflqKN
	 cJ5mkxQCwrTMOH4Gfx5FAYNOzM9XYVQO1tKlrBF+dKA7qSOyltU8FGHOkJu85VnIXh
	 BeUdBLNb7s1+8/sE+Oi004RzbK8adr0yBEZ7lLw8PUz5rbfs52JI2E4nZsAZD3QWl1
	 uv8UR3KYrlT6AOY4ia9LG7oxzyH8zXFYWunQVrn+K6yJVAPE01Hrkkcf40HDEVIetb
	 VAu1XRKa4bz9Rbiw14sZkiWD8cbmHvrC37yDmcJTGET4I6/acfTJ/3rps4tCOLEyKx
	 ofisDSJUx1BZg==
Date: Wed, 4 Nov 2026 21:44:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <20261104-headlamp-improve-21863d9ca13e@spud>
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
 <20261101-lrsc-only-v4-1-4e1d010463b3@mobileye.com>
 <20261103-distance-audio-9b6aac0b1b4b@spud>
 <28a25fef-2a53-4d4f-b43e-6e8740c08e1e@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <28a25fef-2a53-4d4f-b43e-6e8740c08e1e@mobileye.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6518605153361695220=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6518605153361695220==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fpKJwq6g+nGE1k16"
Content-Disposition: inline

--fpKJwq6g+nGE1k16
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 01:41:44PM +0200, Vladimir Kondratiev wrote:
> On 11/3/26 23:09, Conor Dooley wrote:
> >> +config TOOLCHAIN_HAS_ZALRSC
> >> +	bool
> >> +	default y
> >> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64im_zalrsc)
> >> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32im_zalrs=
c)
> >> +
> >> +config RISCV_ISA_ZAAMO
> >> +	bool "Zaamo extension support for AMO atomics" if NONPORTABLE && TOO=
LCHAIN_HAS_ZALRSC
> >=20
> > Probably this option should be called something like
> > TOOLCHAIN_HAS_ZALRSC_ZAAMO if you're going to use it like this, because
> > it is confusing why ZALRSC gates a ZAAMO option.
> >=20
> > I'm curious actually, does every toolchain provide zalrsc and zaamo as a
> > pair, or should you check for both here? I'd be surprised if there was a
> > toolchain with one but not the other but worth checking to avoid some
> > bizarre toolchain bug..
>=20
> Agree, will be in next version.
>=20
> > Ah, right. But that kinda goes against how NONPORTABLE is meant to work
> > since the default cannot run on all platforms? At that point, just get
> > rid of NONPORTABLE?
>=20
> Agree, dropping NONPORTABLE
>=20
> > | My logic when adding it:
> > | There are 2 sets of extensions related defines: one is Kconfig ones,
> > | CONFIG_RISCV_ISA_<ext>; and another one found in the
> > | arch/riscv/include/asm/hwcap.h, RISCV_ISA_EXT_<ext>
> > |=20
> > | In the hwcap.h, there's already
> > |=20
> > | #define RISCV_ISA_EXT_ZAAMO		97
> > | #define RISCV_ISA_EXT_ZALRSC		98
> > |=20
> > | added by commit 35173b666a16 (riscv: add parsing for Zaamo and Zalrsc
> > | extensions, 2024-06-19)
> > |=20
> > | These 2 sets are logically coupled, and used in the BPF JUT code like
> > |=20
> > | #define rv_ext_enabled(ext) \
> > | 	(IS_ENABLED(CONFIG_RISCV_ISA_##ext) &&
> > | riscv_has_extension_likely(RISCV_ISA_EXT_##ext))
> > |=20
> > | So I thought if RISCV_ISA_EXT_ZALRSC exists although it is mandatory,
> > | CONFIG_RISCV_ISA_ZALRSC counterpart should exist for the same reason.
> > |=20
> > | Do you suggest this is different case and it is worth to remove
> > | CONFIG_RISCV_ISA_ZALRSC anyway?
> >=20
> > If this is the justification for it, then you need to provide this
> > justification in your commit message - but if zalrsc is always enabled
> > then there's no need for any code like that in the bpf jit in the first
> > place, once more making this dead code that should be deleted?
>=20
> Adding justification. Also, it is possible to have zaamo+zacas and not
> support zalrsc; in this case CONFIG_RISCV_ISA_ZALRSC will be "n"; adding
> clause explaining this theoretical option.

Key word, theoretical. We do not support zaamo + zacas only systems.
Please do not add "code" that a) has no actual user and b) would only be
useful if we supported something that we do not support.

Thanks,
Conor.

>=20
> >> +# Zaamo is off only when the compiler accepts _zalrsc in -march.
> >=20
> > I think the comment here is not quite right, it should be "can only be
> > off", no?
>=20
> Sure, fixed
>=20
> >> +ifneq ($(CONFIG_RISCV_ISA_A),y)
> >> +riscv-march-$(CONFIG_RISCV_ISA_ZAAMO) :=3D $(riscv-march-y)_zaamo
> >=20
> > Isn't this dead code? The logic for RISCV_ISA_A is:
> > config RISCV_ISA_A
> > 	def_bool RISCV_ISA_ZAAMO && RISCV_ISA_ZALRSC
> > but ZALRSC is always set, so RISCV_ISA_A is equivalent to
> > RISCV_ISA_ZAAMO so there can't be a case where RISCV_ISA_A is not set
> > but RISCV_ISA_ZAAMO is?
> >=20
> >> +riscv-march-$(CONFIG_RISCV_ISA_ZALRSC) :=3D $(riscv-march-y)_zalrsc
> >=20
> > And here, this is effectively just riscv-march-y, since if you get as
> > far as here, it must be true.
>=20
> See above, in theory one can have zaamo+zacas but not zalrsc
> > | > ...why are we making this a compiletime decision in the first place?
> > | > Why can't this be an alternative, starting with the zalrsc stuff and
> > | > moving to the better implementation if available?
> > |=20
> > | I started with alternatives approach, see
> > | Suspicious Link - Removed
> > | Then I converted it to the static compile-time decision following inp=
ut
> > | from Gary Guo that I think is valid, here:
> > | Suspicious Link - Removed
> >=20
> >=20
> > Okay, that logic from Gary does make some sense. I'll accept that
> > argument, but again this needs to be communicated in the commit message.
>=20
> Done
>=20
> > | There's BPF JIT that emits AMO instructions, patch for this is not re=
ady
> > | yet. These AMO instructions will be emulated and work correctly but v=
ery
> > | slowly.
> >=20
> > I think that needs to be part of this series. You're far too focused on
> > your individual platform where the instructions work, rather than the
> > holistic solution of lowering our minimum requirements so that platforms
> > that do not have any AMO support work. The only way that it'd make sense
> > to move forward with this without the bpf jit patch is if you disabled
> > bpf entirely when RISCV_ISA_ZAAMO is disabled.
>=20
> Added patch for BPF JIT.
>=20
> Also, added is patch for kprobes/uprobes, to reject probes inside lr/sc
> sequence. This is needed anyway, having lr/sc blocks for any atomics
> only increase chances but we do have lr/sc blocks in code anyway and
> need to protect it.
>=20
> >=20
> >> +#if defined(__riscv_atomic) || defined(__riscv_zaamo)
> >=20
> > Something else to note is that we do not use this pattern anywhere else
> > in arch code as far as I know? We always use the RISC_ISA_WHATEVER
> > config option to gate conditional stuff. Since RISCV_ISA_A is equivalent
> > to RISCV_ISA_ZAAMO (unless I am mistaken there somehow) this just colla=
pses
> > to a single check?
>=20
> Agree, replacing with #ifdef CONFIG_RISCV_ISA_ZAAMO>> +#else
> >> +#error "Need AMO or LR/SC atomics"
> >=20
> > And this error is actually unreachable?
> >=20
> > (and so on in every other place that this pattern is repeated)
>=20
> Agree, removed
> Thanks, Vladimir

--fpKJwq6g+nGE1k16
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauunPAAKCRB4tDGHoIJi
0rZRAP0SIBd4mnf7eT0t0SQJrop+mJT+JpuiCueBxbZ6t3a76QEA4s32hCwCVa6F
I+9s9JyOz9O+zn7y5U2kFfES3EWRbAE=
=GDnv
-----END PGP SIGNATURE-----

--fpKJwq6g+nGE1k16--


--===============6518605153361695220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6518605153361695220==--

