Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7728AC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpWmB2qRFFbY494j0CRnd2nZP1H8ADZj/cyqBfG/oRg=; b=VIPOlgBXIELK1NU+qGVjK7NfUC
	xrTDCgSCm2zn1LN5DolHIIcyJzYIlBi2BkvyVGXfgOSzAWP532/vpmdapjUzRPiL1MUzRx3TUcEIf
	i2/FYvBoQ5eJ8l9zJB57MSTTyn1zTIaFi5erKvjaa+SoTiszwrmeKdeLCnv8gl+krgUnPOC6wtuaS
	klFM9hrNmJqOVmnLI22Zoc0652utlOAs4AS/J0VjeHGHVd0/D+at8Pym85vTQC01oUVBBMKeX5Tq0
	LufUONoBIF4Q8XeNJ4y0v3Xn2v3WljXBr+AghtGphqD/BSj4Cgd/BuDPvf8ZaxistdJyS5YTYNoW/
	k9v6FwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rev6o-00000004qg4-0ihU;
	Tue, 27 Feb 2024 10:54:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rev6l-00000004qez-2ZrV
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 10:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709031287; x=1740567287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2dJXeGkL18BLr3sq0Pf/vdUj3hVf2tCKH8bAhmkTlSk=;
  b=pV4vIGzOMFFJFCmNJPL6n9Uvsm7GbmTHFYapyt2j5Km/FmhS9vKk+y7f
   eXumzQxfWS/ildlgajiH+PmowQxqb8WjtWrGgTiDhgQgzZaoXozO7IJh1
   FmHkMiAX8csnthYTE7bRH72CzISa79+GSR3FdrZ0ATtjgLozwLcspeMEN
   SJAC0jRVvz48lYDNkV6C0FDvItA6xAlRodNux65xQ1JRYPI+7zqV2tNXw
   o6QNWcA6XOHNJPS1xMAF7oUa1xjS2/IjVzeX+E9QVBwSDy3nQljR5P5sY
   mHVx8pYFTf5T+BRE6XCj7teDyMi5qptsdfXx5mVdbtRuYKLlP+w4w8DQq
   g==;
X-CSE-ConnectionGUID: 5VRzFmqxShG6JMonl7+fzw==
X-CSE-MsgGUID: 8on+D4dCRzeaeBB4CqE2NA==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="18451573"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 03:54:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 03:54:22 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 03:54:18 -0700
Date: Tue, 27 Feb 2024 10:53:35 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	<linux-riscv@lists.infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Jonathan
 Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	<rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
	<stable@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Ramon de C
 Valle <rcvalle@google.com>
Subject: Re: [PATCH v2 1/3] rust: make mutually exclusive with CFI_CLANG
Message-ID: <20240227-uncertain-amaze-6197e627ad95@wendy>
References: <20240223-leverage-walmart-5424542cd8bd@spud>
 <20240223-perjury-preshow-fc2cf73d552e@spud>
 <CANiq72=mCnm0mKOw5K44PmZ+jF=67jxEEkcXP-E0O8CaUrps=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72=mCnm0mKOw5K44PmZ+jF=67jxEEkcXP-E0O8CaUrps=w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_025447_785990_B689B09E 
X-CRM114-Status: GOOD (  16.12  )
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
Content-Type: multipart/mixed; boundary="===============6722445963213913248=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6722445963213913248==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qesnKr6zWGeidy+1"
Content-Disposition: inline

--qesnKr6zWGeidy+1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 03:45:10PM +0100, Miguel Ojeda wrote:
> On Fri, Feb 23, 2024 at 2:38=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > configuring a kernel without symmetrical support for kfi.
>=20
> Nit: typo.
>=20
> > This probably needs to go to stable. The correct fixes tag for that I am
> > not sure of however, but since CFI_CLANG predates RUST, I blamed the
> > commit adding rust support.
>=20
> Cc'ing Matthew et al. in case this is a problem for them, but I guess
> we can relax it later as needed.

I suspect that nobody has actually sat down and tried it.

I did try to test it but I ran into too many toolchain issues - my
older copies of LLVM (pre 17) are not multiarch as I built them by hand
with PGO for x86 and RISC-V. My LLVM 17 is from kernel.org and has no
libclang. And then the copy of LLVM 18 on kernel.org apparently does not
support kcfi at all. I gave up there, but I don't see how this would not
be a problem on other arches, given rustc never gets told to enable
kcfi.

Cheers,
Conor.

--qesnKr6zWGeidy+1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd2/LwAKCRB4tDGHoIJi
0kCFAQDbFb4J84k51y4ZZDP1Z2Nwwsm14EnLI4s7gDvdwmNr2wD/V+413aDcYoix
UrYilvihx41Q4hI/sSLoniAT8LzW/Qg=
=eco2
-----END PGP SIGNATURE-----

--qesnKr6zWGeidy+1--


--===============6722445963213913248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6722445963213913248==--

