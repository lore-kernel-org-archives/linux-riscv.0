Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EC9C79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQzW+gDDXAOBj8EzGqW7E0jCo/NIaEaQP74n1WH/mRs=; b=ER/SKi70KgMYY6
	pWNP9SpzrY6E0kABX3ee5kjDqTdYdbQjpEfnhq9ew8wlYhSaSwi8xV7fkbW5Neh84P4B4vAkTaSAY
	fRotNdVgpWntAJD8q0FN6YFFnDBtZmiOPXnku+HP6+W9/AcjCLLbc4Gs+5osIsYF3mhEWw5VLeZrk
	bmfzWqLa8NLGdHpgVnZlRxmrYCm8kA8A+RaI2u5ALQ1unLpuWZ9BRjH2jLH2VT56bKsHpZ70PDmop
	0wt2vGUmlWns96WZugA2AlABIJaDyoUyzidYixYrQCcKDBiNC/NppQbdS45x2raEz0/YpA5BU2XeS
	caOlcyZYSmEy4O6PKwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZYF-00000006xfr-2LhB;
	Mon, 07 Sep 2026 13:38:23 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZYC-00000006xf1-2RCl
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 13:38:22 +0000
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hdntG3nhbzLlXX;
	Mon,  7 Sep 2026 21:27:18 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id B67EE40565;
	Mon,  7 Sep 2026 21:38:11 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 7 Sep
 2026 21:38:10 +0800
Message-ID: <ba883461-aa7c-49ac-b7c8-79e0d41fc086@hisilicon.com>
Date: Mon, 7 Sep 2026 21:38:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ACPI: RISC-V: CPPC: Implement cpc_read_ffh_fb_ctrs()
To: Yicong Yang <yang.yicong@picoheart.com>
References: <20260902083450.2348-1-douyufan@picoheart.com>
 <d48e5c92-f666-44e0-8375-9772d95065b5@hisilicon.com>
 <37731989-e1f1-4dc9-944d-2544ce8e9302@picoheart.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <37731989-e1f1-4dc9-944d-2544ce8e9302@picoheart.com>
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_063820_974631_37BAD864 
X-CRM114-Status: GOOD (  20.23  )
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
Cc: geshijian@picoheart.com, yuchao.46@picoheart.com, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Yufan Dou <douyufan@picoheart.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 9/7/2026 9:17 PM, Yicong Yang wrote:
> On 9/7/26 7:29 PM, Jie Zhan wrote:
>>
>>
>> On 9/2/2026 4:34 PM, Yufan Dou wrote:
>>> On RISC-V, each cpc_read_ffh() for a CSR-type FFH register sends a
>>> separate IPI to the target hart via smp_call_function_single().
>>> cppc_get_perf_ctrs() therefore samples the delivered and reference
>>> counters in two separate IPIs, at two different instants. The skew
>>> between the two sampling points distorts the delivered/reference
>>> ratio and thus the frequency reported by cpufreq.
>>>
>>> Implement the cpc_read_ffh_fb_ctrs() hook to read both CSR counters
>>> back-to-back in a single IPI, which narrows the sampling window to a
>>> few instructions and halves the number of cross-CPU calls. This
>>> improves the accuracy of the reported frequency in the same way as
>>> the arm64 implementation of the hook, which reads both AMU counters
>>> in a single counters_read_on_cpu() call.
>>>
>>> SBI-type FFH registers still fall back to individual reads, since
>>> pairing them would not reduce the number of SBI calls on the target
>>> hart.
>>>
>>> Testing was performed while CPU1 was kept busy with:
>>>
>>>   # stress-ng --cpu 1 --taskset 1
>>>
>>> On a CPU with cpuinfo_max_freq of 3000000 kHz:
>>>
>>> Before:
>>>
>>>   Maximum observed cpuinfo_cur_freq: 3201369 kHz
>>>   Maximum observed error:            +201369 kHz (+6.71%)
>>>
>>> After:
>>>
>>>   Maximum observed cpuinfo_cur_freq: 3009646 kHz
>>>   Maximum observed error:              +9646 kHz (+0.32%)
>>>
>>> The maximum observed error is reduced by 95.2%.
>> Glad to see that works for RISC-V as well.
>>>
>>> Signed-off-by: Yufan Dou <douyufan@picoheart.com>
>>> ---
>>>  drivers/acpi/riscv/cppc.c | 47 +++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 47 insertions(+)
>>>
>>> diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
>>> index 42c1a9052470..2ca98fa69e9a 100644
>>> --- a/drivers/acpi/riscv/cppc.c
>>> +++ b/drivers/acpi/riscv/cppc.c
>>> @@ -85,6 +85,20 @@ static void cppc_ffh_csr_write(void *write_data)
>>>  	data->ret.error = -EINVAL;
>>>  }
>>>  
>>> +struct sbi_cppc_fb_ctrs_data {
>>> +	struct sbi_cppc_data first;
>>> +	struct sbi_cppc_data second;
>>> +};
>>> +
>>> +static void cppc_ffh_csr_read_fb_ctrs(void *read_data)
>>> +{
>>> +	struct sbi_cppc_fb_ctrs_data *data = read_data;
>>> +
>>> +	cppc_ffh_csr_read(&data->first);
>>> +	if (!data->first.ret.error)
>>> +		cppc_ffh_csr_read(&data->second);
>>> +}
>>> +
>>>  /*
>>>   * Refer to drivers/acpi/cppc_acpi.c for the description of the functions
>>>   * below.
>>> @@ -125,6 +139,39 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
>>>  	return -EINVAL;
>>>  }
>>>  
>>> +int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
>>> +			 struct cpc_reg *reg2, u64 *val2)
>>> +{
>>> +	struct sbi_cppc_fb_ctrs_data data;
>>> +	int ret;
>>> +
>>> +	if (WARN_ON_ONCE(irqs_disabled()))
>>> +		return -EPERM;
>> AFAICS, this may cause CPPC FIE to constantly fail to read counters because
>> FIE runs in hardirq context.
> 
> I suppose it's mainly due to the smp_call_function_single() cannot work
> with irqs_disabled().
> 
> seems we need to do the similar handling like arm64's
> counters_read_on_cpu() - read the counters locally when irqs_disabled()
> if local cpu is the target cpu.
Exactly.
> 
> so is cpc_read_ffh() of riscv. but I suppose this should be a fix of below
> commit, as it were in the kthread for FIE...
> 997c021abc6e ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs")
> 
The fix on riscv has been posted.
https://lore.kernel.org/all/20260609192856874Y8AaPpKL5TnmbgiWI8DI3@zte.com.cn/

cpc_read_ffh_fb_ctrs() and cpc_read_ffh() both call counters_read_on_cpu()
on arm64, so fixing counters_read_on_cpu() is fine.
But the two ABIs are implemented separately here on riscv, so copy the same
fix to cpc_read_ffh_fb_ctrs() or factor out a common process.
>> Any test on CPPC FIE?
>>> +
>>> +	/* Only CSR counters can be paired within a single IPI. */
>>> +	if (FFH_CPPC_TYPE(reg1->address) != FFH_CPPC_CSR ||
>>> +	    FFH_CPPC_TYPE(reg2->address) != FFH_CPPC_CSR)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	data.first.reg = FFH_CPPC_CSR_NUM(reg1->address);
>>> +	data.second.reg = FFH_CPPC_CSR_NUM(reg2->address);
>>> +
>>> +	ret = smp_call_function_single(cpu, cppc_ffh_csr_read_fb_ctrs,
>>> +				       &data, 1);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (data.first.ret.error)
>>> +		return data.first.ret.error;
>>> +	if (data.second.ret.error)
>>> +		return data.second.ret.error;
>>> +
>>> +	*val1 = data.first.ret.value;
>>> +	*val2 = data.second.ret.value;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  int cpc_write_ffh(int cpu, struct cpc_reg *reg, u64 val)
>>>  {
>>>  	struct sbi_cppc_data data;
>>>
>>> base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
