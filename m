Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53490C0015E
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 21:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVU7Bx9+ekJlyoQrgE/L+Ik03c+70OjZA24KZDG7LaY=; b=Uwv6vKfs5ez2X05AFOeuuBgQJq
	5djn2M1CGJ/d1NeeB3x55bmNsa3UZSzVDs5Tvewb4hnaxJPGGV8YNza6Z3Im+AXiiKdHFQ7UNphzp
	GOupJYOMDXk7gRLPOXRrXaxtwUPRoJbbuPOeoEA0Bul1oOxA6zMBS/7OfV08QggvFC+N8WVU4M2yv
	Nr5B46ntcqT7RPk0LcI60f+GYLhDUjBmX+sD4mZhJ0ho1OFTD4HE7w+k/UPOefcjn4OXCLVVAIlAy
	4bo0SgKLIAD7R/Q8o0fEJo/J/t+kSOF6GOUkumj06E9YdcGuHMhFvcrjrCsfKO30I+lA2C5DsGV9u
	8mV9/kAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQwtQ-003Ldc-0K;
	Tue, 01 Aug 2023 21:27:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQwtM-003Ld9-2B
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 21:26:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F30196170B;
	Tue,  1 Aug 2023 21:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858F0C433C7;
	Tue,  1 Aug 2023 21:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690925215;
	bh=U7dgv/gPFnq41YcNLCjZJ9Dek6jtsS7j5lqt4+JbTiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYVMYqI8ku7coxbeBTKK7hRfA49OR3QLOgz6i72/RP6nrl7MfBnFv6cjkTK7/dIRx
	 lpHMfk9kxqV/4xq2+UakllZn2qdNG5ahkPcfwgRQAoBX60hsfahMPAIALjrvKLQ340
	 jxNlBjsxcB3B33nfe5QPyf+n+bOJY/ub1Rfg+CHeFCPRFnRDo5UsfSgkIbcy6mGJHI
	 9ffkJGjiwTP0hmX/0pJqSWstflSzihGHj/J5XiOgNgHMdV5ZSYSIonOAyRVYjIqKc2
	 bRh8TL824Wr5qQhYEH6G+jYsUnV6T5pMWxLZQnAOdgcH/aIPyi1l3VozOx2GV8z9HG
	 nWooAjahUjFEg==
Date: Tue, 1 Aug 2023 22:26:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] RISC-V: cpu: refactor deprecated strncpy
Message-ID: <20230801-tinsel-parcel-aa034d07aeb6@spud>
References: <20230801-arch-riscv-kernel-v1-1-2b3f2dc0bc61@google.com>
MIME-Version: 1.0
In-Reply-To: <20230801-arch-riscv-kernel-v1-1-2b3f2dc0bc61@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_142656_825036_8070F8AE 
X-CRM114-Status: GOOD (  30.30  )
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
Content-Type: multipart/mixed; boundary="===============4484982904285433616=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4484982904285433616==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YnHqtxQiKmZEKon/"
Content-Disposition: inline


--YnHqtxQiKmZEKon/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Justin,

On Tue, Aug 01, 2023 at 09:14:56PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>=20
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!
>=20
> The `sv_type` buffer is declared with a size of 16 which is then
> followed by some `strncpy` calls to populate the buffer with one of:
> "sv32", "sv57", "sv48", "sv39" or "none". Hard-coding the max length as 5=
 is
> error-prone and involves counting the number of characters (and
> hopefully not forgetting to count the NUL-byte) in the raw string.

What is error prone about it when there are only 4 characters possible?

> Using a pre-determined max length in combination with `strscpy` provides
> a cleaner, less error-prone as well as a less ambiguous implementation.
> `strscpy` guarantees that it's destination buffer is NUL-terminated even
> if it's source argument exceeds the max length as defined by the third

Wrong its ;)

> argument.
>=20
> To be clear, there is no bug (i think?) in the current implementation
> but the current hard-coded values in combination with using a deprecated
> interface make this a worthwhile change, IMO.
>=20
> [1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nu=
l-terminated-strings
> [2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html

This link is broken, it should be
https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html

Also, in the future, please use the form

Link: <url> [ref]

so

Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.htm=
l [1]

and so on.

> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  arch/riscv/kernel/cpu.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index a2fc952318e9..1c576e4ec171 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -17,6 +17,8 @@
>  #include <asm/smp.h>
>  #include <asm/pgtable.h>
> =20
> +#define SV_TYPE_MAX_LENGTH 16
> +
>  /*
>   * Returns the hart ID of the given device tree node, or -ENODEV if the =
node
>   * isn't an enabled and valid RISC-V hart node.
> @@ -271,21 +273,21 @@ static void print_isa(struct seq_file *f, const cha=
r *isa)
> =20
>  static void print_mmu(struct seq_file *f)
>  {
> -	char sv_type[16];
> +	char sv_type[SV_TYPE_MAX_LENGTH];
> =20
>  #ifdef CONFIG_MMU
>  #if defined(CONFIG_32BIT)
> -	strncpy(sv_type, "sv32", 5);
> +	strscpy(sv_type, "sv32", SV_TYPE_MAX_LENGTH);
>  #elif defined(CONFIG_64BIT)
>  	if (pgtable_l5_enabled)
> -		strncpy(sv_type, "sv57", 5);
> +		strscpy(sv_type, "sv57", SV_TYPE_MAX_LENGTH);
>  	else if (pgtable_l4_enabled)
> -		strncpy(sv_type, "sv48", 5);
> +		strscpy(sv_type, "sv48", SV_TYPE_MAX_LENGTH);
>  	else
> -		strncpy(sv_type, "sv39", 5);
> +		strscpy(sv_type, "sv39", SV_TYPE_MAX_LENGTH);
>  #endif
>  #else
> -	strncpy(sv_type, "none", 5);
> +	strscpy(sv_type, "none", SV_TYPE_MAX_LENGTH);
>  #endif /* CONFIG_MMU */
>  	seq_printf(f, "mmu\t\t: %s\n", sv_type);
>  }

This all seems rather horrible, we should probably clean it up, but that
is nothing to do with your patch. To be clear, I am also not requesting a
resubmission for the commit message nitpickery.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--YnHqtxQiKmZEKon/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMl4mwAKCRB4tDGHoIJi
0pVoAQDmQjneDXMF/O2Z8naa/wVqe4BsEZNuH50zc6EEaEGVugEAoYPeFRvmv4Sk
/xr+fzJ+L6ng3taifnrp/hJz1yzc+wI=
=S5Oo
-----END PGP SIGNATURE-----

--YnHqtxQiKmZEKon/--


--===============4484982904285433616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4484982904285433616==--

