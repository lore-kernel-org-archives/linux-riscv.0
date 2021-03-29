Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85E0C433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:59:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55EBF6191B
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55EBF6191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pVGuQ2/MrNhJzQu09SBYVgAkVuhMQ1crEJthHfESbu8=; b=dKaYA3ztOXXav7Sp/r6AihDn7
	KVcQeIYBGy304ZLeU62cc8sq0lKmfnTlSGQA6tMwCyNXT7DomBh1vWNgz+qj/o2Z+oElJwDBWAhYi
	bGfdCCSxUTTZXNsjlC3ckQMsOYbktzz8UV3D94HHsajC+KKbJjMyZ1Xg5548xwaeIerAXRp+hUFLd
	HPJji/vnBgAWRcfBwqTNlc1Sr243VQyhbSg5oppYv0sXNV3JtlKq5XLqu3psjiFMVVptBd5b4KkwO
	Kk9MC9WA2UylBzFcYLX4xmP4z2EOmeKZwgRotmXmMrZs2Z2Og/v5nuEngU3ro6mvs52Yf5fpk3q+y
	arTKdwcLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQx6t-0019Zt-PJ; Mon, 29 Mar 2021 18:59:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQpvv-000c7f-SM
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 11:19:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3EA861960
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 11:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617016783;
 bh=j7SIgfFWVMLoa2fKOiGrGvajt0FjTnG/iQTsS4gCWqk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TRN0Z1gYRmqitX93RlaUC6iVVV7WruEq3OX0U9qDy196s2YWn5MaRe0aPdnRYq2Au
 W+MqU7GUzGtTv7znLNaBM9+TH5h4ZWm8/vhYdoT64WPyXAk9yPP+HeG05tKz15A+JL
 dJkM8HKANH1/62z1Ui3/AMDEEp5l+ZJODfBwys+aV9wVusiNZmCBV+/lB1mZa1cVKs
 tmkSLgVNOx/CS640rJFLlwM05DoDOiiiCFAPF2W3y7sCMLjHWm3YillEpJSVk3wubQ
 TnBrfi9iydKWYLDIPRGDG5Zq5qlY0fcmykBfp9ylVZMLpuaZP+Sn+0cuQpXf5Egbhe
 jBrvRbpsbpkCg==
Received: by mail-lj1-f176.google.com with SMTP id s17so15470530ljc.5
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 04:19:42 -0700 (PDT)
X-Gm-Message-State: AOAM532HFryPWAstScdatpLOOGzGwcx1bIZuD8LV6g8pabBZqpaQLTGu
 S2d4Hhl4fdevx7iUj8MvKiI4QIIykrvlRrsdn3M=
X-Google-Smtp-Source: ABdhPJyqN0jUJ06ve3rtXE5fF7gRq//Pm5/j6JGVeUsiDXKkjGEaSyxfsLRRZG3qNTABD5ko9AsHaFW6yGsSFlpEatk=
X-Received: by 2002:a2e:994e:: with SMTP id r14mr17623961ljj.115.1617016780900; 
 Mon, 29 Mar 2021 04:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
In-Reply-To: <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 29 Mar 2021 19:19:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
Message-ID: <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_121948_104220_F2490073 
X-CRM114-Status: GOOD (  17.72  )
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

On Mon, Mar 29, 2021 at 3:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sat, Mar 27, 2021 at 06:06:38PM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Some architectures don't have sub-word swap atomic instruction,
> > they only have the full word's one.
> >
> > The sub-word swap only improve the performance when:
> > NR_CPUS < 16K
> >  *  0- 7: locked byte
> >  *     8: pending
> >  *  9-15: not used
> >  * 16-17: tail index
> >  * 18-31: tail cpu (+1)
> >
> > The 9-15 bits are wasted to use xchg16 in xchg_tail.
> >
> > Please let architecture select xchg16/xchg32 to implement
> > xchg_tail.
>
> So I really don't like this, this pushes complexity into the generic
> code for something that's really not needed.
>
> Lots of RISC already implement sub-word atomics using word ll/sc.
> Obviously they're not sharing code like they should be :/ See for
> example arch/mips/kernel/cmpxchg.c.
I see, we've done two versions of this:
 - Using cmpxchg codes from MIPS by Michael
 - Re-write with assembly codes by Guo

But using the full-word atomic xchg instructions implement xchg16 has
the semantic risk for atomic operations.

I don't think export xchg16 in a none-sub-word atomic machine is correct.

>
> Also, I really do think doing ticket locks first is a far more sensible
> step.
NACK by Anup

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
