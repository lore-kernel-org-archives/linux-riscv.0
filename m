Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE865D0C5F9
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3Z043vE6X9DTembVCwZFsFSBmEWRxWFyZ+Y9Jsvovw=; b=qW3zyHm44QSwbxECtyY5efsROG
	mvfjJ6zmfUb8CCNpuHbujrpj+iw3qR6lCTqbz1en+Fa0AaLEc9gjdLWb3xa5XVvcX0Mbx3sxpBIPt
	bRSqamzpfJru261ugKMspKOFVgRg/dd+v/2nBKLCYDae5ENKCO2cJ/bfIbv86NJthOuRLUugCOGAv
	9Uiuqw67NtAzm1jSvKSNZFB1iakCO/l7fhRhhiecO9C775ElcN7VNFTtCrXWZGmS0l1TUnYY7pL31
	n7V18drm+iPTztz0s9+v3acQsocpktYgD28tYxaoUi8CcXuntnzMlya9j+KWkPtYAwJ4H2+2jNpTb
	hAE+jPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HNF-00000003L3n-1ZkO;
	Fri, 25 Oct 2024 10:16:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HNB-00000003L3C-44bv
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 10:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2319A5C4A62;
	Fri, 25 Oct 2024 10:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97AEC4CEC3;
	Fri, 25 Oct 2024 10:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729851409;
	bh=xStiJAdN8rfXWCBPUd6wymS0l7sauhqKPVL1Cgv/UwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDZ/l9lQCIPkIukCi5/+TAmXDxGXZbo4bwe6RMTmoWnxuuXvCN6oyFuK8FlC1m4Fi
	 Y8yLu8VP8CMtbulfsc5I7xfEj3bQk+ONke99O/78bVDsn4msAA53SPKQ63aPXkwqGh
	 rpqEnZ6LRO0AcHz0aNHyQhagy1NnsdPhr72RPErUYVnAj0fUf048ouaYp3esq8Nceb
	 OEBJYCYfgqWw2w2mngPJECrjr97U1hWMWGI+lgVepEdyllTFU7CKsxEfgafHX2ybPq
	 ClC7skBKRjBkci102pKHVZKRqQuEBGlU13CcxDCifqighQ5hKV3yFPh3sQSVHE00kv
	 iaCgmCGTm6jnA==
Date: Fri, 25 Oct 2024 11:16:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, cleger@rivosinc.com,
	charlie@rivosinc.com, evan@rivosinc.com, samuel.holland@sifive.com,
	andybnac@gmail.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Enable Zicbom in usermode
Message-ID: <20241025-puritan-sank-b8a828ef5872@spud>
References: <20241025091527.57825-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20241025091527.57825-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_031650_078191_C6A5174E 
X-CRM114-Status: GOOD (  16.63  )
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
Content-Type: multipart/mixed; boundary="===============2691074014735939280=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2691074014735939280==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SBeakcOA7OyGXVKZ"
Content-Disposition: inline


--SBeakcOA7OyGXVKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 05:15:27PM +0800, Yunhui Cui wrote:
> Like Zicboz, by enabling the corresponding bits of senvcfg,
> the instructions cbo.clean, cbo.flush, and cbo.inval can be
> executed normally in user mode.
>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 1992ea64786e..bc850518ab41 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -924,7 +924,7 @@ unsigned long riscv_get_elf_hwcap(void)
>  void __init riscv_user_isa_enable(void)
>  {
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
> -		current->thread.envcfg |=3D ENVCFG_CBZE;
> +		current->thread.envcfg |=3D ENVCFG_CBIE | ENVCFG_CBCFE | ENVCFG_CBZE;

I believe we previously decided that userspace should not be allowed to
use zicbom, but that not withstanding - this is wrong. It should be
checking for Zicbom, not Zicboz.

--SBeakcOA7OyGXVKZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxtv5QAKCRB4tDGHoIJi
0oIvAP9+IsFienMh6mqsPaedEUf2DVR2QelZNeZ9CXxoT3YO3gD5AXLACu6fHwjt
HNlKMCdrYfzWWT0BWbVU7LBFHKE1LAU=
=54iy
-----END PGP SIGNATURE-----

--SBeakcOA7OyGXVKZ--


--===============2691074014735939280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2691074014735939280==--

