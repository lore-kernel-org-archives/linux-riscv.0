Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71ECC43219
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 02:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=u4+/n4b+9Pwel2e7toVP6R+O7SjTCttpfKaaDz5GC0k=; b=z7mhb6znQQELx6bYFOX5xQ3NbG
	IBojDnyNEKXzmQ8gbp28iN6RPSVSXutGcwwhx+BPThZEJ6ZXmjMq9fUdqtQspBSOQf9jnRXf7YXS6
	oLkYVqhBnJrb9gEzHRH6ujojG8mlKqOHiZjneh1wjRcbOGtMFCk4zMhBMyKFvEVrTw2Rp1IDfcio8
	Ow0CJk20EyyFFaAk07enOEUfE8pQEIh526kAkrdJ+SgSf21KulnVypJ5IeZltj0EF5u5wnnJGru6D
	X1CegiiH69KAwLhpJyfE8KfF17je6GDMqLJkbPggXvQ5bGPsA/lVR8z4Rc24qc9dACW/SZ1VjKoDR
	/a+aYJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofY57-008NQB-Pj; Tue, 04 Oct 2022 02:54:53 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofY54-008NOR-I6
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 02:54:52 +0000
Received: by mail-pj1-x1036.google.com with SMTP id x32-20020a17090a38a300b00209dced49cfso9340250pjb.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Oct 2022 19:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=i1kv4v9jyb4GJslQByBd4GRP/uO/YJdMAaF27VpbmFU=;
        b=wW/CMVc3UVCtLnoYmyx0p8YwF7q5mU8bBJReVm/7w+wrL4mI4bpmHjqii3s4Aa/0kX
         zo8tdJQEvmkqFRZw80hqI7+rqGLPnOlJcHfV+eKRRrAuykTnCXoQ5gxmDayIhPJAEQyR
         UtSz5sga05QB/+D1zD+Qrkv2YlrCF07NWEXoi+0T3tCqlGja+JLvPsORJvpbAOFxR7pS
         8wI7WJ1+IdRwvAQavrlJlfZWnx7ld2XSyPf5GDp+OvLrdfPyqYkJ5kysgls6Yovplou4
         Np64b4D3IijvkicFZgsYBLt/B42o3SC+fp+8Q7ZmwAPoyqkM+gLuKp9PUlkqoQ5dnymj
         gIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=i1kv4v9jyb4GJslQByBd4GRP/uO/YJdMAaF27VpbmFU=;
        b=MsQGXXZUCifoLrtEV/W4d8+p/vNnpuDNKOeRYWSDPNFaaLOy33hTEFKx4X3WwqNwKd
         8U8flt3SLqnPGfaB3AODYU5b5N4VuaHfyfXiZpg6w99KthH1sP9+QhBxvsyuAEooQnoc
         V90dyVpiGELVS4Dju8o3freF8TI2EyJzCigWaOG7Gum00qAU3UsqVyacB4w8CLK0PGiv
         eE3Ce+FhdQ4eBGUDxpe2EQoCXwpRS7MWMgGkVkj7obIn6u8vohnxqkv2pptmMIKwQSFr
         ZK+4WBjkXYf0koDHzOeO8xfydeNOjiYRFl9kn2aY+/sEH+bo5kaeUTnWWPmp3fLJ3zx9
         3A9w==
X-Gm-Message-State: ACrzQf12NPMpYdoArh+WqI2DkaBLpP0confNHRAign6C3/p9we/H+L1M
	FbL31G93462B/StyYstPWwV5VA==
X-Google-Smtp-Source: AMsMyM73BeL3HCsNn3IG8K6thhN6O8UyvGiKxFU1dW4Vn1cnuO3heZrooYxSNTP3utmRiL929anq6g==
X-Received: by 2002:a17:90a:e7cd:b0:20a:c658:c185 with SMTP id kb13-20020a17090ae7cd00b0020ac658c185mr3534723pjb.114.1664852079720;
        Mon, 03 Oct 2022 19:54:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id w25-20020aa79559000000b00561c1101217sm405301pfq.11.2022.10.03.19.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 19:54:38 -0700 (PDT)
Date: Mon, 03 Oct 2022 19:54:38 -0700 (PDT)
X-Google-Original-Date: Mon, 03 Oct 2022 19:54:27 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Add mvendorid, marchid, and mimpid to /proc/cpuinfo output
In-Reply-To: <20220727043829.151794-1-apatel@ventanamicro.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-0acf8089-a53c-41cb-92a8-0c873e0c284c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_195450_868447_86F31BA8 
X-CRM114-Status: GOOD (  30.01  )
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
Cc: apatel@ventanamicro.com, Arnd Bergmann <arnd@arndb.de>, anup@brainfault.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, heinrich.schuchardt@canonical.com, atishp@atishpatra.org, linux-riscv@lists.infradead.org, n.shubin@yadro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 26 Jul 2022 21:38:29 PDT (-0700), apatel@ventanamicro.com wrote:
> Identifying the underlying RISC-V implementation can be important
> for some of the user space applications. For example, the perf tool
> uses arch specific CPU implementation id (i.e. CPUID) to select a
> JSON file describing custom perf events on a CPU.
>
> Currently, there is no way to identify RISC-V implementation so we
> add mvendorid, marchid, and mimpid to /proc/cpuinfo output.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Tested-by: Nikita Shubin <n.shubin@yadro.com>
> ---
> Changes since v1:
>  - Use IS_ENABLED() to check CONFIG defines
>  - Added RB and TB tags in commit description
> ---
>  arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

Sorry for being slow on this one.  I'd been worried about sticking more 
stuff into /proc/cpuinfo, as having the only user interface for these 
involve parsing /proc/cpuinfo is really just a recipe for disaster.  I 
didn't get around do doing something better, though, and waiting for 
another release seems kind of silly.

I was going to go put this on for-next, but it looks like it's causing 
kasan boot failures.  I'm not actually quite sure how this is triggering 
these, at least based on the backtrace, but there's a bunch of them and 
boot hangs.

Here's the first of them:

[    3.830416] Hardware name: riscv-virtio,qemu (DT)
[    3.830828] epc : kasan_check_range+0x116/0x14c
[    3.832377]  ra : memset+0x1e/0x4c
[    3.832699] epc : ffffffff8026468e ra : ffffffff80264d6e sp : ff600000832afa60
[    3.833051]  gp : ffffffff81d800a0 tp : ff600000831d2400 t0 : ff60000083224360
[    3.833397]  t1 : ffebfffefffef000 t2 : 0000000000000000 s0 : ff600000832afa90
[    3.833811]  s1 : 0000000000000004 a0 : 0000000000000010 a1 : 0000000000000004
[    3.834210]  a2 : 0000000000000001 a3 : ffffffff801fa22c a4 : ff5ffffffff78000
[    3.834558]  a5 : ffebfffefffef000 a6 : ffebfffefffef001 a7 : ff5ffffffff78003
[    3.834931]  s2 : ff5ffffffff78000 s3 : 0000000000000000 s4 : ffffffff815b59b0
[    3.835292]  s5 : ffffffff81d815e0 s6 : 0000000000000000 s7 : 0000000000000008
[    3.836400]  s8 : ffffffff81d8b0e0 s9 : 0000000000000000 s10: 0000000000000008
[    3.836817]  s11: ff5ffffffff78000 t3 : 0000000000000000 t4 : ffebfffefffef000
[    3.837154]  t5 : ffebfffefffef001 t6 : 0000000000000002
[    3.837471] status: 0000000000000120 badaddr: ffebfffefffef000 cause: 000000000000000d
[    3.837933] [<ffffffff801fa22c>] pcpu_alloc+0x494/0x838
[    3.838324] [<ffffffff801fa5fc>] __alloc_percpu+0x14/0x1c
[    3.838623] [<ffffffff800930fa>] __percpu_init_rwsem+0x1a/0x98
[    3.838995] [<ffffffff80286c5a>] alloc_super+0x148/0x3da
[    3.839631] [<ffffffff80287af2>] sget_fc+0x90/0x2c4
[    3.840240] [<ffffffff80288498>] get_tree_nodev+0x24/0xa4
[    3.840598] [<ffffffff801e919a>] shmem_get_tree+0x14/0x1c
[    3.840891] [<ffffffff80286436>] vfs_get_tree+0x3a/0x11a
[    3.841172] [<ffffffff802ba746>] path_mount+0x2ea/0xb44
[    3.841468] [<ffffffff802bb69a>] sys_mount+0x1b2/0x270
[    3.841790] [<ffffffff80003d1c>] ret_from_syscall+0x0/0x2
[    3.842480] ---[ end trace 0000000000000000 ]---

>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index fba9e9f46a8c..04bcc91c91ea 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -3,10 +3,13 @@
>   * Copyright (C) 2012 Regents of the University of California
>   */
>
> +#include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/seq_file.h>
>  #include <linux/of.h>
> +#include <asm/csr.h>
>  #include <asm/hwcap.h>
> +#include <asm/sbi.h>
>  #include <asm/smp.h>
>  #include <asm/pgtable.h>
>
> @@ -64,6 +67,50 @@ int riscv_of_parent_hartid(struct device_node *node)
>  }
>
>  #ifdef CONFIG_PROC_FS
> +
> +struct riscv_cpuinfo {
> +	unsigned long mvendorid;
> +	unsigned long marchid;
> +	unsigned long mimpid;
> +};
> +static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> +
> +static int riscv_cpuinfo_starting(unsigned int cpu)
> +{
> +	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> +
> +#if IS_ENABLED(CONFIG_RISCV_SBI)
> +	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
> +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> +	ci->mvendorid = csr_read(CSR_MVENDORID);
> +	ci->marchid = csr_read(CSR_MARCHID);
> +	ci->mimpid = csr_read(CSR_MIMPID);
> +#else
> +	ci->mvendorid = 0;
> +	ci->marchid = 0;
> +	ci->mimpid = 0;
> +#endif
> +
> +	return 0;
> +}
> +
> +static int __init riscv_cpuinfo_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/cpuinfo:starting",
> +				riscv_cpuinfo_starting, NULL);
> +	if (ret < 0) {
> +		pr_err("cpuinfo: failed to register hotplug callbacks.\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +device_initcall(riscv_cpuinfo_init);
> +
>  #define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
>  	{							\
>  		.uprop = #UPROP,				\
> @@ -178,6 +225,7 @@ static int c_show(struct seq_file *m, void *v)
>  {
>  	unsigned long cpu_id = (unsigned long)v - 1;
>  	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
> +	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
>  	const char *compat, *isa;
>
>  	seq_printf(m, "processor\t: %lu\n", cpu_id);
> @@ -188,6 +236,9 @@ static int c_show(struct seq_file *m, void *v)
>  	if (!of_property_read_string(node, "compatible", &compat)
>  	    && strcmp(compat, "riscv"))
>  		seq_printf(m, "uarch\t\t: %s\n", compat);
> +	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
> +	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
> +	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
>  	seq_puts(m, "\n");
>  	of_node_put(node);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
