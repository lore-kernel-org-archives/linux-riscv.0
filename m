Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4F1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 06:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dE8gWdOHGXVbHA6FFBQCxm18+No+UysObvzjwl508QU=; b=OgI8kM5Ypy9pzQ
	Ey9L2/76rBNCp4frrv49vwSF5DNGS7fMnBif/hva0q4GfFWSpfqdPvzW52AQ1dWqZv4AaS4oXmx+S
	zdi4xeaaMs9XRvvYhMVt8nF+9ChxW4MVAWfyRKJHD8JMYguc6y2ldjclTaO6Q7Bm4RqyQ8nHYL44p
	04ilobg2MUcGXJcOuKCvzmJWJ4MYVV8N0O8r3LSvtMFjmLvBTzJnHibpBkEe71TNs5UqRD0sM0oUW
	8/anTab/e3t6bHnVRxNQfoDiMUbdS64hE8+VS3CJ7SBdNe+eQR03hKYXWxnu+5kW5dlWmz5fkuMDK
	CiHMVNJpJK815+QVJhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4dDG-000wD0-RL; Fri, 24 Jun 2022 06:54:42 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4dDE-000wCc-QV
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 06:54:42 +0000
Received: by mail-pf1-x432.google.com with SMTP id i64so1761264pfc.8
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 23:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d4LS7+UR4mF5ZC3uIk391ctzec5Q7I2US0ktMP0ukBQ=;
        b=srhFKSnq3B9fdwZBN/1/p1Ihn6drdcFAPQod1v2FKmgG72pgEi+6dZsFVdLpf+mfhO
         SD+7OiwPfgpuYRVH8Q786EluF+L6CxVxpC5SHszuhUxowF4MgZq1BpcANktnCE19ttub
         DtKUOrm+iq9aWbQjZefHLFj7t8wYm0HhpsrlqlKxs7HbSlRtCT1cKSYsI8wioLOxe1gy
         k+jgLmQW0eP9TCPA5Zu8dorQ2UXrteNUYjOqpOLHMadRyKkGCDOfd6lr77qN1y/yfE1m
         qpcq5emat03yP/V1m1+rTxxIIjVjKmplWpQBm2/Vd4lfcgOxcnu6iqSd+6kEBo7ZDHjI
         9e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d4LS7+UR4mF5ZC3uIk391ctzec5Q7I2US0ktMP0ukBQ=;
        b=dtR1W52nMqSxhzVJ/ayCPko41IL8NXr8F0ZjUuLowLz3HAbjsR0GFQ+2UjiVSxwAD/
         jDQc18MS79I7aTbYGWXIYiBYx0VGvCqtxqxkL5p3cSUdDpKbjGB/WuXWa8h2ASTWn51R
         /DPQ6mB5+7ZPFmTh4scY9w8KbnKC+ufbPD+t7orTM5tq3jWwGvuxJTOjp6Yl4sDJtRDJ
         mDS9cqZhta25MN2XcSs+ue62Gs41XYYXi6+lGCqXaDUX1Pgs/pka/wd1plJtKQj4l8Hq
         cZ77J5BHJjshpDlmtxBTtHEXHdHQTDo38WFUIAajNeGBp4Y1FOD1kddtee+u5u04sYc3
         MWFg==
X-Gm-Message-State: AJIora/lwQ8yk6EA6Tihld9XWq3RM4MxeAH8dfzLmN+8F13/8hyDraJq
	cqNG3Q4srZ41Rj41ZHa6ifZRgwLvOk3MWdbZj/RFTw==
X-Google-Smtp-Source: AGRyM1suuRhFClPd67X9hYDeauVwr5SD+X05HZXi6ymtcoUBPEo7ypb93XJZGHlvKJixo0bputFsk4/EAQjTvTmDtZI=
X-Received: by 2002:a63:9d41:0:b0:40c:67af:1fed with SMTP id
 i62-20020a639d41000000b0040c67af1fedmr10397690pgd.185.1656053679426; Thu, 23
 Jun 2022 23:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <bca6d76d-1708-fede-8008-d2588a14b656@mail.ru> <8887d851-19b7-ee10-a89e-fb69d54ac41e@sholland.org>
 <CAAhSdy3CoRVs7Rn=TDBRrfqaNEr1R6h4r1cdgGR-QKCtg7QYrw@mail.gmail.com>
In-Reply-To: <CAAhSdy3CoRVs7Rn=TDBRrfqaNEr1R6h4r1cdgGR-QKCtg7QYrw@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 23 Jun 2022 23:54:28 -0700
Message-ID: <CAHBxVyFv57ggFhoJTCUfVPsosjRTdCy=2+TD=P3SSnT-NG-Y1g@mail.gmail.com>
Subject: Re: Tickless timer regression in v5.18.3 on riscv
To: Anup Patel <anup@brainfault.org>
Cc: Samuel Holland <samuel@sholland.org>, Sergey Larin <cerg2010cerg2010@mail.ru>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Atish Patra <atishp@atishpatra.org>, 
	Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_235440_898795_57C9349B 
X-CRM114-Status: GOOD (  32.44  )
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

On Thu, Jun 23, 2022 at 8:59 PM Anup Patel <anup@brainfault.org> wrote:
>
> +Atish (for Sstc patches), +Sunil (for ACPI support)
>
> On Fri, Jun 24, 2022 at 1:21 AM Samuel Holland <samuel@sholland.org> wrote:
> >
> > On 6/23/22 1:11 PM, Sergey Larin wrote:
> > > Hello,
> > >
> > > It appears that tickless timer regression was introduced in commit
> > > 232ccac1bd9b5bfe73895f527c08623e7fa0752d ("clocksource/drivers/riscv: Events are
> > > stopped during CPU suspend").
> > >
> > > Even though this is a fix for CPU suspend, it causes high idle CPU usage.
> > > However, this usage is not reported to userspace, but can be observed in virtual
> > > machines like QEMU or RVVM. So the kernel is not tickless now, disabling NO_HZ
> > > has the same effects.
> >
> > The SBI timer extension is not a great clockevent source to start with. It
> > requires calling in to M-mode/the hypervisor, both for setting the timer and
> > (without Sstc) a trap for handling the interrupt. That is why its rating is only
> > 100.
>
> When Sstc is available, the clockevent device rating should be increased (400+).
>
> (@Atish, can you update this in your Linux Sstc series?)
>

Yes. I will add this change in the next version.

> >
> > Do your virtual machines have no other MMIO timer device? Practically any other
> > clockevent device will be used in preference to this one. And if that other
> > device does not have the CLOCK_EVT_FEAT_C3STOP flag, then idle CPU usage will
> > not be increased.
>
> I agree. RISC-V Platforms that don't preserve mtimer (MMIO) should have
> additional timer in the "always-on" domain for idle wake-up.
>
> >
> > > Any ideas why this is needed since CLINT timers should be active in WFI?
> >
> > The CLINT timers will be active in WFI, but not necessarily in all CPU idle
> > states. For example, the T-HEAD C9xx includes the CLINT inside the CPU's reset
> > domain[1]. So a nonretentive idle state that puts the CPU in reset will stop the
> > CLINT (in addition to resetting the circuitry responsible for delivering the
> > timer interrupt).
> >
> > Also keep in mind that the SBI time extension is not necessarily backed by a
> > CLINT. In fact, the SBI specification lists no real requirements for the timer,
> > such as minimum/maximum duration or when the timer is allowed to stop. So the
> > kernel has to assume the worst case.
>
> Yes, when Sstc is available the SBI time extension will internally use stimecmp
> for SW compatibility (recommended by the Sstc specification).
>
> For assuming the worst case and always setting C3STOP in timer-riscv is fine
> since we have very few platforms implementing CPU idle states but this will
> change soon.
>
> I suggest we introduce an optional "riscv,timer-always-on" DT property for each
> HART. If all HART DT nodes have this property then we don't set C3STOP flag
> in clockevent device, else we set it.
>
> (Note: Our proposed ACPI ECRs all need this flag in HART capabilities table)
>
> Regards,
> Anup
>
> >
> > Regards,
> > Samuel
> >
> > [1]:
> > https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/clint/rtl/clint_func.v#L369
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
