Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0857AC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 01:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWsEDLy+VsXSWjgsM9b1JyOBUV8he6ASFI7igxqowsk=; b=Vs3hRbAZ62r83V
	+qP6KynwH7aTkbthNtcKii0++TwWh1mA8E/rKBeikA7fYhFO1AtZ9JpOSVCzkTGr152nlsFtni2Hd
	E8NSephFkecoapPSvS0XZfBw77riS9kj3dvQ7LBEWHcV8qFzpXIutpDFSiLz0UlYzCgGd8T/u5hqZ
	ulK6fu5dqWKnUzwJwiqQD95I8RTEeRKKrxORz1EkqHUKQyitzNvgTLWLPdsy1QImOHhyVOSgSu6bb
	W3n+FP+K5itXz2/1o+wwUMkG1JzFLgvEiqcU0LdbCCj+FzV6+mK8BfEaDiSLbAGvJhXt7+4rIrLy6
	fGBtDywaObh4eYKeKmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nILDi-005SaE-87; Fri, 11 Feb 2022 01:59:34 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nILDe-005SZf-Na
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 01:59:32 +0000
Received: by mail-yb1-xb29.google.com with SMTP id j2so20955708ybu.0
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 17:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RFbOrJB91dtVxjgEUlW+BHbOy4fENPTN+VGup/GPGvI=;
 b=aeJSwGK4rykn36fjxwiAifQ2+2Z3fzqooeZYqzv2HSpDW6trZ5eL8677kS4ve7tLAb
 nRHvWxcIg7fOShRWGGWiZI0QztkV5qQqv9TnwucdAyf3rR/tGcjbtVdrRSUr+xXWcLA2
 bnoOgTBm7nG4LySblTGJ2chjEd6Vvn5MMt4tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RFbOrJB91dtVxjgEUlW+BHbOy4fENPTN+VGup/GPGvI=;
 b=SLEUCo2rtlNvC/UfO3kcV+cU1MFYjE4tTcCZO6s02o/Sl6FRgeXmWgc1mM5IFPPWaH
 ybi94Yd6F4lcG0drG5nQF/LFEfN2j4rv00sOMQl+DIsLBHThTMKJyVOeM/BVgotORETY
 g6vwqR90oC11KIeDtJ9sbLHEY1vT7slYMtZoRs6FJgxQJMLBAwe9rozMF7G9KPFfMQy9
 VwwYpYmEUyBsqdZ1ciHgBt2mFSZwzw7dHMiONwWJ7GBIp7mlfOJ2LHjBhm9SiFPaZ8TT
 9HRKc39SxSGfv/vI+VWgZxV5CZPH6ySN4rfwYu2DnVKf0wUuKtWrtHQj0D/7qvmWQ9uI
 RAmA==
X-Gm-Message-State: AOAM533OQHu6DUd0KRSI5iIt3gv5ww8N4OLx9FoaBj0A7QloHPWcguH6
 I7xagayFCIoqEcwiENTDRz+lXTRjDxDIqgD/ItfL
X-Google-Smtp-Source: ABdhPJyeKsqysaL4TvIJFeamc+j405DBHQmC15tZqpzix8Oqnhrdb7vI+jS9cQQj4u9OuxoyR1INUXAwAjZxxxK+qdo=
X-Received: by 2002:a25:73d5:: with SMTP id
 o204mr10127820ybc.472.1644544769403; 
 Thu, 10 Feb 2022 17:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20220209123800.269774-1-heiko@sntech.de>
 <20220209123800.269774-2-heiko@sntech.de>
In-Reply-To: <20220209123800.269774-2-heiko@sntech.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 10 Feb 2022 17:59:18 -0800
Message-ID: <CAOnJCUL6b=2dMJfJFTUj-3gshHGMYpgQEc0XUeSbkC4g7ayJkQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/14] riscv: prevent null-pointer dereference with
 sbi_remote_fence_i
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Wei Fu <wefu@redhat.com>, liush <liush@allwinnertech.com>,
 Guo Ren <guoren@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_175930_809188_ED332FD9 
X-CRM114-Status: GOOD (  23.73  )
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

On Wed, Feb 9, 2022 at 4:38 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The callback used inside sbi_remote_fence_i is set at sbi probe time
> to the needed variant. Before that it is a NULL pointer.
>
> Some users like the flush_icache_*() functions suggest a generic
> functionality, that doesn't depend on a specific boot-stage but
> uses sbi_remote_fence_i as one option to flush other cpu cores.
>
> So they definitly shouldn't run into null-pointer dereference

/s/definitly/definitely

> issues when called "too early" during boot.
>
> So introduce an empty function to be the standard for the __sbi_rfence
> function pointer until sbi_init has run.
>
> Users of sbi_remote_fence_i will have separate code for the local
> cpu and sbi_init() is called before other cpus are brought up.
> So there are no other cpus present at the time when the issue
> might happen.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/sbi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index f72527fcb347..c839acd668d3 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -15,11 +15,19 @@
>  unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
>  EXPORT_SYMBOL(sbi_spec_version);
>
> +static int __sbi_rfence_none(int fid, const struct cpumask *cpu_mask,
> +                            unsigned long start, unsigned long size,
> +                            unsigned long arg4, unsigned long arg5)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
>  static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init;
>  static int (*__sbi_send_ipi)(const struct cpumask *cpu_mask) __ro_after_init;
>  static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
>                            unsigned long start, unsigned long size,
> -                          unsigned long arg4, unsigned long arg5) __ro_after_init;
> +                          unsigned long arg4, unsigned long arg5)
> +                          __ro_after_init = __sbi_rfence_none;
>
>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>                         unsigned long arg1, unsigned long arg2,
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Otherwise, LGTM.
Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
