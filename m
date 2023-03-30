Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6E0C6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPPrq8mf9d3V9M/ie0XKXonWcPdHaiHY6yls1V2mXd8=; b=NHC0dezOz1VIFFmUiFvUsAuIys
	3ecwwVR+9SixXbSwc+84aY9dwmLp7ZbGo+CXYpT1qTf4RlqBswcHbh1MWOTN0XEuRDFbkF0UY0h5l
	IyP4MNy0vbQvhL7UgqRQkYaj45G3boFXG0zudB957d2PApJM8B/xTMUSmjTI8XWb4Z90gkBRzYnI8
	Fj9iMY6mKIU2dXaTBFcQsvg0sJuN660b96+GZeUEoQg90L3py3qqg5OqxRv5N7BEVei7LjlFCLQOG
	WgOg35yeWRR4ipb38DtvOsFF6n6MnQjdTTqdqPM/FkxC7zXx7Ok0ZbHfNNLtnEasQK7xQnJzVGJ+B
	/db2N9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phoKR-003Dbg-33;
	Thu, 30 Mar 2023 09:12:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phoKO-003DZM-2y
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 09:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680167536; x=1711703536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ro+17oDK7rnlBrMsXFzotd23YydUQ9691qY+Ptq0G7I=;
  b=XEekaNA38K8EMHu9xLhq8CIWmSkbcls+HIBb/WVjIXwDGe41RBuZV9kj
   rAMiMwiu+kOOUTD+3W1N5U+DgGkeWCNpSb2Eqn9uPARvYmlZF3XBBRZD6
   f/riQ88dhHihTN24FqRNRHLVK0Ibp/uRKYdyJ/nxnXZAtPONmXD4tEMEA
   DJLkBRXSTt+9saJut+j/1k817NS8hiQoMOj2xWhj47vigalxcZsga+Eic
   ZlS9bK44/GS+r45AqOTGMLCd1PZtD3Bb4qymwUsDXf8lxPj+hxg/uCuFb
   0u3VRXjE853OTA4lpFouV/30jwIuBLioXp8jcHyusyamVu9+a21asosa7
   A==;
X-IronPort-AV: E=Sophos;i="5.98,303,1673938800"; 
   d="asc'?scan'208";a="218661930"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Mar 2023 02:12:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 02:12:10 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 30 Mar 2023 02:12:07 -0700
Date: Thu, 30 Mar 2023 10:11:53 +0100
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
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <b5fba6b3-177c-4325-905a-8f9f633a592a@spud>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com>
 <a6220e52-9934-422b-9b05-95705b8fd684@spud>
MIME-Version: 1.0
In-Reply-To: <a6220e52-9934-422b-9b05-95705b8fd684@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_021217_019837_E645C74D 
X-CRM114-Status: GOOD (  21.74  )
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
Content-Type: multipart/mixed; boundary="===============5289775853417461599=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5289775853417461599==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3sMGWrE3WbodPTsC"
Content-Disposition: inline

--3sMGWrE3WbodPTsC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 30, 2023 at 09:23:45AM +0100, Conor Dooley wrote:
> On Tue, Mar 07, 2023 at 12:07:29PM +0100, Miguel Ojeda wrote:

> > By the way, like for the Arm patch set, if you end up doing a v2,
> > could you please add the `BINDGEN_TARGET_*` in `rust/Makefile` (GCC
> > builds are really experimental, but since they are there anyway, it is
> > best to be consistent and add it).

Hmm, so I came across this commit while looking at that:
https://github.com/Rust-for-Linux/linux/commit/cfc17fed52b9585e2f19e2381bfb7094561b8027a
(rust: bindgen: ignore RISC-V extensions for GCC builds)

I don't want to add even more workarounds for this sort of thing,
especially as in this case it is outside of arch/riscv.
The extension stuff when mixing compilers is such a massive pain & given
this one requires Rust it's even less likely to be tested when someone
comes along and adds some additional extension support that appears in
-march :(

I'd rather do this in the RISC-V Makefile so that it does not get
forgotten.

If my understanding of bindgen is correct, we don't actually need to be
honest to it about what extensions the rest of the kernel is compiled
with, only make sure that it is not called with arguments it does not
understand?

| bindgen_c_flags_patsubst1 = $(patsubst -march=rv%_zicbom,-march=rv%,$(bindgen_c_flags_patsubst2))

This one is no longer needed as of 9a5c09dd9701 ("Merge patch series
"Remove toolchain dependencies for Zicbom"").

| bindgen_c_flags_patsubst  = $(patsubst -march=rv%_zicsr_zifencei,-march=rv%,$(bindgen_c_flags_patsubst1))

Oh and clang-17 is going to support both of these, and Nathan and I
already spent a bunch of time fixing the fallout from that!
It still functions correctly without having them passed, but I have
heard requiring these may become the default at some point too.
What's done here may end up needing to be dynamic, but that bridge can be
crossed if/when we come to it.

What version of GCC do I need to replicate this? I can build tip-of-tree
gcc if needs be.

Cheers,
Conor.

--3sMGWrE3WbodPTsC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCVSWQAKCRB4tDGHoIJi
0qpsAQD93N6ZELaSuCLnFRRrVX6KqM1buvhJrxpnIPixxEBkYgEAtdX2bVK2gcK0
Nb8PM/km+TWTR+ljihbHfIH7vEsl0AE=
=NGwF
-----END PGP SIGNATURE-----

--3sMGWrE3WbodPTsC--


--===============5289775853417461599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5289775853417461599==--

