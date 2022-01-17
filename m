Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44272C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqQezhpCZJUpIiwhJetd/Iv5xXPpw5NaCXi2BHwvsoE=; b=fs2WkIeesXZ9rh
	athl6eELZUM4HCQS39e69sPcgM6q1yqaaisROIJgyNyrzQybQhOffBgX1CsnLK4uksn3YykZbnSAC
	jonDtKkk/7q97PGtNkZPRR1B4uxzUV2rZakT3nEJ5VrDzA8ae81OWHmP/dtg09rJr6s/iicLXYVyw
	rFb9qHZetS4Ta9dC163YJZk+lH0o+xXOVVJsW1LxNhjVY8HDpWAmiDrrw99cQSrxJeKjxeLP5kUUi
	dBvnDeoBnyg5pDMg00orZTyrfd1bbiK7OfFlwcZUjg/U1dZQ8EdwfnHCwc5fJT1i3g6iXTGiIYdOz
	jUFng5km4WzLLQia+cMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9UfM-00FY45-RG; Mon, 17 Jan 2022 16:15:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9UfK-00FY3Y-5X
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 16:15:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id w26so21519397wmi.0
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 08:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BYgJDH5u7Y8YeoWfDuM56T17Gv5aMOQMmqg9a2t5daA=;
 b=XAfW47a9vaxUgIYAmMI0z64awv1LqMJOffb8Lkma0SSON3eU5IBq3uyRA22ZewNF+b
 tKt9WpHikvnHJ4eDzh9nEHGx3UWP3uSqfRei68f43QWt9RA8f99UP0keKwdoyjTOb0r7
 m6Yei+v31ShI6iwLSGjhpS5Z3yA/VlCEDVc4Krf9H00pEJX2jWWwFUzRu5N7vpttUACs
 DGEa3hxLjS0MhAyQN6/2seqyrrLzM+LBVn9wDfyptQcklnKGlNTNxvdW6Q+s0tSqM1x5
 rSTNZ0xP3nXIwqI3DKJZmxBb4LLgV+LmnsRanXPQ0i/jp/jUanFn+OQ6mTqkKFucBKXc
 D97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BYgJDH5u7Y8YeoWfDuM56T17Gv5aMOQMmqg9a2t5daA=;
 b=LzQYkyrCgZ5RpwoEw8k90Ul5p5gfOZ665mWAN2sAQoaYBAkowI7YMz3P2yTEjLefN8
 nsAYNv75A8JMHrMTUO2GG5PcU4ZmWtaOZeOGkGSsMxKD+ZKiAXb6kRnY9e2gvW3DCOkd
 eFc7UQqgP4uq0qrICCRLkrJgoGvFKiwesxdUe1jiHg8oSbSo9aysPn4HIkpv6XnxSK7B
 qmTTPw+ga5QILfABlBXP6iWeKJ1qTLDQDZeLJS8pMa1IVk3ECN5/f1CDIh7p17UCOlx8
 rxR74l+fHsZ6itb8OpCz+fSRK62P394dNbC66Xg8VHOo3gVX0a7xA2VqY4dglCsVzVDv
 +Stw==
X-Gm-Message-State: AOAM532QrjL/c4KLWssFvpbu9VbdUqJOISW+GRiyYs1ughLMBH8/2sx9
 DY5qx+m/omgYsdDBpuW47kedkUiVRjMmwRQ8sIQgYw==
X-Google-Smtp-Source: ABdhPJxiSeb6uUNrxNczt/tQerhk4fkXTOtS8o7B2ljt8+VSYZYAK7NpcYEIzgbm/2mSJbETKBZ+JoXmAsrqyCxJ1y8=
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr18002851wma.137.1642436128338; 
 Mon, 17 Jan 2022 08:15:28 -0800 (PST)
MIME-Version: 1.0
References: <20211225054647.1750577-1-atishp@rivosinc.com>
 <20211225054647.1750577-6-atishp@rivosinc.com>
In-Reply-To: <20211225054647.1750577-6-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Jan 2022 21:45:17 +0530
Message-ID: <CAAhSdy0RU_tZKz=6aDxEt50h2kr96+UTskDE1HURYyFzXmmtXg@mail.gmail.com>
Subject: Re: [v5 5/9] RISC-V: Add RISC-V SBI PMU extension definitions
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_081530_287128_6824F8E3 
X-CRM114-Status: GOOD (  19.12  )
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

On Sat, Dec 25, 2021 at 11:17 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> This patch adds all the definitions defined by the SBI PMU extension.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 97 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0d42693cb65e..afb29ee1f230 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -27,6 +27,7 @@ enum sbi_ext_id {
>         SBI_EXT_IPI = 0x735049,
>         SBI_EXT_RFENCE = 0x52464E43,
>         SBI_EXT_HSM = 0x48534D,
> +       SBI_EXT_PMU = 0x504D55,
>  };
>
>  enum sbi_ext_base_fid {
> @@ -70,6 +71,99 @@ enum sbi_hsm_hart_status {
>         SBI_HSM_HART_STATUS_STOP_PENDING,
>  };
>
> +

Unwanted newline here.

> +enum sbi_ext_pmu_fid {
> +       SBI_EXT_PMU_NUM_COUNTERS = 0,
> +       SBI_EXT_PMU_COUNTER_GET_INFO,
> +       SBI_EXT_PMU_COUNTER_CFG_MATCH,
> +       SBI_EXT_PMU_COUNTER_START,
> +       SBI_EXT_PMU_COUNTER_STOP,
> +       SBI_EXT_PMU_COUNTER_FW_READ,
> +};
> +
> +#define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(55, 0)
> +#define RISCV_PMU_RAW_EVENT_IDX 0x20000
> +
> +/** General pmu event codes specified in SBI PMU extension */
> +enum sbi_pmu_hw_generic_events_t {
> +       SBI_PMU_HW_NO_EVENT                     = 0,
> +       SBI_PMU_HW_CPU_CYCLES                   = 1,
> +       SBI_PMU_HW_INSTRUCTIONS                 = 2,
> +       SBI_PMU_HW_CACHE_REFERENCES             = 3,
> +       SBI_PMU_HW_CACHE_MISSES                 = 4,
> +       SBI_PMU_HW_BRANCH_INSTRUCTIONS          = 5,
> +       SBI_PMU_HW_BRANCH_MISSES                = 6,
> +       SBI_PMU_HW_BUS_CYCLES                   = 7,
> +       SBI_PMU_HW_STALLED_CYCLES_FRONTEND      = 8,
> +       SBI_PMU_HW_STALLED_CYCLES_BACKEND       = 9,
> +       SBI_PMU_HW_REF_CPU_CYCLES               = 10,
> +
> +       SBI_PMU_HW_GENERAL_MAX,
> +};
> +
> +/**
> + * Special "firmware" events provided by the firmware, even if the hardware
> + * does not support performance events. These events are encoded as a raw
> + * event type in Linux kernel perf framework.
> + */
> +enum sbi_pmu_fw_generic_events_t {
> +       SBI_PMU_FW_MISALIGNED_LOAD      = 0,
> +       SBI_PMU_FW_MISALIGNED_STORE     = 1,
> +       SBI_PMU_FW_ACCESS_LOAD          = 2,
> +       SBI_PMU_FW_ACCESS_STORE         = 3,
> +       SBI_PMU_FW_ILLEGAL_INSN         = 4,
> +       SBI_PMU_FW_SET_TIMER            = 5,
> +       SBI_PMU_FW_IPI_SENT             = 6,
> +       SBI_PMU_FW_IPI_RECVD            = 7,
> +       SBI_PMU_FW_FENCE_I_SENT         = 8,
> +       SBI_PMU_FW_FENCE_I_RECVD        = 9,
> +       SBI_PMU_FW_SFENCE_VMA_SENT      = 10,
> +       SBI_PMU_FW_SFENCE_VMA_RCVD      = 11,
> +       SBI_PMU_FW_SFENCE_VMA_ASID_SENT = 12,
> +       SBI_PMU_FW_SFENCE_VMA_ASID_RCVD = 13,
> +
> +       SBI_PMU_FW_HFENCE_GVMA_SENT     = 14,
> +       SBI_PMU_FW_HFENCE_GVMA_RCVD     = 15,
> +       SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
> +       SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
> +
> +       SBI_PMU_FW_HFENCE_VVMA_SENT     = 18,
> +       SBI_PMU_FW_HFENCE_VVMA_RCVD     = 19,
> +       SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
> +       SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
> +       SBI_PMU_FW_MAX,
> +};
> +
> +/* SBI PMU event types */
> +enum sbi_pmu_event_type {
> +       SBI_PMU_EVENT_TYPE_HW = 0x0,
> +       SBI_PMU_EVENT_TYPE_CACHE = 0x1,
> +       SBI_PMU_EVENT_TYPE_RAW = 0x2,
> +       SBI_PMU_EVENT_TYPE_FW = 0xf,
> +};
> +
> +/* SBI PMU event types */
> +enum sbi_pmu_ctr_type {
> +       SBI_PMU_CTR_TYPE_HW = 0x0,
> +       SBI_PMU_CTR_TYPE_FW,
> +};
> +
> +/* Flags defined for config matching function */
> +#define SBI_PMU_CFG_FLAG_SKIP_MATCH    (1 << 0)
> +#define SBI_PMU_CFG_FLAG_CLEAR_VALUE   (1 << 1)
> +#define SBI_PMU_CFG_FLAG_AUTO_START    (1 << 2)
> +#define SBI_PMU_CFG_FLAG_SET_VUINH     (1 << 3)
> +#define SBI_PMU_CFG_FLAG_SET_VSNH      (1 << 4)
> +#define SBI_PMU_CFG_FLAG_SET_UINH      (1 << 5)
> +#define SBI_PMU_CFG_FLAG_SET_SINH      (1 << 6)
> +#define SBI_PMU_CFG_FLAG_SET_MINH      (1 << 7)
> +
> +/* Flags defined for counter start function */
> +#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
> +
> +/* Flags defined for counter stop function */
> +#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> +
>  #define SBI_SPEC_VERSION_DEFAULT       0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT   24
>  #define SBI_SPEC_VERSION_MAJOR_MASK    0x7f
> @@ -82,6 +176,9 @@ enum sbi_hsm_hart_status {
>  #define SBI_ERR_INVALID_PARAM  -3
>  #define SBI_ERR_DENIED         -4
>  #define SBI_ERR_INVALID_ADDRESS        -5
> +#define SBI_ERR_ALREADY_AVAILABLE -6
> +#define SBI_ERR_ALREADY_STARTED -7
> +#define SBI_ERR_ALREADY_STOPPED -8
>
>  extern unsigned long sbi_spec_version;
>  struct sbiret {
> --
> 2.33.1
>

Apart from a minor comment above, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
