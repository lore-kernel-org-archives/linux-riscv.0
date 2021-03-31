Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13356C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 15:11:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A58C660D07
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 15:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A58C660D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gjvhbJ47ZarLONlmDeMl1Ge9XrDt1wMggL7270FMD2c=; b=qVr6Q4mKNLPgxsEoq03+vQmLo
	J4mffnVRurX8DgY5NyXEcqZjWUCcDNMB0hpK+gFT65NtTZeQkdOHc1kRWWBs0dVf6RvJzJHEztSvU
	Lr3ZpMv7j6b7DPlvPEteqVFj5swnMnva2oFbD3EyRv/qoV1pPQGGFdJDJzERDlQVT6X8M0xZxVepk
	f2QnukuATO5C0lUwmtsHbgQa3FmapBRMyEPkj+twGVMIHWZ07tifPRpZr1FJDSuX6OtnzdcIP01A/
	i8yCkv8Zn9b+gcPLlw6pZI+ebRN2+iuy3qDMzYs3hGrglnminNy1u9+1psFQ0AYAmhSEN40ZoyEa+
	+X57Rjt2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRcUz-006sAP-NT; Wed, 31 Mar 2021 15:11:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRcUv-006s9v-6O
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 15:11:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 611D86101C
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617203467;
 bh=TbOY0j6r4pK8GJkDQSSBT0PG2JRtiy2xv/ZAq0i48Ss=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hdH3tDlHe+07OFGfYhY+WigjDnxq+BZOrIr3z28vnHUCREYXNBXiiyfLMq45Gz4KD
 OXTKoAe6fIzf39nk/ohjZVjQ1itgFk8Qp7wtUj5WoeoEHQro70UWqsoWoJxe7re/0Y
 6R7//wzNDqhwwgl4SytvcYDcdeHl4EdVx3OUPhvRV4uVo1SzXuOU4Knk7H0MNCXtA/
 S/GGFBx9Rhaatf9dcX1UnKeh3p0W49ISNoSuBRj7iXZEP5EOYSi7/qExjdDebJCO7T
 CsiZ2SSZkKJBL9FYKokkMNDMbDG5dbZalbZvz1oMcfS4EMnDrD86Djzl8IhGuG8QcH
 qBZg0qd+DfMzQ==
Received: by mail-lf1-f45.google.com with SMTP id m12so29638046lfq.10
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 08:11:07 -0700 (PDT)
X-Gm-Message-State: AOAM533hVD88ZjaDU9JxvrIiaB1DGOlT1UvZW7lZwV738oMbELiXM9Zl
 n+3AxrwAN+OSFtDOcTqOOzRRu4qMDpxQYXQJbOU=
X-Google-Smtp-Source: ABdhPJxs/JOsMnXbAvQoHRYQUiHPUCi/rrjdiOo3Uk29mwIYM4PTu1vWQ44R+zMcgoxUlGYwTQK+40BUJaSfUaObY3M=
X-Received: by 2002:a05:6512:3709:: with SMTP id
 z9mr2415095lfr.557.1617203465685; 
 Wed, 31 Mar 2021 08:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
 <20210330223514.GE1171117@lianli.shorne-pla.net>
 <CAK8P3a0hj2pYr-CuNJkjO==RafZ=J+6kCo4HTWEwvvRXPcngJA@mail.gmail.com>
 <20210331123107.GF1171117@lianli.shorne-pla.net>
In-Reply-To: <20210331123107.GF1171117@lianli.shorne-pla.net>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 31 Mar 2021 23:10:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRZOFL_LECFcg6nEzNaDA_MR4dhxygFwm1_sDKY9CzBPA@mail.gmail.com>
Message-ID: <CAJF2gTRZOFL_LECFcg6nEzNaDA_MR4dhxygFwm1_sDKY9CzBPA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Stafford Horne <shorne@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_161109_590598_A7A68E01 
X-CRM114-Status: GOOD (  22.81  )
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

Hi Stafford,

How do think add ARCH_USE_QUEUED_SPINLOCKS_XCHG32 in openrisc?

https://lore.kernel.org/linux-riscv/1617201040-83905-7-git-send-email-guoren@kernel.org/T/#u

On Wed, Mar 31, 2021 at 8:31 PM Stafford Horne <shorne@gmail.com> wrote:
>
> On Wed, Mar 31, 2021 at 09:23:27AM +0200, Arnd Bergmann wrote:
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
>
> OK.
>
> > I think a nice interface between architecture-specific and architecture
> > independent code would be to have architectures provide
> > arch_cmpxchg32()/arch_xchg32() as the most basic version, as well
> > as arch_cmpxchg8()/arch_cmpxchg16()/arch_xchg8()/arch_xchg16()
> > if they have instructions for those.
>
> Thanks for the name suggestions, it makes it easier for me.
>
> > The common code can then build cmpxchg16()/xchg16() on top of
> > either the 16-bit or the 32-bit primitives, and build the cmpxchg()/xchg()
> > wrapper around those (or alternatively we can decide to have them
> > only deal with fixed-32-bit and long/pointer sized atomics).
>
> Yeah, that was the idea.
>
> -Stafford



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
