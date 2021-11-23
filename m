Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FAAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 03:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8wobzBf0wk79M+zkknt4mHMStqESw08L8cRI+R5Gxk=; b=WaGhUVszI5FaOg
	PO1N3r1FgYoWMD9LCDkp6BL+1lKTowp2wU4jF/1is/hBfLSt0NE0wlWljBKn7+hKfc7blMstqoqUc
	MbjJ4nXY+bZ9h61snySwXeDac7g105B7nd0wdAR5/W8Fn4dRzeXkK4it2heae0+wDZ7grg8eV2wAa
	d1DQUGGe/b1WPytnTejT0MHkSLN038/IiJ6Qjs+Hp95VPZm55ody6Uwqj4NqGcwnzH4le1hKsqk5n
	5aBR10rNIQQedbQiap/ojftsemqTWGXqgbw8xzY0s2Ly6+3XHfaoQXjOaI7DC9aFhmkSpFRDd5/SE
	M9ZssGllab2NeaW+K06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpMNA-000iq1-1j; Tue, 23 Nov 2021 03:21:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpMN7-000ios-Bj
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 03:21:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE12C61041
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 03:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637637689;
 bh=uM3YE0EFKILeiI9sS9IYkVOqnYUtuahejNsRMrq//j8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vE5f1pkhSARmEgiNQAOmDvxu+O0PTWjxOkFugVXelICnkW8tekKrlPnpkN1ZyS51r
 wTxWXOKkclJeMtN8HAyxIKof3ojxgGYjiAJJ+NooCBAoHqKI+76m0mdcGu1MDRehnh
 +kPLhYmFv9ppEcMSBAbOrTs9Wz0aM9InyyRmoVf79h/Gy+ZbAQh4p6ovhpXBe+lE1N
 DR3ureDTSD397GRuuNyATCFPOEh2zbnjAIEsg1+F3k6SpHcataMx76oQp6vL3M6n3K
 zalsm19/QtegF8+Q1ei87bfmq2zsHHrVWrFA/eDi5JPa37syoI+GSOTcyHUO5tdjGS
 4Thl4TssJDL5g==
Received: by mail-vk1-f171.google.com with SMTP id b192so11586449vkf.3
 for <linux-riscv@lists.infradead.org>; Mon, 22 Nov 2021 19:21:28 -0800 (PST)
X-Gm-Message-State: AOAM533Ukm0MIthtc8J1ZcfWqRMA00Btpo8dp1OcvB5Ht5AiTEO7lX3A
 f25namqqG/QlD/PTnOXsUZEgV9owa7GcKvWNh40=
X-Google-Smtp-Source: ABdhPJy862Zsy3ulVJkjx/gF8AytwTIhCOrJMHzbKbnmG+hAJ1LiJlNdqcqMfMQe5k7uB3wZjZZehhzZEpY+am7KEws=
X-Received: by 2002:a05:6122:1788:: with SMTP id
 o8mr3481188vkf.8.1637637688053; 
 Mon, 22 Nov 2021 19:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org>
 <20211123015717.542631-4-guoren@kernel.org>
 <ac5613d9-913e-ff07-5802-21e1771112f9@infradead.org>
In-Reply-To: <ac5613d9-913e-ff07-5802-21e1771112f9@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 23 Nov 2021 11:21:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTeeg1Dzfi94EYmjx5cUdpm7+C77R9yOf-PfpfZVD8=nA@mail.gmail.com>
Message-ID: <CAJF2gTTeeg1Dzfi94EYmjx5cUdpm7+C77R9yOf-PfpfZVD8=nA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] riscv: Add riscv.fwsz kernel parameter
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 atishp@rivosinc.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-doc@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_192129_454278_7838151C 
X-CRM114-Status: GOOD (  20.32  )
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

On Tue, Nov 23, 2021 at 10:34 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/22/21 5:57 PM, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The firmware of riscv (such as opensbi) occupy 2MB(64bit) /
> > 4MB(32bit) in Linux. It's very wasteful to small memory footprint
> > soc chip such as Allwinner D1s/F133. The kernel parameter gives a
> > chance to users to set the proper size of the firmware and get
> > more than 1.5MB of memory.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: Atish Patra <atishp@rivosinc.com>
> > ---
> >   Documentation/admin-guide/kernel-parameters.txt | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 9725c546a0d4..ee505743c8f4 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -4964,6 +4964,9 @@
> >                       [KNL] Disable ring 3 MONITOR/MWAIT feature on supported
> >                       CPUs.
> >
> > +     riscv.fwsz=nn[KMG]
> > +                     [RISC-V] Determine firmware size to save memory
>
> Is "Determine" like "Set"?  The user is setting (telling the software)
> the firmware size?
I mean "Set" here, thx for pointing it out.

>
> "Determine" makes it sound to me like the Linux software is somehow
> helping to determine the firmware size.
>
> > +
> >       ro              [KNL] Mount root device read-only on boot
> >
> >       rodata=         [KNL]
> >
>
>
> --
> ~Randy



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
