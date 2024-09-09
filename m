Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDC8EB64DE
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 02:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFtHMN85LmrjV994/kiJcJffWEiYXpuwyOt3aLwkiX8=; b=mXSYa41GHwgFZV
	XD5/3KFNtd/qOxFF76885abkJ5s/ee3uOcZRrHu3bBEKmbYaqeTFHnAN/IXU1SsKUSFHyvbCzUUvs
	rRqMxHWAJAWgLMaZ3HkyuS1Ei3eQlsHNiqUgMAKK4iDbHupuMMbtqIXSwrHCjiFBcvGD3K5CrZ/pU
	hb8L/Q/frQtvoYBXsGPj+06pWsYwnsypwk9QBDNsc/zQzC7WXM69PrYlBYMThzq8iNlWq8dg4bqI8
	npSkjBPKDwWeDPJDBhf3ZIaIkh/5Kn4LNTuapFfTVyNU31bpb8uTNYjl2UbIpwYkvZaizPNkzmL4L
	9T+sehgFmgAsNYkMRorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUDU-00000000HvV-0z75;
	Mon, 09 Sep 2024 02:33:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUDP-00000000HuN-00kJ
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 02:33:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X29px6wbCz1j8CY;
	Mon,  9 Sep 2024 10:32:41 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C6741400DC;
	Mon,  9 Sep 2024 10:33:08 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Sep 2024 10:33:07 +0800
Message-ID: <90847eaa-ddfa-47e9-9f2f-31364bb13947@huawei.com>
Date: Mon, 9 Sep 2024 10:33:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/perf: riscv: Align errno for unsupported perf
 event
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, <linux-riscv@lists.infradead.org>
CC: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, Pu Lehui <pulehui@huaweicloud.com>
References: <20240831071520.1630360-1-pulehui@huaweicloud.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240831071520.1630360-1-pulehui@huaweicloud.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_193321_314754_206AB325 
X-CRM114-Status: GOOD (  15.21  )
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


On 2024/8/31 15:15, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> RISC-V perf driver does not yet support PERF_TYPE_BREAKPOINT. It would
> be more appropriate to return -EOPNOTSUPP or -ENOENT for this type in
> pmu_sbi_event_map. Considering that other implementations return -ENOENT
> for unsupported perf types, let's synchronize this behavior. Due to this
> reason, a riscv bpf testcases perf_skip fail. Meanwhile, align that
> behavior to the rest of proper place.

Hi Atish,

Is current modification appropriate? Hope if you have time to review it.

Thanks.

> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   drivers/perf/riscv_pmu_legacy.c | 4 ++--
>   drivers/perf/riscv_pmu_sbi.c    | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> index 04487ad7fba0..93c8e0fdb589 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -22,13 +22,13 @@ static int pmu_legacy_ctr_get_idx(struct perf_event *event)
>   	struct perf_event_attr *attr = &event->attr;
>   
>   	if (event->attr.type != PERF_TYPE_HARDWARE)
> -		return -EOPNOTSUPP;
> +		return -ENOENT;
>   	if (attr->config == PERF_COUNT_HW_CPU_CYCLES)
>   		return RISCV_PMU_LEGACY_CYCLE;
>   	else if (attr->config == PERF_COUNT_HW_INSTRUCTIONS)
>   		return RISCV_PMU_LEGACY_INSTRET;
>   	else
> -		return -EOPNOTSUPP;
> +		return -ENOENT;
>   }
>   
>   /* For legacy config & counter index are same */
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 44d3951d009f..169c5157b916 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -309,7 +309,7 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>   			  ret.value, 0x1, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
>   	} else if (ret.error == SBI_ERR_NOT_SUPPORTED) {
>   		/* This event cannot be monitored by any counter */
> -		edata->event_idx = -EINVAL;
> +		edata->event_idx = -ENOENT;
>   	}
>   }
>   
> @@ -543,7 +543,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>   		}
>   		break;
>   	default:
> -		ret = -EINVAL;
> +		ret = -ENOENT;
>   		break;
>   	}
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
