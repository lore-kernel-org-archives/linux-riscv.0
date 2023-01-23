Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1CBC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 22:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTfByBDNeaxC4yLBuaK0x7Ju92lxQnriKSO3EXu7hXE=; b=GmBEZEY0LImbPNb3TJS2FgEFpu
	VbG7/86+b1iymnKT0fiePuC0Rn+TSem0czar5tgvf+8HQDm+c5bMjyZLW2q7aalIr/ODm6KMRZs2d
	ayligjU2epRfezMxNjVOS7E/ydMuQkNpU8i92xo+EHRKTs8MxSAsvJsfaBqqDIOmkJbcj1dquBuAL
	4+VuBbtW0ktlap/5LHj+t2xrWsSUB3SxpRFpIE6cch+7DBOYgR0w/0yDqoC4xYv7zV74MNdf1Bsn/
	0AWAXd0I5V27BXaU7wSdVnkMaz0pPPacdEhTz9UUAJjkQReh5ywPyJ9WQg/4cT4mqPQa61QKfd8o1
	3oY50bGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK51y-001gJi-0v; Mon, 23 Jan 2023 22:11:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK51t-001gJ8-NA
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 22:11:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA3E16113B;
	Mon, 23 Jan 2023 22:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D4EC433D2;
	Mon, 23 Jan 2023 22:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674511864;
	bh=B2Hun8fx94ummgXxtdvJvI9tjawF7V9UEMWQUtT0mcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HcgdVb7N420MXjiaT3Cy4xcVCA8Z39ghV+wDLAJdklaXRi0qcZdUgMyp5Bz27Eo6K
	 0Q7zvjVefDXPlafRBzutpafZFdPkAaa8GAp0dSiHQnOgVdJ4M7RSlkk7S5PZaDozLV
	 Zm+Jsb+LanQD1pEa/jGiIrWQINaF9LtUsGPmEN51MNTC8nM5F8Bn0Puj7Zgy8DKghN
	 6Z3okEYMedCreg8+2+l/5bGCJeOMYsA23VZzG37W9ep4OaJx96i+yYienRaLUP4aEK
	 3WbTlYFge3XFCEnj9ncyN4wPRE1UH++foFM7s5dpzFG0AMRf/p9UUz7SbvljzlLvAg
	 qMbc/WPWrLj4Q==
Date: Mon, 23 Jan 2023 22:10:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] riscv: Use PUD/P4D/PGD pages for the linear mapping
Message-ID: <Y88F808GULoKFOVJ@spud>
References: <20230123112803.817534-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230123112803.817534-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_141105_864987_F177A290 
X-CRM114-Status: GOOD (  23.75  )
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
Content-Type: multipart/mixed; boundary="===============2418427662031957759=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2418427662031957759==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AjN4nqWVveMYgtD1"
Content-Disposition: inline


--AjN4nqWVveMYgtD1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 12:28:02PM +0100, Alexandre Ghiti wrote:
> During the early page table creation, we used to set the mapping for
> PAGE_OFFSET to the kernel load address: but the kernel load address is
> always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> PAGE_OFFSET is).
>=20
> But actually we don't have to establish this mapping (ie set va_pa_offset)
> that early in the boot process because:
>=20
> - first, setup_vm installs a temporary kernel mapping and among other
>   things, discovers the system memory,
> - then, setup_vm_final creates the final kernel mapping and takes
>   advantage of the discovered system memory to create the linear
>   mapping.
>=20
> During the first phase, we don't know the start of the system memory and
> then until the second phase is finished, we can't use the linear mapping =
at
> all and phys_to_virt/virt_to_phys translations must not be used because it
> would result in a different translation from the 'real' one once the final
> mapping is installed.
>=20
> So here we simply delay the initialization of va_pa_offset to after the
> system memory discovery. But to make sure noone uses the linear mapping
> before, we add some guard in the DEBUG_VIRTUAL config.
>=20
> Finally we can use PUD/P4D/PGD hugepages when possible, which will result
> in a better TLB utilization.
>=20
> Note that we rely on the firmware to protect itself using PMP.
>=20
> Acked-by: Rob Herring <robh@kernel.org> # DT bits
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

No good on !MMU unfortunately Alex:
=2E./arch/riscv/mm/init.c:222:2: error: use of undeclared identifier 'riscv=
_pfn_base'
        riscv_pfn_base =3D PFN_DOWN(phys_ram_base);
        ^

Reproduces with nommu_virt_defconfig.

Thanks,
Conor.

--AjN4nqWVveMYgtD1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY88F8gAKCRB4tDGHoIJi
0sk5AP9e/+SB3pTIKzfQPMgtXZkuV5QgIeCGqK1UjjQhd6QjXAD+KMMwHzheEBnp
V9mWrQAFGU8u6vVcNVc9I1zxH4pt8gg=
=XTYk
-----END PGP SIGNATURE-----

--AjN4nqWVveMYgtD1--


--===============2418427662031957759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2418427662031957759==--

