Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E232C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:56:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 180B861284
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 180B861284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M2p02pPJ1yOwNdTeWO7K/gil5Lj1g2d/vrlKsdk4Ixo=; b=H9qfwzJULmLojqmh5n+Cu8HD5
	vqO1lmHr3aPrlvxU/EZzOGH9Tvv1jiJrl6hiNpFFZMdkmjXnzKGzn7UwVhNOenZSIlQVPJU0Q5uzo
	ZGXOOI52NkU4n/BhlQrD0Z0lcFK6HQTCYw5jaPDHFd0ivTz+SGk8Q6rJJEtYBHgVP8ggZmYp5GABZ
	+kxxmuWLlN9gEtI8GJjPIpY3o75aLMuiVVA9lkJDChJA8qieuClwECQFJgborvWUKOfHC2/l6AGrr
	Fv4dmy/sqsUnKwS9pCLxOh2T8sVlFtYCau0JCG5wFDRMOywYZUyqoMt5jjctsXuqB5SUgpa1q8580
	T8Z6Pcn3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThVj-001uoN-Ib; Tue, 06 Apr 2021 08:56:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThVf-001unh-Iw
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 08:56:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id ay2so7114514plb.3
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 01:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9xdIx72BUryR8S57j/82YwQXQXS2KpU1UgBOV30ECIY=;
 b=TgIHqrGywgKnXMNklZnPmsxbnxfQhVs1/eip8i8YiMxdQR4RjRlUfUxvxL630b2ohO
 rj2MijmqaoRwFrfwquFATd9n3hub69GPxaoNcqnBz2I7sZK6VJYlluvXsDtx5mHIhdhs
 ZNb8vVejIeFztXXuQziXLhO2PBkkuOPLaeAZQ1hJVhNn/vgj04P4CaddpoOm6SftW7YY
 mCSjyGZWcprkJpY1wYgKpI/0r6PjQN0c36Ji2kzFWI7fulQOkeaQxbkYvtYeOHDTT01N
 oSjFXgnoLMaxPKM3mKNKMvqL16eyPYfI2+5st9Fnd4OUC03rXpzroRXoDUX8jVZr9GwA
 DHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9xdIx72BUryR8S57j/82YwQXQXS2KpU1UgBOV30ECIY=;
 b=TyGECXGNERb/6+lkYgTfUrr/x7y9GtueZ+suflk0eUVXbjByTgT+0LwcuvbHMmjMDi
 ATK/vT+H2xv+SPc0d3zdgEtSeHXUU9GVvwAnA7avYpg5qvmrgTtsxxX1LeoDr/QtanoA
 Uur/nutGvyD9o9LvqPfTl4Ce6CHXIGi8Ao0YC/svd8nNqTM549FtJv7+atYwKsVHxx7r
 tx+SnB45ORJBrFtbltZ70ylXncyPRhIeNSgRJTxkBGuj45zgWhfzWymep8RxwGAg/HZ5
 CjMygRvycBkUdymZdzKpGQ+AwEHuYiozisMVSaAW0kPH5L6/Br5gN9z67ia2JDqNuQ9/
 X+0g==
X-Gm-Message-State: AOAM531iuf3T7W+GsBvmcE5zuJjQxUBGCwaiEritFRcOdBAxW0Q6SQRm
 CYySVmbsJnJsHB2ItAQv+tg=
X-Google-Smtp-Source: ABdhPJzAV+gapYt2uFLFIiAFJ65qO40DcQUfQ8+y2O+oaBxM0IvPkfh4oGm033rNZm2YGkXRZY273A==
X-Received: by 2002:a17:902:d30b:b029:e8:dc10:86fb with SMTP id
 b11-20020a170902d30bb02900e8dc1086fbmr13105385plc.46.1617699390137; 
 Tue, 06 Apr 2021 01:56:30 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 s2sm2010583pjs.49.2021.04.06.01.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:56:29 -0700 (PDT)
Date: Tue, 6 Apr 2021 17:56:26 +0900
From: Stafford Horne <shorne@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <20210406085626.GE3288043@lianli.shorne-pla.net>
References: <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
 <20210330223514.GE1171117@lianli.shorne-pla.net>
 <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
 <CAJF2gTRxPMURTE3M5WMQ_0q1yZ6K8nraGsFjGLUmpG9nYS_hng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRxPMURTE3M5WMQ_0q1yZ6K8nraGsFjGLUmpG9nYS_hng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_095631_723220_5AAC1CB5 
X-CRM114-Status: GOOD (  24.30  )
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

On Tue, Apr 06, 2021 at 11:50:38AM +0800, Guo Ren wrote:
> On Wed, Mar 31, 2021 at 3:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Mar 31, 2021 at 12:35 AM Stafford Horne <shorne@gmail.com> wrote:
> > >
> > > I just want to chime in here, there may be a better spot in the thread to
> > > mention this but, for OpenRISC I did implement some generic 8/16-bit xchg code
> > > which I have on my todo list somwhere to replace the other generic
> > > implementations like that in mips.
> > >
> > >   arch/openrisc/include/asm/cmpxchg.h
> > >
> > > The idea would be that architectures just implement these methods:
> > >
> > >   long cmpxchg_u32(*ptr,old,new)
> > >   long xchg_u32(*ptr,val)
> > >
> > > Then the rest of the generic header would implement cmpxchg.
> >
> > I like the idea of generalizing it a little further. I'd suggest staying a
> > little closer to the existing naming here though, as we already have
> > cmpxchg() for the type-agnostic version, and cmpxchg64() for the
> > fixed-length 64-bit version.
> >
> > I think a nice interface between architecture-specific and architecture
> > independent code would be to have architectures provide
> > arch_cmpxchg32()/arch_xchg32() as the most basic version, as well
> > as arch_cmpxchg8()/arch_cmpxchg16()/arch_xchg8()/arch_xchg16()
> > if they have instructions for those.
> >
> > The common code can then build cmpxchg16()/xchg16() on top of
> > either the 16-bit or the 32-bit primitives, and build the cmpxchg()/xchg()
> > wrapper around those (or alternatively we can decide to have them
> > only deal with fixed-32-bit and long/pointer sized atomics).
> I think these emulation codes are suitable for some architectures but not riscv.
> 
> We shouldn't export xchg16/cmpxchg16(emulated by lr.w/sc.w) in riscv,
> We should forbid these sub-word atomic primitive and lets the
> programmers consider their atomic design.

Fair enough, having the generic sub-word emulation would be something that
an architecture can select to use/export.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
