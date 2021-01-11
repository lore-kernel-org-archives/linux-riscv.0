Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EF3C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 22:09:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EAD822CBE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 22:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EAD822CBE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hC4e1ehLwGYHXinv72pfHCtpPDOu1K9KYmcXZdxArzM=; b=F+jzB3/gAHCiz4G8yCewfBtPJ
	DGWQWRD4oBSQs10nVYWOadmQs7NJPX6/lFwum776msRkpYr9gOD0EzFo7sxWPj/6DGmnOIDmXI2kQ
	GpbZi2oGNcnyBeJ4pot50Bq08s8M9AEUNG8yksIXYNPw+yodN4c/Q14csFXBTLxTkGFxX7FCbMhYn
	AZ0NMZYIsNsEajKWfqJZPnG8L8tOEyIp9m9VYrEVkhW4YlUKVnv2qDcxknsqFEj/R9pF0rkTsfOWs
	BkQgy6iHwiYiN3SVyKBm5G1LIcT+gUuvofsB9Mgfqk3b9Zk4p9WIK6/zr+2Clbzr8WTTjH+rTY1JW
	s/aoc+Z3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz5Nd-0000qk-3K; Mon, 11 Jan 2021 22:09:41 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz5NZ-0000pc-DB
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 22:09:38 +0000
Received: by mail-lj1-x236.google.com with SMTP id m10so671092lji.1
 for <linux-riscv@lists.infradead.org>; Mon, 11 Jan 2021 14:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MaAJz+3cRdiTPh2sh3UXQnecZjA7GzXvapWd7cfhm5I=;
 b=bwRaUeUIkZfEaSey1fqB8RwqZWkmEEDiudKCals5VJ7evrkB+2EFUuMN8jOsqmzdNi
 V2lJJngo4TEr0XAIy1Vo+0xXKKeAiZ2CehQLw31ygzm8uENJdOLfQlhjWUctZiGslv8b
 9Hqh4WY1kbNNx51nWSEhh7PttMOl7ocWzxi2S7+n0q2fIWA7JLoYbEggAzdGeOy+KmiV
 Pu2mTcTzavViCH6iCqMst8tSF4xxIRVAuZ9UXOSvKdK7FwFN96oiw23pfzE/vBsS5TQ1
 3DamfK+cHcb2Yly2N8JEOWtieYDwlrvea99Ra8fKUgw8+SiLf4TlAgtS6t6AQsYZkPcT
 votg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MaAJz+3cRdiTPh2sh3UXQnecZjA7GzXvapWd7cfhm5I=;
 b=qTrEZvYGWfmQlWlQDtKuxcstIy74Tpad+0IYRJN6YE9sz2dab1JeIrmYMw2O6wNkv4
 OrFdQqq3cvH7t7oRK7KJbuMgZBx0EC3+BsTHm0sSNUOYB2CroegLuS1BEIL6gVg8jSiL
 YpA+XhEutpE5i/G4ydCN+bSsSItZJpGY4UvIgLBKsimdi30AJISAvzRl1+u7/okXkVMU
 OWNK0Wy7iPx+EJbTLssPiWgNLkW+D6NcwZ6EFAlBw8CBQN8K3+t7KMgdSDsS4MwGSsGN
 IFzS0AgTZ+svqAxe926qik5n6Cqzqdf+q4uRXJUEn98uof/3FchOqLNhXRIwlJNZ3aFi
 g0LQ==
X-Gm-Message-State: AOAM533mEhRevU+f4FvF7hN7teZiJQ04VndTEZD5gpX8m4U0aGLqPmaM
 +gKxHJZ3ASSPOUW8p0aiLra9WQy/qV+cpZ3pOu0=
X-Google-Smtp-Source: ABdhPJxNuGmvRgzWTvgOeDw82iyCyKN1WeH6PhT5XqkLTB3vqCeR2GmAy/7mhywmhqfJMm6AXCuhtJouVmFPueK/UjE=
X-Received: by 2002:a2e:3514:: with SMTP id z20mr670852ljz.110.1610402975946; 
 Mon, 11 Jan 2021 14:09:35 -0800 (PST)
MIME-Version: 1.0
References: <CAD56B7fYivPF33BhXWDPskYqNE5jRxd-sA=6+ushNXhyiCrwiQ@mail.gmail.com>
 <f3b0e354-9390-1ce8-6be5-b6ba9f201589@gmail.com>
In-Reply-To: <f3b0e354-9390-1ce8-6be5-b6ba9f201589@gmail.com>
From: Paul Thomas <pthomas8589@gmail.com>
Date: Mon, 11 Jan 2021 17:09:24 -0500
Message-ID: <CAD56B7fJbej4A9QpG4VLfeU-Qu-RwZHEkpJvMab4KhL7Jr-QgA@mail.gmail.com>
Subject: Re: net: macb: can macb use __napi_schedule_irqoff() instead of
 __napi_schedule()
To: Heiner Kallweit <hkallweit1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_170937_512885_11834393 
X-CRM114-Status: GOOD (  15.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 4:35 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 11.01.2021 20:45, Paul Thomas wrote:
> > Hello, recently I was doing a lot of tracing/profiling to understand
> > an issue we were having. Anyway, during this I ran across
> > __napi_schedule_irqoff() where the comment in dev.c says "Variant of
> > __napi_schedule() assuming hard irqs are masked".
> >
> > It looks like the queue_writel(queue, IDR, bp->rx_intr_mask); call
> > just before the __napi_schedule() call in macb_main.c is doing this
> > hard irq masking? So could it change to be like this?
> >
> It's unsafe under forced irq threading. There has been a number of
> discussions about this topic in the past.
OK thanks, and our use case is forced irq threading under PREEMPT_RT

-Paul

> > --- a/drivers/net/ethernet/cadence/macb_main.c
> > +++ b/drivers/net/ethernet/cadence/macb_main.c
> > @@ -1616,7 +1623,7 @@ static irqreturn_t macb_interrupt(int irq, void *dev_id)
> >
> >                         if (napi_schedule_prep(&queue->napi)) {
> >                                 netdev_vdbg(bp->dev, "scheduling RX softirq\n");
> > -                               __napi_schedule(&queue->napi);
> > +                               __napi_schedule_irqoff(&queue->napi);
> >                         }
> >                 }
> >
> > -Paul
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
