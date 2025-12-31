Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DEBE9410D
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 03:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nT6VqWVxSqbKA068Xi8Ep35JGQkzyEMK6DImeJceH8U=; b=RAAnwW+W3LAITf0JlJFO9ORWJp
	aLQADRIC/gPxmEJrZkC90ZIaxG/be2F6JOJoEMC7hfcJ492I1pVtTUb1YApQfQ5znz9iojysCHs+A
	ygggZDbyW2s3dCAqzOb2LhOMO3d7xm+YaUetSUnfomVK/s8nJOfSWPWcvnztV4jCr10F7t6CvdhNo
	vaj+vRxTr0yudq+slRynlyS5e9IfK+2S6qFdkh9qm5mgd2ARBUEhDDvXALj4VQ5uJMfMNQ9qjug/e
	9gU5Qa3S6bceILhNLA2D3RbMBQ/NZzxcUG4+7AHFCH37Ybal8uOO+6Mr7s/S2OOptB0LeliVTRejW
	YBwHvbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamgP-00000005dLn-2Rwt;
	Wed, 31 Dec 2025 03:15:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamgN-00000005dLe-3LLx
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 03:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD9CA60008;
	Wed, 31 Dec 2025 03:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB64C116B1;
	Wed, 31 Dec 2025 03:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767150930;
	bh=N6HFlgfL0VlBPAArfq2sVNpxf0YCgEJBIZpYYblK/AE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TgzO4umgcLGzUMcmIMv2OSGLrdbS7wevapcH78+Fa3HxlNbvuFoQeod1ZHOg7UlWP
	 uBFwmhaaFjaEjtRZflAUWUJl1Z86eogvqYnwdxj9LzWEseC1ujA/PkQa3WoWWRTdoS
	 Gp/m2NtIPK/ITnczhrq9kNDNNbODJ1EdNO9378zevAnU9xzsOj74JWGx3DYv5CkSDR
	 pK+u+7nbiD4njHRZOBWP09jEN8k4DDChJnNBVvBkhVwFe4JQHEVfU4ZB5t8pDohdRr
	 G58BrLp71Pj6UuJ+Ky1/PMmjOHSvdTo1sDEXXLRNZQeQc4EGTTfClsUeDQBbpPjBoN
	 7lvabxAopB55g==
Date: Tue, 30 Dec 2025 20:15:28 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Jiakai Xu <jiakaipeanut@gmail.com>
cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Nam Cao <namcao@linutronix.de>, 
    Alexandre Ghiti <alex@ghiti.fr>, Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: Re: [PATCH v2] riscv: fix KUnit test_kprobes crash when building
 with Clang
In-Reply-To: <20251226032317.1523764-1-jiakaiPeanut@gmail.com>
Message-ID: <5cad53b9-e6f7-d8c8-8c54-c4e5af035bbf@kernel.org>
References: <20251226032317.1523764-1-jiakaiPeanut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1674692257-1767150930=:293827"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1674692257-1767150930=:293827
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

Hi Jiakai Xu,

thanks for updating this patch -

On Fri, 26 Dec 2025, Jiakai Xu wrote:

> Clang misinterprets the placement of test_kprobes_addresses and 
> test_kprobes_functions arrays when they are not explicitly assigned 
> to a data section. This can lead to kmalloc_array() allocation 
> errors and KUnit failures.
> 
> When testing the Clang-compiled code in QEMU, this warning was emitted:
> 
> WARNING: CPU: 1 PID: 3000 at mm/page_alloc.c:5159 __alloc_frozen_pages_noprof+0xe6/0x2fc mm/page_alloc.c:5159
> 
> Further investigation revealed that the test_kprobes_addresses array
> appeared to have over 100,000 elements, including invalid addresses;
> whereas, according to test-kprobes-asm.S, test_kprobes_addresses
> should only have 25 elements.
> 
> When compiling the kernel with GCC, the kernel boots correctly.
> 
> This patch fixes the issue by adding .section .rodata to explicitly 
> place arrays in the read-only data segment.
> 
> For detailed debug and analysis, see:
> https://github.com/j1akai/temp/blob/main/20251113/readme.md
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> Link: https://patch.msgid.link/738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn
> Link: https://github.com/llvm/llvm-project/issues/168308
> 
> v1 -> v2：
> - Drop changes to .align, and .globl.

This should go below the --- line (or above the Signed-off-by:, Link: 
lines).  There shouldn't be anything between the Signed-off-by:, Link: 
trailers and the ---.

I've fixed this up locally, and queued for v6.19-rc.

> 
> ---
>  arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
> index b951d0f12482..f16deee9e091 100644
> --- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
> @@ -181,6 +181,7 @@ SYM_FUNC_END(test_kprobes_c_bnez)
>  
>  #endif /* CONFIG_RISCV_ISA_C */
>  
> +.section .rodata
>  SYM_DATA_START(test_kprobes_addresses)
>  	RISCV_PTR test_kprobes_add_addr1
>  	RISCV_PTR test_kprobes_add_addr2
> @@ -212,6 +213,7 @@ SYM_DATA_START(test_kprobes_addresses)
>  	RISCV_PTR 0
>  SYM_DATA_END(test_kprobes_addresses)
>  
> +.section .rodata
>  SYM_DATA_START(test_kprobes_functions)
>  	RISCV_PTR test_kprobes_add
>  	RISCV_PTR test_kprobes_jal
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
--8323329-1674692257-1767150930=:293827
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1674692257-1767150930=:293827--

