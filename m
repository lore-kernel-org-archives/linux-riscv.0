Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970ADC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 05:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s04qWTbBRBcqdUfyOdpWAPCyPLQXWKUpk/w5YvnJPRs=; b=2zqMVa0TO5k40h
	pesuCndm8wVz+WvgU4aYV7jn+oP7fhf/DC9YJsrgpURsECSZ3+qxQpdmQLqIqekZsKFind6WU8mX9
	5JhjWyEl1LPBqlrj84f6X9+Z1a+eu2qSK/bCBGvHTPaNOOC/7NGWhZXlJrRBqrDLN3K0MXaYuQRMA
	2ldeshzd4WT2DSOIv9LDZUid9GlLGEX8rQlqKt1kpB6/jAuLATA2ukjgJZz14CCgz3e2dDOJGpbOm
	VuHFvAhf/SuW1QDTEWP78X3kHkvGOv7UcDWe+qmOamnfFneq9Y2Tdx8ZLUnFjYAMhDVOvImKKsaqT
	lU68fo67na00RdVR4Mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0yDj-00DOwG-N8; Fri, 02 Dec 2022 05:04:19 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0yDg-00DOuR-U0
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 05:04:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so7259334pjc.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 21:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tKYS0jpJbkIqxASXUqLjfSITbe2oU3nanhe00O7VSVI=;
        b=AgI4sbAaYF05oUj5+9tB/44lCq5vuYoki64AfWNo1FHcmjo9mQ+mgoN8xpQf8CX5Fe
         F9H3IORJE68/bKO21HfXusNxNvubMYDPTFhf05XsWms3KHoZS6kUL6WE1J1wwAe7KbgT
         ufonXrWpfVtdkaz2AP+vB4LbnJYTwzLCe5+seYyBqM23eYvZ7d/AbraLkAOrwaOgpbME
         NIlF2RAIVWIxTsVJPQRIgecmlJyUUXgZkvwRKVNdhI1d+uBENjckDSxHnjYH4YIOfw/G
         QY07xuk7L6APA5F5n3/afGhaQD3yhUjOWrTgIrJu38SCeY7lNTNo1e6U4lWBDARN4VTB
         TqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKYS0jpJbkIqxASXUqLjfSITbe2oU3nanhe00O7VSVI=;
        b=dqPy5DPZ+9hLKqFLof2Oo8Gxn0eLcKRdf4yM7UE+uSSRMYNStxr0be9cXJ19LsogyZ
         UBmXyHejRAOxUh08eBBkr/BrIfamzY6v+Ei3T1PgSavPw+pdU3abQyTAKtLnePnM+SNL
         2r5+iunNpPOGz2oC10GzB4zyKnDJ3eQXOztJv7MaG0xehsfp8kthqfpTDBrZon9qdg+X
         +lJHxbqLbUS6alTquXX09KaBDvYBnN/iIuJn6/okTJV00mebB9jcKnV69zKCqZzd/T+K
         S2r7D4g8BCkOH8PCvSeNpn7PI78ncdrF8EfY6GoLweEh/0fIoUBRzVuOvPG5/G7KFhTs
         4t+A==
X-Gm-Message-State: ANoB5pmkH5tOni0hVuATbWzukDyp3iKgNUzDAyvBwNeb3E46htelxlBa
	7Q+FW/PUdeyXgKTvCdJS7sPd/oRvmvmxcPAzIH6aBQ==
X-Google-Smtp-Source: AA0mqf55l/aEVbdhJaayQjSQsgVyfIaQL0naLHHG9mxExGrPbkRJdowf+4jmYJdVjh/R0rm0SD0Betn8VWlF6C8nkBU=
X-Received: by 2002:a17:90a:df0e:b0:20b:22fb:2ef with SMTP id
 gp14-20020a17090adf0e00b0020b22fb02efmr80646165pjb.158.1669957453812; Thu, 01
 Dec 2022 21:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20221201130135.1115380-1-apatel@ventanamicro.com>
 <20221201130135.1115380-4-apatel@ventanamicro.com> <87v8mvqbvq.ffs@tglx>
 <CAK9=C2WN57hHUz=3SDruyWPdAobn+QP8uGwugjPAobeFG7dBkw@mail.gmail.com> <87h6yer1z4.ffs@tglx>
In-Reply-To: <87h6yer1z4.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 2 Dec 2022 10:34:00 +0530
Message-ID: <CAK9=C2Vnp9gTqX7AHxqCaVzVx1qGGRE0fCG1uxQUnh6n0dSm-g@mail.gmail.com>
Subject: Re: [PATCH v14 3/8] genirq: Add mechanism to multiplex a single HW IPI
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_210416_995038_B3D01644 
X-CRM114-Status: GOOD (  20.94  )
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

On Fri, Dec 2, 2022 at 7:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Anup!
>
> On Thu, Dec 01 2022 at 23:30, Anup Patel wrote:
> > On Thu, Dec 1, 2022 at 10:50 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >> > irqchip driver and it is shared by various RISC-V irqchip drivers.
> >>
> >> Sure, but now we have two copies of this. One in the Apple AIC and one
> >> here. The obvious thing to do is:
> >>
> >>    1) Provide generic infrastructure
> >>
> >>    2) Convert AIC to use it
> >
> > Mark Z already has a converted version of AIC driver.
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/ipi-mux
>
> You are submitting generic infrastructure which is supposed to go
> through the relevant maintainer tree and not be funneled through some
> riscv branch.
>
> So obviously this very maintainer asks the predictable question and also
> wants to see the Acked/Tested-by of the folks who maintain apple-AIC.

Not CCing apple-AIC maintainers was purely accidental.

Actually, I had started off ipi-mux with the intent to share across
RISC-V irqchip drivers. Only in recent patch revisions (based on
suggestion from Marc Z), I tried to converge and make it useful
for apple-AIC driver as well. Unfortunately, I don't have apple HW
for testing this so I was hoping someone will help.

Thanks to Marc Z, we now have a patch for apple-AIC driver as well.

>
> How is that supposed to work without integrating this patch into your
> series and without having the apple-AIC folks on cc?

Okay, I will include the apple-AIC patch from Marc Z in the next revision
and add apple-AIC folks in CC.

>
> You did not start kernel development as of yesterday, right?
>
> Thanks,
>
>         tglx

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
