Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8976FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Dec 2021 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHsfK9jTPLtNoZ1yjsaAPMF/FfnEYq8zAzfRvuCAoPg=; b=qVKYEa41AryGQs
	fEyAEaEh25AkQNRGYwEcC/MQPBtJjJTiWqhOAuGzVkFK3EvLuylZh5Ye1YMkqpXw3U4OlYl+16Vzr
	Xax9lEiIRc8sLIUfPGGOrXO49Awq6rX1QWsKSpUN/zT6ZVp0kgESA45SgkoGvAH0w0/j/eTPdzIgN
	6sGZ5g9L+nJOaaejePDIV9VgkNYGDrUw6Ii/tTuLRJgLEMuMrv+uWRDYHsLmv7ZJvoJNSdh86+c/q
	VlRXGIccpC/mDQDSVn9SshlVpEZipMJXvnleM2lQgJMCsw3ATb1/BA7vGagBiH9724yUgwVE5uWWd
	sSZCSecxsRAlgPsOZ3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxWlB-001XZe-TF; Wed, 15 Dec 2021 16:04:05 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxWkM-001X97-0o
 for linux-riscv@lists.infradead.org; Wed, 15 Dec 2021 16:03:16 +0000
Received: by mail-yb1-xb33.google.com with SMTP id v64so56490460ybi.5
 for <linux-riscv@lists.infradead.org>; Wed, 15 Dec 2021 08:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GiNYQTCx80RqOCWsDr0HEjJB5e/RmxK3bF/dCC29mWU=;
 b=CzrfEMlCyBNdUXTadBLO4zZaCHbDXbM0FdxnC6Ud6YNLkmLJ4//mLRolRf3zDw/O7a
 i/LCeqbAo8fZi97Gl9bSAwGR6iFuUNwaCv8BS7x9OIuU6B4LceDcTG9iUAGKgc7JgKP6
 +20R4ojbe6U4ogKZyJZ8RVIx55iS7RkyjTDwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GiNYQTCx80RqOCWsDr0HEjJB5e/RmxK3bF/dCC29mWU=;
 b=swnCnqhKnli+1IWqapHlGIDqc8T5QSNRkM2ulNNFu/vZpMQHzhp63frWC+VUUuyxq/
 qJyz1uTuf19iP3qHz1mDzbJQnDt7BsIY1qe5yQZY8pO00oZMK5dl6tXHgTU6ngf9/gwX
 I8ggiekTcj+xeM/D9Rv9wE4plo4TvfukU8bAgglTCn1Rp73lQrHgQYzOYjt5hGCKPE5g
 lfZl+onRjV92EiIGU8bDsl9ESY+W409X5aAS/KgkBjIGaCu0oLPshe8J3iKKEBlg9wyf
 IW8A4QYDS/kHeyDJWyERgS2u4TctXf7s2HEIIj83I7WWtxgc0gyhHkXEga06r1m6I/tI
 J4fA==
X-Gm-Message-State: AOAM532KlCFEqaSOKKMEygKfiLe5NkaZyKCAQb8m9BbtTAT3ZiyllGAC
 YnNlBvVETR1XzvIVjDRmHy1e1M8o6Au2gIkdHZ6m
X-Google-Smtp-Source: ABdhPJzXQW8xMk9WFdgxeBv6U5lUUQ9SRQofE4GMEUin6G+Dxb6DFCkBbx7Zd6eNLZ/A1IORIMM+JgB8FwA7V/caBHE=
X-Received: by 2002:a25:d157:: with SMTP id i84mr6667830ybg.703.1639584191647; 
 Wed, 15 Dec 2021 08:03:11 -0800 (PST)
MIME-Version: 1.0
References: <20211025195350.242914-1-atish.patra@wdc.com>
 <20211025195350.242914-6-atish.patra@wdc.com>
 <20211215110214.62ca2474@redslave.neermore.group>
In-Reply-To: <20211215110214.62ca2474@redslave.neermore.group>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 15 Dec 2021 08:03:00 -0800
Message-ID: <CAOnJCU+XGcFtJuYu5AMG07guxoaigx=fKnmnNGrrs4AdxKRLeQ@mail.gmail.com>
Subject: Re: [v4 05/11] RISC-V: Add RISC-V SBI PMU extension definitions
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_080314_190457_5DD2BD7A 
X-CRM114-Status: GOOD (  24.04  )
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

On Wed, Dec 15, 2021 at 12:10 AM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:
>
> Hello Atish!
>
> On Mon, 25 Oct 2021 12:53:44 -0700
> Atish Patra <atish.patra@wdc.com> wrote:
>
> > This patch adds all the definitions defined by the SBI PMU extension.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/include/asm/sbi.h | 97
> > ++++++++++++++++++++++++++++++++++++ 1 file changed, 97 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h
> > b/arch/riscv/include/asm/sbi.h index 0d42693cb65e..7a14ca06ba8f 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -27,6 +27,7 @@ enum sbi_ext_id {
> >       SBI_EXT_IPI = 0x735049,
> >       SBI_EXT_RFENCE = 0x52464E43,
> >       SBI_EXT_HSM = 0x48534D,
> > +     SBI_EXT_PMU = 0x504D55,
> >  };
> >
> >  enum sbi_ext_base_fid {
> > @@ -70,6 +71,99 @@ enum sbi_hsm_hart_status {
> >       SBI_HSM_HART_STATUS_STOP_PENDING,
> >  };
> >
> > +
> > +enum sbi_ext_pmu_fid {
> > +     SBI_EXT_PMU_NUM_COUNTERS = 0,
> > +     SBI_EXT_PMU_COUNTER_GET_INFO,
> > +     SBI_EXT_PMU_COUNTER_CFG_MATCH,
> > +     SBI_EXT_PMU_COUNTER_START,
> > +     SBI_EXT_PMU_COUNTER_STOP,
> > +     SBI_EXT_PMU_COUNTER_FW_READ,
> > +};
> > +
> > +#define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(55, 0)
> > +#define RISCV_PMU_RAW_EVENT_IDX 0x20000
> > +
> > +/** General pmu event codes specified in SBI PMU extension */
> > +enum sbi_pmu_hw_generic_events_t {
> > +     SBI_PMU_HW_NO_EVENT                     = 0,
> > +     SBI_PMU_HW_CPU_CYCLES                   = 1,
> > +     SBI_PMU_HW_INSTRUCTIONS                 = 2,
> > +     SBI_PMU_HW_CACHE_REFERENCES             = 3,
> > +     SBI_PMU_HW_CACHE_MISSES                 = 4,
> > +     SBI_PMU_HW_BRANCH_INSTRUCTIONS          = 5,
> > +     SBI_PMU_HW_BRANCH_MISSES                = 6,
> > +     SBI_PMU_HW_BUS_CYCLES                   = 7,
> > +     SBI_PMU_HW_STALLED_CYCLES_FRONTEND      = 8,
> > +     SBI_PMU_HW_STALLED_CYCLES_BACKEND       = 9,
> > +     SBI_PMU_HW_REF_CPU_CYCLES               = 10,
> > +
> > +     SBI_PMU_HW_GENERAL_MAX,
> > +};
> > +
> > +/**
> > + * Special "firmware" events provided by the firmware, even if the
> > hardware
> > + * does not support performance events. These events are encoded as
> > a raw
> > + * event type in Linux kernel perf framework.
> > + */
> > +enum sbi_pmu_fw_generic_events_t {
> > +     SBI_PMU_FW_MISALIGNED_LOAD      = 0,
> > +     SBI_PMU_FW_MISALIGNED_STORE     = 1,
> > +     SBI_PMU_FW_ACCESS_LOAD          = 2,
> > +     SBI_PMU_FW_ACCESS_STORE         = 3,
> > +     SBI_PMU_FW_ILLEGAL_INSN         = 4,
> > +     SBI_PMU_FW_SET_TIMER            = 5,
> > +     SBI_PMU_FW_IPI_SENT             = 6,
> > +     SBI_PMU_FW_IPI_RECVD            = 7,
> > +     SBI_PMU_FW_FENCE_I_SENT         = 8,
> > +     SBI_PMU_FW_FENCE_I_RECVD        = 9,
> > +     SBI_PMU_FW_SFENCE_VMA_SENT      = 10,
> > +     SBI_PMU_FW_SFENCE_VMA_RCVD      = 11,
> > +     SBI_PMU_FW_SFENCE_VMA_ASID_SENT = 12,
> > +     SBI_PMU_FW_SFENCE_VMA_ASID_RCVD = 13,
> > +
> > +     SBI_PMU_FW_HFENCE_GVMA_SENT     = 14,
> > +     SBI_PMU_FW_HFENCE_GVMA_RCVD     = 15,
> > +     SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
> > +     SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
> > +
> > +     SBI_PMU_FW_HFENCE_VVMA_SENT     = 18,
> > +     SBI_PMU_FW_HFENCE_VVMA_RCVD     = 19,
> > +     SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
> > +     SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
> > +     SBI_PMU_FW_MAX,
> > +};
> > +
> > +/* SBI PMU event types */
> > +enum sbi_pmu_event_type {
> > +     SBI_PMU_EVENT_TYPE_HW = 0x0,
> > +     SBI_PMU_EVENT_TYPE_CACHE = 0x1,
> > +     SBI_PMU_EVENT_TYPE_RAW = 0x2,
> > +     SBI_PMU_EVENT_TYPE_FW = 0xf,
> > +};
> > +
> > +/* SBI PMU event types */
> > +enum sbi_pmu_ctr_type {
> > +     SBI_PMU_CTR_TYPE_HW = 0x0,
> > +     SBI_PMU_CTR_TYPE_FW,
> > +};
> > +
> > +/* Flags defined for config matching function */
> > +#define SBI_PMU_CFG_FLAG_SKIP_MATCH  (1 << 0)
> > +#define SBI_PMU_CFG_FLAG_CLEAR_VALUE (1 << 1)
> > +#define SBI_PMU_CFG_FLAG_AUTO_START  (1 << 2)
> > +#define SBI_PMU_CFG_FLAG_SET_MINH    (1 << 3)
> > +#define SBI_PMU_CFG_FLAG_SET_SINH    (1 << 4)
> > +#define SBI_PMU_CFG_FLAG_SET_UINH    (1 << 5)
> > +#define SBI_PMU_CFG_FLAG_SET_VSINH   (1 << 6)
> > +#define SBI_PMU_CFG_FLAG_SET_VUINH   (1 << 7)
>
> It looks like you have a typo here, the defines in OpenSBI are
> different:
>
> #define SBI_PMU_CFG_FLAG_SET_VUINH      (1 << 3)
> #define SBI_PMU_CFG_FLAG_SET_VSINH      (1 << 4)
> #define SBI_PMU_CFG_FLAG_SET_UINH       (1 << 5)
> #define SBI_PMU_CFG_FLAG_SET_SINH       (1 << 6)
> #define SBI_PMU_CFG_FLAG_SET_MINH       (1 << 7)
>
>

Thanks for catching that. OpenSBI has the correct one as per the
specification[1].
I will fix it in the next version.

[1] https://github.com/riscv-software-src/opensbi/blob/master/include/sbi/sbi_ecall_interface.h

> > +
> > +/* Flags defined for counter start function */
> > +#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
> > +
> > +/* Flags defined for counter stop function */
> > +#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> > +
> >  #define SBI_SPEC_VERSION_DEFAULT     0x1
> >  #define SBI_SPEC_VERSION_MAJOR_SHIFT 24
> >  #define SBI_SPEC_VERSION_MAJOR_MASK  0x7f
> > @@ -82,6 +176,9 @@ enum sbi_hsm_hart_status {
> >  #define SBI_ERR_INVALID_PARAM        -3
> >  #define SBI_ERR_DENIED               -4
> >  #define SBI_ERR_INVALID_ADDRESS      -5
> > +#define SBI_ERR_ALREADY_AVAILABLE -6
> > +#define SBI_ERR_ALREADY_STARTED -7
> > +#define SBI_ERR_ALREADY_STOPPED -8
> >
> >  extern unsigned long sbi_spec_version;
> >  struct sbiret {
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
