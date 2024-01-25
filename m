Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927AEC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 14:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8j7TSLZPBEyaL+qmnkSmoXLzCa6jkk7Ou6tGCzHsxw=; b=QF41TF77dIXoZ0hbL8vQfUvKOk
	fk1xTgYEarXJpu1D/n0V5agIT2KzuwldSb396oRfF/dDRFFogKm5kW4eOkP1k+kQcnFHPbXpfzrQ/
	Xinpi6MFt3SoyVbeZ9CmlKr4C5TEW8sgj6ophJFUVPKJ0C3yrCvprvkCMAcecjGG7TiaesdeSoQwD
	rmOVOPm11t6h14sPkrjD52fEGDFZl5HCqYrzjw7SCzSPAHlLTyKQ3ZEDr5p+TdQuEI7gmOaIptQ0F
	VyA6gKhPHbykgCDjfPvYa/eae5FzeH0XNsQ2Cff1SWXXKBeNzBxc75oBXQvQkD4bNr+PCOIXR/eYd
	/taJTNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Wi-00000000Jlf-1eHB;
	Thu, 25 Jan 2024 14:16:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Wg-00000000Jl3-1Lsg
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=e2Gx71tG+PGiXuCcWrEYqd74AvFTiXta4T5CfVZ20i4=; b=J3wH1w92Yzec7eZMQUUfHZYCRu
	xG87ZUSJ4O5iG4AUbDhu/Qn1ooK9pWOpSnnLY6t+gy5uwx2Dvbgmv9RDDYzr1cV5sOoKD0ZGJhuFo
	603HGy2wYtfpEx6sEbe1quWty64Fay3yXcVmEcz8Ppiw01IjMRGpRhulixxOw3JBIVfmndTh7VujQ
	GW0VnUN+IR/oJ90f2ejFTa8szp5J7BKUe6sWp8bEqqffq+Vb95bus1yW30ek/Bmn2ZI8HJ9NKxaa5
	2/8YQ1gzicBpZIuYae88P2iKMBZ1qFRkFoLx0ZDWM18sz3UbqjEuQxwCDMVLn82dU8d7pZ7SdXMU4
	s0TAotYQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSytj-00000005JEs-0xyi
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 12:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1706185920; x=1737721920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e2Gx71tG+PGiXuCcWrEYqd74AvFTiXta4T5CfVZ20i4=;
  b=IYpQjjw3mIrrHGGo9M/RaDOxl0mUudVRntT4l8APYHmnl3GL9CfKlOys
   dK4MKsCdv5YdgPu255YZHIlry4gFQ5khrqMPTcwc/v579WGtl4e3NR8zp
   T8GItzivFR6efYeqbkwxNCvK8iPeEDMen9O4JE6UxI8330QtkWP7IkwC/
   aPxWwZmLDwavBMzjJfwDjcbY87ait4kEE+V0D/iqgqJDn6qSoN3W1qlbS
   h7GCpbWa6m1k5RLBvHfDtn/oKNcS66UaVNGK/E/V6xQr+VXwT77Id74PW
   gqif9IkzlSC+n6hw4PC/Kk9oXIxyOhRql8Schfz01fvN3PV18Bjof08i0
   g==;
X-CSE-ConnectionGUID: kHKU490MTVa/CUpB0qKI1Q==
X-CSE-MsgGUID: 04RsdzskT3uNcxxVcLoRZg==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; 
   d="asc'?scan'208";a="15284694"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jan 2024 05:31:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 05:31:15 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Jan 2024 05:31:12 -0700
Date: Thu, 25 Jan 2024 12:30:34 +0000
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
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <20240125-bucked-payroll-47f82077b262@wendy>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
 <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy>
 <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud>
 <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_123159_634947_67A2564D 
X-CRM114-Status: GOOD (  27.18  )
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
Content-Type: multipart/mixed; boundary="===============8855296605910143436=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8855296605910143436==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mujnSF4ge/jontNh"
Content-Disposition: inline

--mujnSF4ge/jontNh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 05:09:40PM +0100, Miguel Ojeda wrote:
> On Thu, Jan 18, 2024 at 4:49=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > The bit that worries me most is bindgen, and in particular detecting the
> > version of libclang used. I mentioned to Nathan or Nick about needing a
> > buildtime test for the version of LIBCLANG being used.
> > I'm less worried about this for LLVM=3D1 builds, since while I think it=
 is
> > possible to provide a LIBCLANG path to the build system, I suspect that
> > for LLVM=3D1 builds it's almost always going to match the LLVM toolchain
> > in use.

I chatted with the clang built linux folks about this yesterday, Nathan
agreed that dealing with incompatibility issues iff they crop up is a
reasonable way to go.

> `scripts/rust_is_available.sh` tests whether `libclang` is at least
> the minimum LLVM supported version; and under `LLVM=3D1` builds, it also
> tests whether the `bindgen` found one matches the C compiler. Do you
> mean something like that?

If by "the bindgen found one matches the C compiler" you mean that the
version of libclang used by bindgen matches the C compiler, then that
sounds great.

> For `bindgen` under GCC builds, we will eventually want a "proper" way
> to use GCC instead (or possibly other approaches like querying the
> information): https://github.com/rust-lang/rust-bindgen/issues/1949.

> Recently, there has been a thread in our Zulip and a couple people are
> experimenting: https://rust-for-linux.zulipchat.com/#narrow/stream/288089=
-General/topic/Bindgen.20--.20GCC.20backend.20port

That link for me goes to a message on 22/01, so later than the email you
sent.

> > I'll do another rebase and resend after the merge window closes I
> > suppose :)


That said, I gave things another spin today, in a different environment,
as a final check before sending and found an issue causing kernel
panics. RISC-V (and x86/arm64) supports kcfi (CFI_CLANG) but enabling
sanitisers seems to be a nightly only option for rustc. The kernel I
built today had CFI_CLANG enabled and that caused panics when the rust
samples were loaded.

The CFI_CLANG Kconfig entry has a cc-option test for whether the option
is supported, but from a quick check I don't see a comparable test to
use for rust. Even if a test was added, the current flag is an unstable
one, so I am not sure if testing for it is the right call in the first
place, given the stabilised flag would be entirely different?

The tracking issue seems to be complete:
https://github.com/rust-lang/rust/issues/89653
but the tracking issue for sanitisiers themselves is only 3/5:
https://github.com/rust-lang/rust/issues/39699

The simple thing would be to make them mutually exclusive options in
Kconfig.

What do you think?

Cheers,
Conor.

--mujnSF4ge/jontNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbJUXAAKCRB4tDGHoIJi
0uVHAQDIljZB931BuYsvFh8CDiXkeXE86yDu7dnEqYO2MErRBwEArNXVKUHQ6zGx
JQPxBR+Fd23f1rnzfJFcWNiA7BscMA8=
=IPeL
-----END PGP SIGNATURE-----

--mujnSF4ge/jontNh--


--===============8855296605910143436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8855296605910143436==--

