Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B39C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:50:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26D3B2133F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 08:50:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVySxfO8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="XfODicEZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26D3B2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KM6u7JBPM2E2oXKbA24e2nuAVvMoWcPVTRhk8psnyaE=; b=mVySxfO8RvZqRA
	xtUzyXgCPuhWx/xQueFUsBettrv8E39kkjiJ3CcfalwvrWr+fzu1vusz6SWCJqT3GdBSv85w4grAl
	af6vJ2CwcnCNgE9RZhg2vvAKgUxDWa9wZ0VMqv6dSdABp0DkwvqpD45vZAM0VB1q/qv++R/w3B1/J
	hE235ep1600yfHF5TUN1S0ymsG7ZEDvbV/YytGGUNmYSG29nDRtvzqEhdGL6rwsc2qzWwojynggMA
	hRgtApXng8WaDzM2HF6DR1ofEUM8Zu2N6/waK04GnKBohnJffwkzpHXNfn2B99bGVe6J+6zPZ2Z+a
	l8Ct9LIockGbHPmTKP3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZB5J-0006FS-1d; Tue, 18 Dec 2018 08:50:37 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZB5G-0006Cl-2y
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 08:50:35 +0000
Received: by mail-wr1-x442.google.com with SMTP id t27so14995370wra.6
 for <linux-riscv@lists.infradead.org>; Tue, 18 Dec 2018 00:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c8CVInH/SbEiauJpAH+701m4etUfcrFaiMTk9o+WaXM=;
 b=XfODicEZuXglLaLhb0Mx6r7CDHrVRQnpjHtTqVFRqLzKs93Q0/5G4JzUMttOtwTm3o
 gc2OMYxj7QZGuMJcOljt/AmxYq3qXSQRbXsBouoG7CGwqx+r5TYjJAd54HEmGzSSWA0l
 j3zRwkHxrZK2ueV2l+hIUopDlMjeTc8jeUkvUiEUjryHrQp/UaFMNPzgHSgtXoX8EelP
 FyADUBTcXXqbIL4usyRZUeQaDXeB9rhIgdH9w6eyeY1BwR0g1DL1XdpuTbv7kmTvUCCl
 2KONdXA43hKkLnPm+0cSMGvigCY0P2CdWvAjKlkTxERmGZ+SuGE+l0YKyQg461siaRpH
 sCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c8CVInH/SbEiauJpAH+701m4etUfcrFaiMTk9o+WaXM=;
 b=eh9BBezfTHsb/2YYke9BZ/I/duxGlEccPP3NCP7gJesQPW2QK3oduZsKsjBAsUjn4g
 s3wl7yYVP+vMMz7s2IlzANCrQ1crZ6AnSAMt/sgDfgeDdTGqiEIC8l2R9bKJRrzURKEa
 8CvyZ4i6hPk+DWXLk+Ip1Nj+swkQosoYUmCDhWzDA//e0RAW4tU4LHLmTLRaREl35af0
 JE1nQ8xI/kHBfwRGw+7c/LAZ/a0UTr2HrJ/bgCZ7QVzX92MKf2OZ7JvXEVMuqghmnVwz
 IKuFJPgVMp6NgpavIj04UtINzww9UJgrOGLIlwABjxPFAQLlR/rYdB0QyiWqo+hGqsF9
 veUg==
X-Gm-Message-State: AA+aEWYQEsc2OMFdZaUGgJS/dpeadjCqPeupd9E0ksy+EKv3JGe5Vk6V
 2MGbHL89euJv6WDbipL87CX/Twn1vJSzt7T2+3/cjgLJ
X-Google-Smtp-Source: AFSGD/WKPPe/HQ7gZY5Aorl6zhP8OTNnHT2P8RntasKyZaqkXlwXzXL63KPV/JNloZx6uWTkOxX5DeUECoCrRzBIF/U=
X-Received: by 2002:adf:f785:: with SMTP id q5mr14616682wrp.9.1545123021978;
 Tue, 18 Dec 2018 00:50:21 -0800 (PST)
MIME-Version: 1.0
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-4-anup@brainfault.org>
 <20181217182719.GC7086@infradead.org>
In-Reply-To: <20181217182719.GC7086@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Dec 2018 14:20:10 +0530
Message-ID: <CAAhSdy3i+ap2J0By3nRqK6yvb8oD4-+2QwUO9PH9GM+0odKqSA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] irqchip: sifive-plic: More flexible
 plic_irq_toggle()
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_005034_140873_59A179C8 
X-CRM114-Status: GOOD (  10.02  )
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

On Mon, Dec 17, 2018 at 11:57 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> > -static inline void plic_toggle(struct plic_handler *handler,
> > -                             int hwirq, int enable)
> > +static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
> >  {
> >       u32 __iomem *reg = handler->enable_base + (hwirq / 32) * sizeof(u32);
> >       u32 hwirq_mask = 1 << (hwirq % 32);
> > @@ -92,27 +91,27 @@ static inline void plic_toggle(struct plic_handler *handler,
> >       raw_spin_unlock(&handler->enable_lock);
> >  }
> >
> > -static inline void plic_irq_toggle(struct irq_data *d, int enable)
> > +static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)
>
> It also removes inline statements which seems rather unrelated to
> the patch description.

Actually these functions should not be inline because plic_toggle() uses
raw_spin_lock() and plic_irq_toggle() uses for-loop.

>
> Also the actual addintion of the single cpumask argument is simple
> enough that it should probably go into the patch that makes use of it.

OK, I will have separate patch for removing "inline" and move addition
of cpumask argument to last patch.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
