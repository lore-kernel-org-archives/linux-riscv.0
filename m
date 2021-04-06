Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960CEC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:51:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC04613C0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC04613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/XYmnH6ToPfN+XjsUzZdmWKOZvgKK3STJ2iGIj96gx4=; b=J0oUEbCvS2AB5kCxCBrayLana
	0HKn0T/mpM87HFmUTxlNOMLZ4PWfXCYCbMz7KS/SWyzx1t8h2pDeA5mVfOhObIueYXADG8vARZ7eR
	GYhoH3B9wA3dGRyvpC82IZUbo/KPqZ4iWvlArfnm1pm0mhtSUhv1nV0JaFPawOD15yQDSfVoXw7me
	fW4LGPylaLRBC/68hfABD2piUCh4/00q+opRgjREwKt15rc9tPBEVouD9R5WzWlb/VGd9VaihLSkt
	aej/M79241UBPAMl0lEXnyqLe+x4psIJzU/MnvuPwslXcgcx9rvA8y2iKdLE6WjiBeM9rJGn2/UM0
	cG0xJlBJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThQd-001uE4-W5; Tue, 06 Apr 2021 08:51:20 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThQZ-001uCP-Dg
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 08:51:17 +0000
Received: by mail-pf1-x431.google.com with SMTP id 11so8225740pfn.9
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3s3OaRvgpy/TZIHwX6L6iy09Z97u8+dAODkZWJWz5kI=;
 b=drOm0AhBZgUdpIqEdIBofvJMXa1uF5tw8a7cBmW1ztc+qdtPP9uPQeSvZ8Jzu3k50f
 kANNA7ftms9q+521RHPDkK1GMgurSEHEBmirCZYsBQ38gTh+KNbDBKz4NJZIpSWm6Tcl
 yOW6/RymAKvlT2UNXJDV/HDi53FweuR6y+fKKezBaDMRtsd6KUQ/W+Af41wME5kNpmbc
 wbxiFJPEy939djZlx2R6YLI0qADTjIyjrd6ekd5HDVYkkBtuqefZIrEthOQ0pVNrSE1i
 pMAs6nbOipZ8vDoeX0cWQZRXM5bgVKRo5sZTgtMgimOOOytP0Q9VROUvUfK3Us1lRb4r
 0EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3s3OaRvgpy/TZIHwX6L6iy09Z97u8+dAODkZWJWz5kI=;
 b=Vd5fH5XahQRgVPfz7KodP0oar0u1dbtDY+1tcLNrB0tZ2Q/D1vCY+++s43pgxqN+yp
 C7P7fQnehVQHy1PMxQ3bDmFBiRfXv6ztHfFMYG3KJyQKYjZ+bR8e7cmB6vIzK2D/+CXm
 JtWUnsLqGhdjoFeikvnH9g2mhZc5WIoacO5AreNSDd3BGLaCMTkEzXFYc27lx1+bic6A
 UOnt+sSRJBYGeIZB575GSxrFQuTvSmRkQg3uttKe7MxIpUdqkS7Xegc9ksGyBoHUt9a+
 68psAriAUBIsB2PcD3kFi/95wbtN9I1Buo0dBp6ZHGktbNZpeHgDwQaFlF9F5vuItQ4h
 tNxg==
X-Gm-Message-State: AOAM532zT/GOpiRod1eRjsKYLSeHpWs/sVriGePc/iKApMaaD/hdwiJU
 HOROM6JWO+dcuRlG0oCjOhU=
X-Google-Smtp-Source: ABdhPJxlmcgNGraqfD41wyW8CXG4LKOYjNrrHUrbmV1G5tnOG/PBzweJ0HEoZ1rCS0Uqw5DHe6+M8w==
X-Received: by 2002:a63:f950:: with SMTP id q16mr2968746pgk.138.1617699073451; 
 Tue, 06 Apr 2021 01:51:13 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 l10sm17133549pfc.125.2021.04.06.01.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:51:12 -0700 (PDT)
Date: Tue, 6 Apr 2021 17:51:10 +0900
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
Message-ID: <20210406085110.GD3288043@lianli.shorne-pla.net>
References: <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
 <20210330223514.GE1171117@lianli.shorne-pla.net>
 <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
 <20210331123107.GF1171117@lianli.shorne-pla.net>
 <CAJF2gTRZOFL_LECFcg6nEzNaDA_MR4dhxygFwm1_sDKY9CzBPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRZOFL_LECFcg6nEzNaDA_MR4dhxygFwm1_sDKY9CzBPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_095115_569009_87743F3F 
X-CRM114-Status: GOOD (  27.33  )
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

On Wed, Mar 31, 2021 at 11:10:53PM +0800, Guo Ren wrote:
> Hi Stafford,
> 
> How do think add ARCH_USE_QUEUED_SPINLOCKS_XCHG32 in openrisc?
> 
> https://lore.kernel.org/linux-riscv/1617201040-83905-7-git-send-email-guoren@kernel.org/T/#u

Sorry I missed your mail here.

It is true that OpenRISC doesn't have xchg16, so using the xchg32 code is better.

Acked-by: Stafford Horne <shorne@gmail.com>


> On Wed, Mar 31, 2021 at 8:31 PM Stafford Horne <shorne@gmail.com> wrote:
> >
> > On Wed, Mar 31, 2021 at 09:23:27AM +0200, Arnd Bergmann wrote:
> > > On Wed, Mar 31, 2021 at 12:35 AM Stafford Horne <shorne@gmail.com> wrote:
> > > >
> > > > I just want to chime in here, there may be a better spot in the thread to
> > > > mention this but, for OpenRISC I did implement some generic 8/16-bit xchg code
> > > > which I have on my todo list somwhere to replace the other generic
> > > > implementations like that in mips.
> > > >
> > > >   arch/openrisc/include/asm/cmpxchg.h
> > > >
> > > > The idea would be that architectures just implement these methods:
> > > >
> > > >   long cmpxchg_u32(*ptr,old,new)
> > > >   long xchg_u32(*ptr,val)
> > > >
> > > > Then the rest of the generic header would implement cmpxchg.
> > >
> > > I like the idea of generalizing it a little further. I'd suggest staying a
> > > little closer to the existing naming here though, as we already have
> > > cmpxchg() for the type-agnostic version, and cmpxchg64() for the
> > > fixed-length 64-bit version.
> >
> > OK.
> >
> > > I think a nice interface between architecture-specific and architecture
> > > independent code would be to have architectures provide
> > > arch_cmpxchg32()/arch_xchg32() as the most basic version, as well
> > > as arch_cmpxchg8()/arch_cmpxchg16()/arch_xchg8()/arch_xchg16()
> > > if they have instructions for those.
> >
> > Thanks for the name suggestions, it makes it easier for me.
> >
> > > The common code can then build cmpxchg16()/xchg16() on top of
> > > either the 16-bit or the 32-bit primitives, and build the cmpxchg()/xchg()
> > > wrapper around those (or alternatively we can decide to have them
> > > only deal with fixed-32-bit and long/pointer sized atomics).
> >
> > Yeah, that was the idea.
> >
> > -Stafford
> 
> 
> 
> -- 
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
