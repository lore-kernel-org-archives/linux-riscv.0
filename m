Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D0AC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 15:54:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7660860FC0
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 15:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7660860FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjdD3aa4o6j+aJMUR6i7M1DwSuVXYmgvbbXjWBfgzRk=; b=dAoXFQTYu8yYAi
	Gl0YzJSUhLfGo3xbbqHLtoopfKFEDPyBq6NhYjhfe94dKVlfX6WawfKP/UPnJj3l1nAnNCGPkC3sH
	q+c3R0hVbUJ9zS1uXVqYie/vGfO7Uw5Ghquw/+nkQK3DclJ0auYYLl/77InUxjLuzjGqM7P+xqPSp
	XYY1gozRYjUVM8S9KT5wMiiJx2Rwn26JrQepJQ+qRkNOurzQmlbGea+zFVbAm4JGNkVZX24krxxHz
	cFuTA43DQL8kxg8gA/wgSQvYhZ/pl+/pzCwIryH+XomSHyx3fLAybJkd7ohWZoO0PU4DDLGO9mCHi
	4RZce8jF90IcrtXl/oLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mED1u-00AbMG-6p; Thu, 12 Aug 2021 15:54:02 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mED1o-00AbL9-8k
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 15:54:00 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id w17so12625893ybl.11
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 08:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9KW2/qijRYj1BOVATRIEUb5ZBc50beMYDjvUxmZFiRc=;
 b=LHuXb9xzqe5DwhBYGOjusfcVLJLfxSrMOqgAdsG7OgbRVJdCX8A+FCQsg0LRpoz+Tu
 AjQGQYHovApi+hFSLDN6rtlF9wmEBgVe6WbxXYtMJhWCS2fPc01sWMQwegW07LMbYBk1
 g4TyhI5MbyZmvOgDgZnThyIOICYEFkcpi8FSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KW2/qijRYj1BOVATRIEUb5ZBc50beMYDjvUxmZFiRc=;
 b=uZ3JGMNLbC87iU2hmMRNbVRnK2FlsC+MjMxHisbhOgc5/5B2xeGIn/9QKzYxbPtQ6/
 76kpZijE1QOnIOBhI7BSveZAj7TDC5JBIBzs0TFTy0f0c34/lAXzCrDJTx1lOYvdQYEy
 tnvDy2IDZ0LVvzioVzHizh7rMKgmiH6p6RYpBrWZ/6g//peEIMMGY0fNuoiYm4zya/K9
 pW7xRMC83QafOozbrE/jO40DeFfBlpM7Lh+ggD3h8Hs4mIP/F3o0GG3FaNfWCH8YT+Z3
 HpvVTaDyMD5UAPO9MF6ZKndUcaq1SGKq8RZFFGlEcw2ycRCbM1wNAE3ZBekCjYcXF5nU
 Pc9Q==
X-Gm-Message-State: AOAM531yIkHDeWSuyUEssjaZLE9nIFC6RFSYKG4WnyQWE+7wHYubhjMj
 whcfTCnLgtyAR0JU0gf0iRCalMOymLaB/ue02jyx
X-Google-Smtp-Source: ABdhPJzZO0OsNFC/A2UHECLysjbKOC4vzD4gZilL/H0m8nkpIdJjITRQ2A/fHwlHwXIJYbEXwrlmPAVUpj41KqSL3h8=
X-Received: by 2002:a25:e094:: with SMTP id x142mr5068884ybg.147.1628783634885; 
 Thu, 12 Aug 2021 08:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210812123433.27871-1-dimitri.ledkov@canonical.com>
In-Reply-To: <20210812123433.27871-1-dimitri.ledkov@canonical.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 12 Aug 2021 08:53:44 -0700
Message-ID: <CAOnJCULTxFmRbpw4wp7SYN8EJxFhSN5J04QDE=cfxLAB01ZOFA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: prevent sbi_send_cpumask_ipi race with ftrace
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Pierce Andjelkovic <pierceandjelkovic@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_085356_379129_0E616D6A 
X-CRM114-Status: GOOD (  22.17  )
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

On Thu, Aug 12, 2021 at 5:36 AM Dimitri John Ledkov
<dimitri.ledkov@canonical.com> wrote:
>
> From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
>
> ftrace will patch instructions in sbi_send_cpumask_ipi, which is going to
> be used by flush_icache_range, leading to potential races and crashes like
> this:
>
> [    0.000000] ftrace: allocating 38893 entries in 152 pages
> [    0.000000] Oops - illegal instruction [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.11.0-1014-generic #14-Ubuntu
> [    0.000000] epc: ffffffe00000920e ra : ffffffe000009384 sp : ffffffe001803d30
> [    0.000000]  gp : ffffffe001a14240 tp : ffffffe00180f440 t0 : ffffffe07fe38000
> [    0.000000]  t1 : ffffffe0019cd338 t2 : 0000000000000000 s0 : ffffffe001803d70
> [    0.000000]  s1 : 0000000000000000 a0 : ffffffe0000095aa a1 : 0000000000000001
> [    0.000000]  a2 : 0000000000000002 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.000000]  a5 : 0000000000000000 a6 : 0000000000000004 a7 : 0000000052464e43
> [    0.000000]  s2 : 0000000000000002 s3 : 0000000000000001 s4 : 0000000000000000
> [    0.000000]  s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
> [    0.000000]  s8 : ffffffe001a170c0 s9 : 0000000000000001 s10: 0000000000000001
> [    0.000000]  s11: 00000000fffcc5d0 t3 : 0000000000000068 t4 : 000000000000000b
> [    0.000000]  t5 : ffffffe0019cd3e0 t6 : ffffffe001803cd8
> [    0.000000] status: 0000000200000100 badaddr: 000000000513f187 cause: 0000000000000002
> [    0.000000] ---[ end trace f67eb9af4d8d492b ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
>
> Where ffffffe00000920e lies in the middle of sbi_send_cpumask_ipi.
>
> Reproduced on Unmatched board using Ubuntu kernels. See
> https://people.canonical.com/~xnox/lp1934548/ for sample images,
> kernels, debug symbols.
>
> BugLink: https://bugs.launchpad.net/bugs/1934548
> Reported-by: Pierce Andjelkovic <pierceandjelkovic@gmail.com>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
> cc: Paul Walmsley <paul.walmsley@sifive.com>
> cc: linux-riscv@lists.infradead.org
> cc: stable@vger.kernel.org
> ---
>  arch/riscv/kernel/sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 7402a417f38e..158199865c68 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -562,7 +562,7 @@ long sbi_get_mimpid(void)
>         return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
>  }
>
> -static void sbi_send_cpumask_ipi(const struct cpumask *target)
> +static void notrace sbi_send_cpumask_ipi(const struct cpumask *target)
>  {
>         struct cpumask hartid_mask;
>

flush_icache_range doesn't invoke sbi_send_cpumask_ipi.
flush_icache_range->flush_icache_all->sbi_remote_fence_i->__sbi_rfence->sbi_ecall

Moreover, sbi.c should be removed from ftrace path as it is compiled
with notrace flag after the patch [1]

CFLAGS_REMOVE_sbi.o   = $(CC_FLAGS_FTRACE)

This solution was proposed as a result of earlier discussion [2] last year.

[1] https://patchwork.kernel.org/project/linux-riscv/patch/1608220905-1962-5-git-send-email-guoren@kernel.org/
[2] https://lkml.org/lkml/2020/11/3/735

The proposed fix probably hiding the root cause somehow.

Do you have the patch[1] in your kernel ?


> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
