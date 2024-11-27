Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B01D6D233
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 20:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+QhJaVQ7DZaXjQUloWvMKPPdf4oncZ4u6lWzG/sVdE=; b=uG3PuIVJF1rFBr
	suJVuJ2Mf0irRqQXIbfTUcZHdo7VsAtdD6tgLQctSgGwmlFGxfzgyTN2dGfFpXZwBjpZze63W+ASY
	AdrMsqdl7s39/uLu8vlQDJ69Jrx1AzupV8PfmYuiZtemzb6RfEem7JTAszU1AsT17uvoZUP0Idbfs
	JvsDd63uGuFRTC+duqe/Ly1Rx1kZyKPnRwogS+GuzlUpC+x75dbXMTTj0TJZPQpv9cIwb1xBwB1vr
	R77A7yVEsN64AMLIWeBAVsM5F/JMlZkxZ3ptCd4Hl+x1dwfAj7rGOVJlmlPQmbY24OWspZmFvFqbQ
	l5JjM08vspq5+bmsZ7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGOJQ-0000000E0sq-17uD;
	Wed, 27 Nov 2024 20:07:00 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNMc-0000000DttU-2W00
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 19:06:15 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ea4d429e43so77191a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732734373; x=1733339173; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgXnDYjeious6Mn9ABnjIVdAyLz/oUf564mThG/grAY=;
        b=HAD8HYV9/6tx8rgbx0vv2b+JKk+aMdqHsMqROx2a/y2khRUV+52UuJdiEY/YEcG/Sl
         66wC6sQ0oTQ7BU492r3uoJPU7SJbzL/fIrPeSRRgPqbLGjxf47rVjZWw2kUPg3zUZBdq
         A+qzzEqi3a4pQHZDNRQOP+nRLRF/5YzGuQJPa6e4hHxBNhLnetZYXv6TRg3+JOvOOlH3
         VYY/q/DjUYfs7bVCvmD8RWqgNM0fb3qoEv7+vH0vjiGf0u7N+TiDRWHmumfaBt+RnWRT
         DoPrQwQRfWdcCVcZYr2sG6PTsF0IndSMpTldSmeuA1hHuP8d01qDdwDq3x+LIL/6DsAW
         6dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732734373; x=1733339173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgXnDYjeious6Mn9ABnjIVdAyLz/oUf564mThG/grAY=;
        b=P9vxw5EJ6pemFosX7zfPJB/sASB6Lo2DDzZPkV7h3gNwG8RiwT1qReElxe06xZJXb0
         +nitLY69cKB01uarP8vm9rOcsVAPlpZcQuVAYFme8yBWs/t5Hheh5n2OVS9a5F/Szyxu
         0tPpoqyBbQ0+3OXjNzv7hhtVnb+fZ4ZnWRxtVhPALeUIkAdcsbN2u2Zas9rHoADudz8D
         ORYNlGkSwkknmTa2L3HsJ/54+wsCfQe/5UnGl5MYh1aATEmJpMwjMDGWa1DkByMS8feX
         d03a92f5NGlrLoKRV49ai6KWEa+bxRXJFZNlv7+abeXe0k12KH9sugMmIX9dqOi12RZf
         mM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtbdR1BC2O3xzURZHEF0esgKcoa1IHuJTrLhLw8YPeFFanMRPAMyNM9nzwClRP1jwge7RmGJibz1Lqmg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6XG5jZrNoIzYs7gR3HnUD96g7hKz+XHFi+oG4mGk1XOx0fayJ
	5B9TyRZVWf8oZgkagUwCnvNLcxBpJVGo3/gXZMNXJCMA+iBnUlF5
X-Gm-Gg: ASbGncvb7iUPLzQvf3ta2bcXEgKFJHrsnwBt4PMLu8QeRcdCTsyqsN1Pzf9wBXlT/YG
	Mm92USjQ8UsGtH35mePktOC9NZx88i8TU8kdIyhVchwvAd2VXZh2ujtz6/bNh4xz4eWW2QFG7uP
	A5mo4pNDKkG2lXoss3gT5MQ5hhhZcc4P6Ic0s/0SdYkNVBbe6HTUbG2nJtLYGjrDNfQfgu732fk
	G+osbguSGM49TAbZeYBa5NJIEQH7amWBxwRGkiVAEhRjfyo3Q==
X-Google-Smtp-Source: AGHT+IEXoQP6bH9Kzyt4UUpfN2R0wNZnbQ/Gg5zUP2GZDnuGrLc0kFHcLCx0kZmRMXyA8zVMS069QQ==
X-Received: by 2002:a17:90b:1dc7:b0:2ea:853b:276d with SMTP id 98e67ed59e1d1-2ee08fca57fmr6226817a91.17.1732734372920;
        Wed, 27 Nov 2024 11:06:12 -0800 (PST)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee0fad03f2sm1936721a91.36.2024.11.27.11.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 11:06:12 -0800 (PST)
Date: Wed, 27 Nov 2024 11:06:10 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: Always inline bitops
Message-ID: <Z0dtohAlZqad841q@yury-ThinkPad>
References: <20241123-riscv-always-inline-bitops-v1-1-00e8262ab1cf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241123-riscv-always-inline-bitops-v1-1-00e8262ab1cf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_110614_638725_7AD2AFC6 
X-CRM114-Status: GOOD (  24.91  )
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

On Sat, Nov 23, 2024 at 07:30:19PM -0700, Nathan Chancellor wrote:
> When building allmodconfig + ThinLTO with certain versions of clang,
> arch_set_bit() may not be inlined, resulting in a modpost warning:
> 
>   WARNING: modpost: vmlinux: section mismatch in reference: arch_set_bit+0x58 (section: .text.arch_set_bit) -> numa_nodes_parsed (section: .init.data)
> 
> acpi_numa_rintc_affinity_init() calls arch_set_bit() via __node_set()
> with numa_nodes_parsed, which is marked as __initdata. If arch_set_bit()
> is not inlined, modpost will flag that it is being called with data that
> will be freed after init.
> 
> As acpi_numa_rintc_affinity_init() is marked as __init, there is not
> actually a functional issue here. However, the bitop functions should be
> marked as __always_inline, so that they work consistently for init and
> non-init code, which the comment in include/linux/nodemask.h alludes to.
> This matches s390 and x86's implementations.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied, thanks!

So we have generic, x86 and riscv bitops inlined, and powerpc and s390
non-inlined. We need to align them all, I think.

Thanks,
Yury

> ---
>  arch/riscv/include/asm/bitops.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index fae152ea0508d2e1ea490fffd645eab99cf387bf..c6bd3d8354a96b4e7bbef0e98a201da412301b57 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -228,7 +228,7 @@ static __always_inline int variable_fls(unsigned int x)
>   *
>   * This operation may be reordered on other architectures than x86.
>   */
> -static inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
> +static __always_inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
>  {
>  	return __test_and_op_bit(or, __NOP, nr, addr);
>  }
> @@ -240,7 +240,7 @@ static inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
>   *
>   * This operation can be reordered on other architectures other than x86.
>   */
> -static inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
> +static __always_inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
>  {
>  	return __test_and_op_bit(and, __NOT, nr, addr);
>  }
> @@ -253,7 +253,7 @@ static inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
>   * This operation is atomic and cannot be reordered.
>   * It also implies a memory barrier.
>   */
> -static inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
> +static __always_inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
>  {
>  	return __test_and_op_bit(xor, __NOP, nr, addr);
>  }
> @@ -270,7 +270,7 @@ static inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
>   * Note that @nr may be almost arbitrarily large; this function is not
>   * restricted to acting on a single-word quantity.
>   */
> -static inline void arch_set_bit(int nr, volatile unsigned long *addr)
> +static __always_inline void arch_set_bit(int nr, volatile unsigned long *addr)
>  {
>  	__op_bit(or, __NOP, nr, addr);
>  }
> @@ -284,7 +284,7 @@ static inline void arch_set_bit(int nr, volatile unsigned long *addr)
>   * on non x86 architectures, so if you are writing portable code,
>   * make sure not to rely on its reordering guarantees.
>   */
> -static inline void arch_clear_bit(int nr, volatile unsigned long *addr)
> +static __always_inline void arch_clear_bit(int nr, volatile unsigned long *addr)
>  {
>  	__op_bit(and, __NOT, nr, addr);
>  }
> @@ -298,7 +298,7 @@ static inline void arch_clear_bit(int nr, volatile unsigned long *addr)
>   * Note that @nr may be almost arbitrarily large; this function is not
>   * restricted to acting on a single-word quantity.
>   */
> -static inline void arch_change_bit(int nr, volatile unsigned long *addr)
> +static __always_inline void arch_change_bit(int nr, volatile unsigned long *addr)
>  {
>  	__op_bit(xor, __NOP, nr, addr);
>  }
> @@ -311,7 +311,7 @@ static inline void arch_change_bit(int nr, volatile unsigned long *addr)
>   * This operation is atomic and provides acquire barrier semantics.
>   * It can be used to implement bit locks.
>   */
> -static inline int arch_test_and_set_bit_lock(
> +static __always_inline int arch_test_and_set_bit_lock(
>  	unsigned long nr, volatile unsigned long *addr)
>  {
>  	return __test_and_op_bit_ord(or, __NOP, nr, addr, .aq);
> @@ -324,7 +324,7 @@ static inline int arch_test_and_set_bit_lock(
>   *
>   * This operation is atomic and provides release barrier semantics.
>   */
> -static inline void arch_clear_bit_unlock(
> +static __always_inline void arch_clear_bit_unlock(
>  	unsigned long nr, volatile unsigned long *addr)
>  {
>  	__op_bit_ord(and, __NOT, nr, addr, .rl);
> @@ -345,13 +345,13 @@ static inline void arch_clear_bit_unlock(
>   * non-atomic property here: it's a lot more instructions and we still have to
>   * provide release semantics anyway.
>   */
> -static inline void arch___clear_bit_unlock(
> +static __always_inline void arch___clear_bit_unlock(
>  	unsigned long nr, volatile unsigned long *addr)
>  {
>  	arch_clear_bit_unlock(nr, addr);
>  }
>  
> -static inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
> +static __always_inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
>  		volatile unsigned long *addr)
>  {
>  	unsigned long res;
> 
> ---
> base-commit: 0eb512779d642b21ced83778287a0f7a3ca8f2a1
> change-id: 20241123-riscv-always-inline-bitops-0021c4dae36b
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
