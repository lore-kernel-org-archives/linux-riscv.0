Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80483C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 02:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/on9RoWeFNeVaBpz2a9guR9P7708NllYYWnl+G4a3w=; b=NDDGSvWCZVK0FR
	cYov8PDhO0TeVoNJczkTmKPm5T5y5EF3CLgQABdcWciJX6EE3Qhbz62oQwCqPVLYNdtBmUvDPvUA0
	l659INo92WRENGAjbMdHMJ1AxNfbcj7UTR49jYiPn0sUougX8XqozRNPF1OLO3kO7pkJNjvdeBi5p
	08+38NK2qirNn21LKlhRvbP6XYskNUJIVo5vMQMTBER9VZ3vTDvzwrw/8qtcZChD3fdhokHp647Bv
	Vc6vjKcq4Z0oWp8DV9xxPfQTlBIi9qc5ZAuqzUnvV9bWIqncRaS4Rhy5kw5PXVJBN7gsBcUfV0+kr
	U8OfW/Ips2wP6fsZbuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVNtS-000ygy-QK; Fri, 24 Feb 2023 02:33:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVNtQ-000yg0-CT
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 02:33:05 +0000
Received: by mail-pf1-x42f.google.com with SMTP id n2so1369584pfo.12
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 18:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v7D5+/tTKW4hdCKLoGhGLZFN3+ohidFIvVz7P7koHlk=;
        b=TqIRXVfgz6LBupiY2MkRcBseRiyJ7neFuVaTF3fYvmFFGl9TsT/USgKJ8ewASzxh3o
         /HRAPsYVkwaMImGHtKYQbogH+nOgDY/U1PMJmKMXeOxWpDU9FLMzJV0YXBA4JTaeGzN1
         YsTkOZ7aoJ6IkvizZRl3Axbg55L7Osd8eVdt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7D5+/tTKW4hdCKLoGhGLZFN3+ohidFIvVz7P7koHlk=;
        b=KrIWbjfPTanEIXHYXFUNSfu0WsWz52nne8TKQQV52UNSBl63OU8gWtGdBtMxjd6A+7
         J4SB0T4LOJjwLZeIEx1JSfK6KxB3ZZmM1aGpZUt0exRG9c1qpHT5LSybGd52TCeaiwez
         0GKMg6/Q0SMEsRjCfJH7mPaBy1XhdUF9xdY2V+kii8EueAw6BNPORceMdft+DtxVKEna
         nBrdUTG8McjdcFzLtMXqd2FHQ7pLN1W7/reIpNBc5wRN4eTYnV2oHyi/F6NM4bTnIuly
         Gq5JvHs/WsjAAzfeVhXKPEFNmd4N+mYonxfppFiWQAGnwk2f+tBHq3N+bCk1UTPfrywo
         J6EQ==
X-Gm-Message-State: AO0yUKVEfBpJRdDbrQkWdghVbrKP12OZyFxNgFx43tbWwIKOYm94Nm5d
	+9yOyG2e8x2EgyvCwrh/xu1vb2649agF0Bh06RMT
X-Google-Smtp-Source: AK7set++kyCManleDnDskA+/fx2yOFWwby3yiI0iFzoAl+ek8Jbav3knAnBru2MFKPfxE5NSNvbWGImJgNblJx3qzTs=
X-Received: by 2002:a05:6a02:110:b0:502:e3fb:bdac with SMTP id
 bg16-20020a056a02011000b00502e3fbbdacmr1435529pgb.1.1677205981535; Thu, 23
 Feb 2023 18:33:01 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCUKHq_8msJtU-H1JvWJ8nY94J0tcarQMBsPNpBZO8sP6HQ@mail.gmail.com>
 <Y/cjW8qVhRTPiz0t@hirez.programming.kicks-ass.net>
In-Reply-To: <Y/cjW8qVhRTPiz0t@hirez.programming.kicks-ass.net>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 23 Feb 2023 18:32:50 -0800
Message-ID: <CAOnJCUJQVQQUn_brgKCMFduo_RUYndFDuV-m0e2g3AQo6CV==g@mail.gmail.com>
Subject: Re: Perf event to counter mapping question
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-perf-users@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, Beeman Strong <beeman@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_183304_658516_0821272A 
X-CRM114-Status: GOOD (  21.06  )
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

On Thu, Feb 23, 2023 at 12:27 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Feb 22, 2023 at 04:28:36PM -0800, Atish Patra wrote:
>
> > AFAIK, ARM64 allows all-to-all mapping in pmuv3[1]. That makes life
> > much easier. It just needs to pick the next available counter.
> > On the other hand, x86 allows selective counter mapping which is
> > discovered from the json file and maintained in per event
> > constraints[4].
>
> All the contraint management is done in kernel, and yes, it's a giant
> pain in the rear side.
>
> From what I understand the reason for these contraints is complexity of
> implementation, less constraints is more 'wires' in the hardware.
>
> With PMU use being ever more popular, we're seeing the x86 PMU move
> towards less constraints -- although I don't think we'll ever get rid of
> them :/
>
> > 2. Mandate all-to-all mapping similar to ARM64.
>
> If at all possible, I would strongly recommend taking this route. Yes,
> the hardware people will complain, but newer x86 hardware having less,
> or simpler, constraints might be sufficient to convince them.
>

Yeah. That's where folks want to go in order to provide flexibility
for future platform vendors by
allowing constraints.

Can you provide some examples or some pointers that describe these
simpler constraints ?

Finding a middle path would certainly keep everyone happy :). Thanks a
lot for your input.

> (and if you do have to do contraints, please take a lesson from x86 and
>  *never* allow overlapping contraints as AMD had, solving those
>  constraints is not fun)
>
> As you note, this is *much* simpler to program and virtualize.
>
> > Note: This is only for programmable counters. If the platform supports
> > any fixed counters (i.e. can monitor
> > only a specific event), that needs to be provisioned via some other
> > method. IIRC the fixed counters(apart from cycle) in ARM64 are part of
> > AMU not PMU.
>
> So free running counters are ideal and fairly simple to multiplex/use.
>
> The moment you start adding overflow interrupts / filters and any other
> complexities to fixed function counters it becomes a mess (look at the
> x86 PMU again).



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
