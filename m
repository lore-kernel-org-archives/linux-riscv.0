Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400C8C61DD8
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 19:31:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE80120637
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 19:31:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qEyhyqRT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QDAYt3WU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE80120637
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PvZdOgyJrN2TLqJfbxtdjp7Dm2j2BF1kGhFOWTOboLM=; b=qEyhyqRTw4d0EIE3PTbUDrxtI
	ieAqD8Fq0BvQdr7CEkMyLquXsDv/LNFfCDRBdFyTkSiGa7HiVX0jlmJQnJiBHuxgo6o/edHKx9N7H
	tgfZfPNVeyta5J7xjiPdwwIyiwP+yaN0MW1i06RYBwgnFe+4kEeM80Q/rietIiovh1imhZ4JwpFKk
	YHu7Ojrk3lR1m9Ge/rRmzm37JKDpIsf7SAH8txsCmMhXzl/0O5m5Hv6KHNq3yisnBvq/RrHSbe6By
	l/8gWma6hRHDrPnxD9Us0QM8Pw2IWXZjlIpfj+UqalxUUZC1Imm/xLtVlFFYEHtOeYS4O5mvsRWTL
	bLVNtKLEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kekDr-0006ni-Md; Mon, 16 Nov 2020 19:31:31 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kekDo-0006nE-Vt
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 19:31:29 +0000
Received: by mail-pf1-x444.google.com with SMTP id w14so15099081pfd.7
 for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2020 11:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cGlOiQidYdOUuFpFQrkW0TeHEuSg5zbmdMF9LAJd9eM=;
 b=QDAYt3WUDWZ9zhvjKOOkr+BRgXwoz9jg0reCZVaxi9z/UBM84zmHJIbN2KOOPXOnaU
 6vuMv+XlaVvh16uX7o6HtA13aXcvYzOUSKw0B0TPTkfPtWhRdgl3f5+krfAnVoGJhx9K
 iO5gfA01lkluE6E9JdRFgavcZgYX2LxgeLVEiwyX8cMw87vqbss9l/NqeXav0rbmBNtl
 Og+aEIerF/darfGRu2IbWxb3M5osLqSGx3k+6dXNMg7UiiwgHNkbd1TCJg8qKjl+3/58
 V4gJdlFY5TuK3LcZE1ZhS7Fi54NOjb09s2oG5Or18Y2U1dfur15Dq+LcFYxkzFvLEsRo
 S61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cGlOiQidYdOUuFpFQrkW0TeHEuSg5zbmdMF9LAJd9eM=;
 b=H2YCE8LSTka70d42AUZGKHWG3vBeqYW1Mu7dWRJNib6h2Z9dKoIVlPmicuE3SQRuPg
 bMl+qo4RezoowRc6lq/5OPxF+qGn5mmD2lHtiOH6i81GGBpag5eXcVBzU/EqHIpEiSkP
 M1E7XiNAaa4W1b6Q3ilYUpKB4KGF6gO/hWtaAIzmXXzJJUXpGeCsWR85SghJu50JsoQm
 3hFZkmsyoHa1148YCpwEnsvGOk5r9s6bGTBt7xuTfq3BC3Ca+dSF/598yJ80GyeG9lzd
 fApWDr/oQ/DCZqRhnOtcdoO386e8EJLm3Ako08nGtSmcqG/RN8guurPM6HdAapyaCrp/
 mhyw==
X-Gm-Message-State: AOAM5311QM2VmQwyAdMIWVlm9C/mADADDupaMyfLUF9ozlBuqf9QyKCE
 NNHlZeFRfPcYz23bHY5Eo79R762BFV4QjMXnRhi6rw==
X-Google-Smtp-Source: ABdhPJzXg3takLX1phIDPuBdZ2SMXWEBlyJrWyLsVYjrVb+IsuRmX/tfjsnyMdZ1GtK3fdxA9Dp0E6u3WM5RE/fj4hk=
X-Received: by 2002:a17:90a:4881:: with SMTP id b1mr493181pjh.32.1605555084999; 
 Mon, 16 Nov 2020 11:31:24 -0800 (PST)
MIME-Version: 1.0
References: <20201014212631.207844-1-nivedita@alum.mit.edu>
 <87sg999ot0.fsf@igel.home>
In-Reply-To: <87sg999ot0.fsf@igel.home>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Nov 2020 11:31:13 -0800
Message-ID: <CAKwvOdn8aOr0=22idJ_KetgJ_rhk5-7i29VvxofoLrRo138f_g@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Fix barrier_data() on clang
To: Andreas Schwab <schwab@linux-m68k.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_143129_070254_BBA20F9E 
X-CRM114-Status: GOOD (  17.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-riscv@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 9:47 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Okt 14 2020, Arvind Sankar wrote:
>
> > Commit
> >   815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")
> >
> > neglected to copy barrier_data() from compiler-gcc.h into
> > compiler-clang.h. The definition in compiler-gcc.h was really to work
> > around clang's more aggressive optimization, so this broke
> > barrier_data() on clang, and consequently memzero_explicit() as well.
> >
> > For example, this results in at least the memzero_explicit() call in
> > lib/crypto/sha256.c:sha256_transform() being optimized away by clang.
> >
> > Fix this by moving the definition of barrier_data() into compiler.h.
> >
> > Also move the gcc/clang definition of barrier() into compiler.h,
> > __memory_barrier() is icc-specific (and barrier() is already defined
> > using it in compiler-intel.h) and doesn't belong in compiler.h.
> >
> > Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
> > Fixes: 815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")
>
> This breaks build on riscv:
>
>   CC [M]  drivers/net/ethernet/emulex/benet/be_main.o
> In file included from ./include/vdso/processor.h:10,
>                  from ./arch/riscv/include/asm/processor.h:11,
>                  from ./include/linux/prefetch.h:15,
>                  from drivers/net/ethernet/emulex/benet/be_main.c:14:
> ./arch/riscv/include/asm/vdso/processor.h: In function 'cpu_relax':
> ./arch/riscv/include/asm/vdso/processor.h:14:2: error: implicit declaration of function 'barrier' [-Werror=implicit-function-declaration]
>    14 |  barrier();
>       |  ^~~~~~~
> cc1: some warnings being treated as errors
> make[5]: *** [scripts/Makefile.build:283: drivers/net/ethernet/emulex/benet/be_main.o] Error 1
> make[4]: *** [scripts/Makefile.build:500: drivers/net/ethernet/emulex/benet] Error 2
> make[3]: *** [scripts/Makefile.build:500: drivers/net/ethernet/emulex] Error 2
> make[2]: *** [scripts/Makefile.build:500: drivers/net/ethernet] Error 2
> make[1]: *** [scripts/Makefile.build:500: drivers/net] Error 2
> make: *** [Makefile:1799: drivers] Error 2
>
> Andreas.

A lot of VDSO's reset KBUILD_CFLAGS or use a new variable for their
compiler flags.  As such, they're missing `-include` command line flag
that injects include/linux/compiler_types.h, which `#includes`
numerous other headers if `__KERNEL__` is defined (`-D__KERNEL__`).
So the RISCV VDSO Makefile might need to `-include
$(srctree)/include/linux/compiler_types.h -D__KERNEL__`, or `#include
<linux/compiler.h>"` directly in
arch/riscv/include/asm/vdso/processor.h.
-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
