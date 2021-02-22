Return-Path: <SRS0=ovIN=HY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE4EC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 22:39:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75D8864E21
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 22:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75D8864E21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QhkdMo4h9/sJgFpPIHpZgG4CgibA0AlGhn7acWS0yGM=; b=HPa5g1IHZHJwoai5TFQbY8BIs
	r4TiOBNRLbDfx1CPjSPcXqbM1wu/16zo6CL2pm8/z5fKjrCuBy0yiQrxd0jSntdlSeMH2Hn1TYaDG
	ijqaf1X58SoieWBgxL0n1q4AscAONSRN4D9B+mBeBlpxij7YrZyh3/Bn4xCukN/UCdTUSe8+W1pVE
	mLlRRFHE7V64zcPQUcHafLlSI/9Exc7CvQOpvmaXX2y+QJvi1vyAUSBqSc1JLAXeyQ/62smI2I1yb
	wVyY6I9MaKdcihM2oGLYwzaMasOL7AqeLDLmae7eOVuyQ+bm2Il50blqCWZt8GXkFH9fryIdQVVjx
	pMu1v3kgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEJqo-0007Yt-Ed; Mon, 22 Feb 2021 22:38:46 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEJql-0007Y8-A9
 for linux-riscv@lists.infradead.org; Mon, 22 Feb 2021 22:38:44 +0000
Received: by mail-il1-x12d.google.com with SMTP id q5so12340386ilc.10
 for <linux-riscv@lists.infradead.org>; Mon, 22 Feb 2021 14:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v+bRTmjwUn3uBzqoT+jMaNbtbzbUVi4q8qV4RGj6hQY=;
 b=EgH6YhENDcXw0kF2Lm0gvd7DSF0AdF8mGL6MkxAGbZ1FixDC4XmaEkJfB9fe7SpEsC
 EHYkrqPUje5df/yuI6UDgecqj1IdaGuAt3d/6+P26Q5ZCrJ73BdFlXECVIXsZucTCN3X
 wHbCC6rZvQJLYOdgvF0Mf92a26AbdPv1GvvWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v+bRTmjwUn3uBzqoT+jMaNbtbzbUVi4q8qV4RGj6hQY=;
 b=jePm7RDu6tq4h+LidV1mKDYEY2kWCq4bwdUO9w4YE0ew6Swv6CgWn1/559wpMa1i6k
 Nt2iMKTl8fT/ojQE0ZVzDw/nKahOBhcRtMoeGhFH7FOV5Of41Kqp0lAiSHtSQB3QuKHE
 jTRh3t0LnAqB0XwHgs9ehS4Lfh7nvBO9kA3yNT7MUb03da0UdvCX49kypN7TqSQ7s6X0
 Vqebtv7pN8foJqBfx09s699hGGEuGkhKw3Cf2EIthNjQfc0N8Akj1jKNUfWigNubIbhs
 5KQwxlB6oVRBi1QrlmMmbEUt0fh4V6UPr4rqDfJ4XIYXm9g9H4LlxgU1PYySiEeThIiO
 8efg==
X-Gm-Message-State: AOAM530A3+3BkpSMp690Cabm6n8omno/7QZd+Dt498dDuVec1Yg61ERN
 P2g02lm6I5TDklyG98vioGDyYqvX9gGXsjS1EkTj
X-Google-Smtp-Source: ABdhPJw2TIj0o52iS6C93kPC5ubNmLckikW0/NOuSjuDGxRpxJiLWiY/8Uw03gMhec9boJyB0dzpYovmHDPrLT3gaes=
X-Received: by 2002:a05:6e02:4a3:: with SMTP id
 e3mr16432525ils.77.1614033519752; 
 Mon, 22 Feb 2021 14:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20210204052643.1608586-1-atish.patra@wdc.com>
 <20210222202241.GA82802@roeck-us.net>
In-Reply-To: <20210222202241.GA82802@roeck-us.net>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 22 Feb 2021 14:38:28 -0800
Message-ID: <CAOnJCUJq4Gfd_YvJz5K2yFwmsSiB3LDM6rSQ2d+O+jV8b0z_wg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add a non-void return for sbi v02 functions
To: Guenter Roeck <linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_173843_503945_9DFB2EC9 
X-CRM114-Status: GOOD (  18.56  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 22, 2021 at 12:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Feb 03, 2021 at 09:26:43PM -0800, Atish Patra wrote:
> > SBI v0.2 functions can return an error code from SBI implementation.
> > We are already processing the SBI error code and coverts it to the Linux
> > error code.
> >
> > Propagate to the error code to the caller as well. As of now, kvm is the
> > only user of these error codes.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> ...
> >  #else /* CONFIG_RISCV_SBI */
> > -static inline void sbi_remote_fence_i(const unsigned long *hart_mask) {}
> > +static inline int sbi_remote_fence_i(const unsigned long *hart_mask) {}
>
> Error log:
> In file included from arch/riscv/kernel/setup.c:29:
> arch/riscv/include/asm/sbi.h: In function 'sbi_remote_fence_i':
> arch/riscv/include/asm/sbi.h:150:1: error: no return statement in function returning non-void
>

Sorry for the oversight. The return statement is missing.

@Palmer Dabbelt : Can you fix it in for-next or should I send a v2 ?

> Guenter
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
