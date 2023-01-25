Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F40C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 22:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29osVTJkhVXiy/0Rvwx/8Lq8rr821wygPbF3KhpW8is=; b=3cTWF/CQBNMVz+2fv1HZz9zi2f
	LuNqjYASYhkXb6uP2mSW6nyCRWlxsZgOZQqLTUOt332X4gK18dhHWVQqX040tVZKi+ndOyztl9UYm
	UatCc4pSAK6i0t6t/NI3hcDtvkts+Xb/MsDsUDtZIujQcA530rPu3NCv2vhpm0uqLoGdhxfxte9VW
	fJLi+vhIe3fHshwnrdVf648UsdjReY3LZ7PzGmf3vBFjnARMqhPf3sywbDT9x/F12mtFf82V/+Nh6
	AMvP2dBUp7GVTIGMeug2gFuoLVMHl8wRNJfbvq5w/MAhMKZUl/L11gyIHlbaBDdFkaBZM6TCt3ZoL
	4teZhxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKoBg-009051-QR; Wed, 25 Jan 2023 22:24:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKoBc-00903K-UA; Wed, 25 Jan 2023 22:24:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 255C2B81BA0;
	Wed, 25 Jan 2023 22:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D12DC433D2;
	Wed, 25 Jan 2023 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674685445;
	bh=3Smre9hQ8LhrSiYVHVRxfH8uc7mGX4apvAk3pyqUt+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WUpHi/eXfd2xdkVvLMv3dJ/dxAd33pO3g5hAcZYwGxdC+phESA47b+K7CdGfXPO4h
	 N8ZjiBbMht5mYjYg8W/PT/8Swlya8izl79PYG6+ZW85aDI8zboEFaKptBdly3BloYQ
	 23lo37WoYBIM022gwyGnBXEuTE8fv/bm9vZ30xgDzyI342ulYE1y5UZtFxXZeJPLvE
	 hTAclaPeHqrecxihI1HK+WGxggzIVF4E6wo+agjgDAOdoosxWG2InisxoQ1+Yi0yax
	 z7RWv3mgutGHwPRxHytffPnyDjZMq5YskFlDuPgmHqXMB8Z5cE8uZDwMqLmExauF8+
	 gZn+iOYa6RxQg==
Date: Wed, 25 Jan 2023 22:24:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
Message-ID: <Y9GsAOPMVX4qGero@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-20-andy.chiu@sifive.com>
 <Y9GZbVrZxEZAraVu@spud>
 <08DF16C6-1D76-4FBE-871C-3A37C5349C87@jrtc27.com>
MIME-Version: 1.0
In-Reply-To: <08DF16C6-1D76-4FBE-871C-3A37C5349C87@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_142409_293536_38B8CD39 
X-CRM114-Status: GOOD (  33.81  )
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
Content-Type: multipart/mixed; boundary="===============3007513589373517460=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3007513589373517460==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eIlcdKBA1YhB0Yws"
Content-Disposition: inline


--eIlcdKBA1YhB0Yws
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 09:38:00PM +0000, Jessica Clarke wrote:
> On 25 Jan 2023, at 21:04, Conor Dooley <conor@kernel.org> wrote:
> > On Wed, Jan 25, 2023 at 02:20:56PM +0000, Andy Chiu wrote:
> >=20
> >> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> >> index 12d91b0a73d8..67411cdc836f 100644
> >> --- a/arch/riscv/Makefile
> >> +++ b/arch/riscv/Makefile
> >> @@ -52,6 +52,13 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32ima
> >> riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
> >> riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
> >> riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
> >> +riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> >> +
> >> +ifeq ($(CONFIG_RISCV_ISA_V), y)
> >> +ifeq ($(CONFIG_CC_IS_CLANG), y)
> >> +        riscv-march-y +=3D -mno-implicit-float -menable-experimental-=
extensions
> >> +endif
> >> +endif
> >=20
> > Uh, so I don't think this was actually tested with (a recent version of)
> > clang:
> > clang-15: error: unknown argument: '-menable-experimental-extensions_zi=
cbom_zihintpause'
> >=20
> > Firstly, no-implicit-float is a CFLAG, so why add it to march?
> > There is an existing patch on the list for enabling this flag, but I
> > recall Palmer saying that it was not actually needed?
> > Palmer, do you remember why that was?
> >=20
> > I dunno what enable-experimental-extensions is, but I can guess. Do we
> > really want to enable vector for toolchains where the support is
> > considered experimental? I'm not au fait with the details of clang
> > versions nor versions of the Vector spec, so take the following with a
> > bit of a pinch of salt...
> > Since you've allowed this to be built with anything later than clang 13,
> > does that mean that different versions of clang may generate vector code
> > that are not compatible?
> > I'm especially concerned by:
> > https://github.com/riscv/riscv-v-spec/releases/tag/0.9
> > which appears to be most recently released version of the spec, prior to
> > clang/llvm 13 being released.
>=20
> For implementations of unratified extensions you both have to enable
> them with -menable-experimental-extensions and have to explicitly
> specify the version in the -march string specifically so this isn=E2=80=
=99t a
> concern. Only once ratified can you use the unversioned extension,
> which is implicitly the ratified version (ignoring the whole i2p0 vs
> i2p1 fiasco).

Ahh, thanks for the clarification Jess.

> But no, you probably don=E2=80=99t want experimental implementations, whi=
ch can
> exist when the ratified version is implemented in theory (so there=E2=80=
=99s no
> compatibility concern based on ISA changes) but isn=E2=80=99t deemed
> production-ready (e.g. potential ABI instability in the case of
> something like V).

And I guess, if you turn it on for one, it's on for all.
While the vector extension might be okay in that regard, another
extension well not be okay to use the "unversioned" experimental version
of. Sounds like removing that option and picking the version of clang
that adds the actual implementation is a better approach, at least IMO.


--eIlcdKBA1YhB0Yws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9GsAAAKCRB4tDGHoIJi
0hqFAQC48XA84lz48uhvAtpzLEHeMOU2tUpSJ8GlckABIXQCJwEA3wPARCef7sAh
co6sjKqf4Skq3blkPVYO104tRYo0AAc=
=bxFQ
-----END PGP SIGNATURE-----

--eIlcdKBA1YhB0Yws--


--===============3007513589373517460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3007513589373517460==--

