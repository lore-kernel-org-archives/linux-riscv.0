Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577A6C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27028217D8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:37:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YctS7uA/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="aYsUlbGg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27028217D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWOYlPKnqFuKktP03PiLCqKW2BR0dOJEZI4gmBsvofM=; b=YctS7uA/2xB6pQ
	i4YD8EduC8ANkJx9zK+rNJQWl/nynFCHynXJEqfw2lwCU1lkCWpIKCJFe4vYyG0bfOEdCYC44lUYX
	0G5f0CeI/4jOz5Ov6Z5ohKK0sxdA0eULIH5VZzK/VNQn2Nc5enL4eyw/SWYF/Lgle1oZ0fLTySiNm
	XfZkL3mzYv/+pHyjoqBVAEOxtJBErohwfix8KHqixCyvdWcJgVCZelyCHWULIynj4xaMtx5FYQj0w
	VfFp/+PLWYubJoKOQ+76fIWs2ErsUQY24CdZ42igD+Wz2OzU8GQ6BOUmZm7uQAfYYlNCTpBt5fo1l
	leLW1xzl/unnVWLqe4cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZAsC-0008Sn-H3; Tue, 18 Dec 2018 08:37:04 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZAs1-0007vf-9G
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 08:36:55 +0000
Received: by mail-wr1-x442.google.com with SMTP id u4so13977722wrp.3
 for <linux-riscv@lists.infradead.org>; Tue, 18 Dec 2018 00:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6xPOHkiFjAua7p3m3cOH8RbdrxMp2PAq5c5QrYtguc=;
 b=aYsUlbGgFWDEdTPnV0XlupgMvbbuBmYOMIqGPJhPE81Fbq+7a85inoth2jcqtjld65
 ifQGGizdmqfPBW4GCIt/7YJsK+C9gtdJCTcvUT7M4ncQP2Ul1zaSXqDBnUvd9p9zy61z
 6X5+M08//P845iFngS3zwQEnXc3zu6DdZkBmKPd5SaEt5OQYOKeRTVhgB21wniypvAtp
 jnEjOCL2va04n8mmgIUcOGRtQft+FhDtKeOvDL97c5QDoaQgDbFONqZVm7b1qONOnkB3
 Z59+Jhc4/JYWLYcMB7uBZWKuvrkFVtDm15abMr7TxlGgDhfz8w3ct5x+Ao17N9lgxxZM
 m2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6xPOHkiFjAua7p3m3cOH8RbdrxMp2PAq5c5QrYtguc=;
 b=BCIVVHI9Ji/+AL4K1+5kQvhN+7B+QkNO1r5TsdRrhQwrXHAKTES67wOjW9CqOTsFrI
 tZRDAmhm4k+LqlpIqbbp47ZkT0OlQLebvh/TxIzO9jWtdm86ssne3MhbyrQgZxJA8VRl
 dF0VqGeaq+eNZne4pVx3UXiPITevSLNBmv7aqDWxgf1LWidsoQ/SjAb8HZHUTG2khK+m
 7i4k7RZtAil7Ht5fm4ULLM3+XqjaK+QUjoPjwdZsrYG8UXMV4ohiZQLcCPIwnOh4b0cU
 WabA4U9qRE7hDtxoVA4igY+8L9W5sTrV3rjakqOF4MpbUYpzumvw97EFZYQPeQqq89Py
 l51Q==
X-Gm-Message-State: AA+aEWZXhIUAJCHDdPcV+YN0QEh4x2HuzrhJh6zcz6SGZQ1yQslwej+g
 i5j0DkOhjH1wZeeiYrtwbmCc8yr0uNG8bxHAYrWHkQ==
X-Google-Smtp-Source: AFSGD/WzzYdKUiN+mHiqO1uy6kfTCG72BEYSfUHQGU+a9tzK8Rc55HM/2nSM418vT43qkyK3CtQhFQxDEfprdidy9P0=
X-Received: by 2002:adf:91a3:: with SMTP id 32mr12280891wri.99.1545122201042; 
 Tue, 18 Dec 2018 00:36:41 -0800 (PST)
MIME-Version: 1.0
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-5-anup@brainfault.org>
 <20181217182812.GD7086@infradead.org>
In-Reply-To: <20181217182812.GD7086@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Dec 2018 14:06:29 +0530
Message-ID: <CAAhSdy05S1SSOC3e1r9ULrjFyGEquR50TKqvKQN8OFxVdgEdtg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] irqchip: sifive-plic: Add warning in plic_init()
 if handler already present
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_003653_331316_F04094A4 
X-CRM114-Status: GOOD (  18.29  )
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

On Mon, Dec 17, 2018 at 11:58 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Nov 30, 2018 at 01:32:05PM +0530, Anup Patel wrote:
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
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index d4433399eb89..3d4f205f8abe 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -234,6 +234,11 @@ static int __init plic_init(struct device_node *node,
> >
> >               cpu = riscv_hartid_to_cpuid(hartid);
> >               handler = per_cpu_ptr(&plic_handlers, cpu);
> > +             if (handler->present) {
> > +                     pr_warn("handler not available for context %d.\n", i);
> > +                     continue;
> > +             }
>
> Shouldn't this be something like "handler already present.."

OK, I will re-phrase it.

>
> Otherwise this looks fine:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
