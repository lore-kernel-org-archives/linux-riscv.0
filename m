Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A29C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9hwHXHiyfF9BGv7R8rRpPB1KXMHXwmRb8ItvgA0p0w=; b=GZy5axIgwQccF5Fk/c/ou5Jc8X
	RlkYyIG5me0N1sILrxyg0WyicWXP3KYfCybp4l8oYZ2dU1IEHwnp/7E6XQFQE/8WPvRh1/xNO+5q5
	NdgUh4l7y3IDl0f6Kh/2CMvvWid50WYyVeA5j5kxunjRL2CEYKv9QgQnaN2MthK/hb9psPjP1rBkC
	dUDGlgBB1GyClhzXLIAlUMRRwldc/QIM6+bb5/yJvUCQEzpNaF1PtUE+Q7KqAJDFLo34q37WeHdy1
	pNbMI1gdBhYWzgEfTtDtlHE8esuiyRXCtUWL9AkwkK/QpNcWj6CisQTy6807n/daWs+bgMA0JfECp
	Hm+CV+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xWJ-00DeLE-1e;
	Tue, 30 May 2023 11:28:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xWG-00DeKO-08
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 11:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685446083; x=1716982083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j9I56BwKJC+BbnxkzOeSVjINNxm7Kz+ydMtYSbEYEBo=;
  b=ydbE0TtUI7YMvK6ksKB/S1ZCJh58//iiTMkq3Dm2zDUIAUyQpSUShnWk
   sjaNpIhRDtkZSMEpeHPI2SVix/TsHPzIBwb3WrSTAJRsjzt7ZOHRixnNE
   Hz3bD1tIxypP7f7b2Rh9V5f4tc7El5XhQ9HjcNhr9W1BdaOv9wpgt/IWP
   DoiT/lSuwFgcJEAZkfiyZqLrMvIjAhiNds3EmOSu3abc9UFPbkNOJ+Kqn
   a/dxcqoNZ/xgBvchVnXakdffNjFZW6u2zxIkLcaEedoUDaHx4RoQ+gq9Q
   rLS9IcnNNgdx8sd7u1BuzoNHPHQVpXE4TDWh6/qprt8Pb9U8wruObAMVM
   A==;
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="asc'?scan'208";a="227570029"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 May 2023 04:28:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 04:28:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 30 May 2023 04:27:59 -0700
Date: Tue, 30 May 2023 12:27:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab
	<schwab@linux-m68k.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Message-ID: <20230530-polka-trifle-7ccd7a093099@wendy>
References: <20230526-rockfish-moody-f6d3e71f9d24@spud>
 <f6522c82-01bd-8a03-579d-a5b294784480@ghiti.fr>
 <20230527-hyperlink-doctrine-ef22cfcb508a@spud>
 <CAHVXubgx3uBEjMLHXTxr0192ZHbSb=qK4NggZyWQTDfgrJt2-g@mail.gmail.com>
 <20230528-darkness-grandly-6cb9e014391d@spud>
 <cf0d2d2a-c407-7b3d-a5ab-ea5c19e7b890@ghiti.fr>
 <20230528-uneatable-earpiece-3f8673548863@spud>
 <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
 <20230529-skillet-quarters-3fbc3b6edb3a@spud>
 <41e57bb9-ce0c-7772-abeb-5c01d5ec19bb@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <41e57bb9-ce0c-7772-abeb-5c01d5ec19bb@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_042804_261504_41897E43 
X-CRM114-Status: GOOD (  37.39  )
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
Content-Type: multipart/mixed; boundary="===============4782433831322833920=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4782433831322833920==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ijmS6XfW1T6Cta2t"
Content-Disposition: inline

--ijmS6XfW1T6Cta2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 09:37:28PM +0200, Alexandre Ghiti wrote:
> On 29/05/2023 21:06, Conor Dooley wrote:
> > On Mon, May 29, 2023 at 08:51:57PM +0200, Alexandre Ghiti wrote:
> > > On 28/05/2023 15:56, Conor Dooley wrote:
> > > > On Sun, May 28, 2023 at 03:42:59PM +0200, Alexandre Ghiti wrote:
> > > > > Hmmm, it still works for me with both clang and gcc-9.
> > > > gcc-9 is a bit of a relic, do you have more recent compilers lying
> > > > around? If not, I can try some older compilers at some point.
> > > >=20
> > > > > You don't have to do that now but is there a way I could get your=
 compiled
> > > > > image? With the sha1 used to build it? Sorry, I don't see what ha=
ppens, I
> > > > > need to get my hands dirty in some debug!
> > > > What do you mean by "sha1"? It falls with v6.4-rc1 which is a stable
> > > > hash, if that's what you're looking for.
> > > >=20
> > > > Otherwise,
> > > > https://github.com/ConchuOD/riscv-env/releases/download/v2022.03/vm=
linux.bin
> > > > (ignore the release crap haha, too lazy to find a proper hosting
> > > > mechanism)
> > >=20
> > > Ok, I don't get much info without the symbols, can you also provide t=
he
> > > vmlinux please? But at least your image does not boot, not during the=
 early
> > > boot though because the mmu is enabled.
> > Do you see anything print when you try it? Cos I do not. Iff I have time
> > tomorrow, I'll go poking with gdb. I'm sorry I have not really done any
> > investigating, I have been really busy this last week or so with
> > dt-binding stuff but I should be freer again from tomorrow.
> >=20
> > https://github.com/ConchuOD/riscv-env/releases/download/v2022.03/vmlinux
>=20
>=20
> Better, the trap happens in kasan_early_init() when it tries to access a
> global symbol using the GOT but ends up with a NULL pointer, which is wei=
rd.
> So to me, this is not related to kasan, it happens that kasan_early_init()
> is the first function called after enabling the mmu, I think you may have=
 an
> issue with the filling of the relocations.

Yeah, it reproduces without KASAN.

> Sorry to bother you again, but if
> at some point you can recompile with DEBUG_INFO enabled, that would be
> perfect! And also provide the vmlinux.relocs file. Sorry for all that, too
> bad I can't reproduce it.

New vmlinux & vmlinux.relocs here:
https://microchiptechnology-my.sharepoint.com/:u:/g/personal/conor_dooley_m=
icrochip_com/EZpFNxYYrnNAh5Z3c-rf0pUBBpdPGTLafqdtfcXRUUBkXw?e=3D7KKMHX
They're pretty massive unfortunately & hopefully that is not some
garbage internal-only link.
=2Econfig is a wee bit different, cos different build machine, but the
problem still manifests on a icicle. I've added it to the tarball just
in case.

> > > I tried with gcc-12 and it still works fine on my end, so frustrating!
> > Crap! Also, should you not be enjoying a public holiday rather than
> > debugging?! Or maybe debugging is enjoyable for you...
>=20
>=20
> Ahah, this is what I enjoy doing when the kids finally sleep :)
>=20
>=20
> Thank you again for your very quick feedback, really appreciated!

No worries.

--ijmS6XfW1T6Cta2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHXdqAAKCRB4tDGHoIJi
0lM7AP0U38KNP3c0yvn8PKfKxVr1SpAhJSK43MDqw7G9XFbtGgEAlCUv8lOmrwge
9usJ8IHOH3/p8eTuvB89kQgqwjxZGQg=
=mBwb
-----END PGP SIGNATURE-----

--ijmS6XfW1T6Cta2t--


--===============4782433831322833920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4782433831322833920==--

