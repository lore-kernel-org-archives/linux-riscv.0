Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117A4C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 23:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eUcoYUOiQnh9T7jHbekLfbq7AlqIPnPbzh8Uec7eefA=; b=czV26S7brpAeahpvficVK4/GnX
	1nMooUhWM8MgCzV60WTfUi2aBE1PzFoRsu2GFsvQ5+/9qYV1WOMfghY+xuEqXglaXRKSuc9NQGKA0
	uPL3EBO/4uAyjDDf/S+W4WPTIv41wQHoAqSKfQ2fmvIZlOXLxx5XtZ/Eyc5PUn1zgn/gcwE2/ALuU
	TRjJLax4NL5B6/1nWzGMdnWFlTq29J34luo/Ej3y0+ij0XIH8MM4ZuFNK+3CZl3eHkSd5PdrLTZm7
	wPzPhwmzETue9sLfn/uwNRQHyHc4rcRwDDdEdJtyvK04IS9DMXXBoZoXI6KMFWkO8xsbFubGtOEE9
	wATQu1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOoWc-00Aw5V-VI; Thu, 18 Aug 2022 23:02:06 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOoWO-00Avv5-9A
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 23:01:54 +0000
Received: by mail-pf1-x436.google.com with SMTP id q19so2824312pfg.8
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 16:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=SxaLsX428RZ1ZZyMkLyl/R5gnokZLMcHhNXNy7HvM88=;
        b=4+Y1eqAiSxrv3E//VJOhwkg21D0C7aB4SuNyn+JjsLKC7DbPsOtjZWhnGw2mRfsutM
         E1PX4UErDhJZVs/98LTU5RAjvUaEsGOHujGX2T6KDVh09ayC3+dR94khPNTnpFIdouJ0
         lLzYwf38HARVztEwMQiEmwDSvIi/B7FG79sHmkaEPCcPmD0zh42aDtjfdYHz2rj16o8F
         s+ZVFOrbD8ECGqHSvvnEVgTB9rta8Wi4SJjKz2igTa6HOeNHozFPDAtu/Vc+4aDXqHCS
         BB09QsEy1rjSqkN6cxqtm6giw80SjKkQYNnlgL/DpyY9Sznb4t5OfxPAbom5ehHVNfq7
         9t0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=SxaLsX428RZ1ZZyMkLyl/R5gnokZLMcHhNXNy7HvM88=;
        b=50enRIpntUGRUw2WbzMEiImbfkjSeqgsMU/3J9EaUOGznfRdhJezCtoWQsT/mlGSiI
         iV21hFkBRRzoCUm1GZpJDYf5nvo4JC3Z6ldFf0LtbAa3zasULypaQINWV2aMD/v0h8hW
         iUnmmo7ciID0GWXwE+IhwkOe6AX6jF4OaikqLX3m1ucXnQbNfMsK8kEKHzKkisLks7/c
         fRWhSvKaHIOI7k5OmFtg661/9EG63y6V916bzk74vilvxwebLJ9Z85ddRgJYQvpu6PJb
         GSMeMcFyOmAEYSbrqUIHgQBEj8ndwEIxoH6e5FLrh3wJm6Mibd2Hb0h0EwJqvN6/jrsl
         sVJw==
X-Gm-Message-State: ACgBeo1MWImhsW2p595TpfOQuqpVusFyTjTN62tQJ6x1THF5hFDIPghL
	BFFJDXUN6Yj+8AeRpxEnEY2PNA==
X-Google-Smtp-Source: AA6agR4QWYuIV+qJ9p70dFLi1/xjsepfLeYAl9faAJ8phNMASnzbYpPMSRRVeZfJRDtc7u1ZjwizFQ==
X-Received: by 2002:a05:6a00:2409:b0:534:98c0:e53a with SMTP id z9-20020a056a00240900b0053498c0e53amr4995295pfh.11.1660863709462;
        Thu, 18 Aug 2022 16:01:49 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id b13-20020a17090a6e0d00b001f2fa09786asm2041811pjk.19.2022.08.18.16.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 16:01:48 -0700 (PDT)
Date: Thu, 18 Aug 2022 16:01:48 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Aug 2022 14:36:50 PDT (-0700)
Subject: Re: [PATCH] perf: riscv legacy: fix kerneldoc comment warning
In-Reply-To: <20220812143532.1962623-1-conor.dooley@microchip.com>
CC: atishp@atishpatra.org, anup@brainfault.org, Will Deacon <will@kernel.org>,
  mark.rutland@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
  conor.dooley@microchip.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: conor.dooley@microchip.com
Message-ID: <mhng-1907479c-dc4c-40c0-8cf1-4c4fb2b8a804@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_160152_625027_2E6DF74E 
X-CRM114-Status: GOOD (  17.65  )
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

On Fri, 12 Aug 2022 07:35:32 PDT (-0700), conor.dooley@microchip.com wrote:
> Fix the warning:
> drivers/perf/riscv_pmu_legacy.c:76: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>
> Fixes: 9b3e150e310e ("RISC-V: Add a simple platform driver for RISC-V legacy perf")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/perf/riscv_pmu_legacy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> index 342778782359..2c20b0de8cb0 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -72,7 +72,7 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
>  	local64_set(&hwc->prev_count, initial_val);
>  }
>
> -/**
> +/*
>   * This is just a simple implementation to allow legacy implementations
>   * compatible with new RISC-V PMU driver framework.
>   * This driver only allows reading two counters i.e CYCLE & INSTRET.

Thanks, this is on riscv/fixes -- given how trivial the actual diff is 
I'm OK just taking it without the Ack/Review from anyone else, doubly so 
because I probably broke it the first place.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
