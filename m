Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7DDC636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 22:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oBXz8ZcYNUCdSanT9FDwMVqLwo4Tzil7HTZEaxM47o=; b=LPaLMCme7iJgJoRF8vd8/9EAuy
	sM2SVbsdAND2/jR67Et93q4+wOJwe+KL4kTajF6fbkyC8ND+l+JwrKCXmA5SubtaQzpwi0gv3cPEU
	mwFrWe5erdnn2+qiFiLvAiUtn6Jw04mMwKLaCZs04ipZKPFH7GsM7RfNSNjACqfQYCx0Uj8qeeA33
	VJBr6UPgfFsbPfigcF6B8zo7Temapx+VIJMq/hFH3R6TproS/a6K41NuHmJp5YJBUnWDLWuWod0Ob
	auwYDJQzO5PPKM8XgDLgxGIKUqJaAJYEjmgcHyEEhWjn8f4t/Fs1+YpCWM8RVE66722igoV8dh0z7
	i6xFHTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRhVB-00GfCr-BN; Mon, 13 Feb 2023 22:40:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRhV7-00GfBq-GF
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 22:40:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D4E42B815D2;
	Mon, 13 Feb 2023 22:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005FCC433EF;
	Mon, 13 Feb 2023 22:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676328042;
	bh=unDxIoor1sFklvwyyZd77Oty09Zn9AKM0OFWSWqZyO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nS2HNmffuLmICr/UpU67iQHXmgSrI/i7/Rb3i2B/eBR0fbDvhMlmqPyRIyfeMFi1p
	 gvpiyDoj9Jmmviu9e+4jU1jGC+gvqgJP6e3Egbnl/KQ6+m5zXJRHhZe/1256M/VVRW
	 NmcL47rSYy/mfTPKdEHBCTrxdE2rvsjSAHAdJlCx24Vw8kvmIK7BYhJzDTwuVALLNj
	 Li9T3u0e2QHYdefofX+wUQ1OUYf6fCwR6VfXs0wCA3CRhxEfH4+NfOvj/c5+s+QdIX
	 SYEsg8W6BUQCcdgRwIU/EYb3ZtKwfFdGuYaDqIaKV65AqFt1pV0O4dZYUNBVdO1O2j
	 RJ2s42iJnW9/w==
Date: Mon, 13 Feb 2023 22:40:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, heiko@sntech.de
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	samuel@sholland.org, linux-riscv@lists.infradead.org,
	ajones@ventanamicro.com
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
Message-ID: <Y+q8ZnZ2A8g7BNdS@spud>
References: <20230212194735.491785-1-conor@kernel.org>
 <4658b0b0-dfd1-b5d8-f50a-3dbd81065cf1@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <4658b0b0-dfd1-b5d8-f50a-3dbd81065cf1@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_144045_853853_5DB3865A 
X-CRM114-Status: GOOD (  19.96  )
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
Content-Type: multipart/mixed; boundary="===============0789421615427806366=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0789421615427806366==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="224F8P7jiz/m8+eE"
Content-Disposition: inline


--224F8P7jiz/m8+eE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Heiko

On Sun, Feb 12, 2023 at 03:08:55PM -0800, Guenter Roeck wrote:
> On 2/12/23 11:47, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Guenter reported a splat during boot, that Samuel pointed out was the
> > lockdep assertion failing in patch_insn_write():
> >=20
> > WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:63 patch_insn_write=
+0x222/0x2f6
> > epc : patch_insn_write+0x222/0x2f6
> >   ra : patch_insn_write+0x21e/0x2f6
> > epc : ffffffff800068c6 ra : ffffffff800068c2 sp : ffffffff81803df0
> >   gp : ffffffff81a1ab78 tp : ffffffff81814f80 t0 : ffffffffffffe000
> >   t1 : 0000000000000001 t2 : 4c45203a76637369 s0 : ffffffff81803e40
> >   s1 : 0000000000000004 a0 : 0000000000000000 a1 : ffffffffffffffff
> >   a2 : 0000000000000004 a3 : 0000000000000000 a4 : 0000000000000001
> >   a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000052464e43
> >   s2 : ffffffff80b4889c s3 : 000000000000082c s4 : ffffffff80b48828
> >   s5 : 0000000000000828 s6 : ffffffff8131a0a0 s7 : 0000000000000fff
> >   s8 : 0000000008000200 s9 : ffffffff8131a520 s10: 0000000000000018
> >   s11: 000000000000000b t3 : 0000000000000001 t4 : 000000000000000d
> >   t5 : ffffffffd8180000 t6 : ffffffff81803bc8
> > status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000=
003
> > [<ffffffff800068c6>] patch_insn_write+0x222/0x2f6
> > [<ffffffff80006a36>] patch_text_nosync+0xc/0x2a
> > [<ffffffff80003b86>] riscv_cpufeature_patch_func+0x52/0x98
> > [<ffffffff80003348>] _apply_alternatives+0x46/0x86
> > [<ffffffff80c02d36>] apply_boot_alternatives+0x3c/0xfa
> > [<ffffffff80c03ad8>] setup_arch+0x584/0x5b8
> > [<ffffffff80c0075a>] start_kernel+0xa2/0x8f8
> >=20
> > This issue was exposed by 702e64550b12 ("riscv: fpu: switch has_fpu() to
> > riscv_has_extension_likely()"), as it is the patching in has_fpu() that
> > triggers the splats in Guenter's report.
> >=20
> > Take the text_mutex before doing any code patching to satisfy lockdep.
> >=20
> > Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> > Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> > Fixes: 1a0e5dbd3723 ("riscv: sifive: Add SiFive alternative ports")
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Link: https://lore.kernel.org/all/20230212154333.GA3760469@roeck-us.net/
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
>=20
> Applying this patch together with
>=20
> riscv: Fix early alternative patching
> riscv: Fix Zbb alternative IDs
>=20
> _and_ disabling CONFIG_RISCV_ISA_ZBB fixes all problems observed with
> riscv64 for me. With that,
>=20
> Tested-by: Guenter Roeck <linux@roeck-us.net>
>=20
> Unfortunately I still see boot failures when trying to boot riscv32
> images, so something is still broken. I don't know yet if that is
> a generic problem or if it is related to a riscv patch.
> I am still trying to track that down ...

Heiko, would you be able to look at this please?
There's some more information in the Link: above.

Thanks
Conor.


--224F8P7jiz/m8+eE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+q8ZgAKCRB4tDGHoIJi
0nT5AP9+s8sU0OK5nXQkbZn8K3xeYNeOKFA1ZMRBY/BQ5u1efQEA9K6BHqpxllAf
HJVZuGK2vZ2Rr1d23CRTxL0IFEqhtgU=
=sCci
-----END PGP SIGNATURE-----

--224F8P7jiz/m8+eE--


--===============0789421615427806366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0789421615427806366==--

