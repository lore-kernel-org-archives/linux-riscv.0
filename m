Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7996DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 04:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZgTrSdVxs/i4h59gqTa3Iw3usPzEzZ34V7VwE3w1nc=; b=24TbP2CxUaDCXK
	wnfgGEOZfcw+VbzpK8qKVJe1ogYt4IwzTlUs8qI7WF3pPkR36VANlAPVJurCM9TTDRevT3gLgpExK
	ZpcT5CeD/6p0UKZFZzPKLArdvA8Z1DZYmWSG6DOlDg9nhR6c8xd0TtUpqa3G+CGbs1psC1h1HwF2V
	GU70arm7Re8ku1CQsk0dQ0TSB6Op08Yh6sDxXI0VxMH6WpQwcePaS13sCpf4FZrLx73mT4ivjAeFi
	mubwAHk5jgFeBfaL8IkwqUXbRc87gxfBww2qFMWL2lu9jlKXfKMWunuwMjIss9G0IzpCTyBFigIny
	nmjx6wH9iwIoa8I8fpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np0dY-009zZp-TC; Thu, 12 May 2022 04:41:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np0dV-009zYy-J6
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 04:41:15 +0000
Received: by mail-wr1-x42e.google.com with SMTP id u3so5537476wrg.3
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 21:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JcdYqWHUqRf4Mz3kgMux9R5B7ffyNDGfpfPaHK4SM0g=;
 b=DFeUcDo6H2aoV6kYVU1JvbEJ0fuGodd7wNIkeCe0MhRPUeTnvZD9V0dbhGKMnR3dLs
 w8YBKvAwjgUQE4U7grVMrM7nrEWmhOCRqko3Nwzs+kpzWgAlR3ZWAllP/uCYDVveInj3
 dv2F+Qfg/tUt3JAPKeRxqUiMP3vWXLIqy+veroQ6MhkYR/DGilKTSkVwDK5BwNVWvoB0
 bftw0g9FXr0h2G1VBe3SdH7+pKo5Vw5rp6g/T3f8BrRUql84EopPPQw1wfU+XT8rC185
 SZ78qaj/vvLQjkOZt3F+IgjZVf/UpSMB3fGh+bqq4VTAMUOyy4TKPscX3Ux9X8YiJZar
 ONiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JcdYqWHUqRf4Mz3kgMux9R5B7ffyNDGfpfPaHK4SM0g=;
 b=poqXmd1Y4cEYSPqf0b3lZtCQfdX4uBRBu3QdCSaZa2wb2AbmBSa7n0oSO1CyuwvOdc
 oc8AjpdR+zF6jQXszAdn6EEBdNDczQ/DDQOUZ+WFas8ga7BBreCpAVYcWFConS/aJ5n4
 xRQGdHONWcAC2zXr5yTqG0/9lKj7t5qqIikggkAaPAiSNlqStGa3oNCkqQW5y6IDkXJ/
 iOfEAUYJBXyE8IPFGeu5dyS6XfINc9bxXiyY0d9efTnZbk3sAdXhaB+VQmKHWyT0oeHK
 wWjKGYTIIuuNggyDRVuHUEJoUyoqohMmH6ywryxQV67l+E8yR2+bzPIVXarOnQmLZMmd
 gTow==
X-Gm-Message-State: AOAM533pvnx3ZTr194rZWqFUcOxeom6fv6UmcCzx+UhT7l/8GOw1fIIG
 +vXAzWAA6H1YOC3hWEt/V8I2Lm9URDe6PA+kLq8WAg==
X-Google-Smtp-Source: ABdhPJzFHXexIjbxwrPi8VDw5SUTt3fwk7U1IbTJW8vPrLoeOOXHgzVY7R/ZhvxdoNfTOEiOTbaiPCw7yjXOUoGCILI=
X-Received: by 2002:a5d:6d0d:0:b0:20c:530c:1681 with SMTP id
 e13-20020a5d6d0d000000b0020c530c1681mr25385269wrq.214.1652330470743; Wed, 11
 May 2022 21:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220511214132.2281431-1-heiko@sntech.de>
 <20220511214132.2281431-4-heiko@sntech.de>
In-Reply-To: <20220511214132.2281431-4-heiko@sntech.de>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 May 2022 10:10:58 +0530
Message-ID: <CAAhSdy1riRoVKz=7N865ZJ6tsPO+diULZ8ctNrqVuXEmgtrqOA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: implement cache-management errata for
 T-Head SoCs
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 Guo Ren <guoren@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org,
 DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_214113_673498_AE42AD56 
X-CRM114-Status: GOOD (  22.05  )
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

On Thu, May 12, 2022 at 3:11 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The T-Head C906 and C910 implement a scheme for handling
> cache operations different from the generic Zicbom extension.
>
> Add an errata for it next to the generic dma coherency ops.
>
> Tested-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/Kconfig.erratas           | 10 ++++++
>  arch/riscv/errata/thead/errata.c     |  5 +++
>  arch/riscv/include/asm/errata_list.h | 47 +++++++++++++++++++++++++---
>  3 files changed, 58 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index ebfcd5cc6eaf..213629bac5d7 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -54,4 +54,14 @@ config ERRATA_THEAD_PBMT
>
>           If you don't know what to do here, say "Y".
>
> +config ERRATA_THEAD_CMO
> +       bool "Apply T-Head cache management errata"
> +       depends on ERRATA_THEAD && RISCV_ISA_ZICBOM
> +       default y
> +       help
> +         This will apply the cache management errata to handle the
> +         non-standard handling on non-coherent operations on T-Head SoCs.
> +
> +         If you don't know what to do here, say "Y".
> +
>  endmenu
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index e5d75270b99c..9545f43d3504 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -33,6 +33,11 @@ static const struct errata_info errata_list[ERRATA_THEAD_NUMBER] = {
>                 .stage = RISCV_ALTERNATIVES_EARLY_BOOT,
>                 .check_func = errata_mt_check_func
>         },
> +       {
> +               .name = "cache-management",
> +               .stage = RISCV_ALTERNATIVES_BOOT,
> +               .check_func = errata_mt_check_func
> +       },
>  };
>
>  static u32 thead_errata_probe(unsigned int stage, unsigned long archid, unsigned long impid)
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index eebcd4415049..1da311fc5126 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -16,7 +16,8 @@
>
>  #ifdef CONFIG_ERRATA_THEAD
>  #define        ERRATA_THEAD_PBMT 0
> -#define        ERRATA_THEAD_NUMBER 1
> +#define        ERRATA_THEAD_CMO 1
> +#define        ERRATA_THEAD_NUMBER 2
>  #endif
>
>  #define        CPUFEATURE_SVPBMT 0
> @@ -111,8 +112,37 @@ asm volatile(ALTERNATIVE(                                          \
>  #define CBO_CLEAN_A0   ".long 0x25200F"
>  #define CBO_FLUSH_A0   ".long 0x05200F"
>
> +/*
> + * dcache.ipa rs1 (invalidate, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01010      rs1       000      00000  0001011
> + * dache.iva rs1 (invalida, virtual address)
> + *   0000001    00110      rs1       000      00000  0001011
> + *
> + * dcache.cpa rs1 (clean, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01001      rs1       000      00000  0001011
> + * dcache.cva rs1 (clean, virtual address)
> + *   0000001    00100      rs1       000      00000  0001011
> + *
> + * dcache.cipa rs1 (clean then invalidate, physical address)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000001    01011      rs1       000      00000  0001011
> + * dcache.civa rs1 (... virtual address)
> + *   0000001    00111      rs1       000      00000  0001011
> + *
> + * sync.s (make sure all cache operations finished)
> + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> + *   0000000    11001     00000      000      00000  0001011
> + */
> +#define THEAD_INVAL_A0 ".long 0x0265000b"
> +#define THEAD_CLEAN_A0 ".long 0x0245000b"
> +#define THEAD_FLUSH_A0 ".long 0x0275000b"
> +#define THEAD_SYNC_S   ".long 0x0190000b"
> +
>  #define ALT_CMO_OP(_op, _start, _size, _cachesize)                     \
> -asm volatile(ALTERNATIVE(                                              \
> +asm volatile(ALTERNATIVE_2(                                            \
> +       "nop\n\t"                                                       \
>         "nop\n\t"                                                       \
>         "nop\n\t"                                                       \
>         "nop\n\t"                                                       \
> @@ -124,8 +154,17 @@ asm volatile(ALTERNATIVE(                                          \
>         CBO_##_op##_A0 "\n\t"                                           \
>         "add a0, a0, %0\n\t"                                            \
>         "2:\n\t"                                                        \
> -       "bltu a0, %2, 3b\n\t", 0,                                       \
> -               CPUFEATURE_CMO, CONFIG_RISCV_ISA_ZICBOM)                \
> +       "bltu a0, %2, 3b\n\t"                                           \
> +       "nop", 0, CPUFEATURE_CMO, CONFIG_RISCV_ISA_ZICBOM,              \
> +       "mv a0, %1\n\t"                                                 \
> +       "j 2f\n\t"                                                      \
> +       "3:\n\t"                                                        \
> +       THEAD_##_op##_A0 "\n\t"                                         \
> +       "add a0, a0, %0\n\t"                                            \
> +       "2:\n\t"                                                        \
> +       "bltu a0, %2, 3b\n\t"                                           \
> +       THEAD_SYNC_S, THEAD_VENDOR_ID,                                  \
> +                       ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)      \
>         : : "r"(_cachesize),                                            \
>             "r"(ALIGN((_start), (_cachesize))),                         \
>             "r"(ALIGN((_start) + (_size), (_cachesize))))
> --
> 2.35.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
