Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107C9FA373D
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 12:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ky001+KHTf4/oU18yb7Hnc0nySt6IpLylTe3yDMqbe4=; b=mx6I2SYmgpsU6T
	EuCkwO//yoMai6+V5wR1lIegun2A9uaWib8MdK2e3c9cweEnfeSlnBeoWrkIoD5ZXUwMBmlyjsS4Y
	UGFXTcdiJoGqEZiqrgeJTSqvqcQzCQLjzOkbLAsH7WUncZxBeq6F4u4canK2NQqFpo3BV9UxzIUUM
	f+ny3y1uFGrLADJDbH7kgoOKDHjSW18yI2Z60cEBwy1XNecY++xroXO/I5pNT9JsFPdOD+xE0X7Rx
	appxIV49xQkoXo5bfui8e1t9Dsz/esAUK8ThebIZhrme6++yawDPTEA98jGuX/Qx2KOD0hTLINq5V
	4SN0Gwfe1ucq7WTBLIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqjo-00596H-MO; Tue, 01 Nov 2022 12:51:28 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opqjl-00594q-G8
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 12:51:26 +0000
Received: by mail-ed1-x532.google.com with SMTP id a5so21576446edb.11
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3ZWUelOBGuajwMCGSZuHahRmnca9IMPS5lnk5/9ETI=;
        b=SH22qPUXsEn3p/Floa1ZUMCLaXYV8bLk5ULHiQsQqH465E1SVAmIu6Gj850XUtWV9A
         D3vcOJJpkBKDfQObFbUbvPzsspuQeDi8iVxdxbPuOD5L9lqdeXzBxpoBhQrusiuhFHEW
         X5gb+sDNXCfylI/G4HA9XvQ5zBoOQLjxCMPiCtygwfXo80GSGpNvwLPh/Z+T/8bh3Zuk
         SwXqo9RR/EoPDC2jCc+HLc5z3HKMEmC/z195V79dBXKBEvrvXGJaudJx8wGWvzn2YMCf
         SHKwY8wXPJECzov7T2eLVkWbEI2/y+28jeSZJQxu8o71oB3W65T8TXYTCq5r5pvnAkJ1
         KxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3ZWUelOBGuajwMCGSZuHahRmnca9IMPS5lnk5/9ETI=;
        b=pD2aLh4gjrBMBhb7TkvZcHEweOTuglAzZLY31QR2ysJ9xvx+GxaOaMhuPLTdLkK25P
         EhIPqcVK+1/KTB7GN3H27jOVlcVCIFlUWshjS8jdwbwZ7qrZYCFtbP8NER2e5lUukDRg
         DhVDx04osGObJrZn6MpDq/wYfjFUth56HiIhWuX/zlvX6eD1ibjYnhpeiVELInDgzlZ6
         iFMEba0D91JjY3wuOwQlJlp8tzsD9iZPBBBmlcd6aPsmkMcu1WnnVwE50on7HB6kI9+f
         CNzAmTT2DdlkB7ce+ivvaYi6Pw63A9hR2jan3gAu3O/ummTcyzrPANnpgNSAYfrtu8uC
         e5ag==
X-Gm-Message-State: ACrzQf3utXcWcVeQZHt014Kb5lXnRtjD9QnEPMQ4Prs/56+jNaL27IOH
	8iNlKK+S4QFwbo3M/rkN1GyfQQ==
X-Google-Smtp-Source: AMsMyM49yeZoSu5tYqBhel3Vi41lPu+IDsM9aRBTodsPAIXmVMIiAGsNUkmhNpKrHHoSwAH+rwrGSg==
X-Received: by 2002:a05:6402:158d:b0:463:2343:b980 with SMTP id c13-20020a056402158d00b004632343b980mr14233232edv.150.1667307081713;
        Tue, 01 Nov 2022 05:51:21 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id e22-20020a17090658d600b007ad0b97e6e9sm4112927ejs.162.2022.11.01.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:51:21 -0700 (PDT)
Date: Tue, 1 Nov 2022 13:51:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC  4/9] RISC-V: KVM: Improve privilege mode filtering for perf
Message-ID: <20221101125120.lkd3n3yybihjhzyk@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-5-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718170205.2972215-5-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_055125_547510_0B234046 
X-CRM114-Status: GOOD (  23.26  )
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

On Mon, Jul 18, 2022 at 10:02:00AM -0700, Atish Patra wrote:
> Currently, the host driver doesn't have any method to identify if the
> requested perf event is from kvm or bare metal. As KVM runs in HS
> mode, there are no separate hypervisor privilege mode to distinguish
> between the attributes for guest/host.
> 
> Improve the privilege mode filtering by using the event specific
> config1 field.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 27 ++++++++++++++++++++++-----
>  include/linux/perf/riscv_pmu.h |  2 ++
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 5d0eef3ef136..34f9fcc221a8 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -275,6 +275,27 @@ int riscv_pmu_sbi_hpmc_width(void)
>  }
>  EXPORT_SYMBOL(riscv_pmu_sbi_hpmc_width);
>  
> +static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
> +{
> +	unsigned long cflags = 0;
> +	bool guest_events = false;
> +
> +	if (event->attr.config1 & RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS)
> +		guest_events = true;
> +	if (event->attr.exclude_kernel)
> +		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VSINH : SBI_PMU_CFG_FLAG_SET_SINH;
> +	if (event->attr.exclude_user)
> +		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VUINH : SBI_PMU_CFG_FLAG_SET_UINH;
> +	if (guest_events && event->attr.exclude_hv)
> +		cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> +	if (event->attr.exclude_host)
> +		cflags |= SBI_PMU_CFG_FLAG_SET_UINH | SBI_PMU_CFG_FLAG_SET_SINH;
> +	if (event->attr.exclude_guest)
> +		cflags |= SBI_PMU_CFG_FLAG_SET_VSINH | SBI_PMU_CFG_FLAG_SET_VUINH;
> +
> +	return cflags;
> +}
> +
>  static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  {
>  	struct hw_perf_event *hwc = &event->hw;
> @@ -286,11 +307,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters - 1, 0);
>  	unsigned long cflags = 0;
>  
> -	if (event->attr.exclude_kernel)
> -		cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> -	if (event->attr.exclude_user)
> -		cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
> -
> +	cflags = pmu_sbi_get_filter_flags(event);
>  	/* retrieve the available counter index */
>  #if defined(CONFIG_32BIT)
>  	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index 6fee211c27b5..825b95253bc5 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -26,6 +26,8 @@
>  
>  #define RISCV_PMU_STOP_FLAG_RESET 1
>  
> +#define RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS 0x1
> +
>  struct cpu_hw_events {
>  	/* currently enabled events */
>  	int			n_events;
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
