Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7442DC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHNWi94O3Lnpf1kO5zRCEl+cNVWtTY6ox5IB4COv8BY=; b=etkrlNll0jl5S3wb7OM+yMYoV2
	EKOn9TGtdmGLAnefyMxyQWrDD5FGrEE2uxt9X6G5D9+lwWZiuPYw7oUeZrmbXBDqo3w3IJRlkBr1p
	fsQq3PZ4nLbs4YmzisqToWBWjGkKQcSVZYp1XdmByzCoLixgKxxembRJBqZAVhJ7MT1s4Qa5rULd3
	29n0oD+ZGVA5XH7Ltj0SLPlwRvfgrX2mxrll436/3dLZxPN4ur+HLA35WF71OXhbUJBS7/F94XsDf
	9kR5uQDHepkNWY8vEKrZhA/BM8utyX9hsuHcgaL3BDoGrhoJjCK0bMc1ZOZj/xkPzRmucLot0V6GA
	3JTdCbLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3HuU-0010ff-2G; Mon, 20 Jun 2022 13:57:46 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3HuQ-0010ep-Tj
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 13:57:44 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9E8EB41019
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1655733454;
	bh=UjWWV2JsQCgy6zDEj9EuL2ro4g8nwmVgSxv7l8VWHJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=GBoo+OHlHOGNktswWMtsrMPI5zJSb9F/Vz8D4i7gD/JADBo/RcbvLCEA6u3WL4GhO
	 eg3v/4zJmcoichx8dnE6klAxlQDwhZX6RJgj7JT/kGy3JjDlJGrVbzMBp7PB6As9me
	 VwDX0wU3NeG3qihN+OJmuMxA1VCxjCqU1yIyTQmzYzNw2/TvvqEM3+H9+nEBbF813P
	 Ccw6G6XuZwdUOv7EZys/tnxu52AOaVyfk5pLxhglBn2eMyat33xC+Zg4BKTrTQM9MO
	 hafqjQ9sk+mdr4/XAnwCCR+5gWEqcwQ2hR+N3+KsOePMotLZKvpgh3PTbfjLlJHa6a
	 0IU23sqCoeQIg==
Received: by mail-ej1-f70.google.com with SMTP id q5-20020a17090676c500b00704ffb95131so3543084ejn.8
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 06:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UjWWV2JsQCgy6zDEj9EuL2ro4g8nwmVgSxv7l8VWHJA=;
        b=mLwZ/tGSfIfwa7GsZ3cKi566wpu4AzmVmXGp7ytXOWQxk38Di8doS0jcLt590SCeil
         KRh0EjLWV/Cqp1b4E6ZnwWZDAc8ke7wZvcbp2+1Bf6uUZVGGglQkTVvnpxDGmP9FVjLJ
         PJ+nEIlvSHt5/EE7j2KYjrcsHxTa1v06HynTnc6ltSOxKf2N/lXSxwGWb7INjJOKXr4b
         rnbd7XgsTNxTVyd+c43XEApO89dHH4VP4gs922xOvOXdcWUUVcBacmHqELu5X0c1+cYa
         /j9DkHR60Yq2LbMQWQ1Jd3IDlYBHONqIl+3DIcRrhkE5fEiMH4zkVVpl2TevfzuwszdZ
         UrHQ==
X-Gm-Message-State: AJIora/GzmUvIo9sOP4UBxrqx2Z8SjwY8dfxIzaaKbbwnq/7GmpxY1Ny
	hqkzx7NqwaLfVyPuZDF9KlU3AvaaeYky3efnC0PqMKs+HVRztIC/K48zrE8F+uNTA+YNtzVAGc1
	xNxBwBHkFdAtE00cxRKaXJhGXA1ae1adSTHk4HSNZgOFHWA==
X-Received: by 2002:a17:906:d82:b0:70d:84d3:b6df with SMTP id m2-20020a1709060d8200b0070d84d3b6dfmr21352637eji.464.1655733450894;
        Mon, 20 Jun 2022 06:57:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vVS97kAx9306dyv65/TAKsm/97ata58xufvRiuoec6Rp1o9D2PtkTQHDVegiTy6jZAGRw5SQ==
X-Received: by 2002:a17:906:d82:b0:70d:84d3:b6df with SMTP id m2-20020a1709060d8200b0070d84d3b6dfmr21352616eji.464.1655733450597;
        Mon, 20 Jun 2022 06:57:30 -0700 (PDT)
Received: from [172.18.241.121] ([46.183.103.8])
        by smtp.gmail.com with ESMTPSA id x6-20020aa7d386000000b004355998ec1asm8930019edq.14.2022.06.20.06.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 06:57:30 -0700 (PDT)
Message-ID: <dfaa54b3-0ffa-7e75-93d1-15e4e0316dac@canonical.com>
Date: Mon, 20 Jun 2022 15:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
References: <20220620115549.1529597-1-apatel@ventanamicro.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220620115549.1529597-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_065743_343396_C7AE64FC 
X-CRM114-Status: GOOD (  24.02  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 6/20/22 13:55, Anup Patel wrote:
> Identifying the underlying RISC-V implementation can be important
> for some of the user space applications. For example, the perf tool
> uses arch specific CPU implementation id (i.e. CPUID) to select a
> JSON file describing custom perf events on a CPU.
> 
> Currently, there is no way to identify RISC-V implementation so we
> add mvendorid, marchid, and mimpid to /proc/cpuinfo output.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Looks good to me. I only tested on QEMU where all values default to 0.

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index fba9e9f46a8c..c037b8691bbb 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -3,10 +3,13 @@
>    * Copyright (C) 2012 Regents of the University of California
>    */
>   
> +#include <linux/cpu.h>
>   #include <linux/init.h>
>   #include <linux/seq_file.h>
>   #include <linux/of.h>
> +#include <asm/csr.h>
>   #include <asm/hwcap.h>
> +#include <asm/sbi.h>
>   #include <asm/smp.h>
>   #include <asm/pgtable.h>
>   
> @@ -64,6 +67,50 @@ int riscv_of_parent_hartid(struct device_node *node)
>   }
>   
>   #ifdef CONFIG_PROC_FS
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
>   #define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
>   	{							\
>   		.uprop = #UPROP,				\
> @@ -178,6 +225,7 @@ static int c_show(struct seq_file *m, void *v)
>   {
>   	unsigned long cpu_id = (unsigned long)v - 1;
>   	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
> +	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
>   	const char *compat, *isa;
>   
>   	seq_printf(m, "processor\t: %lu\n", cpu_id);
> @@ -188,6 +236,9 @@ static int c_show(struct seq_file *m, void *v)
>   	if (!of_property_read_string(node, "compatible", &compat)
>   	    && strcmp(compat, "riscv"))
>   		seq_printf(m, "uarch\t\t: %s\n", compat);
> +	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
> +	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
> +	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
>   	seq_puts(m, "\n");
>   	of_node_put(node);
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
