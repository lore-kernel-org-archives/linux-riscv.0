Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D08C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 03:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNduzv+Gl3UAMIvPjV/E7eqdW4XWZ9yYPout124ZYDE=; b=QPpbGQr+Fm/xWT
	ffWaMvQu++1uTY1+F/WrRpTIcWXzaBwY6Rx3oG0aFtD35bo2lierfgxkz8hHAG6mQnQAIgFsc8TNd
	wQ9dMEKEuiGxPbw7jJfjJSzFMTwoVEjIFW9bDLKt4OxkIRJq4YxjLUzLAcj0CobB8k1qQdmAp4XJT
	xpAHW8ZI+ccO388Jp9eSyeM48EVUoJA2kXHbq1gPOY1rHjoutGYGZD3YAqiQJiP5Ni2lsBrI+Ud9L
	BWJ3DoYZQULISvyz+A587kdLrMpWrw04NsDZSqP0uDt0QIsfDlCu4TaIrnicXD1bxGFmgk7G/oLoo
	Nms+ueTYuYjTnk/k6lnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTxYY-007b2F-PA; Tue, 15 Mar 2022 03:09:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTxYV-007b1d-Ir
 for linux-riscv@lists.infradead.org; Tue, 15 Mar 2022 03:09:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso484821wms.1
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 20:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YlAUUoV15oIq0bfUkEEQvam2TX7UDNlQRyUb6o8Uzlc=;
 b=3D0/VuzRE5jVE1gU0WP/Oy/EhATOtCMCyTpruJzRr8ydYVT0gTX/boRnslD4WQy256
 pY16gkSplQ4WewRozBZ6bp3Rsh97puqjVxsahRK/RJKAWgQdH2Jper+1W6hIqF0sB4MV
 pYPh/XG4b9G6cwrtClJq0co3NTwj/1JolR5lihHLRvKUXUp74PAmn5SgCQ9YDFJFR31z
 WRsxDRbkQk3nn6V6nC1+rk/13pI48GkNP4cGiNOAV5i9FhsQXTL0Xix+GUQgBtLA8nnH
 tuux+3XqjRSlbwacu9iNpov5T3uRPFHY2j1uyz5AHHLunssgnHKYEYzhIu3E4OCDxHxc
 GkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YlAUUoV15oIq0bfUkEEQvam2TX7UDNlQRyUb6o8Uzlc=;
 b=7IE493t6/pnVumIVLgCBFcS2r2a/2NzReJXkwVccj7o3AiakAn+sahJzpuo4c88eGv
 SHb+/A9uyfS3g/9FsmKu+Qsi4OuxCVT0/2xsUqcS61GIMeuV9zi5UZ5bmGDegOTwshhK
 HlYuvGAh0WZiX2K9JW7PxYfMOld11ZW4O+WjaWlgkHDTCbEHh4MIomryYDYspEnv7lvr
 v/3jdXdepbt7V1z+YyrvN9UdhxwG3A6Hc2TuFPrLjU+7360SvvZ+LhUbYBhC8hhyr+Fb
 VlFclT6Y6ibvDV/BaCDDCEwPHEvY8SyzqwUnn3bZyef9u7NObGvLQEsmUVDFmD1J4/aw
 n3bw==
X-Gm-Message-State: AOAM531G6+BGZ96sN60KWN2iFYpnTtWIRe85wWCaLf7Pjck+tJXu+UbW
 Jo7gs5ctvg1n6RwK3Lb6IyrO81geDtYNp77V/osgTw==
X-Google-Smtp-Source: ABdhPJyCnZeApAQIeIu9ckLEshUmzpf0Q/365p7fKRUenQLTUKelNGht6AV1uZDc+vfVxlqgydvi7TWz1k4R/1KWIPg=
X-Received: by 2002:a05:600c:2c49:b0:384:7202:358e with SMTP id
 r9-20020a05600c2c4900b003847202358emr1556102wmg.108.1647313739201; Mon, 14
 Mar 2022 20:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220314203845.832648-1-atishp@rivosinc.com>
 <20220314203845.832648-3-atishp@rivosinc.com>
In-Reply-To: <20220314203845.832648-3-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Mar 2022 08:38:46 +0530
Message-ID: <CAAhSdy1Fw3Ykfkkxb-0S=Nmd=fGcQuK8yCRRGF2pTnMDRgCroQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] RISC-V: Minimal parser for "riscv, isa" strings
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
X-CRM114-CacheID: sfid-20220314_200903_724038_0BDA01A2 
X-CRM114-Status: GOOD (  28.64  )
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

On Tue, Mar 15, 2022 at 2:09 AM Atish Patra <atishp@rivosinc.com> wrote:
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

I think I have reviewed most of the patches in this series.

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
