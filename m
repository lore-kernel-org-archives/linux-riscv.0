Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03D4EE6457
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5y5Tb/XVAkGmHTL4hbTy/jxLdm9s3baTCdcNa3E4gc=; b=fj8mDTjsAohjGK
	+GAH7v9R2LMGKm8Wh9F98DyJ4tDip0Z/ea/QqqhCFRTiLiPSt4kcBIiAnUQxK5FOkEjEvEwkpI9kt
	FP9ma3pT7FYZF8Yyh+bICp5E2tBXO+8VTJ1RJFuaVQPYb/X9MFfJaRvydEHj9JUxWacmp44ORThWc
	eiz3ZVQzyRmXTzfhnHnAxvK31/iP422VWBKwKCwLQ+E/t9RMFa7wBW6Jol78KZFeSR3yioJo90NjA
	yCSoECtmk9w/pE9yiIjpOWYE6uLVuFx1nU3nm2iCtOMQ/2lhzXS2mHdg5NMwlWvTUpZ7gJHWG0pkn
	xtn52V3pNOgqnI5lgE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh8kT-00AnPA-11;
	Fri, 15 Sep 2023 13:20:41 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh8kR-00AnOP-11
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 13:20:40 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-271d9823cacso1746641a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694784037; x=1695388837; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BaoDBq4J2WQTMoM6JUbluW9HfoAxhmWc40Mme5H8iVo=;
        b=u5FLgOP26E995ys2ckI8E10OsoncIpQbz9L4980HBHw+shwyKvn+TsGQuFTTQEYK7j
         aLHxsUcx9miIX8lOnj15dDfSl0B0kylBC1nqzGtrucZRn9yImliG0FcHaXsgZ2keAs9q
         dgBurZHCd7fFW4InfHRKu4UiBUDTcaw3zLYpCDDyo0Yhb+uTlvM8GsGzDJZWQaAwXWwS
         OaIAoZgCl4ZUWdLsj74Xfej9Tq7iW2F/7HOA8cPPpT4AjxCEsa7An8LAXVwGGJtSX4LA
         BT4ssgKm7a1pBYM393Ttiy6tt5u8CN+XnFS5KWneUuBFerVToW9eAvWbnOiQlyumEjWq
         /ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694784037; x=1695388837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaoDBq4J2WQTMoM6JUbluW9HfoAxhmWc40Mme5H8iVo=;
        b=GudiDsA/FAePUaER7BzLYIwgO5ksdtlvGdlScuM8G7rSUZjVBcwAySIZo5OucB1D5q
         M2n3lAw04qoTAlMJuq5c/thFaLN4v9ViFHbxfCb1uucy4nXJUd3MY1eH+16VnsNT3iW7
         qTDaO817o4BdlTAv+ZXGQr4KpCq8QdfY8sUWRbaTgSJ37XyRM85xj9eC8f84aD6j1Pbv
         sPTv6W2rUlK7+cAANjnTAVb4aVUrWvss8XjPtAO/JqtdFuudwfeU4QtXTT7XEswH0fku
         9fzEudhgqcNJLl7IxcLSiCk2tNZ1ZIY4QWWHIsnohgzpks7oygYm+y9j2CbDE0qmOHQu
         +/uQ==
X-Gm-Message-State: AOJu0YwnTKF8hz2/12KTFtSxXOwmnZs5k/N7O5PKB6/zNA/QUtZzhDng
	Vf8A/EpTI2JQVAHt1XnizcuXv7CPbAgaaSZozIniyg==
X-Google-Smtp-Source: AGHT+IEvUA9BR5BcrVOwtToL5WSZnMVL5hq1LhRR/C2UP2bV5CCmF6GnSfYb0YjLTzwW2flky6W/bE61lpkBlQ/Gnuc=
X-Received: by 2002:a17:90a:4b06:b0:26f:2c5a:bbb3 with SMTP id
 g6-20020a17090a4b0600b0026f2c5abbb3mr1316852pjh.40.1694784036728; Fri, 15 Sep
 2023 06:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-2-vincent.guittot@linaro.org> <be527eb1-d253-b9fe-ecc9-4c7b04da9efd@arm.com>
In-Reply-To: <be527eb1-d253-b9fe-ecc9-4c7b04da9efd@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 15 Sep 2023 15:20:25 +0200
Message-ID: <CAKfTPtANMnLAdw9y86zsx_HdjpWxQPA+Gnaa=qvXC+4xWwNa=A@mail.gmail.com>
Subject: Re: [PATCH 1/4] sched: consolidate and cleanup access to CPU's max
 compute capacity
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_062039_383077_F0661CAB 
X-CRM114-Status: GOOD (  18.63  )
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

On Thu, 14 Sept 2023 at 22:46, Dietmar Eggemann
<dietmar.eggemann@arm.com> wrote:
>
> On 01/09/2023 15:03, Vincent Guittot wrote:
> > Remove struct rq cpu_capacity_orig field and use arch_scale_cpu_capacity()
> > instead.
> >
> > Scheduler uses 3 methods to get access to the CPU's max compute capacity:
> > - arch_scale_cpu_capacity(cpu) which is the default way to get CPU's capacity.
> > - cpu_capacity_orig field which is periodically updated with
> >   arch_scale_cpu_capacity().
> > - capacity_orig_of(cpu) which encapsulates rq->cpu_capacity_orig
> >
> > There is no real need to save the value returned by arch_scale_cpu_capacity()
> > in struct rq. arch_scale_cpu_capacity() returns:
> > - either a per_cpu variable.
> > - or a const value for systems which have only one capacity.
> >
> > Remove cpu_capacity_orig and use arch_scale_cpu_capacity() everywhere.
> >
> > No functional changes.
> >
> > some tests of Arm64:
> > small SMP device (hikey): no noticeable changes
> > HMP device (RB5): hackbench shows minor improvement (1-2%)
> > large smp (thx2): hackbench and tbench shows minor improvement (1%)
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>
> Next to util_fits_cpu() which uses capacity_orig as a local variable
> (which is fine) there is sis() referring to capacity_orig in a comment.
>
> Documentation/scheduler/sched-capacity.rst uses the term `capacity_orig`
> in chapter 1.2 to explain the difference between CPU's maximum
> (attainable) capacity and capacity as the former reduced by pressure.

ok, I will have a look at those references to capacity_orig

>
> Not sure if you want to change those refs as well with this patch?
> People might get confused about the term `capacity_orig` pretty soon.
>
> Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
