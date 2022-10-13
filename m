Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C6AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 21:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LInWZYHuy9ElBPbpABLEUr/4Otsmh26O7dLSx/ZHnVM=; b=Kb4ejTfPLysVuoh/cUwshkvu7u
	cTO0gH7qTep+b7Pmb8bCWP48h5MnR0p0NetpJ6F9A+UStExmFw9K/h6o1/Mn5EBwNLfTQanv3U3rL
	+PlMgmAUNgPrQQySbFb9ggXbKnRi4/QfrQyfpjQUDvQ5/lhvtpYbckN3DiH7Ub+Awh5OLOzZrIOUQ
	zVcEvKXgC3jrryO3vraTgPiR155c+1kfEN71x1yv7DPyLxdDqzeY4eFnkxvxNj8svsGu05tLVWOOC
	nw1RvyBUbapNEY1Cfakb7zMb4dRKEeWyz4TarLDQdFdlIVtfNmzzA8/m3U6sjT3/oXhh20wx8p+Ac
	dJwuTYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj5hb-00Cyvv-Is; Thu, 13 Oct 2022 21:25:15 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj5hW-00CyvX-MB
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 21:25:14 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d24so2972307pls.4
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 14:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkkkWwu+uO3wzgQDJ80nucBp53b8gSTLCETe4mcmlyA=;
        b=sn0nAS+65dineD7e+NN10C51LyzjxcZ4ulYRgKHfZsjGn6q92rVarrYHp+4ZfAcogN
         MoWJkBI3CjX6a0TuyZGqewwlnBo4dRAsfPHVWBv2dkczUUPC29wYYuO3eheoyH51kJoL
         MIdXqsf7pJNiDOqB8EbIS6uVhUMUqyy7GejkH3lAae0P2WRvmb/2qDMc0bADfW5iPSnW
         dMFM34cYQDpZFAY45NIgLkyclNpiLkol8nzjOdUiCfk8mZYIxbl3+duk63CG6/b1UPyi
         QuCH0osWbYCGF2Eicf5ngKP1T0gsomRVEbXs84zteW0jmmxtdZefX9XL6jVbRj03Li3j
         14ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkkkWwu+uO3wzgQDJ80nucBp53b8gSTLCETe4mcmlyA=;
        b=qgGxwYstuYuPRvXytxI3dwlAEXwNu1r80CfyMfWMJhTbTkKCVGfrfgdNx1z6NFyiz1
         QzUa2uZERAOsryRy21ka2SXbsJf4UZ5LwIIq5H+R84y51nWfOhw6+QiWW6SjRQKy1oK6
         6F1MXgZo0woiVP+AMycIC0p6SveLeFPFhMFoRkPrwLhoRU0XUuzrJcWOTRoaxxY1pi+Q
         NWKl57N63l1EibrxfJ5LEyVvwa97MVRosK03+W2ALhn42RGn/EZMbdMmM2s56rfwSmsD
         Jqj3c16Lfo0bppcpYEwbP2Iu0qELvhVjlRHGwEp4etSrLOEQFpyhA4t4ceQEQcwtQoLd
         WUBg==
X-Gm-Message-State: ACrzQf0GnbrI4I7rn3QhrMPsMcWQcfpFj/9g5YtT3KdS0+B4MkbzaNJr
	Isk2u+rXmkQcp/sTdYnW2d5sTg==
X-Google-Smtp-Source: AMsMyM7TXI8CWgErzWQ6/+bJ3V+WWHcpzEXYyisoG8NOJEoStOnW7bs+M3Mh/5nzkvt2d4SwA4mrng==
X-Received: by 2002:a17:90a:e7cd:b0:20a:c658:c185 with SMTP id kb13-20020a17090ae7cd00b0020ac658c185mr2001547pjb.114.1665696308682;
        Thu, 13 Oct 2022 14:25:08 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d10-20020a17090a7bca00b00205fafa6768sm3690066pjl.6.2022.10.13.14.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 14:25:07 -0700 (PDT)
Date: Thu, 13 Oct 2022 14:25:07 -0700 (PDT)
X-Google-Original-Date: Thu, 13 Oct 2022 14:20:43 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Add mvendorid, marchid, and mimpid to /proc/cpuinfo output
In-Reply-To: <mhng-29532f94-476b-450e-b758-209e8b7c9fc7@palmer-ri-x1c9>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-f33c3506-ef0f-4daf-8507-1e2ccdf801c8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_142510_748828_F77F5F2D 
X-CRM114-Status: GOOD (  38.53  )
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
Cc: apatel@ventanamicro.com, Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, heinrich.schuchardt@canonical.com, atishp@atishpatra.org, linux-riscv@lists.infradead.org, n.shubin@yadro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 03 Oct 2022 21:35:25 PDT (-0700), Palmer Dabbelt wrote:
> On Mon, 03 Oct 2022 20:44:54 PDT (-0700), anup@brainfault.org wrote:
>> On Tue, Oct 4, 2022 at 8:24 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>>
>>> On Tue, 26 Jul 2022 21:38:29 PDT (-0700), apatel@ventanamicro.com wrote:
>>> > Identifying the underlying RISC-V implementation can be important
>>> > for some of the user space applications. For example, the perf tool
>>> > uses arch specific CPU implementation id (i.e. CPUID) to select a
>>> > JSON file describing custom perf events on a CPU.
>>> >
>>> > Currently, there is no way to identify RISC-V implementation so we
>>> > add mvendorid, marchid, and mimpid to /proc/cpuinfo output.
>>> >
>>> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>> > Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>>> > Tested-by: Nikita Shubin <n.shubin@yadro.com>
>>> > ---
>>> > Changes since v1:
>>> >  - Use IS_ENABLED() to check CONFIG defines
>>> >  - Added RB and TB tags in commit description
>>> > ---
>>> >  arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
>>> >  1 file changed, 51 insertions(+)
>>>
>>> Sorry for being slow on this one.  I'd been worried about sticking more
>>> stuff into /proc/cpuinfo, as having the only user interface for these
>>> involve parsing /proc/cpuinfo is really just a recipe for disaster.  I
>>> didn't get around do doing something better, though, and waiting for
>>> another release seems kind of silly.
>>
>> In addition to being useful for perf tool, printing vendor and
>> implementation details in /proc/cpuinfo is a very useful info.
>>
>> Users can easily know the underlying CPU implementer using
>> "cat /proc/cpuinfo".
>>
>>>
>>> I was going to go put this on for-next, but it looks like it's causing
>>> kasan boot failures.  I'm not actually quite sure how this is triggering
>>> these, at least based on the backtrace, but there's a bunch of them and
>>> boot hangs.
>>>
>>> Here's the first of them:
>>>
>>> [    3.830416] Hardware name: riscv-virtio,qemu (DT)
>>> [    3.830828] epc : kasan_check_range+0x116/0x14c
>>> [    3.832377]  ra : memset+0x1e/0x4c
>>> [    3.832699] epc : ffffffff8026468e ra : ffffffff80264d6e sp : ff600000832afa60
>>> [    3.833051]  gp : ffffffff81d800a0 tp : ff600000831d2400 t0 : ff60000083224360
>>> [    3.833397]  t1 : ffebfffefffef000 t2 : 0000000000000000 s0 : ff600000832afa90
>>> [    3.833811]  s1 : 0000000000000004 a0 : 0000000000000010 a1 : 0000000000000004
>>> [    3.834210]  a2 : 0000000000000001 a3 : ffffffff801fa22c a4 : ff5ffffffff78000
>>> [    3.834558]  a5 : ffebfffefffef000 a6 : ffebfffefffef001 a7 : ff5ffffffff78003
>>> [    3.834931]  s2 : ff5ffffffff78000 s3 : 0000000000000000 s4 : ffffffff815b59b0
>>> [    3.835292]  s5 : ffffffff81d815e0 s6 : 0000000000000000 s7 : 0000000000000008
>>> [    3.836400]  s8 : ffffffff81d8b0e0 s9 : 0000000000000000 s10: 0000000000000008
>>> [    3.836817]  s11: ff5ffffffff78000 t3 : 0000000000000000 t4 : ffebfffefffef000
>>> [    3.837154]  t5 : ffebfffefffef001 t6 : 0000000000000002
>>> [    3.837471] status: 0000000000000120 badaddr: ffebfffefffef000 cause: 000000000000000d
>>> [    3.837933] [<ffffffff801fa22c>] pcpu_alloc+0x494/0x838
>>> [    3.838324] [<ffffffff801fa5fc>] __alloc_percpu+0x14/0x1c
>>> [    3.838623] [<ffffffff800930fa>] __percpu_init_rwsem+0x1a/0x98
>>> [    3.838995] [<ffffffff80286c5a>] alloc_super+0x148/0x3da
>>> [    3.839631] [<ffffffff80287af2>] sget_fc+0x90/0x2c4
>>> [    3.840240] [<ffffffff80288498>] get_tree_nodev+0x24/0xa4
>>> [    3.840598] [<ffffffff801e919a>] shmem_get_tree+0x14/0x1c
>>> [    3.840891] [<ffffffff80286436>] vfs_get_tree+0x3a/0x11a
>>> [    3.841172] [<ffffffff802ba746>] path_mount+0x2ea/0xb44
>>> [    3.841468] [<ffffffff802bb69a>] sys_mount+0x1b2/0x270
>>> [    3.841790] [<ffffffff80003d1c>] ret_from_syscall+0x0/0x2
>>> [    3.842480] ---[ end trace 0000000000000000 ]---
>>
>> Sure, I will try to fix this ASAP.
>>
>> Are you willing to take this if the above issue is fixed ?
>
> I still think the other interface is better, but it's taking too long
> and some stuff is blocked on getting these to userspace so I'm fine with
> it.

Replying to my own email here as I'm a bit mixed up right now from 
trying to convert over and I can't find Anup's response saying he can't 
reproduce the issues:

It looks like this was just bad luck, for some reason it happens these 
random failures started triggering for me right when I was merging the 
patch (I even went back and they went away).  So I think these were just 
spurious failures.  
https://lore.kernel.org/all/20221009083050.3814850-1-panqinglin2020@iscas.ac.cn/ 
is out as a proposed fix, I've got it in my testing repo as it's making 
the crashes stop -- it smells a bit fishy, though, so I want to get some 
more time to look before merging it.

This one, though, is on for-next.

Thanks!

>
>>
>> Regards,
>> Anup
>>
>>>
>>> >
>>> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>>> > index fba9e9f46a8c..04bcc91c91ea 100644
>>> > --- a/arch/riscv/kernel/cpu.c
>>> > +++ b/arch/riscv/kernel/cpu.c
>>> > @@ -3,10 +3,13 @@
>>> >   * Copyright (C) 2012 Regents of the University of California
>>> >   */
>>> >
>>> > +#include <linux/cpu.h>
>>> >  #include <linux/init.h>
>>> >  #include <linux/seq_file.h>
>>> >  #include <linux/of.h>
>>> > +#include <asm/csr.h>
>>> >  #include <asm/hwcap.h>
>>> > +#include <asm/sbi.h>
>>> >  #include <asm/smp.h>
>>> >  #include <asm/pgtable.h>
>>> >
>>> > @@ -64,6 +67,50 @@ int riscv_of_parent_hartid(struct device_node *node)
>>> >  }
>>> >
>>> >  #ifdef CONFIG_PROC_FS
>>> > +
>>> > +struct riscv_cpuinfo {
>>> > +     unsigned long mvendorid;
>>> > +     unsigned long marchid;
>>> > +     unsigned long mimpid;
>>> > +};
>>> > +static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>>> > +
>>> > +static int riscv_cpuinfo_starting(unsigned int cpu)
>>> > +{
>>> > +     struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
>>> > +
>>> > +#if IS_ENABLED(CONFIG_RISCV_SBI)
>>> > +     ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
>>> > +     ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
>>> > +     ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
>>> > +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
>>> > +     ci->mvendorid = csr_read(CSR_MVENDORID);
>>> > +     ci->marchid = csr_read(CSR_MARCHID);
>>> > +     ci->mimpid = csr_read(CSR_MIMPID);
>>> > +#else
>>> > +     ci->mvendorid = 0;
>>> > +     ci->marchid = 0;
>>> > +     ci->mimpid = 0;
>>> > +#endif
>>> > +
>>> > +     return 0;
>>> > +}
>>> > +
>>> > +static int __init riscv_cpuinfo_init(void)
>>> > +{
>>> > +     int ret;
>>> > +
>>> > +     ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/cpuinfo:starting",
>>> > +                             riscv_cpuinfo_starting, NULL);
>>> > +     if (ret < 0) {
>>> > +             pr_err("cpuinfo: failed to register hotplug callbacks.\n");
>>> > +             return ret;
>>> > +     }
>>> > +
>>> > +     return 0;
>>> > +}
>>> > +device_initcall(riscv_cpuinfo_init);
>>> > +
>>> >  #define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
>>> >       {                                                       \
>>> >               .uprop = #UPROP,                                \
>>> > @@ -178,6 +225,7 @@ static int c_show(struct seq_file *m, void *v)
>>> >  {
>>> >       unsigned long cpu_id = (unsigned long)v - 1;
>>> >       struct device_node *node = of_get_cpu_node(cpu_id, NULL);
>>> > +     struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
>>> >       const char *compat, *isa;
>>> >
>>> >       seq_printf(m, "processor\t: %lu\n", cpu_id);
>>> > @@ -188,6 +236,9 @@ static int c_show(struct seq_file *m, void *v)
>>> >       if (!of_property_read_string(node, "compatible", &compat)
>>> >           && strcmp(compat, "riscv"))
>>> >               seq_printf(m, "uarch\t\t: %s\n", compat);
>>> > +     seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
>>> > +     seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
>>> > +     seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
>>> >       seq_puts(m, "\n");
>>> >       of_node_put(node);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
