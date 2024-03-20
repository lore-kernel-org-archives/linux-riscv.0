Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7C2C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmq6JmQGpUlLjvsKSfbMTti4NrIUSz2NxZ2SmD4ImBI=; b=4f57NlKKOKDvM7mqT9uOwzamgc
	YWwZk7+KeRjMBbKUlqgOjKAg/E0fC6P7w9flZ8iv79vzJ0oxTzs0bYUned5+Qk7Hop85MRfXSpX/+
	fdd/NoT+3iTI89/iXEA22XXd/Qfw5IjrXwKsFQxuO8DsGDXPf5gc8+ypiXrNcumWGRnTht8fO+lIt
	lukOdBsGhsGEDKpfvGrEDocb0HQhEImEp60QeBL4ctsZQaiv8UKKaW6NvkzJcfMJLwPpuxHK/lWDS
	xwzweCEXnsXEkVxI4gm5+sm7f4xRryb4mMiVGbnBE0ADbXryLhdleklZr3NzSDJGr6ayT8uiKVlV1
	c6t3BLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmqz0-0000000G660-3yvR;
	Wed, 20 Mar 2024 08:07:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmqyy-0000000G654-0eDZ
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 08:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1710922052; x=1742458052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8s8XKGkGT4rwQeAawGzZEkGeS8AnzqsL4K//1R+zt5Q=;
  b=YvJ4fXBO5EVC0VfpbllRqfCVu93McmRloN3I6DaQws9cnyF0sEVYYXdB
   3rIrUwi6gKQFFgVe1eCzuA/+Ru7XF/qTodYdFU0a0R2JQClXC4VrFc0C1
   /pcLveS8JR26tfJYamQozVOq1A9F3qEIW5qkV6U+Pxd2mqDQN/OJbAw3C
   dWBnhr7942wr40zSMQiQwAi0pAtuGZz7vIT8i3tz3sYjcgCKgxSSoUbvl
   oZR8RmdJd4RsGF/Lyl0RVYmteTO4xR89GdsI0Jji3JAERmnum9zjrCTJi
   hftHdnPxuoG2RVYuE4M0bG4n9VyrXbyuNjxAQHH1EqAvdWeGb4snagf28
   A==;
X-CSE-ConnectionGUID: +2PKfpLTQGq2m0SEBNMVqQ==
X-CSE-MsgGUID: eSxs2JbuTmyaJCQMbacMkA==
X-IronPort-AV: E=Sophos;i="6.07,139,1708412400"; 
   d="asc'?scan'208";a="248659095"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Mar 2024 01:07:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 01:07:10 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 20 Mar 2024 01:07:07 -0700
Date: Wed, 20 Mar 2024 08:06:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Deepak Gupta <debug@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, <linux-kernel@vger.kernel.org>, Conor
 Dooley <conor@kernel.org>, <kasan-dev@googlegroups.com>, Evgenii Stepanov
	<eugenis@google.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew
 Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
Message-ID: <20240320-fanfare-flick-3b38dde081d8@wendy>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com>
 <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
MIME-Version: 1.0
In-Reply-To: <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_010732_341347_355A627F 
X-CRM114-Status: GOOD (  25.14  )
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
Content-Type: multipart/mixed; boundary="===============3528805898480410741=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3528805898480410741==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZQuW/bL/DNtzlQCx"
Content-Disposition: inline

--ZQuW/bL/DNtzlQCx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 09:20:59PM -0500, Samuel Holland wrote:
> On 2024-03-19 6:55 PM, Deepak Gupta wrote:
> > On Tue, Mar 19, 2024 at 2:59=E2=80=AFPM Samuel Holland via lists.riscv.=
org
> > <samuel.holland=3Dsifive.com@lists.riscv.org> wrote:
> >>
> >> Some envcfg bits need to be controlled on a per-thread basis, such as
> >> the pointer masking mode. However, the envcfg CSR value cannot simply =
be
> >> stored in struct thread_struct, because some hardware may implement a
> >> different subset of envcfg CSR bits is across CPUs. As a result, we ne=
ed
> >> to combine the per-CPU and per-thread bits whenever we switch threads.
> >>
> >=20
> > Why not do something like this
> >=20
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index b3400517b0a9..01ba87954da2 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -202,6 +202,8 @@
> >  #define ENVCFG_CBIE_FLUSH              _AC(0x1, UL)
> >  #define ENVCFG_CBIE_INV                        _AC(0x3, UL)
> >  #define ENVCFG_FIOM                    _AC(0x1, UL)
> > +/* by default all threads should be able to zero cache */
> > +#define ENVCFG_BASE                    ENVCFG_CBZE
>=20
> Linux does not assume Sstrict, so without Zicboz being present in DT/ACPI=
, we
> have no idea what the CBZE bit does--there's no guarantee it has the stan=
dard
> meaning--so it's not safe to set the bit unconditionally. If that policy
> changes, we could definitely simplify the code.

The wording for that "extension", if two lines in the profiles doc makes
something an extension is:
"No non-conforming extensions are present. Attempts to execute unimplemented
opcodes or access unimplemented CSRs in the standard or reserved encoding
spaces raises an illegal instruction exception that results in a contained
trap to the supervisor-mode trap handler."

I know we have had new extensions come along and mark previously fair
game interrupts for vendors as out of bounds. I wonder if there's a risk
of that happening with CSRs or opcodes too (or maybe it has happened and
I cannot recall).

Going back to the interrupts - is the Andes PMU non-conforming because
it uses an interrupt that was declared as vendor usable but is now part
of the standard space because of AIA? If it is, then the meaning of
Sstrict could vary wildly based on the set of extensions (and their
versions for specs). That sounds like a lot of fun.

--ZQuW/bL/DNtzlQCx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfqY/AAKCRB4tDGHoIJi
0m4/AP0UYPz9RdNLmW6g7L1tf8w83wsWZfBkuwZqh3A3w0Jq9wEA7t8mWVQ1YVm2
D9FdG5Y2+4p6MzgZJDv6xF67VncJZAU=
=unOr
-----END PGP SIGNATURE-----

--ZQuW/bL/DNtzlQCx--


--===============3528805898480410741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3528805898480410741==--

