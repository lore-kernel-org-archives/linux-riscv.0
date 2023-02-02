Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5F9C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 04:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRnFQkOdXlFa2KGgbBj1qJV/wk5rXAMAeO2aAz4Vk0g=; b=yx4gHDTZxrDpTE
	JEjOZpd84he2OnLg3CKDAzKqnb3g5cu3Gcy9hKPjL/nln0AMHbA8jVq47u8fhqWRdxWPC1ZXrnTq4
	o0regjHCLZqU7Fx1gkH4LZwglp8pg/iUdvM/Kd5Q8mAhWpd/VbZCkCk5qVvGCW8m0daz2fRVflvck
	YxUD8LwgxguiRHar6Wz1TChBb7H5JXKy2K1ikccG79YdaIWGrOQWRN4ocyiOTYeVOJUIemeMulRqR
	69K7YVisH/uo8JhudOC5x2JyC6v9ProRqvcIhMZ6x9/38x4eEwDvjJ8ikJipNkkZZOoWmYXBKMik8
	qEDiYaQFAP7RHYjruQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNQlx-00EIba-Pp; Thu, 02 Feb 2023 04:00:29 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNQlu-00EIa3-HP
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 04:00:28 +0000
Received: by mail-ej1-x629.google.com with SMTP id lu11so2497934ejb.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 20:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+uHzkzRU34mQdnn5lWvnZyqUSrv1eWF6wggHxGMhz5Y=;
        b=vDT2PW4noC2y8fUJv4T030Qs0ou+utnvprCD69Bni7JoZBDDy5JeATGsFmUPIsZF4D
         mjpm5Dv9mpAz/UHO/X/4nOZxZxCrp+zupKy+L6VHedmaNDxxP8axYp/tiqjLL0drYw8+
         kcAKZdwMo3hAeKNvIVA0YZF+r1E5LaZ1W0Gk3VFLwZssP6vyk/Qoe7uH+H9G0UoXtTBU
         MWk1j2t+xoBe940QlWS8JHz+u5ov81ET2mEhMykFV56LBActmHNkNYaVPdPPbop5LKJi
         Cd1GLSbR1rkobqMeJ5X0W3+EoNlv0NWtn4eehuL0lm20DqKJlwZxrrSDlIj6d3JELApG
         6DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uHzkzRU34mQdnn5lWvnZyqUSrv1eWF6wggHxGMhz5Y=;
        b=RYmPP1amQ4RUjXLnvQJXYow9g0f6SSz2955/Z1IMy/FCVh+1gg8s+Sqd/l0ErX9xHf
         tu4Gn1NVoviZDG1LDeExkpA0MImtZUxBeWOqDiKenFmXMjtETjR4o52XRUQdNCNzfsjr
         elUlNYPd3VRjRqM/fokWQFk7mnezNFTWB6YLfxoJVM+yjluJ4Yv3KPfEGJEVdY70v6IJ
         aZ02Q7K0KwCCn6tjqRKu35ZohMPlQb9jeUffINVjDoeNLOyE/8/s7hNA5hA9LqollEqS
         qvxY5e54CMnbvdSg8QK0F+Dz4lgiawOpi5jZJgjdV2hjBDxf7nd4s07AiUwoS5iR35We
         AyPw==
X-Gm-Message-State: AO0yUKUAMuDGWnXP7HiEoz2TH/wOl63JiRSlBF9CUogNshbGAn74xeeI
	8i1EjUjZjXkSaDutKDwtrigE/m0uK5Sq5pV83pYRJA==
X-Google-Smtp-Source: AK7set9Gl20xL0r/kUXbPTHGGlCdGEFHpzn6184j2T2lV6HyNUYLcbnvJOnFSAICYR9hzlq2DJHtCSbzB41rik4ah9w=
X-Received: by 2002:a17:906:8597:b0:87d:d218:3923 with SMTP id
 v23-20020a170906859700b0087dd2183923mr1535177ejx.117.1675310419808; Wed, 01
 Feb 2023 20:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20230201231250.3806412-1-atishp@rivosinc.com> <20230201231250.3806412-4-atishp@rivosinc.com>
In-Reply-To: <20230201231250.3806412-4-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Feb 2023 09:30:09 +0530
Message-ID: <CAAhSdy2KSBq3NgCe00pHbTkxQkezrbGbo6XcZZ2Cgu6L_-osww@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] RISC-V: Improve SBI PMU extension related definitions
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Eric Lin <eric.lin@sifive.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_200026_852419_C364A3B7 
X-CRM114-Status: GOOD (  17.44  )
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

On Thu, Feb 2, 2023 at 4:42 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> This patch fixes/improve few minor things in SBI PMU extension
> definition.
>
> 1. Align all the firmware event names.
> 2. Add macros for bit positions in cache event ID & ops.
>
> The changes were small enough to combine them together instead
> of creating 1 liner patches.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/sbi.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 4ca7fba..945b7be 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -169,9 +169,9 @@ enum sbi_pmu_fw_generic_events_t {
>         SBI_PMU_FW_ILLEGAL_INSN         = 4,
>         SBI_PMU_FW_SET_TIMER            = 5,
>         SBI_PMU_FW_IPI_SENT             = 6,
> -       SBI_PMU_FW_IPI_RECVD            = 7,
> +       SBI_PMU_FW_IPI_RCVD             = 7,
>         SBI_PMU_FW_FENCE_I_SENT         = 8,
> -       SBI_PMU_FW_FENCE_I_RECVD        = 9,
> +       SBI_PMU_FW_FENCE_I_RCVD         = 9,
>         SBI_PMU_FW_SFENCE_VMA_SENT      = 10,
>         SBI_PMU_FW_SFENCE_VMA_RCVD      = 11,
>         SBI_PMU_FW_SFENCE_VMA_ASID_SENT = 12,
> @@ -215,6 +215,9 @@ enum sbi_pmu_ctr_type {
>  #define SBI_PMU_EVENT_CACHE_OP_ID_CODE_MASK 0x06
>  #define SBI_PMU_EVENT_CACHE_RESULT_ID_CODE_MASK 0x01
>
> +#define SBI_PMU_EVENT_CACHE_ID_SHIFT 3
> +#define SBI_PMU_EVENT_CACHE_OP_SHIFT 1
> +
>  #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
>
>  /* Flags defined for config matching function */
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
