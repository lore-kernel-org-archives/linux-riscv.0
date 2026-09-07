Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0B5C79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:In-Reply-To:From:
	Mime-Version:Message-Id:To:References:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlStOFGMjhfLKckQhQ4D9xZ4ByXBhJ8jnEDOPIcik9Q=; b=A4jC/2wXm0HboT
	oUqAojdXwEB+wxDGKhvOYn18VSc+nvaDf3S50PINBI03wnRPUkA5DmnnZy5g027zKz6avXwb1eTMD
	DHPUBxbOacJco+iLNa5j4JwKTwBwBArCLt4hf12fS7vF4Qbf4jgaPxHaZMg1Hwv66iKqqVRJEj0Sj
	Eibe4EuhXg3ZojsnE5RgssE+k+pxewK5nwBkkljCkXYyWBam8U6BwfpcygjD5Mf2qV1uD3NTbt9rN
	feGrpLkE9cN84NKYnEo2I0A/AE+/x2m4rl4H/kI0Htfjogx6JGjYFH0fBkxM/+FhoDimnSNzBTMuP
	U+Ib5WO05YMuqM6wr05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZE0-00000006ut5-1lyI;
	Mon, 07 Sep 2026 13:17:28 +0000
Received: from va-2-36.ptr.blmpb.com ([209.127.231.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZDx-00000006usb-0raD
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 13:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788787039; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=paxgRnqRRQ5ClGyRNJIpWS/UEGCwA35sFQ+eOrhG0G4=;
 b=b7BCS4CYV32u3+7M3iBxs+XuWxwRyvmuysrZRarM5M+zawUTJLgRPPN64XJTst68bb2DBc
 EvMSaAVal40YwUUorvgl+lK5eF3jp8cV0YEEZjaJe3Fcid7xhJqaTXimnSrncUFx7Ein6v
 snNWyMGxzyA4MoWu0WtikyG29EjL9e0Eu/3n25qdoZiIzvsBpUSQas6yCQZLveOUyMuGX7
 nHDH7Kq86ZFV4g0fY851VbHaXxYCezQ3aRq2AAP/FSGlp/w/8kDXHrQ+XHyHznvy0w56A8
 9wcg9RhEZ6/qQNgk2GyKk1K+ECOJRcAlpFdZGVsAqjgcs8YHzeGd3k0Mcxq81w==
References: <20260902083450.2348-1-douyufan@picoheart.com> <d48e5c92-f666-44e0-8375-9772d95065b5@hisilicon.com>
To: "Jie Zhan" <zhanjie9@hisilicon.com>
Message-Id: <37731989-e1f1-4dc9-944d-2544ce8e9302@picoheart.com>
Mime-Version: 1.0
Content-Language: en-US
Received: from [172.16.155.39] ([120.234.49.250]) by smtp.feishu.cn with ESMTPS; Mon, 07 Sep 2026 21:17:16 +0800
From: "Yicong Yang" <yang.yicong@picoheart.com>
In-Reply-To: <d48e5c92-f666-44e0-8375-9772d95065b5@hisilicon.com>
X-Lms-Return-Path: <lba+26a9eb95d+658f39+lists.infradead.org+yang.yicong@picoheart.com>
Subject: Re: [PATCH] ACPI: RISC-V: CPPC: Implement cpc_read_ffh_fb_ctrs()
Date: Mon, 7 Sep 2026 21:17:14 +0800
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
User-Agent: Mozilla Thunderbird
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_061725_439196_5EEEAA73 
X-CRM114-Status: GOOD (  19.38  )
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
Cc: geshijian@picoheart.com, yuchao.46@picoheart.com, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, yang.yicong@picoheart.com, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Yufan Dou <douyufan@picoheart.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/7/26 7:29 PM, Jie Zhan wrote:
> 
> 
> On 9/2/2026 4:34 PM, Yufan Dou wrote:
>> On RISC-V, each cpc_read_ffh() for a CSR-type FFH register sends a
>> separate IPI to the target hart via smp_call_function_single().
>> cppc_get_perf_ctrs() therefore samples the delivered and reference
>> counters in two separate IPIs, at two different instants. The skew
>> between the two sampling points distorts the delivered/reference
>> ratio and thus the frequency reported by cpufreq.
>>
>> Implement the cpc_read_ffh_fb_ctrs() hook to read both CSR counters
>> back-to-back in a single IPI, which narrows the sampling window to a
>> few instructions and halves the number of cross-CPU calls. This
>> improves the accuracy of the reported frequency in the same way as
>> the arm64 implementation of the hook, which reads both AMU counters
>> in a single counters_read_on_cpu() call.
>>
>> SBI-type FFH registers still fall back to individual reads, since
>> pairing them would not reduce the number of SBI calls on the target
>> hart.
>>
>> Testing was performed while CPU1 was kept busy with:
>>
>>   # stress-ng --cpu 1 --taskset 1
>>
>> On a CPU with cpuinfo_max_freq of 3000000 kHz:
>>
>> Before:
>>
>>   Maximum observed cpuinfo_cur_freq: 3201369 kHz
>>   Maximum observed error:            +201369 kHz (+6.71%)
>>
>> After:
>>
>>   Maximum observed cpuinfo_cur_freq: 3009646 kHz
>>   Maximum observed error:              +9646 kHz (+0.32%)
>>
>> The maximum observed error is reduced by 95.2%.
> Glad to see that works for RISC-V as well.
>>
>> Signed-off-by: Yufan Dou <douyufan@picoheart.com>
>> ---
>>  drivers/acpi/riscv/cppc.c | 47 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
>> index 42c1a9052470..2ca98fa69e9a 100644
>> --- a/drivers/acpi/riscv/cppc.c
>> +++ b/drivers/acpi/riscv/cppc.c
>> @@ -85,6 +85,20 @@ static void cppc_ffh_csr_write(void *write_data)
>>  	data->ret.error = -EINVAL;
>>  }
>>  
>> +struct sbi_cppc_fb_ctrs_data {
>> +	struct sbi_cppc_data first;
>> +	struct sbi_cppc_data second;
>> +};
>> +
>> +static void cppc_ffh_csr_read_fb_ctrs(void *read_data)
>> +{
>> +	struct sbi_cppc_fb_ctrs_data *data = read_data;
>> +
>> +	cppc_ffh_csr_read(&data->first);
>> +	if (!data->first.ret.error)
>> +		cppc_ffh_csr_read(&data->second);
>> +}
>> +
>>  /*
>>   * Refer to drivers/acpi/cppc_acpi.c for the description of the functions
>>   * below.
>> @@ -125,6 +139,39 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
>>  	return -EINVAL;
>>  }
>>  
>> +int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
>> +			 struct cpc_reg *reg2, u64 *val2)
>> +{
>> +	struct sbi_cppc_fb_ctrs_data data;
>> +	int ret;
>> +
>> +	if (WARN_ON_ONCE(irqs_disabled()))
>> +		return -EPERM;
> AFAICS, this may cause CPPC FIE to constantly fail to read counters because
> FIE runs in hardirq context.

I suppose it's mainly due to the smp_call_function_single() cannot work
with irqs_disabled().

seems we need to do the similar handling like arm64's
counters_read_on_cpu() - read the counters locally when irqs_disabled()
if local cpu is the target cpu.

so is cpc_read_ffh() of riscv. but I suppose this should be a fix of below
commit, as it were in the kthread for FIE...
997c021abc6e ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs")

> 
> Any test on CPPC FIE?
>> +
>> +	/* Only CSR counters can be paired within a single IPI. */
>> +	if (FFH_CPPC_TYPE(reg1->address) != FFH_CPPC_CSR ||
>> +	    FFH_CPPC_TYPE(reg2->address) != FFH_CPPC_CSR)
>> +		return -EOPNOTSUPP;
>> +
>> +	data.first.reg = FFH_CPPC_CSR_NUM(reg1->address);
>> +	data.second.reg = FFH_CPPC_CSR_NUM(reg2->address);
>> +
>> +	ret = smp_call_function_single(cpu, cppc_ffh_csr_read_fb_ctrs,
>> +				       &data, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (data.first.ret.error)
>> +		return data.first.ret.error;
>> +	if (data.second.ret.error)
>> +		return data.second.ret.error;
>> +
>> +	*val1 = data.first.ret.value;
>> +	*val2 = data.second.ret.value;
>> +
>> +	return 0;
>> +}
>> +
>>  int cpc_write_ffh(int cpu, struct cpc_reg *reg, u64 val)
>>  {
>>  	struct sbi_cppc_data data;
>>
>> base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
