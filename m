Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87036C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5jGmC5mrVCUeEVScmElFTo5Lbem+fwOtmV6jvqjpTk=; b=OwddIslMEeL66QUIzYDQSMC/yO
	yshiHUeGMUh+np/SdGUGpfAVtXUHLh2OwwRNoCeUKYfG7OYEuBFWciqoceM/LxbF/ce0LxQYg+X+G
	FbRrOJS6PjwZVwVt+yYuDXTMRAvg5c7GyZRFQgTUH3MuuWO99l3mKp++Ni3BOdcog6cJ8a8JCutX4
	bE0k+5aSy2jP4Xn1UoTdZsg3teFKnuKOfZD4GlvE2wgsgUsYeJjr2qKTNzXbYqPq+AtKcbkAIiy4D
	RgBXhXuIimnzYfnhZubXiOqR3EyKyKYsqsQScnhi/DlrZ7s120PPETkokJPBmau+xQR1YBTrOI2xF
	Q38KtKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT03c-000000006ZQ-3agI;
	Thu, 25 Jan 2024 13:46:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT03a-000000006Yj-09pA
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 13:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1706190374; x=1737726374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QkGYH2ypWOTDiq5BbVC5hKUniLV64BDsYDuZSL4c+Ek=;
  b=RVZ13V+69vZVcCMFXApwYKkCadJz3a4ndSKSbwITmtV5tF8h2wytkG/X
   2kks37ybddRA7j/j71nvah2+NV2ZpiYCQhQ+2UlJnOGZF6ybGONrLqoFy
   JNJ6G93s41b73prQT3O2HtcAHOsHQflFzivs4hqsxzeV3T8YEu6IpxX+i
   3bAEFOcqWkSttBYTmx2gccBrHC/QozhBUM14dclp9AdIfBYYa33LpOfSs
   8P2or9quyzhCjo/O+KUs94M7PG4stfPGISKjUiycMSEACg09+PlWgeT5u
   E7L9qkMOMdExU47nbdIvKrWq9EkDMSyS3vHdf6zWenTXtoqozuwe1bSQ3
   A==;
X-CSE-ConnectionGUID: m+PhERqEQH65VJ/qKW5gkQ==
X-CSE-MsgGUID: fy6M6828T9yyNgsJcQ4UyQ==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; 
   d="asc'?scan'208";a="15287685"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jan 2024 06:46:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 06:45:46 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Jan 2024 06:45:42 -0700
Date: Thu, 25 Jan 2024 13:45:05 +0000
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
	<llvm@lists.linux.dev>, Matthew Maurer <mmaurer@google.com>, Ramon de C Valle
	<rcvalle@google.com>, Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <20240125-lazy-thrower-744aacc6632a@wendy>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
 <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy>
 <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud>
 <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy>
 <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_054614_214902_2B080EF5 
X-CRM114-Status: GOOD (  34.05  )
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
Content-Type: multipart/mixed; boundary="===============4976081850937065796=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4976081850937065796==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GuHppkpX7NvgOUA9"
Content-Disposition: inline

--GuHppkpX7NvgOUA9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 01:50:05PM +0100, Miguel Ojeda wrote:
> On Thu, Jan 25, 2024 at 1:31=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:

> > > Recently, there has been a thread in our Zulip and a couple people are
> > > experimenting: https://rust-for-linux.zulipchat.com/#narrow/stream/28=
8089-General/topic/Bindgen.20--.20GCC.20backend.20port
> >
> > That link for me goes to a message on 22/01, so later than the email you
> > sent.
>=20
> Zulip seems to scroll to the latest message in the topic -- you should
> be able to scroll a bit up, but if that doesn't work, this link should
> go to the first message:
> https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/=
Bindgen.20--.20GCC.20backend.20port/near/412609074

Ah, thanks for the direct link :)

>=20
> > That said, I gave things another spin today, in a different environment,
> > as a final check before sending and found an issue causing kernel
> > panics. RISC-V (and x86/arm64) supports kcfi (CFI_CLANG) but enabling

I mention x86 and arm64 here, because my grepping didn't see the flag
being set for x86 (in tree) or arm64 (in that series) if CFI_CLANG was
set or any mutual exclusion. Has noone tried CFI_CLANG + RUST there or
just not run into any issues?

> > sanitisers seems to be a nightly only option for rustc. The kernel I
> > built today had CFI_CLANG enabled and that caused panics when the rust
> > samples were loaded.
> >
> > The CFI_CLANG Kconfig entry has a cc-option test for whether the option
> > is supported, but from a quick check I don't see a comparable test to
> > use for rust. Even if a test was added, the current flag is an unstable
> > one, so I am not sure if testing for it is the right call in the first
> > place, given the stabilised flag would be entirely different?
>=20
> Yeah, KCFI and other mitigations is WIP -- Cc'ing Ramon and Matthew
> who may be able to tell us the latest status.

Also CC Sami I guess, since he is the one who added the CFI_CLANG bits
to the kernel, and can probably comment on the suitability of adding a
check etc.

> Testing for unstable flags is fine, i.e. we only support a single
> compiler, so we can change the name when we do the upgrade.

Actually, thinking about it for a moment - if only a single compiler
version is supported (the minimum, right?) then you could just add the
-Zsanitizer=3Dkcfi flag whenever CFI_CLANG and RUST are both set.

I'm not sure if that is a better option though. It's a choice between
CFI_CLANG being disabled if the check is not updated when the toolchain
is bumped versus being enabled for C and not for RUST. I think I prefer
the former though, tracking down the cause of the latter I would rather
not wish on a user.

I vote for having the check, even if it can only ever be true at the
moment.

Cheers,
Conor.

--GuHppkpX7NvgOUA9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbJl4QAKCRB4tDGHoIJi
0r2YAP9Kbj4u//RY0nIROcBBxVP3ucR5cgnfxPjsXpqrdOu6FgD/ef8EVCC207/s
Jy65DzLCk1V5UGLDXdSuKcxvD/qEngw=
=6p43
-----END PGP SIGNATURE-----

--GuHppkpX7NvgOUA9--


--===============4976081850937065796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4976081850937065796==--

