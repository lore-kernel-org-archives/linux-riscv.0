Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982AEC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xufi01qsxPSYJICmQ5Ds9Y4Np0Zk7FofMcpTWiqvChs=; b=FxzVHMN9JSIxQd
	9ALg4X7/N7pFBhFWYSK38ickF0X5N5YLIcsQt4fRbXspwdKv/kyaecUo9GCuV+eOTA5d4xuAIbjrh
	cknqLIYRh5DiOIjbOqQ9VyYZ7Bdpt7cuE6G6eH866PIL8Y7Kac0nwzke66SzRXhcV0pyfX3zr1Phn
	EjiRLt4CQ/JQ5vcb6vc1mSjIwBLgFMy6Pg4R880fMLPyln/F9sigMIepjLZCqdjBvxaBF3YoP3+/t
	6eunyQM+h9lKTcrE7drkeOBfmI3bpCwSA8wyt+5y40wGuCKOnXkFOlRntodfqeZPvwkYZGodkUGJK
	KjcqyC7HOXRIg711tfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZT6K-00000004lBf-1N8A;
	Thu, 01 Aug 2024 10:32:04 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZT6G-00000004lAs-2CNF
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 10:32:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B9C760003;
	Thu,  1 Aug 2024 10:31:56 +0000 (UTC)
Message-ID: <0473d5ad-1d52-43e0-ade6-34c94212a220@ghiti.fr>
Date: Thu, 1 Aug 2024 12:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: Enable bitops instrumentation
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org
References: <20240801033725.28816-1-samuel.holland@sifive.com>
 <20240801033725.28816-3-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240801033725.28816-3-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_033200_865387_519F1029 
X-CRM114-Status: GOOD (  19.28  )
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


On 01/08/2024 05:37, Samuel Holland wrote:
> Instead of implementing the bitops functions directly in assembly,
> provide the arch_-prefixed versions and use the wrappers from
> asm-generic to add instrumentation. This improves KASAN coverage and
> fixes the kasan_bitops_generic() unit test.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>   arch/riscv/include/asm/bitops.h | 43 ++++++++++++++++++---------------
>   1 file changed, 23 insertions(+), 20 deletions(-)
>
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index 71af9ecfcfcb..fae152ea0508 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -222,44 +222,44 @@ static __always_inline int variable_fls(unsigned int x)
>   #define __NOT(x)	(~(x))
>   
>   /**
> - * test_and_set_bit - Set a bit and return its old value
> + * arch_test_and_set_bit - Set a bit and return its old value
>    * @nr: Bit to set
>    * @addr: Address to count from
>    *
>    * This operation may be reordered on other architectures than x86.
>    */
> -static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
> +static inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
>   {
>   	return __test_and_op_bit(or, __NOP, nr, addr);
>   }
>   
>   /**
> - * test_and_clear_bit - Clear a bit and return its old value
> + * arch_test_and_clear_bit - Clear a bit and return its old value
>    * @nr: Bit to clear
>    * @addr: Address to count from
>    *
>    * This operation can be reordered on other architectures other than x86.
>    */
> -static inline int test_and_clear_bit(int nr, volatile unsigned long *addr)
> +static inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
>   {
>   	return __test_and_op_bit(and, __NOT, nr, addr);
>   }
>   
>   /**
> - * test_and_change_bit - Change a bit and return its old value
> + * arch_test_and_change_bit - Change a bit and return its old value
>    * @nr: Bit to change
>    * @addr: Address to count from
>    *
>    * This operation is atomic and cannot be reordered.
>    * It also implies a memory barrier.
>    */
> -static inline int test_and_change_bit(int nr, volatile unsigned long *addr)
> +static inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
>   {
>   	return __test_and_op_bit(xor, __NOP, nr, addr);
>   }
>   
>   /**
> - * set_bit - Atomically set a bit in memory
> + * arch_set_bit - Atomically set a bit in memory
>    * @nr: the bit to set
>    * @addr: the address to start counting from
>    *
> @@ -270,13 +270,13 @@ static inline int test_and_change_bit(int nr, volatile unsigned long *addr)
>    * Note that @nr may be almost arbitrarily large; this function is not
>    * restricted to acting on a single-word quantity.
>    */
> -static inline void set_bit(int nr, volatile unsigned long *addr)
> +static inline void arch_set_bit(int nr, volatile unsigned long *addr)
>   {
>   	__op_bit(or, __NOP, nr, addr);
>   }
>   
>   /**
> - * clear_bit - Clears a bit in memory
> + * arch_clear_bit - Clears a bit in memory
>    * @nr: Bit to clear
>    * @addr: Address to start counting from
>    *
> @@ -284,13 +284,13 @@ static inline void set_bit(int nr, volatile unsigned long *addr)
>    * on non x86 architectures, so if you are writing portable code,
>    * make sure not to rely on its reordering guarantees.
>    */
> -static inline void clear_bit(int nr, volatile unsigned long *addr)
> +static inline void arch_clear_bit(int nr, volatile unsigned long *addr)
>   {
>   	__op_bit(and, __NOT, nr, addr);
>   }
>   
>   /**
> - * change_bit - Toggle a bit in memory
> + * arch_change_bit - Toggle a bit in memory
>    * @nr: Bit to change
>    * @addr: Address to start counting from
>    *
> @@ -298,40 +298,40 @@ static inline void clear_bit(int nr, volatile unsigned long *addr)
>    * Note that @nr may be almost arbitrarily large; this function is not
>    * restricted to acting on a single-word quantity.
>    */
> -static inline void change_bit(int nr, volatile unsigned long *addr)
> +static inline void arch_change_bit(int nr, volatile unsigned long *addr)
>   {
>   	__op_bit(xor, __NOP, nr, addr);
>   }
>   
>   /**
> - * test_and_set_bit_lock - Set a bit and return its old value, for lock
> + * arch_test_and_set_bit_lock - Set a bit and return its old value, for lock
>    * @nr: Bit to set
>    * @addr: Address to count from
>    *
>    * This operation is atomic and provides acquire barrier semantics.
>    * It can be used to implement bit locks.
>    */
> -static inline int test_and_set_bit_lock(
> +static inline int arch_test_and_set_bit_lock(
>   	unsigned long nr, volatile unsigned long *addr)
>   {
>   	return __test_and_op_bit_ord(or, __NOP, nr, addr, .aq);
>   }
>   
>   /**
> - * clear_bit_unlock - Clear a bit in memory, for unlock
> + * arch_clear_bit_unlock - Clear a bit in memory, for unlock
>    * @nr: the bit to set
>    * @addr: the address to start counting from
>    *
>    * This operation is atomic and provides release barrier semantics.
>    */
> -static inline void clear_bit_unlock(
> +static inline void arch_clear_bit_unlock(
>   	unsigned long nr, volatile unsigned long *addr)
>   {
>   	__op_bit_ord(and, __NOT, nr, addr, .rl);
>   }
>   
>   /**
> - * __clear_bit_unlock - Clear a bit in memory, for unlock
> + * arch___clear_bit_unlock - Clear a bit in memory, for unlock
>    * @nr: the bit to set
>    * @addr: the address to start counting from
>    *


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


> @@ -345,13 +345,13 @@ static inline void clear_bit_unlock(
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
> -static inline bool xor_unlock_is_negative_byte(unsigned long mask,
> +static inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
>   		volatile unsigned long *addr)
>   {
>   	unsigned long res;
> @@ -369,6 +369,9 @@ static inline bool xor_unlock_is_negative_byte(unsigned long mask,
>   #undef __NOT
>   #undef __AMO
>   
> +#include <asm-generic/bitops/instrumented-atomic.h>
> +#include <asm-generic/bitops/instrumented-lock.h>
> +
>   #include <asm-generic/bitops/non-atomic.h>
>   #include <asm-generic/bitops/le.h>
>   #include <asm-generic/bitops/ext2-atomic.h>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
