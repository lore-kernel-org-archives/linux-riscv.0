Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29A4EB64DA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 17:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXwMqSbuEt7G9w3gOdvvvsQLk6K0BCv80BJ4nxV254I=; b=ZuRV0dhvVEyXEb
	Ww1H0OeJLq7CNxN9vZXxY/i1NyGCh4Dk5WMxcWnwqqOhpbQ1SqsZ3Nx8BsSXRimgClX/4A0wOE5u3
	sNzjWay7X0hzzz7NIrNXs/jIfy8NnjG8qe83ftrTemDzXMQzA0Yqjx1gSkY2p35sWU7K5CToKtb/C
	7lUo3fkvxdCxy5kMEA/G/q9nCh2REFW44W225BKBcRyLgoXVppulLRAT/mW5iXF+hOmF3wMJIu3Ru
	tWyMdtHGNwr17P5IM2juP1+57733zKzZJix/mdRlF1Req+4z7sNNb/HnVO0Od1X15li9/7LPPyoRJ
	E9H0pQNoXqbiX1KC/XuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjvZ-00Dwh5-1X;
	Tue, 04 Jul 2023 17:35:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjvX-00Dwev-0w
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 17:35:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc0981756so57841635e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 10:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688492094; x=1691084094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qJ64lF89VpbBy1ulIr9SZuXHSuhm2fS1ISkB9mGrhk=;
        b=UaNfZIHtqk8sEbad/eQ98L/1Xhl2t0Rk2Cg/sDrY56rhiua4m2qDFulF1/qLVjRl+S
         cKvYQ7uLAy5lu4t51ZX4buDN3G7HRRoHRzYeYqY3SMkVnx6TD1+UVZnRhrmxhQ61Q493
         +Or8Aijqk1dkK7CSdnUQ1vOR7Wh3zf4K7rSv9EmlxbtiBCk4J2FIJxt4rBWo9Zo96Exn
         yM5TdQuJNG3DazERTfy13G3Tk7f6vcCKSD7SqSonGaPU7vrvAWP7act/UC/JQXTLdKwA
         os9+ZDwZWt6eHP78vqaKcB7cqPXG0zTGfRuw1v6yl6U81iH3tcsxFcy8dg0dKeW4zs9a
         FYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688492094; x=1691084094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qJ64lF89VpbBy1ulIr9SZuXHSuhm2fS1ISkB9mGrhk=;
        b=K99qRPKtx7kAeFdR75r5X4TRXjnGjC2Jj+XPb2GyN5m87D2GJQREncpmcQiEOpCuJx
         uM6BvwaMCjRunmT6mTMYqLsOrqrFK+V9is5pa61NNH02fdEbr8PzQo2WQth2Q7FXndhh
         ztw22YIxSLiOIu2WxR5C3OOD/nmqpKlfAOg6g4Q6Q0nuDD7HregoyBkbVItPaId6Wz7V
         hpKr4bHQngIutE0BruQxYgjtKxu6D1Ro0A7y+R2ZJywNqxjUWZv1748BYZDGBa4AbYhv
         gZFMvA7UpvYqx7q6HDNE9GEyfVrTFmDad8fgc6KD8cEqRr/rL+5eKEGZWF1wZYvm6RyF
         mqXA==
X-Gm-Message-State: AC+VfDyvKA49BP+XD+HVe3FntYMZpPqMl+J6JnJievwDeiVjAY2vtwNv
	qF6gp2CgPNe6IrE5FJVlp0LxSQ==
X-Google-Smtp-Source: ACHHUZ5jn9n9ZjzIR1LoKOiyjbakRHjBusBJI/fMlOmuJoqSwT0055ZXuMXIRChWey7suI30Cuw7cA==
X-Received: by 2002:a1c:4c10:0:b0:3fa:991c:2af9 with SMTP id z16-20020a1c4c10000000b003fa991c2af9mr10773167wmf.16.1688492094251;
        Tue, 04 Jul 2023 10:34:54 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id u16-20020a7bcb10000000b003fbb5142c4bsm17163518wmj.18.2023.07.04.10.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 10:34:53 -0700 (PDT)
Date: Tue, 4 Jul 2023 18:34:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: guoren@kernel.org, arnd@arndb.de, palmer@rivosinc.com,
	tglx@linutronix.de, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, mark.rutland@arm.com, bjorn@kernel.org,
	palmer@dabbelt.com, bjorn@rivosinc.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
Message-ID: <20230704173451.GD385243@aspen.lan>
References: <20230702025708.784106-1-guoren@kernel.org>
 <20230704164003.GB83892@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230704164003.GB83892@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_103459_369015_A5EF67A0 
X-CRM114-Status: GOOD (  18.06  )
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

On Tue, Jul 04, 2023 at 06:40:03PM +0200, Peter Zijlstra wrote:
> On Sat, Jul 01, 2023 at 10:57:07PM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The irqentry_nmi_enter/exit would force the current context into in_interrupt.
> > That would trigger the kernel to dead panic, but the kdb still needs "ebreak" to
> > debug the kernel.
> >
> > Move irqentry_nmi_enter/exit to exception_enter/exit could correct handle_break
> > of the kernel side.
>
> This doesn't explain much if anything :/
>
> I'm confused (probably because I don't know RISC-V very well), what's
> EBREAK and how does it happen?

Among other things ebreak is part of the BUG() macro (although it is
also used to programmatically enter kgdb).


> Specifically, if EBREAK can happen inside an local_irq_disable() region,
> then the below change is actively wrong. Any exception/interrupt that
> can happen while local_irq_disable() must be treated like an NMI.
>
> If that makes kdb unhappy, fix kdb.

The only relationship this problem has to kgdb/kdb is that is was found
using the kgdb test suite. However the panic is absolutely nothing to
do with kgdb.

I would never normally be so sure regarding the absence of bugs in kgdb
but in this case it can be reproduced when kgdb is not enabled in the
KConfig which I think puts it in the clear!

Reproduction is simply:

  /bin/echo BUG > /sys/kernel/debug/provoke-crash/DIRECT

Above will panic the kernel but, absent options specifically requesting
a panic, this should kill the echo process rather than killing the kernel.


Daniel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
