Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4E6C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 21:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nY3JoUPSY5lqb1O8uT0qmSP2naQrqq91/heoQYkRYmo=; b=h6V4CXfZ8uHIQ9
	mdl/Uu/fM5q/keIAjI/dfcR8QIq+KV9RxTzSpvOyVeRKGD5DiOJTIFHOJAqCeXfYfVojgeLr0ReqZ
	R09STD0hbKgN2E2dNdWQw/va3tf2JIwM/4dfngk74Oj/Ql4TlTEQ4/bxQa8AfbHu8dnvqL1Gftz7Z
	bVg+2AW/9t8iJM3Bn3Fr4Di9zrl+pLufwUuShxJHM/UBy1nObU57UtL4v6h830qcTpZUdUXKAmUfE
	4cAJyHMI4fCYXhmqcf+FFAYmjtOtbEcYsf0IYT33Sn8Kr1W1DgzfentOWaqGOgwGE/49uEyFak2+m
	HNhU/sWI+4jepQVHAkrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSwd-0000000BKAs-3GFc;
	Wed, 11 Jun 2025 21:25:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQdh-0000000AvOq-2kUq
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 18:57:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABC5261135;
	Wed, 11 Jun 2025 18:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CCEC4CEE3;
	Wed, 11 Jun 2025 18:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749668252;
	bh=FA4/cN74JMJAalmgbqNaeO1ru918vWjigUxWd4NER0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XT6eiIWIMaG0Ss0mBqQm9OyIlONbS8GrNWdECj9HI8lh1+FNzsqnE35rx+2ZsnY1F
	 aPxzJZwSezIa3QWVXRTpFTPLiUu0Opy22io2/TWDrnMlrvH5z5d4HC8FmoWdoc4Ry5
	 m/JzQlN7MeZleb2DlnPfPTc/DzqdkC62QYl+A6zCNsQnGXBEzm/eCiZC2X9xt85X17
	 rwlgUbt4b1fIki0Z8TwU8RYkMbc5aMQRPo93qexzpNZ3dkEkHlbRU78zxC2hdw98wE
	 rhAsW2DowdlqmZa+6BYYnIjocCyvhSC4NYUQsa9fVburmAu+AfbANyrqmgSpf1oqE6
	 DUmUH4rygfWMA==
Date: Wed, 11 Jun 2025 11:57:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
Message-ID: <20250611185727.GC2192624@ax162>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 11, 2025 at 11:22:14AM +0200, Thomas Wei=DFschuh wrote:
> All vDSO code needs to be completely position independent.
> Symbol references are marked as hidden so the compiler emits
> PC-relative relocations. However there are cases where the compiler may
> still emit absolute relocations, as they are valid in regular PIC DSO cod=
e.
> These would be resolved by the linker and will break at runtime.
> This has been observed on arm64 under some circumstances, see
> commit 0c314cda9325 ("arm64: vdso: Work around invalid absolute relocatio=
ns from GCC")
> =

> Introduce a build-time check for absolute relocations.
> The check is done on the object files as the relocations will not exist
> anymore in the final DSO. As there is no extension point for the
> compilation of each object file, perform the validation in vdso_check.
> =

> Debug information can contain legal absolute relocations and readelf can
> not print relocations from the .text section only. Make use of the fact
> that all global vDSO symbols follow the naming pattern "vdso_u_".
> =

> Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120002
> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

I ran this through a few different architectures with LLVM=3D1 and did not
see anything interesting.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  lib/vdso/Makefile.include | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
> index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adbb6=
8497181085752f8 100644
> --- a/lib/vdso/Makefile.include
> +++ b/lib/vdso/Makefile.include
> @@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) :=3D $(addprefix =
$(GENERIC_VDSO_DIR), getrand
>  #
>  # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
>  # dynamic relocations, ignore R_*_NONE.
> +#
> +# Also validate that no absolute relocations against global symbols are =
present
> +# in the object files.
>  quiet_cmd_vdso_check =3D VDSOCHK $@

I do not see VDSOCHK in the normal build log but I do see the check
being executed with V=3D1. That's obviously an outstanding issue but
figured it was worth mentioning.

>        cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep -q =
" R_\w*_"; \
>  		       then (echo >&2 "$@: dynamic relocations are not supported"; \
> +			     rm -f $@; /bin/false); fi && \
> +		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_=
\w*_ABS.*vdso_u_"; \
> +		       then (echo >&2 "$@: absolute relocations are not supported"; \
>  			     rm -f $@; /bin/false); fi
> =

> -- =

> 2.49.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
