Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB77AC00448
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 02:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWHZPHCuO0mr+VLdIkzUhWkeBlEZoDUK9mZtQtB1Ohc=; b=af6deob3d0FdTt
	msCCWgmywnevLXKZIOuqjvZ065pvt0jyzMRUks5YK6WwD5umh/Ktpt/L9GdFcq+fuo/1WYfU8x4sI
	p0ROlLSsMBbvs1GZE+w0jEwA/jSUecxOcGjfYFDm/oNlQ+VwSCvVjFgKz45mnBaPWYJARpU64KDQu
	qVlEbJjWxH34hD1/ZSdvQievQSXQ4EYQ07FFbTcgLSeBCZf1KduuD17SAk8hwvMfsrb/MMZGg1ZEB
	OFJEPYzoeUoS/rZh0dNY6JcGZSR0kmoagT3d3Qxp+7bV3Jl/Pvfhm26V0hoCPJ/3On1eKqE//N7EK
	OR+YvOxAeCrT9jgAFMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR2yT-004lbu-1a; Thu, 25 Aug 2022 02:52:05 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR2yP-004lZU-TS
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 02:52:03 +0000
Received: by mail-lf1-x129.google.com with SMTP id d8so14075139lfq.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Aug 2022 19:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Ky9f3zT08S4ZXNjlyA5qGbsFiUvNGJziEqTyRMY4jSw=;
        b=jo31VNDUXR8dbKvXYPyNa0M/tQAX3KyHNSSjuFpuQh9mB7Xyhvbs0IHAU7OaCjVSmy
         paWWTAVL9yz28LlBaaiv0rcb1ANcvdrTDPc8Gdm9qCupJCdajV6g7LylrLp0zy+TRHXO
         8RCmkbQWnxKFnqzAtL2EMCkPBOFwmxSk8z47W1tAVynQW41vlnUx8XPQuggBgXUa19kr
         bbyNO5C3paJoU0yujCZqslCm3QZ1VHbb9cVm7UjKJn9VZ9V6GX/cnuyOP5cUHDG0Opbk
         UY3qGBaQnJ4e8qBwBGdNaHoMYBLiDKgUA83URBqoVG2xXZQ2mBpo9Od8PptIxB3pafCD
         Kmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Ky9f3zT08S4ZXNjlyA5qGbsFiUvNGJziEqTyRMY4jSw=;
        b=7DdfNaoRuby50flApaWlQeQ4oUS5uIvIYTFkDdq/tthX7Y+GwPpkwlrfZ3NQz4w8AW
         TY7+Y2oro3rMuRzOFUoImXTwsT48mhbjhckPGGQUR3YQ5ItKOdN6rag7bB2OqkBDknCD
         +UEHF4KVDbFBJfqS908y43zF15++SR6hyiG1oIZJb4gimhZ6u64ITsIovdM9aTNRKKSM
         dpHg2B+XTuODk44dbquDb1NRBjmRQXf5Rqc9+nORlj4jVk990EK3yPcFQqZ3O44DaAqf
         nI44xJNnO4UOnq8PvvkGKMhLNdVUnFvAuFXWnySH1/fLmBzrrtrbPPhZC3w2Rl1Dz79d
         gJbQ==
X-Gm-Message-State: ACgBeo3brf2EvsS5Db8mYc3ecySqqOJZ4lqMhSzu7spQM/Bnwm3qlPAn
	axaZiN8LISSGS9YHcdXeit3D5lP0m9UMjA/7s1g2QQ==
X-Google-Smtp-Source: AA6agR5adGSfvPjHNArIdRKeBP7Ky4mhYot3mSpYxhseCkqeFsMTRtBGNQP5s8bnvWkGLT62qwXl2P+zEWQfbLRaDug=
X-Received: by 2002:a05:6512:3b0f:b0:492:ef21:33a0 with SMTP id
 f15-20020a0565123b0f00b00492ef2133a0mr462100lfv.419.1661395918227; Wed, 24
 Aug 2022 19:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220817111348.745527-1-heiko@sntech.de> <CAOnJCUJu1fr2qxOkX4Sz-kLhB64xkcjAbBAeTkp214ZHAa0btA@mail.gmail.com>
 <CAK9=C2U3OvUZmYTJ-C0wkSp8ViPA1+Nj2L6pd4CHTCuzaVtDJg@mail.gmail.com> <13084187.uLZWGnKmhe@phil>
In-Reply-To: <13084187.uLZWGnKmhe@phil>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Aug 2022 08:21:46 +0530
Message-ID: <CAK9=C2WhbguLxKuJ6jVZZQUvsv30iuORviDZ4sT9imvwwzNY2w@mail.gmail.com>
Subject: Re: [PATCH] drivers/perf: riscv_pmu_sbi: add support for PMU variant
 on T-Head C9xx cores
To: Heiko Stuebner <heiko@sntech.de>
Cc: Atish Patra <atishp@atishpatra.org>, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, philipp.tomsich@vrull.eu, cmuellner@linux.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_195201_974833_54530D6B 
X-CRM114-Status: GOOD (  39.85  )
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

On Thu, Aug 25, 2022 at 7:34 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Donnerstag, 18. August 2022, 10:24:33 CEST schrieb Anup Patel:
> > On Thu, Aug 18, 2022 at 1:03 AM Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > On Wed, Aug 17, 2022 at 4:13 AM Heiko Stuebner <heiko@sntech.de> wrote:
> > > >
> > > > With the T-HEAD C9XX cores being designed before or during the ratification
> > > > to the SSCOFPMF extension, they implement functionality very similar but
> > > > not equal to it. So add some adaptions to allow the C9XX to still handle
> > > > its PMU through the regular SBI PMU interface instead of defining new
> > > > interfaces or drivers.
> > > >
> > >
> > > IMO, vendor specific workarounds in the generic implementation is not
> > > a good idea.
> > > If we have to support it, I think we should just put the IRQ number in
> > > the DT and parse from the DT.
> > > The initial sscofpmf series was based on the DT. It was removed later
> > > as there was no need for it at that time.
> > > We can always revive it.
> > >
> > > Regarding the CSR number difference and static key enablement, can we
> > > use code patching techniques here as well ?
> > > At least all the T-HEAD C9XX core erratas are in one place.
> > >
> > > The alternate would be just to say T-HEAD C9XX support SSCOFPMF but
> > > with erratas. I don't prefer this approach
> > > but it keeps the vendor specific checks out of the generic code.
> >
> > Whether to have a DT node (or not) was already discussed and concluded
> > in the past.
> >
> > We don't need a DT node just to get the IRQ number. The T-HEAD custom
> > IRQ number can be derived based on mvendorid.
>
> Yeah, I remember reading that discussion and thus went with the mvendorid
> way in this patch.
>
> > Also, all these T-HEAD specific changes in SBI PMU driver should be
> > implemented as erratas using ALTERNATIVE() macros.
>
> (1) "All these T-HEAD specific changes ..."
> Actually the only T-HEAD-specific change is reading that different CSR
> for the overflow information, the rest only makes the irq-number variable

If it is just overflow CSR then it is simpler to do instruction patching
in drivers/perf/riscv_pmu_sbi.c itself.

>
> (2) ALTERNATIVE macros are working on assembler instructions, so are you
> sugesting to replace the generic csr_read() for the overflow-csr with a
> custom copy like
>
> #define sbi_pmu_read_overflow(void)                                             \
> ({                                                              \
>         register unsigned long __v;                             \
>         ALT_THEAD_PMU_OVERFLOW(__v); \
>         __v;                                                    \
> })
>
> and then in errata_list.h
>
> #define ALT_THEAD_PMU_OVERFLOW(__ovl) \
> __asm__ __volatile__ (alternative(
>         "csrr %0, " __ASM_STR(CSR_SSCOUNTOVF),  \
>         "csrr %0, " __ASM_STR(THEAD_C9XX_CSR_SCOUNTEROF), THEAD_VENDOR_ID, \
>                 ERRATA_THEAD_PMU, CONFIG_ERRATA_THEAD_PMU) \
>                               : "=r" (__ovl) :                  \
>                               : "memory");
>
> I'm not yet seeing what you're gaining by going with this approach:
> - that the overflow-csr is the same bitwise but only at a different
>   address is specific to the c9xx, other deviants might implement things
>   completely different
> - you're not getting rid of the thead mention
> - and we're now duplicating the generic csr-read code
>
> Is this the preferred way or what am I overlooking?

Yes, better to have special sbi_pmu_read_overflow() in
drivers/perf/riscv_pmu_sbi.c itself which is based on ALTERNATIVES.

I am suggesting ALTERNATIVEs only because overflow CSR is
accessed in the interrupt handler which is in hot-path when we run
"perf record".

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
