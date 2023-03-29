Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EF4C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 14:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CWeqrVO5JyMGjTmB30raoE0qhqo4SVHo/2SNnl72Wc=; b=vjuZJHBMIshYg5nynH0AbBDQDB
	Y14uGcijUtk+R0pbd9WZuftmwOZNI64vzz3FSe39Sbc1RHaFNiCuMhM1Tl8WXt0uRt4xCM2K8uoHK
	S7I6HBKbiVxX+Aa0yc+nXQTRmu6fDYbOpazP9fm7N0IdUcHwJqZZesxWWLWRcSNG2WCJP1fC3g0yJ
	SbL0cHH2YkGObJBlg4M9a6lek7JD4GUO/7/ZIfbkvyYtKzu1ZMCjgskQ33e/W89HWWjeArS4Wu0Xk
	+6GBQL0AlXXqYpJ0nZeyNud488XIVpDrQtXbaVC+Zj6XklRceFdPgDkjz627L3XyCjopULoboekay
	xIZSB7pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phWvf-000e6e-0K;
	Wed, 29 Mar 2023 14:37:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phWvc-000e5y-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 14:37:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CE5E3B820FF;
	Wed, 29 Mar 2023 14:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95671C4339B;
	Wed, 29 Mar 2023 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680100649;
	bh=L1sqLmIkifE2Q8DXW/e/GjzJNlmt1BIwb5AvVrF0wO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCwHJUPMBB2T0IVu3eU/P+W1JqphqMbb768sdao2TORxURk+WeoyQYAVg+Q+drdj1
	 ++BV38HtdQsEpBsufFO+21Lft9t3gt2nXrwkgZ5xbW8gTkacUm5coCLBsxhM+ZQZX6
	 gdq2N3yCkBi+jLr44SLjezXhsXVHBlCqF+omci4nnp9IyDPRjJdE6T0O5MTlBGbrj4
	 rfviN2WlFprK8I0fqoxEg6aINQRa2Xhq5HK5v7PHhvp6HazGoYpPibeGufWErZBEmo
	 8HlHuYfloPLK1SvQcB0mk+5DnvaVNEckdo3PcyEmCp4XZ3MBw4P2M3F02pVdceNWFY
	 T/SvmxtvsrjrA==
Date: Wed, 29 Mar 2023 15:37:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes v2 2/3] riscv: Do not set initial_boot_params to
 the linear address of the dtb
Message-ID: <179c38d6-4298-4a16-b0d7-8aee49a91f58@spud>
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
 <20230329081932.79831-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230329081932.79831-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_073732_311637_E3F65918 
X-CRM114-Status: GOOD (  18.67  )
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
Content-Type: multipart/mixed; boundary="===============3675811831402831757=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3675811831402831757==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UOjzVrvSVXjIViV0"
Content-Disposition: inline


--UOjzVrvSVXjIViV0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 10:19:31AM +0200, Alexandre Ghiti wrote:
> early_init_dt_verify() is already called in parse_dtb() and since the dtb
> address does not change anymore (it is now in the fixmap region), no need
> to reset initial_boot_params by calling early_init_dt_verify() again.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/setup.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 542eed85ad2c..a059b73f4ddb 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -278,10 +278,7 @@ void __init setup_arch(char **cmdline_p)
>  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
>  	unflatten_and_copy_device_tree();
>  #else
> -	if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
> -		unflatten_device_tree();

Silly question maybe, but since it isn't explicitly mentioned, the
XIP_FIXUP bits no longer matter?
Also, in related news, I assume you don't have a QEMU setup that can do
boot an XIP kernel?

Cheers,
Conor.

> -	else
> -		pr_err("No DTB found in kernel mappings\n");
> +	unflatten_device_tree();
>  #endif
>  	misc_mem_init();
> =20
> --=20
> 2.37.2
>=20

--UOjzVrvSVXjIViV0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCRNJQAKCRB4tDGHoIJi
0gqaAQDSe9gvXHde8jzjSZoWLPBptYoYGaraDZqYua/MYlGe3wEA/9h+58eBSjUH
4VGr3g5fK9KMQFkCCp3A/kRsgdI7bwM=
=B9wY
-----END PGP SIGNATURE-----

--UOjzVrvSVXjIViV0--


--===============3675811831402831757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3675811831402831757==--

