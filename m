Return-Path: <SRS0=deyN=PY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33958C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 01:07:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E39C260F70
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 01:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E39C260F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGZ2q9obPjF/TGbNBjOn2R2tNtTH4Wy5tIPV7pwBSV0=; b=BMUizY5l1E+/ba
	CK7RbB9Oh5G2D7ff6w4OPGy9vCztIr99A5goKsYPazHdW1QpLVtvXYLJ7RT/F6mjNPeN1OyAAQbf+
	/JuN1lNZKYQHwWRNuyF13ZT59jfq9sYwRvATS/JTltAEIJxlqS5t/dlqDwHzPhjxzDtZz7+IOWic9
	oYSgobOV0HYA5jguwAZwTOTMoBoc/aIR/T3DGir6UWupkMxni3iRHWI0PxDRpRgHSvTEHFa8QvJ7x
	q8VOzP45Ws43yRZSm8X1Auz5lToU3+8en6BW6yzKC2q3E6bgOL+EaJbIPIuGHQbdpokGfWpw7i4iT
	4/tVyyZVbfzs6DoXEhWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1minhF-00AH0U-Td; Fri, 05 Nov 2021 01:07:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1minhC-00AGzJ-Q7
 for linux-riscv@lists.infradead.org; Fri, 05 Nov 2021 01:07:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31EC661261
 for <linux-riscv@lists.infradead.org>; Fri,  5 Nov 2021 01:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636074423;
 bh=e16Mi+K8f8A1YlnrwXmStFNz6CID+giZJVpBpRE2tTc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vLKs/+rnOTf+GHM+en71ZdfWoZ9LCvkd38uhyWZZBnqkLkjgBOGFEuC7BbS8IcnDd
 AlXw78dsDT0hksruuO8HtBrbLdE+IOJCNRkHnbmvP1eL2FAwrZy08nGZGRvlaRqMWc
 IP9Zb92RRZGuT4hUGhkXQkTPbNHSeHJpfFn0m198OuLz1Kmhzjx3Aju2t/6wsz3rZ4
 IjRzhBwjdbK+0SJodYU4NuhOfKDQMKdnbA6zrQuIwCNmN69vEWBzjFXF3zhjxYsApi
 TJhDC3iCWb2AlBj46anhftyZJtAPHrZkeU1cyQD/XMnmmJdUfTB882X8++cAnm2pwi
 HPTnDpYjxL4WA==
Received: by mail-vk1-f177.google.com with SMTP id t127so3895304vke.13
 for <linux-riscv@lists.infradead.org>; Thu, 04 Nov 2021 18:07:03 -0700 (PDT)
X-Gm-Message-State: AOAM531iZGWoZ+Y5dYtssaew6wDr3q1Xgar3FkExKGrf2oD8zs3iS1Se
 3kO+dzo03XqKgTQo9xn8ZLcoPdf0CmY+8Crr9Rs=
X-Google-Smtp-Source: ABdhPJwvGbRaXLEYfAh9ZSkqQVjXrx0y4PslYQqJ2YKH8KiIhxPspAOtMRvTVeoQRt/X55tBRbhbwatt3wcno5mwOU8=
X-Received: by 2002:a05:6122:d07:: with SMTP id
 az7mr20321320vkb.22.1636074422159; 
 Thu, 04 Nov 2021 18:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211101131736.3800114-1-guoren@kernel.org>
 <CAAhSdy29qhF4JHuMOqwctn+=HQNBbR3X0gsymqD8OAF1pXE43A@mail.gmail.com>
 <871r3w9df1.wl-maz@kernel.org>
In-Reply-To: <871r3w9df1.wl-maz@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 5 Nov 2021 09:06:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTa4uA6Zv5bvnfiQNQax3OikAPJynktwDr-00hqX8FPzQ@mail.gmail.com>
Message-ID: <CAJF2gTTa4uA6Zv5bvnfiQNQax3OikAPJynktwDr-00hqX8FPzQ@mail.gmail.com>
Subject: Re: [PATCH V6] irqchip/sifive-plic: Fixup EOI failed when masked
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Vincent Pelletier <plr.vincent@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_180706_942138_7D419B6D 
X-CRM114-Status: GOOD (  26.09  )
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

On Thu, Nov 4, 2021 at 10:57 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 04 Nov 2021 14:40:42 +0000,
> Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Nov 1, 2021 at 6:47 PM <guoren@kernel.org> wrote:
> > >
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the driver,
> > > only the first interrupt could be handled, and continue irq is blocked by
> > > hw. Because the riscv plic couldn't complete masked irq source which has
> > > been disabled in enable register. The bug was firstly reported in [1].
> > >
> > > Here is the description of Interrupt Completion in PLIC spec [2]:
> > >
> > > The PLIC signals it has completed executing an interrupt handler by
> > > writing the interrupt ID it received from the claim to the claim/complete
> > > register. The PLIC does not check whether the completion ID is the same
> > > as the last claim ID for that target. If the completion ID does not match
> > > an interrupt source that is currently enabled for the target, the
> > >                          ^^ ^^^^^^^^^ ^^^^^^^
> > > completion is silently ignored.
> > >
> > > [1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007441.html
> > > [2] https://github.com/riscv/riscv-plic-spec/blob/8bc15a35d07c9edf7b5d23fec9728302595ffc4d/riscv-plic.adoc
> > >
> > > Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Cc: Anup Patel <anup@brainfault.org>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > Cc: Atish Patra <atish.patra@wdc.com>
> > > Cc: Nikita Shubin <nikita.shubin@maquefel.me>
> > > Cc: incent Pelletier <plr.vincent@gmail.com>
> >
> > Please include a Fixes: tag
Okay

> >
> > Also, I see that you have dropped the DT bindings patch. We still
> > need separate compatible string for T-HEAD PLIC because OpenSBI
> > will use it for other work-arounds.
> >
> > I suggest to include to more patches in this series:
> > 1) Your latest T-HEAD PLIC DT bindings patch
> > 2) Separate patch to use T-HEAD PLIC compatible in PLIC driver
Thx for the suggestion, and I would put above in 5.17 as Mark suggested.

>
> No, please keep things separate. The PLIC is broken *today*, and I
> want to take a patch for -rc1. The rest (compatible and such) is a new
> feature and can wait until 5.17.
Okay

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
