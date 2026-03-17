Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0220CFB5EA9
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 03:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vE1EpFEXsl1sthMnaGMOvt74WIvEbHzLnnpDV3Xq4Rk=; b=32JO8WK4IjhXeT
	hGPLNHgXTsXC3tmMJ5J8z6Q8Jbjf6yEDw4ttMMJPkNbFEBRmUZ1yqMCOd7b0Zzj9avpzTO5+WIJoG
	HnW/wRCU/qGlArKDDm/wUGA9j5NElmggR7hY92Qd+e9wvy5ufd9iHcvTipid+RKdsA4j+KAEMZpiI
	HVnuPPTqlnJgh0MH0QAiOLxCYSUJ42hqNHk9isKiBrP+Mw1+ynga7ZfeC42HKpO1KFDuGO2eG0p6S
	6hpoQuxItgUwmbESjJFAcFySgI6bCrENJr4uIqGXnO9uqAZwCdkwM8qC7BY59fQcc4BKUjEi7dVGc
	wN33nBhG4kgpda34KKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Klb-00000005HQC-09Gg;
	Tue, 17 Mar 2026 03:06:47 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2KlY-00000005HPW-0wKR
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 03:06:45 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-40946982a78so2029745fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 20:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773716803; x=1774321603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pIA5bzRUo/kqjvuSbXtkhZ0/jdS0vsz2MPNHxmrgJFE=;
        b=O+ONBUeC2Ydk2uIeTn7HSjsKWlkyQuIfbHTTeOYaTKtbfuwpOe5l0i+5rV1trR0no7
         2WtF7D4fVFhB/ehzkd4vpEe4+KrGEDooqDzVhtwNvjlDNDBX37TS3/pK2k6JlG6Lk/NP
         oIG1Owfu/CadNA6869Cw2fE52RoFVZXv4E3dvfoZ550uJTtSvsijamzt4Ql15Q0fRy/F
         BS5qSI7Ecw13iF165u0AxOQyX3x6bUlxVrV0pGOgWdIfp3oXSzqZ+SnJ2Xe5pZC8ZHMV
         O5z72x1yyp1tpzl5dGyqKAou7nU9YXL2KBR/zncTzBRRC955GUOQEB312GSn9FviRCFO
         l5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773716803; x=1774321603;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIA5bzRUo/kqjvuSbXtkhZ0/jdS0vsz2MPNHxmrgJFE=;
        b=BsdD+jM4k1sUDQ1FYC0BtrE3ZIL72v8tw8EXqwf0YWunCgTzTcnVT0sWv7rl8+Mvcp
         Y8iX1t/6fBhqT5aSkvG3XLle1rlSZpCR/AJ0TblYfrX8kSAi/8UsRha3tOfu2qbSwTIf
         YtNNiA6ohS2S6B6J51WPEoA0HltUKlOQZOLc4MJDbahY8GTg+byb9gKclAhUF9BfkSC6
         3QlcWLFSLFKAQx90HfcmNBlBovNyPaxCLhdz7KkKEsWOGrmvzaj0dYkcU8U5pPXDiSB1
         EBlzQYrRAkFdWigZWq6wgSYFdWNbr37/2QkpqFfFUktKOoyP6mF1MwhOv3+zGU4xXIM7
         iusA==
X-Forwarded-Encrypted: i=1; AJvYcCX+S398DeiknARIwioOZAj4KJv46XH9NEcno/Krjw44+MXTlyn4Kt24PEk21wQVWzaDb7z3HRnaPv10xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMLLnb+ejZYVA9Qn4Rv0O/jTpMNUpUS2oHps+PIalNdu5D0T6g
	bAQwP6LPX1gV7cyv6IB7ZMzxGQ16E4XC5m+sqVac6LN7J1YCfVruq5H7RbrwFazRj/k=
X-Gm-Gg: ATEYQzyqUI9l6cmInKZ39E9ENgJnz0yBH6SzxtFM3JQa9zdRCdHm9kZJj3HiuBoWRU1
	a7ExKxxnGQwfp3YamtZtf68AoXTLfzhETRfIZ2Ob9gCEtoxwCi+Gs2Rr5SdEN7hGtgGDwX9kOXn
	6hQj9PPrjnr5indMXIxxqqhvOz50CMnzrMmbv5G1UHvajTzS1ctUrxY2bZ1RIafuH7ne3RdZk67
	RrOnuyW7A9XMGXlO9L9zvO1K189Lfia9s1e1ej01aiwZoGQzO7ilri9QCWPeCte4NqZGfqKtS0c
	RrJhWw72GniIeyoAeFvs9NFQoe1rYn7ppPwnyEcwdNwFkY8NoY+NPyeXwziTPuY0gjhgC0yqf8S
	hJyGSxkWCe41KQ7iqiu0ak5NtMISdm+cOiZ+VqdwqNBmJn0cnyBg6QxtqZpJ1s3UP4y0PslCRfB
	2EzYJOFp6x58/CNVjR7FHqjjSvY4R4Y6wVC31B8biw
X-Received: by 2002:a05:6870:c154:b0:40e:a338:c8a1 with SMTP id 586e51a60fabf-417b9072c62mr8995239fac.11.1773716802857;
        Mon, 16 Mar 2026 20:06:42 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e1f9f86sm18099947fac.2.2026.03.16.20.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 20:06:42 -0700 (PDT)
Message-ID: <f25ed5b8-e785-414a-b13e-85c1a787665d@sifive.com>
Date: Mon, 16 Mar 2026 22:06:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 7/7] futex: Use runtime constants for
 __futex_hash() hot path
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
 "H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Charles Mirabile <cmirabil@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
References: <20260316052401.18910-1-kprateek.nayak@amd.com>
 <20260316052401.18910-8-kprateek.nayak@amd.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260316052401.18910-8-kprateek.nayak@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_200644_316038_85323A9F 
X-CRM114-Status: GOOD (  23.23  )
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

Hi Prateek,

On 2026-03-16 12:24 AM, K Prateek Nayak wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> Runtime constify the read-only after init data  __futex_shift(shift_32),
> __futex_mask(mask_32), and __futex_queues(ptr) used in __futex_hash()
> hot path to avoid referencing global variable.
> 
> This also allows __futex_queues to be allocated dynamically to
> "nr_node_ids" slots instead of reserving config dependent MAX_NUMNODES
> (1 << CONFIG_NODES_SHIFT) worth of slots upfront.
> 
> No functional chages intended.
> 
>   [ prateek: Dynamically allocate __futex_queues, mark the global data
>     __ro_after_init since they are constified after futex_init(). ]
> 
> Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de> # MAX_NUMNODES bloat
> Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>  include/asm-generic/vmlinux.lds.h |  5 +++-
>  kernel/futex/core.c               | 42 +++++++++++++++++--------------
>  2 files changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 1e1580febe4b..86f99fa6ae24 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -975,7 +975,10 @@
>  		RUNTIME_CONST(shift, d_hash_shift)			\
>  		RUNTIME_CONST(ptr, dentry_hashtable)			\
>  		RUNTIME_CONST(ptr, __dentry_cache)			\
> -		RUNTIME_CONST(ptr, __names_cache)
> +		RUNTIME_CONST(ptr, __names_cache)			\
> +		RUNTIME_CONST(shift, __futex_shift)			\
> +		RUNTIME_CONST(mask,  __futex_mask)			\
> +		RUNTIME_CONST(ptr,   __futex_queues)
>  
>  /* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
>  #define KUNIT_TABLE()							\
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index cf7e610eac42..6b5c5a1596a5 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -45,23 +45,19 @@
>  #include <linux/mempolicy.h>
>  #include <linux/mmap_lock.h>
>  
> +#include <asm/runtime-const.h>
> +
>  #include "futex.h"
>  #include "../locking/rtmutex_common.h"
>  
> -/*
> - * The base of the bucket array and its size are always used together
> - * (after initialization only in futex_hash()), so ensure that they
> - * reside in the same cacheline.
> - */
> -static struct {
> -	unsigned long            hashmask;
> -	unsigned int		 hashshift;
> -	struct futex_hash_bucket *queues[MAX_NUMNODES];
> -} __futex_data __read_mostly __aligned(2*sizeof(long));
> +static u32 __futex_mask __ro_after_init;
> +static u32 __futex_shift __ro_after_init;
> +static struct futex_hash_bucket **__futex_queues __ro_after_init;
>  
> -#define futex_hashmask	(__futex_data.hashmask)
> -#define futex_hashshift	(__futex_data.hashshift)
> -#define futex_queues	(__futex_data.queues)
> +static __always_inline struct futex_hash_bucket **futex_queues(void)
> +{
> +	return runtime_const_ptr(__futex_queues);
> +}
>  
>  struct futex_private_hash {
>  	int		state;
> @@ -439,14 +435,14 @@ __futex_hash(union futex_key *key, struct futex_private_hash *fph)
>  		 * NOTE: this isn't perfectly uniform, but it is fast and
>  		 * handles sparse node masks.
>  		 */
> -		node = (hash >> futex_hashshift) % nr_node_ids;
> +		node = runtime_const_shift_right_32(hash, __futex_shift) % nr_node_ids;
>  		if (!node_possible(node)) {
>  			node = find_next_bit_wrap(node_possible_map.bits,
>  						  nr_node_ids, node);
>  		}
>  	}
>  
> -	return &futex_queues[node][hash & futex_hashmask];
> +	return &futex_queues()[node][runtime_const_mask_32(hash, __futex_mask)];
>  }
>  
>  /**
> @@ -1913,7 +1909,7 @@ int futex_hash_allocate_default(void)
>  	 *   16 <= threads * 4 <= global hash size
>  	 */
>  	buckets = roundup_pow_of_two(4 * threads);
> -	buckets = clamp(buckets, 16, futex_hashmask + 1);
> +	buckets = clamp(buckets, 16, __futex_mask + 1);
>  
>  	if (current_buckets >= buckets)
>  		return 0;
> @@ -1983,10 +1979,19 @@ static int __init futex_init(void)
>  	hashsize = max(4, hashsize);
>  	hashsize = roundup_pow_of_two(hashsize);
>  #endif
> -	futex_hashshift = ilog2(hashsize);
> +	__futex_mask = hashsize - 1;
> +	__futex_shift = ilog2(hashsize);

__futex_mask is always a power of two minus 1, in other words all low bits set.
Would it be worth using an n-bit zero extension operation instead of an
arbitrary 32-bit mask? This would use fewer instructions on some architectures:
for example a single ubfx on arm64 and slli+srli on riscv.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
