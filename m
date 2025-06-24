Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E12C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 03:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UU3RXl8j3nH+qxmXleE8cDltg2k1q8u8rklZXN2U/Do=; b=NpOp85d6mZ8QFt
	0TPdsqsWJXMW+aXoKGrXWYKe7G+k4tc5YCoqPtjDW3cfYNVi1NqG3NjGrL5Jjk/kZI9ASW+C9v/F4
	1E2KUXNgDVFvwZ1i7+cVd20KU2OMuXsDUP5O6nykN+v1NgAGwg61RVs8i5czUPSfIenQVmgTpOGdJ
	5Esn5Cv7ZcbRCPGIYcSWpOK06pkOuIuEBnRVDNkg6pgekvl2qIQ6Npb5UjL2J3dUZpr0OPvs0uBVu
	u5GC0mx/7lLFj4f2bZSVBtIGe0hqsBI7G+HJJMaNjJ9n4TlrPNHY0UL0XxBEmWneBKKfZi2q7o94V
	1nzHiOswU5YP/jqh06kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuj5-00000004ZzV-2wmc;
	Tue, 24 Jun 2025 03:53:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuh2-00000004Zmi-0aON
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 03:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 054215C53EB;
	Tue, 24 Jun 2025 03:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E672CC4CEE3;
	Tue, 24 Jun 2025 03:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750737091;
	bh=5YOgXb/Dwiek//7GZAUxgO0HK7B7LjjEiNWSaEvKKaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ozg5cg32YQbHw3J87pX/+olpCf/Xqe1tc4fhxbbpIvR94d/9l9/jy1MhG/NnZTg2l
	 orrSi39Q5gJEBPNF3IjaTQr62yDDI5y3NAkYOXWvrqlnXFEvOJlbwNbZ2rkdIn7g4G
	 iZ/tMfKJV0CtCRsu5MJL2BkSjsALl8XG6LmolZQQfuwIqcVL2Ezwr221PT3jkE3Ndw
	 v77PxIhBhsnciM8iWpzIAp5wbEuKjcqqYdQPRIaMYRxHxKT46LI2Qk64AWig8+Bp4w
	 kW5VlUJ57iL2wpz+r3d9nfT46LbkAchZLwjOjljqeDwaAp/yAnJogNL8L5KI0qPhwN
	 JfKnvmtr/cc8Q==
Date: Mon, 23 Jun 2025 20:50:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	herbert@gondor.apana.org.au, paul.walmsley@sifive.com,
	alex@ghiti.fr, appro@cryptogams.org, zhang.lyra@gmail.com
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
Message-ID: <20250624035057.GD7127@sol>
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_205132_306821_580F3AA8 
X-CRM114-Status: GOOD (  28.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Zhihang,

On Wed, Jun 11, 2025 at 11:31:51AM +0800, Zhihang Shao wrote:
> From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
> 
> This is a straight import of the OpenSSL/CRYPTOGAMS Poly1305
> implementation for riscv authored by Andy Polyakov.
> The file 'poly1305-riscv.pl' is taken straight from this upstream
> GitHub repository [0] at commit 33fe84bc21219a16825459b37c825bf4580a0a7b,
> and this commit fixed a bug in riscv 64bit implementation.
> 
> [0] https://github.com/dot-asm/cryptogams
> 
> Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>

I wanted to let you know that I haven't forgotten about this.  However, the
kernel currently lacks a proper test for Poly1305, and Poly1305 has some edge
cases that are prone to bugs.  So I'd like to find some time to add a proper
Poly1305 test and properly review this.  Also, I'm in the middle of fixing how
the kernel's architecture-optimized crypto code is integrated; for example, I've
just moved arch/*/lib/crypto/ to lib/crypto/.

There will also need to be benchmark results that show that this code is
actually worthwhile, on both RV32 and RV64.  I am planning for the
poly1305_kunit test to have a benchmark built-in, after which it will be
straightforward to collect these.

(The "perlasm" file does have some benchmark results in a comment, but they do
not necessarily apply to the Poly1305 code in the kernel.)

So this isn't a perfect time to be adding a new Poly1305 implementation, as
we're not quite ready for it.  But I'd indeed like to take this eventually.

A few comments below:

> diff --git a/arch/riscv/lib/crypto/Makefile b/arch/riscv/lib/crypto/Makefile
> index b7cb877a2c07..93ddb62ef0f9 100644
> --- a/arch/riscv/lib/crypto/Makefile
> +++ b/arch/riscv/lib/crypto/Makefile
> @@ -3,5 +3,23 @@
>  obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
>  chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
>  
> +obj-$(CONFIG_CRYPTO_POLY1305_RISCV) += poly1305-riscv.o
> +poly1305-riscv-y := poly1305-core.o poly1305-glue.o
> +AFLAGS_poly1305-core.o += -Dpoly1305_init=poly1305_block_init_arch
> +AFLAGS_poly1305-core.o += -Dpoly1305_blocks=poly1305_blocks_arch
> +AFLAGS_poly1305-core.o += -Dpoly1305_emit=poly1305_emit_arch
> +
>  obj-$(CONFIG_CRYPTO_SHA256_RISCV64) += sha256-riscv64.o
>  sha256-riscv64-y := sha256.o sha256-riscv64-zvknha_or_zvknhb-zvkb.o
> +
> +ifeq ($(CONFIG_64BIT),y)
> +PERLASM_ARCH := 64
> +else
> +PERLASM_ARCH := void
> +endif
> +
> +quiet_cmd_perlasm = PERLASM $@
> +      cmd_perlasm = $(PERL) $(<) $(PERLASM_ARCH) $(@)
> +
> +$(obj)/%-core.S: $(src)/%-riscv.pl
> +	$(call cmd,perlasm)

Missing:

    clean-files += poly1305-core.S

> diff --git a/arch/riscv/lib/crypto/poly1305-glue.c b/arch/riscv/lib/crypto/poly1305-glue.c
> new file mode 100644
> index 000000000000..ddc73741faf5
> --- /dev/null
> +++ b/arch/riscv/lib/crypto/poly1305-glue.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * OpenSSL/Cryptogams accelerated Poly1305 transform for riscv
> + *
> + * Copyright (C) 2025 Institute of Software, CAS.
> + */
> +
> +#include <asm/hwcap.h>
> +#include <asm/simd.h>
> +#include <crypto/internal/poly1305.h>
> +#include <linux/cpufeature.h>
> +#include <linux/jump_label.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/unaligned.h>

Reduce the include list to:

#include <crypto/internal/poly1305.h>
#include <linux/export.h>
#include <linux/module.h>

> +.globl	poly1305_init
> +.type	poly1305_init,\@function
> +poly1305_init:
> +#ifdef	__riscv_zicfilp
> +	lpad	0
> +#endif

The 'lpad' instructions aren't present in the upstream CRYPTOGAMS source.

If they are necessary, this addition needs to be documented.

But they appear to be unnecessary.

> +#ifndef	__CHERI_PURE_CAPABILITY__
> +	andi	$tmp0,$inp,7		# $inp % 8
> +	andi	$inp,$inp,-8		# align $inp
> +	slli	$tmp0,$tmp0,3		# byte to bit offset
> +#endif
> +	ld	$in0,0($inp)
> +	ld	$in1,8($inp)
> +#ifndef	__CHERI_PURE_CAPABILITY__
> +	beqz	$tmp0,.Laligned_key
> +
> +	ld	$tmp2,16($inp)
> +	neg	$tmp1,$tmp0		# implicit &63 in sll
> +	srl	$in0,$in0,$tmp0
> +	sll	$tmp3,$in1,$tmp1
> +	srl	$in1,$in1,$tmp0
> +	sll	$tmp2,$tmp2,$tmp1
> +	or	$in0,$in0,$tmp3
> +	or	$in1,$in1,$tmp2
> +
> +.Laligned_key:

This code is going through a lot of trouble to work on RISC-V CPUs that don't
support efficient misaligned memory accesses.  That includes issuing loads of
memory outside the bounds of the given buffer, which is questionable (even if
it's guaranteed to not cross a page boundary).

Is there any chance we can just make the RISC-V Poly1305 code be conditional on
CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS=y?  Or do people not actually use that?

The rest of the kernel's RISC-V crypto code, which is based on the vector
extension, just assumes that efficient misaligned memory accesses are supported.

On a related topic, if this patch is accepted, the result will be inconsistent
optimization of ChaCha vs. Poly1305, which are usually paired:

    (1) ChaCha optimized with the RISC-V vector extension
    (2) Poly1305 optimized with RISC-V scalar instructions

Surely a RISC-V vector extension optimized Poly1305 is going to be needed too?

But with that being the case, will a RISC-V scalar optimized Poly1305 actually
be worthwhile to add too?  Especially without optimized ChaCha alongside it?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
