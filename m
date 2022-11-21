Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D14C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qu9Vo0er+G3qoj+2h9XEklt4uHeDWSDRiSt89OFWidM=; b=jKHcz+9h9ZD+Bu
	TrXZD/A1/s4dWZeneEuvIFasQpMFN5NwejXvUirx3+/gPvrcOX042VBZSbVjW76d0nMua23YLH8qV
	mlwxzdNHTLQA1VbufMFzp1AVGlKNopXvsJ7Bh4YqvbySBP4sck3QGHv0qbdhXOQPyNOkM5p7wBLgj
	YKNk65JaFSJ9jwj7QBihokvREK3nbKzKFYyFn1keU/RCwl7Hp9vyW85ma13C5tajFV059sjpR0Ns3
	UHNEpRNXd+I++BxM7AShZYWn3HphunnAh/satrFU+TeWmIusA3vIAF/6HWl1kTsdVlth7k4MtuV2H
	SoEdBpRYGxto6RUnenlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxD0r-00HQjx-Pm; Mon, 21 Nov 2022 20:03:29 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxD0p-00HQfL-A2
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 20:03:28 +0000
Received: by mail-lf1-x129.google.com with SMTP id j16so20411523lfe.12
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 12:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmYuX3VWcUYVzqGRCyga5UCUeirZrcUXT/K4ry4R96E=;
        b=VPP1K0/QOou9Lh89QKLdRSbxua06FbJPCj1mshq/bGLSyN6grxpijaPYSkM/KmrlhM
         qR1UcalqIr3wk9nNOqAnVqE1L8VVKfKjuqMuAbK/FN43jFEHPQ0oAcnGsTF6VgxsD3Vo
         HFs8QPw1DetuS282+KNF7ccYaImpCI03q92fv2rxptwsgCU+kDFVG3pnCgz3w6qFcFV/
         jKnIhZ5yyj3lhjDaeb1ClBNWyuXNkHrPQG34WPIlENaDpfoQLVt2fhfHRB0tBKIs5WS6
         wu+7Wrjg4ONPnicq9VVhHlqOaXkUb+LbRrR++EYPXKjhUWuVvKxhmAsC6yIewVVxX0ey
         aFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmYuX3VWcUYVzqGRCyga5UCUeirZrcUXT/K4ry4R96E=;
        b=mOyr/m+/+G0xeq4h+jVZ8ILJF8LnKGK+zSN+X5ZxJgDALeIQE7n+8SBR+Tu3nk+Ssv
         PS1IKqLkBFua7P6SV3zUJmg4EICNQV4/Afh+1ojXjYP04Ijwl9f5cRFhTi2ko4f11RCk
         nve6ZKqvQxNgJUdzVnMHhxZUnI/yibpF8jssV+NySGJobXe8kgZkL/U8jXoSxb7sYHhO
         eB56C/Hza7kESX4s+l06lKCbahGcjyXzIri6+Au3BlUq59ZdH1Ktdj4ZhL4c1Je9mKDG
         PqWvee2et8ZwsHmehA+RloRsdKCPAZK3t0ei7lc92QgGEpquPotHA5d9dH1XRMyZwDgG
         FRYw==
X-Gm-Message-State: ANoB5pnE0IvyHmbhrxxJ5fHMNSgq2FJHhK9Es7LLma+kz2QyWc4k0VMb
	UcbmY96/Imx8BZEi+FnKFY8=
X-Google-Smtp-Source: AA0mqf4ByMquJSxW5az0K/kINNMf2X0ta7kjCVg3nJKQjKuqgGl03pdZOY0hXqvXcN01v53k3Ju9FQ==
X-Received: by 2002:a19:6519:0:b0:4b4:b5d7:a70b with SMTP id z25-20020a196519000000b004b4b5d7a70bmr6357266lfb.584.1669061003431;
        Mon, 21 Nov 2022 12:03:23 -0800 (PST)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id n16-20020a195510000000b004aa255e2e66sm2171955lfe.241.2022.11.21.12.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:03:22 -0800 (PST)
Date: Mon, 21 Nov 2022 23:03:21 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de,
	philipp.tomsich@vrull.eu, alex@ghiti.fr, hch@lst.de,
	ajones@ventanamicro.com, gary@garyguo.net, jszhang@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH V3] riscv: asid: Fixup stale TLB entry cause application
 crash
Message-ID: <Y3vZiYDpL73O3FNK@curiosity>
References: <20221111075902.798571-1-guoren@kernel.org>
 <Y3fxsWPLPlKGfMBj@curiosity>
 <CAJF2gTRQgqRwjOYKB9Z6OdYoogsHWWVTw5anwNqoQjhmK_A41g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRQgqRwjOYKB9Z6OdYoogsHWWVTw5anwNqoQjhmK_A41g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_120327_384330_C38C9C8F 
X-CRM114-Status: GOOD (  30.33  )
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

Hi Guo Ren,

> > > After use_asid_allocator is enabled, the userspace application will
> > > crash by stale TLB entries. Because only using cpumask_clear_cpu without
> > > local_flush_tlb_all couldn't guarantee CPU's TLB entries were fresh.
> > > Then set_mm_asid would cause the user space application to get a stale
> > > value by stale TLB entry, but set_mm_noasid is okay.
> >
> > ... [snip]
> >
> > > +     /*
> > > +      * The mm_cpumask indicates which harts' TLBs contain the virtual
> > > +      * address mapping of the mm. Compared to noasid, using asid
> > > +      * can't guarantee that stale TLB entries are invalidated because
> > > +      * the asid mechanism wouldn't flush TLB for every switch_mm for
> > > +      * performance. So when using asid, keep all CPUs footmarks in
> > > +      * cpumask() until mm reset.
> > > +      */
> > > +     cpumask_set_cpu(cpu, mm_cpumask(next));
> > > +     if (static_branch_unlikely(&use_asid_allocator)) {
> > > +             set_mm_asid(next, cpu);
> > > +     } else {
> > > +             cpumask_clear_cpu(cpu, mm_cpumask(prev));
> > > +             set_mm_noasid(next);
> > > +     }
> > >  }
> >
> > I observe similar user-space crashes on my SMP systems with enabled ASID.
> > My attempt to fix the issue was a bit different, see the following patch:
> >
> > https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@gmail.com/
> >
> > In brief, the idea was borrowed from flush_icache_mm handling:
> > - keep track of CPUs not running the task
> > - perform per-ASID TLB flush on such CPUs only if the task is switched there
> >
> > Your patch also works fine in my tests fixing those crashes. I have a
> > question though, regarding removed cpumask_clear_cpu. How CPUs no more
> > running the task are removed from its mm_cpumask ? If they are not
> > removed, then flush_tlb_mm/flush_tlb_page will broadcast unnecessary
> > TLB flushes to those CPUs when ASID is enabled.
> A task would be migrated to any CPU by the scheduler. So keeping TLB
> contents synced with cpumask_set/clear needs additional tlb_flush just
> like noasid, and your patch still follows that style. The worth of
> ASID is avoiding tlb_flush during the context switch. Yes, my patch
> would increase some tlb_flush IPI costs. But when mapping is stable,
> no tlb_flush is needed during the switch_mm (Hackbench would be
> beneficiary because no more TLB flush is needed at his hot point
> path). Here are my points:
>  - We copied the arm64 globally unique asid mechanism into riscv,
> which depends on hardware broadcast TLB flush. My fixup patch is
> closer to the original principle design, proven in the arm64 world.
>  - If riscv continues local TLB flush hw design in ISA spec, please
> try x86's per-CPU array of ASID. But that is a significant change;
> let's fix the current issue with the smallest patch first.
> 
> In the end, thx your review and test.

By the way, how did you verify the patch ? Do you have any good
reproducer for this issue ?

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
