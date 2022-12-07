Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF0DC47089
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 09:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFXVyL6iYNdl0V4O9uuuQqn2d17iADqb/4D88rv8O9w=; b=3N4rg8+z43LNiDyyAPZK2eamKY
	9e5+cVHDYFYQ4ZJSVBJN+oWapMHC/X3v79xFHzg4BjmcmNO8qFym5O/hkAPGZwezmCAa2jm6qktOG
	DToRxBfpvAYloQpAehFFk8i4hbhGPBqXoKhPfATAPZbJqe/bdwSnGYwZhFeGM/jFLWVOVwDjATX55
	BK/YoJe+InmTVWQnN7cDDbb3oNioASv6NupWFCZ8wo9BuvBzgxDEk1SdkM6s441JnUmmGHNBVXE3Z
	1b8Ho7PdYk4x5qNj+KMgY0nOIbxPSCKQC8l1jX+j7sLMl2D/tbzRjdMcoc4itDFfcFwuTxeeWNfFs
	qhaX9L4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qn1-00GCGi-3p; Wed, 07 Dec 2022 09:32:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qmx-00GCBC-SX
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 09:32:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 286E6B81B2C;
	Wed,  7 Dec 2022 09:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CB5C433C1;
	Wed,  7 Dec 2022 09:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670405544;
	bh=C2Qa7eO4zQqZVnZMMcDQ10lrJR5JlYJLYE/HH767lRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lo6cuRBNx512Shd/pKt+RH5NrQdFx5FbLrfNf9ugYuUB7uy85iueP+9LeSiuAxtvH
	 5Izxj51Ja/X8TYy5vY/N6DkIYq0cl3RIr9ZFB6RrNSf0KmVM+WtaE3C2xCrZ5LdpVy
	 K9cYsYh8WcJqUEDocjfqf6eVEsmMqtY4Kw899xC3lCJpUBXEcoPztQwgdO1jpvhgi/
	 eJF5YpSMenAX0XKPOBfARDockhuE1KiefAOMqwdimRmjHFRpRe4DBdq+dhD87wsmp9
	 +QmXX6uOCGzRsaRdSyya1lzifeBHA8oHO/bArUbrY+Z5LCtLjsrldupGlaahY2vbGf
	 oHLLHTiP8g9yw==
Date: Wed, 7 Dec 2022 09:32:20 +0000
From: Conor Dooley <conor@kernel.org>
To: guoren@kernel.org
Cc: palmer@rivosinc.com, conor.dooley@microchip.com, liaochang1@huawei.com,
	lizhengyu3@huawei.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: Fixup compile error with !MMU
Message-ID: <Y5BdpHrKrRCw9izQ@spud>
References: <20221207091112.2258674-1-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221207091112.2258674-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_013228_094181_A4ABAB41 
X-CRM114-Status: GOOD (  20.80  )
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
Content-Type: multipart/mixed; boundary="===============2332757212742577620=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2332757212742577620==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Kg3KXAqPRPhThI7"
Content-Disposition: inline


--1Kg3KXAqPRPhThI7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 04:11:12AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> Current nommu_virt_defconfig can't compile:
>=20
> In file included from
> arch/riscv/kernel/crash_core.c:3:
> arch/riscv/kernel/crash_core.c:
> In function 'arch_crash_save_vmcoreinfo':
> arch/riscv/kernel/crash_core.c:8:27:
> error: 'VA_BITS' undeclared (first use in this function)
>     8 |         VMCOREINFO_NUMBER(VA_BITS);
>       |                           ^~~~~~~
>=20
> Add MMU dependency for KEXEC_FILE.
>=20
> Fixes: 6261586e0c91 ("RISC-V: Add kexec_file support")
> Reported-by: Conor Dooley <conor@kernel.org>

FWIW (but certainly don't resend for this)
s/conor@kernel.org/conor.dooley@microchip.com

Thanks for the quick fix, there's other issues w/ that config for me,
but this fixed the kexec bits :)
Tested-by: Conor Dooley <conor.dooley@microchip.com>

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ef8d66de5f38..91319044fd13 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -496,7 +496,7 @@ config KEXEC_FILE
>  	select KEXEC_CORE
>  	select KEXEC_ELF
>  	select HAVE_IMA_KEXEC if IMA
> -	depends on 64BIT
> +	depends on 64BIT && MMU
>  	help
>  	  This is new version of kexec system call. This system call is
>  	  file based and takes file descriptors as system call argument
> --=20
> 2.36.1
>=20

--1Kg3KXAqPRPhThI7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5BdpAAKCRB4tDGHoIJi
0su2AP9L8GJrDHopTVfnWYXYEFOLjQEaJZfNXA0Xoy5+iOgxEAEAgOSw/WcDDknk
9s5gANOjt2ba7ciDE2ephouE16QLBA8=
=hTdX
-----END PGP SIGNATURE-----

--1Kg3KXAqPRPhThI7--


--===============2332757212742577620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2332757212742577620==--

