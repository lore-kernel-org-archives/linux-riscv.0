Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6680FC3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/7fKbGSKPZRqbODS3B9UiWZwnrr5xCSkfT1ZIyXXKo=; b=tsyNVeyEyCb/W1
	pisg3cV6AjJIevrxT6L7COTmf1RyUdDkj/X7mx85wDpMBm3e1eoUziQH/EJHWytgvpmi/y7CehFjr
	BXAlZvxIG9xb3ojQTPWSUzY3BnFLB4eIA/eUY1G54N2fGKC5aMJzKWlzQXRoARArPhVRDZG1rB9we
	YXHqPAFwymqQa2HdDDXgzT0A5pCsOijAAfo4GhT2U5H3XekvavR9qsuQHuMbR0YWXznYhsgGodPME
	wQTa9lSo72rjRdmQx40yBAqklJAWXPSp5AWANXx8ozcmPTvjMSuZgAn4CKG7IowxGnPF6RAJfyCCU
	6SL9g8BRxy+0cTv+MSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3uY-00000000Aac-2gbj;
	Wed, 31 Jul 2024 07:38:14 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3u4-00000000APx-1J53
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:37:46 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-81f83b14d65so247503139f.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 00:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722411463; x=1723016263; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hzglC/byDhDvnFBWc6wZL41SNGknlqAMA7KmvbuJtb4=;
        b=HB7B3119IulLxQgJmKlcSJutdxLq2/SfCXUTtwiRjXYEky58p/jRUC2zhdJF3ds5wy
         U9NbvOM6TJufKTkkrKIvjw5RkrGmq0PgGvMg5pi72kRkNwtcZPwU8GTezf0Kpsn5daH2
         dtGhJ+Jy5vQyRDyhRJYo8WcXeq1qz0xIxH9EWqIz5Wdexqmq9AGSRAOOWLF27NOLwLdZ
         vujSapNtJ86XCnes7Bk+ulaQb7aky24RMI/kgjhVSKFhFFbAa5oZZCWJxZbxw2Atbbo/
         u443Wwum1YRJvs0bi5dq7HWP3H8wZDi8zzGiBiV6ylu1ChqVw9Enw0fRk1+zisNFFzRw
         3SuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411463; x=1723016263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzglC/byDhDvnFBWc6wZL41SNGknlqAMA7KmvbuJtb4=;
        b=r6TWCjlHfyxyXUpyS9icCDGlT/OzXO71HOsZ5f+9sUrYetMxuD75lwZnKorpSqh4G8
         /5QLJP2S+b4RmEjkadnlIf/Ml6GmwZv6VvBM5L8WKrQ+BIABtB+FMCm+HEBnJxChmjOM
         qwYoyKSnCaaDpVfyCwdafVcZ8RU4dTc1U7vBGoGGYgr5CFX0IJmkn5dyTLto9kpV7zNm
         L9OTaZMTRQIePHGix2HPEchVS1gsdX6Wp/yPpj3kzkRrcyRPIidOqGQkwvtQu5vWo4tx
         g+CNRISo+vmQEpt1swSIw9xTIZqn7QJ1K2jrshLSKaCmcb49uknANgR/8XYX72EVJo4n
         RvXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5UBjQdpZbCTD53hkdWV0YZ5S50ZkCcVvNniH4ddUypTb/+8hpjiC7nviu/9ngWKBqQSJ1d125ajQodmCRRAJnNt5SbHETV/jiwkNRT76c
X-Gm-Message-State: AOJu0Yyvi7U5FQJgwSwNyZG9j9JdlRU6MUf2zLOmkS3eqOqTZEmRjsRl
	cQ7WLsnfhHG7kJm3et5j6hChv/1N2XPOI3QOcm8MLYJ/r8pefzJMEUjzSa59L4o=
X-Google-Smtp-Source: AGHT+IHF+FmD7RvwEBRIUXC9/YpswlEdr8n2P3czYAdfPAZ3IrYGybmYAj5wUY3xomuIwU5OEOAT3A==
X-Received: by 2002:a05:6602:340a:b0:7f6:84e7:bd35 with SMTP id ca18e2360f4ac-81f95beb9cfmr1526267239f.8.1722411463003;
        Wed, 31 Jul 2024 00:37:43 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-81f8ec67998sm322012439f.9.2024.07.31.00.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 00:37:42 -0700 (PDT)
Message-ID: <0fa3cf3d-48f6-405b-8b66-8935a629089e@sifive.com>
Date: Wed, 31 Jul 2024 02:37:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: riscv: Fix selecting counters in legacy mode
To: Shifrin Dmitry <dmitry.shifrin@syntacore.com>,
 linux-riscv@lists.infradead.org
Cc: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alexghiti@rivosinc.com
References: <20240729125858.630653-1-dmitry.shifrin@syntacore.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240729125858.630653-1-dmitry.shifrin@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_003744_431760_E31AFE60 
X-CRM114-Status: GOOD (  20.37  )
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

Hi Dmitry,

On 2024-07-29 7:58 AM, Shifrin Dmitry wrote:
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

It looks like pmu_sbi_event_mapped() and pmu_sbi_event_mapped() have a similar
bug where they do not check event->attr.type.

Regards,
Samuel

> 
> Signed-off-by: Shifrin Dmitry <dmitry.shifrin@syntacore.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
