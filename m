Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39863C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6z2PlXpe4tbugiiIzMwWaisAAXqsrq8A5zq3ZtQSzI=; b=LaYqlanCUEDESo
	wun/T7vPKv2JbEQk9RZd+IwiIokwKvpbTlzbGcopTAUXA+voc5Q8s6gaUZdOGjPIZUvWm1rTcQc+X
	ZDyWwxQ2mP5PsTdDGi/9wwY+cTOYaRiJNNBY6QUZgh3/6/UZT8POjSnJFtL1USB5jZ9Y0HOs/zwLr
	JoJinlHDVOgqYTRlKlLhSsEv0s9ovaLVdGEbgS55oO2HUpU4j64vlzkQFWFFJm2+YFu9XbD9VNOKT
	CW/AM4oEhGBybLwaimaxWXe2INa1JTh+tcN6PmFm9PRT0b219pkFsUwq+wYWxPTpC9S/DbidDXmbA
	hJ8GC7ZvifkqGzDulk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntSfV-007npQ-Bo; Tue, 24 May 2022 11:25:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntSfS-007nnA-F1
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 11:25:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id u27so24425906wru.8
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 04:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IrQKUMgGfJCg4Qp/wyG56UieXV8r90cWTrXiOz7LDck=;
 b=Gy4q7CN99HFyXAicqG9X11IlQ+svRqwnN8b26/bIiFUYInmpSeZdUBS3liSbUIVsla
 wWqnBTLpRQPJXp79wdo0TnrKGBjeXoH4SAS6hOlROajnfLUnMxqS9d1aBvJMrZpmBlmU
 3w5uSFppAXGa1yK8Vd3H9oCbvZcA3UMQD1EBvSxo0HYq1UPQ92+AbDrlGLPE8klvrRTs
 D0PRsfDlXTkRrjxnorF72umS/EPsYzL5y1oK0SJLDG+nwR3peuR7Rzkpfm12leFAYxpX
 clNf3Yy0i28wX0quPqA3glr021cdnZGGrEnVORu8zgPSuMm/hbUSHkuiQJqq1MJNgfSh
 1N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IrQKUMgGfJCg4Qp/wyG56UieXV8r90cWTrXiOz7LDck=;
 b=ly4nm7klvSKcop2jRQ3mkK6oohG4vtJoTi8+s7avtdXtaVAqWtN6m4wunkcbjJQ2wy
 lKekb8A3WHXAM7xtjjoUgg73h+7p2Kb7yEKzW/8eNtmdsDZURNt+kTFMgJMM6IsL+mWV
 CouHN1IZRteHMI+7Fl/3cU9e0AOY2KYI0zRWGKGQaeX9VUnkoaSvvadvHjqEVqnTkyzt
 wQiRSzr88D3GSp7prmRzIRMZPKLxNdXCD+IUsqfvqbOI5ZUP0TyIoxXyyLzdx7AOUSan
 EdNEOeVaTFiuU2/o70qNq71q6+o1xmQp57EK1PRSKeus08GolIu8ZtwYWoMlppwsENh3
 1v+A==
X-Gm-Message-State: AOAM5328Uhwsd7nRpSwRYG546N6h0llzCGNTtUCibYP0s50xObeMyA8l
 sETTHIfYC4GPOL2EvC0JkSRysemNypqgccLwXAyDuQ==
X-Google-Smtp-Source: ABdhPJxSztbMN+n2TmP0z6nr9DurWwl3+BCxash8ct2jbn4OvYv+CLh96rMCl3y/TYL6GZCHByl5uXayneQiJM2qHqo=
X-Received: by 2002:a05:6000:1f18:b0:20f:e61b:520e with SMTP id
 bv24-20020a0560001f1800b0020fe61b520emr6372906wrb.214.1653391534839; Tue, 24
 May 2022 04:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220426185245.281182-1-atishp@rivosinc.com>
 <20220426185245.281182-3-atishp@rivosinc.com>
In-Reply-To: <20220426185245.281182-3-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 May 2022 16:55:23 +0530
Message-ID: <CAAhSdy1utVaeMBUYKRQeEPtXxD5gXAs3WCacoXYm9fmHx5yyVA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] RISC-V: Enable sstc extension parsing from DT
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, DTML <devicetree@vger.kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 KVM General <kvm@vger.kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_042538_530886_A02001D8 
X-CRM114-Status: GOOD (  15.77  )
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

On Wed, Apr 27, 2022 at 12:23 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The ISA extension framework now allows parsing any multi-letter
> ISA extension.
>
> Enable that for sstc extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpu.c        | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 0734e42f74f2..25915eb60d61 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -52,6 +52,7 @@ extern unsigned long elf_hwcap;
>   */
>  enum riscv_isa_ext_id {
>         RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> +       RISCV_ISA_EXT_SSTC,
>         RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index ccb617791e56..ca0e4c0db17e 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -88,6 +88,7 @@ int riscv_of_parent_hartid(struct device_node *node)
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
>         __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> +       __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>         __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1b2d42d7f589..a214537c22f1 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -192,6 +192,7 @@ void __init riscv_fill_hwcap(void)
>                                 set_bit(*ext - 'a', this_isa);
>                         } else {
>                                 SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> +                               SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>                         }
>  #undef SET_ISA_EXT_MAP
>                 }
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
