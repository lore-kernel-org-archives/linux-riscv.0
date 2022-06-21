Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96659C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 07:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07UEeyg2vb9WPlHpZyEm5lDv0rVUfGnLxd9f7m8haXA=; b=zYrNqsZnQk7uIK
	Q9zfQViTakhgAvKtAICxd+kEG47JFvtUKeF5X3z4nUt5ekNY/+Kdw+Q4Z+akBjG6Rbie0p9+rxz8O
	PkDyxH0kcjjSfe+UjrRScUWbIV2rv09XYpZxbf7UvTkvg6PsIIhN83u2mZFbwpKY4RF3u248Eubwl
	6x1E1NAw0cwu++LWWM90ljGhyKkle1hqqZW/382lpIOUzPH1MsBGVd5eJufmQLAMLmTigc7aD1J3Q
	94eCjoLsl2FbOZ9md1LxmjnBNGrsufp8K/sbijfuB29ed/jtzHz16KbZn1k1Ruap8lSuDKzuJGanH
	1ZZ/xeqBOo280JIvBTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3YVC-00497t-2t; Tue, 21 Jun 2022 07:40:46 +0000
Received: from forward500o.mail.yandex.net ([2a02:6b8:0:1a2d::610])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3YV6-00493Z-LB
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 07:40:44 +0000
Received: from myt6-93965afc2133.qloud-c.yandex.net (myt6-93965afc2133.qloud-c.yandex.net [IPv6:2a02:6b8:c12:5525:0:640:9396:5afc])
	by forward500o.mail.yandex.net (Yandex) with ESMTP id CD00D940DAC;
	Tue, 21 Jun 2022 10:40:33 +0300 (MSK)
Received: from myt5-01d0fbe499ab.qloud-c.yandex.net (myt5-01d0fbe499ab.qloud-c.yandex.net [2a02:6b8:c12:4619:0:640:1d0:fbe4])
	by myt6-93965afc2133.qloud-c.yandex.net (mxback/Yandex) with ESMTP id DqjiMbBwxe-eWh05tEC;
	Tue, 21 Jun 2022 10:40:33 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1655797233;
	bh=RdX/+yTKrxFGxvASlWbAzAdqYEzzocthfBSsMMgNr3Y=;
	h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
	b=Qy4sYZrHWLy5aniM2Q8DLanUFI2lgGMlIcLBMZOvtbwlm7YyrxUEHTcfljkQpY0id
	 q89bdZ8psW9qhCz159ety4bcuXPib6E965hdu9hgKWU5MWpeAOg6n/PQa0bz2W7e4A
	 KgXh1+wx9D3ICmQgv+YD//brfOeeNQ0JECFWaJ44=
Authentication-Results: myt6-93965afc2133.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt5-01d0fbe499ab.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id zSjiCSJHOL-eVMWsID8;
	Tue, 21 Jun 2022 10:40:32 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
Date: Tue, 21 Jun 2022 10:40:30 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@arndb.de>, Atish Patra
 <atishp@atishpatra.org>, Heinrich Schuchardt
 <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
Message-ID: <20220621104030.349c570b@redslave.neermore.group>
In-Reply-To: <20220620115549.1529597-1-apatel@ventanamicro.com>
References: <20220620115549.1529597-1-apatel@ventanamicro.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_004041_958793_5A443008 
X-CRM114-Status: GOOD (  23.16  )
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

Hello Anup!

On Mon, 20 Jun 2022 17:25:49 +0530
Anup Patel <apatel@ventanamicro.com> wrote:

> Identifying the underlying RISC-V implementation can be important
> for some of the user space applications. For example, the perf tool
> uses arch specific CPU implementation id (i.e. CPUID) to select a
> JSON file describing custom perf events on a CPU.
> 
> Currently, there is no way to identify RISC-V implementation so we
> add mvendorid, marchid, and mimpid to /proc/cpuinfo output.

Tested on Sifive Unmatched:

localhost / # cat /proc/cpuinfo 
processor       : 0
hart            : 4
isa             : rv64imafdc
mmu             : sv39
uarch           : sifive,bullet0
mvendorid       : 0x489
marchid         : 0x8000000000000007
mimpid          : 0x20181004

processor       : 1
hart            : 1
isa             : rv64imafdc
mmu             : sv39
uarch           : sifive,bullet0
mvendorid       : 0x489
marchid         : 0x8000000000000007
mimpid          : 0x20181004

processor       : 2
hart            : 2
isa             : rv64imafdc
mmu             : sv39
uarch           : sifive,bullet0
mvendorid       : 0x489
marchid         : 0x8000000000000007
mimpid          : 0x20181004

processor       : 3
hart            : 3
isa             : rv64imafdc
mmu             : sv39
uarch           : sifive,bullet0
mvendorid       : 0x489
marchid         : 0x8000000000000007
mimpid          : 0x20181004

mvendorid, marchid values match the register description in u74 manual.

mimpid seems to be ok, through i can't find exact in U74/Unmatched docs.

Tested-by: Nikita Shubin <n.shubin@yadro.com>

> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpu.c | 51
> +++++++++++++++++++++++++++++++++++++++++ 1 file changed, 51
> insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index fba9e9f46a8c..c037b8691bbb 100644
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
> @@ -64,6 +67,50 @@ int riscv_of_parent_hartid(struct device_node
> *node) }
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
> +#if defined(CONFIG_RISCV_SBI)
> +	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
> +#elif defined(CONFIG_RISCV_M_MODE)
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
> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> "riscv/cpuinfo:starting",
> +				riscv_cpuinfo_starting, NULL);
> +	if (ret < 0) {
> +		pr_err("cpuinfo: failed to register hotplug
> callbacks.\n");
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
> +	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo,
> cpu_id); const char *compat, *isa;
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
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
