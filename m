Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25FAC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 03:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqOIHzqUtMI9Qze7WSXWlSQ0ayKFqHAc2WhYf+4L9e4=; b=r6whMpWvOlHPPp
	dL/FMw78ux6KW2Ddy62yeAPPj4pZMpHI5h8CTQLnAZYzM4TMdtuDH+gsOkbh4zd/3IP6DnV/4EucV
	CTNDPmJyNfJtJo6/50ETvr99PJQjI0nJ5ox0wLTq8QRIxT8Tl4FsTyTE5lFukZMLac+2xfgblyC12
	cMMF4LncOtRHZpQ4fhLPsBVLuEtwFd+oHeU70Bf04V+svt5B3k6AC8SoTk6zqKcwOkuFQdxOTTkRx
	RTXSPRsnq1Sk225ORTVkGLtsFoNyobFhdn9MSCF+4m/T+llDpnGiNgHFkJ18OzRz+KZB6cII0oUyp
	0R1agN5YuEvPmA/pRX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owEg4-00AkBy-Dr; Sat, 19 Nov 2022 03:38:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owEg1-00Ak7X-CW
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 03:37:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CB4FFB8267F
	for <linux-riscv@lists.infradead.org>; Sat, 19 Nov 2022 03:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7FFC4347C
	for <linux-riscv@lists.infradead.org>; Sat, 19 Nov 2022 03:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668829073;
	bh=jdtEd1yJuImh5kI6vRvy1ZCkO2ErZlB1ed7aIMIbf3c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pSW/aJ1EU21gpHZec0YPncXqSCPnAX4jgNloFfLtj9tOavGrHuYtOUMZDzrEHrl92
	 1c+3V556KQ8GguTIzpWmc6VpHOyk2BhxjuCl/dg+NIYfywczmwc6rHQ0Bs0WzgN8Ub
	 4ckHd793ZnBu/EUA1+jyXqQCao33O8q6/ylkT7iouCJ4GX09cZx7C0+BH4GmswJpJu
	 oEV1Ra08t1E2wMI353Fwj8PXZYy4EUZT5qJ9tvHWQqtwu67FdWKkidtnegRRQT34zi
	 Dy+DkFh2WgnWKW10QeVwyxLi0dxPCRM5D0+ZtoOW6nMj6L1lnDxA+q+gPSEORkLZcQ
	 Yd4y0LNhb6Z5Q==
Received: by mail-ej1-f41.google.com with SMTP id n21so17353139ejb.9
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 19:37:52 -0800 (PST)
X-Gm-Message-State: ANoB5plIl6cYdt1bypby0EHV2rH76ev5f6LBsYQPEbgAjQ1j5iR+LyG3
	8x86ytYVT4shdnWWsHkKRmhwkQRAObc21VS5HpU=
X-Google-Smtp-Source: AA0mqf6/nFnovDVdY+ezojw/XN96ryAKiLKFYZme8d3Jy1z86DjgSZwwmF8tpmL1GF38JbkynkwXxPj57zeHvWTxbmI=
X-Received: by 2002:a17:907:9856:b0:780:8144:a41f with SMTP id
 jj22-20020a170907985600b007808144a41fmr8499669ejc.189.1668829071133; Fri, 18
 Nov 2022 19:37:51 -0800 (PST)
MIME-Version: 1.0
References: <20221111075902.798571-1-guoren@kernel.org> <Y3fxsWPLPlKGfMBj@curiosity>
In-Reply-To: <Y3fxsWPLPlKGfMBj@curiosity>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 19 Nov 2022 11:37:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRQgqRwjOYKB9Z6OdYoogsHWWVTw5anwNqoQjhmK_A41g@mail.gmail.com>
Message-ID: <CAJF2gTRQgqRwjOYKB9Z6OdYoogsHWWVTw5anwNqoQjhmK_A41g@mail.gmail.com>
Subject: Re: [PATCH V3] riscv: asid: Fixup stale TLB entry cause application crash
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, philipp.tomsich@vrull.eu, 
	alex@ghiti.fr, hch@lst.de, ajones@ventanamicro.com, gary@garyguo.net, 
	jszhang@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>, 
	Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_193757_762265_E85930FD 
X-CRM114-Status: GOOD (  25.89  )
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

On Sat, Nov 19, 2022 at 4:57 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hi Guo Ren,
>
>
> > After use_asid_allocator is enabled, the userspace application will
> > crash by stale TLB entries. Because only using cpumask_clear_cpu without
> > local_flush_tlb_all couldn't guarantee CPU's TLB entries were fresh.
> > Then set_mm_asid would cause the user space application to get a stale
> > value by stale TLB entry, but set_mm_noasid is okay.
>
> ... [snip]
>
> > +     /*
> > +      * The mm_cpumask indicates which harts' TLBs contain the virtual
> > +      * address mapping of the mm. Compared to noasid, using asid
> > +      * can't guarantee that stale TLB entries are invalidated because
> > +      * the asid mechanism wouldn't flush TLB for every switch_mm for
> > +      * performance. So when using asid, keep all CPUs footmarks in
> > +      * cpumask() until mm reset.
> > +      */
> > +     cpumask_set_cpu(cpu, mm_cpumask(next));
> > +     if (static_branch_unlikely(&use_asid_allocator)) {
> > +             set_mm_asid(next, cpu);
> > +     } else {
> > +             cpumask_clear_cpu(cpu, mm_cpumask(prev));
> > +             set_mm_noasid(next);
> > +     }
> >  }
>
> I observe similar user-space crashes on my SMP systems with enabled ASID.
> My attempt to fix the issue was a bit different, see the following patch:
>
> https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@gmail.com/
>
> In brief, the idea was borrowed from flush_icache_mm handling:
> - keep track of CPUs not running the task
> - perform per-ASID TLB flush on such CPUs only if the task is switched there
>
> Your patch also works fine in my tests fixing those crashes. I have a
> question though, regarding removed cpumask_clear_cpu. How CPUs no more
> running the task are removed from its mm_cpumask ? If they are not
> removed, then flush_tlb_mm/flush_tlb_page will broadcast unnecessary
> TLB flushes to those CPUs when ASID is enabled.
A task would be migrated to any CPU by the scheduler. So keeping TLB
contents synced with cpumask_set/clear needs additional tlb_flush just
like noasid, and your patch still follows that style. The worth of
ASID is avoiding tlb_flush during the context switch. Yes, my patch
would increase some tlb_flush IPI costs. But when mapping is stable,
no tlb_flush is needed during the switch_mm (Hackbench would be
beneficiary because no more TLB flush is needed at his hot point
path). Here are my points:
 - We copied the arm64 globally unique asid mechanism into riscv,
which depends on hardware broadcast TLB flush. My fixup patch is
closer to the original principle design, proven in the arm64 world.
 - If riscv continues local TLB flush hw design in ISA spec, please
try x86's per-CPU array of ASID. But that is a significant change;
let's fix the current issue with the smallest patch first.

In the end, thx your review and test.
--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
