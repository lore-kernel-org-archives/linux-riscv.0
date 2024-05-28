Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BB0C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fTDmV8SfopuMvUhBKi1OrRcEXkw5+PXSeL7yBco9Qw=; b=cvKjxtvBAxiDvkJkExuNtJ6VmL
	/OZaxSUGx5SBCcreUvRWdSfGEFqWPCb6UlFukNDy1OW5Yr2LXLYu13klX1fom3fsDLeHo91Ptf3+H
	FoJCcOKd/l6Mx8uE2iwWZIcn7vvHB+XfVhKT3awSNBr90oO+oHOfHCtzubP6LFhzJbWg7shhsq+uU
	i/Kr2vohsp+hIgGBpgvgvGLQJd7lmFjMI56zovJiE3VXD+2qAp62+tzpq6WxysZrXcWaDChbIijhp
	9WZ3kvv8QP0FeeFAQ9SEKHnOawlnWdKOOjlGL34wUP6szyhF3yMCwh9M3z+yEq2h94IYUPWL/KGzz
	oZ8rmi2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByf7-00000001DjB-2jPn;
	Tue, 28 May 2024 15:22:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByf5-00000001DiT-3KWl
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 15:22:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7F611CE1140;
	Tue, 28 May 2024 15:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790DFC3277B;
	Tue, 28 May 2024 15:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716909767;
	bh=wTi+xli6HcY+dE5hQHt0HIl1zh3+zE9RZPz4hC45DyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UuA4epHx7egvOMi6jS4ZFmmTgKjt6C8CCa53rcRGHKIPR412VllMWvVkZbaDkvoWj
	 3FkvUL8WAl9S4zn3SEeyDluFFw/JitsAmjoE3CmfHJbLPz6ESeiG1jjYczZziStLgv
	 KExtuJnx51AZoVIaBAtnx2IdzIOZE5OZaqB8ptkTMEC1TjE7h5RjUqBHe+uMvANf55
	 QoradKfdNj6SGZX/myb9j13ziGOCuwftMv25MuAD93JYzvgOZombc8hqH0E9hOpy3v
	 /2V6zIG2k+2bW+Od6tt1/jlYV8MMWwxRvvzOQTkf6UQ1PWWu678fqXejcMW8l95RrX
	 Q3kyQYMUsrHwQ==
Date: Tue, 28 May 2024 16:22:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 4/7] riscv: Implement xchg8/16() using Zabha
Message-ID: <20240528-prenatal-grating-2b6096cc2a1b@spud>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240528151052.313031-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_082252_038658_3E518310 
X-CRM114-Status: GOOD (  11.80  )
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
Content-Type: multipart/mixed; boundary="===============0079150090914198172=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0079150090914198172==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0GTOFQLtWJu+ErMd"
Content-Disposition: inline


--0GTOFQLtWJu+ErMd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 05:10:49PM +0200, Alexandre Ghiti wrote:
	\
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index e17d0078a651..f71ddd2ca163 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,7 @@
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
> +#define RISCV_ISA_EXT_ZABHA		75
> =20
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3ed2359eae35..8d0f56dd2f53 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -257,6 +257,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> +	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),

You're missing a dt-binding patch in this series adding zabha.

Thanks,
Conor.

--0GTOFQLtWJu+ErMd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlX2wgAKCRB4tDGHoIJi
0sMPAQDF0+IXL0mMgc3HglnXcCxaxr8V2FlJsd42Fa3JmGHPNAEAwEvb+htVAMAp
Oz7amAHz+PXP7m/FfiQEjyXQXz+PsQg=
=ven9
-----END PGP SIGNATURE-----

--0GTOFQLtWJu+ErMd--


--===============0079150090914198172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0079150090914198172==--

