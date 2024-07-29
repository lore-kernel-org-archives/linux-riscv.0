Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10B6C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ywMBn9pX0sY10fl7cWVE2wxM/v4BumLsfCOKn39NwQ=; b=PF6zTXE0Zt4Wpk
	TR6tntruTpW/NHAJgyjffzHoZeJkvTOk4AS6h2K73JZCfbC7d3TmR5hxc8jVo3UblJ/VULYC/kIby
	lRX1m2TUMKze42gyzkdyQ5D2eLniV2AttJc6zWiq0DMvLV1jv9McKy3/PGrM4H2pRaXRJJQUygbdy
	Qyv+cjesRkjEoef69Irfe6V+qFqfhOQOD4SBNwifXlZkz3OdeVnMsWo1NjZvxptIcusLUaW5V3N2f
	UVM2Ddnp7wA7E2WtoXrkxxkFfb6XMUwiHL2XJUYGTCPdliN0UeSI4EfShLxNNdHjQGkxFxOD1cLEF
	t+OftgFjKiZsSFhvcj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYUl7-0000000CIXy-2l63;
	Mon, 29 Jul 2024 18:06:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYUl4-0000000CIXU-3co5
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 18:06:08 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc6a017abdso20072065ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722276365; x=1722881165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqa+lzDLi4xcqb3MCIs8G1pmU6SJbPsdOFe+W3OtJdo=;
        b=BwJ/xNGBq4wqCDE6nr+QcmXXbtvIewI5GBSWFp03qnakvae39mvqJ/F3Z2fFsEXIK2
         k+G4zDbSMNhHNhZgZDcsgWiQMX50eVh2ixnle5RCdjnChvR6x/8wA8GMh1PuZYY0Eo7R
         EtKq2bb/T71RYODrBnXgG1ELTdNilJ/31pjftc8hQJljtzkdZGJ58DXXWxlFQwHkX2cr
         7m4/Zp3sVWTg9Gmh1bLWCJcfYR4f0Ido/1wtgqO/1TXU4VLvQBiRRZlfFZE2wxLxtcu0
         7UDE1oAu9RRmi4ObxxITz2FQ4zv4E6bYoBl7gOyOs1yy9bV5oR1GWK9cwcNZu4AOLYg/
         CkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722276365; x=1722881165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqa+lzDLi4xcqb3MCIs8G1pmU6SJbPsdOFe+W3OtJdo=;
        b=noTrJJo0M7kbkkI1g0LcQx6Ud4GIfgGqR+GGjvHvWFSvio83PJOFeZP8GSzVOsL+ka
         Y2JLUkEHznrLoDx8wxhKqzCvJYYVnvZjobycDKs3dhqrEUFPI+/lKycayfLRX5yN3/5l
         h/ANx7Br7C8mXkKU8MX82LhfVKjfVu9hspd56d0SukJRIJjlmjXReTvanrUc6dP7TGu6
         BWC7O4XINljybxowQrIrByLJ6bFLhXsgS/1b50OTg5wfhmZVbv7AAgx2r1JboSdKLZQJ
         Snck+bnJWuroVk0d3RDVsf4lEt/N7ICGNxti9a0Xm8Q6aErHKMQ24qRFVDCAIqFSSyRZ
         17+g==
X-Gm-Message-State: AOJu0YxiUZ2GRsF+Byi8BcXEVjaY3s+gAYocqJt+GpxQ+kvOwv/gT9sd
	GSnEJGbJxFLjWvTnZNVo6zszycfl/eZ0bnWPK9OQT4wxuuT7LwoWEFZ8WDlMGXc=
X-Google-Smtp-Source: AGHT+IHpt+PyDZepTHEcgsg6pM/Gn5BoS4u4uFsh91z1kjn01mdVlE0YlzyOP7w60S/p/wSeQx+HVA==
X-Received: by 2002:a17:902:e741:b0:1fd:a54e:bc28 with SMTP id d9443c01a7336-1ff04927702mr60882125ad.63.1722276364926;
        Mon, 29 Jul 2024 11:06:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fc8102sm85861045ad.280.2024.07.29.11.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:06:04 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: dmitry.shifrin@syntacore.com
Cc: linux-riscv@lists.infradead.org,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: perf: riscv: Fix selecting counters in legacy mode
Date: Mon, 29 Jul 2024 11:05:54 -0700
Message-Id: <20240729180554.1711718-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729125858.630653-1-dmitry.shifrin@syntacore.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_110606_924044_702A57CA 
X-CRM114-Status: GOOD (  18.41  )
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

> It is required to check event type before checking event config.
> Events with the different types can have the same config.
> This check is missed for legacy mode code
> 
> For such perf usage:
>     sysctl -w kernel.perf_user_access=2
>     perf stat -e cycles,L1-dcache-loads --
> driver will try to force both events to CYCLE counter.
> 
> This commit implements event type check before forcing
> events on the special counters.
> 
> Signed-off-by: Shifrin Dmitry <dmitry.shifrin@syntacore.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 36d128ff166f..bf14ab282e11 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -416,7 +416,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  	 * but not in the user access mode as we want to use the other counters
>  	 * that support sampling/filtering.
>  	 */
> -	if (hwc->flags & PERF_EVENT_FLAG_LEGACY) {
> +	if ((hwc->flags & PERF_EVENT_FLAG_LEGACY) && (event->attr.type == PERF_TYPE_HARDWARE)) {
>  		if (event->attr.config == PERF_COUNT_HW_CPU_CYCLES) {
>  			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
>  			cmask = 1;
>

Nice catch.
Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
