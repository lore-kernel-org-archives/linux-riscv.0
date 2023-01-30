Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E0AC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYa53+TQSXNLR/pMM3vkA+M/RyT9ODWfNZPmlsRt8bA=; b=MQmqX3x0RdoDEF
	3giGWgEzIMOE+uvgCVSN2CkYCp7hN14LSaiMxsKZtQfHLaqyYd6kZJg//8j+6HgnbJSiycso8uORP
	S6ppvNHvS8elGhLsG3RUgjySk0BaXfmyecc3O77BmDiIcQp4NtFguwqrF+94rijdhvCuJn7vJ+miV
	pgmMV16rYereyJxQLOMlDic0JBMxR8Y4LlZdhcCuCYoQoN4S0SgCZepp2/xI3z7GxevCNyYbngTk+
	GOaJ0rr84Xfqy3qCVyGbioIS2pR07NBHTWXqwRHsIm8/A7Xkws6MGdcoQ1dwWJtCM2s6P8d07MRFW
	mDlIfZw6y0yJhGDWAITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRMb-0037Jc-6H; Mon, 30 Jan 2023 10:26:13 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRMX-0037It-Nu
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 10:26:11 +0000
Received: by mail-vs1-xe32.google.com with SMTP id 187so11890302vsv.10
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 02:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hkA2BouTWIVCEzpH5DcRnnowd4/KGZPNwQpLgLcVdKA=;
        b=dsAo/vucpHuDG1Mwa0G8j3ilAQNwY3m1tta+M0vGvx/GTNKmVH50gqVdBLxIeBPOPq
         hFH96VXrZBLuxu3YuiawFv2BI3lqYlu+amsyeOFX0zQEdlR8G0AAdfl1wzBzpnF0CQKn
         6zIBDRtKo83YrSBGyJaFYOJnsEXeFQXh6AZwiSwwCcp50y28W44VBAs0S6RLB4KHr7xk
         Uqc/El91EL3roODW2WhjBOTU6Nut5lYRXfN98X104c5IvEEgvTHhAWlW4hHBrEnwTEw/
         I4w9DMdjh3RCnlUpSfnFmoY2oPqaLeVwMySPkfKCB5Dbi1s9ahUM6FaJDrMJTdaIwqNx
         QZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkA2BouTWIVCEzpH5DcRnnowd4/KGZPNwQpLgLcVdKA=;
        b=CTU55R4VqtsJmF9e1E98lHzIlEkmEKCAemBuIRCd1zgqofYT1Wm/gu15PvCWw+V25K
         BpyKMtLrsF9q7hToBaE8BxZlcI0FCHuW1bHtyUoi4/X6w59ypXrzxE8twj0vTKsvraR2
         EQ2HaEQAM7W3Me0w7Up/CTBsjM2SqbhDltAYRnang5E8Y1weUvl9mEy1oYo4YYZIKEdD
         gwf/cyPiaI0aEiW60nP0ta89f09ABVMJRllbDulOpi+NRhCV/Wt2uIWRfYAB4j+monNb
         GQP3K78a3HSexRtJkNXb/3Vj5fCUNGs18S7O30mhUCEZQekwPalwmGvfuk0YlQYB55/r
         fvUA==
X-Gm-Message-State: AFqh2krn+OIs6RoI4buzZDiPG/vUKnUEmKIZAJafdkwUc9gerdjvI4dr
	vZJL3hQSrQyx2/Q9I2QDYK5r6wzkvREPIdBhe9o5IA==
X-Google-Smtp-Source: AMrXdXuyWpCLTJxLo7/2GNEnqxvt/FzdRd/eNPGS9NLCfnbdRZH/oxwCLQ9FP6DWIlTFGdyEN7z7ABxxwI8Ibp0qujE=
X-Received: by 2002:a05:6102:c16:b0:3d3:e027:877a with SMTP id
 x22-20020a0561020c1600b003d3e027877amr6824978vss.0.1675074366736; Mon, 30 Jan
 2023 02:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20230129064956.143664-1-tjytimi@163.com>
In-Reply-To: <20230129064956.143664-1-tjytimi@163.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 30 Jan 2023 15:55:55 +0530
Message-ID: <CAK9=C2VaxNezv+M=s=ZSA-YDf_17+hcom_z1=_j2YkRHg-yg7Q@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: support arch_has_hw_pte_young()
To: Jinyu Tang <tjytimi@163.com>
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	yuzhao@google.com, conor.dooley@microchip.com, ajones@ventanamicro.com, 
	guoren@kernel.org, tongtiangen@huawei.com, anup@brainfault.org, 
	akpm@linux-foundation.org, falcon@tinylab.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_022609_802599_30DDB80D 
X-CRM114-Status: GOOD (  21.87  )
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

On Sun, Jan 29, 2023 at 12:21 PM Jinyu Tang <tjytimi@163.com> wrote:
>
> The arch_has_hw_pte_young() is false for riscv by default. If it's
> false, page table walk is almost skipped for MGLRU reclaim. And it
> will also cause useless step in __wp_page_copy_user().
>
> RISC-V Privileged Book says that riscv have two schemes to manage A
> and D bit.
>
> So add a config for selecting, the default is true. For simple
> implementation riscv CPU which just generate page fault, unselect it.

I totally disagree with this approach.

Almost all existing RISC-V platforms don't have HW support
PTE.A and PTE.D updates.

We want the same kernel image to run HW with/without PTE.A
and PTE.D updates so kconfig based approach is not going to
fly.

>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> ---
>  arch/riscv/Kconfig               | 10 ++++++++++
>  arch/riscv/include/asm/pgtable.h |  7 +++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..17c82885549c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -180,6 +180,16 @@ config PAGE_OFFSET
>         default 0x80000000 if 64BIT && !MMU
>         default 0xff60000000000000 if 64BIT
>
> +config ARCH_HAS_HARDWARE_PTE_YOUNG
> +       bool "Hardware Set PTE Access Bit"
> +       default y
> +       help
> +         Select if hardware set A bit when PTE is accessed. The default is
> +         'Y', because most RISC-V CPU hardware can manage A and D bit.
> +         But RISC-V may have simple implementation that do not support
> +         hardware set A bit but only generate page fault, for that case just
> +         unselect it.
> +
>  config KASAN_SHADOW_OFFSET
>         hex
>         depends on KASAN_GENERIC
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 4eba9a98d0e3..1db54ab4e1ba 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -532,6 +532,13 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>          */
>         return ptep_test_and_clear_young(vma, address, ptep);
>  }
> +#ifdef CONFIG_ARCH_HAS_HARDWARE_PTE_YOUNG

> +#define arch_has_hw_pte_young arch_has_hw_pte_young
> +static inline bool arch_has_hw_pte_young(void)
> +{
> +       return true;

Drop the kconfig option ARCH_HAS_HARDWARE_PTE_YOUNG
and instead use code patching to return true only when Svadu
ISA extension is available in DT ISA string.


> +}
> +#endif
>
>  #define pgprot_noncached pgprot_noncached
>  static inline pgprot_t pgprot_noncached(pgprot_t _prot)
> --
> 2.30.2
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
