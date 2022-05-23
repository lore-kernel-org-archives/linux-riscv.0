Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E400C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 14:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tenYQcfsIQJ7os2pEBGcP0AG14qn5vKhIle3LHNLRg=; b=P94L8r7712GW9e
	Mydmib3Oc4GqzQa0EymYhkyJiw6rDPPvcYWu6Y99DJ5ewJ82A+KcQKm5IPKoCoe0En7jMNA6GLzcb
	YOKt9bs8j2ELTAG+Q2ozQ38gvXtKZt5wRJv5Ybbcor01weK+309I3mql066JTH1cza2GGS4kAApd6
	/oBM2oZhPJYv3cFIu30zknnwgwjNHtKFDJ1iN9yhKDioOOKYIy6bL+eeR+WidU3TIVB4T63ZYg7zh
	CfCIr7Clb1niFcs3zhdDuYFSlfsgcT3SBRVJ02+AGLp9Qk1p1KBKPnyw8hhLd3DUCLZU5WF3P/pYs
	elWSVqGDjXiEoHLgLvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9GN-004lY5-R4; Mon, 23 May 2022 14:42:27 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9GF-004lW9-7Y
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 14:42:20 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id i187so23554289ybg.6
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n4mxW9+NVwxMICOw3jO9PrjfCAz9jdp3jsvfj227EPg=;
 b=EF0GWx8UNYIYNstiWdAmmkdSzkdJYO99EBTTmNPqf1cB1FdvlufPxll84nE5B5/zkz
 bT3Bo38zrmJLcsYVkqfwEwSTOG8x+vi535RCGyzCXP+B8sLqVxi9RU+EdXfPzXhncodb
 K13fFKDMMgegVRT60+A69ITgSsQ8Wy8FkzviA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4mxW9+NVwxMICOw3jO9PrjfCAz9jdp3jsvfj227EPg=;
 b=KzXLHGVaW4yNXFUq1mOiYE2QDrndTgid17e4q4AzuNL2iNyHNPEhMK89DeKZ5S1Vqa
 rW7emYbDmtelnaW38j3jbANol3vYc87FYOpbNGsz7C7FltS87UquyyMZTIcYZn7y5x50
 fc4yUrXFrXrupS0xMHwrxHPm35Pj2eNkMkfe/SvyMHr2HUsAo2ibKOKlqL0InPJs/cal
 gFHTKc+GYD1HRWcqYRH/r7fI1fNDlv896LH6Lx8nMwRjD2WCtAavF+nd1pcuTyT+NXFk
 /5UxFfIc7NvB/VgHILjfstsnkFcAiIOe0Jv28NgVRzH3XIWXChULxc9U7LwvY4NC/Sqv
 0f7A==
X-Gm-Message-State: AOAM532Ok8T3B2I2HnjwvJLvQR0HQm44OGLyhv3LmUDJQy2dMNjaQtUg
 Sb2sso92gqHsJCZO/p3m3MkF3dPKBQ/FxaAjaVjk
X-Google-Smtp-Source: ABdhPJzPyzEnfurzkCwkKWDtQQF4jnYD50VKSEntRgx7xMi7Pjar3xLLr31w71++FsTvo2uChRIhtO6raAx2YYhcoEQ=
X-Received: by 2002:a25:be82:0:b0:64a:20f1:94fc with SMTP id
 i2-20020a25be82000000b0064a20f194fcmr20826851ybk.538.1653316936001; Mon, 23
 May 2022 07:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220522153543.2656-1-jszhang@kernel.org>
 <20220522153543.2656-2-jszhang@kernel.org>
In-Reply-To: <20220522153543.2656-2-jszhang@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 23 May 2022 07:42:04 -0700
Message-ID: <CAOnJCUJUBZ=G+nhoz06aNjSLsWQDcePnCSJiS4z4wg-ncY5cRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: introduce unified static key mechanism for
 ISA extensions
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_074219_308938_A57DFF3A 
X-CRM114-Status: GOOD (  28.79  )
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

On Sun, May 22, 2022 at 8:44 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Currently, riscv has several extensions which may not be supported on
> all riscv platforms, for example, FPU and so on. To support unified
> kernel Image style, we need to check whether the feature is supported
> or not. If the check sits at hot code path, then performance will be
> impacted a lot. static key can be used to solve the issue. In the past,
> FPU support has been converted to use static key mechanism. I believe
> we will have similar cases in the future.
>
> This patch tries to add an unified mechanism to use static keys for
> some ISA extensions by implementing an array of default-false static keys
> and enabling them when detected.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/hwcap.h | 25 +++++++++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c |  7 +++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 0734e42f74f2..d3e113fe7366 100644
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
> @@ -62,6 +73,20 @@ struct riscv_isa_ext_data {
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


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
