Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8973C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 07:55:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 405E26145B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 07:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 405E26145B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UJPdcZ6GMpYx6eiwQ0tgrR87sLkTysHM50v5h4hPPGI=; b=gJJDKsNmzFHiNg+zUvvn0nzsj
	CbW1/hPf5MGXRvhXXMTsyp8NnenZv48CDRBiOszZ0umS6ev4kjbO5F/JnPk5ADui9xNov6myfnkYo
	HN5DGP3+qQAH5H1TS9ZLrYPZhr5rSoNNHPLVZns3h0c7QvBjtIz9/qdmh6yB2ske6s9gbmyniEKuD
	umdK4HXqcgjLa0eTvtLoUSJawVcaVD9FL/K1oyX0FOWzWkU+7YVKcI7wn2CU59b4b+yat1LB37m1r
	8rmFCB6b1TZgOjPa7M+A//cRRMZUUHdWrgzS5nMJJUsWr+OicqJfFBwbzUscTS8v9AAVbFfr6Eicp
	aaysBWDaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc1WO-005FDT-VV; Thu, 29 Apr 2021 07:55:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc1WE-005FCO-Jc
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 07:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qmJlsNemUgj3XZEoe8PGtodHTnvLV7K7B1GWOlD5JPY=; b=1eFIRXcpWJP0ZUBNEPWoy3A1Uh
 JgO6nMKtcZzuUu50tOsEDSoBlDTU7uelYKA/kpcEj70cHulmTcJDuOooAIT8x60pfDedZ2MaW0O05
 YTow0rvqhBcaoyvRTwWf7gAT0OXx6sDsngjRWSeetNR4MrgAtkSj71CAEjTPVO4iuFMeqoDM/RveA
 yg0VdGGT7qpjrox99I0IUjfD/JlAkcaFN8lcymqBFB2SJdS1PdhssEqM0gUO8OngGqK8PKeZZ0Anx
 MSPuQoPaKCQDq4UwsGb4sH7qmfxqVqP6y9yLjb/L6LRy2BYs90A1PdZ5WecY0k5K81yuOpC0jLhrm
 b0f1BA9A==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc1WB-000Sro-Np
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 07:55:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id m5so8468990wmf.1
 for <linux-riscv@lists.infradead.org>; Thu, 29 Apr 2021 00:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qmJlsNemUgj3XZEoe8PGtodHTnvLV7K7B1GWOlD5JPY=;
 b=MC8vXuPxHiaY4P/7KjvzPf+whH9V6z99NLOPd0W5Gyt7V1Y7mWqTkmMHr13Wr3Lb4k
 TdqMAf1i/sw5xYsUyK7UlSM5pASgeocY0x7G1w9SR41sQFXIQ9yjRw7fcT36PbGO74yg
 G9ueACKVUSp7Cy4I08Ufm+gTZC4JunjqJ+Z0rzFbbuKtHn/e26pS2ucuLp/fdqMjI5xc
 9jarGC4IU800VC+rN8h2vNHuUmRAcz16Zvgt5L8Q5f6hN1IP+gbpSgwIsWpsc2wx4n1g
 GgN+XDQVYQb/eIiLOWR2XH36+njznkuAkPr/4PoTpG3r3FrLZJph6FxIXhsAKLi3euvM
 7H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qmJlsNemUgj3XZEoe8PGtodHTnvLV7K7B1GWOlD5JPY=;
 b=lGwjLKULZq8rjIT+7+kHrQGFbJljaaWF/jnjmn4RUzx+42cf8vMr7Aw1qfRTBsYNAl
 VgQM6K+2GlLFX0Rcnh662B5Jy6wbQvYvD/vCY056UfEr1LttkHwMjHdp22Tj2fsfos3b
 4ru1DFnZrf9gyPMF6ubZze5b6z5Fg+H/IpXNQv2JeXnxZ44qkOfdj2llCqctxfqDtHF2
 tinyyVWAmPgdKxZCLVwzWVYdZMfyT8Rmbe8MGpcM/sJ5pCgufqrmDVHdqTANCBzCMt4A
 VZwnkrIvIigs+nBhQD8gzBvilCvLOAD5XD5g0Tzzhvc/c/7q0au7j8WH2Ed0W09SgV+e
 IHTg==
X-Gm-Message-State: AOAM533fVMfKQPcvDzgj3TSoGCQV4lP/qDjuWff+4monVMGJxCOGdTdP
 SuQvdpd/T4xDcFgIFVRBJeg1Lt/dH0SogvVDi88l/w==
X-Google-Smtp-Source: ABdhPJzmiOF3xJqL0l47OKPp6r3szhwHqR1tHXYt5EGgYJiCmB2qjo4Ft1myb006o3nevFZh0bQsaZqQYjoTBApA0qs=
X-Received: by 2002:a05:600c:9:: with SMTP id
 g9mr36255849wmc.134.1619682925177; 
 Thu, 29 Apr 2021 00:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210429061713.783628-1-palmer@dabbelt.com>
In-Reply-To: <20210429061713.783628-1-palmer@dabbelt.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Apr 2021 13:25:14 +0530
Message-ID: <CAAhSdy0Euh_rqpYkqB-_WtRmMJG5YpAk8nXghrz59-ARjD-9FA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Peter Zijlstra <peterz@infradead.org>, jpoimboe@redhat.com, jbaron@akamai.com, 
 rostedt@goodmis.org, Ard Biesheuvel <ardb@kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, 
 Anup Patel <Anup.Patel@wdc.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, mhiramat@kernel.org,
 Zong Li <zong.li@sifive.com>, 
 Guo Ren <guoren@linux.alibaba.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
 0x7f454c46@gmail.com, chenhuang5@huawei.com, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kernel-team@android.com, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Changbin Du <changbin.du@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_005527_869095_2AEA2BC9 
X-CRM114-Status: GOOD (  29.90  )
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

On Thu, Apr 29, 2021 at 11:50 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> We currently use text_mutex to protect the fixmap sections from
> concurrent callers.  This is convienent for kprobes as the generic code
> already holds text_mutex, but ftrace doesn't which triggers a lockdep
> assertion.  We could take text_mutex for ftrace, but the jump label
> implementation (which is currently taking text_mutex) isn't explicitly
> listed as being sleepable and it's called from enough places it seems
> safer to just avoid sleeping.
>
> arm64 and parisc, the other two TEXT_POKE-style patching
> implemnetations, already use raw spinlocks.  abffa6f3b157 ("arm64:
> convert patch_lock to raw lock") lays out the case for a raw spinlock as
> opposed to a regular spinlock, and while I don't know of anyone using rt
> on RISC-V I'm sure it'll eventually show up and I don't see any reason
> to wait.
>
> Fixes: ebc00dde8a97 ("riscv: Add jump-label implementation")
> Reported-by: Changbin Du <changbin.du@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/fixmap.h |  3 +++
>  arch/riscv/kernel/jump_label.c  |  2 --
>  arch/riscv/kernel/patch.c       | 13 +++++++++----
>  3 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
> index 54cbf07fb4e9..d1c0a1f123cf 100644
> --- a/arch/riscv/include/asm/fixmap.h
> +++ b/arch/riscv/include/asm/fixmap.h
> @@ -24,8 +24,11 @@ enum fixed_addresses {
>         FIX_HOLE,
>         FIX_PTE,
>         FIX_PMD,
> +
> +       /* Only used in kernel/insn.c */
>         FIX_TEXT_POKE1,
>         FIX_TEXT_POKE0,
> +
>         FIX_EARLYCON_MEM_BASE,
>
>         __end_of_permanent_fixed_addresses,
> diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
> index 20e09056d141..45bb32f91b5c 100644
> --- a/arch/riscv/kernel/jump_label.c
> +++ b/arch/riscv/kernel/jump_label.c
> @@ -35,9 +35,7 @@ void arch_jump_label_transform(struct jump_entry *entry,
>                 insn = RISCV_INSN_NOP;
>         }
>
> -       mutex_lock(&text_mutex);
>         patch_text_nosync(addr, &insn, sizeof(insn));
> -       mutex_unlock(&text_mutex);
>  }
>
>  void arch_jump_label_transform_static(struct jump_entry *entry,
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 0b552873a577..dfa7ee8eb63f 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -19,6 +19,8 @@ struct patch_insn {
>         atomic_t cpu_count;
>  };
>
> +static DEFINE_RAW_SPINLOCK(patch_lock);
> +
>  #ifdef CONFIG_MMU
>  /*
>   * The fix_to_virt(, idx) needs a const value (not a dynamic variable of
> @@ -54,13 +56,14 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>         void *waddr = addr;
>         bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
>         int ret;
> +       unsigned long flags = 0;
>
>         /*
> -        * Before reaching here, it was expected to lock the text_mutex
> -        * already, so we don't need to give another lock here and could
> -        * ensure that it was safe between each cores.
> +        * FIX_TEXT_POKE{0,1} are only used for text patching, but we must
> +        * ensure that concurrent callers do not re-map these before we're done
> +        * with them.
>          */
> -       lockdep_assert_held(&text_mutex);
> +       raw_spin_lock_irqsave(&patch_lock, flags);
>
>         if (across_pages)
>                 patch_map(addr + len, FIX_TEXT_POKE1);
> @@ -74,6 +77,8 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>         if (across_pages)
>                 patch_unmap(FIX_TEXT_POKE1);
>
> +       raw_spin_unlock_irqrestore(&patch_lock, flags);
> +
>         return ret;
>  }
>  NOKPROBE_SYMBOL(patch_insn_write);
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
