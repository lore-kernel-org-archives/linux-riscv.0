Return-Path: <SRS0=7JUN=7L=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F98C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 May 2020 11:45:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F1A9207F5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 May 2020 11:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zw9el904";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="VDHKN3Ki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F1A9207F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=80bZ25LFkYGpnK4fJsT/jM+faHqe+BrPlD3nVDw+J14=; b=Zw9el904dkz3pf3+WvGprcPIk
	3waZivrxEQevqSQWcduHlSxDELoCuv3NHUzAv+pQVOR6+p7ggi12xkst9QFYDjyAIb0iBaRT6sau7
	RBMwxxN16XSh9iyFV+qFNis13Gp2kSfh2Qh09oTlJu7FcNLzUDC2xV0s1zGT2gVW+FePWDv+BYc2v
	RPtUoI8oQe1L5cnbaxzdfaEH3tdWgTSXbY5DT2Ukc6Py7kSSqtMkDx+XLOY0/cinB2RoJDVHE2sg5
	2TOVVcm4OrcfwLY6yByRKyKmw/Oem65tx1xlpRCf+BDW99wcBFBz8S/TGo9Zw2NkeSoxpWI8SaIx2
	545WBnnUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jedRv-0000XV-J3; Fri, 29 May 2020 11:45:19 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jedRs-0000XA-VP
 for linux-riscv@lists.infradead.org; Fri, 29 May 2020 11:45:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id j198so6646629wmj.0
 for <linux-riscv@lists.infradead.org>; Fri, 29 May 2020 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=80bZ25LFkYGpnK4fJsT/jM+faHqe+BrPlD3nVDw+J14=;
 b=VDHKN3KiPbGZ3Mzh+XkZikTPHkyenzVkfUUwGGUCDvfp6R/oF8pzZPhfjO74WCMiXF
 mgroetUQKkE5exrhLOpB39/PTeZQ9VHiMxUCxJA7paRI10BDZ7oSMoDpaODmQzfTtmE3
 qSR4XNxpu3P3rLBnNAgCHGx4rhtQik1REA2yABgyw2jIULosWqLwLfuLCwzE1YBsHiw2
 IPRlf7zwYiQ15DjBjiIiKhijoJPxjjZlBL4xSprayMNOlk+aNPL7zM4P1iS/8jbKkZX0
 q2AOJ43bY5CPs3kMQHlooAXFXR8zSyXCYCox5dD+2zeVO5MJxw/fxMWN0GB0DbYZR7+F
 56fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=80bZ25LFkYGpnK4fJsT/jM+faHqe+BrPlD3nVDw+J14=;
 b=I069rMySbjkc3uLITzUOW02tk+oTa72fjA0ZPBsO+9HDQQbegc5FpFN4RdxZlcJNvZ
 T0vl6jjTJrjDbwbh2ts8K58io3M2uKaVv8PfChI2r/2HpON48e04FmspAF+wj/9UMKMo
 Fq4cFg2VHoAPAxMsNMT7Lb5ZGoox0EvDJzZc2KB/rJPY+gGj4nxNsxpxcUjkJCQdId1K
 32+RoO1tRjS/CVp7NyazYQl++MuOsC7cBR8w2Jm+gNEVp4UFf61m3Uryu23szDryLxE2
 SpOegsOqKU6mLZh0n32FLjCkVh84yDhajsvVsRi90/CPitG08MCXx0RDlJgQCz3s+O/N
 s7uA==
X-Gm-Message-State: AOAM53352TSLUw/RgCSrod/uueVshXHTit9OHQYbYeC6RP0bG7caiTyc
 ClkZ7I8ej/0aR1qL36EXgbhjYptJ4Rx7o/kOHA3rQw==
X-Google-Smtp-Source: ABdhPJwAtowAG1R+yTIBQVls0j6RQzfQagRw1F8EGcEDpRpbszT3jyUNP7ERJ23xR8mbw6h0K/RaOycTiqGZA+SQTSY=
X-Received: by 2002:a7b:c5d7:: with SMTP id n23mr8784679wmk.185.1590752715012; 
 Fri, 29 May 2020 04:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200521133301.816665-1-anup.patel@wdc.com>
 <20200521133301.816665-4-anup.patel@wdc.com>
 <140c6fa723225ff138e8b39c4f16c9c0@kernel.org>
 <CAAhSdy1uRzsF7w_GMaPhfyNnRkhRNqT2edL0+96gwocWiXNpOA@mail.gmail.com>
 <40251a7764fc23ed19426df0adf0fc4d@kernel.org>
In-Reply-To: <40251a7764fc23ed19426df0adf0fc4d@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 29 May 2020 17:15:03 +0530
Message-ID: <CAAhSdy3iDbMSPeTSv7vM=1DSY8i1a1ugoB2Vxt3PY_if8JWJKA@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] irqchip: RISC-V per-HART local interrupt
 controller driver
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_044517_072758_1E869343 
X-CRM114-Status: GOOD (  14.29  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 29, 2020 at 4:40 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-05-29 11:45, Anup Patel wrote:
> > On Fri, May 29, 2020 at 3:39 PM Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On 2020-05-21 14:32, Anup Patel wrote:
>
> [...]
>
> >> > +/* Get the OF device node used by INTC irq domain */
> >> > +struct device_node *riscv_of_intc_domain_node(void)
> >> > +{
> >> > +     return intc_domain_node;
> >> > +}
> >> > +EXPORT_SYMBOL_GPL(riscv_of_intc_domain_node);
> >>
> >> Why do you need this? Why can't the timer node refer to its
> >> interrupt-parent? The irqchip shouldn't be in the business of
> >> working around DT issues.
> >>
> >> At worse, use the default irqdomain if you must, but please
> >> avoid this kind of construct.
> >
> > Even, I don't like exporting riscv_of_intc_domain_node().
> >
> > Thanks for your suggestion, I will certainly use the default irqdomain.
>
> This should be a last resort solution. The irqdomain should
> naturally come from the parent interrupt controller, accessible
> from the device (the timer in this case) node.
>
> Use it to for backward compatibility if you *really* must,
> but this is generally a very bad idea as it allows all kind
> of bizarre fallbacks and hides bugs.

Okay, I will explore other approaches and keep default irqdomain
as a last resort solution.

Regards,
Anup

