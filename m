Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FDFC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuS/K1PabYqsUnmJBl93wAXRG02pQYu2vdotPIPPEmE=; b=iaC9a+RI39U5dSusdXCOgkQw7c
	YW/QgTlOcgi9zrFwu580EyEZpkoFv5/M8YxPv27bj2AgnDWaCArc/AKujMQzp4MhFDKjHSEzStlGT
	JD0xEXgKGgh0OuPqbnX/WdP1yVTlPi0bysTP4HSVIqwp7CyEEeiJcHT9z06WZnTai3OIPokUiOeia
	f6/MYY0ZGpq1elQy9bMWXoTHKgslgIoNBepND378AHiZjIVsJBC6X4v5ImuaQBj4N7m9l3271xnBr
	niUOtnz4p9MqXLYtuK0t295hMJLVSZqOheCgAkpc/P83VWOMjHkcLgny++9axfUGnCrQUjMontoCR
	+Z2QlxKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFL8M-008Sny-1o; Tue, 10 Jan 2023 20:22:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFL8I-008SnL-E5
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 20:22:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3D4761750;
	Tue, 10 Jan 2023 20:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FF0C433D2;
	Tue, 10 Jan 2023 20:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673382125;
	bh=9EGHZOb2GDNsDgmyNNhgiMq88KY2ZtPaE3rt9uNDuaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYFPAW67K5ZWu8/aDzox6CkWb38sLQQeAPhNjIRNoYFt6+TEcmSoK9E6XVAnDhFe2
	 ODjw6CqXeAvScwhX9afNrRuUeL3ZcxXuChLed89nMEourriKry5QE6i/wHt8G0w5+E
	 tjbssRJn7AyFn39tlVpVGBzVUILBMwvzlRSXSz3tuFXl+XZiu8Bp7hMNHVkrownedI
	 13ZaeZb1qrUo8INIVIcNkcIaXLX5ZiWLPfEBzjMzhmQIIbHR5rGrsdtzeh55TRyA5y
	 /BB4YnJSpU/Y5/LpdJi8SuR8kTXh4WNJOYU+HpyVw2R9zBaIqQS41kdcmGxAhOLXpU
	 r1N78z1zYP7Aw==
Date: Tue, 10 Jan 2023 20:22:00 +0000
From: Conor Dooley <conor@kernel.org>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <Y73I6H+X+qswIst0@spud>
References: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
 <20230109062407.3235-4-jeeheng.sia@starfivetech.com>
 <20230109193624.iiuguwgimpn7zbyw@orel>
 <6638291f6a3c463994919ba0a875472c@EXMBX066.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <6638291f6a3c463994919ba0a875472c@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_122206_568829_B33B7487 
X-CRM114-Status: GOOD (  22.75  )
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
Content-Type: multipart/mixed; boundary="===============1117893912587283692=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1117893912587283692==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aEr+ayiT2Lg3RrOQ"
Content-Disposition: inline


--aEr+ayiT2Lg3RrOQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey JeeHeng,

On Tue, Jan 10, 2023 at 08:37:01AM +0000, JeeHeng Sia wrote:
> > From: Andrew Jones <ajones@ventanamicro.com>
> > On Mon, Jan 09, 2023 at 02:24:07PM +0800, Sia Jee Heng wrote:

> > > +/* Helper parameters that help us to restore the image.
> >=20
> > Separate line for /*
> ok

I'm not sure why this one struct has an actual description that
resembles kerneldoc, when nothing else does - but why not make it
actually kerneldoc, as you're almost there as things stand:
https://docs.kernel.org/doc-guide/kernel-doc.html#structure-union-and-enume=
ration-documentation

> > > + * @hartid: To make sure same boot_cpu executing the hibernate/resto=
re
> > code.
> > > + * @saved_satp: Original page table used by the hibernated image.
> > > + * @restore_cpu_addr: The kernel's image address to restore the CPU
> > context.

^^ also your mail client is doing some really odd things wrapping wise.

> > > +static unsigned long temp_pgtable_map_pmd(pmd_t *pmdp, unsigned
> > long vaddr, pgprot_t prot)
> > > +{
> > > +	uintptr_t pmd_idx =3D pmd_index(vaddr);
> > > +	pte_t *ptep;
> > > +
> > > +	if (pmd_none(pmdp[pmd_idx])) {
> > > +		ptep =3D (pte_t *) get_safe_page(GFP_ATOMIC);
> >=20
> > No space between cast and function. Same comment for following function=
s.
> > I thought checkpatch complained about that.
> Ok. But it is weird that checkpatch doesn't report the issue.

It does:
20:08:17 conor /stuff/linux$ ./scripts/checkpatch.pl --strict --terse -g HE=
AD~3..HEAD
7481f133eb0310496742c27d15a20fdd2c499d29:97: CHECK: Alignment should match =
open parenthesis
[...]
7481f133eb0310496742c27d15a20fdd2c499d29:370: CHECK: No space is necessary =
after a cast
[...]
7481f133eb0310496742c27d15a20fdd2c499d29:460: CHECK: No space is necessary =
after a cast
7481f133eb0310496742c27d15a20fdd2c499d29:467: CHECK: No space is necessary =
after a cast
7481f133eb0310496742c27d15a20fdd2c499d29:475: CHECK: Blank lines aren't nec=
essary after an open brace '{'
7481f133eb0310496742c27d15a20fdd2c499d29:480: CHECK: No space is necessary =
after a cast
7481f133eb0310496742c27d15a20fdd2c499d29:487: CHECK: No space is necessary =
after a cast
7481f133eb0310496742c27d15a20fdd2c499d29:499: CHECK: No space is necessary =
after a cast
7481f133eb0310496742c27d15a20fdd2c499d29:506: CHECK: No space is necessary =
after a cast
7481f133eb0310496742c27d15a20fdd2c499d29:518: CHECK: No space is necessary =
after a cast
7481f133eb0310496742c27d15a20fdd2c499d29:525: CHECK: No space is necessary =
after a cast
7481f133eb0310496742c27d15a20fdd2c499d29:577: CHECK: No space is necessary =
after a cast
7481f133eb0310496742c27d15a20fdd2c499d29:591: CHECK: Alignment should match=
 open parenthesis
7481f133eb0310496742c27d15a20fdd2c499d29:596: CHECK: Alignment should match=
 open parenthesis
total: 0 errors, 1 warnings, 21 checks, 545 lines checked

The patchwork automation seems to have ignored this patchset for some
reason. It was stuck on a patchset for some reason and this one may
have got skipped when I tried to sort that out.
Ordinarily, you'd see it complaining about these sorts of things.

Thanks,
Conor.


--aEr+ayiT2Lg3RrOQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY73I6AAKCRB4tDGHoIJi
0uevAQD0LL1+O9o932YhX5juJyehF24SF3kLO4FCJ3sYy9aDtQEAg6ulenxst/zo
EdNpMSk5NMwkh5uZhQU8Mk4yIIB5CQU=
=JgxJ
-----END PGP SIGNATURE-----

--aEr+ayiT2Lg3RrOQ--


--===============1117893912587283692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1117893912587283692==--

