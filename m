Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FEBC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 00:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmdq7E2m0omk+EM9hDlDLt/2m60L7qXyMYoD4QIRP5I=; b=Ob888IGERgK0Z0
	oN53MEG0ShPsaq4A3jRqZhFfoCLLky8eb76sjB/HhXn5TsYl/LblM6hx+0Y1inr2Myoj9fIjWWwUL
	khsvc6cvJXy7CGCj7YAozdDoOfyDVSco3XPWL65kzOlHY14LKPQ3KZS+T1qBCgJ+lbGwLrWkQLdY1
	FvWzYJyEbR48/VSMTsPfviyTAmjBFgZK8vqEe8ELBXjFciJLIN4OfUhLgzFLBFsxe9lg+Oh3L7tzN
	zQFUxk1xpCr00GI53CjXZeeOwGCUbtfQyJbNKq7PUyJiXtRV+w0hzEfBXSC3hfFf2X8dpMZob0Pr8
	+TbQU0Wc0/G0NF2kAVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1zjl-00C6wx-7t; Mon, 05 Dec 2022 00:53:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1zji-00C6w7-EF; Mon, 05 Dec 2022 00:53:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03B8A60F30;
	Mon,  5 Dec 2022 00:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFA1C43146;
	Mon,  5 Dec 2022 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670201613;
	bh=uKde5+29l8ncvG91cU6r0ZrQtatORtfZHVXytTb/0fE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qzMXzXJ/jqBysDHQ/hneab3kW+bQgm2uiLQxoGxKiYCEBRpscd3jUivspDJAPZ4kI
	 gNp9WJermIKc8+6GykmTR/mEaJhywEVChibUdAbDMvfikzDb9j0QNdXVbbDdS/JMHm
	 yzJrVZvTe1qpvrQfM5hDKv2IVFM6kch7n9s7TYPOKiau8y455BojkiqsHHOE0ynKl7
	 V66cUrv0FZzJ4H/KnB+qvT2GlZW45qJxGCVPahNbnMB0NHvjP2prng2NgZKBdcHmbx
	 9FSyVRf0/SGCR+IfSR4X/oepbv8wkU/gzlOOgjSfgxoIeq8hcWreTCm6KZitaAmcPI
	 EPsg773yLsvJA==
Received: by mail-ej1-f43.google.com with SMTP id ml11so24218694ejb.6;
        Sun, 04 Dec 2022 16:53:33 -0800 (PST)
X-Gm-Message-State: ANoB5pnF+pUaMQ8S3Ym4R+MDsF0QHAGB89r9RbDnLOHAwZT5lU3P8kPk
	ymbX9LNAbJFVRqDIt6hLcyouveulidUOXFeyomk=
X-Google-Smtp-Source: AA0mqf6BG2tPXn9SFrbgZy5FN2ogDpC7EhVhLEAILkJPYunzSoJ4SIezBLYelQmT8FbzhTZ3xtMrFkEQLBjE/Lcec4Q=
X-Received: by 2002:a17:906:b213:b0:7c0:f7af:7c5e with SMTP id
 p19-20020a170906b21300b007c0f7af7c5emr1515004ejz.406.1670201611675; Sun, 04
 Dec 2022 16:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20221204174632.3677-1-jszhang@kernel.org> <20221204174632.3677-14-jszhang@kernel.org>
In-Reply-To: <20221204174632.3677-14-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 5 Dec 2022 08:53:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTn6UYpykLgq=ZcEd4PeFJeGfRBD9n28acZDxREBBErkg@mail.gmail.com>
Message-ID: <CAJF2gTTn6UYpykLgq=ZcEd4PeFJeGfRBD9n28acZDxREBBErkg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] riscv: remove riscv_isa_ext_keys[] array and
 related usage
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_165334_573843_69A2791B 
X-CRM114-Status: GOOD (  21.51  )
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

On Mon, Dec 5, 2022 at 1:57 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> All users have switched to riscv_has_extension_*, removed unused
> definitions, vars and related setting code.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/include/asm/hwcap.h | 30 ------------------------------
>  arch/riscv/kernel/cpufeature.c |  9 ---------
>  2 files changed, 39 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index e2d3f6df7701..be00a4337578 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -60,18 +60,6 @@ enum {
>
>  extern unsigned long elf_hwcap;
>
> -/*
> - * This enum represents the logical ID for each RISC-V ISA extension static
> - * keys. We can use static key to optimize code path if some ISA extensions
> - * are available.
> - */
> -enum riscv_isa_ext_key {
> -       RISCV_ISA_EXT_KEY_FPU,          /* For 'F' and 'D' */
> -       RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
> -       RISCV_ISA_EXT_KEY_SVINVAL,
> -       RISCV_ISA_EXT_KEY_MAX,
> -};
> -
>  struct riscv_isa_ext_data {
>         /* Name of the extension displayed to userspace via /proc/cpuinfo */
>         char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
> @@ -79,24 +67,6 @@ struct riscv_isa_ext_data {
>         unsigned int isa_ext_id;
>  };
>
> -extern struct static_key_false riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_MAX];
> -
> -static __always_inline int riscv_isa_ext2key(int num)
> -{
> -       switch (num) {
> -       case RISCV_ISA_EXT_f:
> -               return RISCV_ISA_EXT_KEY_FPU;
> -       case RISCV_ISA_EXT_d:
> -               return RISCV_ISA_EXT_KEY_FPU;
> -       case RISCV_ISA_EXT_ZIHINTPAUSE:
> -               return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
> -       case RISCV_ISA_EXT_SVINVAL:
> -               return RISCV_ISA_EXT_KEY_SVINVAL;
> -       default:
> -               return -EINVAL;
> -       }
> -}
> -
Reviewed-by: Guo Ren <guoren@kernel.org>

>  static __always_inline bool
>  riscv_has_extension_likely(const unsigned long ext)
>  {
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index adeac90b1d8e..3240a2915bf1 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -28,9 +28,6 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>
> -DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> -EXPORT_SYMBOL(riscv_isa_ext_keys);
> -
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -243,12 +240,6 @@ void __init riscv_fill_hwcap(void)
>                 if (elf_hwcap & BIT_MASK(i))
>                         print_str[j++] = (char)('a' + i);
>         pr_info("riscv: ELF capabilities %s\n", print_str);
> -
> -       for_each_set_bit(i, riscv_isa, RISCV_ISA_EXT_MAX) {
> -               j = riscv_isa_ext2key(i);
> -               if (j >= 0)
> -                       static_branch_enable(&riscv_isa_ext_keys[j]);
> -       }
Reviewed-by: Guo Ren <guoren@kernel.org>

>  }
>
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
