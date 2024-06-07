Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F17DC27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ph+LDXGHmJeeUhMC3B7AMSymzycr5x3JvxwTWW/fRjI=; b=h9MOFIvYZw6SJ+Uunss5HV9CDE
	qF0iHHeZv46p41HKEurcoZcnlHFlp5nbIJkNSyU5Zh6idgn3eBw4+PYsb77QO6oreQOnmP0o8/37C
	37TI8yXWKaJQoI88+LvOZNUcPB55tDh0CGauTPh7kFlzPkEq1229xWgB+r5Dx0Iv+xzRUrB0oyIT8
	xxlKF36JNIGGkoIVV0GQJZN9a2nI/ukVqgoVNcbDkdHBPmue7MkabxHSHrrpF5FrpGAf5mIgU1E8c
	1nvALo27tiSfN5+Crt/3GQyvIi5LwpF6K1C5panGVBlrvgE3qsx/4vTobsyl2yt2lxMG7OYsHn0s1
	QQ9Ba4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhQh-0000000Fm05-38jy;
	Fri, 07 Jun 2024 21:47:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFgNg-0000000FcMi-1scz
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Jun 2024 20:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hxN8GXf+vHhLvkH1blP6h62MkBT3pS5R6HES4T1TgY0=; b=vXOBnI2FCP2NTP4rmLUNOSsM+r
	N8jAHI/ySA/fPHNui4CUcVSl5RVwgXFNTWhTmlZdqcJleyzf87oitOQCoogb91qvZIfy++VH13yhU
	zwG9R3wRWDrHQ52OWvoUg1OzcpoQXAXb83TgyDdksq/9IzE/HP2I4q7ts4PQX48N3BtGL5jtQXmiR
	BZg3+RrhE1rh6iCxHdXl9yKK9CfUhTw2kHj+FaotAHgJrfiuq70qxiJJ+z7o9JQRI4PZ586gZi8Qc
	/Nvw0/s3kC6g2Dx9AdUzb5QnzVPTUKiy6Uq4nQ89cP/x1VWbSDXCY/Oznef7YG8+H4ERQK5efw5LR
	WVMyEpOg==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFgNa-00000006ZUZ-3HeZ
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 20:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13C75CE1D6B;
	Fri,  7 Jun 2024 20:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D78C2BBFC;
	Fri,  7 Jun 2024 20:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717792794;
	bh=4XNrpSMvFp8sQ1EJsXH4i20xSwPT4VZNeTgz4nZcwwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWbBwSm6Xfw5e0/unvO61jPE+gOGcElpb66E4q9WgYx4KK8JSvu9G0ZqG4BwcH3op
	 FR+R0RgAUiCoZrRW50D+yZUJCjixDAoQsA5N13g1fsgq+PUjZ7lRMx33yUwQYVHEj0
	 to82/Lx3LsN4tZ8TEJtljTpgPp9dEnTteiRv2WHZepQrkYAbefE9yyAFZHYnY1M6ep
	 mv5V4P01b7KDPtwFWhDiDQeZP88O47tAqALfGR9raWW6tBJuvXBy6RobsWNiKZN3st
	 n1NKrPbiLqOE5G3BUYQbM1h6JO8Yp3u6NaZGGKrefX1Lqzg89xXx5kIc0tbync6h8I
	 6qsBCCFfDdyqA==
Date: Fri, 7 Jun 2024 21:39:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: Enable cbo.zero only when all harts support
 Zicboz
Message-ID: <20240607-unwound-ethics-b6bf97cddc3e@spud>
References: <20240605205658.184399-1-samuel.holland@sifive.com>
 <20240605205658.184399-2-samuel.holland@sifive.com>
 <ZmNu9AkHOTGj9uvw@debug.ba.rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <ZmNu9AkHOTGj9uvw@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_214007_342260_1A60F73A 
X-CRM114-Status: GOOD (  35.39  )
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
Content-Type: multipart/mixed; boundary="===============7831856368035432471=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7831856368035432471==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7d2x7RwjZFbRmT7E"
Content-Disposition: inline


--7d2x7RwjZFbRmT7E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2024 at 01:35:00PM -0700, Deepak Gupta wrote:
> On Wed, Jun 05, 2024 at 01:56:45PM -0700, Samuel Holland wrote:
> > Currently, we enable cbo.zero for usermode on each hart that supports
> > the Zicboz extension. This means that the [ms]envcfg CSR value may
> > differ between harts. Other features, such as pointer masking and CFI,
> > require setting [ms]envcfg bits on a per-thread basis. The combination
> > of these two adds quite some complexity and overhead to context
> > switching, as we would need to maintain two separate masks for the
> > per-hart and per-thread bits. Andrew Jones, who originally added Zicboz
> > support, writes[1][2]:
> >=20
> >  I've approached Zicboz the same way I would approach all
> >  extensions, which is to be per-hart. I'm not currently aware of
> >  a platform that is / will be composed of harts where some have
> >  Zicboz and others don't, but there's nothing stopping a platform
> >  like that from being built.
> >=20
> >  So, how about we add code that confirms Zicboz is on all harts.
> >  If any hart does not have it, then we complain loudly and disable
> >  it on all the other harts. If it was just a hardware description
> >  bug, then it'll get fixed. If there's actually a platform which
> >  doesn't have Zicboz on all harts, then, when the issue is reported,
> >  we can decide to not support it, support it with defconfig, or
> >  support it under a Kconfig guard which must be enabled by the user.
> >=20
> > Let's follow his suggested solution and require the extension to be
> > available on all harts, so the envcfg CSR value does not need to change
> > when a thread migrates between harts. Since we are doing this for all
> > extensions with fields in envcfg, the CSR itself only needs to be saved/
> > restored when it is present on all harts.
> >=20
> > This should not be a regression as no known hardware has asymmetric
> > Zicboz support, but if anyone reports seeing the warning, we will
> > re-evaluate our solution.
> >=20
> > Link: https://lore.kernel.org/linux-riscv/20240322-168f191eeb8479b2ea16=
9a5e@orel/ [1]
> > Link: https://lore.kernel.org/linux-riscv/20240323-28943722feb57a41fb0f=
f488@orel/ [2]
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> >=20
> > arch/riscv/kernel/cpufeature.c | 7 ++++++-
> > arch/riscv/kernel/suspend.c    | 4 ++--
> > 2 files changed, 8 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 5ef48cb20ee1..2879e26dbcd8 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -27,6 +27,8 @@
> >=20
> > #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> >=20
> > +static bool any_cpu_has_zicboz;
> > +
> > unsigned long elf_hwcap __read_mostly;
> >=20
> > /* Host ISA bitmap */
> > @@ -92,6 +94,7 @@ static bool riscv_isa_extension_check(int id)
> > 			pr_err("Zicboz disabled as cboz-block-size present, but is not a pow=
er-of-2\n");
> > 			return false;
> > 		}
> > +		any_cpu_has_zicboz =3D true;
> > 		return true;
> > 	case RISCV_ISA_EXT_INVALID:
> > 		return false;
> > @@ -724,8 +727,10 @@ unsigned long riscv_get_elf_hwcap(void)
> >=20
> > void riscv_user_isa_enable(void)
> > {
> > -	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EX=
T_ZICBOZ))
> > +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
> > 		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
> > +	else if (any_cpu_has_zicboz)
> > +		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
>=20
> `riscv_has_extension_unlikely` will check bitmap `riscv_isa[0]` which I t=
hink gets populated
> by boot cpu (correct me if I am wrong here). So as long boot processor ha=
s the extension, it'll
> try to set it on CPU which doesn't have it.
>=20
> How about doing this
>=20
> `riscv_fill_hwcap_from_isa_string` checks and enables bitmap for all CPUs.
> So make a check there and if any of the CPU dont have `Zicboz`, then set =
a global bool
> `zicboz_cpu_not_homogenous`.

That is what riscv_fill_hwcap.*() already does, we track both what each
cpu has and what is common across all cpus.
riscv_has_extension_[un]likely() is a test for whether all cpus have the
extension.

> Now in `riscv_user_isa_enable`, check following
>=20
> If `zicboz_cpu_not_homogenous` is set, then you already detected that som=
e of the CPUs don't
> have support for `Zicboz` and thus you wouldn't set for CPU which even ha=
s the support and
> print a warning message.
>=20
> If `zicboz_cpu_not_homogenous` is clear, then that means all CPUs support=
 the feature.
> You simply enable it on hart.

--7d2x7RwjZFbRmT7E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmNwFgAKCRB4tDGHoIJi
0mowAQC+vvnP/CghzXrekQcv9TZWEb/wPwRLBKlAIdsA7M7HHwEAncawDymOXnKT
urx08zh66oYywZj5ZD9n4+dbAGz+5A0=
=1CLG
-----END PGP SIGNATURE-----

--7d2x7RwjZFbRmT7E--


--===============7831856368035432471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7831856368035432471==--

