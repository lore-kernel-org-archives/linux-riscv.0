Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474D8C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXcydBjOv3tSuxu+/Bv/HIuBNZjL0WvHqva7NVcSQWk=; b=a5W39xTbkDvtv/
	8NzIxidHRjvvgH5JTJf5hRKMtiEyTIkPsWNkdsWUaAoMstXiv61qUU7JURURkVk+af8LH6+od8n3i
	8uT4Sj3FfjkosECwzWMAF8PEPrSnbLz0KJGqZs0D+tfm2ObHsTw9x/PZRqBE+KlwQL2sPiS4Juxo+
	Q2kF6LCG7k1zn1nuwsDvsdax+/DisHkhDD1fpV+a5B8vsSlGRilBdkzSG/dnsXURKX8rVQkTMQAAH
	VxsbFcfGQ6OhN2Ca4/JV1rjHyMdvGiLptwvd2uqWZYRSGgG/2aamh1T3pQwzwwDij8f38MXd16a9L
	U4aAtbpg5+NK/YmOxtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOcse-00BPzi-AR; Mon, 28 Feb 2022 10:03:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOcsb-00BPyP-4v
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 10:03:46 +0000
Received: by mail-wr1-x432.google.com with SMTP id u1so14482183wrg.11
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 02:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=De2OyZDcwN8o9X6MlMOt7Z7zT/UnfJwRn/VzFf9UnSs=;
 b=fJStaRDEFlrEswt+fpTK2NKKLCysIBk9+9As1XpWnYiXYb6WSBa9HMnYv1oALWt90b
 FWgM/N0s7lfVF4sLe0v2KvjRyHhNeEIwIvYNQsYvW5Vo92TpqFg4oeKlyJvv+Ru/VVeE
 PIOle2bi4UKKxz8KUOAzet02s2pLc2xouIe4Sd5nd4sgiXp0u5P47NozZOMp1ZHITyEg
 eoqOONuIJbEE4jlWLGf5kC4J+nMw8v345/VYKZ2d9o2eV1+JJsxk+mmY9Sro15+rdDHs
 ZY0XJ+Tjpk6hWW9iDbEWHdtNd0Bwt7dQUFK1eTaz9eryP9rbmsRILoDtAkodgUGVolBc
 SEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=De2OyZDcwN8o9X6MlMOt7Z7zT/UnfJwRn/VzFf9UnSs=;
 b=xnkTmbHJXRbNpnJjlQTg6JLQVZUzqnHmY4BleZqaOAqaD6w9D/PEUpRK6NREAqE5iX
 hVFMubjOnEwLPvrJnkRckkeX0xkskv40WtqbU1NwDPi21pR/RNuGGmdiUQ6tl/HzfYHK
 e2o+D4REhpVWoMwHsZuCaQ5P2gSuKAavrQ1ZmgHmHKkR3bp74BNely4kfe/tLjvwF4La
 K0cXPKfeYK65ZIwa7YWVbsa88lKOAhsX6y583CiNm30W2Vjwnp5MWXjhOClPByH8++Tk
 UVoH3Vi4La61X+rx2C+u0Xg9O1FHTOORRILRx6UVBZ0XWZIQaUvxTGnBak3txEOn09lq
 NfFw==
X-Gm-Message-State: AOAM5326rsTAXFE4KtKdceuZNN0qiCovht1MuUr/wARxDanhjM3CDIOC
 o35yee5bWQkdkjjiFAGcmWBs3T5Y63+xMYNK+3s3MQ==
X-Google-Smtp-Source: ABdhPJyhFiH8N+Cg9snwWZQcrUZ0PXgXCv096GnXewDUHoL1YMtQ+KNX9d1XOME2w+qCQYNCyJW6ohVu75CUElWR4MU=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr15298582wrz.690.1646042623031; Mon, 28
 Feb 2022 02:03:43 -0800 (PST)
MIME-Version: 1.0
References: <20220222204811.2281949-1-atishp@rivosinc.com>
 <20220222204811.2281949-3-atishp@rivosinc.com>
In-Reply-To: <20220222204811.2281949-3-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Feb 2022 15:33:24 +0530
Message-ID: <CAAhSdy3EzPugs=-=gSuHbS8XEnxRM-2yyuLLoMfh2+QaciP=hQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] RISC-V: Minimal parser for "riscv, isa" strings
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Tsukasa OI <research_trasio@irq.a4lg.com>, 
 Heiko Stuebner <heiko@sntech.de>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_020345_289056_8F2BA9A0 
X-CRM114-Status: GOOD (  27.36  )
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

On Wed, Feb 23, 2022 at 2:18 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> From: Tsukasa OI <research_trasio@irq.a4lg.com>
>
> Current hart ISA ("riscv,isa") parser don't correctly parse:
>
> 1. Multi-letter extensions
> 2. Version numbers
>
> All ISA extensions ratified recently has multi-letter extensions
> (except 'H'). The current "riscv,isa" parser that is easily confused
> by multi-letter extensions and "p" in version numbers can be a huge
> problem for adding new extensions through the device tree.
>
> Leaving it would create incompatible hacks and would make "riscv,isa"
> value unreliable.
>
> This commit implements minimal parser for "riscv,isa" strings.  With this,
> we can safely ignore multi-letter extensions and version numbers.
>
> [Improved commit text and fixed a bug around 's' in base extension]
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> [Fixed workaround for QEMU]
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/cpufeature.c | 72 ++++++++++++++++++++++++++++------
>  1 file changed, 61 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index dd3d57eb4eea..72c5f6ef56b5 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/bitmap.h>
> +#include <linux/ctype.h>
>  #include <linux/of.h>
>  #include <asm/processor.h>
>  #include <asm/hwcap.h>
> @@ -66,7 +67,7 @@ void __init riscv_fill_hwcap(void)
>         struct device_node *node;
>         const char *isa;
>         char print_str[NUM_ALPHA_EXTS + 1];
> -       size_t i, j, isa_len;
> +       int i, j;
>         static unsigned long isa2hwcap[256] = {0};
>
>         isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
> @@ -92,23 +93,72 @@ void __init riscv_fill_hwcap(void)
>                         continue;
>                 }
>
> -               i = 0;
> -               isa_len = strlen(isa);
>  #if IS_ENABLED(CONFIG_32BIT)
>                 if (!strncmp(isa, "rv32", 4))
> -                       i += 4;
> +                       isa += 4;
>  #elif IS_ENABLED(CONFIG_64BIT)
>                 if (!strncmp(isa, "rv64", 4))
> -                       i += 4;
> +                       isa += 4;
>  #endif
> -               for (; i < isa_len; ++i) {
> -                       this_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
> +               for (; *isa; ++isa) {
> +                       const char *ext = isa++;
> +                       const char *ext_end = isa;
> +                       bool ext_long = false, ext_err = false;
> +
> +                       switch (*ext) {
> +                       case 's':
> +                               /**
> +                                * Workaround for invalid single-letter 's' & 'u'(QEMU).
> +                                * No need to set the bit in riscv_isa as 's' & 'u' are
> +                                * not valid ISA extensions. It works until multi-letter
> +                                * extension starting with "Su" appears.
> +                                */
> +                               if (ext[-1] != '_' && ext[1] == 'u') {
> +                                       ++isa;
> +                                       ext_err = true;
> +                                       break;
> +                               }
> +                               fallthrough;
> +                       case 'x':
> +                       case 'z':
> +                               ext_long = true;
> +                               /* Multi-letter extension must be delimited */
> +                               for (; *isa && *isa != '_'; ++isa)
> +                                       if (!islower(*isa) && !isdigit(*isa))
> +                                               ext_err = true;
> +                               break;
> +                       default:
> +                               if (unlikely(!islower(*ext))) {
> +                                       ext_err = true;
> +                                       break;
> +                               }
> +                               /* Find next extension */
> +                               if (!isdigit(*isa))
> +                                       break;
> +                               /* Skip the minor version */
> +                               while (isdigit(*++isa))
> +                                       ;
> +                               if (*isa != 'p')
> +                                       break;
> +                               if (!isdigit(*++isa)) {
> +                                       --isa;
> +                                       break;
> +                               }
> +                               /* Skip the major version */
> +                               while (isdigit(*++isa))
> +                                       ;
> +                               break;
> +                       }
> +                       if (*isa != '_')
> +                               --isa;
>                         /*
> -                        * TODO: X, Y and Z extension parsing for Host ISA
> -                        * bitmap will be added in-future.
> +                        * TODO: Full version-aware handling including
> +                        * multi-letter extensions will be added in-future.
>                          */
> -                       if ('a' <= isa[i] && isa[i] < 'x')
> -                               this_isa |= (1UL << (isa[i] - 'a'));
> +                       if (ext_err || ext_long)
> +                               continue;
> +                       this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> +                       this_isa |= (1UL << (*ext - 'a'));
>                 }
>
>                 /*
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
