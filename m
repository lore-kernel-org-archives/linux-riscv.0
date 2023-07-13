Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92BCC001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvmES8Om1+zhExrEZqH06QvG5Y+x//6IfKjnG26IgP0=; b=FxCHMxweCAq6S3ZwxepBYjPcgV
	fP/KqC7+BdnEyRodC+2IWiTeXQ+2SHzoGUQxcIvvss/zGFMuSLLNu2f5rUv0dtpiwqAaGqKweO33O
	uiKx+cam42SPHLf0jRWuwSCkV1ctkd4ZoxYYaYaejoez0EEkjjmEa5iXSv7iBBtfnMWbX/uciauDd
	8dFKzvDWyxvbBEEjm+oG7aQ6eZqDL5RQUYvgRALUMR7AGxUEgQwvH+VV120M3kOJZVpNplseq0Ky6
	FqUwQe9VuOdHWdM8xFMwdMdVTLQp2auSaNjlg+vXYEPj5lAj5PQyyzNDfs7/dKHOu6buFxfNMBaR3
	xsQIzveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK00g-0042Uo-1F;
	Thu, 13 Jul 2023 17:21:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK00d-0042UF-1o
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 17:21:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 123466199C;
	Thu, 13 Jul 2023 17:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50D3C433C7;
	Thu, 13 Jul 2023 17:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689268902;
	bh=N5E85XLHguq9VMc/lAhtUJwkW3CfjKC0ALqOBx9bMbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVQNPNojdWrmzo6Ws5YJFrydp9YnkwF629nYyfq57wdCnDCNI8dOl1RC3K38p0H4y
	 WHKBjofujR4xjmcUU4ofhjcrHMGZUj0RVA8h6M/eQaxtutrt/xFVQ2gu26sBpiCTBc
	 peb+7RTNskFXqx9r1PCfAY4q2N6dNrzxENjnUcUcg8BR6k8Be8bRH8qkAfuuCsf+a9
	 KkrD2zqfIOB6JWABjaDluHWSmhdgcJ0/ZpsxMhUB3ya2HfHnGPuCRlpYiIu6K8txqB
	 MSb0g3SpeCEb8NCaDDug7+v/2iEmlNltKLC+FK23sKeu+2ugL4BQ9l83nML24G1eML
	 /b3O7/cFKfuLw==
Date: Thu, 13 Jul 2023 18:21:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-doc@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Marc Zyngier <maz@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Simon Hosie <shosie@rivosinc.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2 1/2] RISC-V: Probe for unaligned access speed
Message-ID: <20230713-unaligned-engaging-af88fa5fd9c8@spud>
References: <20230705164833.995516-1-evan@rivosinc.com>
 <20230705164833.995516-2-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230705164833.995516-2-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_102143_686245_9D899E66 
X-CRM114-Status: GOOD (  24.32  )
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
Content-Type: multipart/mixed; boundary="===============2340120480154834202=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2340120480154834202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fnLwWuReRbJ6hyE9"
Content-Disposition: inline


--fnLwWuReRbJ6hyE9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 09:48:32AM -0700, Evan Green wrote:

I got kinda mad about the whole Zicclsm thing, so I decided to take a
bit before reading the words "aligned access" again.

> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprob=
e.rst
> index 19165ebd82ba..88d7d64ec0bd 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -87,13 +87,12 @@ The following keys are defined:
>      emulated via software, either in or below the kernel.  These accesse=
s are
>      always extremely slow.
> =20
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are su=
pported
> -    in hardware, but are slower than the cooresponding aligned accesses
> -    sequences.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are sl=
ower
> +    than equivalent byte accesses.  Misaligned accesses may be supported
> +    directly in hardware, or trapped and emulated by software.
> =20
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are su=
pported
> -    in hardware and are faster than the cooresponding aligned accesses
> -    sequences.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are fa=
ster
> +       than equivalent byte accesses.

The indent here for line #2 looks odd. Is that an artifact of the patch?

> diff --git a/arch/riscv/kernel/copy-unaligned.h b/arch/riscv/kernel/copy-=
unaligned.h
> new file mode 100644
> index 000000000000..a4e8b6ad5b6a
> --- /dev/null
> +++ b/arch/riscv/kernel/copy-unaligned.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Rivos, Inc.
> + */
> +#ifndef __RISCV_KERNEL_COPY_UNALIGNED_H
> +#define __RISCV_KERNEL_COPY_UNALIGNED_H
> +
> +#include <linux/types.h>
> +
> +void __copy_words_unaligned(void *dst, const void *src, size_t size);
> +void __copy_bytes_unaligned(void *dst, const void *src, size_t size);

If we are putting this stuff in headers to call into asm, should we
prefix it with "riscv", or is __ enough?

> +void check_unaligned_access(int cpu)
> +{
> +	u64 c0, c1;

I quite dislike variables like "c0"/"c1", they make things harder to
read for no real benefit IMO. Would you mind renaming them?

> +	u64 word_cycles;
> +	u64 byte_cycles;
> +	int ratio;
> +	unsigned long j0, j1;
> +	struct page *page;
> +	void *dst;
> +	void *src;
> +	long speed =3D RISCV_HWPROBE_MISALIGNED_SLOW;

> +static int check_unaligned_access0(void)
> +{
> +	check_unaligned_access(0);
> +	return 0;
> +}

> +arch_initcall(check_unaligned_access0);

Could you please rename this function to match the actual use?
So something like s/0/_boot_cpu/?

Otherwise, I like the idea & we discussed the semantics last time around
and I was happy with them. I don't feel qualified to review the actual
speed test, so
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fnLwWuReRbJ6hyE9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLAynwAKCRB4tDGHoIJi
0vafAP9QtNqw2kcNrvo8jD3iX3SWjLnnq86q6AS5Xj38aRqJ+gEA41TCD6hkux31
urM+gYjkopnUOvXtpkDrq7fN1NIlcQk=
=YmcG
-----END PGP SIGNATURE-----

--fnLwWuReRbJ6hyE9--


--===============2340120480154834202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2340120480154834202==--

