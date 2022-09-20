Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE904C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zd8fJienhPx9Hw8YQMYnFlduazUcAv8+fUaBd5twi6w=; b=14Q3SGCwABzEXF
	hVlNNV7qX/zIQdrsrXU9YOjJuoc6H565AOuY9+sRr1uaPokPnesb11k+tFA+IuSJr+klv7CIhIWGf
	aCnVLdJyFthpSN5Es2BKyI28tazK5wqpsttNzBr3okPtEzKvF3hw04vIiLGFVG6K+oaBvPvu3/PER
	vt1xxb8wgmmfiEjUVyhfe6BLUpE1fTEOOXweRjnhyZFeBrex3PvTCnuSCaBozZb56YvZpc0KdMM3Z
	OHy9OggTlALR8bKTdQOL/Gns4aF8x1KD7FHhcq5q1n8KL5wpsr6KVPkljzs0Aj8e+VRdTB1YF911L
	W6dmP9Q0rie23UxfDFrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYej-001pIR-2i; Tue, 20 Sep 2022 08:31:01 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYeg-001pE6-3P
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 08:30:59 +0000
Received: by mail-il1-x12f.google.com with SMTP id y9so983191ily.11
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 01:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YFau5or+5hYuH+DGJcob3kuIUlI1z3T6guy6pV36RnY=;
        b=QxYtI4CvfN5tRvjIbM3Yq3xlxttOujeJlCAYyA/aFozpP0DILURC6l8WVj8eQIogms
         pNlif9RqvYmGSdHvz4loh5EoNw2JtFJmemU5xoG4d/5GsHxmbZCQJXb4SnrgFuxcCYP0
         xlo65470XW0vVCxU1MlxulsuMMbecLwDrgY7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YFau5or+5hYuH+DGJcob3kuIUlI1z3T6guy6pV36RnY=;
        b=lgkBMF6OYXhqTctkQeVQNxaXkvXsKdk2tBs0x3n49BMMSP3qDd77M87gX4oaixHsWf
         mdxqOjpD8gVYueP7/gAGrxpB+9cSuYLnQ1ejeqZ1yWBULg3WwKf8eFQQ0IU+QwYtfGGl
         1KytA6efhiJcB9a1hc+u+sroeY552KlRlcm/1wTJisoP2OPKHyJpS5kZMsnoPhol8u0C
         XADG6IB/+zOKJYt7Smsd+2S0bMyZ3ADINzR9SClR+Ohqa4xDi+Ojw8eUZcTPJYnqsyrs
         gZqnt5wJiMBH9rH1laSlfUDBmhc+lDryaYgvI3Ul7ySoAaEedcZTTUw7k/jF+BAGGfiO
         kcxA==
X-Gm-Message-State: ACrzQf1DjePmivNy+kQ//WWXfMcxf/si3Y9WoN+ivwmsLbU9mey76irA
	v9zbT4xTVAd002tu45tvPSKl6rdef4OIaLBh1ec7
X-Google-Smtp-Source: AMsMyM7UYjvnwEArMIwL29XzlqX7uFVq5PZV9xnznzYkXDqBOKLB72i0NjEDpuyGq0/5IOt3jbCDuvORQZoaaNFa9tU=
X-Received: by 2002:a92:c543:0:b0:2f5:ae52:a023 with SMTP id
 a3-20020a92c543000000b002f5ae52a023mr4132387ilj.118.1663662654282; Tue, 20
 Sep 2022 01:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220919155211.14453-1-mchitale@ventanamicro.com>
In-Reply-To: <20220919155211.14453-1-mchitale@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 20 Sep 2022 01:30:43 -0700
Message-ID: <CAOnJCUKzGVvxPZ=kSYpE-ObhNffoj_3+e_UZhy6kWG001oygNg@mail.gmail.com>
Subject: Re: [PATCH] perf: RISC-V: fix failure for custom firmware events
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013058_356951_C3FC9C1A 
X-CRM114-Status: GOOD (  23.57  )
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

On Mon, Sep 19, 2022 at 8:52 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> We can have SBI implementation specific firmware events in addition
> to standard firmware events so we should not check firmware event code
> against any limit. This patch removes the check so that programming
> of the custom firmware events can be supported by the driver.
>
> Fixes: e9991434596f5 ("RISC-V: Add perf platform driver based on SBI PMU extension")
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 8de4ca2fef21..df044292615c 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -381,11 +381,8 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>                 bSoftware = config >> 63;
>                 raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
>                 if (bSoftware) {
> -                       if (raw_config_val < SBI_PMU_FW_MAX)
> -                               ret = (raw_config_val & 0xFFFF) |
> -                                     (SBI_PMU_EVENT_TYPE_FW << 16);
> -                       else
> -                               return -EINVAL;
> +                       ret = (raw_config_val & 0xFFFF) |
> +                               (SBI_PMU_EVENT_TYPE_FW << 16);
>                 } else {
>                         ret = RISCV_PMU_RAW_EVENT_IDX;
>                         *econfig = raw_config_val;
> --
> 2.25.1
>

I don't think this should be tagged as a fix. The SBI spec currently
does not mention anything about custom firmware events.
As it only defined a certain set of firmware events, the check was
added in the driver.

Just to be clear, I am not against this patch. We should allow
firmware to support custom events beyond what standard firmware events
that SBI specification defines.
The SBI spec will be improved to add provisions for custom firmware events.
The patch looks good to me with the fixes tag removed.

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
