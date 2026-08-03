Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33A5C55182
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 16:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9dpQGNkqjaFb9njB59ogMLXlljZexZq0mCU9kqPGak=; b=4c0moVnb03H+xh
	ZKWDiXwzh1EQWjfTMr5buQEbjyF1iZYRmtBSPeOLzKm/mwRUECSLgcDXEyt7bsJKllyNCh7BhBP03
	9DLLnXlZlZ2TL8abLqVP4fClTsfWFd7EgGSli2xolCM3NpF+3K30smrxL2NwNY1r4zYwzp58Z/dvG
	7tYvcCrRputQZS/hswocKunsUUMyAxoNw+7o3TPZjCWyEZqxFVTMhmc1bmyHSEuDDh/9VjOXAkp2A
	tWOKzSOHNVX/+46NMPvWd8x5zKK3KBjTxCExrWQhkCXXNhr7Ae6NDMxB5wPnr30q7ip/9lygDCIN2
	Es+9fz97uJ85QD8/CPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGr-000000002YB-3HKG;
	Mon, 03 Aug 2026 16:12:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGq-000000002We-1Yv1
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 16:12:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D5A7403F3;
	Mon,  3 Aug 2026 16:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3148B1F000E9;
	Mon,  3 Aug 2026 16:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785773528;
	bh=e8JjNFL20nK9ji7G+GFiWaZM19p7Ewn1gMcxZGafd4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e267Y0OKMKk92xRbHSsHlgL6L+nakgtvHjuXJ+K6mbBMupxxsxdK/IxMhoX838hzM
	 ZhZrAbrmpOydKUpSxCyJexD1Yx9zJoDca1Dvk2wKwbkEFQQy12J7bj4DjzHImFNysQ
	 CfDIQVnEsUcN9V1qV0dTtv5orR/Z1WiQnDxf2QgcMV4WkAe8C9j/14UqUdbaagZJ48
	 DEPqO+16kXCoVQaUD9Ue/1/bYAIPnHd3pzZFwNW9EF1zmPB/BtMN8BIWfwS30nkRTd
	 D6CCWcaWV0fN6up3WrLfz9yAzTMKgjsBfgNfZ3/yhQkMHkjHCkBawUnBcvsfG3K006
	 +asmdi0pXkvjw==
Date: Mon, 3 Aug 2026 09:12:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <i@maskray.me>
Cc: Peter Zijlstra <peterz@infradead.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv/runtime-const: Disable linker relaxation for
 RUNTIME_MAGIC
Message-ID: <20260803161203.GA953175@ax162>
References: <20260802174342.597092-1-i@maskray.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260802174342.597092-1-i@maskray.me>
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

On Sun, Aug 02, 2026 at 10:43:42AM -0700, Fangrui Song wrote:
> Commit ee10b1028129 ("riscv/runtime-const: Replace open-coded
> placeholder with RUNTIME_MAGIC") switched the lui + addi[w] placeholder
> from hand-encoded immediates to %hi()/%lo() of RUNTIME_MAGIC.
> 
> GNU Assembler folds %hi()/%lo() of an absolute expression at assembly
> time. LLVM's integrated assembler since 21.1 defers it to the linker
> instead, which range checks it: on riscv64 R_RISCV_HI20 must fit a
> signed 20-bit field, and RUNTIME_MAGIC (0x89ABCDEF) is a positive 64-bit
> value rather than a sign-extended 32-bit one, so it does not:
> 
>     ld.lld: error: relocation R_RISCV_HI20 out of range: 563901 is not in
>     [-524288, 524287]
> 
> The sequence is patched at runtime and its instruction offsets are
> recorded via ".long 1b - .", so the linker must not touch it in the
> first place. Add ".option norelax", as is already done for
> ALTERNATIVE() and static keys; the integrated assembler then resolves
> %hi()/%lo() itself and emits no relocation, restoring the exact
> encoding the open-coded placeholder produced.
> 
> Fixes: ee10b1028129 ("riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2179
> Signed-off-by: Fangrui Song <i@maskray.me>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks a lot for the quick fix!

> ---
> Applies to tip/locking/core; the RISC-V tree (riscv/linux.git) does not
> carry ee10b1028129.
> 
>  arch/riscv/include/asm/runtime-const.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index a472ebbf0971..ce2008bb5227 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -23,6 +23,7 @@
>  	typeof(sym) __ret;						\
>  	asm_inline(".option push\n\t"					\
>  		".option norvc\n\t"					\
> +		".option norelax\n\t"					\
>  		"1:\t"							\
>  		"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
>  		"addi	%[__ret],%[__ret], %%lo(" RUNTIME_MAGIC ")\n\t"	\
> @@ -47,6 +48,7 @@
>  #define RISCV_RUNTIME_CONST_64_PREAMBLE				\
>  	".option push\n\t"					\
>  	".option norvc\n\t"					\
> +	".option norelax\n\t"					\
>  	"1:\t"							\
>  	"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
>  	"lui	%[__tmp], %%hi(" RUNTIME_MAGIC ")\n\t"		\
> 
> base-commit: 5e601ab3615c86be7c4068ce992f94654693a032
> -- 
> 2.43.0
> 
> 

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
