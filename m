Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08030C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 23:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j27HQJWtW4HRoFO06e4D+H6gG7ii7y5d/bwPADvsCWA=; b=kqeg7+J8YtWurwH8/kDDlsoGVv
	515GcBk3FJuocqLh5RQlpxPjdJnQX5hlS8/xYllflvXYNvECykl8Cd1ZvLKDCm7rUtELMJbPgSWcu
	YBhkHTvTPa5GshVMhm8IzkGRV7W8xqrhTusIlTEeRN4QYdtvh9ytaS+Zf5p+qJvQ/RZiHcxeLtAYl
	bQ1gkdS4UtaoseHfRd9jYiYLJVZk+ijLFT1k9LoEikKR2QTE2KgllV+a6jY+L3bfB7aaq9DZrn1sI
	cV7DUFTdCrERATe9Z4oNc3loHkJ++6heYF3O/7LlBuZGZpnDVyL6w4Qk32uXewm7f77kXoj6GOsGB
	o2sqKKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8UsI-000lSI-BO; Thu, 22 Dec 2022 23:21:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8UsE-000lO0-AY
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 23:21:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06EB761D9F;
	Thu, 22 Dec 2022 23:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2F5C433EF;
	Thu, 22 Dec 2022 23:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671751271;
	bh=l6dL2vDSNcL7oYRW+amc2+4KyYkOXC0ok5zluOYGF/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Us100g1wlq6MRpiTXSukcbxWLPU4glMHHxSIsSW5tmgjbU5PUCDDOe7gHmx/riPRo
	 11b3JkF/y8fctAVaiDwp48R6YryN86LM3/dakavL6IHhvpaHZQ0b4swv3BOAPr7fvo
	 7F+XEEOQFfqZ2QpYVHMkmqSc1cErCWHyB4UGkE5m/op+cMqNmcVhZYSzv9KlAg0M2O
	 XDLnfVxGNGLh9i5rSzyJ9JBmA00ooCGEmKLQ00O+dQgtPcDuA2W+m6+U1PEex4dmgK
	 G6dpmmNRPupLBgat3Kg2p733GRAlD3B1K0WJrUrAd7FiVb+INZ43xBbz9SbGeAW23k
	 6cl5O38+Fl5dg==
Date: Thu, 22 Dec 2022 23:21:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3] riscv: Use PUD/P4D/PGD pages for the linear mapping
Message-ID: <Y6TmYjr07W9WJEPn@spud>
References: <20221213060204.27286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20221213060204.27286-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_152114_505269_E316971E 
X-CRM114-Status: GOOD (  31.21  )
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
Content-Type: multipart/mixed; boundary="===============2060832682170063726=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2060832682170063726==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9ftFqcji9/MYD4OZ"
Content-Disposition: inline


--9ftFqcji9/MYD4OZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 07:02:04AM +0100, Alexandre Ghiti wrote:
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
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>=20
> v3:
> - Change the comment about initrd_start VA conversion so that it fits
>   ARM64 and RISCV64 (and others in the future if needed), as suggested
>   by Rob
>=20
> v2:
> - Add a comment on why RISCV64 does not need to set initrd_start/end that
>   early in the boot process, as asked by Rob
>=20
> Note that this patch is rebased on top of:
> [PATCH v1 1/1] riscv: mm: call best_map_size many times during linear-map=
ping

Hey Alex, unfortunately I could not get this to apply either (I tried a
riscv/for-next & Linus' tree).
The above patch should be in both, so idk:
git am -3 v3_20221213_alexghiti_riscv_use_pud_p4d_pgd_pages_for_the_linear_=
mapping.mbx
Applying: riscv: Use PUD/P4D/PGD pages for the linear mapping
error: sha1 information is lacking or useless (arch/riscv/mm/init.c).
error: could not build fake ancestor
Patch failed at 0001 riscv: Use PUD/P4D/PGD pages for the linear mapping

I assume it'll need a rebase after -rc1?

It's really nice to see someone looking at this early code, from the
bit of digging around that I've done chasing bugs it feels like it needs
it- so thanks!


--9ftFqcji9/MYD4OZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6TmYgAKCRB4tDGHoIJi
0izPAP9karoTeNWFNJMv29u3mPiB5aYGZlbcvx9ezsfRYThJLgEAshJH3WY+pdJL
JZ083PbuMpcDpANbhziGKxUSbknqmQ8=
=Khpa
-----END PGP SIGNATURE-----

--9ftFqcji9/MYD4OZ--


--===============2060832682170063726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2060832682170063726==--

