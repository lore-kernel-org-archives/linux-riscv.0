Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA249C4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 01:36:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43283230FA
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 01:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43283230FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E9KwaOG7zXVjWfpvl4fzMxAIGJjg8HuC1lYl8nrar1g=; b=eumF2+CGUpHAaZQI2AXI6wcbW
	KbIiykDAgGKd4U0iJwyts+3mq9pKT9rNP7n4z+sGCJbbNuBZvtzBbqBWgoCXH2Wl8YE5b5GOxSwTm
	OlsW+zuTI5eoyxDSZwE5PVU8jGkMOWLbxAi+H1q09RSev8LLdyqYeAZgK+4TvUryBjW4HN7vf6Tby
	2cGhS/kdaQF0yz/ozSRXechqx27Ke5GZRstjUEe894wAa+gn+lWmPvr0rlRJOiZ74ROS4rS+p7JDw
	XcSYm9XAnHkn4prglPLoHJYdTHiH7PkvMRt/e0MHjt2cIGDb4GbSuigS/YP0QGFTRrlQd0NYzv7Zm
	vrPuXWtHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpLjT-0000pY-7U; Wed, 16 Dec 2020 01:35:59 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpLjQ-0000p4-8B
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 01:35:57 +0000
Received: by mail-il1-x141.google.com with SMTP id r17so21064248ilo.11
 for <linux-riscv@lists.infradead.org>; Tue, 15 Dec 2020 17:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRd3YNHCqzK5NhqnkEbEDb94QUR4VdeTapVOxE6cbKc=;
 b=Or+/lveC48saPTq8E59KdZFlgJ4pYZ9kc8zK/zM8M8qtzMTsBKUPBasvvkac+KXlwg
 ni5Cj1HjqKDjLGcJHYimyvsrEsMi2F2Qz6qoKKu/kw2WRRzyLAFZJmGRkTf8YqhNTZgH
 MA5lIVuadi7sCsQ6tL37O4rUkz02/njjjeIk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRd3YNHCqzK5NhqnkEbEDb94QUR4VdeTapVOxE6cbKc=;
 b=BJvBVl2YKU7Y8rMDyDlbWdpOtuPgtyZ//xdCDQMkbwdAQrQaidX/CH6trCo29rlcPP
 V65WJz9PXIfrG1OVTLoJ+ZERQIrrtN+rARsp28b3skckddqFfNJOJguTFZSpoP5I0TeF
 TnBKLR8/1X88quDqbWgll2iY7SCW7fG/q6nZqEAkXUA1eARdb3D1XxCPO3ZN31O/laV5
 Xz+QmbYf3EfOzx2iw1AazPc+O3Mm287nUlOUcvYdvnl2Nc7CMMXyAARaaBXr2LV4AtCA
 wDsKg/qnW8d222XD4sEGKC5L9Uyf/vzMleMwAsy4tw92IBzdpw3LZx9yxR8EuIdtPBOf
 5ZEA==
X-Gm-Message-State: AOAM5304ubSoZjSm6IXPoyRZ3ZBrAxG8R/8Rb+w/PoQ54uDlPVsvjFB+
 B/mbjM/HND7uFSkUleDt3toHBzx2LTLKWDib9qST
X-Google-Smtp-Source: ABdhPJzIBCadYeToNm0MoslYBuG+uI/FLxtB3+6QwrRR8hZov+KWYR/Ze3DwUAPzjRoXIKYqc4j+AfHgajlmCvTHl2M=
X-Received: by 2002:a92:d84a:: with SMTP id h10mr42172073ilq.77.1608082551494; 
 Tue, 15 Dec 2020 17:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20201126024038.180680-1-wangkefeng.wang@huawei.com>
 <9aaa0069-12d9-b062-2e7d-95847ee2283c@huawei.com>
In-Reply-To: <9aaa0069-12d9-b062-2e7d-95847ee2283c@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Dec 2020 17:35:40 -0800
Message-ID: <CAOnJCUL+Mkyy7D6mUFr0GiT9CGbXg1aa3jO8d0Hrzan=GdV6PA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Cleanup sbi function stubs when RISCV_SBI disabled
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_203556_406262_DFA7FC73 
X-CRM114-Status: GOOD (  19.70  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 14, 2020 at 5:23 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Hi all,  any comments...
>
> On 2020/11/26 10:40, Kefeng Wang wrote:
> > Fix sbi_init() function declaration mismatch between RISCV_SBI
> > enable and disable, as it always returned 0, make it void function.
> >
> > Drop some stubs which won't be used if RISCV_SBI disabled.
> >
> > Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> > ---
> >   arch/riscv/include/asm/sbi.h | 10 +++-------
> >   arch/riscv/kernel/sbi.c      |  4 +---
> >   arch/riscv/kernel/setup.c    |  2 --
> >   3 files changed, 4 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 653edb25d495..99dc77ba8e43 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -89,7 +89,7 @@ struct sbiret {
> >       long value;
> >   };
> >
> > -int sbi_init(void);
> > +void sbi_init(void);
> >   struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> >                       unsigned long arg1, unsigned long arg2,
> >                       unsigned long arg3, unsigned long arg4,
> > @@ -147,11 +147,7 @@ static inline unsigned long sbi_minor_version(void)
> >
> >   int sbi_err_map_linux_errno(int err);
> >   #else /* CONFIG_RISCV_SBI */
> > -/* stubs for code that is only reachable under IS_ENABLED(CONFIG_RISCV_SBI): */
> > -void sbi_set_timer(uint64_t stime_value);
> > -void sbi_clear_ipi(void);
> > -void sbi_send_ipi(const unsigned long *hart_mask);
> > -void sbi_remote_fence_i(const unsigned long *hart_mask);
> > -void sbi_init(void);
> > +static inline void sbi_remote_fence_i(const unsigned long *hart_mask) {}
> > +static inline void sbi_init(void) {}
> >   #endif /* CONFIG_RISCV_SBI */
> >   #endif /* _ASM_RISCV_SBI_H */
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index 226ccce0f9e0..bae6ffdc6e7b 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -560,7 +560,7 @@ static struct riscv_ipi_ops sbi_ipi_ops = {
> >       .ipi_inject = sbi_send_cpumask_ipi
> >   };
> >
> > -int __init sbi_init(void)
> > +void __init sbi_init(void)
> >   {
> >       int ret;
> >
> > @@ -600,6 +600,4 @@ int __init sbi_init(void)
> >       }
> >
> >       riscv_set_ipi_ops(&sbi_ipi_ops);
> > -
> > -     return 0;
> >   }
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 901ac0c680dd..ef4f5c076d61 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -104,9 +104,7 @@ void __init setup_arch(char **cmdline_p)
> >       kasan_init();
> >   #endif
> >
> > -#if IS_ENABLED(CONFIG_RISCV_SBI)
> >       sbi_init();
> > -#endif
> >
> >   #ifdef CONFIG_SMP
> >       setup_smp();
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

LGTM,

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
