Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5893EE6457
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 11:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cn+X3DQtLQlYWR0WZGaBFKq2Ycb/X13kBttEWxJJkzc=; b=EAtMDfEcZtJEJ9r+Cw+jXZURED
	zEpj+ydRcYomTGlkYg9yrozzrclU+sBAlkPyLkn5A6Bad8HLIflh1bCVqNBjIIf/tOawqEXrMq6km
	pUdvsd6iLZJR1hvYMzzek+Pr4xuhz1jsdzLncioO5OeHTiW/UlbT2HHRQe44rfRFK3Ex66jhaazPX
	K+jH3+O6qk0ey6dmCsEM/lIUjFVtR7HZ+J0TZ4lO7YPrM3L/v37j+tJbkt3B54RJTlYgcQs77Pmct
	VdGQBzFsBVXZCf+zKwyvjX/kdiq3AU2Gyld2lkmNYeNEPuONgc7yDyj7BKhCrRCL2ThNQHYU1v5YV
	uHTbCrWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh79c-00AfJo-1Q;
	Fri, 15 Sep 2023 11:38:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh79a-00AfJG-12
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 11:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694777911; x=1726313911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7YSbSEAtiS9L4kyxYvcwFkbpArMIOL3XY2/qLrNEN9I=;
  b=jmWQNrYtQ8a3QH9h+CXX/GY9TWtB0PgZKJe88iObOWhjRSGwLCxMKQfN
   VlOU14Qdfw4Vl3d+5v/0QN7nRBjetxkYKeePs7gQrB4ivrTqNJJzBo8I8
   mCO5E1RFI2sYHJjOKlHHr7eKBLFEOjabn+WFeRSRFzYIxO0yCXD+vzbaJ
   E6ZGsKoqAZH/fVYTuEaBEEnSlwEHqb2WCtVAo/KFAd0KtzMSQsnd6Q+iX
   /buKD6RS2cNJxRZP4tr957TLe+faQGAlDXYX6BZIQVify7GpBZPEJUvjG
   VEmiYdb6BxQ+JWaQa2bkqSDjDH7OKVpq0OD8jnkiTbnOstnIxZtYBGihL
   g==;
X-CSE-ConnectionGUID: lG/fr/uNTHeoM29iPBDyvQ==
X-CSE-MsgGUID: 99NFUzHoRSGHB9nwTAf7Qw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="asc'?scan'208";a="235388319"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2023 04:38:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 15 Sep 2023 04:38:12 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 15 Sep 2023 04:38:07 -0700
Date: Fri, 15 Sep 2023 12:37:50 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <guoren@kernel.org>, <paul.walmsley@sifive.com>, <anup@brainfault.org>,
	<peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
	<palmer@rivosinc.com>, <longman@redhat.com>, <boqun.feng@gmail.com>,
	<tglx@linutronix.de>, <paulmck@kernel.org>, <rostedt@goodmis.org>,
	<rdunlap@infradead.org>, <catalin.marinas@arm.com>,
	<xiaoguang.xing@sophgo.com>, <bjorn@rivosinc.com>, <alexghiti@rivosinc.com>,
	<keescook@chromium.org>, <greentime.hu@sifive.com>, <jszhang@kernel.org>,
	<wefu@redhat.com>, <wuwei2016@iscas.ac.cn>, <leobras@redhat.com>,
	<linux-arch@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
	<virtualization@lists.linux-foundation.org>, <linux-csky@vger.kernel.org>,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 03/17] riscv: Use Zicbop in arch_xchg when available
Message-ID: <20230915-removing-flaky-44c66da669ae@wendy>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-4-guoren@kernel.org>
 <20230914-892327a75b4b86badac5de02@orel>
 <20230914-74d0cf00633c199758ee3450@orel>
MIME-Version: 1.0
In-Reply-To: <20230914-74d0cf00633c199758ee3450@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_043830_383620_547CBB92 
X-CRM114-Status: GOOD (  37.55  )
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
Content-Type: multipart/mixed; boundary="===============2046424404988976363=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2046424404988976363==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jcAAmnINfKydT8Wr"
Content-Disposition: inline

--jcAAmnINfKydT8Wr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Thu, Sep 14, 2023 at 04:47:18PM +0200, Andrew Jones wrote:
> On Thu, Sep 14, 2023 at 04:25:53PM +0200, Andrew Jones wrote:
> > On Sun, Sep 10, 2023 at 04:28:57AM -0400, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >=20
> > > Cache-block prefetch instructions are HINTs to the hardware to
> > > indicate that software intends to perform a particular type of
> > > memory access in the near future. Enable ARCH_HAS_PREFETCHW and
> > > improve the arch_xchg for qspinlock xchg_tail.
> > >=20
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > ---
> > >  arch/riscv/Kconfig                 | 15 +++++++++++++++
> > >  arch/riscv/include/asm/cmpxchg.h   |  4 +++-
> > >  arch/riscv/include/asm/hwcap.h     |  1 +
> > >  arch/riscv/include/asm/insn-def.h  |  5 +++++
> > >  arch/riscv/include/asm/processor.h | 13 +++++++++++++
> > >  arch/riscv/kernel/cpufeature.c     |  1 +
> > >  6 files changed, 38 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index e9ae6fa232c3..2c346fe169c1 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -617,6 +617,21 @@ config RISCV_ISA_ZICBOZ
> > > =20
> > >  	   If you don't know what to do here, say Y.
> > > =20
> > > +config RISCV_ISA_ZICBOP
> >=20
> > Even if we're not concerned with looping over blocks yet, I think we
> > should introduce zicbop block size DT parsing at the same time we bring
> > zicbop support to the kernel (it's just more copy+paste from zicbom and
> > zicboz). It's a bit annoying that the CMO spec doesn't state that block
> > sizes should be the same for m/z/p. And, the fact that m/z/p are all
> > separate extensions leads us to needing to parse block sizes for all
> > three, despite the fact that in practice they'll probably be the same.
>=20
> Although, I saw on a different mailing list that Andrei Warkentin
> interpreted section 2.7 "Software Discovery" of the spec, which states
>=20
> """
> The initial set of CMO extensions requires the following information to be
> discovered by software:
>=20
> * The size of the cache block for management and prefetch instructions
> * The size of the cache block for zero instructions
> * CBIE support at each privilege level
>=20
> Other general cache characteristics may also be specified in the discovery
> mechanism.
> """
>=20
> as management and prefetch having the same block size and only zero
> potentially having a different size. That looks like a reasonable
> interpretation to me, too.

TBH, I don't really care what ambiguous wording the spec has used, we
have the opportunity to make better decisions if we please. I hate the
fact that the specs are often not abundantly clear about things like this.

> So, we could maybe proceed with assuming we
> can use zicbom_block_size for prefetch, for now. If a platform comes along
> that interpreted the spec differently, requiring prefetch block size to
> be specified separately, then we'll cross that bridge when we get there.

That said, I think I suggested originally having the zicboz stuff default
to the zicbom size too, so I'd be happy with prefetch stuff working
exclusively that way until someone comes along looking for different sizes.
The binding should be updated though since

  riscv,cbom-block-size:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      The blocksize in bytes for the Zicbom cache operations.

would no longer be a complete description.

While thinking about new wording though, it feels really clunky to describe
it like:
	The block size in bytes for the Zicbom cache operations, Zicbop
	cache operations will default to this block size where not
	explicitly defined.

since there's then no way to actually define the block size if it is
different. Unless you've got some magic wording, I'd rather document
riscv,cbop-block-size, even if we are going to use riscv,cbom-block-size
as the default.

Cheers,
Conor.

--jcAAmnINfKydT8Wr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQRCDgAKCRB4tDGHoIJi
0nxMAP4/NwIzSYyF12w3gyp0+gFvSHQLfn3lVb5+mNbZNSzhMwEAiTwezXo0qBl8
ea0Ve2nLkxusdrHwPl8mHohUyYJFZQI=
=lEKk
-----END PGP SIGNATURE-----

--jcAAmnINfKydT8Wr--


--===============2046424404988976363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2046424404988976363==--

