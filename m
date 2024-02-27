Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717C8C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 13:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOj+EQ66q4G6ligZtb4q+bqbgvg2SKD10GKjhxIxR0o=; b=ezCJdrnD2YKzWczNiR2GNnKfzG
	AtSm055xsqeXv2NT7LZeuJIumpDlHh5yj17aKZh82LQye09Ho+OZRqcyi+WVzTsmDwArZRX4B+hd5
	FYu3j+L2pqWbukRUalW5/kaLC719XeKihe/vjSS520fqfvsUwsMbTtqYZnrTfU6EhnP/RlZhNQiIY
	Y1Wsk58PXA3LX69k4OPWsDViuX+qXzk3R6gUFuCBRXPX76JW3KMAu62tV6+nwOn5oTj7jp4vqtox0
	08TwCIVHeF/dkMCZZELLRmnGBTrN8SrR+r+xoAYxq2CV3GNP5FKTjvHV/00sN55kfcFoCT28LZJ3t
	yrloVgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex7K-00000005Il5-3MsD;
	Tue, 27 Feb 2024 13:03:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex7H-00000005Ijq-3YWb
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 13:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709039008; x=1740575008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MXbXhXbeu0cQ9TFbNb7UEonPBK55rX+buvq6bECICU8=;
  b=0uYMkiUvEMU/7chg5/YLLIuyUE5VDcWea6F2X4qHuQznb8WE0v+C1hCu
   5ejT2dKIuX82/Bi8y+cJkrfPWbEcd4jh50+5+1jBGQRZmHRgZnigk99g8
   bL9WwyN7ECLUGSiru4QkNAhpoq8y89xK2A26wu4wlR1qJv/sijXcjDxqr
   9qFA5Ri96cQPZh+hSyk0wWgYBqsBzUzUf0znQdBs5Xhr2zI5MxglVzBGT
   BogjLafBDRtaz2pbbQiZ9ccecxNzkLbj0oxUyHSgWc2Q7kTovufM2r7bi
   KyuDqzUR6Xma/ISEK9Uu+qrgk0hWNanPSBZXZ33Hsmrrd5WtozewcWJ8f
   Q==;
X-CSE-ConnectionGUID: we5qw0mfT+K6Mg0u+ozr0g==
X-CSE-MsgGUID: mMGKrDnoRIqlIlHrvTgxew==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="247636234"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 06:03:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 06:02:58 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 06:02:54 -0700
Date: Tue, 27 Feb 2024 13:02:11 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor@kernel.org>,
	Matthew Maurer <mmaurer@google.com>, <linux-riscv@lists.infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson
 Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	<rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
	<stable@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Ramon de C
 Valle <rcvalle@google.com>
Subject: Re: [PATCH v2 1/3] rust: make mutually exclusive with CFI_CLANG
Message-ID: <20240227-unwind-canteen-3da9b07af10c@wendy>
References: <20240223-leverage-walmart-5424542cd8bd@spud>
 <20240223-perjury-preshow-fc2cf73d552e@spud>
 <CANiq72=mCnm0mKOw5K44PmZ+jF=67jxEEkcXP-E0O8CaUrps=w@mail.gmail.com>
 <20240227-uncertain-amaze-6197e627ad95@wendy>
 <CANiq72=geBobqM0Dc2yv=NjAc3MWXhOrDHfuJ84TgQ+XVxBo0w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72=geBobqM0Dc2yv=NjAc3MWXhOrDHfuJ84TgQ+XVxBo0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_050328_118750_3DC2B9A8 
X-CRM114-Status: GOOD (  17.50  )
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
Content-Type: multipart/mixed; boundary="===============5932192058525654637=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5932192058525654637==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W8J+rAw6y6pbbfl0"
Content-Disposition: inline

--W8J+rAw6y6pbbfl0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 01:34:14PM +0100, Miguel Ojeda wrote:
> On Tue, Feb 27, 2024 at 11:54=E2=80=AFAM Conor Dooley
> <conor.dooley@microchip.com> wrote:
> >
> > I did try to test it but I ran into too many toolchain issues - my
> > older copies of LLVM (pre 17) are not multiarch as I built them by hand
> > with PGO for x86 and RISC-V. My LLVM 17 is from kernel.org and has no
> > libclang. And then the copy of LLVM 18 on kernel.org apparently does not
> > support kcfi at all. I gave up there, but I don't see how this would not
>=20
> I asked Nathan to add libclang a few days ago, and he very quickly did
> it for LLVM 18 -- though I don't know the plan for the others. I just
> pinged in that thread.

I had actually said it to him on IRC already (although he is CCed here)
but I just noticed that this was my fault - I symlinked incorrectly
after downloading the toolchain. kcfi is detected fine with llvm18.
I'll give testing another try.

--W8J+rAw6y6pbbfl0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd3dUwAKCRB4tDGHoIJi
0iscAQCFqXISaMEU8lWDJeRHwsnAImvV4ocTSMxS5RJFKcJHqQD/a/u0vuVtSyp7
18rvQE+YASYYpq5tCU08KsgXCbSU7gI=
=o4T8
-----END PGP SIGNATURE-----

--W8J+rAw6y6pbbfl0--


--===============5932192058525654637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5932192058525654637==--

