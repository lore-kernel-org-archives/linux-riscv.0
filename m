Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B98CD98DE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 02:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/0dZulk5In18NI1H8CegoOfqnHc8GPlTS21lKVjXQs=; b=ne+x2x4qlTWKGw
	/ISUsGo397wTz1dvooMDtoqbuB7I1tyUzNBDVvFl+T+o076YMW5GwxPlU7CqXaJ0BhzWqeZhcXaf5
	f+ehpeIicaqFcpa5BJl6pYQ7FTybX/6AMSj+ecpfwD44Gp7G+Y+4MU03jwq6KPqCbd8HdYnRc7p8G
	TUuMtgFgusc9mvstJgBf3U/7a5xGzJIEe+/pfNRISbPSZGSFfcUC5T1XoV4MFJ0yselPUYaMnzmMF
	GFMXkC2+4vX6kPtuVzANR22hNT/jdUgT1mFPuToWYQAvq6hdPwLwfWHcdjCRPxLkyZ/hqPT3H+sqP
	N6cRc0sCdKT+1tAZZYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZJQO-0000000F6PP-42UO;
	Tue, 16 Jun 2026 02:21:12 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZJQM-0000000F6P3-1USU
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 02:21:12 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-137335bc3caso4809132c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 19:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781576469; x=1782181269; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a6IEVsqYp5cYVGQwVC9lenyJSUbd6i5nZsgE+48XJIA=;
        b=sDYYnsjA3AUKdJ6Uju0zRPJWamAbDB2n7GtEdYvKFICmuzXjPSQI1wi8obaqqgm27L
         bdp7P6x5F2UuvTpfv1T5ERzSKQUxOmwoL6B9xerb1RmYQFZ8ht5S0hwtV93TH9bFDISU
         sr7/Sayn4lJnyB2Gf11zbb+opHm68cd1U/V9FJNLRDaFWRxlsCvIrEvfDWCXGCzAJVhO
         PUtMwURFD0RGRrWr/YCS2BglWClwMGaJ2sG4vWoSPRnfCdGha+B87jMvNIENri+w7t5N
         u5tKDaqsJlbUm1yUFks1Y9kwCYexlfXfRJO03gfm4LACYCZpM8bcISrE0kcSb6vI32zF
         7u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781576469; x=1782181269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6IEVsqYp5cYVGQwVC9lenyJSUbd6i5nZsgE+48XJIA=;
        b=P02j3lIrW+reybeKYrhrhzJGuAlWlga6xmxHoK+MO48kpJMa+ZiqYyGj3R+csvYTmU
         miM55QKtIa0Jwq8meqSkMqLVuKO5R5XDnlQXVcolxCv5jPGOLeO84mKuNKGypAWqS+kE
         17so+tQICeKp/t3zma02IB/PeP0H0ZJkCtbO3cOskrwL9fgJxM5KzbrN4vQRNO/qN8Ca
         IEhs3q7pY5nBLBY9FavLuTjT4euNA3XCYOJ0DuUoKJM3FZnTfnHKBrAiLby/1EsvHlRd
         5bKF6m7pyoiNpRpZRz+AA3k4AkBIy2F9HfEDrjGpoRch4KKy1tFYxev9jns5l3BE2+HF
         0YLA==
X-Forwarded-Encrypted: i=1; AFNElJ+4wKEMeBxQJezHyJcXcATtl3MQIbxPMracfyXCC1zhhM1oC6W8K4Il3QKVmWJLmlhZJSlpqBDFsddYHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfrCdt89MwKh8ypxsmG716xD2NusWUTfaDekAE/0rkPBwGSh3E
	mUYveAHOVtx74ZW5BGlnV8uWbaIlpe7KuxX4MHj7mQzU8TMPrtT62ZUI
X-Gm-Gg: Acq92OEerNqNKTu12pf7Ckho/ckBVDkuy8MAvOIguCXkGoeOv0ITg8dQaVD+6MNACQ7
	O1lxLcPorL/91ZUw8gIILuY4cyQpvYsEC9fV8iiHdGXTq3MTieXdLI8MLZU2w47x+IpTqLA0t+O
	yaCiBJmRANjyq0RS/LgcUC6wZVdFM5/n/UyipdDKmVTO52QHMqSTgG57W6eEp7mTw0uKzK4VF9x
	CV25Q4xDR0jGyG1529SzjnUoEioTTZejvq4loDl+QBUGhJvOVGp81MIFBvIpFzQjPz0sGmtAFT7
	IZAPXDydDGA57vPmdjMBUhyPGENWJkp7IEhlOH8QSGJmwknsOlg9D7p0JyN3hnXoShZfDwDcT2Y
	4/9kM1GlTzMfTKeWfe2iBuA7tEQlMl2yy1znKXtMbQj5WzeN5iPEOsFyf3VCc8aUqEl9bxCZ2HT
	FyUOuA0DgNY92cUEQZ/LYG56xlskxckKig6KPwOWRxubMBNnJEwLms5hvZjw==
X-Received: by 2002:a05:7022:250c:b0:137:64ad:76d0 with SMTP id a92af1059eb24-13985e99350mr720917c88.7.1781576469334;
        Mon, 15 Jun 2026 19:21:09 -0700 (PDT)
Received: from google.com ([2a00:79e0:2039:4:7d96:5166:93ee:6926])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b919ef9sm12517464c88.7.2026.06.15.19.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 19:21:08 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:21:02 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, luke.r.nels@gmail.com,
	xi.wang@gmail.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, alex@ghiti.fr,
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, marscheng@google.com,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 0/3] riscv, bpf: Fix signed operations and
 add 32 bit atomics
Message-ID: <ajCzDo7bnUqE0DiW@google.com>
References: <20260511221648.3251464-1-visitorckw@gmail.com>
 <ajAlwK990NFUAMwq@google.com>
 <216ee1df-2945-4266-9c70-ebcd36faeb7f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <216ee1df-2945-4266-9c70-ebcd36faeb7f@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_192110_403346_5E7B105D 
X-CRM114-Status: GOOD (  30.05  )
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

Hi Lehui,

On Tue, Jun 16, 2026 at 09:41:21AM +0800, Pu Lehui wrote:
> 
> 
> On 2026/6/16 0:18, Kuan-Wei Chiu wrote:
> > Hi,
> > 
> > On Mon, May 11, 2026 at 10:16:45PM +0000, Kuan-Wei Chiu wrote:
> > > Fix miscompiled signed operations and expands 32 bit atomic support in
> > > the RV32 BPF JIT.
> > > 
> > > The current implementation ignores the instruction offset field used by
> > > the bpf instruction set to specify BPF_SDIV/BPF_SMOD and BPF_MOVSX.
> > > This causes these operations to be treated as unsigned or
> > > zero-extended, leading to test_bpf failures. Fix this by checking the
> > > offset and emitting the correct instructions.
> > > 
> > > Additionally, we leverage the mandatory A extension to natively support
> > > 32 bit bpf atomics (and, or, xor, xchg) by mapping them directly to
> > > amo*.w instructions. BPF_CMPXCHG continues to fall back to the
> > > interpreter.
> > > 
> > > As a result, test_bpf.ko now runs with 0 failures, and the total number
> > > of successfully JIT'ed test cases increases from 843 to 902.
> > 
> > Is there anything else I need to do for this patchset to land?
> 
> Hi Kuan-wei, it seems Luke and Xi haven't been as active in the community
> for a while, I'll make time to cover the review and testing for this.

Thank you for stepping in to help with the review and testing.
I really appreciate it.

Since Luke and Xi haven't been active for a while, I was wondering if
we should consider updating the MAINTAINERS file to reflect the current
status?

Also, if you need extra hands, I'd be glad to help review and test
future RV32 BPF patches.

Regards,
Kuan-Wei

> 
> Regards,
> Lehui
> 
> > 
> > Regards,
> > Kuan-wei
> > 
> > > ---
> > > - Add missing Fixes tags.
> > > - Fix memory ordering by emitting aq=1, rl=1
> > > 
> > > Kuan-Wei Chiu (3):
> > >    riscv, bpf: Fix support for BPF_SDIV and BPF_SMOD in RV32 JIT
> > >    riscv, bpf: Fix support for BPF_MOVSX in RV32 JIT
> > >    riscv, bpf: Add 32 bit atomic operations to RV32 JIT
> > > 
> > >   arch/riscv/net/bpf_jit_comp32.c | 101 +++++++++++++++++++++++++++-----
> > >   1 file changed, 85 insertions(+), 16 deletions(-)
> > > 
> > > -- 
> > > 2.54.0.563.g4f69b47b94-goog
> > > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
