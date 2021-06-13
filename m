Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6B9C48BCF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 12:30:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F556120E
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 12:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F556120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0yaP3P6+t27p85NolFedpvuzDdcLuKwc1VGvr4nYLw=; b=Od4A7lk+OUwIVe
	ao53T9ezxVIqzCjfeLZ2LSjWMnodOqU6upoqJWzBmaE1eKNIE6v8UdiAs8EQfcnx/fW1B24RysXMs
	3hSshTK95yDXjM42slG2s1qyTbKNCzcYzS13Y5IXzmX/Zo1CrTIIqEZDE3c4c7cQp0Za/je9XEEGq
	cn2kKBAwWfoRGe8e8AnTwPZS5brUXaz/bXRHioKqyLey0FanQIeYfDUf/8dFEcas7xfp8TkrOarxq
	qJ2O9TMSvsT2vy6f2gF2tAMq1Yqil2bynLu0PFQ7VSZJuC8oVRKvQcqKGyAyk8DDMffbJWsSpx1Ea
	w6fQyHoGrzQ3tv6ItodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsPFS-00AQrr-0D; Sun, 13 Jun 2021 12:29:54 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsPFQ-00AQrC-5W
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 12:29:53 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso11168315wmj.2
 for <linux-riscv@lists.infradead.org>; Sun, 13 Jun 2021 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SFw5V6rcIrPE+2HCF52bPq6yFSTBGQP95PAhiE4OJDM=;
 b=hRzQ0f+uIAiruqZ6/UeXM9i+Qa0s+aGsy/nypdMQWkpcSjkvdKrsSHPYv4mlB/ZCI6
 Y4l4Oyw+87+XCTxQ2o3Y40Q9jfAWQUhLeuPYedBsrPwhtaFR1E/BEGcq7ub2yxv2l9xA
 2VIWUeqeizWjSq2cq2obkiMj1IuntZsXOeGy3rlfSHq60wHoHxyEpe6Fxh/zlNRat0Tq
 3etlBxe8kGgQR5wPXSCXxVVKqfXC8aNpjNIzd3lQSXvCTakLIkaU4GMwU9jkx+y1wIFg
 oGIkRcgoKezfZKFOu4Q75CdXRVJlnjPcCUF6+X6m7U8bryEa8VrmodzmJ80aFVfkLtOv
 xhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SFw5V6rcIrPE+2HCF52bPq6yFSTBGQP95PAhiE4OJDM=;
 b=Y+1Vs4UIrle3bQnuJeHYAk7nr0kv3SPFHnsNb6b2I02wW+lLnY1//3pxvPxJOjGRAj
 bVs8wQ9UyJxGXK2qHSNFQiZ32P4Y4zdWce/KSGDOwhxut+zYuh1rlj9QzGIHIKe6ihoH
 0eUcU0w+HbjBrYhgg+FsAX3RQkAxzFKavKx7vHqPqRqqdKsdztjCkO/nNFUeYl0Orvo6
 OAZObdaJO+m49QBze91fskORQgGeUmWqU/xH46e6nIj3cu032sCxsRMXi3lIO/o86RVj
 +F8fyZ0g0mt3ECpzWvi4A7BdX0dyhvwWX4f1bpb0hpdiX+hQchBPjfYcfMq55oToTZOx
 By0A==
X-Gm-Message-State: AOAM530iZptBjMQ2UAjvkSeVbLx6HCApvq/81PtaYb+j4nCCdv4pLYpd
 CrhwjCW8aYPDgoMOuPKh1xl7KmMWUgNNLndhg97ffeu8lUihXw==
X-Google-Smtp-Source: ABdhPJwEQO4Mjls0s+EY5auqfFyOv+/X1rhrcKbVkmx5yPV4XoADVdTjZkrOoOg0ZYmeEwvrgAlMsk8rzjAouUfGo20=
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr12077157wmj.134.1623587330548; 
 Sun, 13 Jun 2021 05:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-5-anup.patel@wdc.com>
 <87a6nut8h9.wl-maz@kernel.org>
In-Reply-To: <87a6nut8h9.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 13 Jun 2021 17:58:39 +0530
Message-ID: <CAAhSdy1-VbEwmWbYzB4KmCK3HjDXzi5-3S+9BS-D3o6q0iOY9g@mail.gmail.com>
Subject: Re: [RFC PATCH v1 04/10] RISC-V: Use IPIs for remote TLB flush when
 possible
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_052952_236889_794CB13F 
X-CRM114-Status: GOOD (  26.40  )
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

On Sun, Jun 13, 2021 at 3:03 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 12 Jun 2021 17:04:16 +0100,
> Anup Patel <anup.patel@wdc.com> wrote:
> >
> > If IPI calls are injected using SBI IPI calls then remote TLB flush
> > using SBI RFENCE calls is much faster because using IPIs for remote
> > TLB flush would still endup as SBI IPI calls with extra processing
> > on kernel side.
> >
> > It is now possible to have specialized hardware (such as RISC-V AIA)
> > which allows S-mode software to directly inject IPIs without any
> > assistance from M-mode runtime firmware.
> >
> > This patch extends remote TLB flush functions to use IPIs whenever
> > underlying IPI operations are suitable for remote FENCEs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/mm/tlbflush.c | 62 +++++++++++++++++++++++++++++++---------
> >  1 file changed, 48 insertions(+), 14 deletions(-)
> >
> > diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> > index 720b443c4528..009c56fa102d 100644
> > --- a/arch/riscv/mm/tlbflush.c
> > +++ b/arch/riscv/mm/tlbflush.c
> > @@ -1,39 +1,73 @@
> >  // SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * TLB flush implementation.
> > + *
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + */
>
> I find this a bit odd. You don't mention this addition in the commit
> message, and a quick look at the commits touching tlbflush.[ch]
> doesn't make the copyright assignment obvious (most commits originate
> from either SiFive or Christoph).
>
> In any way, please keep this kind of changes out of this series if
> possible, and have a separate discussion on who gets to brag about
> this code.

I agree it's unrelated change.

The commit history suggest mm/tlbflush.c was added by Christoph
and other commits after that are from Atish (Western Digital).

I will sort this out separately.

Regards,
Anup

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
