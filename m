Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CC6C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 06:10:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 233AC206B8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 06:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eHlnRZ40";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="LDRgqzle"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 233AC206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vg6X0RrqImjBCrb4LwZHBxCLerqSJwC2GnKYxt0uN8=; b=eHlnRZ408J+0i4
	N59c/0E2gQASLWCkyOuF/rtYGzMtnRVht0Pt/jn0lu4MhZ0nvBn1CbcW2md3FllEIXCubFPR6bksB
	B79G1vU9WV4OtBl8OjoCv3QxyfyCSmIl7yqBJy1+sVq3shSjYkJtlT76kFTcOVolJ9Ez3JIHV3ac4
	8YHIigcAtFF9/GqCfN+R3JqkqnKF5vLVIcERtZ+3a6l94Me7psmZJJ93t91p7mJShDNZbjccs7xi0
	qvtpXMZbPpKa77aKreD+WeY0kcrncdfSHw442Xlxl51Gp4z8XkOcunE939i0EH+22Dj0KLzzxVeV5
	j6p58K/NzF50qQk1Ngiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g68SN-0001HK-O0; Sat, 29 Sep 2018 06:10:23 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g68SK-00007V-Jv
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 06:10:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id 189-v6so3750798wmw.2
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 23:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m3D8Y6zyD7LVQkB9N5FDdMXNRGrFbt3AOb+aP/R6T8I=;
 b=LDRgqzlevwNnl/IivujS6Kcj+D/iT2Z5ZNCOwNFLw1mfz42gI8r7KSRVvslE256eIn
 sovi1XNlNoIrDIAj0BMC9p+8q891rQ48Or6H7d982EKapWpoTe6Y6J2wRBCEL2TIg+MK
 HWw3QooZUeNvTo7ryxts54EXhMc2btk0/d8HkIzE/0GcvBhWTh/xmxFuKObOHSfhg13m
 gNNqqEqqh2Poc5ixHAUFH3L9lAO52v0yXerpzfWW3uPb658t7dfb6AqtO+8pMESa17fV
 cUsGOBfXyp5miJ/M5OapPHQhuwiEQ6CTDI7gOYb4AEXgvT6OMX+dlhE4bP5vT+S9It18
 OE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m3D8Y6zyD7LVQkB9N5FDdMXNRGrFbt3AOb+aP/R6T8I=;
 b=UV8PFWN4OOwst+9odLxqS4CVfP0daWmWVZ6xUYmc0iwEgxMWyDIeY1xAXoE3wUGY5H
 i1aZnDSa0JLZ2+sAtqY+/ruzguMA13yzln9iq4WlTMYaTXQwf7jZCv3+1+yh+ttARzy1
 hNyysqdA3o3nDPQ9WEyKulrpC/42B8KKJCmcEtLL2QFUZzjqzWb7yFBdmdrfsJOWQb/c
 qVCp6hKqON4mBe2N1DGZkOUI0mqZW4BJEM1fDXpBY60GoCOdaQ3yivjskmsI1YM2JOgQ
 JBUiHs9bf7WO8e7NIsDEiiQmNPN6m3Twnqs7+EVP1IUCbh1BRQDl2E6oxJki3ZVeLQUX
 zF8A==
X-Gm-Message-State: ABuFfohGbQ/N2KRlABkbK61IE3Kjj2NSOKu1IplEtc72WPZmnEI7mENs
 nTYAazpVio+Wyt6/loSUrn44GrXapSiWgyLRtvv/Sw==
X-Google-Smtp-Source: ACcGV61r5ZlHdxtrbiVeVVAtGl90MQr+lTJXlhroo44wFv9EOnQX5ZjTtP4qmCPe2ki47KL3wg+yIvHiEnS8ZpLv/3k=
X-Received: by 2002:a1c:1fc2:: with SMTP id
 f185-v6mr737302wmf.18.1538201407189; 
 Fri, 28 Sep 2018 23:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20180910134659.GA30774@infradead.org>
 <mhng-2395876e-5470-45f9-83e1-4abae5188b0c@palmer-si-x1c4>
In-Reply-To: <mhng-2395876e-5470-45f9-83e1-4abae5188b0c@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 29 Sep 2018 11:39:56 +0530
Message-ID:
 <CAAhSdy0wd7LN1tb5oRkgYbxeR=Yb3LomUtTcym1dhyO6wa+a9g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Show IPI stats
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_231020_658320_147DD1B8 
X-CRM114-Status: GOOD (  21.46  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929060956.GjC5Aad2MYbnilpPdE0IyFmrvlo4SNn535Ors_tauPE@z>

On Sat, Sep 29, 2018 at 7:15 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 10 Sep 2018 06:46:59 PDT (-0700), Christoph Hellwig wrote:
> > On Fri, Sep 07, 2018 at 06:14:29PM +0530, Anup Patel wrote:
> >> This patch provides arch_show_interrupts() implementation to
> >> show IPI stats via /proc/interrupts.
> >>
> >> Now the contents of /proc/interrupts" will look like below:
> >>            CPU0       CPU1       CPU2       CPU3
> >>   8:         17          7          6         14  SiFive PLIC   8  virtio0
> >>  10:         10         10          9         11  SiFive PLIC  10  ttyS0
> >> IPI0:       170        673        251         79  Rescheduling interrupts
> >> IPI1:         1         12         27          1  Function call interrupts
> >> IPI2:         0          0          0          0  CPU wake-up interrupts
> >>
> >> Signed-off-by: Anup Patel <anup@brainfault.org>
> >
> > Thanks, this looks pretty sensible to me.  Maybe we want to also show
> > timer interrupts if we do this?
>
> IIRC we used to have some issue where the timer interrupt ID in
> /proc/interrupts aliased with a possible PLIC interrupt ID, but that was back
> when we had a big mess of chained interrupt drivers that didn't really talk to
> each other.  I think at some point I might have just removed the timer
> interrupt from /proc/interrupts as a hack, but now that our interrupt
> controller mess is sorted out it'd be better to have it.

If we have irqdomain and irqchip for HLIC then showing timer interrupts
becomes cleaner. My RISCV INTC patch achieves this.

>
> I'm fine taking this without the timer interrupts, as something is better than
> nothing.

Sure.

>
> >> --- a/arch/riscv/kernel/irq.c
> >> +++ b/arch/riscv/kernel/irq.c
> >> @@ -8,6 +8,7 @@
> >>  #include <linux/interrupt.h>
> >>  #include <linux/irqchip.h>
> >>  #include <linux/irqdomain.h>
> >> +#include <linux/seq_file.h>
> >>
> >>  /*
> >>   * Possible interrupt causes:
> >> @@ -24,6 +25,14 @@
> >>   */
> >>  #define INTERRUPT_CAUSE_FLAG        (1UL << (__riscv_xlen - 1))
> >>
> >> +int arch_show_interrupts(struct seq_file *p, int prec)
> >> +{
> >> +#ifdef CONFIG_SMP
> >> +    show_ipi_stats(p, prec);
> >> +#endif
> >> +    return 0;
> >> +}
> >
> > If we don't also add timer stats I'd just move arch_show_interrupts
> > to smp.c and make it conditional.  If we don't this split might make
> > more sense.
>
> Makes sense, but I think timer interrupts are more interesting to see than IPIs
> so we'll eventually pipe them through.  Might just be my workloads, though :)
>
> >> +static const char *ipi_names[IPI_MAX] = {
> >> +    [IPI_RESCHEDULE] = "Rescheduling interrupts",
> >> +    [IPI_CALL_FUNC] = "Function call interrupts",
> >> +    [IPI_CALL_WAKEUP] = "CPU wake-up interrupts",
> >> +};
> >
> > No need for the explicit array size.  Also please use a few tabs to
> > align this nicely:
> >
> > static const char *ipi_names[] = {
> >       [IPI_RESCHEDULE]        = "Rescheduling interrupts",
> >       [IPI_CALL_FUNC]         = "Function call interrupts",
> >       [IPI_CALL_WAKEUP]       = "CPU wake-up interrupts",
> > };
>
> I don't see a v2 of this, was there one?  If not then I'll just clean up
> ipi_names and drop this on for-next.
>
> Thanks for the patch!

I will send v3 patch because IPI_CALL_WAKEUP is not going to be available.

I will base v3 patch upon v5 of Atish's patchset. Atish will take v3 of this
patch and make it part of his v6 patchset so that it will be easy for you
to apply.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
