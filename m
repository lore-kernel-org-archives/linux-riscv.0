Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDBAC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 13:27:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92EA66023D
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 13:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92EA66023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNXKbw9WvmRjc/gOnLunXWDUDhcd6dBbP5nlhZlM8ug=; b=VNUqkpK75ogCopPaWzweFxa+bw
	vYqkRNITKCEuGB+VeaVLOMA6N5GEI2HqjcI5SeIt2IS3dpN139b/ioRNraTS4DtK5aW8kG2k2nAp+
	iijDTHVeBYBGLRK+aR+bq8oeXchxIqiRTixvvHlRBI7e5eoHgi1QKcshZ5Fqizw5G0eUdvEyz1kxv
	OumLtV533ajZTrbvBCCxaW4ku4BjNBmPwV7WProTh+tE6S111XB/DEFcLIbNDguZFBokmlNFISUst
	hEtzfB79MA/f79n8iFrwTu78na+hVm7dIIm2D6oBDtfiZ9aagaMDF6ZPjAYsCXH7kRmj2sIBlkk3S
	ButDDpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfixJ-004yXR-ES; Wed, 27 Oct 2021 13:27:01 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfixF-004yUk-Ib
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 13:27:00 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HfTr45YthzbhN1;
 Wed, 27 Oct 2021 21:22:12 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 27 Oct 2021 21:26:40 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 27 Oct 2021 21:26:39 +0800
Subject: Re: [PATCH bpf-next,v3] riscv, bpf: Add BPF exception tables
To: Mark Rutland <mark.rutland@arm.com>
References: <20211027111822.3801679-1-tongtiangen@huawei.com>
 <20211027115043.GB54628@C02TD0UTHF1T.local>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song
 Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <bpf@vger.kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <8ad6338b-b02c-8488-c725-f522435c8916@huawei.com>
Date: Wed, 27 Oct 2021 21:26:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20211027115043.GB54628@C02TD0UTHF1T.local>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_062658_207050_345BD83A 
X-CRM114-Status: GOOD (  18.33  )
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



On 2021/10/27 19:50, Mark Rutland wrote:
> On Wed, Oct 27, 2021 at 11:18:22AM +0000, Tong Tiangen wrote:
>> When a tracing BPF program attempts to read memory without using the
>> bpf_probe_read() helper, the verifier marks the load instruction with
>> the BPF_PROBE_MEM flag. Since the riscv JIT does not currently recognize
>> this flag it falls back to the interpreter.
>>
>> Add support for BPF_PROBE_MEM, by appending an exception table to the
>> BPF program. If the load instruction causes a data abort, the fixup
>> infrastructure finds the exception table and fixes up the fault, by
>> clearing the destination register and jumping over the faulting
>> instruction.
>>
>> A more generic solution would add a "handler" field to the table entry,
>> like on x86 and s390.
>>
>> The same issue in ARM64 is fixed in:
>> commit 800834285361 ("bpf, arm64: Add BPF exception tables")
>
>> +#ifdef CONFIG_BPF_JIT
>> +int rv_bpf_fixup_exception(const struct exception_table_entry *ex, struct pt_regs *regs);
>> +#endif
>> +
>>  int fixup_exception(struct pt_regs *regs)
>>  {
>>  	const struct exception_table_entry *fixup;
>>
>>  	fixup = search_exception_tables(regs->epc);
>> -	if (fixup) {
>> -		regs->epc = fixup->fixup;
>> -		return 1;
>> -	}
>> -	return 0;
>> +	if (!fixup)
>> +		return 0;
>> +
>> +#ifdef CONFIG_BPF_JIT
>> +	if (regs->epc >= BPF_JIT_REGION_START && regs->epc < BPF_JIT_REGION_END)
>> +		return rv_bpf_fixup_exception(fixup, regs);
>> +#endif
>> +
>> +	regs->epc = fixup->fixup;
>> +	return 1;
>>  }
>
> As a heads-up, on the extable front, both arm64 and x86 are moving to
> having an enumerated "type" field to select the handler:
>
> x86:
>
>   https://lore.kernel.org/lkml/20210908132525.211958725@linutronix.de/
>
> arm64:
>
>   https://lore.kernel.org/linux-arm-kernel/20211019160219.5202-11-mark.rutland@arm.com/
>
> ... and going forwards, riscv might want to do likewise.
>
> Thanks,
> Mark.
> .
>

Thanks mark, I'm very interested in this change.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
