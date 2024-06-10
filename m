Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116CBC27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5log0IB+duBc4Yx7xzn9OUwj3Dwk2+h+/2wUkfP+wQ=; b=xQbpxqoVh6xr8EMtD967osm0/D
	JCA0s9EzcethUs/zlAH8pHvFuQ+4yMcyb55uJyOWLQoyWbLhHx85vqSUD7KLZltX64NYPfn/pW/se
	2HXvs3Iqqq5hWIV/kFavVwRuiBZdtaB0G07rYwe+iCN1sP9BzN+GDl983+Ehr6QR2D1x4kBV2mvyF
	wgF96djpAdudHfXs1rO90ihoSZmf/q8BSZ8NqGyjUh6/A0viidwsfRhkktprwm0Aw1GJy2ZC8ToUF
	Cqdt0zPzKMc9kD2niGdY4BILfl9mZyKHrJIj4xA1zTz6a/ublNMKwouxsj5A7fijEiF+VDKefYLhP
	hPk+NXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGavb-00000004Npv-0oC3;
	Mon, 10 Jun 2024 09:02:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGavX-00000004Nok-2JP0
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 09:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718010175; x=1749546175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=05NXpM8nBmvJm7pP7VJ8kWbii76EwTm7ZQyCuYD0Wjk=;
  b=tvxIml1p8oby92zLKJgYPGrrjLTHQX49RTIxXz9SgidlO5jdn5lzZ5+f
   PpY4eGsrYs4h7KNk4isvb4tdGmYDIWC0GTIZGCA6l78VMDm1vqqdLCjNn
   vLqyFazBqhB4Lw53zNMOFx1gruJtDjS5KARRoMutvgOD+0lRRz9qoSXUi
   qh1G3LjUChKEelOK7+1jOyl7H0Q2g7MQ2FF/YOs2UKGzErgI3an0QNM+5
   nLgpRvMSH/8gFE9ekRrRrHdLaSpcrbHSNsRcFhqGee2PUZyH/Ntbp3l+j
   D00hwz7AUn1XfnjWlQMpYFN7FHhfOemibOPhh0T33XzO5U0eEP9g/C7zk
   g==;
X-CSE-ConnectionGUID: hKcqPKvETJCFPadg1pNHsQ==
X-CSE-MsgGUID: glZcGm/MRXy8NIsgEhKyrQ==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="asc'?scan'208";a="29619861"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 02:02:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 02:02:35 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 02:02:32 -0700
Date: Mon, 10 Jun 2024 10:02:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jesse@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Masahiro Yamada
	<masahiroy@kernel.org>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <20240610-qualm-chalice-72d0cc743658@wendy>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
 <20240603-stinking-roster-cfad46696ae5@spud>
 <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
 <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_020255_699747_B67F6E54 
X-CRM114-Status: GOOD (  37.42  )
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
Content-Type: multipart/mixed; boundary="===============1036494348391635506=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1036494348391635506==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nVgNDjGj7iR73dzp"
Content-Disposition: inline

--nVgNDjGj7iR73dzp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 10:33:34AM +0200, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 07/06/2024 20:51, Deepak Gupta wrote:
> > On Mon, Jun 03, 2024 at 01:47:40PM +0100, Conor Dooley wrote:
> >> On Mon, Jun 03, 2024 at 11:14:49AM +0200, Alexandre Ghiti wrote:
> >>> Hi Conor,
> >>>
> >>> On 31/05/2024 19:31, Conor Dooley wrote:
> >>> > On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
> >>> > > Dectect the Zkr extension and use it to seed the kernel base
> >>> address.
> >>> > >
> >>> > > Detection of the extension can not be done in the typical
> >>> fashion, as
> >>> > > this is very early in the boot process. Instead, add a trap handl=
er
> >>> > > and run it to see if the extension is present.
> >>> > You can't rely on the lack of a trap meaning that Zkr is present
> >>> unless
> >>> > you know that the platform implements Ssstrict. The CSR with that
> >>> number
> >>> > could do anything if not Ssstrict compliant, so this approach gets a
> >>> > nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
> >>> > it, so you're stuck with getting that information from firmware.
> >>>
> >>>
> >>> FYI, this patch is my idea, so I'm the one to blame here :)
> >>>
> >>>
> >>> >
> >>> > For DT systems, you can actually parse the DT in the pi, we do it
> >>> to get
> >>> > the kaslr seed if present, so you can actually check for Zkr. With
> >>> ACPI
> >>> > I have no idea how you can get that information, I amn't an ACPI-is=
t.
> >>>
> >>>
> >>> I took a look at how to access ACPI tables this early when
> >>> implementing the
> >>> Zabha/Zacas patches, but it seems not possible.
> >>>
> >>> But I'll look into this more, this is not the first time we need the
> >>> extensions list very early and since we have no way to detect the
> >>> presence
> >>> of an extension at runtime, something needs to be done.
> >>
> >> Aye, having remembered that reading CSR_SEED could have side-effects o=
n a
> >> system with non-conforming extensions, it'd be good to see if we can
> >> actually do this via detection on ACPI - especially for some other
> >> extensions that we may need to turn on very early (I forget which ones=
 we
> >> talked about this before for). I didn't arm64 do anything with ACPI in
> >> the
> >> pi code, is the code arch/x86/boot/compressed run at an equivilent-ish
> >> point
> >> in boot?
> >=20
> > cc: +Clement and Atish
> >=20
> > I don't know all the details but on first glance it seems like instead
> > of ACPI,
> > may be FWFT is a better place for discovery ?
> > https://lists.riscv.org/g/tech-prs/topic/patch_v12_add_firmware/1064795=
71
>=20
> IMHO, doing discovery in FWFT is not the goal of this extension. I think
> the "real" solution would be to wait for the unified discovery task
> group to come up with something for that (which is their goal I think) [1]

I'm curious to see how that works out. The proposal documents an m-mode
csr, so we'd have to smuggle the information to s-mode somehow...

> Link: https://github.com/riscv/configuration-structure [1]


--nVgNDjGj7iR73dzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmbBFwAKCRB4tDGHoIJi
0sWEAQDPxN3POosNf57iZnY6Z1DcNcP3FdzrGhHkHg4ueiwu1AD/ZRj3S4UJPdS1
49Ojq7L47qyv+ZSH3aIChFHIuU+5VQw=
=ZOKe
-----END PGP SIGNATURE-----

--nVgNDjGj7iR73dzp--


--===============1036494348391635506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1036494348391635506==--

