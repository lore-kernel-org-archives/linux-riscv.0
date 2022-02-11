Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9422BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 03:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BC85KhxEl7HuZyP5Huo3BKxV+WQ6h5nZOiZvEgNCuzk=; b=O4KHcu2JHpxv7m
	H05oArcbMvkjwiD+lcBTDkhvVoGKT7UxkEkRrASpzhs8L1Uddqrw3BY8k7ykS7thnU98s5Gt5SALW
	nb198zhDwasMp7tSrrXyI8edH3m0j4kjMfTSetL7T+CodX9Z/suXJGH6ACIqngYBo85BqB88SwaT4
	CGoV8Ihq3UyO1XTXNh+zry8Oo14mv5Ge21SI/Yt7iyW5KvOHTzso1nzRfnAl9Evrb7tHM7RMmSLOs
	K4OTA1ekXNrdumzvpyiUqwvLChwG93VgAKjeKZawthSJYCcuIoGcWLImaffh4MSP4dYdj6kP2xcgz
	zJqBgfNwOc4en+OFsnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIMGM-005ZQd-Iu; Fri, 11 Feb 2022 03:06:22 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIMGJ-005ZQB-Qr
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 03:06:21 +0000
Received: by mail-qt1-x82f.google.com with SMTP id p14so7760552qtx.0
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 19:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wtoQPG3jIyNhfYs5Ug8GoOsBEXEnyAg/kCZOfo5eUW4=;
 b=aTQRjBrtMxHqjA8dGQkttGtKl/OvztIJaTGZxxn47YkTNBCFWo7/UTFqTXotHgY3NU
 1Oeztm+aI3Ay1vO3Xu0GlbBR2/bUyafb2Lz2hwOJFCD6LMAR71oaiepbsNTYIe+zR6Xa
 ePz7MUEcCGSl7OKEmANSik79EWuo6//V44iBXNsthzF3M4PmN6Xg047/Z516mOCYYwl5
 bD87MlDZ0DCYGVv49FYerymRfIh0Syil85VX33E8kDOJGGNYfy0fopp8W2fHMPb3KXro
 7rwUVpRBLaMhZ/SbsD8CcFZmQXvQ7jaLdkWxou2ock+CF3A8DKSJe0GUSA3xlYDzYgDp
 Scpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wtoQPG3jIyNhfYs5Ug8GoOsBEXEnyAg/kCZOfo5eUW4=;
 b=i09o/FTZTu5CZVInqKzGHjS48X8IG+OVoJB6MA39gujBBinyb2djKnC8qnFQGnHjtM
 RqJUEJOeQVcN9Ok6fQwvgSZ1feFlz6UmyAQsNMKFN4p3Mm/KnUyDdnLaQe/BLcW5TNuZ
 zyMJRa9EtGWW3Vo953o3jSbjz7+X51KYPjPoBnIAVCVpBefch5mPgBW8+9nJ3biPYPFH
 zaMcs1zgbjXMKIRCrH7KA1daBagQLalAq9ZkTcZrQJDaAcq4CKgTVWz4fLR8CNOZhCzL
 8Nqq2BPbsrrt2UxaOtqArIf78QjqP2NQcmY+bYr1lOuyJkoD7O/Mdl2XEHZdeZqbgkBt
 6WcA==
X-Gm-Message-State: AOAM533x54eQ/J/LWzn/ko1MCfkvTYulAP3zGDMr92gDG9DrvSrCXcXj
 cqgDjKrDT+XDEScAGBtMfnw=
X-Google-Smtp-Source: ABdhPJxzSUy/I3v5zqlAVtjR5BiaITi+ml5Pkxod3S4XUKthVj3/cIc4iqiu1geQsoWspzLJKjjYVA==
X-Received: by 2002:a05:622a:11ca:: with SMTP id
 n10mr7027854qtk.42.1644548775320; 
 Thu, 10 Feb 2022 19:06:15 -0800 (PST)
Received: from mail.google.com ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id u63sm10780528qkh.43.2022.02.10.19.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 19:06:14 -0800 (PST)
Date: Fri, 11 Feb 2022 11:06:13 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: fix oops caused by irq on/off tracer
Message-ID: <20220211030613.s75irqxhflc25t7a@mail.google.com>
References: <20220129004226.32868-1-changbin.du@gmail.com>
 <YgAEb425uqy5/dw1@xhacker>
 <20220207123850.l4r5qjswaegwisbx@mail.google.com>
 <YgE7XRE/Uc6gTCWd@xhacker>
 <20220208003502.62gi5xhyg6bk2t2h@mail.google.com>
 <YgP6y99LWFSoxjHg@xhacker>
 <20220210133758.yzebffln6j76zme6@mail.google.com>
 <YgUuzZp/eiNoXejK@xhacker> <YgUxIgMJRhJD6/GP@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgUxIgMJRhJD6/GP@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_190619_947827_FEC9D06B 
X-CRM114-Status: GOOD (  26.80  )
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

I reconsidered the problem and found my previous analysis is flawed. So let's re-explain.

The fault happens on code generated by CALLER_ADDR1 (aka.__builtin_return_address(1)):
   0xffffffff8011510e <+80>:    ld      a1,-16(s0)
   0xffffffff80115112 <+84>:    ld      s2,-8(a1)  # <-- paging fault here,a1=0x0000000000000100

This because the assembly entry code doesn't setup a valid frame pointer, and the fp(aka. s0) register is used for other purpose.
resume_kernel:
	REG_L s0, TASK_TI_PREEMPT_COUNT(tp)
	bnez s0, restore_all
	REG_L s0, TASK_TI_FLAGS(tp)
	andi s0, s0, _TIF_NEED_RESCHED
	beqz s0, restore_all
	call preempt_schedule_irq
	j restore_all

So, there is two solutions:
 1) Invoke trace_hardirqs_on/off in C function, so the compiler will take care of frame pointer. This what I did.
 2) Always setup vaild frame pointer in assembly entry code. I think this is what JiSheng suggested?

I prefer #1 since we don't need to setup frame pointer if irqoff tracer is not enabled.

On Thu, Feb 10, 2022 at 11:37:06PM +0800, Jisheng Zhang wrote:
> On Thu, Feb 10, 2022 at 11:27:21PM +0800, Jisheng Zhang wrote:
> > On Thu, Feb 10, 2022 at 09:37:58PM +0800, Changbin Du wrote:
> > > On Thu, Feb 10, 2022 at 01:32:59AM +0800, Jisheng Zhang wrote:
> > > [snip]
> > > > Hi Changbin,
> > > > 
> > > > I read the code and find that current riscv frame records during
> > > > exception isn't as completed as other architectures. riscv only
> > > > records frames from the ret_from_exception(). If we add completed
> > > What do you mean for 'record'?
> > > 
> > 
> > stack frame record.
> > 
> > > > frame records as other arch do, then the issue you saw can also
> > > > be fixed at the same time.
> > > > 
> > > I don't think so. The problem is __builtin_return_address(1) trigger page fault
> > > here.
> > 
> > There's misunderstanding here. I interpret this bug as incomplete
> > stackframes.
> > 
> > This is current riscv stackframe during exception:
> > 
> > high
> >  	----------------
> > top	|		|  <- ret_from_exception
> > 	----------------
> > 	|		|  <- trace_hardirqs_on
> > 	-----------------
> > low
> 
> sorry, the "top" is wrongly placed.
>  high
>   	----------------
>  	|		|  <- ret_from_exception
>  	----------------
>  	|		|  <- trace_hardirqs_on
>  	-----------------
> top
> 
>  low
> 
> 
> 
> > 
> > As you said, the CALLER_ADDR1 a.k.a __builtin_return_address(1) needs
> > at least two parent call frames. 
> > 
> > If we complete the stackframes during exception as other arch does:
> > 
> > high
> >  	----------------
> > top	|		|  <- the synthetic stackframe from the interrupted point
> >  	----------------
> > 	      .....	      
> >         ----------------
> > 	|		|  <- ret_from_exception
> > 	----------------
> > 	|		|  <- trace_hardirqs_on
> > 	-----------------
> > low
> 
> ditto
> 
> > 
> > 
> > Then we meet the "at least two parent call frames" requirement. IOW, my
> > solution solve the problem from the entry.S side. One of the advantages
> > would be we let interrupted point show up in dump_stack() as other arch
> > do. What I'm not sure is whether it's safe to do so now since rc3 is
> > released.
> > 

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
