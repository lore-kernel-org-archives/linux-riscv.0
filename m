Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E67C7EE2E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 07:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtrNCd6Nf2XLiJJvYd1p7t2hqU/ihMAaVDoqImDo5Zw=; b=Jn9UpMJDZUQjGwnSmrM8yNSPL7
	Ia3m3SfCC4KaF5kYLC1hRQ2X/L0fM7/naGxhmDjwn0k9JUQ/HvfOLKgwTAj6UPGdrRW1f/4SLWJ6X
	Cd2ZThkKeu3rKm/D4y9njoh/DA3GQRWtpcFHFo3o/TZqhlPEDpkYOYECJv7pXqbaCeWIunjIMdTty
	88M8Oxz+Oh15j3xuyeoUEa0iWV9i0ps3CdQfwcHGo2qWcza93ZfSr3v0XrX3kQz9bzXM8Te7qH0NM
	Y/4PF7NQ9g8VPi11IrB6aVhKDDDG6qvYqeG+PazthVK6At36JHsIviieK+JD96v9b/y+2TZdGW1tw
	ruJPCdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q79eh-008Kwv-00;
	Thu, 08 Jun 2023 07:01:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q79ec-008Kvn-1T
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 07:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686207714; x=1717743714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZZLdqZM7DUuJb+zfCqM9sRlIRP3z6YOCxQmfCfYvk1o=;
  b=Ue27OM/MkXujlocUQPU0sj26Il0xxHLQS4XERmPLOheGdJ4y6dxNgBzg
   uCqNUgYn01Wx5o7WZEdIbycTt79deC4MNJKD2Ncl/oMKHZd07i9OOApHj
   XljdHq0fY4gMwLsREzkmCrSTMZlbVReJvzXWp2FpQC5j5DpLTVUOYCYOe
   0b/o9l0itC1dJVlLurS4liv+ZIJf/BAIY35WWDDWid1dyfpcRZp5m8Rrz
   ndmo/A1fH2KDEy15Th1IipF5QQqcgcd1qityKItMIPq29vlWHGvG0gnGN
   x8r5OKiAlyjpotku4R3QNF7nyQownsUZX3JFEIrUYUkdBMmlr+Vmia9Gq
   w==;
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="asc'?scan'208";a="219382726"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jun 2023 00:01:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 8 Jun 2023 00:01:43 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 8 Jun 2023 00:01:40 -0700
Date: Thu, 8 Jun 2023 08:01:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Jonathan
 Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	<rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230307102441.94417-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_000154_580199_B4E03C17 
X-CRM114-Status: GOOD (  12.76  )
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
Content-Type: multipart/mixed; boundary="===============5716849815253418961=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5716849815253418961==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ka1WzDdcwslcLLPy"
Content-Disposition: inline

--Ka1WzDdcwslcLLPy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Kwang,

On 08/06/2023 05:46, =EC=86=90=EA=B4=91=ED=9B=88/Tizen Platform Lab(SR)/=EC=
=82=BC=EC=84=B1=EC=A0=84=EC=9E=90 wrote:
> Hi,
> Recently I'm trying to put a rust patch on the risc-v board.
> I saw a patch [1] and looked through it roughly.
> Only if llvm(not gcc) is allowed, it looks good with no major problems.
>=20
> > I'll revisit this when my thoughts have settled down.
>=20
> If you let me know the problematic part, may I try the patch?
>=20
> [1] https://lore.kernel.org/linux-riscv/20230405-itinerary-handgrip-
> a5ffba368148@spud/

Yeah, you can definitely try this or the downstream rust-for-linux
project - both should work well on RISC-V.
The problematic part is figuring out what ISA extensions are supported
by the rust compiler being used (and by bindgen), and deciding what to
put in -march as a result.

I think it is unlikely to matter for you, unless you're aggressively
mixing versions for different parts of your toolchain.

I do intend revisting this, probably after the min. version for rust
gets bumped, I've just been really busy with other work the last weeks.

Cheers,
Conor.

--Ka1WzDdcwslcLLPy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIF8rgAKCRB4tDGHoIJi
0k0tAP9oSP5G1PJWtLGyf1+R6tsih6t/Fcf8f5aQBdxxrsXn/gD/UYOgt9r9Nkht
w/d+pWUDXdDuNyfeTgh/x6BfVqn+TAo=
=QM1l
-----END PGP SIGNATURE-----

--Ka1WzDdcwslcLLPy--


--===============5716849815253418961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5716849815253418961==--

