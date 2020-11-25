Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA49C56201
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 22:58:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F537206B5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 22:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OHxoco2+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="QTZgvn1s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F537206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HagI+9i0MAG8n7DC98DZQ2FEOk8QZBmMXc/wawPia1Q=; b=OHxoco2+4jajmzrQIUYM22UQw
	njnzuIsOINNRwsmNoWxQQNbV5BSILYd5F2iKTEnHM/kXDAgAs92ngEsV9FdHScKwpWgU/J9ZvIdVw
	0om+RxeYQCDfAKXeqFTcftFCzMLWvtO+X3A0P3+L3kMS7yMbAvPyCF8CHKr9SERscxXihBbjbeVgY
	XjlB7v1r3drZY78+MEtOpXNC9xVY578SZQYS+7qvQvt5BZ19P9VjybaiYdLcYSCvRwkFoV6MsPj+H
	itCH1FWucjii2zMEy+KRyfPWYUE8/usBltAcpSlHIhYa0QMlCoBc4BUTJwz7ExDjJyO91PonalE3P
	z2U1+UYeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki3kE-0007MQ-8t; Wed, 25 Nov 2020 22:58:38 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki3kB-0007Ly-9o
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 22:58:36 +0000
Received: by mail-il1-x141.google.com with SMTP id y9so167568ilb.0
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 14:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZzIAto9CDnhYVGR1GV1X9hwR0RGGcM17Y2vGxVQQrIM=;
 b=QTZgvn1s4v6lLaM1CTKUGcGJI92Gi8zK8AEiP1X9GFbA15RoIspb53olvgDjgDer4c
 0DOioW76vNeVTiry2H+SA4nSk2dPTAGYkZ+ng2sBbjj6G44r7D3TNNzKZ2t2j+uF4qmq
 6KLYdBKcgr63xIobfAzs07q7bl7B8R9iu0Qa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZzIAto9CDnhYVGR1GV1X9hwR0RGGcM17Y2vGxVQQrIM=;
 b=eH2qqdvDOEY7Mc+dQlG2+u985gUeqrcx1WdHCf4V4mLrXmYkaChl++/3OTP89FiOcU
 ZQOYP0JOLKf2elqQBg7OhLneujw5Gb0t4ecnWbSEOziAB6zGnP6sr0il0eteuBaGEIss
 ZzLE8A10WlnMG0K9vPS5177+rgroMDVLc2GY6BTS8SJ75Np1DVbAw8MzKlmPFAfNqYkf
 jn2g4QN1IDay2ncX6xJk5gWyNEtib3sZevWHZCsV3+UiAZKSylqtcNFCO04/7jszfsKc
 jt2c5QOMsZn9IRw4/Rq5D5vFoqCgyaQuHtMV3/IoXqyzrc8Sf6n50k22kVU6mPbTDtve
 Fp/A==
X-Gm-Message-State: AOAM531TlgjBY5Jdm/rZP3fuBqIV1J+cfCjyo76w8VlLTnDQYLIvoh1g
 0FZsUDZdU7GYnjcqmCHK0bPnguO02eemtyi3MXkWPQ9zV/4t
X-Google-Smtp-Source: ABdhPJwt+pk4yc6FPOM1CS7nt6M69YQOoYAwwm6N4Y/Ck9U2Knk1pysNBS8yMaS6Vu5dJaN3LeFQ9RSluigJrV6058A=
X-Received: by 2002:a92:d712:: with SMTP id m18mr34070iln.219.1606345113056;
 Wed, 25 Nov 2020 14:58:33 -0800 (PST)
MIME-Version: 1.0
References: <mhng-54bff36c-7c0d-4448-8859-d8d05cbd8b0d@palmerdabbelt-glaptop1>
 <20201124112054.106960-1-wangkefeng.wang@huawei.com>
 <20201124112054.106960-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20201124112054.106960-2-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 25 Nov 2020 14:58:23 -0800
Message-ID: <CAOnJCUJH7AFYNsyFzwzHApZhfx_1yiEj+zkQDxryD83zac6f2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Fix __show_regs printing formats
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_175835_591163_F8515AB7 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 3:17 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Using printk directly and align the printing formats.
>

Why switch to printk ? IIRC, pr_* is preferred over printk for any new code.

> Before:
> epc: ffffffe0008dc23a ra : ffffffe0008dc238 sp : ffffffe081ddbd80 gp : ffffffe0010e2c70 tp : ffffffe0800d47c0 t0 : ffffffe001018620
>  t1 : 0000000000000064 t2 : 000000000000000a s0 : ffffffe081ddbda0 s1 : 0000000000000270 a0 : 000000000000002e a1 : ffffffe000baaf90
>  a2 : 0000000000000010 a3 : 0000000000000001 a4 : 1db93e333d1e1200 a5 : 1db93e333d1e1200 a6 : 0000000000000030 a7 : ffffffffffffffff
>  s2 : 0000000000000000 s3 : ffffffe000b9ac80 s4 : ffffffe081d9f000 s5 : 0000000000000048 s6 : 000000000000000c s7 : ffffffe081ddbe80
>  s8 : 0000000000000000 s9 : 00000000000b1688 s10: 0000000000099dc8 s11: 0000003fffbd9fa2 t3 : 1db93e333d1e1200 t4 : 0000000000000002
>  t5 : 0000003ff778eac8 t6 : ffffffe081ddbac8status: 0000000000000120 badaddr: 0000000000000000 cause: 000000000000000d
>
> After:
> epc: ffffffe0008dc23e ra : ffffffe0008dc23c sp : ffffffe08221bd80
> gp : ffffffe0010e2c70 tp : ffffffe081cb1ec0 t0 : ffffffe001018620
> t1 : 0000000000000064 t2 : 000000000000000a s0 : ffffffe08221bda0
> s1 : 0000000000000270 a0 : 000000000000002e a1 : ffffffe000baafb8
> a2 : 0000000000000010 a3 : 0000000000000001 a4 : eee4a3de5cb81700
> a5 : eee4a3de5cb81700 a6 : 0000000000000030 a7 : ffffffffffffffff
> s2 : 0000000000000000 s3 : ffffffe000b9aca8 s4 : ffffffe081d52000
> s5 : 0000000000000048 s6 : 000000000000000c s7 : ffffffe08221be80
> s8 : 0000000000000000 s9 : 00000000000b1688 s10: 0000000000099dc8
> s11: 0000003fffe33fa2 t3 : eee4a3de5cb81700 t4 : 0000000000000002
> t5 : 0000003fcc454ac8 t6 : ffffffe08221bac8
> status: 0000000000000120 badaddr: 0000000000000000 cause: 000000000000000d
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/kernel/process.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index e41b733abeaa..2119d49feea5 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -44,30 +44,30 @@ void __show_regs(struct pt_regs *regs)
>  {
>         show_regs_print_info(KERN_DEFAULT);
>
> -       pr_cont("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
> +       printk("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
>                 regs->epc, regs->ra, regs->sp);
> -       pr_cont(" gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
> +       printk("gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
>                 regs->gp, regs->tp, regs->t0);
> -       pr_cont(" t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
> +       printk("t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
>                 regs->t1, regs->t2, regs->s0);
> -       pr_cont(" s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
> +       printk("s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
>                 regs->s1, regs->a0, regs->a1);
> -       pr_cont(" a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
> +       printk("a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
>                 regs->a2, regs->a3, regs->a4);
> -       pr_cont(" a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
> +       printk("a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
>                 regs->a5, regs->a6, regs->a7);
> -       pr_cont(" s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
> +       printk("s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
>                 regs->s2, regs->s3, regs->s4);
> -       pr_cont(" s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
> +       printk("s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
>                 regs->s5, regs->s6, regs->s7);
> -       pr_cont(" s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
> +       printk("s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
>                 regs->s8, regs->s9, regs->s10);
> -       pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
> +       printk("s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
>                 regs->s11, regs->t3, regs->t4);
> -       pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
> +       printk("t5 : " REG_FMT " t6 : " REG_FMT "\n",
>                 regs->t5, regs->t6);
>
> -       pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
> +       printk("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
>                 regs->status, regs->badaddr, regs->cause);
>  }
>  void show_regs(struct pt_regs *regs)
> --
> 2.26.2
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
