Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1815C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 07:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaAGfQWC7k+WioJAVM3PCVijWSld8RLTJgWk/G3lRh4=; b=Ohu/mF+3F1P5wD
	vN7bOgXqe+/dCaiSBwSkNxOGzchmVHCzp3dkmwWYGVbyHE0DYEuC7xFneR2iiOcuGs4KwS+qD1yBU
	S4bSWPdJCnAqYwbOfq/lE4QIfVa2UqkTgEPLaMrVlClTWwAg57Wt+AyYZZSmWBDgESWAXpsvMvtE3
	CAinVXvtMGiRFwJtdypYP9uCxFDplmOuLLLM6LgHDchUeW3jNmObQMSOitjNHyXycF+8mKgxMukK0
	OiN76T5ieu76orS4uCSzHbkzw742DZu+lTPJUgAfukyiV1fKDwdGm4wp98LQT5Bk5xvn9TGuudZIt
	tUP/SsejWXUlEPzeravg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsg5g-000nse-FY; Sun, 22 May 2022 07:33:28 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsg5c-000nri-Ry
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 07:33:26 +0000
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2fedd26615cso120843087b3.7
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pesXPNx/Q+LkyGC2G6a4mEcdtswlqCibLEjGfoAcaaM=;
 b=l3n22jSViyQmkbqULtIU4toqqsIvYxj0DLnbM8qlKeL6z1o6AccdaQxqVdVjpYIoPb
 efyRW+UCEO6INY+5411QwiXx9DMSPB3pZoIe9jRh21F0KplJmkH25JBRfGIqQxZdbIVO
 mzln7BBnH/6RScZN044BXG9xa47vYazntURco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pesXPNx/Q+LkyGC2G6a4mEcdtswlqCibLEjGfoAcaaM=;
 b=f0W8dDOieJESiah40qcRhggf47OndV+NFvlTFQW9jiA4benBE2l1osNxXsI/xmn1Z7
 W1djlOinQ1F4GZN9EnvdSrJFTh8QIj3Tyz9Sb9NZ4ESt0n0sp5WhTOXhW2IF4TqUD+HA
 iX0Xcb7dkcNefeAAfWhb7gOaISOf4YFWQpL1x1uIggAF28Da5jJeTPYN64My4hK1exmL
 BOzc+dycf0buhSlHSvQdh6UTrULRyrhVF5n4fKG8v1/O8DKrL+8RORk8xesIvNQFs2fI
 +KUZ8BZfKT4wJjLaXzkgg9aOK4sV0zdp7nDpdNl/mhw8cgSLB6Bdw2fg1kbCZvprzqnw
 jh7A==
X-Gm-Message-State: AOAM531F5vbzf6GL0XvLgYjxichEbQoCrqcXVQY0CBJ3PAr9n2m26HLC
 /GAxsvQVnIZWBM8umxdAIATzJvDamG1yHItPyOw2NmB5ecOb
X-Google-Smtp-Source: ABdhPJwY0E/JZfP4w+tD03WSMJ6az9j2LZ2XB9LZ01T8gUgkeoRVtV0LCPF4jvGjdMy/bYam1s6yGNYwM9HYX0zN0Bk=
X-Received: by 2002:a0d:e88c:0:b0:2fe:da96:1b77 with SMTP id
 r134-20020a0de88c000000b002feda961b77mr17730906ywe.262.1653204802756; Sun, 22
 May 2022 00:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220517184453.3558-1-jszhang@kernel.org>
 <20220517184453.3558-2-jszhang@kernel.org>
In-Reply-To: <20220517184453.3558-2-jszhang@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 22 May 2022 00:33:12 -0700
Message-ID: <CAOnJCU+aRoLRUjbum3o8N8J63vW+Y2974TjBueE__7PQAeJCQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: introduce unified static key mechanism for ISA
 extensions
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_003325_164285_A1E9BB92 
X-CRM114-Status: GOOD (  28.96  )
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

On Tue, May 17, 2022 at 11:53 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Currently, riscv has several extensions which may not be supported on
> all riscv platforms, for example, FPU and so on. To support unified
> kernel Image style, we need to check whether the feature is supported

/s/suportted/supported


> or not. If the check sits at hot code path, then performance will be
> impacted a lot. static key can be used to solve the issue. In the past
> FPU support has been converted to use static key mechanism. I believe
> we will have similar cases in the future.
>
> this patch tries to add an unified mechanism to use static keys for
> some ISA extensions by implementing an array of default-false static keys
> and enabling them when detected.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/hwcap.h | 40 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c |  7 ++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 0734e42f74f2..b0433d2b880d 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -12,6 +12,7 @@
>  #include <uapi/asm/hwcap.h>
>
>  #ifndef __ASSEMBLY__
> +#include <linux/jump_label.h>
>  /*
>   * This yields a mask that user programs can use to figure out what
>   * instruction set this cpu supports.
> @@ -55,6 +56,16 @@ enum riscv_isa_ext_id {
>         RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
>
> +/*
> + * This enum represents the logical ID for each RISC-V ISA extension static
> + * keys. We can use static key to optimize code path if some ISA extensions
> + * are available.
> + */
> +enum riscv_isa_ext_key {
> +       RISCV_ISA_EXT_KEY_FPU,          /* For 'F' and 'D' */
> +       RISCV_ISA_EXT_KEY_MAX,
> +};
> +
>  struct riscv_isa_ext_data {
>         /* Name of the extension displayed to userspace via /proc/cpuinfo */
>         char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
> @@ -62,6 +73,35 @@ struct riscv_isa_ext_data {
>         unsigned int isa_ext_id;
>  };
>
> +extern struct static_key_false riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_MAX];
> +
> +static __always_inline int riscv_isa_ext2key(int num)
> +{
> +       switch (num) {
> +       case RISCV_ISA_EXT_f:
> +               return RISCV_ISA_EXT_KEY_FPU;
> +       case RISCV_ISA_EXT_d:
> +               return RISCV_ISA_EXT_KEY_FPU;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +/*
> + * @num must be a compile-time constant.
> + */
> +static __always_inline bool riscv_isa_have_key_extension(int num)
> +{
> +       if (RISCV_ISA_EXT_ID_MAX <= num)
> +               return false;
> +
> +       num = riscv_isa_ext2key(num);
 > +       if (RISCV_ISA_EXT_KEY_MAX <= num || num < 0)
> +               return false;
> +

Why do you need the additional check in the hot path ?
riscv_isa_ext_keys array can be directly accessed at the caller
instead of calling this function.

> +       return static_branch_likely(&riscv_isa_ext_keys[num]);
> +}
> +



>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>
>  #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1b2d42d7f589..89f886b35357 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -24,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>  #ifdef CONFIG_FPU
>  __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
>  #endif
> +__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> +EXPORT_SYMBOL(riscv_isa_ext_keys);
>
>  /**
>   * riscv_isa_extension_base() - Get base extension word
> @@ -232,6 +234,11 @@ void __init riscv_fill_hwcap(void)
>                         print_str[j++] = (char)('a' + i);
>         pr_info("riscv: ELF capabilities %s\n", print_str);
>
> +       for_each_set_bit(i, riscv_isa, RISCV_ISA_EXT_MAX) {
> +               j = riscv_isa_ext2key(i);
> +               if (j >= 0)
> +                       static_branch_enable(&riscv_isa_ext_keys[j]);
> +       }
>  #ifdef CONFIG_FPU
>         if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
>                 static_branch_enable(&cpu_hwcap_fpu);
> --
> 2.34.1
>


--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
