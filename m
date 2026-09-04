Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998BCC61DD6
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 12:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2lfLiPMgwg3/e0k5fXjYMP9d31aT3qSLQ0xmoIftBA=; b=CRBoGKrH71VJJZ
	890oBXYXzueOVqL4A5lJ6nSy7Hus5JDxQZA2OFzmzzwEcPdjOsnRY1Ue5UiJyt5a7AxYYYAS7lVgc
	/t9HuVgtZ+jPShvLxymsk8CxpIphwOjGzHc184a7Vjdb19oC2g5dyxHUjINgQoLcwK40suf/aXnlT
	QDyYtJAGaiqKEnJk66gB4i9uWY93WE3Zpa0RiXYyVb8ybm8vfIAD12EpoXbubvdJeh2aKpexsw3ZI
	ofhngD12yx5HhJdp/Wjk2yRjJ/Cse6MZcGa1LxWZhYU8i2p3gtCT/zIQnBNWdsgzwav4UhMV7p8ob
	38Pm0P7D33GSB0z94ayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2T2W-0000000225b-3XQX;
	Fri, 04 Sep 2026 12:29:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2T2U-0000000224m-10zi
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 12:29:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48436251906so1035838f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 05:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788524940; x=1789129740; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wkKTYWKeG6QUBS922LjHNIJ7+OwGoSgdldmULUcOoY0=;
        b=LHHkq7yixTwBGaAsGGg+Vlj0AjIg55v/ADIwWNEsMUDQPeY8x60tldZXhmt0EgzAUz
         BLWBpAIhhMV8KfQZ/eOKveKWvDZGI6YBJOAC+zYNNVj7rsxTVeY+JMRWE+w8pXkEYaFO
         p2scVWmYe1tRFadGGkkcfbLRMU880i0SCov2w1yv1b116/W1lxZ2Yt2uY0KKAHYEsg+a
         +cPQBOskqXs9Odp+RWTB5XTEMkx6Vk17KE9R665DvC5Dpv12qp0igdL1E+718yrhjaH7
         I/6Y4vyTWT0Mmrazn09tIMiJu1I4D+JkLd8pNiuzTuhTaB4RP9fnGteSL22hjkKY1Dtz
         ugRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524940; x=1789129740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkKTYWKeG6QUBS922LjHNIJ7+OwGoSgdldmULUcOoY0=;
        b=RR+BPd61xkKa8Aj93Y6pRhbvUxSUOo4HPmRX60/hKXRzIYtpzEEonDadiW4pnlKEOz
         vtXBEDOY8wDxsbNqk0RswB+hGgNPjsVKDMdzZpUWrKQ0dQWrB9pu27MtPuV2eyfLv/W/
         kQ2zF+uBjRCtDmyh7Qhj9GSR1jdyGvaoEXQz8ywA1RcAnN3B1+r5zg/LTeEJBLRwFIU9
         bXG41Q8MaeU0csahLc9g8vicqH2UblU96nwHwjbQdZhR680T6sGnFKKHlNaqTFsI167N
         87hqUsBgQvv/N1EuMMjCz+Bvi8CRNEgRU4h+MLbmyeYLQdKEgk8n9J8WkuD6l/Jrn+aQ
         9KiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOoEMKv68LMNgxYVw5AEFIVX8e5srmoYtG+fOnpaFUUrqqyczo8gv3U5WZsFgQ6qGzV9kUmvwgwVojuA==@lists.infradead.org
X-Gm-Message-State: AFuF++mwmfY/a29RRSDL8qwMqoeqOrKQbFg/KvEXlJVL8DnJtHChOTP9
	9C/O+S/kPUwWmCCrvkzBsGyC7qjmN5TabhbNJoLPqhvLSXfO0fNwDEdIAsimKHFI4TFRl58PkKy
	T1l9YDRQ=
X-Gm-Gg: AYBFou03Bjd0UxFGoVO55/SP0M6LI0/hTmP9u/v5QHe1y8ODodLpH5PCpUSbMAR/SCW
	FvYvYtZxShb9umKsru0h3RGJHzLQGpHCGrgjgTStWVC+WF6s7zknfCRtcuNiTToBkpsFY6tlQ4s
	b3+fzryQ40ZsLge0yqgmESB6GiV7hK65seVoHV0O7wYWK9Ll69pmAnN9+YrIBNCRm+wJMTtU6rv
	94P1C5/CwmFJLRQPWwBKMqA2Zm3KTs+VS1pu8NiDUR9wvz+rZsNjTB4CPXgGR/ORqPYhZdov1nK
	8GJTcL/69CPnWqEDhiRJej6AKHBSl+XR/bT6O++HQUnUrQItrSPQP9UTm1qD/OFjQUriQ+0ZBu7
	0eSQVmu0flYAGpAtPcikSHq/DedsuYiDTQsTNI3uznQ6voASc49Aqra1XPQ8LC61KUDF9pHTMpB
	bhcMbfYjLdobYu3lFoZ0dckhKu4APPdq1tonk3i5KqpDVgNa7WOr9IakICoibg/w==
X-Received: by 2002:a05:600c:6087:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49cf81e3454mr99528635e9.4.1788524939473;
        Fri, 04 Sep 2026 05:28:59 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm153375065e9.4.2026.09.04.05.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:28:58 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:28:56 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: bcrl@kvack.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
	jack@suse.cz, tytso@mit.edu, adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com, ojaswin@linux.ibm.com,
	ritesh.list@gmail.com, yi.zhang@huawei.com, sforshee@kernel.org,
	akpm@linux-foundation.org, rostedt@goodmis.org,
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org, kees@kernel.org, tglx@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-aio@kvack.org,
	linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/8] Convert barrier pairs to acquire/release for
 better performance
Message-ID: <apq5iLOF8lAQ_ZVU@pathway.suse.cz>
References: <20260902074805.398540-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260902074805.398540-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_052902_319804_CB22A242 
X-CRM114-Status: GOOD (  28.44  )
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

Adding Risc-V list into Cc.

On Wed 2026-09-02 15:47:57, Jinjie Ruan wrote:
> Hi,
> 
> This series converts some existing smp_wmb()/smp_rmb() barrier pairs to
> smp_store_release()/smp_load_acquire() across various subsystems.
> 
> Background
> ==========
> 
> Many architectures support load acquire and store release instructions
> which can replace explicit memory barriers and save cycles. As noted
> in the ARM architecture reference [1]:
> 
>   "Weaker ordering requirements that are imposed by Load-Acquire and
>    Store-Release instructions allow for micro-architectural
>    optimizations, which could reduce some of the performance impacts
>    that are otherwise imposed by an explicit memory barrier.
> 
>    If the ordering requirement is satisfied using either a Load-Acquire
>    or Store-Release, then it would be preferable to use these
>    instructions instead of a DMB."
> 
> On arm64, a typical seqcount [2] read loop requires 13 cycles with DMB
> barriers. Replacing the read barrier with smp_load_acquire() reduces
> this to 8 cycles on an Ampere Altra.

I wonder if this is true on all other architectures:

  + It seems that Arm gets the gain because the instruction
    does both load/store + barrier. It helps even when
    the barrier is full.

  + Some other architectures need two instructions. One for the
    load/store and the other for the barrier. But the barrier
    is weaker, it synchronizes just reads or just writes.

For example, I see the following in riscv/include/asm/barrier.h:

<paste riscv/include/asm/barrier.h>
#define smp_mb()	RISCV_FENCE(rw, rw)
#define smp_rmb()	RISCV_FENCE(r, r)
#define smp_wmb()	RISCV_FENCE(w, w)

#define smp_store_release(p, v)						\
do {									\
	RISCV_FENCE(rw, w);						\
	WRITE_ONCE(*p, v);						\
} while (0)

#define smp_load_acquire(p)						\
({									\
	typeof(*p) ___p1 = READ_ONCE(*p);				\
	RISCV_FENCE(r, rw);						\
	___p1;								\
})
</paste riscv/include/asm/barrier.h>

I wonder whether:

  + RISCV_FENCE(r, r) is faster than RISCV_FENCE(r, rw)
  + RISCV_FENCE(w, w) is faster than RISCV_FENCE(rw, w)

so it might cause performance regression there...

Best Regards,
Petr

> We also observed significant barrier overhead while profiling Unxibench
> syscall test on arm64: a single getuid() call is ~8ns slower than on
> a comparable x86 system, with the dominant cost in map_id_up()'s smp_rmb(),
> which is a DMB ISHLD on arm64. Converting it to smp_load_acquire() allows
> the use of LDAR, eliminating the measurable overhead.
> 
> This motivated a broader search for existing barrier pairs that can
> be converted to the lighter acquire/release semantics.
> 
> Changes
> =======
> 
> Each patch in this series targets a specific barrier pair where the
> publish/subscribe pattern is already present:
> 
> - Writers populate data, then publish a flag/count/pointer via
>   smp_store_release()
> 
> - Readers load the flag/count/pointer via smp_load_acquire(), then
>   consume the data
> 
> This preserves the existing memory ordering guarantees while allowing
> architectures with native acquire/release instructions (e.g. arm64's
> STLR/LDAR) to avoid the cost of full one-way barriers (DMB ISHST/ISHLD).
> On architectures without native support, the generated code is
> generally no worse than the explicit barrier pair.
> 
> The conversions are mechanical and no functional change is intended.
> 
> Testing (Kunpeng HIP09 arm64 server)
> ====================================
> 
> 1. UNIXBENCH syscall
> 	Baseline: 715.27
> 	Patched:  718.83
> 	Improvement: +0.50%
> 
> 2. fs/aio (fio + null_blk, 4 jobs):
> 	Baseline: 1441k IOPS, 86.46us
> 	Patched:  1452k IOPS, 85.80us
> 	Improvement: ~0.8%
> 
> Both improvements are consistent across runs and align with the
> expected savings from replacing DMB with LDAR/STLR on arm64.
> 
> [1]: https://support.arm.com/documentation/102336/0100/Load-Acquire-and-Store-Release-instructions
> [2]: https://github.com/torvalds/linux/commit/d0dd066a0fa26d55c19ace9e89dedd9504c5bcba
> 
> Changes in v3:
> - Add Reviewed-by.
> - Split out network patch set as Kuniyuki suggested.
> - Link to v2: https://lore.kernel.org/all/20260901024234.135119-1-ruanjinjie@huawei.com/
> 
> Changes in v2:
> - Fix pre-existing issue for ext4 and 8021q [3].
> - Fix missing copy_mnt_idmap() udapte [3].
> - Drop nacked isotp patch.
> - Add test data.
> - Add Reviewed-by and update fs patch as Jan suggested.
> 
> [3]: https://sashiko.dev/#/patchset/20260825095422.3166067-1-ruanjinjie%40huawei.com
> 
> Jinjie Ruan (8):
>   user_namespace: Use acquire/release for nr_extents synchronization
>   lib/vsprintf: Use acquire/release for ptr_key publication
>   fs: aio: Use acquire/release for ring->tail publication
>   fs: Use acquire/release for fdtable resize synchronization
>   pidfs: Use test_bit_acquire() for attr flag tests
>   super: Use acquire for SB_BORN check in super_cache_count()
>   ext4: Fix out-of-bounds read in ext4_get_group_info()
>   ext4: Convert group-count barrier protocol to acquire/release
> 
>  fs/aio.c                | 10 ++++------
>  fs/ext4/balloc.c        |  2 +-
>  fs/ext4/ext4.h          | 10 +++-------
>  fs/ext4/mballoc.c       |  6 ++----
>  fs/ext4/resize.c        | 19 +++++++++++--------
>  fs/file.c               | 10 ++++------
>  fs/mnt_idmapping.c      |  5 ++---
>  fs/pidfs.c              |  6 ++----
>  fs/super.c              |  6 ++----
>  kernel/user_namespace.c | 24 +++++++++++++-----------
>  lib/vsprintf.c          | 11 ++++-------
>  11 files changed, 48 insertions(+), 61 deletions(-)
> 
> -- 
> 2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
