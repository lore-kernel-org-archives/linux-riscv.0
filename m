Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC83C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEQe4NZ1/EY+ohjCj0aAv/vu+7bzNSmBeaOdmIcRxwI=; b=of9udbwB99G5H+1amVCTGZ9DSj
	J1q5dSR+BhUm0LG6sE3O+vSodhUNOG9zd83oODHqbjRzCYZHnAM1SJjZYGsTg5w04So++f/WE++up
	bXl+RkxFxZCZR4KQCEIptlCKAJ6UooIeA1FsALi+ibrWJkTwcVKpLx6tmphRgnUcaeGrWQUAZG8Sa
	pjmdCqu3V9uhK4LOKNUhsBe48yUoMWWPPL75Lrr8Zad/NjVjshHo3bJ/I2HgEBHAg6LvRGzdpVPBe
	6am8aAag8E4Rnn6Ngd5m5UplzzX8ZiziAofjZslBWVqZdfz+L+3Bk7NwbYyPBdo7NYzEiLAa6plTx
	hzuyQeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0VZ-00GWpT-1J;
	Wed, 22 Mar 2023 15:36:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0VW-00GWoZ-1i
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 15:36:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BB09DB81CEE;
	Wed, 22 Mar 2023 15:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEB5C4339B;
	Wed, 22 Mar 2023 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679499365;
	bh=DZy9l2qyDKre9adLwkTIGVd6PoEOrq5ypuDZNWHxbJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWqGKRZENH6xhp47Uo6JUmbc8rMcVyCGI1wIWS9Ycu1PR1v0i/Lz6WE6+ITRbtQWP
	 KAnd/amMvGloOOH7kvjSXNEUHUkGA1gaJqAMqsveJtnl/L2r+/wOKA/YOupxvhpISe
	 P3FgL3ojHPObXM2v0pgehfxYKLrp39ovS8Ar51V52vhsmGInrbpfA4Mrw4C/S1FFTA
	 DuFz4tYaXZxzg234CCAJ1GVEhXEQhPTgYATpEzg3nAgPu9x9So32+zEkijfb7Br4SN
	 tkUOZaFPXlyyZwFHfh4HFM89T11cJdwBtYwAxhUy9nBxJT+LzAxHv3YCLVfdDX6RzX
	 lx0Mz43ukmzFg==
Date: Wed, 22 Mar 2023 15:35:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, slewis@rivosinc.com,
	heiko@sntech.de, vineetg@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>, Guo Ren <guoren@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/6] RISC-V: hwprobe: Add support for
 RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Message-ID: <8e132bed-c85a-4bfd-bff8-5147db1cec32@spud>
References: <20230314183220.513101-1-evan@rivosinc.com>
 <20230314183220.513101-4-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230314183220.513101-4-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_083610_903409_D6379517 
X-CRM114-Status: GOOD (  19.09  )
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
Content-Type: multipart/mixed; boundary="===============9223049978124257704=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9223049978124257704==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r+TYFFM1/Jo8CP9z"
Content-Disposition: inline


--r+TYFFM1/Jo8CP9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 11:32:17AM -0700, Evan Green wrote:
> We have an implicit set of base behaviors that userspace depends on,
> which are mostly defined in various ISA specifications.
>=20
> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> @@ -125,6 +126,25 @@ static void hwprobe_one_pair(struct riscv_hwprobe *p=
air,
>  	case RISCV_HWPROBE_KEY_MIMPID:
>  		hwprobe_arch_id(pair, cpus);
>  		break;
> +	/*
> +	 * The kernel already assumes that the base single-letter ISA
> +	 * extensions are supported on all harts, and only supports the
> +	 * IMA base, so just cheat a bit here and tell that to
> +	 * userspace.
> +	 */
> +	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> +		pair->value =3D RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
> +		break;
> +
> +	case RISCV_HWPROBE_KEY_IMA_EXT_0:
> +		pair->value =3D 0;
> +		if (has_fpu())
> +			pair->value |=3D RISCV_HWPROBE_IMA_FD;
> +
> +		if (elf_hwcap & RISCV_ISA_EXT_c)

Random thought while reviewing another patch, and I kinda felt a bit
stupid following the existing code to try and make sure, but should this
become a call to riscv_isa_extension_available(NULL, c)?
It may be nice to propagate that helper, if it works, than check the bit
directly.

Cheers,
Conor.

> +			pair->value |=3D RISCV_HWPROBE_IMA_C;
> +
> +		break;
> =20
>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
> --=20
> 2.25.1
>=20

--r+TYFFM1/Jo8CP9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBsgXwAKCRB4tDGHoIJi
0uXwAPwO6vaB4a7jTfh6cwcjIbakPGbW2KoWTWyZNWCElUCFGgEA/czXfGY7/Z9G
0R/BZly3E44aKfHbp8z2S2DhkztM8QU=
=2y2o
-----END PGP SIGNATURE-----

--r+TYFFM1/Jo8CP9z--


--===============9223049978124257704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9223049978124257704==--

