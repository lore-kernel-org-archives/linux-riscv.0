Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11148C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 11:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGQyvvwytVXAI+qyGp3+D11060/KGHfMw8kQ8W1W2lo=; b=lD2F+0bwg+acBA
	XANVClyz36RcRmO4JmfZjB0sKk9B+D1qAzS/7+YJlX3zy3yV717qDhCkKAZYZSqmP+gt/cFTE08L2
	42QKpXbUDtPmB0dVcC42Lv1k6PaHDC17VAnuKX6OY0WWqfpQWpz+ZxCajetTyChqm/bEf/rTEGRYW
	t9gU26sbozki+O/QEPisYfNBHo03VQMFzkeVNxOb1kYqcMmru7W6V4UeVRAe2HhvN9cv/gj76JbqM
	9ekcrJCs1Qi7YPcY7CpX4T2CbB6o+aXjygEELuFSf74YiXIJ4WB+7ArzEh7cxRpiHo1KulldwJA5m
	0DGs42G40DFZvopKd0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofJmx-005VKr-4h; Mon, 03 Oct 2022 11:39:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofJmu-005VJt-WE
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 11:39:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2460139F;
	Mon,  3 Oct 2022 04:39:12 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.80.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 285553F67D;
	Mon,  3 Oct 2022 04:39:02 -0700 (PDT)
Date: Mon, 3 Oct 2022 12:38:59 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	zouyipeng@huawei.com, bigeasy@linutronix.de,
	David.Laight@aculab.com, chenzhongjin@huawei.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Borislav Petkov <bp@alien8.de>, Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH V6 04/11] compiler_types.h: Add __noinstr_section() for
 noinstr
Message-ID: <YzrJ0wQxWfjWCxhQ@FVFF77S0Q05N>
References: <20221002012451.2351127-1-guoren@kernel.org>
 <20221002012451.2351127-5-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221002012451.2351127-5-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_043909_090746_E4919DF9 
X-CRM114-Status: GOOD (  15.11  )
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

On Sat, Oct 01, 2022 at 09:24:44PM -0400, guoren@kernel.org wrote:
> From: Lai Jiangshan <laijs@linux.alibaba.com>
> 
> And it will be extended for C entry code.
> 
> Cc: Borislav Petkov <bp@alien8.de>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
> ---
>  include/linux/compiler_types.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index 4f2a819fd60a..e9ce11ea4d8b 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -227,9 +227,11 @@ struct ftrace_likely_data {
>  #endif
>  
>  /* Section for code which can't be instrumented at all */
> -#define noinstr								\
> -	noinline notrace __attribute((__section__(".noinstr.text")))	\
> -	__no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
> +#define __noinstr_section(section)				\
> +	noinline notrace __section(section) __no_profile	\
> +	__no_kcsan __no_sanitize_address __no_sanitize_coverage
> +
> +#define noinstr __noinstr_section(".noinstr.text")

One thing proably worth noting here is that while KPROBES will avoid
instrumenting `.noinstr.text`, that won't happen automatically for other
__noinstr_section() sections, and that will need to be inhibited through other
means (e.g. the kprobes blacklist, explicit NOKPROBE_SYMBOL() annotation, or
otherwise).

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
