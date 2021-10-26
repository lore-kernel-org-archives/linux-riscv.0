Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261D7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 09:03:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF1E260D07
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 09:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF1E260D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCcpm6Yqw31kllyn2DNA2Cqic2zxyaCe6e/81hSJZn0=; b=aVSy/CKDfw/xog
	2yu2Bw8LJh/JZemDX+dwoWgqgXzybPxYGWOd5JDbp7IAq4qKCurJSL6ukyS9o/RI0im7bJgTnqJQ4
	xtysRrZtgg5/dlnlFWVPDhYCiGTylJCwXNAazBvhQ7rlWNjCqsLdLXHyptgh0m91nsA+XRqONsEXd
	UrUVlqxhMVhg86ag4/PZ3TkjrP2gvHeXQJnE2vaHVXaMxGi5/KNuGFStJ8WFr1l6VDTe/nKepIlS1
	zIrzcoDmC92fqmajYNobvckp5cvOABMo/1tpXl+e3mQoIizTrB/eqiqQAtGZ5SO1qWVy9d548wRix
	OpiCBqnTPkD9qN4wVhfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfIMm-001AGr-BI; Tue, 26 Oct 2021 09:03:32 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfIMj-001AFw-SX
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 09:03:31 +0000
Received: by mail-ua1-f44.google.com with SMTP id x3so8466939uar.13
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 02:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WP4KMCUXl+rWEf2feu/35l51pXt02OCY9vDl3R9CVSQ=;
 b=K/tyYU3ccXhCqQO+7eeUCIcYKmGBILqtXBfSTs5xRtm1n7oBLTat6vTwjY8pvrJhfb
 zRBoxZzO6EO8k93THkDqpe54rXvTUIF+ofjXhQTvhtmMRdKGuUBWf7qEMh3pOkHckxjz
 0v3Wtrdk8Qc8vcc5zDNbKlLZZCfLE6Dfm/iH/M4ZTyHouEyOBf6oVS1YmKCh70gs9UXF
 QSVVJpjXotBPkUGRWL8UJYzfvz41RF+y2NqZgRCJlnZKnYxEo7SD61uIcrgsdaXQSvzS
 tZqoQc7XECP8vfY81xWYFvB/DD/dPoxa0fMgY36yGyQ12Z3fRLhUcoTk0NBfdfSNfaxA
 LEEw==
X-Gm-Message-State: AOAM530HUOTxqoqyfRmkRPOogOZWmL65jDkyYmdHx/FZ5vI4HmVOdWSp
 oCezzkWsxLaUlDCVDeda1BzVIzUB4YwjoA==
X-Google-Smtp-Source: ABdhPJwdYg6xwLIBwvTo6Ynv4Vhz2V7zHUsLo5adxNBrsMXiEUBlXi7nIGvv/FN7tA731huArpPucw==
X-Received: by 2002:ab0:614e:: with SMTP id w14mr21025517uan.5.1635239008302; 
 Tue, 26 Oct 2021 02:03:28 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id bb13sm10204614vkb.11.2021.10.26.02.03.27
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 02:03:28 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id q13so27783652uaq.2
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 02:03:27 -0700 (PDT)
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr21592387vsl.9.1635239007608; 
 Tue, 26 Oct 2021 02:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
 <CAOnJCULgjUsnb__QrUFdop3Nr9t6G5WtSsG+EE2d4_e+b7Dy5Q@mail.gmail.com>
In-Reply-To: <CAOnJCULgjUsnb__QrUFdop3Nr9t6G5WtSsG+EE2d4_e+b7Dy5Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Oct 2021 11:03:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBFE+dzg0Lqechmj8D4ssJS5O_UCrDBtToWn-EP+0T_g@mail.gmail.com>
Message-ID: <CAMuHMdUBFE+dzg0Lqechmj8D4ssJS5O_UCrDBtToWn-EP+0T_g@mail.gmail.com>
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
To: Atish Patra <atishp@atishpatra.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_020329_955194_C2CE1C13 
X-CRM114-Status: GOOD (  40.71  )
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

On Tue, Oct 26, 2021 at 10:55 AM Atish Patra <atishp@atishpatra.org> wrote:
> On Mon, Oct 25, 2021 at 8:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > When booting a kernel with CONFIG_NR_CPUS=4 on Microchip PolarFire,
> > the 4th CPU either fails to come online, or the system crashes.
> >
> > This happens because PolarFire has 5 CPU cores: hart 0 is an e51,
> > and harts 1-4 are u54s, with the latter becoming CPUs 0-3 in Linux:
> >   - unused core has hartid 0 (sifive,e51),
> >   - processor 0 has hartid 1 (sifive,u74-mc),
> >   - processor 1 has hartid 2 (sifive,u74-mc),
> >   - processor 2 has hartid 3 (sifive,u74-mc),
> >   - processor 3 has hartid 4 (sifive,u74-mc).
> >
> > I assume the same issue is present on the SiFive fu540 and fu740
> > SoCs, but I don't have access to these.  The issue is not present
> > on StarFive JH7100, as processor 0 has hartid 1, and processor 1 has
> > hartid 0.
> >
> > arch/riscv/kernel/cpu_ops.c has:
> >
> >     void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
> >     void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
> >
> >     void cpu_update_secondary_bootdata(unsigned int cpuid,
> >                                        struct task_struct *tidle)
> >     {
> >             int hartid = cpuid_to_hartid_map(cpuid);
> >
> >             /* Make sure tidle is updated */
> >             smp_mb();
> >             WRITE_ONCE(__cpu_up_stack_pointer[hartid],
> >                        task_stack_page(tidle) + THREAD_SIZE);
> >             WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
> >
> > The above two writes cause out-of-bound accesses beyond
> > __cpu_up_{stack,pointer}_pointer[] if hartid >= CONFIG_NR_CPUS.
> >
> >     }
> >
>
> Thanks for reporting this. We need to fix this and definitely shouldn't hide it
> using configs. I guess I never tested with lower values (2 or 4) for
> CONFIG_NR_CPUS which explains how this bug was not noticed until now.

> > How to fix this?
> >
> > We could skip hartids >= NR_CPUS, but that feels strange to me, as
> > you need NR_CPUS to be larger (much larger if the first usable hartid
> > is a large number) than the number of CPUs used.
> >
> > We could store the minimum hartid, and always subtract that when
> > accessing __cpu_up_{stack,pointer}_pointer[] (also in
> > arch/riscv/kernel/head.S), but that means unused cores cannot be in the
> > middle of the hartid range.
>
> Yeah. Both of the above proposed solutions are not ideal.
>
> >
> > Are hartids guaranteed to be continuous? If not, we have no choice but
> > to index __cpu_up_{stack,pointer}_pointer[] by cpuid instead, which
> > needs a more expensive conversion in arch/riscv/kernel/head.S.
>
> This will work for ordered booting with SBI HSM extension. However, it may
> fail for spinwait booting because cpuid_to_hartid_map might not have setup
> depending on when secondary harts are jumping to linux.
>
> Ideally, the size of the __cpu_up_{stack,task}_pointer[] should be the maximum
> hartid possible. How about adding a config for that ?

(reading more RISC-V specs)
Hart IDs can use up to XLEN (32, 64, or 128) bits. So creative sparse
multi-level encodings like used in MPIDR on ARM[1] makes using a
simple array infeasible.

[1] arch/arm{,64}/include/asm/cputype.h

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
