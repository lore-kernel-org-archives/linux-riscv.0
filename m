Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59367C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 04:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZJ38i70f9HotHfq6vDIsHS+5r0Ag+Ora7ld6WRopKQ=; b=fxCOQe84swfTID
	juKHVX1ms1J/r8CfGrAnr16kZR9o4Eh4ViR6mrPv7O6aZpjs8bFydyI57OZoIRpFYRQIqnOs1Qc0j
	TP+yYqoiaB38XklN6NdkMHH9gbixBtKQzeTc4uZ7Cyb6PM+0bqpnhVGVW9y4h71Z5H3QQn7rgbRqs
	0U+rn8KS+tCyVtUWdWzT3+C5rgp82Ntkkd+3K//EIcDLZDY0TBE1HCph6uGMgF+a6NE41WjdZxOSt
	ceDojiPWYWYjwY7I77QrJAXXxYT3MRfiQQ0zgpo2DroVCXMOZXmxa5f7+WvYGjZtPcQLlrxky7qLi
	etcQHgLaORgmLFad4CyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np0hX-00A08U-4P; Thu, 12 May 2022 04:45:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np0hU-00A07b-RS
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 04:45:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id t6so5548273wra.4
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 21:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nB/czAIXlJJ8PHEUqcnrNljzAJJcfTV3UmWzXVmd/Cs=;
 b=uJorObYandt+4O05YsIkNx5pXRqDbRHU94W6N1cx4h7FkzmjxjYu6zQ7JOC2IoqZ3I
 K+NokQmLZvZEsSnrPI32VjBpodTdZ4CVMuSZQMDyvwiY3KvOVa6bsn1EiKPQXY+xbHx2
 3ujNWKnT/cicNYkm+ZB8mDvF5YLtei+WOgqMXS6Ste14Qpp4j8w/owZUfdtOqs1ZBq32
 AVrGkmulAwPqQs3SbZ8RJVXmPovBQMWMOLfo//EsVyhqI6OKdY/vHSOrvkKQyHfJ1T1a
 w/gaDWYAPXbqyKh4vrhpDUkT+LXZABfi3lv1aGyO1dmftPUcvF+C2R5tp81bm2HlF/VH
 YRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nB/czAIXlJJ8PHEUqcnrNljzAJJcfTV3UmWzXVmd/Cs=;
 b=awPLsCb1MsIo6aL4sCRAz2KHu2VNEM/dl5F0RNGMIdaQLlzTuBHA+Fo4yMT0XF5Pss
 6/WbaESlat7C6IYM1+t8Plckf9gGEMteIJ5P2b1m4paa+dsgFMVTTlEPuq0GXdQLrqvx
 pa/gmDGs+TpFKtZ4/HbtcMJ3NWRlOZ40UngcU/0dEqkFhLrMPERVNDGWyh3sGAteyKBA
 RWCVTT8lomceP7h2MuDi6YXDl+9mM+SHniaftOp+Ru7jqiesHNOH4y7DE9Q43oigDC7+
 iSVOsI/2cRCy6nuV//oUN0JuxkJzeyCgZs5k9+2jJNPXMd6lFS4lPqq1mdBOJ5GatidU
 BBxA==
X-Gm-Message-State: AOAM532HAJy2YXixsyP015hTSgFju3SlNZGOf+25HT2hyx7zWM3lm+q0
 hna3J2q5HEf3BbYmZoe7BMdLsPK0W2kkQYKsYa2lyQ==
X-Google-Smtp-Source: ABdhPJx+mk1aBg9Ve43PcEgLYy3YQNt0epJCWo9clPxMAFTEILckRPTvps8178/xvCNaRUYKctEKvhkGi0JxLePLj3Y=
X-Received: by 2002:a5d:6483:0:b0:20c:5c21:5c8c with SMTP id
 o3-20020a5d6483000000b0020c5c215c8cmr25640208wri.86.1652330717991; Wed, 11
 May 2022 21:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220511201107.2311757-1-atishp@rivosinc.com>
 <20220511201107.2311757-2-atishp@rivosinc.com>
In-Reply-To: <20220511201107.2311757-2-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 May 2022 10:15:06 +0530
Message-ID: <CAAhSdy2=EspQ10wn6WiACov58GJESsR8udOU=j=CgvmH2bgHoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Update user page mapping only once during
 start
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_214520_927608_F7CA454F 
X-CRM114-Status: GOOD (  16.85  )
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

On Thu, May 12, 2022 at 1:41 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Currently, riscv_pmu_event_set_period updates the userpage mapping.
> However, the caller of riscv_pmu_event_set_period should update
> the userpage mapping because the counter can not be updated/started
> from set_period function in counter overflow path.
>
> Invoke the perf_event_update_userpage at the caller so that it
> doesn't get invoked twice during counter start path.
>
> Fixes: f5bfa23f576f ("RISC-V: Add a perf core library for pmu drivers")
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/perf/riscv_pmu.c     | 1 -
>  drivers/perf/riscv_pmu_sbi.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index b2b8d2074ed0..130b9f1a40e0 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -170,7 +170,6 @@ int riscv_pmu_event_set_period(struct perf_event *event)
>                 left = (max_period >> 1);
>
>         local64_set(&hwc->prev_count, (u64)-left);
> -       perf_event_update_userpage(event);
>
>         return overflow;
>  }
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 24cea59612be..2eac5db2cc18 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -527,6 +527,7 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
>                         init_val = local64_read(&hwc->prev_count) & max_period;
>                         sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
>                                   flag, init_val, init_val >> 32, 0);
> +                       perf_event_update_userpage(event);
>                 }
>                 ctr_ovf_mask = ctr_ovf_mask >> 1;
>                 idx++;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
