Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8308C678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 12:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3soMHEAjrAfwWNMhfbXUyi3qTMnV9drUuMs++1O9BrI=; b=L87l2uULCLJkbCrWW5qVjnHd2s
	6KGctTduK7GczODR5pPMNJubNqH7BmWcdBqqc04IuBNZ342McBL7L2hI3/b/rFyhNcg0OuXITkqpj
	AeoydLAeD4kpg+8qJQqCFCk503ioLSkdl7j5RUyuEMm/kzKC0byo3rE8Q+6J0CHKvw+8uZBD9b9AO
	pIUyRSENcZs+rFXYb3Cfvx/Xl9Vm9tZOtbXsbTZuUTMtvpRCso5ORDeWDiS+e52O28NkMsUFDoSbt
	OdkRrF1MhWs8tmvec6A1k+IckA+gEnlyYvkl1HOwHok/W6knYMqH66sC61eGtM0f9cXH9E2RmjGkH
	HFPphsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWo7-000BKe-Df; Tue, 07 Mar 2023 12:52:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWo3-000BGH-CR
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 12:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678193560; x=1709729560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=db3CujOdnnk4JvHTbGCquQDaWmCdFrEeKYWPbrMS3TQ=;
  b=EdtBoDRHpakdBRv0ZTGhEzYRpylkBNMmyPJoNBdSHdmkcad0qVavf9YN
   kuEnvSDUt+Oghj7aSiCJauDdR4jgmMO9yDfRwXC1ciWv85h8IGWp0pQCF
   fDTdjjTVf8MYTVaoc4VHhfKCybF0i6o3+xqcJIDYLqQIcPhvmpm37QPNF
   xE7iTWyHhkscLZxHbsf/gkWaAdd7R/o4M14Rp9+uhaROItL3rT3EU38s3
   naHiKr7+IyR6TZE8Hzwsv6/qDrxRSGG/dviRvibzzSY7ckHCEQHQtSVoA
   qQXy/D4pzMTZTqZBn+8crWto9tnK5PoubLLsK9CQdhSRg2+d+pZqCMz0P
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,240,1673938800"; 
   d="asc'?scan'208";a="200357617"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Mar 2023 05:52:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Mar 2023 05:52:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 7 Mar 2023 05:52:23 -0700
Date: Tue, 7 Mar 2023 12:51:55 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <conor@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
	<wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: Re: [PATCH v1 2/2] RISC-V: enable building 64-bit kernels with rust
 support
Message-ID: <36af5bd6-883c-4968-8ace-2e31ec51907d@spud>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230307102441.94417-3-conor.dooley@microchip.com>
 <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>
 <ZAcZeWYUU75BK5FO@wendy>
 <CANiq72kz2qxsB9JG7OB02KMAfy-YvokCFWMuEj_bkaY8i5tdVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72kz2qxsB9JG7OB02KMAfy-YvokCFWMuEj_bkaY8i5tdVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_045239_560151_2B02A533 
X-CRM114-Status: GOOD (  11.41  )
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
Content-Type: multipart/mixed; boundary="===============4291167125108007429=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4291167125108007429==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OghjveGlJgfPwijn"
Content-Disposition: inline

--OghjveGlJgfPwijn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 12:56:30PM +0100, Miguel Ojeda wrote:
> On Tue, Mar 7, 2023 at 12:01=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > Cool. Git should resolve that, probably without even generating a
> > conflict in -next, right?
>=20
> I think it will conflict.
>=20
> Since the cleanup is elsewhere and it may add work for the -next
> maintainer, it is probably best to take it out in v2.

If you think it will conflict as-is, it's probably gonna conflict either
way.
You've pointed out several small bits, I'll send a v2 in a few days.

Cheers,
Conor.

--OghjveGlJgfPwijn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAczawAKCRB4tDGHoIJi
0q2zAQCGrMXmp1otmx9KctfrHf1Ol5KJTxzDmuBtPfHgBLOgQAEA74Ce5Fhsb+MK
1rRf0Dnx0FHgQLhpzxjlfV51kr0qUwc=
=QvX9
-----END PGP SIGNATURE-----

--OghjveGlJgfPwijn--


--===============4291167125108007429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4291167125108007429==--

