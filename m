Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C35C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNFYAoZYH+D6TY25iNkcxQHKFMuKqruywjDH7/2xtYo=; b=rGJkjIudT8cdSo
	77Eyl3XpdXwV+qbD3fJOPtN8lKcxzVVTZf9CY98Bt53eBHMoIppzpnfeLv4kPvufYZmbi4FqruVok
	+c7TbptlfY14Ak/leAT7KiSdJuKY/coQwqyINjgp6FvIjxg0Ax7uGwaenBBVfpVI3CI8ccJl1fBmq
	L1FhKZZGp57rQ1ZszXs16b678MjbXj3p8DIPZNr+vDnkivG4FLPpAevMRpceBnb318+qzEuETTM4T
	KqwY9ByezWWnNaYqHiDx14iUbaYVPB9GBCUVeaZLqejRpLC1i+E7dEHlbjeMQ+xQrOClCuxtAFQoo
	5rNaPCAJnALwENtbOwlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuKq-0024d5-Pp; Tue, 15 Feb 2022 09:41:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuKn-0024cS-M9
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:41:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id e3so31140822wra.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 01:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t1wflCr1vStMilehgvIe0w5v3TJPtXNP/omwaXqFnbs=;
 b=X2ztBi1BvP5dZxfZSWhpEp86yS7NH+aFVQUGt8uylxVUHrTPgLxljm/I823I20QDAC
 myDO9b6pKdhXfxOflamUH9a0V56xRHIzRt+zobHm2aSQI9lX2AtyVbvDJ4b/hbAVMJwj
 O9vb1GNkZY2UcPTCqfIbCX+8y2sqNQNjI5x14V4+FrxOupZqMwREoOU7tUaRNhVammTS
 15HBCcV5/vHuri9+ncnfWaytYpmQXGl85VY7/QOaHfZV4ygqrf/US1M/Trp4pBEdNttY
 GmI4NuNrS9A1UQGLBpSYyXFp+7ZES8mph1JTwI5jnuKmU+GSd5GjMsnzQcXxqbHmEldG
 KnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t1wflCr1vStMilehgvIe0w5v3TJPtXNP/omwaXqFnbs=;
 b=q6UUuuxEjicDS+zhfa/Uoqa21DQQzQRpz05/t/2F8nbK5r3//Shxoataj+0jdZ3v4i
 g88xLtNHt7FV9UAkMzw9Fu7leUVaI8Z0oR2/5jHngTvPr/7GU7qxZKCF0MU8Meky3D1z
 QDp1XuomVoJVoYpaGDpZ6K6StG/MO/xqY9H4i7olgDXfb+mqYCUzOyAnw/7XnQ1D6657
 bycdxKV0esgtgtVnzsEoYZswrHMQLCoWmpFp9KCQ1C1KPBq8BnwJ+KkycKkPceMNgEAZ
 fmW3FLiGbstYxOIt/U3u9yWHLcJ7QVSiwoickgMlk16V+vT/Z3N2g1fw/p803m0B31EF
 Ju/Q==
X-Gm-Message-State: AOAM533hiAsxYjtxI6pFaAh62qMG1lHMxPEH8zT9RULsbuzxUvPgmYvs
 dEcDty4CsO9sJmrdYbWNFtMqju5jdTUFUmXqBcBuCg==
X-Google-Smtp-Source: ABdhPJycaBm0tTnyxaAYB2jLzb26nfkOtUFXqf8v+zAItEOizp7OLUjLiobN4Bd6P0OekZnQ3wsTWbSu3Eh+8hJtkd0=
X-Received: by 2002:a5d:4209:: with SMTP id n9mr2515369wrq.86.1644918078895;
 Tue, 15 Feb 2022 01:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20220215090211.911366-1-atishp@rivosinc.com>
 <20220215090211.911366-2-atishp@rivosinc.com>
In-Reply-To: <20220215090211.911366-2-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Feb 2022 15:11:06 +0530
Message-ID: <CAAhSdy0+K+ADhO0oSoW7QUF582UvbaUbNPyAcBs5RMhUsm91Rw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] RISC-V: Correctly print supported extensions
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
X-CRM114-CacheID: sfid-20220215_014121_837758_0F814741 
X-CRM114-Status: GOOD (  19.56  )
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

On Tue, Feb 15, 2022 at 2:32 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> From: Tsukasa OI <research_trasio@irq.a4lg.com>
>
> This commit replaces BITS_PER_LONG with number of alphabet letters.
>
> Current ISA pretty-printing code expects extension 'a' (bit 0) through
> 'z' (bit 25).  Although bit 26 and higher is not currently used (thus never
> cause an issue in practice), it will be an annoying problem if we start to
> use those in the future.
>
> This commit disables printing high bits for now.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/cpufeature.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index d959d207a40d..dd3d57eb4eea 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -13,6 +13,8 @@
>  #include <asm/smp.h>
>  #include <asm/switch_to.h>
>
> +#define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> +
>  unsigned long elf_hwcap __read_mostly;
>
>  /* Host ISA bitmap */
> @@ -63,7 +65,7 @@ void __init riscv_fill_hwcap(void)
>  {
>         struct device_node *node;
>         const char *isa;
> -       char print_str[BITS_PER_LONG + 1];
> +       char print_str[NUM_ALPHA_EXTS + 1];
>         size_t i, j, isa_len;
>         static unsigned long isa2hwcap[256] = {0};
>
> @@ -133,13 +135,13 @@ void __init riscv_fill_hwcap(void)
>         }
>
>         memset(print_str, 0, sizeof(print_str));
> -       for (i = 0, j = 0; i < BITS_PER_LONG; i++)
> +       for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
>                 if (riscv_isa[0] & BIT_MASK(i))
>                         print_str[j++] = (char)('a' + i);
>         pr_info("riscv: ISA extensions %s\n", print_str);
>
>         memset(print_str, 0, sizeof(print_str));
> -       for (i = 0, j = 0; i < BITS_PER_LONG; i++)
> +       for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
>                 if (elf_hwcap & BIT_MASK(i))
>                         print_str[j++] = (char)('a' + i);
>         pr_info("riscv: ELF capabilities %s\n", print_str);
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
