Return-Path: <SRS0=MPT1=MN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4635DC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Oct 2018 16:43:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC22521477
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Oct 2018 16:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DUiX074K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Tzat2iel"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC22521477
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=kv5O3xXtd8idlmyhbirDc/llVbxJIU3bJCZUKE9GvOs=; b=DUiX074Kz9Vant4wxMTs5olLh
	mKiXRfPwT5Y0RnZtYu+C2jWBd9aejpey4lXSDxHpeLu7EuiP+l4ZpaFbnb8gckCfKAElFR9pM89Ge
	emdkXnxx3R00W9KPqt5TwFsVa4ifbDT7KY3uYNQ9DX6jAsvEn0LlM1gKfULNGfsMw6VBFU4ydi/9z
	cgTBH20883tUI32CP0+ANBFFo9+NfvN1XxXUMrIG58UWfrcwY2B0epE91DENI/Deu9YchlQcMONa4
	+J8G/bd7Tcmk64EFqoqsxM4VcBHt6ymTWwJfP7YDLqCBdLi1a2Zn2FtunF0/4WDtKr7dKd4Zup1Ay
	fhWNCem1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g71Hb-0008Gu-QH; Mon, 01 Oct 2018 16:42:55 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g71HX-0008CP-5Q
 for linux-riscv@lists.infradead.org; Mon, 01 Oct 2018 16:42:53 +0000
Received: by mail-pg1-x542.google.com with SMTP id r9-v6so6002104pgv.6
 for <linux-riscv@lists.infradead.org>; Mon, 01 Oct 2018 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=EP0D+xKiYmwTMZCIYZJa1cvzQbdjSkNEBgbTXnpOkDQ=;
 b=Tzat2iel/22ETgOGvxHN40ayowqas6whI2GcF79SC5nNGy2hli6VhX53kNSg5l00p6
 IWENyAtscnoAxesc7i3XtfYLboZVfh1uaDHcyLIGPkNVR61pCQ3oR5oqrDaH9PdQA8In
 PmslhSf5SfJsDsGbAbM1rtpVZJ4pkGmvUWCDswZD6tizL7bIE9/HPEBoYmH/Y+01aj4L
 SirZIOEvCue4di/jUh1ctkttvYye9iNkRBWhI6Ws18etEpM/qUlczUHssg+xx9RZYGcc
 hZPBrhQ6ExTaOZxZt8l5ItdU8VNDkO0QbP5NKgz9PGY2Tjh3uoEA6zsOte/cVaGSALn/
 UggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EP0D+xKiYmwTMZCIYZJa1cvzQbdjSkNEBgbTXnpOkDQ=;
 b=HW2Ma+lsHz6RNgE//NgecdxMNN8wZgJQJlpnGKWXb5MWT6fj9mq6tYjNB+BrC5LQzp
 CQYn/kN8Vhhy984EFXczT5Sp7UVXSraGNjhO1Y/eL+WtNor9iM1zQqRY0pPSI9bp3i7c
 rIbOj+fVqulh6Qxz/6RvbWUKhwE4iUiS3OPAswMtnK5c424luK/f1Zcvf1EGQXZcvE2U
 5qO8UQnO4dUPrYL6wkgSsUpP1TjisESWJSN7iuQQsVWycoVkBl1vZoyckhAx+XaZY5Fx
 jRBJ57sWC4HdpYZLbvTjk9+KfLOFom5nMBJ0w/Ma64pgHokK+z/IVEhLtG4cBENLZaht
 1Ffg==
X-Gm-Message-State: ABuFfoir+2nIcs7++wyMfaOQoMMS+zbK02JBrAtjwiLXvFcIEecGoRk3
 zjXS06/gE0R5hRSXeM5c19mIag==
X-Google-Smtp-Source: ACcGV62d1RM1Y93A+q9UiCoVughBP4r7XczJueKxfC0tE/W7/FZgzW0jcmZVeq63qRdt3GGNYKNkKg==
X-Received: by 2002:a17:902:6907:: with SMTP id
 j7-v6mr12627684plk.232.1538412159081; 
 Mon, 01 Oct 2018 09:42:39 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a1-v6sm28316459pfc.28.2018.10.01.09.42.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Oct 2018 09:42:37 -0700 (PDT)
Date: Mon, 01 Oct 2018 09:42:37 -0700 (PDT)
X-Google-Original-Date: Mon, 01 Oct 2018 09:40:03 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Show IPI stats
In-Reply-To: <CAAhSdy0wd7LN1tb5oRkgYbxeR=Yb3LomUtTcym1dhyO6wa+a9g@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-34a3263b-002e-4301-ae67-47e19c44449f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181001_094251_257856_9C851CC7 
X-CRM114-Status: GOOD (  20.82  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181001164237.Z9hgNyLr7BDc0mG2yTT84onUKdKi50icoUBAmStV0hw@z>

On Fri, 28 Sep 2018 23:09:56 PDT (-0700), anup@brainfault.org wrote:
> On Sat, Sep 29, 2018 at 7:15 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Mon, 10 Sep 2018 06:46:59 PDT (-0700), Christoph Hellwig wrote:
>> > On Fri, Sep 07, 2018 at 06:14:29PM +0530, Anup Patel wrote:
>> >> This patch provides arch_show_interrupts() implementation to
>> >> show IPI stats via /proc/interrupts.
>> >>
>> >> Now the contents of /proc/interrupts" will look like below:
>> >>            CPU0       CPU1       CPU2       CPU3
>> >>   8:         17          7          6         14  SiFive PLIC   8  virtio0
>> >>  10:         10         10          9         11  SiFive PLIC  10  ttyS0
>> >> IPI0:       170        673        251         79  Rescheduling interrupts
>> >> IPI1:         1         12         27          1  Function call interrupts
>> >> IPI2:         0          0          0          0  CPU wake-up interrupts
>> >>
>> >> Signed-off-by: Anup Patel <anup@brainfault.org>
>> >
>> > Thanks, this looks pretty sensible to me.  Maybe we want to also show
>> > timer interrupts if we do this?
>>
>> IIRC we used to have some issue where the timer interrupt ID in
>> /proc/interrupts aliased with a possible PLIC interrupt ID, but that was back
>> when we had a big mess of chained interrupt drivers that didn't really talk to
>> each other.  I think at some point I might have just removed the timer
>> interrupt from /proc/interrupts as a hack, but now that our interrupt
>> controller mess is sorted out it'd be better to have it.
>
> If we have irqdomain and irqchip for HLIC then showing timer interrupts
> becomes cleaner. My RISCV INTC patch achieves this.
>
>>
>> I'm fine taking this without the timer interrupts, as something is better than
>> nothing.
>
> Sure.
>
>>
>> >> --- a/arch/riscv/kernel/irq.c
>> >> +++ b/arch/riscv/kernel/irq.c
>> >> @@ -8,6 +8,7 @@
>> >>  #include <linux/interrupt.h>
>> >>  #include <linux/irqchip.h>
>> >>  #include <linux/irqdomain.h>
>> >> +#include <linux/seq_file.h>
>> >>
>> >>  /*
>> >>   * Possible interrupt causes:
>> >> @@ -24,6 +25,14 @@
>> >>   */
>> >>  #define INTERRUPT_CAUSE_FLAG        (1UL << (__riscv_xlen - 1))
>> >>
>> >> +int arch_show_interrupts(struct seq_file *p, int prec)
>> >> +{
>> >> +#ifdef CONFIG_SMP
>> >> +    show_ipi_stats(p, prec);
>> >> +#endif
>> >> +    return 0;
>> >> +}
>> >
>> > If we don't also add timer stats I'd just move arch_show_interrupts
>> > to smp.c and make it conditional.  If we don't this split might make
>> > more sense.
>>
>> Makes sense, but I think timer interrupts are more interesting to see than IPIs
>> so we'll eventually pipe them through.  Might just be my workloads, though :)
>>
>> >> +static const char *ipi_names[IPI_MAX] = {
>> >> +    [IPI_RESCHEDULE] = "Rescheduling interrupts",
>> >> +    [IPI_CALL_FUNC] = "Function call interrupts",
>> >> +    [IPI_CALL_WAKEUP] = "CPU wake-up interrupts",
>> >> +};
>> >
>> > No need for the explicit array size.  Also please use a few tabs to
>> > align this nicely:
>> >
>> > static const char *ipi_names[] = {
>> >       [IPI_RESCHEDULE]        = "Rescheduling interrupts",
>> >       [IPI_CALL_FUNC]         = "Function call interrupts",
>> >       [IPI_CALL_WAKEUP]       = "CPU wake-up interrupts",
>> > };
>>
>> I don't see a v2 of this, was there one?  If not then I'll just clean up
>> ipi_names and drop this on for-next.
>>
>> Thanks for the patch!
>
> I will send v3 patch because IPI_CALL_WAKEUP is not going to be available.
>
> I will base v3 patch upon v5 of Atish's patchset. Atish will take v3 of this
> patch and make it part of his v6 patchset so that it will be easy for you
> to apply.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
