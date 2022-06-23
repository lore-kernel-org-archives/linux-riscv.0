Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04990C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 18:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAQOZFsRq5Vc9BsCpyNKm+zLlcbIMzp3Ojx/yld8qdg=; b=jAryOqbvXiaSkO
	E92GmahqYouoG7ilnwLbmAo8eoyCsT5ZPMnOZYeuq4W4K6pGWxmpGRSleMY08GokFTx+MnJIcushX
	huE2sNfydQ976jRGdBB1+p+5yXTB0x1Op/wxoPGqK/kDp/jDeAGDtMGr/8Pyx/7aLBjgWXaJcUcXT
	gIzoab4MlQCHLfQcCZLy+p1aai6Bb6vaIXo9sC9y4peldB+XGx4Uc/Pl/Bv0WhMt0UjhC/9Xg0yG7
	zORDt2G8OJE5WbETJBVlUtlgLk0gnVBOAcxsD9lPdWEoxKN0o++vaIJ4KrftazFFJKb7P/FQC8j1s
	6iM9IQOKDNtWKMIoJBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4R7T-00GEDr-NJ; Thu, 23 Jun 2022 17:59:55 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4R7R-00GECp-F7
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 17:59:55 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3176d94c236so2158147b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 10:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ad1EHEM7BNKa+dGCWQyxNAhoOq5Rrp+zKbB5QQwWDcU=;
        b=ADkuySfE/zuZLZWLbgcqaS9w7VDz9JNQuh1S7T/qLAF3A0NDT8Cg6t86WNiJwHEO/J
         VMHSGKlA4Z9XJPrynOzTxbBYE0z+3mqEuhVYYywJu7154uXc3kfNGQO44+ahiXEpaBw3
         P0A5iCfT7Xcr96K8ykKW8rlPy4cCDnKodYpbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ad1EHEM7BNKa+dGCWQyxNAhoOq5Rrp+zKbB5QQwWDcU=;
        b=x/hIdsi1VWfKN6HKdR20nCKNQbf9cmtDSZop2uGR9RxMRlXgJLQoCI1eRWDGSqwEBa
         KcRjPvam4kWiW0TeVzEPpXROwG6mklkoyO47VjItPgeli4MicuHWIX+fbdXKh9HsHEZj
         DRpAgszFm8n93HA/SGuqUft7Xh7aJjXTf3yQ3WMdpFgQmL/hJPtKBZvkViWnKRjW1zLm
         dsHHexEcvNvPBly2xKiy71PaEgKmRh73bzP/C+eLiBQTa2U7ix8XBNb44wqVhHPRZvid
         7iRxJEyibUem8+2nvK5e8NEF7KTay0Sm18Lczd15zIWI9BDkIPQ0UlvS9brIMAo+gaYA
         ZLKA==
X-Gm-Message-State: AJIora9nR7Lqi/1nMEAqQrUZqj1nuON1ZhgWB8Ulrcdb+Z87G5lCQjuL
	VK/7giUFN7dy1AwKIexoF3DAE9j/uHD/ogZbfPtXuQ5uMg==
X-Google-Smtp-Source: AGRyM1tNb7dFKivMDucZ7v/MpAvJLeUsuT3g1y1Lwumkctm2/ik6jNYy8NB2nXiP4n7sM6J8WqnuR6yXzUD0ctwZLac=
X-Received: by 2002:a81:3e17:0:b0:317:742d:fe67 with SMTP id
 l23-20020a813e17000000b00317742dfe67mr12216551ywa.33.1656007190354; Thu, 23
 Jun 2022 10:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220623112735.357093-1-geomatsi@gmail.com> <20220623112735.357093-3-geomatsi@gmail.com>
In-Reply-To: <20220623112735.357093-3-geomatsi@gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 23 Jun 2022 10:59:39 -0700
Message-ID: <CAOnJCUKYOoxJLiH6YVwAPMqfEhEv_Do=Ptxs4dNSxdJSHVto6A@mail.gmail.com>
Subject: Re: [PATCH 2/3] perf: RISC-V: allow to use the highest available counter
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel <anup@brainfault.org>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_105953_546416_63517478 
X-CRM114-Status: GOOD (  21.33  )
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

On Thu, Jun 23, 2022 at 4:27 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> Both OpenSBI and Linux explicitly assume that there is no hardware counter
> with index 1: hardware uses that bit for TM control. So OpenSBI filters
> out that index in sanity checks. However its range sanity checks do not
> treat that index in a special way. As a result, OpenSBI does not allow
> to use the firmware counter with the highest index. Linux perf RISC-V
> SBI driver is adapted for the current OpenSBI behavior: it excludes the
> highest valid index from the counter mask passed to OpenSBI.
>
> This patch fixes ranges to re-enable the highest available counter.
>
> Accompanying OpenSBI fix to accept full mask:
> - https://github.com/riscv-software-src/opensbi/pull/260
>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 3e0ea564b9b8..294d4bded59e 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -265,7 +265,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>         struct sbiret ret;
>         int idx;
>         uint64_t cbase = 0;
> -       uint64_t cmask = GENMASK_ULL(rvpmu->num_counters - 1, 0);
> +       uint64_t cmask = GENMASK_ULL(rvpmu->num_counters, 0);
>         unsigned long cflags = 0;
>
>         if (event->attr.exclude_kernel)
> @@ -283,7 +283,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>         }
>
>         idx = ret.value;
> -       if (idx >= rvpmu->num_counters || !pmu_ctr_list[idx].value)
> +       if (idx > rvpmu->num_counters || !pmu_ctr_list[idx].value)
>                 return -ENOENT;
>
>         /* Additional sanity check for the counter id */
> @@ -482,7 +482,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>          * which may include counters that are not enabled yet.
>          */
>         sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -                 0, GENMASK_ULL(pmu->num_counters - 1, 0), 0, 0, 0, 0);
> +                 0, GENMASK_ULL(pmu->num_counters, 0), 0, 0, 0, 0);
>  }
>
>  static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> --
> 2.36.1
>

This won't be required to support maximum firmware counter index. With
the fix, I proposed in your first patch in kernel
and OpenSBI, it should be doable. Both kernel & OpenSBI should use
zero indexed counter schemes to avoid confusion.


--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
