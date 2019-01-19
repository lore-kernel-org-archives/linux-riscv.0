Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7683FC61CE4
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:04:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 442CB2084C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pjmnd8//";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ej3A4cbV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 442CB2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+P1fuCkHnalAvOnooJp5bQJybCMhMG4rmMZvOWMF2Z8=; b=pjmnd8//iBeYLt
	7m+E/skGXC4R6SINYC/2C3CH1H42DLPABK2oeH3vDTuK4sAV6rIDsBub+TN9L98KNS8etaFmN7SGm
	LvN/r0cg6+KT5SlETFFfGTCrMqlD5RtSbRXmHg9TkbbYv0dog3elxZx2j4AOTJylzKMegI1BAka1y
	Omed+bazmK5XMVQRZz1LVZnRpKeyoP+weivRT7YLBJIbL3eHU7PZzMxDGWEQUkIBMdbzWINe3VCvp
	naM3RQEUrj0/ZR59nip68u1x8lBb3mkygv6gGzGAd/8v9LeqlBA3rhRw8isK2RcwANP3ACFDkVPPG
	zz8u60C640qA9HmNLR3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkink-0004Wu-3Z; Sat, 19 Jan 2019 05:04:12 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gking-0004WK-BT
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 05:04:10 +0000
Received: by mail-wr1-x441.google.com with SMTP id t27so17451799wra.6
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 21:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+9OqQUiReqIQ8YZUpta0SOLU8AXMnOYWaBGRv3HmoIA=;
 b=ej3A4cbVNw+WNEQRTqo4RQQTaDkUvo4lgXKqPYvJTPYt421Q+RMaDbVLxlZtJxHudm
 xigS9+qb1mi0V+nPUQ2Q8IdLQP1ADUqolewkmoLyWaASC+zPAa0xzlViJJZ0TrYfiZyr
 aF2aAWRKsSFoZ9a0VIaNPTc1p1diZLz0ynrn0u550LXBaWBewtf7PyI9DJElfKzEGdCJ
 m+62gjZ5N0FPtUwJloGjGv9r3jxehZh3v6gmaUxQGarDrO556NIdH7l2PNT9Ma2jygZn
 459lBhI1eLXbgjXBaAeEO2WhhXVDXvG8qY0ASPhirPF4YW3sCTTUsF0TmTQhLCvxiZ//
 2b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+9OqQUiReqIQ8YZUpta0SOLU8AXMnOYWaBGRv3HmoIA=;
 b=Xh0DwlYb1AmxpZ4zCXLgeym0tCxRbqBtqz8UEBEcUljDMb2wXVG7Mr1k9818NANLfp
 0DFEwp8JEHGK/obC6+Qd3hfpfpscVaGBFqb2AIBqy5Tzaj5VkJ3gHW8dl51lOEwICtYh
 Qq4a2rsI8u5rDIeHcNfjYLXDBgOMMJXT+YabZFGHVs8n/41Fz8ZdrkkNcQNnmHFKwxhc
 Z3sgMKWtf9CayeRmfsP/mRejJl4g0WtZUbTV2bNM+ZmQ5rxRrIwCuOj6IUZjD8GaZIbJ
 jT0MuLGO1TrnOqVdmJKE9qhtA7mYsZXUqagf6wDR1mSKjHlZRzmIA6iPqyEM9B/q7vz9
 1aJg==
X-Gm-Message-State: AJcUukd+iA1IaiohHDC0d0ivudb7+BDDh3p8xtIljdEBpzGuSZ6eteap
 ZY0yDO78Gsid/fgie+dAEy8sosWiPc/fJUynLgLoCw==
X-Google-Smtp-Source: ALg8bN6hsLNOO2n706lYj/qXmaUAWBGbeNV8WrD9+iolzrSHI5TI3D/DCf9qcO9Q/ZfaT6FiGofkpIrYZBDrbymV/cg=
X-Received: by 2002:adf:ee07:: with SMTP id y7mr19817841wrn.187.1547874246381; 
 Fri, 18 Jan 2019 21:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20181227111821.80908-1-anup@brainfault.org>
 <20181227111821.80908-4-anup@brainfault.org>
 <20190115155453.GB13095@infradead.org>
In-Reply-To: <20190115155453.GB13095@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Jan 2019 10:33:55 +0530
Message-ID: <CAAhSdy19yrGsXADNNSF8kuoUULqZCFdZ4JKc3_hxBZKHf=dJrg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] irqchip: sifive-plic: Add warning in plic_init()
 if handler already present
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_210408_393811_64A7B319 
X-CRM114-Status: GOOD (  18.31  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 15, 2019 at 9:24 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Dec 27, 2018 at 04:48:19PM +0530, Anup Patel wrote:
> > We have two enteries (one for M-mode and another for S-mode) in the
> > interrupts-extended DT property of PLIC DT node for each HART. It is
> > expected that firmware/bootloader will set M-mode HWIRQ line of each
> > HART to 0xffffffff (i.e. -1) in interrupts-extended DT property
> > because Linux runs in S-mode only.
> >
> > If firmware/bootloader is buggy then it will not correctly update
> > interrupts-extended DT property which might result in a plic_handler
> > configured twice. This patch adds a warning in plic_init() if a
> > plic_handler is already marked present. This warning provides us
> > a hint about incorrectly updated interrupts-extended DT property.
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index 01bbbbffbcae..b9a0bcefe426 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -229,6 +229,11 @@ static int __init plic_init(struct device_node *node,
> >
> >               cpu = riscv_hartid_to_cpuid(hartid);
> >               handler = per_cpu_ptr(&plic_handlers, cpu);
> > +             if (handler->present) {
> > +                     pr_warn("handler already present for context %d.\n", i);
> > +                     continue;
> > +             }
> > +
>
> Just use WARN_ON_ONCE?

WARN_ON_ONCE() is not suitable here because we want know
all the context IDs for which handler is already present.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
