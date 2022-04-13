Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0AAC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 05:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6b+lmuoIOC/hBG/r7hXtMy/01BAz4Ll6Bz+WFj/nKw=; b=fI7fXWVVmwmDlO
	rjEA3rqqmL3m1Cuj/46ZT9WsNzCe0EQJnLQBVrzvbZ7YP3Qe0xSrf2evYQZx3fmLeXscZbuQDy4pj
	2QEyoltjszCZ/5e5Z6Y0QYQsQr04kXjlWlshnLqkRbPnCZRSax1xXx+PEeXOnnI+aOvrG6o/hLi6I
	Bd/cCdnemxqmhATL/2yv9MAIQDNl+cDNj41lw4+BR3NDrxE+BW03CbpEp/7kp+auNTySzx0HDEgc8
	mrl2EAp/v9d8IY80FDXVc7nHRTUxzTsKehGFylWBMJNyOGADEjix1ROZ53p3zzLu+4f+18+DlWEzq
	MiulGkHU23BhpX/sMD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neVn8-00Gsq6-EC; Wed, 13 Apr 2022 05:43:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neVn3-00GsnD-S9
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 05:43:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1286FB81EA0
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 05:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6547C385A3
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 05:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649828618;
 bh=/FrnSH2WEffAMUSINX5YRRNCa84mQQXFqUaKrMa2O8g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J+XRjB03bLPsoZxDyY60Y2dm24wHqIB0OekWEtFpXkS0qY1ixMCn1j6qECQ1KZsws
 Yfpk7Aq4Oeiqnvd0vgeBHhUNfrYe4ugzypHHE4hwWplgkgP9i9o8JcdCA6DYGCOqN/
 Pax2SH+BS5TFvULiAlNRrA4pBJ+7bUM2KAZEN+PptNgvDMbg9ZvkwgqirYOIj2u+A5
 1yBfxEgY7tk5j8Je1SgsDS/mNaYDy7SUQ46z38W66Uk89i0eLBiedfFAriQf1amBcU
 VjJ/EooanMYTHq0wLIUAx4kEtLnOvQiq4Qv4Kh8m3Fg8BTBJP5NQVh+m7hTcTkX31i
 lnqD7nIjdNS8g==
Received: by mail-vs1-f41.google.com with SMTP id r25so594807vsa.13
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 22:43:38 -0700 (PDT)
X-Gm-Message-State: AOAM531DD7NqOBqZAgr32G9BiLjPbQfCw2OrsYfO/QOd+XAPnPspPpAO
 Eswc8uprqqj7g37K/cWrkOTuNSNUZ2ukx60AfGU=
X-Google-Smtp-Source: ABdhPJy2avZwchYHAlQb8sZugCA7bTV4Hv+K09Rv5a9uDjI8oF3FiXTnzKYl2Zga5tmNutly0w+RAAIlTHH9o0p17Wg=
X-Received: by 2002:a05:6102:38d1:b0:325:aff9:358 with SMTP id
 k17-20020a05610238d100b00325aff90358mr13437567vst.8.1649828617736; Tue, 12
 Apr 2022 22:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-12-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-12-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Apr 2022 13:43:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTZFZ19Lw8oD3Kuy-JvZk42c+HeWOXPt11ai3n60XuEyw@mail.gmail.com>
Message-ID: <CAJF2gTTZFZ19Lw8oD3Kuy-JvZk42c+HeWOXPt11ai3n60XuEyw@mail.gmail.com>
Subject: Re: [PATCH v9 11/12] riscv: don't use global static vars to store
 alternative data
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 liush <liush@allwinnertech.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_224342_246250_F6142D40 
X-CRM114-Status: GOOD (  26.20  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Wed, Apr 13, 2022 at 11:05 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Right now the code uses a global struct to store vendor-ids
> and another global variable to store the vendor-patch-function.
>
> There exist specific cases where we'll need to patch the kernel
> at an even earlier stage, where trying to write to a static
> variable might actually result in hangs.
>
> Also collecting the vendor-information consists of 3 sbi-ecalls
> (or csr-reads) which is pretty negligible in the context of
> booting a kernel.
>
> So rework the code to not rely on static variables and instead
> collect the vendor-information when a round of alternatives is
> to be applied.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/alternative.c | 51 ++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 27 deletions(-)
>
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index e6c9de9f9ba6..27f722ae452b 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -16,41 +16,35 @@
>  #include <asm/sbi.h>
>  #include <asm/csr.h>
>
> -static struct cpu_manufacturer_info_t {
> +struct cpu_manufacturer_info_t {
>         unsigned long vendor_id;
>         unsigned long arch_id;
>         unsigned long imp_id;
> -} cpu_mfr_info;
> +       void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
> +                                 unsigned long archid, unsigned long impid,
> +                                 unsigned int stage);
> +};
>
> -static void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
> -                                unsigned long archid, unsigned long impid,
> -                                unsigned int stage) __initdata_or_module;
> -
> -static inline void __init riscv_fill_cpu_mfr_info(void)
> +static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info)
>  {
>  #ifdef CONFIG_RISCV_M_MODE
> -       cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
> -       cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
> -       cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
> +       cpu_mfr_info->vendor_id = csr_read(CSR_MVENDORID);
> +       cpu_mfr_info->arch_id = csr_read(CSR_MARCHID);
> +       cpu_mfr_info->imp_id = csr_read(CSR_MIMPID);
>  #else
> -       cpu_mfr_info.vendor_id = sbi_get_mvendorid();
> -       cpu_mfr_info.arch_id = sbi_get_marchid();
> -       cpu_mfr_info.imp_id = sbi_get_mimpid();
> +       cpu_mfr_info->vendor_id = sbi_get_mvendorid();
> +       cpu_mfr_info->arch_id = sbi_get_marchid();
> +       cpu_mfr_info->imp_id = sbi_get_mimpid();
>  #endif
> -}
> -
> -static void __init init_alternative(void)
> -{
> -       riscv_fill_cpu_mfr_info();
>
> -       switch (cpu_mfr_info.vendor_id) {
> +       switch (cpu_mfr_info->vendor_id) {
>  #ifdef CONFIG_ERRATA_SIFIVE
>         case SIFIVE_VENDOR_ID:
> -               vendor_patch_func = sifive_errata_patch_func;
> +               cpu_mfr_info->vendor_patch_func = sifive_errata_patch_func;
>                 break;
>  #endif
>         default:
> -               vendor_patch_func = NULL;
> +               cpu_mfr_info->vendor_patch_func = NULL;
>         }
>  }
>
> @@ -63,14 +57,19 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
>                                                  struct alt_entry *end,
>                                                  unsigned int stage)
>  {
> +       struct cpu_manufacturer_info_t cpu_mfr_info;
> +
> +       riscv_fill_cpu_mfr_info(&cpu_mfr_info);
> +
>         riscv_cpufeature_patch_func(begin, end, stage);
>
> -       if (!vendor_patch_func)
> +       if (!cpu_mfr_info.vendor_patch_func)
>                 return;
>
> -       vendor_patch_func(begin, end,
> -                         cpu_mfr_info.arch_id, cpu_mfr_info.imp_id,
> -                         stage);
> +       cpu_mfr_info.vendor_patch_func(begin, end,
> +                                  cpu_mfr_info.arch_id,
> +                                  cpu_mfr_info.imp_id,
> +                                  stage);
>  }
>
>  void __init apply_boot_alternatives(void)
> @@ -78,8 +77,6 @@ void __init apply_boot_alternatives(void)
>         /* If called on non-boot cpu things could go wrong */
>         WARN_ON(smp_processor_id() != 0);
>
> -       init_alternative();
> -
>         _apply_alternatives((struct alt_entry *)__alt_start,
>                             (struct alt_entry *)__alt_end,
>                             RISCV_ALTERNATIVES_BOOT);
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
