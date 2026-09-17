Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA65EC982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6culk7rX1HFQHrpMX1ZYbNijfdABDeoY6HHxi0MAk8=; b=XR0yEarx+J/y5K
	dQeFxqIBr/wpZud3Fg74zu6W4h8yd79iTo3qdBFWqpKO9cdXt/jrkvTjf+MxC6i4hzrh2Rj73IgeH
	MWKKF0CUoL5UQ0mvUgyTXuXvYk+ymwCAOv31DAy9H18kZbiPUK9FFAe11x6WUxaaphH3HBxE1zyIw
	9P06OKGYKu972uPn4cvdFqPFQtgN9EgReL4KmrRRL+4wfUw+OE+bkfP4D1CyMW3gzNLTcPA75KfS3
	NwYogb3Fk0GLQTMt7aFYDI0HG46tCzzicfflrlIwlyFHvS3lnGyb82rYk4OQREnUICRCYd11hY3Dz
	jTbixbPj1h5vFR1X14bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x789I-0000000AxhI-3sOI;
	Thu, 17 Sep 2026 09:11:20 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x789F-0000000Axg8-364u
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 09:11:19 +0000
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hlqSV3hhHz1T4Mc;
	Thu, 17 Sep 2026 16:59:22 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 625914057F;
	Thu, 17 Sep 2026 17:11:05 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 17 Sep
 2026 17:11:04 +0800
Message-ID: <ac3b17af-c6bb-4e91-b9bb-6cf2d43f8107@hisilicon.com>
Date: Thu, 17 Sep 2026 17:11:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ACPI: RISC-V: CPPC: Implement cpc_read_ffh_fb_ctrs()
To: Yufan Dou <douyufan@picoheart.com>, Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	<linux-acpi@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <yuchao.46@picoheart.com>, <yang.yicong@picoheart.com>,
	<lihuisong@picoheart.com>, <geshijian@picoheart.com>,
	<wang.yechao255@zte.com.cn>
References: <20260902083450.2348-1-douyufan@picoheart.com>
 <20260909071541.1545-1-douyufan@picoheart.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20260909071541.1545-1-douyufan@picoheart.com>
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_021118_145770_8CB01367 
X-CRM114-Status: GOOD (  15.43  )
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



On 9/9/2026 3:15 PM, Yufan Dou wrote:
> On RISC-V, reading FFH feedback counters on a remote hart through
> cpc_read_ffh() requires a separate IPI for each register.
> cppc_get_perf_ctrs() therefore samples the delivered and reference
> counters in two separate IPIs. Variation in the delay between these
> reads distorts the delivered/reference ratio and thus the frequency
> reported by cpufreq.
> 
> Implement cpc_read_ffh_fb_ctrs() to read both counters back-to-back
> in a single callback on the target hart. For remote reads, this
> reduces two IPIs to one and narrows the separation between the
> counter samples. Support CSR-type, SBI-type and mixed-type pairs.
> Pairing SBI reads does not reduce the number of SBI calls, but
> still avoids a separate IPI for each counter.
> 
> Factor the execution-context handling into cppc_ffh_read_on_cpu(),
> shared by cpc_read_ffh() and cpc_read_ffh_fb_ctrs(). CPPC frequency
> invariance (FIE) reads non-PCC counters directly from the scheduler
> tick, with local interrupts disabled. Unconditionally rejecting
> such reads prevents the frequency scale from being updated.
> 
> Following arm64's counters_read_on_cpu(), invoke the callback
> directly when interrupts are disabled and the target is the current
> CPU. Reject remote reads in that context. Otherwise, use
> smp_call_function_single() and propagate its return value before
> accessing the callback results.
> 
> Frequency accuracy testing used CSR-type delivered and reference
> counters, with CPU1 kept busy by:
> 
>   # stress-ng --cpu 1 --taskset 1
> 
> On a CPU with cpuinfo_max_freq of 3000000 kHz:
> 
> Before:
> 
>   Maximum observed cpuinfo_cur_freq: 3201369 kHz
>   Maximum observed deviation:        +201369 kHz (+6.71%)
> 
> After:
> 
>   Maximum observed cpuinfo_cur_freq: 3009646 kHz
>   Maximum observed deviation:          +9646 kHz (+0.32%)
> 
> The maximum observed deviation from cpuinfo_max_freq decreased
> by 95.2%.
> 
> Additional testing covered the CPPC FIE tick path and SBI-type
> FFH register reads.
> 
> Co-developed-by: Yicong Yang <yang.yicong@picoheart.com>
> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
> Signed-off-by: Yufan Dou <douyufan@picoheart.com>
> Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
LGTM, thanks!
Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com> 
> ---
> Changes in v2:
> - Support SBI-type and mixed-type counter pairs in a single callback
>   on the target hart, reducing remote reads to one IPI.
> - Factor out cppc_ffh_read_on_cpu() for both FFH read interfaces.
>   Allow local reads with interrupts disabled and reject remote reads
>   in that context, following arm64's counters_read_on_cpu().
> - Propagate synchronous cross-CPU call errors in cpc_read_ffh().
> - Test the CPPC FIE tick path and SBI-type FFH register reads.
> 
> v1:
> https://lore.kernel.org/all/20260902083450.2348-1-douyufan@picoheart.com/
> 
>  drivers/acpi/riscv/cppc.c | 102 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 97 insertions(+), 5 deletions(-)
> 
[ ... ]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
