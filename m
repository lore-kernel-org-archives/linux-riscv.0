Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEC5C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 20:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9NwuFbA99nGQ2zrJsnDckZTabZ81yTPU84Nu7Isjw4=; b=Dc8xx7DMgU+Zok
	snZKn0k+EHbMIOZ/XA9sXF10OMrP+VyI8zHqCP1j+GIIMuvOLMB8vVq+sKMGvP5CeN9IIgMKHzXIa
	1SNuQQcZ+X6et5KdKawNWHzk47LeCxT5PD8ABcHIrUeeolJOyTY4Ex8Nuwn5r+I/t17ma8wLIBDu3
	rMrA/mscJaEJX9iQtQdCwlPSXPMGnwV/sYyRvg/T3p5vd6WFLVZLMZSBc1BQNPnofvE1Bshltvg/T
	embljrl/d+crYyep5uUwxQ/ViNy7vW5XY4hhV+xsg+gN8w0quIkKnWSwZiQLqOKsX8wEBZbN+E95t
	BqOe++qumOg85w8o393w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCSny-009Y0e-5w; Tue, 25 Jan 2022 20:52:42 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCSnv-009Xzj-7k
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 20:52:40 +0000
Received: by mail-ua1-f43.google.com with SMTP id w21so39668547uan.7
 for <linux-riscv@lists.infradead.org>; Tue, 25 Jan 2022 12:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/PK+VsfalNcqPlg+OdOK8H00toRP5nx8q9De4RBT+0k=;
 b=eSF3BFdYil0i4aVleo8KP34NpruFgcxg8zvtSrAxQITGsp+J2Q8ZXcG2AsvTT0SOcZ
 +pBeB9uQwksQ9/c1mH1YDplWdH3GPTQVjkkTfNexPKk7Oo2Mv7zrEG/kX43IBpE3wNZG
 dHFCV0vZbYRC/l6H6KdTSn9ahS24ECoOZjy7XxZPYdUrb7lhXybu9KsLjH0xLOgSaPwc
 rdyBmcW3cvyt+3E+r+Lc9HChymas39UmsVWytMHSw8AXXVjK5+58cV1v71A1ZngGpDf+
 ixxcZPtsmRoRVtnWi4NTzRyFUTKZ6VTNwWgVYEFyE29qEj89rVSjr6qzIdaQTLkqB+mo
 fZsg==
X-Gm-Message-State: AOAM530riCdYKUxZoYy+7/q6m9XsbtTFdFuhXSRfUzwCnsyyFVTfL7Oz
 CYl+DZfo4Zb3dxy07hYih34iqLg+BUootSjj
X-Google-Smtp-Source: ABdhPJyuFGD4NCSVR9LUzkdQ6H2dEeIQ22jnuz8P0YbaJPoi0a4px7CMH1N0d1wozAoaBxhk4vG9gg==
X-Received: by 2002:a05:6102:3ec4:: with SMTP id
 n4mr8494132vsv.41.1643143956854; 
 Tue, 25 Jan 2022 12:52:36 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id y4sm3250175vsi.14.2022.01.25.12.52.35
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 12:52:35 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id p7so32503994uao.6
 for <linux-riscv@lists.infradead.org>; Tue, 25 Jan 2022 12:52:35 -0800 (PST)
X-Received: by 2002:a9f:3d89:: with SMTP id c9mr8620407uai.78.1643143955031;
 Tue, 25 Jan 2022 12:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20220120090918.2646626-1-atishp@rivosinc.com>
 <20220120090918.2646626-7-atishp@rivosinc.com>
 <CAMuHMdXJoREF7jZaYWrDUjJqKUSCd82qDVaMEo7VO38ok8J-AA@mail.gmail.com>
 <CAOnJCULjqeL9Q27n=g19ALbOivzid6pc_gYv6JUF4iP=64kJ-Q@mail.gmail.com>
In-Reply-To: <CAOnJCULjqeL9Q27n=g19ALbOivzid6pc_gYv6JUF4iP=64kJ-Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jan 2022 21:52:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWBF0XXXQLfAH81F=BczjsDeQFU454_A2C_-qLPKJGpiQ@mail.gmail.com>
Message-ID: <CAMuHMdWBF0XXXQLfAH81F=BczjsDeQFU454_A2C_-qLPKJGpiQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] RISC-V: Do not use cpumask data structure for
 hartid bitmap
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@wdc.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_125239_301581_BF819CF0 
X-CRM114-Status: GOOD (  30.11  )
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

Hi Atish,

On Tue, Jan 25, 2022 at 9:17 PM Atish Patra <atishp@atishpatra.org> wrote:
> On Tue, Jan 25, 2022 at 12:12 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Thu, Jan 20, 2022 at 10:12 AM Atish Patra <atishp@rivosinc.com> wrote:
> > > Currently, SBI APIs accept a hartmask that is generated from struct
> > > cpumask. Cpumask data structure can hold upto NR_CPUs value. Thus, it
> > > is not the correct data structure for hartids as it can be higher
> > > than NR_CPUs for platforms with sparse or discontguous hartids.
> > >
> > > Remove all association between hartid mask and struct cpumask.
> > >
> > > Reviewed-by: Anup Patel <anup@brainfault.org> (For Linux RISC-V changes)
> > > Acked-by: Anup Patel <anup@brainfault.org> (For KVM RISC-V changes)
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >
> > Thanks for your patch, which is now commit 26fb751ca37846c9 ("RISC-V:
> > Do not use cpumask data structure for hartid bitmap") in v5.17-rc1.
> >
> > I am having an issue with random userspace SEGVs on Starlight Beta
> > (which needs out-of-tree patches).  It doesn't always manifest
> > itself immediately, so it took a while to bisect, but I suspect the
> > above commit to be the culprit.
>
> I have never seen one before during my testing. How frequently do you see them?
> Does it happen while running anything or just idle user space results
> in SEGVs randomly.

Sometimes they happen during startup (lots of failures from systemd),
sometimes they happen later, during interactive work.
Sometimes while idle, and something runs in the background (e.g. mandb).

> Do you have a trace that I can look into ?

# apt update
[  807.499050] apt[258]: unhandled signal 11 code 0x1 at
0xffffff8300060020 in libapt-pkg.so.6.0.0[3fa49ac000+174000]
[  807.509548] CPU: 0 PID: 258 Comm: apt Not tainted
5.16.0-starlight-11192-g26fb751ca378-dirty #153
[  807.518674] Hardware name: BeagleV Starlight Beta (DT)
[  807.524077] epc : 0000003fa4a47a0a ra : 0000003fa4a479fc sp :
0000003fcb4b39b0
[  807.531383]  gp : 0000002adcef4800 tp : 0000003fa43287b0 t0 :
0000000000000001
[  807.538603]  t1 : 0000000000000009 t2 : 00000000000003ff s0 :
0000000000000000
[  807.545887]  s1 : 0000002adcf3cb60 a0 : 0000000000000003 a1 :
0000000000000000
[  807.553167]  a2 : 0000003fcb4b3a30 a3 : 0000000000000000 a4 :
0000002adcf3cc1c
[  807.560390]  a5 : 0007000300060000 a6 : 0000000000000003 a7 :
1999999999999999
[  807.567654]  s2 : 0000003fcb4b3a28 s3 : 0000000000000002 s4 :
0000003fcb4b3a30
[  807.575039]  s5 : 0000003fa4baa810 s6 : 0000000000000010 s7 :
0000002adcf19a40
[  807.582363]  s8 : 0000003fcb4b4010 s9 : 0000003fa4baa810 s10:
0000003fcb4b3e90
[  807.589606]  s11: 0000003fa4b2a528 t3 : 0000000000000000 t4 :
0000003fa47906a0
[  807.596891]  t5 : 0000000000000005 t6 : ffffffffffffffff
[  807.602302] status: 0000000200004020 badaddr: ffffff8300060020
cause: 000000000000000d

(-dirty due to Starlight DTS and driver updates)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
