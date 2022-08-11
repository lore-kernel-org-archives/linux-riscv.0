Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B27BC19F2D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 05:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPA7Hf9cDhTgRyLVXwfk42k0XgRjqYbKQ7B1+1H4uHc=; b=v8sa9x9ti3KddW
	vHzs1Je+q8fXVhoxKuKfgJPcLJby6e2XJFFGLrMhuQzcbHQdStgC/9Y3xzgcqHc6Xc6Pe/WDIjQUD
	nuPxC+RSekwvms7yuxpv3UkAh2wryLJbpl3/ku4aoyZJhyAXBTvQ4FBHbFfEYSrkAjv43TpB+Gj2i
	gmMHpRVGUl6mfsJv1e7o5/a5pVFxJbJrGkgZNUIoJwj7/Y94l7QBotXHTVMnOjD8bSW6oh6+OmKyz
	Yu57f9cElNK6gWOgvk33crEBF+A/lEOzilXoZTaJmS357o2yr38CnQcGng6gk5uDGmPC3mjqVZ+3H
	z4Ndqcz7oaVehxWkpCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM0OP-005bsj-2B; Thu, 11 Aug 2022 05:06:01 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM0OL-005bbY-KA
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 05:05:59 +0000
Received: by mail-yb1-xb34.google.com with SMTP id i62so26609359yba.5
        for <linux-riscv@lists.infradead.org>; Wed, 10 Aug 2022 22:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=/EV/6vKBfwB5hGGmbwACRoUY2VnjvKdGK/sVggplOt0=;
        b=SZp0czCs3FP+FA1BlEgSpDvs1bQvp06qb4C2kPdLUTDPYTy2WBrUZg3/a98c3dSrOz
         lGQ9NM5A48i91jEmokx5aCis0sLdi3toGNtRdy1hiPfR31NeTGDH6TECnw0ddgB6S18E
         jMN2VTy4W38RTTNeBe8jQvapDj8jwb1VzFs/EfZLmQn1NJc3Fahb90KOC9VQxTEalV+W
         R2ZcD/OTZ5YeMvEVMqFxUolpWf0oJnQGZwHd1rMKYZutLoZ5uAV+ktX/4R0IN98zMlmx
         5ZbRJctM5wTp7/f9H0HO0TTCCASLuLBd+gAvWY1uBv4ki4MEy4HLNKNxy+D2xKif6ixW
         eYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/EV/6vKBfwB5hGGmbwACRoUY2VnjvKdGK/sVggplOt0=;
        b=jd2tYPPEy8n5n+Z8HAgMtJ7Mo2w+Nu1/7ntVe1X2GKpdF4zQrJFoDkYHMAWcC+dvSl
         RMYxLHLQNyjABsrnxd02oydi3fpqbY80oFAcrrOdgxE25vOWPG6d4vdhPrgoB23mc0xX
         8iZ7FzcKXa9YxDY56v6zyWlgjW0V6OVdgJTaBpAHwwqlnveqecVK7ZMF5C9o3D8QC9tg
         vtpMBfmy9fe48bsWdS/aWhD5nfwyPRRtchOe2d55QqlcVcu8G/qEdjaqQTw23NirQhPT
         9198eodXY6wBoiIO8xTwW2tBZPP9JF6RsnDbZ5KmcwA9AGPiWZyO0MnLj30UAx8FANPe
         mzwQ==
X-Gm-Message-State: ACgBeo08/noX/t1Gw+2UcuIAq2glqLJ13FPlDGbDB4b8WhD480UTS8dv
	ASnP3tMYAwL/exIWVXtn7R7bILTJ3JzfkwbIRosjTQ==
X-Google-Smtp-Source: AA6agR40PCuyaSTI1Uow9nq58N+CsnqePvWW40teJrjRbbony3PdddX4i0iGhgizr7ACr2kj8T7+iXEDrzG/Xhf/nBs=
X-Received: by 2002:a25:abd4:0:b0:67b:db4b:b682 with SMTP id
 v78-20020a25abd4000000b0067bdb4bb682mr16829510ybi.423.1660194351452; Wed, 10
 Aug 2022 22:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220727043829.151794-1-apatel@ventanamicro.com>
In-Reply-To: <20220727043829.151794-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 11 Aug 2022 10:35:39 +0530
Message-ID: <CAAhSdy1rUT6g-VfZUF5aGv0BU0yqvy7eiZ0k=OFp9z88ORnRLw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_220557_924304_E5E35659 
X-CRM114-Status: GOOD (  24.53  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Nikita Shubin <n.shubin@yadro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Wed, Jul 27, 2022 at 10:09 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
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

Can this patch be considered for 5.20 ?

Regards,
Anup


> ---
> Changes since v1:
>  - Use IS_ENABLED() to check CONFIG defines
>  - Added RB and TB tags in commit description
> ---
>  arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
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
> +       unsigned long mvendorid;
> +       unsigned long marchid;
> +       unsigned long mimpid;
> +};
> +static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> +
> +static int riscv_cpuinfo_starting(unsigned int cpu)
> +{
> +       struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> +
> +#if IS_ENABLED(CONFIG_RISCV_SBI)
> +       ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +       ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +       ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
> +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> +       ci->mvendorid = csr_read(CSR_MVENDORID);
> +       ci->marchid = csr_read(CSR_MARCHID);
> +       ci->mimpid = csr_read(CSR_MIMPID);
> +#else
> +       ci->mvendorid = 0;
> +       ci->marchid = 0;
> +       ci->mimpid = 0;
> +#endif
> +
> +       return 0;
> +}
> +
> +static int __init riscv_cpuinfo_init(void)
> +{
> +       int ret;
> +
> +       ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/cpuinfo:starting",
> +                               riscv_cpuinfo_starting, NULL);
> +       if (ret < 0) {
> +               pr_err("cpuinfo: failed to register hotplug callbacks.\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +device_initcall(riscv_cpuinfo_init);
> +
>  #define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
>         {                                                       \
>                 .uprop = #UPROP,                                \
> @@ -178,6 +225,7 @@ static int c_show(struct seq_file *m, void *v)
>  {
>         unsigned long cpu_id = (unsigned long)v - 1;
>         struct device_node *node = of_get_cpu_node(cpu_id, NULL);
> +       struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
>         const char *compat, *isa;
>
>         seq_printf(m, "processor\t: %lu\n", cpu_id);
> @@ -188,6 +236,9 @@ static int c_show(struct seq_file *m, void *v)
>         if (!of_property_read_string(node, "compatible", &compat)
>             && strcmp(compat, "riscv"))
>                 seq_printf(m, "uarch\t\t: %s\n", compat);
> +       seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
> +       seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
> +       seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
>         seq_puts(m, "\n");
>         of_node_put(node);
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
