Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB39C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 11:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mt7UqxrIQM4QywgOFWOmrFi8g2qPbCcUNkMK8FmZxvU=; b=xQstoGiSEGMECPrxd1YFsN5cET
	up0lx+QbZUx+I+ooYlTi49ElemA2hbHcgTJUTXWhxBtxd4HsvrDavWPh/+X8NNFP0+QqX41oHCwmO
	IsdoNwHxVqxFl15kfgB1f/QlEs5jASdf0zuxPzCSct09cZNSPOIwryZQ+Hmu1SpUoIMWApa94Oasa
	H/H3zPmLRr0qcmaSsSwAJCmnrubxY786Ja3LyeZd8AtgYq7GbVj+HT7y25PAoG+Wk5Reb6HRHzs3P
	oSW7bmnhcAPfWk/PqjI39oBx4OeJd4N3N40Wo3VMisvjSL26iz78uubjN+cmP2dXNYy6VXYL8PCTf
	iyObwd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revGp-00000004sJl-1ae1;
	Tue, 27 Feb 2024 11:05:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revGm-00000004sJG-0FZ7
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 11:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709031907; x=1740567907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nkEmgcF2sqsTVrDLvW1DSslli5qr0PA0DGExmFUENFo=;
  b=kAeNuAsjZPcZrxLSW2xXHhiW9q4lVKoBtABPTYFaZq8pVJn4m+uUPG/I
   BRjWKJalUXetz5phBc2adYGTqvJc/VncHCPFn6f8KoAnxJa3k2dfU6z32
   q3Be0IoPRys7MfdcwITd/Yd19x43PedJulUC9HeqbUTvlP/mflJKUAhcs
   zD3eAoEGpA/Y2M6VaSSDDtvkzn8k92q6/kwyY96N51g1fJM37FEjwEE3J
   HEyl7q9lqyQMrjARIjHsRkYcuYbdpzRIp8UF4rd+qgj6VfWeTUrvB9DXp
   29CxDbot132UQptmp5NhC5xayVVPLsiUPA/tTOm678etVoSoRcs1PhjMN
   w==;
X-CSE-ConnectionGUID: hJeSGw/8TAyVRlagmnchCA==
X-CSE-MsgGUID: KTDcPATNQk+OtFWm54w0BA==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="16880169"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 04:05:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 04:04:59 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 04:04:56 -0700
Date: Tue, 27 Feb 2024 11:04:13 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida
 Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on
 RISC-V
Message-ID: <20240227-glove-underwire-f562a56cf2c7@wendy>
References: <20240223-leverage-walmart-5424542cd8bd@spud>
 <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
 <20240227-resolved-deceit-4a59a6af5b71@wendy>
 <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_030508_224594_A019DB8D 
X-CRM114-Status: GOOD (  16.33  )
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
Content-Type: multipart/mixed; boundary="===============3876189151523051779=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3876189151523051779==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4yFQMGvLloPM49wl"
Content-Disposition: inline

--4yFQMGvLloPM49wl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 11:46:42AM +0100, Miguel Ojeda wrote:
> On Tue, Feb 27, 2024 at 11:17=E2=80=AFAM Conor Dooley
> <conor.dooley@microchip.com> wrote:
> >
> > Sure, I'll take a look.
>=20
> Thanks!
>=20
> > Nah, I think that is silly. Either this goes in as-is, and there's
> > fixup done by Linus, or the thing should be converted to match arm64,
> > assuming that that is possible.
>=20
> Ah, so you are going for 6.9 too? I can give the series a try on my
> side in that case. When do you plan to apply them?

If they're to be applied, it would be Palmer, not I. And if history is
any guide, it could be into the merge window. My point though was more
that either this was acceptable for v6.9 or would be v6.10 material
with the same mechanism as arm64. Rebasing after v6.9-rc1 but not
adapting to that way of doing things is what seemed silly to me, since
if a resend is required then the other improvements should be carried
out at the same time.

Cheers,
Conor.

--4yFQMGvLloPM49wl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd3BrQAKCRB4tDGHoIJi
0l+1AQD2Kv7qn0sG5InjsblGeMCFLO+iLg5s4b1JdnY/mXJAMgEAnPLESP1zEN5H
BZ6fe0suc1bctDUkHs99G3uQ759MlQc=
=9yZw
-----END PGP SIGNATURE-----

--4yFQMGvLloPM49wl--


--===============3876189151523051779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3876189151523051779==--

