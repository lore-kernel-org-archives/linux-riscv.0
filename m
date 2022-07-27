Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514D6C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 11:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIKu0ERsgbzi6fHEYQ+nm6EPl2qw16EMsu1GhKKxYsc=; b=WLWVyfKtiQp7lw
	IcrMHlNb5KIVtcdGURNSOmb+iLX/VlCWGlwWF0X7lhHxzqitB5IdmukyTnvLVBUzxGZeZlyd3IABx
	22EgsHPR7cTlmBAcupkvERfSCbkPkuXBGpDBkZyvX2/TcSRfzRC/Q7p746tFupT2XeifPEuX1PvdV
	NYIFysUeXyvB0pDQyqeDfWa5xi11MfIp8OW6qztmki7fBplV/kBS6KdTtDbljBTW+vVUl+9LRR80C
	iFbQC/Qc44Q0Simz/7bS+AevWh/fMssypCelSVSe4LZuvv8z7O2zeMn8JUdH7/nYxPwYSL8wgAtiI
	rNIgglbaGZ34aW28F+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfbj-00DAo2-1c; Wed, 27 Jul 2022 11:53:43 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfbf-00DAkg-CD
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 11:53:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id p11so21919361lfu.5
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D17IrGjqfDknOXwcV65EANowXkYAl11/dUWcANUuskM=;
        b=oVw67IFKfMhTwkj4St44LIOpvrqAZzRqnzv4Y6bOpBCLP1BJqNpuGPO3Uc7xddTl5f
         j5A6Y8WjaPxg/sdXKtxLKAGFjyuZNwIDaRhBgyALOmxuItXIbngCj3GOK1JQvu30Re7+
         r4RD3h5Iak81lXY67URzLu9se5r4YzRWRiKV4ja4WWOi7Sm3fWtDlgzz9ujeab893YDt
         lGPy2fEMzHxGy9y69eduiSsauiQCxXmD5iGx6aiZ5XXSgvF0uABy161+ThPMqxnMXlY7
         bihpQmO442/TV2gnjs+uV/9OYkt1dYFU2GubxhKdlykVWq06MzPO/H1giTFJ7UwN4pDE
         31EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D17IrGjqfDknOXwcV65EANowXkYAl11/dUWcANUuskM=;
        b=8M0LFIS2b5sjfsjugo5O+H4JRHjUxZ1towqAMj1pAlqF04CExS76rEsg6ie2fRGwuF
         sGeg3YrSbGsQOI6beoakV6aG2sk/32hA9CGDw8HFpUDxtYoOk432oeIKjCJZHGc03nnj
         t3FEJLsbHs3RBenVyjNHFq2zaviqbSez69XHSvkQcBTU7owlLsera/2PCzC0mGNcBYWQ
         uER+MnUY6wz/D226px1QFFadhKlH9zZ7Z+oqUZs3U9m3E9nTgmsvNWJy/du1dpsHaLCt
         wFtZ/wdzkZM9hpl+P/y4Nwp/bpcKiIxQ/TrjEnoyx7UP4ydJmPKzUf3NbGVdZfzAPCK7
         QcRA==
X-Gm-Message-State: AJIora9CjpLGaCwb4O3w+KXBGSi9xib4NYLJJJ0dlLqttawJoYsQnkRz
	tece2yy/0RoEhOwDSJ34tqe9RjFkD8U73Gw4V4k81A==
X-Google-Smtp-Source: AGRyM1u+OEpVbywXqdYqThd2+8RU5rq/CspyP7SYzjjwWXkCGKFjuZpoPxUSb6FvGHuNiE70BOfGzvpVzIphnOxHoqo=
X-Received: by 2002:a05:6512:2304:b0:48a:c120:88dc with SMTP id
 o4-20020a056512230400b0048ac12088dcmr14529lfu.419.1658922815582; Wed, 27 Jul
 2022 04:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220727043829.151794-1-apatel@ventanamicro.com>
 <724f176b-02f1-b171-726f-16158c650896@codethink.co.uk> <CAAhSdy1tnTDv0AVyo=5FD=aE070ds6qYGGhdup+8jUqr3M66qA@mail.gmail.com>
 <20a94c3c-85ed-2227-458e-60c780fd4ad7@codethink.co.uk>
In-Reply-To: <20a94c3c-85ed-2227-458e-60c780fd4ad7@codethink.co.uk>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 27 Jul 2022 17:23:24 +0530
Message-ID: <CAK9=C2Xoi7zW0evH-q15699vRqQ1UY72C_Z3UpYHMbkgL+efUg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, Nikita Shubin <n.shubin@yadro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_045339_440866_AC1EB278 
X-CRM114-Status: GOOD (  26.51  )
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

On Wed, Jul 27, 2022 at 3:42 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 27/07/2022 11:06, Anup Patel wrote:
> > On Wed, Jul 27, 2022 at 2:25 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >>
> >> On 27/07/2022 05:38, Anup Patel wrote:
> >>> Identifying the underlying RISC-V implementation can be important
> >>> for some of the user space applications. For example, the perf tool
> >>> uses arch specific CPU implementation id (i.e. CPUID) to select a
> >>> JSON file describing custom perf events on a CPU.
> >>>
> >>> Currently, there is no way to identify RISC-V implementation so we
> >>> add mvendorid, marchid, and mimpid to /proc/cpuinfo output.
> >>>
> >>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >>> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> >>> Tested-by: Nikita Shubin <n.shubin@yadro.com>
> >>> ---
> >>> Changes since v1:
> >>>    - Use IS_ENABLED() to check CONFIG defines
> >>>    - Added RB and TB tags in commit description
> >>> ---
> >>>    arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
> >>>    1 file changed, 51 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> >>> index fba9e9f46a8c..04bcc91c91ea 100644
> >>> --- a/arch/riscv/kernel/cpu.c
> >>> +++ b/arch/riscv/kernel/cpu.c
> >>> @@ -3,10 +3,13 @@
> >>>     * Copyright (C) 2012 Regents of the University of California
> >>>     */
> >>>
> >>> +#include <linux/cpu.h>
> >>>    #include <linux/init.h>
> >>>    #include <linux/seq_file.h>
> >>>    #include <linux/of.h>
> >>> +#include <asm/csr.h>
> >>>    #include <asm/hwcap.h>
> >>> +#include <asm/sbi.h>
> >>>    #include <asm/smp.h>
> >>>    #include <asm/pgtable.h>
> >>>
> >>> @@ -64,6 +67,50 @@ int riscv_of_parent_hartid(struct device_node *node)
> >>>    }
> >>>
> >>>    #ifdef CONFIG_PROC_FS
> >>> +
> >>> +struct riscv_cpuinfo {
> >>> +     unsigned long mvendorid;
> >>> +     unsigned long marchid;
> >>> +     unsigned long mimpid;
> >>> +};
> >>> +static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> >>> +
> >>> +static int riscv_cpuinfo_starting(unsigned int cpu)
> >>> +{
> >>> +     struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> >>> +
> >>> +#if IS_ENABLED(CONFIG_RISCV_SBI)
> >>> +     ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> >>> +     ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> >>> +     ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
> >>
> >> how about:
> >>
> >>          if (IS_ENABLED(CONFIG_RISCV_SBI)) {
> >>                  ...
> >>          } ... {
> >>
> >> or maybe even:
> >>
> >>
> >>          if (IS_ENABLED(CONFIG_RISCV_SBI)) {
> >>                  if (sbi_spec_is_0_1()) {
> >>                          ...
> >>                  }
> >>          } ... {
> >>
> >> would mean better compile coverage (at the slight exepnese of
> >> having "false" sbi_spec_is_0_1() implemenation
> >
> > Most of the sbi_xyz() functions are not available for NoMMU
> > kernel so using "if (IS_ENABLED())" results in compile error.
>
> How about defining "false" versions for no-mmu case and try
> and avoid these #if mountains?

Well, we are not simplifying anything by moving from a "#if" ladder
to "if ()" ladder. Also, I don't see how the "#if" ladder will grow over
time.

Regards,
Anup

>
> >>
> >>> +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> >>> +     ci->mvendorid = csr_read(CSR_MVENDORID);
> >>> +     ci->marchid = csr_read(CSR_MARCHID);
> >>> +     ci->mimpid = csr_read(CSR_MIMPID);
> >>> +#else
> >>> +     ci->mvendorid = 0;
> >>> +     ci->marchid = 0;
> >>> +     ci->mimpid = 0;
> >>> +#endif
> >>
> >> Would it be easier to zero out all the fields first and then fill them
> >> in if supported?
> >
> > Clearing out fields before "#if" ladder results in dead assignments.
>
> Not sure which is worse here, the #if ladder or some possibly dead
> assignments.
>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
