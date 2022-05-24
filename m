Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F77CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7PupNCStXyxud+xLqSNw6wxpVM1uj3sFdR6KPGn18Y=; b=3pLIPqxmwKVpFB
	N9UTJbSb5ehn6iLEbn8WAr/rMi5jIkDOTzdtnn8vo/2aSJHIdKg4v1jukdB2ANOsqKDRijLF9OzaL
	qyoL9ji6xKMi1FOjDzp0MrgV+9DY+9prFfJaPjYIXpQmyPCff9AwSgGa3HzyTnuQVehKFBzf+qa0E
	xfdibIephEgl0ZyNR6lWZKro2qUrNZuQUNVlJrAW46YPkyO8n7CDyv//ttvX+ZkewETUm4RS61jbA
	gwvRgWeaXLizld1hzW+DVeqezMHyy/L+W2566J1Sj4CTJADwiR1UTLOoZ8EpJL78QH9/F/6xOmrmQ
	5KhJnJ7j3XUvxWuR3W2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntSce-007mjV-K0; Tue, 24 May 2022 11:22:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntScb-007mht-0V
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 11:22:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id y24so2645729wmq.5
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 04:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bP8kRhNwmItUataEWlKC3/a9/zDgSR+UCaI4XtaJeW8=;
 b=XzMEoSZMGBZwlINe84xBxoGx1pKIgVbH99vxCzUkPIJzN3JV0eDFsCR8EAx/1BygLJ
 cePe2lrU+5GgaHk+UR8j+kecsKslpF/sU0BVFAmewkEObHuVLp/pcJ4cBRux2GupvwxR
 cMW11jOIirzCYBcEIjHYc3LlTXrLnCg80SWwOUfgBUdi98+F2fOPcdV/An2ZIYxZJqB5
 V+ukL+BZGcB+6UUe3A5Tht/JpbErBZjDv3ZKFKlKj2nhxsG306pNeiHeRDWrmorkCzP4
 XhtP2PDthBK4pw5omr8V52y0ul+yqw/3qxueGmkCFMGeE2U5MBBgJXlL4MqlHuZxYuPv
 vNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bP8kRhNwmItUataEWlKC3/a9/zDgSR+UCaI4XtaJeW8=;
 b=W+setm9q1M8VLFw47VFzbTj9jzR/4MYYrkODnLnERaEqb0LAZxC9OirMTfmxbbcrZ3
 +mxHCrN6lAwutnlMqYvYZsCBdvqaChR9orVsFpP5gEWDdeuhMfxlTK7sjhR2qLJOaVjd
 FjKhZ/Lvc31RTPZ7EzNH51bm4hKwuCPNwHDXVl3f2o6tjD28x/VvAVHKYMY4hDVWCUcF
 K/EzHblBtjtk9X9I1ABO0R3pJEVnxLmKexy+Wy+lfgGZVk5Fm1x+NQ96QOSrDlRTYinF
 OBnOTFPMwMUP+y3i6Z/fKqiUdhrvx2MSYbzy0GXbW8gSSKaO877h0sLcVYT2Y3ULVJ4b
 FXcg==
X-Gm-Message-State: AOAM532PXZjdHxTiNxYH+mHOikvaKmD3epowu7JJgnTgfR+T4N/fZpEe
 OZy7W6MjOVa9l31pmhdAb2cstxcUJ4g+S/5oecERlg==
X-Google-Smtp-Source: ABdhPJyR7B9J7D6CK1B3dMJZTSB7iWaPjyVVDnv/Tx1ucz4fNWMDrPaLFUufih2NH30uRYzTEFWy8jR8vcxupKx59wk=
X-Received: by 2002:a05:600c:4fd5:b0:394:55ae:32c7 with SMTP id
 o21-20020a05600c4fd500b0039455ae32c7mr3332614wmq.73.1653391358329; Tue, 24
 May 2022 04:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220513015522.910856-1-atishp@rivosinc.com>
 <20220513015522.910856-4-atishp@rivosinc.com>
In-Reply-To: <20220513015522.910856-4-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 May 2022 16:52:26 +0530
Message-ID: <CAAhSdy23vE8+HxU5Jxy2rBMjy3rBTrJt_4sriuROac_sEESSVw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Fix SBI PMU calls for RV32
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_042241_309017_DC8B7673 
X-CRM114-Status: GOOD (  18.45  )
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

On Fri, May 13, 2022 at 7:25 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Some of the SBI PMU calls does not pass 64bit arguments
> correctly and not under RV32 compile time flags. Currently,
> this doesn't create any incorrect results as RV64 ignores
> any value in the additional register and qemu doesn't support
> raw events.
>
> Fix those SBI calls in order to set correct values for RV32.
>
> Fixes: e9991434596f ("RISC-V: Add perf platform driver based on SBI PMU extension")
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 7ad92039a718..fab0dd497393 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -274,8 +274,13 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>                 cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
>
>         /* retrieve the available counter index */
> +#if defined(CONFIG_32BIT)
> +       ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
> +                       cflags, hwc->event_base, hwc->config, hwc->config >> 32);
> +#else
>         ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
>                         cflags, hwc->event_base, hwc->config, 0);
> +#endif
>         if (ret.error) {
>                 pr_debug("Not able to find a counter for event %lx config %llx\n",
>                         hwc->event_base, hwc->config);
> @@ -417,8 +422,13 @@ static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
>         struct hw_perf_event *hwc = &event->hw;
>         unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
>
> +#if defined(CONFIG_32BIT)
>         ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
>                         1, flag, ival, ival >> 32, 0);
> +#else
> +       ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
> +                       1, flag, ival, 0, 0);
> +#endif
>         if (ret.error && (ret.error != SBI_ERR_ALREADY_STARTED))
>                 pr_err("Starting counter idx %d failed with error %d\n",
>                         hwc->idx, sbi_err_map_linux_errno(ret.error));
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
