Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5143C52D70
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 05:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8laIIi7wpaaLYmH/l5FaO+hVmBvvQuGlslwuhxt9iI=; b=T1/QsKyfubPKne
	N2Hr94pBWuJJP3biJ0GWNnWwrygTRTwRRu5MHiZQPaCcWG6Pu5hHTXNMBXdDWxX4Cr4Nh17q2F5x0
	irnYfTSdCIB6I+O156X77bAlX0iQo2p9JG5zoWjsgqaYfF4Jpd/g+4G6wtdqx2QXZq8dfZjA0mI9Y
	3SqUuTVlLuDNKAisOux50spkDpfUHFhFWfhItEvOXoUyL9RaQUQXgIVJau4dq+Hy+Xvs60t9LSxvN
	QSk0XoJWv7RLnOYVfHgVTIerFK2ynbRSfO+Bd/QbdsoA3BreZOoBIAiZezj/gvAx9HoI1WkD5w0eq
	AOjP5O/FpivCbfumwceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZl6s-00000007jAd-3WRb;
	Fri, 02 Aug 2024 05:45:50 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZl6n-00000007jA1-3EMj
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 05:45:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED941C0002;
	Fri,  2 Aug 2024 05:45:38 +0000 (UTC)
Message-ID: <16be871d-a52e-4b1d-b579-71ec03a0c81d@ghiti.fr>
Date: Fri, 2 Aug 2024 07:45:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: support KASAN instrumentation of bitops
Content-Language: en-US
To: Qingfang Deng <dqfext@gmail.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Qingfang Deng <qingfang.deng@siflower.com.cn>
References: <20240802040506.712-1-dqfext@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240802040506.712-1-dqfext@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_224546_149645_0D9BD0AC 
X-CRM114-Status: GOOD (  29.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Qingfang,

On 02/08/2024 06:05, Qingfang Deng wrote:
> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
>
> The arch-specific bitops are not being picked up by the KASAN test
> suite.
>
> Instrumentation is done via the bitops/instrumented-{atomic,lock}.h
> headers. They require that arch-specific versions of bitop functions
> are renamed to arch_*. Do this renaming.
>
> As most comments are identical to the ones in the instrumented headers,
> remove them.
>
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> ---
>   arch/riscv/include/asm/bitops.h | 100 +++++---------------------------
>   1 file changed, 15 insertions(+), 85 deletions(-)
>
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index 71af9ecfcfcb..44ff3114c112 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -221,134 +221,62 @@ static __always_inline int variable_fls(unsigned int x)
>   #define __NOP(x)	(x)
>   #define __NOT(x)	(~(x))
>   
> -/**
> - * test_and_set_bit - Set a bit and return its old value
> - * @nr: Bit to set
> - * @addr: Address to count from
> - *
> - * This operation may be reordered on other architectures than x86.
> - */
> -static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
> +static inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
>   {
>   	return __test_and_op_bit(or, __NOP, nr, addr);
>   }
>   
> -/**
> - * test_and_clear_bit - Clear a bit and return its old value
> - * @nr: Bit to clear
> - * @addr: Address to count from
> - *
> - * This operation can be reordered on other architectures other than x86.
> - */
> -static inline int test_and_clear_bit(int nr, volatile unsigned long *addr)
> +static inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
>   {
>   	return __test_and_op_bit(and, __NOT, nr, addr);
>   }
>   
> -/**
> - * test_and_change_bit - Change a bit and return its old value
> - * @nr: Bit to change
> - * @addr: Address to count from
> - *
> - * This operation is atomic and cannot be reordered.
> - * It also implies a memory barrier.
> - */
> -static inline int test_and_change_bit(int nr, volatile unsigned long *addr)
> +static inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
>   {
>   	return __test_and_op_bit(xor, __NOP, nr, addr);
>   }
>   
> -/**
> - * set_bit - Atomically set a bit in memory
> - * @nr: the bit to set
> - * @addr: the address to start counting from
> - *
> - * Note: there are no guarantees that this function will not be reordered
> - * on non x86 architectures, so if you are writing portable code,
> - * make sure not to rely on its reordering guarantees.
> - *
> - * Note that @nr may be almost arbitrarily large; this function is not
> - * restricted to acting on a single-word quantity.
> - */
> -static inline void set_bit(int nr, volatile unsigned long *addr)
> +static inline void arch_set_bit(int nr, volatile unsigned long *addr)
>   {
>   	__op_bit(or, __NOP, nr, addr);
>   }
>   
> -/**
> - * clear_bit - Clears a bit in memory
> - * @nr: Bit to clear
> - * @addr: Address to start counting from
> - *
> - * Note: there are no guarantees that this function will not be reordered
> - * on non x86 architectures, so if you are writing portable code,
> - * make sure not to rely on its reordering guarantees.
> - */
> -static inline void clear_bit(int nr, volatile unsigned long *addr)
> +static inline void arch_clear_bit(int nr, volatile unsigned long *addr)
>   {
>   	__op_bit(and, __NOT, nr, addr);
>   }
>   
> -/**
> - * change_bit - Toggle a bit in memory
> - * @nr: Bit to change
> - * @addr: Address to start counting from
> - *
> - * change_bit()  may be reordered on other architectures than x86.
> - * Note that @nr may be almost arbitrarily large; this function is not
> - * restricted to acting on a single-word quantity.
> - */
> -static inline void change_bit(int nr, volatile unsigned long *addr)
> +static inline void arch_change_bit(int nr, volatile unsigned long *addr)
>   {
>   	__op_bit(xor, __NOP, nr, addr);
>   }
>   
> -/**
> - * test_and_set_bit_lock - Set a bit and return its old value, for lock
> - * @nr: Bit to set
> - * @addr: Address to count from
> - *
> - * This operation is atomic and provides acquire barrier semantics.
> - * It can be used to implement bit locks.
> - */
> -static inline int test_and_set_bit_lock(
> +static inline int arch_test_and_set_bit_lock(
>   	unsigned long nr, volatile unsigned long *addr)
>   {
>   	return __test_and_op_bit_ord(or, __NOP, nr, addr, .aq);
>   }
>   
> -/**
> - * clear_bit_unlock - Clear a bit in memory, for unlock
> - * @nr: the bit to set
> - * @addr: the address to start counting from
> - *
> - * This operation is atomic and provides release barrier semantics.
> - */
> -static inline void clear_bit_unlock(
> +static inline void arch_clear_bit_unlock(
>   	unsigned long nr, volatile unsigned long *addr)
>   {
>   	__op_bit_ord(and, __NOT, nr, addr, .rl);
>   }
>   
>   /**
> - * __clear_bit_unlock - Clear a bit in memory, for unlock
> - * @nr: the bit to set
> - * @addr: the address to start counting from
> + * arch___clear_bit_unlock - Clear a bit in memory, for unlock
>    *
> - * This operation is like clear_bit_unlock, however it is not atomic.
> - * It does provide release barrier semantics so it can be used to unlock
> - * a bit lock, however it would only be used if no other CPU can modify
> - * any bits in the memory until the lock is released (a good example is
> - * if the bit lock itself protects access to the other bits in the word).
> + * This should not be used directly, use the instrumented __clear_bit_unlock
> + * instead. See asm-generic/bitops/instrumented-lock.h
>    *
>    * On RISC-V systems there seems to be no benefit to taking advantage of the
>    * non-atomic property here: it's a lot more instructions and we still have to
>    * provide release semantics anyway.
>    */
> -static inline void __clear_bit_unlock(
> +static inline void arch___clear_bit_unlock(
>   	unsigned long nr, volatile unsigned long *addr)
>   {
> -	clear_bit_unlock(nr, addr);
> +	arch_clear_bit_unlock(nr, addr);
>   }
>   
>   static inline bool xor_unlock_is_negative_byte(unsigned long mask,
> @@ -369,6 +297,8 @@ static inline bool xor_unlock_is_negative_byte(unsigned long mask,
>   #undef __NOT
>   #undef __AMO
>   
> +#include <asm-generic/bitops/instrumented-atomic.h>
> +#include <asm-generic/bitops/instrumented-lock.h>
>   #include <asm-generic/bitops/non-atomic.h>
>   #include <asm-generic/bitops/le.h>
>   #include <asm-generic/bitops/ext2-atomic.h>


Samuel has just posted a similar patch here 
https://lore.kernel.org/linux-riscv/20240801033725.28816-1-samuel.holland@sifive.com/T/#t

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
