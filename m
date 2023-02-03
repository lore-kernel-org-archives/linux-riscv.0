Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8C9C636D6
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 00:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Jhq3K1B33G3NI2sB1ivvgMIRQ22aYTMf13zJuK4XEAk=; b=I2istxFQg8nS6jY0L0LsJtdq1w
	ER1+KE6RqF0IEa4KjODFJL59io5rHZ2DYAoBZ5lMVMuskAFAeEQMIyIuykrepJgkeyiQD6T4utuDJ
	A0w1Q7rplcLSRaANUYI9idd2qFFHa9t/i1i6KO+Xs1ovCvz/8832fEkeR05gxAkcTnKmRlYlLMZy1
	XV305/z84elc/Gub9fgnbhzzHye1kD/Thcs02AHJei1/Sd83/y9OAMT55c7Z2thUoY0ET0fY2lv0M
	XajMhQDauqj6XO1mnfKDFeIWFZbvhYr78fezOTRSPMAewLMZIT7eLGYT5f3LOzU0PAF/E5UbStft1
	2ilLTNmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjsk-00HVGX-Eq; Fri, 03 Feb 2023 00:24:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjsg-00HVEu-NG
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 00:24:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id be8so3658785plb.7
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 16:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hg6i68J4TobeoqlekmsngWftuTPTv+G6KXcOdLK3leg=;
        b=trvbCnrSg+4Hjwt0pDcD/npkOjyXxWK0/F7hfrJwRn1wuEcAww+eNLkeb9AyGp52Zy
         AK2x9UaBaxdID1/Xwzbx5A31+3dLIc/bCDtZhReDGRo+Go4mYXJz1Aa/aK3tzRy/0MoW
         CvM9RrIYk+Rz7D9V7Y5lF+p4X0wf10UD9dJlbTf7Ajr8mpo7CKVnIYHI4v3InlP+6PrP
         znWLEEvkmrn7ADHeB6QNn9FP4BZPC4ilktk6xsGuHqHr73U4OiG5ebrMHCaRVIUERzyg
         B637XrrylYMl0ZMrcoJhs1CcQO5NYoJWJXD99fwMh/gr7CoAPj08hWNtECEMfqjdjBet
         ItKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hg6i68J4TobeoqlekmsngWftuTPTv+G6KXcOdLK3leg=;
        b=3lPXJVNWlknC8zuZidQHeVh0BvUlwYHV3i8DXd1e84r2fTp4N5r1a4qHw1JUjcyCHI
         PDxGSv7nzGyHvBgmSg1ICVJApBZD9IPoDPBWoCiwUS+dMyOy7vrbcsn26+ahkqQ1Uj5X
         MgtM+BHomJ/id7foHS89ArwuZd9GdrGAbTLvOt35v7OqE9U35VsWWOfMB0U8TR5+advJ
         /3kelx/+lbYI591mahNpM0U6h9MCaOa4bbWnVG2/AMrNgtS/bhJ6LaL4PlTi4kEeF0Nr
         D9nGS4e9N8q61gCEWjvVu3Ygpn8w+RSsIOLAr6q4r60ToG8+B2K7ekubdA8480R1k5Ex
         7mIA==
X-Gm-Message-State: AO0yUKVDfWBE32tUf0o07ygJ/GC7ny8Lx3J9kvayZ0CplnVrsJkyq64m
	D8Vm6FvMu1FX/2aA7D6BOfYitw==
X-Google-Smtp-Source: AK7set+pf7PQ1ZGCqlI8Er9tb5JhQwcK9KfqGIR52SYoaFZglHAdBVnRyV4EGcxl7VS97t3JzdDK3A==
X-Received: by 2002:a17:902:f54c:b0:198:9988:5e2f with SMTP id h12-20020a170902f54c00b0019899885e2fmr9557563plf.26.1675383881285;
        Thu, 02 Feb 2023 16:24:41 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id x23-20020a1709027c1700b001946a3f4d9csm267083pll.38.2023.02.02.16.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 16:24:40 -0800 (PST)
Date: Thu, 02 Feb 2023 16:24:40 -0800 (PST)
X-Google-Original-Date: Thu, 02 Feb 2023 15:42:40 PST (-0800)
Subject: Re: [PATCH v2 1/7] RISC-V: Add AIA related CSR defines
In-Reply-To: <20230128072737.2995881-2-apatel@ventanamicro.com>
CC: pbonzini@redhat.com, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com, anup@brainfault.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  apatel@ventanamicro.com, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-36482541-2867-4ade-948f-a2cfc2e039e5@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_162442_993261_24238A1E 
X-CRM114-Status: GOOD (  17.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 27 Jan 2023 23:27:31 PST (-0800), apatel@ventanamicro.com wrote:
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
>  #define SR_SIE		_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
> @@ -73,7 +73,10 @@
>  #define IRQ_S_EXT		9
>  #define IRQ_VS_EXT		10
>  #define IRQ_M_EXT		11
> +#define IRQ_S_GEXT		12
>  #define IRQ_PMU_OVF		13
> +#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
> +#define IRQ_LOCAL_MASK		GENMASK((IRQ_LOCAL_MAX - 1), 0)
>
>  /* Exception causes */
>  #define EXC_INST_MISALIGNED	0
> @@ -156,6 +159,27 @@
>  				 (_AC(1, UL) << IRQ_S_TIMER) | \
>  				 (_AC(1, UL) << IRQ_S_EXT))
>
> +/* AIA CSR bits */
> +#define TOPI_IID_SHIFT		16
> +#define TOPI_IID_MASK		GENMASK(11, 0)
> +#define TOPI_IPRIO_MASK		GENMASK(7, 0)
> +#define TOPI_IPRIO_BITS		8
> +
> +#define TOPEI_ID_SHIFT		16
> +#define TOPEI_ID_MASK		GENMASK(10, 0)
> +#define TOPEI_PRIO_MASK		GENMASK(10, 0)
> +
> +#define ISELECT_IPRIO0		0x30
> +#define ISELECT_IPRIO15		0x3f
> +#define ISELECT_MASK		GENMASK(8, 0)
> +
> +#define HVICTL_VTI		BIT(30)
> +#define HVICTL_IID		GENMASK(27, 16)
> +#define HVICTL_IID_SHIFT	16
> +#define HVICTL_DPR		BIT(9)
> +#define HVICTL_IPRIOM		BIT(8)
> +#define HVICTL_IPRIO		GENMASK(7, 0)
> +
>  /* xENVCFG flags */
>  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> @@ -250,6 +274,18 @@
>  #define CSR_STIMECMP		0x14D
>  #define CSR_STIMECMPH		0x15D
>
> +/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
> +#define CSR_SISELECT		0x150
> +#define CSR_SIREG		0x151
> +
> +/* Supervisor-Level Interrupts (AIA) */
> +#define CSR_STOPEI		0x15c
> +#define CSR_STOPI		0xdb0
> +
> +/* Supervisor-Level High-Half CSRs (AIA) */
> +#define CSR_SIEH		0x114
> +#define CSR_SIPH		0x154
> +
>  #define CSR_VSSTATUS		0x200
>  #define CSR_VSIE		0x204
>  #define CSR_VSTVEC		0x205
> @@ -279,8 +315,32 @@
>  #define CSR_HGATP		0x680
>  #define CSR_HGEIP		0xe12
>
> +/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> +#define CSR_HVIEN		0x608
> +#define CSR_HVICTL		0x609
> +#define CSR_HVIPRIO1		0x646
> +#define CSR_HVIPRIO2		0x647
> +
> +/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
> +#define CSR_VSISELECT		0x250
> +#define CSR_VSIREG		0x251
> +
> +/* VS-Level Interrupts (H-extension with AIA) */
> +#define CSR_VSTOPEI		0x25c
> +#define CSR_VSTOPI		0xeb0
> +
> +/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
> +#define CSR_HIDELEGH		0x613
> +#define CSR_HVIENH		0x618
> +#define CSR_HVIPH		0x655
> +#define CSR_HVIPRIO1H		0x656
> +#define CSR_HVIPRIO2H		0x657
> +#define CSR_VSIEH		0x214
> +#define CSR_VSIPH		0x254
> +
>  #define CSR_MSTATUS		0x300
>  #define CSR_MISA		0x301
> +#define CSR_MIDELEG		0x303
>  #define CSR_MIE			0x304
>  #define CSR_MTVEC		0x305
>  #define CSR_MENVCFG		0x30a
> @@ -297,6 +357,25 @@
>  #define CSR_MIMPID		0xf13
>  #define CSR_MHARTID		0xf14
>
> +/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
> +#define CSR_MISELECT		0x350
> +#define CSR_MIREG		0x351
> +
> +/* Machine-Level Interrupts (AIA) */
> +#define CSR_MTOPEI		0x35c
> +#define CSR_MTOPI		0xfb0
> +
> +/* Virtual Interrupts for Supervisor Level (AIA) */
> +#define CSR_MVIEN		0x308
> +#define CSR_MVIP		0x309
> +
> +/* Machine-Level High-Half CSRs (AIA) */
> +#define CSR_MIDELEGH		0x313
> +#define CSR_MIEH		0x314
> +#define CSR_MVIENH		0x318
> +#define CSR_MVIPH		0x319
> +#define CSR_MIPH		0x354
> +
>  #ifdef CONFIG_RISCV_M_MODE
>  # define CSR_STATUS	CSR_MSTATUS
>  # define CSR_IE		CSR_MIE
> @@ -307,6 +386,13 @@
>  # define CSR_TVAL	CSR_MTVAL
>  # define CSR_IP		CSR_MIP
>
> +# define CSR_IEH		CSR_MIEH
> +# define CSR_ISELECT	CSR_MISELECT
> +# define CSR_IREG	CSR_MIREG
> +# define CSR_IPH		CSR_MIPH
> +# define CSR_TOPEI	CSR_MTOPEI
> +# define CSR_TOPI	CSR_MTOPI
> +
>  # define SR_IE		SR_MIE
>  # define SR_PIE		SR_MPIE
>  # define SR_PP		SR_MPP
> @@ -324,6 +410,13 @@
>  # define CSR_TVAL	CSR_STVAL
>  # define CSR_IP		CSR_SIP
>
> +# define CSR_IEH		CSR_SIEH
> +# define CSR_ISELECT	CSR_SISELECT
> +# define CSR_IREG	CSR_SIREG
> +# define CSR_IPH		CSR_SIPH
> +# define CSR_TOPEI	CSR_STOPEI
> +# define CSR_TOPI	CSR_STOPI
> +
>  # define SR_IE		SR_SIE
>  # define SR_PIE		SR_SPIE
>  # define SR_PP		SR_SPP

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
