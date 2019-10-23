Return-Path: <SRS0=37yX=YQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A677FCA9EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 21:35:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D8721906
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 21:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLwNfEH3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l5F5PrtU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78D8721906
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQlFJ9tYdWVnHWQybIrK2DuPKVKdgDdtF+WKYeMom5U=; b=PLwNfEH3x//esN
	i/iAEd+eXONovIg78KBGrTYuj5lglr8M3/jik9YfaF2mjF4iNldFxuTT4cny3Y0j+illZFuwJ2kj8
	i/tFlJKsbsmLX+4kLFaIJklwoa6NrO6UGtMyeThgRpWuu2HIkbB1twvchObTidH+HHoGfAems/V0i
	2jieyXPOcPv1rFkUr/Aq+iX+SDORi8ZWAaXLretBm9co0/G87Aft7cAVDA6M2w1fL0c97EgikWVKR
	rX3MB4LOBhmtrAzuPqVxMn8jVln2MQYgNllYjOYCbp2gd64ybpcFurwqdq336uFvmKcXC/0GVF74t
	8vJJRngFi6bY9OWK4zbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNOHv-0000YP-Vo; Wed, 23 Oct 2019 21:35:27 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNOHO-0007N4-NF
 for linux-riscv@lists.infradead.org; Wed, 23 Oct 2019 21:34:56 +0000
Received: by mail-lf1-x142.google.com with SMTP id v8so16751393lfa.12
 for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2019 14:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rGPwK2qvLOHHeiShwuNhPOMbtWTnBcRhDfAqRa9bPnI=;
 b=l5F5PrtU2t9i18n6xfCjgMWrG874CPae8jsguMum6ERhJNmTCZL1Sf8mB3QrUPdOqX
 6/28YdH4nbJZ9kZ6IWZM9t8zgUYYNaebbCGj2J7sLm0b9g1girH70KAcc51l0SGd3FY1
 NxmQlBVu639C8YXA96OdQo+udlfgBsZ+ZoEYqqEYijugS0PRDl5V614TDT1jsw4dCxZZ
 BN8PInrbqRfRa/ncPI0Vd1wy7Ruo97EphkvQIr/cd5q0wHUp9VuVIb0MpJyj/PdjfBs3
 el8VXIDpssMYJnyr8VNuzOgz74qbu67jwNnncZcgNydym3v716T9unVN0w6ES1MwuJ5S
 Go2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rGPwK2qvLOHHeiShwuNhPOMbtWTnBcRhDfAqRa9bPnI=;
 b=uH64BnzSf4N7vspxBrQMgm6hssDZrKgOajUEoX+qsZUHdsC8El73begSoJGnwznDYp
 fe8kYY445FoBl0pv/1XpOKC8x0wrVPuNEsXujNoY4o06YDF+PWZHXrAOxklaPGN722Ci
 jS0Gd5R05DcDyvpe1kJRFHXWPVAVfLyS6+8cgTIvLQGILXmsMhRr6ClYX2L6OMDqHl9Y
 uAUBSpLwlxk3BJvL1C8WM+25oVVsGMJG0RQq2anTIsRFulEapSWIaYZagqqCKidUjuiX
 dzKnwJjS0OmxO6SZLlhZpWkIg/G7VKsU/shSK6mZmLAu1YmN72DZoB0f9nl8P5xNC5Px
 aQRQ==
X-Gm-Message-State: APjAAAXkTDMhqb+02EBM34l7UL9MmuIRUHga70udRlDREVjyTkntqVWU
 Gv4hV2a5FCVjxETNZHgLv0VYv35vINKcNH/XjHmrWA==
X-Google-Smtp-Source: APXvYqxklwi8yCUDuyoen0TIoT0yvGecablQ+JGHeUfmD0h/tYBf6OcxZkVpOTSwjlMub9h3JNNau7T9OpBwuNpEf48=
X-Received: by 2002:ac2:447b:: with SMTP id y27mr13253233lfl.135.1571866492629; 
 Wed, 23 Oct 2019 14:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <1571847755-20388-1-git-send-email-alan.mikhak@sifive.com>
 <alpine.DEB.2.21.9999.1910231152580.16536@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1910231152580.16536@viisi.sifive.com>
From: Alan Mikhak <alan.mikhak@sifive.com>
Date: Wed, 23 Oct 2019 14:34:41 -0700
Message-ID: <CABEDWGzeTLk7POWUkU1vJfyxGwjzOzWK-1_RAq7rR1wRh5hTFg@mail.gmail.com>
Subject: Re: [PATCH] irqchip: Skip contexts other supervisor in plic_init()
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_143454_859638_76170F07 
X-CRM114-Status: GOOD (  16.20  )
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
Cc: jason@lakedaemon.net, maz@kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 23, 2019 at 11:54 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> + hch
>
> On Wed, 23 Oct 2019, Alan Mikhak wrote:
>
> > From: Alan Mikhak <alan.mikhak@sifive.com>
> >
> > Modify plic_init() to skip .dts interrupt contexts other
> > than supervisor external interrupt.
>
> Might be good to explain the motivation here.

The .dts entry for plic may specify multiple interrupt contexts. For example,
it may assign two entries IRQ_M_EXT and IRQ_S_EXT, in that order, to
the same interrupt controller. This patch modifies plic_init() to skip the
IRQ_M_EXT context since IRQ_S_EXT is currently the only supported
context.

If IRQ_M_EXT is not skipped, plic_init() will report "handler already
present for context" when it comes across the IRQ_S_EXT context
in the next iteration of its loop.

Without this patch, .dts would have to be edited to replace the
value of IRQ_M_EXT with -1 for it to be skipped.

I will add the above explanation in a v2 patch description, if it
sounds reasonable.

>
> >
> > Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index c72c036aea76..5f2a773d5669 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -251,8 +251,8 @@ static int __init plic_init(struct device_node *node,
> >                       continue;
> >               }
> >
> > -             /* skip context holes */
> > -             if (parent.args[0] == -1)
> > +             /* skip contexts other than supervisor external interrupt */
> > +             if (parent.args[0] != IRQ_S_EXT)
> >                       continue;
>
> Will this need to change for RISC-V M-mode Linux support?
>
> https://lore.kernel.org/linux-riscv/20191017173743.5430-1-hch@lst.de/
>
>
> - Paul
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
