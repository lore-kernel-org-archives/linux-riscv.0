Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6CEC77B7E
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C62Rdhhbp0GuDHSG0/Ar/fvUeEH6nu9DiO/d/6hvKXY=; b=zPHVGOr0i1ke5vyIKTWujztLMB
	mTdF7NzPycQmjauDR+JPkhaFyeTiM4wX4BRrOTavZZUaNw/R3S/EOgyiz4Llrve1OGnnkvk6tfOM7
	Hp2+Z0qixeX9axiE+I05UzUUo+IDLbX12N2e6r8+RKP5YUU8H3i/ZzPjAp1Z5gAHduC8dUT/xZkIr
	RXzR9w4J0xU94879/pQYkuznby3UOLjEX4ckusuf9owdUi+i2gsAD0vNXgvOqIwjtMigNbx4Mmoqt
	i1UplA0Bi6FouZFVj4InnuY1EmEKwvNQ+d38b0lPfIVSTbbm34SMvKrTw2NPO13Lgibkuz1/bup3l
	VrApuehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psgwb-00CTIU-2i;
	Sat, 29 Apr 2023 09:32:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psgwZ-00CTHc-0N
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 09:32:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 663BB6102C;
	Sat, 29 Apr 2023 09:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC560C433D2;
	Sat, 29 Apr 2023 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682760757;
	bh=1769BdjMLXLnUwLK8f8JVBPR8cBqGG+XblOEkEa7eYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPRGpsaJk7zUD8bD5Ekgq3hdByXNDrGIkXpUV1fgOL5E5SXd7hNlxbjs9hWUUls8b
	 cP9mvJ0Lcc+gZyQqezGk5H13Qy4mOTJbGXZ5ANohkTp9KVsHqniI3QdxjDiLlktPQi
	 HB210EcR6/5VGP/lrV5HLrIJKbXhfn3eFdUXfv9wSDRHDQ0Odo7xFLADWohvMGkRhI
	 M+ctaWn1AlR3m/b0bU7fon+TmLXBWJV3smZBRnLjszinDJm+t7n/raE/eAaiGCAVtl
	 fVCu8PZaSTL2QnQUcLBo9hBqI0Lzu1dX/cIXk3o1ecspFPKzl6YnriRC5eT/+MkQoh
	 W3PwApNElxtNA==
Date: Sat, 29 Apr 2023 10:32:33 +0100
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] RISC-V: fixup in-flight collision with
 ARCH_WANT_OPTIMIZE_VMEMMAP rename
Message-ID: <20230429-neurology-sudoku-8d53b23d01b8@spud>
References: <20230429-trilogy-jolly-12bf5c53d62d@spud>
MIME-Version: 1.0
In-Reply-To: <20230429-trilogy-jolly-12bf5c53d62d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_023239_258719_CC25295E 
X-CRM114-Status: GOOD (  19.28  )
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
Content-Type: multipart/mixed; boundary="===============6788601404855814714=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6788601404855814714==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qDiTzWvV7OasW/BT"
Content-Disposition: inline


--qDiTzWvV7OasW/BT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 29, 2023 at 10:27:33AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Lukas warned that ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP had been
> renamed in the mm tree & that RISC-V would need a fixup as part of the
> merge. The warning was missed however, and RISC-V is selecting the
> orphaned Kconfig option.
>=20
> Fixes: 89d77f71f493 ("Merge tag 'riscv-for-linus-6.4-mw1' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/riscv/linux")
> Reported-by: Lukas Bulwhan <lukas.bulwhan@gmail.com>

That should have been Lukas Bulwahn <lukas.bulwahn@gmail.com>.
This is what I get for hand-typing an email address that I could have
copied from lore I suppose.

> Link: https://lore.kernel.org/linux-riscv/CAKXUXMyVeg2kQK_edKHtMD3eADrDK_=
PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I guess you picking this up for your second PR makes the most sense
> Palmer?
>=20
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Linus Torvalds <torvalds@linux-foundation.org>
> CC: Andrew Morton <akpm@linux-foundation.org>
> CC: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> CC: Lukas Bulwhan <lukas.bulwhan@gmail.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5c88ac4b52be..e1bdb3fb16cc 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -46,9 +46,9 @@ config RISCV
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
> -	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>  	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
> +	select ARCH_WANT_OPTIMIZE_VMEMMAP
>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>  	select BUILDTIME_TABLE_SORT if MMU
> --=20
> 2.39.2
>=20

--qDiTzWvV7OasW/BT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEzkMQAKCRB4tDGHoIJi
0o3GAQC7V+gnYkJqWi+6caRdyr0vEFPODHvJQ+YIuoiH4YEu5QD8DlxZmcCK3fje
a2rYdGJXluGu1Z+roEhtMr/ab8vDVQ0=
=1Va4
-----END PGP SIGNATURE-----

--qDiTzWvV7OasW/BT--


--===============6788601404855814714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6788601404855814714==--

