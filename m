Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9025C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=waZAALqD3QpCnyUGkLuFkJEW8iaMN2SWNacWtK9NU3k=; b=IcCH0An5zbTKK6
	Hx3TqrqFesRR/Kgmv7rZ0Ay8LHVitbUd2gDZSBWhnETPb3yh/eFXg9SNN44360/EfRSA4DHOm5w9r
	SJqJVk5X8au8pzhdnMkdOyHlg9yxO3YwciaEBhcV8FdgpLN3YsKq+T5mrFUDsEtBqUShH6b4sOSrT
	jbdHmqv/XlXXfyyvXK3WPiQG4titoJlT266qsGd7o2CZ/fvwqkp2jlo6aXQT7p2GeC+aOvRY0Lm95
	tAtssA0jh7Bvti7tsD01BU7j0B6vefMYX8LarZZLllKqnsfzaQibaHjynvn/GyroBsI85fAwxWED6
	65aaOGGPGixEzdRfK5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmqf-006xpo-1g; Tue, 31 Jan 2023 09:22:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmqa-006xnp-PF
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 09:22:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id h9so5846470plf.9
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 01:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+UEl9RpJ5/r5T0BjzaMIIiVb97mqpj9qTAKyDrcDn1s=;
        b=IEJRkQls5Sti1k2gmcAzYSguZdHLWZyZoBmugS2+PQ16+tGc1p4rhb9kpRpQQmWlBs
         T2yIvj5nh+wjzWdV/ABezn4jzdeZeHnZMQotFwagHbnm7qCwlgJxCyH4g+C4M7qspptB
         ivcISSK/fr8CsHnU/MRn7cnzj36nZAOagMdyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UEl9RpJ5/r5T0BjzaMIIiVb97mqpj9qTAKyDrcDn1s=;
        b=jkmPlRQMmqK6AzBVZb7WY+PjptuonwO7U8NSZpZYnkDzivBNxB2tauPEaz2L+nR9yz
         SKdvIGh5PmzRuNDsMkYuA7TuOnAKmU/cHhE8Hv3sZPIYlTO0HHeUFqAzoS2CeSky0yCf
         NY3FLtFKhMFLGbbduBbr0dg/AuDxDQe94Rh+NBR9RS2a53T37Uj0Qh5Rc7a8E85KZ7oQ
         3TmJt4bEIFceMEc58AC4z1vNRntc7nmItoaNVm494YEixwRphRwwl8YK3A/jwSZUeyU0
         HN5lc3biTKGyd2F/BguBdwhClJB4GAptrkM6nTpxWIhtoLehIvSZPGHKDyCJbPPAtBtS
         yvww==
X-Gm-Message-State: AO0yUKVlh68LRji9xu2qhuknTMQsuxEaoBhGSlXBjNpn4MGhVBOIH0Kz
	ZVEcu3FhR1YLZmMxTVfSGizmdx7L3CC6E6zmt5uQ
X-Google-Smtp-Source: AK7set9Z0iLiZ4sURdAqhKBWdj0u+01Lupue+Lq9cv6c/O6SyZKRw2Y58r0+sqn+RShz/fRqAf6m916jGZYPaOiju58=
X-Received: by 2002:a17:902:b706:b0:196:6dac:3426 with SMTP id
 d6-20020a170902b70600b001966dac3426mr1508273pls.23.1675156954396; Tue, 31 Jan
 2023 01:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20230128072737.2995881-1-apatel@ventanamicro.com> <20230128072737.2995881-2-apatel@ventanamicro.com>
In-Reply-To: <20230128072737.2995881-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 31 Jan 2023 01:22:23 -0800
Message-ID: <CAOnJCU+HKqVWz+SaFj=G-Rim-91h5uimTk0FCHa_mUX-gtxbbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] RISC-V: Add AIA related CSR defines
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_012236_863441_29699FDF 
X-CRM114-Status: GOOD (  14.68  )
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

On Fri, Jan 27, 2023 at 11:27 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The RISC-V AIA specification improves handling per-HART local interrupts
> in a backward compatible manner. This patch adds defines for new RISC-V
> AIA CSRs.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h | 95 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 94 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 0e571f6483d9..3c8d68152bce 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -7,7 +7,7 @@
>  #define _ASM_RISCV_CSR_H
>
>  #include <asm/asm.h>
> -#include <linux/const.h>
> +#include <linux/bits.h>
>
>  /* Status register flags */
>  #define SR_SIE         _AC(0x00000002, UL) /* Supervisor Interrupt Enable */
> @@ -73,7 +73,10 @@
>  #define IRQ_S_EXT              9
>  #define IRQ_VS_EXT             10
>  #define IRQ_M_EXT              11
> +#define IRQ_S_GEXT             12
>  #define IRQ_PMU_OVF            13
> +#define IRQ_LOCAL_MAX          (IRQ_PMU_OVF + 1)
> +#define IRQ_LOCAL_MASK         GENMASK((IRQ_LOCAL_MAX - 1), 0)
>
>  /* Exception causes */
>  #define EXC_INST_MISALIGNED    0
> @@ -156,6 +159,27 @@
>                                  (_AC(1, UL) << IRQ_S_TIMER) | \
>                                  (_AC(1, UL) << IRQ_S_EXT))
>
> +/* AIA CSR bits */
> +#define TOPI_IID_SHIFT         16
> +#define TOPI_IID_MASK          GENMASK(11, 0)
> +#define TOPI_IPRIO_MASK                GENMASK(7, 0)
> +#define TOPI_IPRIO_BITS                8
> +
> +#define TOPEI_ID_SHIFT         16
> +#define TOPEI_ID_MASK          GENMASK(10, 0)
> +#define TOPEI_PRIO_MASK                GENMASK(10, 0)
> +
> +#define ISELECT_IPRIO0         0x30
> +#define ISELECT_IPRIO15                0x3f
> +#define ISELECT_MASK           GENMASK(8, 0)
> +
> +#define HVICTL_VTI             BIT(30)
> +#define HVICTL_IID             GENMASK(27, 16)
> +#define HVICTL_IID_SHIFT       16
> +#define HVICTL_DPR             BIT(9)
> +#define HVICTL_IPRIOM          BIT(8)
> +#define HVICTL_IPRIO           GENMASK(7, 0)
> +
>  /* xENVCFG flags */
>  #define ENVCFG_STCE                    (_AC(1, ULL) << 63)
>  #define ENVCFG_PBMTE                   (_AC(1, ULL) << 62)
> @@ -250,6 +274,18 @@
>  #define CSR_STIMECMP           0x14D
>  #define CSR_STIMECMPH          0x15D
>
> +/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
> +#define CSR_SISELECT           0x150
> +#define CSR_SIREG              0x151
> +
> +/* Supervisor-Level Interrupts (AIA) */
> +#define CSR_STOPEI             0x15c
> +#define CSR_STOPI              0xdb0
> +
> +/* Supervisor-Level High-Half CSRs (AIA) */
> +#define CSR_SIEH               0x114
> +#define CSR_SIPH               0x154
> +
>  #define CSR_VSSTATUS           0x200
>  #define CSR_VSIE               0x204
>  #define CSR_VSTVEC             0x205
> @@ -279,8 +315,32 @@
>  #define CSR_HGATP              0x680
>  #define CSR_HGEIP              0xe12
>
> +/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> +#define CSR_HVIEN              0x608
> +#define CSR_HVICTL             0x609
> +#define CSR_HVIPRIO1           0x646
> +#define CSR_HVIPRIO2           0x647
> +
> +/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
> +#define CSR_VSISELECT          0x250
> +#define CSR_VSIREG             0x251
> +
> +/* VS-Level Interrupts (H-extension with AIA) */
> +#define CSR_VSTOPEI            0x25c
> +#define CSR_VSTOPI             0xeb0
> +
> +/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
> +#define CSR_HIDELEGH           0x613
> +#define CSR_HVIENH             0x618
> +#define CSR_HVIPH              0x655
> +#define CSR_HVIPRIO1H          0x656
> +#define CSR_HVIPRIO2H          0x657
> +#define CSR_VSIEH              0x214
> +#define CSR_VSIPH              0x254
> +
>  #define CSR_MSTATUS            0x300
>  #define CSR_MISA               0x301
> +#define CSR_MIDELEG            0x303
>  #define CSR_MIE                        0x304
>  #define CSR_MTVEC              0x305
>  #define CSR_MENVCFG            0x30a
> @@ -297,6 +357,25 @@
>  #define CSR_MIMPID             0xf13
>  #define CSR_MHARTID            0xf14
>
> +/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
> +#define CSR_MISELECT           0x350
> +#define CSR_MIREG              0x351
> +
> +/* Machine-Level Interrupts (AIA) */
> +#define CSR_MTOPEI             0x35c
> +#define CSR_MTOPI              0xfb0
> +
> +/* Virtual Interrupts for Supervisor Level (AIA) */
> +#define CSR_MVIEN              0x308
> +#define CSR_MVIP               0x309
> +
> +/* Machine-Level High-Half CSRs (AIA) */
> +#define CSR_MIDELEGH           0x313
> +#define CSR_MIEH               0x314
> +#define CSR_MVIENH             0x318
> +#define CSR_MVIPH              0x319
> +#define CSR_MIPH               0x354
> +
>  #ifdef CONFIG_RISCV_M_MODE
>  # define CSR_STATUS    CSR_MSTATUS
>  # define CSR_IE                CSR_MIE
> @@ -307,6 +386,13 @@
>  # define CSR_TVAL      CSR_MTVAL
>  # define CSR_IP                CSR_MIP
>
> +# define CSR_IEH               CSR_MIEH
> +# define CSR_ISELECT   CSR_MISELECT
> +# define CSR_IREG      CSR_MIREG
> +# define CSR_IPH               CSR_MIPH
> +# define CSR_TOPEI     CSR_MTOPEI
> +# define CSR_TOPI      CSR_MTOPI
> +
>  # define SR_IE         SR_MIE
>  # define SR_PIE                SR_MPIE
>  # define SR_PP         SR_MPP
> @@ -324,6 +410,13 @@
>  # define CSR_TVAL      CSR_STVAL
>  # define CSR_IP                CSR_SIP
>
> +# define CSR_IEH               CSR_SIEH
> +# define CSR_ISELECT   CSR_SISELECT
> +# define CSR_IREG      CSR_SIREG
> +# define CSR_IPH               CSR_SIPH
> +# define CSR_TOPEI     CSR_STOPEI
> +# define CSR_TOPI      CSR_STOPI
> +
>  # define SR_IE         SR_SIE
>  # define SR_PIE                SR_SPIE
>  # define SR_PP         SR_SPP
> --
> 2.34.1
>

LGTM.

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
