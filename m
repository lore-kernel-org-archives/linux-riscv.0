Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AD0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 05:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8pNJ5UUCv24vwkoXKVOU+GbNpIsq5SHVLfW8+V8Aso=; b=cXY3NEutgtLY43
	EdorMtnRgs0MscTpkeeWaFRoBwHU4foTuo/l+BYCn9GWy9TUyc3B5gK6cQ+8TNik92G+FFOktt+/w
	JyGAk/LoHZ22pzkMkYjA1qZVymU7LXbWm22jK+uGw+X6pSsKB76vnqgGWxfrMlJPdbXRd1hzLuDjv
	5GXq0bquDxW3PrUv83ZPHNrYpXfGQPr+tu33pr/QY2bywlaPDoxXTRYXzqA78CmGeQtP79/xdOUFC
	ITT2RVtS0PWiODaZNC6iADUlJxDIBk3IPwEuRH78uqrjlgwBA76v51cW0CdCnUuXGKcDrNMv0ZmrW
	oRrZyh/3yE47R80OAbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi7Se-003IEH-0p; Tue, 11 Oct 2022 05:05:48 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi7Sb-003IDc-3R
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 05:05:46 +0000
Received: by mail-lf1-x136.google.com with SMTP id bu25so19441652lfb.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Oct 2022 22:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t2TApjEaLgM7a4Tuh//qBecyKOaKMXyWhnDNfjZE3aQ=;
        b=oycwiADtfldcyNrB28l99eBQ+TfDT4HKPO9QOv+xM74oqeM/9OZZ7jxbeU4dGlY57g
         CDlpGc707MeMPfJbxP+AIvu2rC13X0HL6Cgedj4JIfgz92ouW1QnSgKrB+zUnByMMsiV
         PQFst7bgBrYNG0/DcrQEO6iKgVu7dAa7EYnk5kScqzagrNKTlmUlsjdR5L3G24vrMu4P
         kkYsmwLbk6A9DKTJ5jvbYrMYKSxhqV9aBQAugWQa0Nzn28KhGvo3OnOckmqY7StYCBvt
         xOWIseLF20f/2PVneCRBwK4bx7ct4oQ/T6B3BPqPl8hmz6bmrpBxS9VX9xK0R86gopuS
         JRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2TApjEaLgM7a4Tuh//qBecyKOaKMXyWhnDNfjZE3aQ=;
        b=dhoX4J106eF11sSK1CQxe3m6upUYnqjk/byV6V6fbpMGETBotRwp+8k7oOTyCr9byC
         ypE5T41wrFnTTGIEoBLM7X6R7H6WRV4DaDggIOn8X8ghBLy2h8Ob58IqCYsptOhTk2lJ
         ib93d6KqbGrdXhYgprb7TW45qVqlfW6giWkg1ncOnV9z2T+AZrGVevdw9qhtXzqTbKXo
         HqcNkl9DVjh7rKLbHOhunfQUgSY4pztsIqZGu6ROoBQtPo7BcIAKe2vfVtEB184gzFey
         KwCd63ZAoBbpYlpdFtkugVsHb2ti/5IGHl1+mVRgKzqFDfG5gzzChST+ryVs4jn2nVGy
         u8zA==
X-Gm-Message-State: ACrzQf3c9gZlRNtwUdGgUUa8YlzWC/s+G5kt0eZQ38ptFwOv9wCZ/W4B
	NYMNbr5y6X6NwQpqhf5+tg/scd2CHzqslWxnpl1dzA==
X-Google-Smtp-Source: AMsMyM6AP01T+LwJlGX1MIfT2peb65DpmZbv33aH6XKgQOtnXgxeFq0NR8crV45AqrXvJ7HgiAqOBheoM9n04ZIOf5Y=
X-Received: by 2002:a05:6512:2821:b0:4a1:e97e:5025 with SMTP id
 cf33-20020a056512282100b004a1e97e5025mr7581257lfb.41.1665464742776; Mon, 10
 Oct 2022 22:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221010094029.1579672-1-ajones@ventanamicro.com> <mhng-62a2d3c7-f08d-4f40-862c-4d4f09a6150a@palmer-ri-x1c9>
In-Reply-To: <mhng-62a2d3c7-f08d-4f40-862c-4d4f09a6150a@palmer-ri-x1c9>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 11 Oct 2022 10:35:31 +0530
Message-ID: <CAK9=C2VZW6f7jq_27b0b4TD2vC0V5MLmaGBaPeq8NG-i686bbg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ajones@ventanamicro.com, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org, 
	conor.dooley@microchip.com, vernon2gm@gmail.com, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_220545_170994_A01198BE 
X-CRM114-Status: GOOD (  24.28  )
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

On Tue, Oct 11, 2022 at 12:06 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 10 Oct 2022 02:40:29 PDT (-0700), ajones@ventanamicro.com wrote:
> > Fix undefined reference of riscv_cbom_block_size when compiling KVM
> > without RISCV_ISA_ZICBOM. Note, RISCV_ISA_ZICBOM is a sufficient
> > guard as it selects RISCV_DMA_NONCOHERENT, which is needed to compile
> > dma-noncoherent.c (which is the file where riscv_cbom_block_size and
> > its initializer live).
> >
> > Fixes: afd5dde9a186 ("RISC-V: KVM: Provide UAPI for Zicbom block size")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kvm/vcpu.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index a032c4f0d600..e4453caba728 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -265,11 +265,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
> >       case KVM_REG_RISCV_CONFIG_REG(isa):
> >               reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
> >               break;
> > +#ifdef CONFIG_RISCV_ISA_ZICBOM
> >       case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> >               if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
> >                       return -EINVAL;
> >               reg_val = riscv_cbom_block_size;
> >               break;
> > +#endif
> >       default:
> >               return -EINVAL;
> >       }
>
> Thanks, looks like this is tripping up the kernelci builds too:
> https://linux.kernelci.org/build/id/6343b37c6fd2dcbb5dcab5f3/logs/ .
> This symbol is actually a bit odd, as we don't actually just use it
> under Zicbom because of the T-Head stuff.  Looks like that's generically
> broken, though, so IMO we need something like this
>
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..fba86fa3a628 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -5,6 +5,9 @@
>
>  #include <asm/cacheflush.h>
>
> +unsigned int riscv_cbom_block_size;
> +EXPORT_SYMBOL(riscv_cbom_block_size);
> +
>  #ifdef CONFIG_SMP
>
>  #include <asm/sbi.h>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index e3f9bdf47c5f..33d21ace0971 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -12,7 +12,6 @@
>  #include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>
> -unsigned int riscv_cbom_block_size;
>  static bool noncoherent_supported;
>
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>
> which should be
>
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing").

I agree with your change.

May be also move riscv_init_cbom_blocksize() to
arch/riscv/mm/cacheflush.c ?

>
> We might also want the ifdef for KVM, as that would allow us to build KVM that
> doesn't support these VCPU configurations, but that's sort of a different
> question.

Yes, I will be sending a PR including the KVM fix this week itself.

>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
