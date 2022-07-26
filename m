Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19B1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhAj9AwfeH+flo/uCYdOglTsil5BIRMKGxmZ7POrLtc=; b=fH4PP9u9R6qWWE
	PAz9G3CCUTbKh/WCjt6VFnK9fcNrBfG56UCFPSpJqFeGkFhBlZlgPW1oiq6rHHgi/hWn5Yl5RH6H7
	aR1qS52wT/ztKCql1hVFpXbI9Q2Zf/NDxjyC6stOZf1uWfllAs7pGaBVD1zgF6DDhJaYIf0akKPW8
	yuRYyw+/g/9q06Ds0XnC+x10b99/d5x2V77rTPjD4ifrOPMcad+/19PwDPJZOxPW6nRdeW+zlwisc
	QPYCuFK2tBYtnC3a8fRZsSiCFrbXpFVFSyvu867v0v+/afsZRAX26B451QzQ/jhOh48LP7uSxVKtY
	KNTsbTHR/PpHgkKT3sgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJBf-00GWkW-Dz; Tue, 26 Jul 2022 11:57:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJBc-00GWgn-U0
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 11:57:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso11166174wma.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8b1XaIe2pvWP5K0yAx5yjeutw2voVbR8sHlsVHCDajs=;
        b=yMtzTJeqrokV2Tq5n9n0naG9BirUc2w4TdHlJJhVt8ONXCDvE0yFD/l2QV14iAO9DN
         lEyu6vMN4AtNxp7R50TNLxHa1uLikl+YgnwA4Yam2fIXfRmCEf/dio1dyqNYUaWLRLzF
         EfusuE/dxyqTUKBnZco/jPxSBWdRPfTiTj01cPA14iYm0iSePTzYbKrMTlJgifJe9r+D
         wwniCNDsSQCbWS1yl/VtNEb4Lc1f2HAStTf8nyc+lXwwGqBaOtKj0bRhMcXorpPpSde9
         /w4TK23qDBWLZ9HJTOp4iYyyEUyNbJNRuSQOX5Le1KCGD1ZJQtSO1IJifsR7aNHkFVJf
         29Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8b1XaIe2pvWP5K0yAx5yjeutw2voVbR8sHlsVHCDajs=;
        b=2WZerv6w4j0IEnaaQR0DWzoL7rqkOZV+Iu0Ba0G7y+JeInCPdGonA/xePjEVd0X1kq
         58YK98C2SXCWchJ9qd6HH9fac4ME6aOHhTKtW7bkkS7MQHN9adzt8/e994YtXl2Qi5QU
         lVxIQXP9aYfFX9PlEg+DvBB/j5H+nLF/Rqnd0v7Jv9gHPnX9tEkCxJNxYR4oE8GlP1Rl
         VwK8o2W8GoTXqx2BSv2tmGM/1Xul4swNF5E5v+wOFSuvv58sT27iE4P5+Wy0rQLo7qdC
         CI8PlsPzpgAMgV0bhx4+JVcDlCZ5U6Ej6jBfl4UdmKufuoyLvJuThqtDXdgLUvZZZwNB
         R8LQ==
X-Gm-Message-State: AJIora++1n9lO5z3SCCjj6CV5Ev9BmmKF3H6Kior/GZKW+h5zNXIjhsA
	L+RgtQ4xqEWChp1rb3Dun/EoEFYYkV/jsXsO7sKDUA==
X-Google-Smtp-Source: AGRyM1tCsyWx3aQSXg4PAykzfRvt3l5LMRP2q5eLJSb9++LwDzChr3pObi7mI8aHh7PWgj5oUNFQnXVDtMjSYoqIjDs=
X-Received: by 2002:a05:600c:4fd5:b0:3a3:4664:6d55 with SMTP id
 o21-20020a05600c4fd500b003a346646d55mr12232878wmq.73.1658836634580; Tue, 26
 Jul 2022 04:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220620115549.1529597-1-apatel@ventanamicro.com>
In-Reply-To: <20220620115549.1529597-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Jul 2022 17:27:03 +0530
Message-ID: <CAAhSdy0mHbxQ3QVP9j1==oTG75Z9_T2bDSif-UGKppG+-hoJng@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_045717_004446_68274BFF 
X-CRM114-Status: GOOD (  24.48  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Mon, Jun 20, 2022 at 5:26 PM Anup Patel <apatel@ventanamicro.com> wrote:
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

Can this patch be considered for 5.20 ?

Regards,
Anup

> ---
>  arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
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
> +#if defined(CONFIG_RISCV_SBI)
> +       ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +       ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +       ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
> +#elif defined(CONFIG_RISCV_M_MODE)
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
