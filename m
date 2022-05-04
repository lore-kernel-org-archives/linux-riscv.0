Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148F0C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 02:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKcbwcceeSeAHGPykFracAHWZ0CgrU3Ge5CZY/XRzTU=; b=xoaPgdMAUSKlpk
	y+YLUxVJWqG5ymSclMTiGVvYappZCOg0TVZp5KqIa+iHY2hkWsnfSrisf+L3n1pj6w4ILuEx41dWV
	BcbFQQOgh4c0yRGtKYi7zFpBYYIskrjj1K4j+qYfUqhcSpj/j+WY8Npuwdrejnrc9j+0j94+u5tJO
	QnMHUJ8CI5jm7beUbU1VPp/h3s0oqpijU3drzGKfivpLBHk0rYUMn7g/JDv0BnSwKUYnKY3IA1FBY
	78MR79DI1K4zJxDkPdcqPXO9QR2xQvDy7jMvsPfVO8EBryTij7c7MIyHT0RY5+kXKktBFy/BIW5qP
	Pcg2+DASoBTEDUbFjBiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm4Wy-008QH6-Mu; Wed, 04 May 2022 02:14:20 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm4Ww-008QGL-EZ
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 02:14:19 +0000
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f863469afbso2160537b3.0
 for <linux-riscv@lists.infradead.org>; Tue, 03 May 2022 19:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VHVfBZ+ZbG4jO46Y3xTAJPGI1FCH2/0sdEc6UgyZ1v8=;
 b=FAjHBA3DYZrjCcFJ6SRJYEfqXCfuaP++2tcA5MdxVcnYV4gcDkdMhPq+5V+nwRn/LB
 BPMK6R1GX5gCsG+Nlz2u1xpC+BwbzLmN1BsOC3quRE/uMcT3rOlEdtmyarUKmSP4Xf5U
 CNGi2Y+hFXf66WgcBSOmRixHtd49iCwN7waBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VHVfBZ+ZbG4jO46Y3xTAJPGI1FCH2/0sdEc6UgyZ1v8=;
 b=HWDOvB6j3uSo8S0dvtrSjd6mREG9HLx+4WqUjhGacDiUHW00T3DR7+HQUp0FLeoQ07
 MawJTleUrUKIUoJuA5+/tey9r37P0wC9UFkR2Huh1HRID/gQWpM5K6M6RvNrazwR+8p1
 zyHB1koiH37AtonRB5/K/zyoKPXqlMMSXIq8w1ps4SXzZgg5j85pGKLZhAz+6hKCdqVu
 WqFkmGKxnAAecgqTXp+oTOv/jMeBLsNRamOMsnGOct6qdHqsQYIPy7XnL7NYZEO9YmcX
 LWRbWSgqUg51R74e+Wj6opgqEpeD5Rkcf17WWhl0HwpN4XSbEDOpGmLdI9cbxeXwfH0A
 Ajkg==
X-Gm-Message-State: AOAM533hn7FBfUHQWbEvQzCXbuYMpYPCESzp52EgdUk6xvIak9xodORY
 O2RcJsZeSjsBHbpvPw7V78SZPLFleivl8HoBDVJy
X-Google-Smtp-Source: ABdhPJx28wVb5nvO0Q4bF9Y1heyPsITBVA6bFMutIrXSBzsNvCfUhWRbPdwTu3TgiqzvQ05aDm7AlJtEWBwikALsKOg=
X-Received: by 2002:a81:20c1:0:b0:2f8:5dcd:91d4 with SMTP id
 g184-20020a8120c1000000b002f85dcd91d4mr17984573ywg.443.1651630457801; Tue, 03
 May 2022 19:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112450.155624-1-apatel@ventanamicro.com>
 <20220420112450.155624-3-apatel@ventanamicro.com>
In-Reply-To: <20220420112450.155624-3-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 May 2022 19:14:07 -0700
Message-ID: <CAOnJCUJ3KzJdqLa3zXUd+YEa00_W1P7aNWY0ibpvO9jaqarOtA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] RISC-V: KVM: Add Sv57x4 mode support for G-stage
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_191418_535223_10109231 
X-CRM114-Status: GOOD (  17.63  )
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

On Wed, Apr 20, 2022 at 4:25 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Latest QEMU supports G-stage Sv57x4 mode so this patch extends KVM
> RISC-V G-stage handling to detect and use Sv57x4 mode when available.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h |  1 +
>  arch/riscv/kvm/main.c        |  3 +++
>  arch/riscv/kvm/mmu.c         | 11 ++++++++++-
>  3 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index e935f27b10fd..cc40521e438b 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -117,6 +117,7 @@
>  #define HGATP_MODE_SV32X4      _AC(1, UL)
>  #define HGATP_MODE_SV39X4      _AC(8, UL)
>  #define HGATP_MODE_SV48X4      _AC(9, UL)
> +#define HGATP_MODE_SV57X4      _AC(10, UL)
>
>  #define HGATP32_MODE_SHIFT     31
>  #define HGATP32_VMID_SHIFT     22
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index c374dad82eee..1549205fe5fe 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -105,6 +105,9 @@ int kvm_arch_init(void *opaque)
>         case HGATP_MODE_SV48X4:
>                 str = "Sv48x4";
>                 break;
> +       case HGATP_MODE_SV57X4:
> +               str = "Sv57x4";
> +               break;
>         default:
>                 return -ENODEV;
>         }
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index dc0520792e31..8823eb32dcde 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -751,14 +751,23 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
>  void kvm_riscv_gstage_mode_detect(void)
>  {
>  #ifdef CONFIG_64BIT
> +       /* Try Sv57x4 G-stage mode */
> +       csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
> +       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
> +               gstage_mode = (HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
> +               gstage_pgd_levels = 5;
> +               goto skip_sv48x4_test;
> +       }
> +
>         /* Try Sv48x4 G-stage mode */
>         csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
>         if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
>                 gstage_mode = (HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
>                 gstage_pgd_levels = 4;
>         }
> -       csr_write(CSR_HGATP, 0);
> +skip_sv48x4_test:
>
> +       csr_write(CSR_HGATP, 0);
>         __kvm_riscv_hfence_gvma_all();
>  #endif
>  }
> --
> 2.25.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
