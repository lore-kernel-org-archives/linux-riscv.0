Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821E2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 08:55:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0542A61040
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 08:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0542A61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9XcLluLa0LVc4sem8r57kGpeml30IthP4aMGc7dKmY=; b=4cpuWoZXcllKwW
	nfUPyL0Fz0z7C9FeiIFo/93S0YEZBDPrTmxvpQMi/HP/ZMXAgqc4JriH40mzcemKXWeUWIBlgRlJB
	Q1FV3Ke6NuGOeqzwvbTAJtm9SvEz509y054eIXBlPaYdd7l5mna5vrgFvEd66QFs2Zt2hjMaHVQyo
	JJ2UbIoWavc8S/CzGDsjYlFlAMA1Mipl+lHW8QOyoccb6JdciEJoFlE/iF/MrSV/Uza7QfTxZQBrx
	UNWbOKIRvgtCS2QzLPn7U8BLLYK4XIzRJwoNtB8RRvubNdQe4oRoL2VUNjR6qiHh12xSRBewcoGXa
	ymWvdKLp8pwL2YKMhx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfIEv-0018WU-TQ; Tue, 26 Oct 2021 08:55:25 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfIEs-0018U0-Ji
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 08:55:24 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id m63so32984396ybf.7
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CM37jlaMXkRsHHkG1O7ZYac0cUBSPl49tFExN0NplIM=;
 b=ePr5qFxPNz+cniKDjqjnxTGizBNacE6tIlNCdgYWlexoJLScoR+dgcPTt3/6ANGC6Z
 GuCDWMkE91ICPc0oAUOnuRwKuX2Jx0PCyqQ/5dSHPqQtTPYsw9REBW95uMBOTtubTXYV
 quUXqBfSoBisaHnI6gvg7TD9nRxVoyZtj+Xjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CM37jlaMXkRsHHkG1O7ZYac0cUBSPl49tFExN0NplIM=;
 b=4l9cAwp0OvuALqkB2Od/fqx4Ycb3rU/iXpO6SlFLJf5muED8dmHtjhD/7xhTslE7FD
 B4lcSiba8tB1vpP0SquCmlAlqemFPKpmcvSQvx/Zo3OO7P3bSZ6pFvY4b4wKu8jnC68h
 H96J2A2Wc/pi0GcYVDEYncrj5+TsEoWB75crosObKwfzozr97cGLHuUxdgolroa44a/q
 SvjbMmzRLS/Zm/fh7jv6LltEb/ZQBXWsx4EMKtMsKgUvg9OnDP3eWDehIYfQ00EhECRt
 Rwjzf1Wa14Gn8cFWuSGCAIlz+Feju7eFabHoKs5iz5aQYzKBq4YXMhpqkwlwf5IBgeSj
 ibhA==
X-Gm-Message-State: AOAM532qMJjBp5Br01kyKT1KasJCZMubbdSw9aAK329TZ87PIyfLK6Ap
 tlmhnKeGhml2S5wNZuScLZNi/f/n3IFwb1aKsNey
X-Google-Smtp-Source: ABdhPJyB73vh77mBkUQ0IhhABQewwC71dOMraIlg9euM8NVn/OxFSf32kB1GyZ07r4ay527SKk53DNhM85XoMR8rxIQ=
X-Received: by 2002:a05:6902:601:: with SMTP id
 d1mr1602196ybt.481.1635238520302; 
 Tue, 26 Oct 2021 01:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 26 Oct 2021 01:55:09 -0700
Message-ID: <CAOnJCULgjUsnb__QrUFdop3Nr9t6G5WtSsG+EE2d4_e+b7Dy5Q@mail.gmail.com>
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_015522_740123_D74C73B6 
X-CRM114-Status: GOOD (  37.26  )
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

On Mon, Oct 25, 2021 at 8:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi all,
>
> When booting a kernel with CONFIG_NR_CPUS=4 on Microchip PolarFire,
> the 4th CPU either fails to come online, or the system crashes.
>
> This happens because PolarFire has 5 CPU cores: hart 0 is an e51,
> and harts 1-4 are u54s, with the latter becoming CPUs 0-3 in Linux:
>   - unused core has hartid 0 (sifive,e51),
>   - processor 0 has hartid 1 (sifive,u74-mc),
>   - processor 1 has hartid 2 (sifive,u74-mc),
>   - processor 2 has hartid 3 (sifive,u74-mc),
>   - processor 3 has hartid 4 (sifive,u74-mc).
>
> I assume the same issue is present on the SiFive fu540 and fu740
> SoCs, but I don't have access to these.  The issue is not present
> on StarFive JH7100, as processor 0 has hartid 1, and processor 1 has
> hartid 0.
>
> arch/riscv/kernel/cpu_ops.c has:
>
>     void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
>     void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
>
>     void cpu_update_secondary_bootdata(unsigned int cpuid,
>                                        struct task_struct *tidle)
>     {
>             int hartid = cpuid_to_hartid_map(cpuid);
>
>             /* Make sure tidle is updated */
>             smp_mb();
>             WRITE_ONCE(__cpu_up_stack_pointer[hartid],
>                        task_stack_page(tidle) + THREAD_SIZE);
>             WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
>
> The above two writes cause out-of-bound accesses beyond
> __cpu_up_{stack,pointer}_pointer[] if hartid >= CONFIG_NR_CPUS.
>
>     }
>

Thanks for reporting this. We need to fix this and definitely shouldn't hide it
using configs. I guess I never tested with lower values (2 or 4) for
CONFIG_NR_CPUS which explains how this bug was not noticed until now.


> arch/riscv/kernel/smpboot.c:setup_smp(void) detects CPUs like this:
>
>     for_each_of_cpu_node(dn) {
>             hart = riscv_of_processor_hartid(dn);
>             if (hart < 0)
>                     continue;
>
>             if (hart == cpuid_to_hartid_map(0)) {
>                     BUG_ON(found_boot_cpu);
>                     found_boot_cpu = 1;
>                     early_map_cpu_to_node(0, of_node_to_nid(dn));
>                     continue;
>             }
>             if (cpuid >= NR_CPUS) {
>                     pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
>                             cpuid, hart);
>                     break;
>             }
>
>             cpuid_to_hartid_map(cpuid) = hart;
>             early_map_cpu_to_node(cpuid, of_node_to_nid(dn));
>             cpuid++;
>     }
>
> So cpuid >= CONFIG_NR_CPUS (too many CPU cores) is already rejected.
>
> How to fix this?
>
> We could skip hartids >= NR_CPUS, but that feels strange to me, as
> you need NR_CPUS to be larger (much larger if the first usable hartid
> is a large number) than the number of CPUs used.
>
> We could store the minimum hartid, and always subtract that when
> accessing __cpu_up_{stack,pointer}_pointer[] (also in
> arch/riscv/kernel/head.S), but that means unused cores cannot be in the
> middle of the hartid range.

Yeah. Both of the above proposed solutions are not ideal.

>
> Are hartids guaranteed to be continuous? If not, we have no choice but
> to index __cpu_up_{stack,pointer}_pointer[] by cpuid instead, which
> needs a more expensive conversion in arch/riscv/kernel/head.S.
>

This will work for ordered booting with SBI HSM extension. However, it may
fail for spinwait booting because cpuid_to_hartid_map might not have setup
depending on when secondary harts are jumping to linux.

Ideally, the size of the __cpu_up_{stack,task}_pointer[] should be the maximum
hartid possible. How about adding a config for that ?

We also need sanity checks cpu_update_secondary_bootdata to make sure
that the hartid is within the bounds to avoid issues due to the
suboptimal config value.

> Thanks for your comments!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
