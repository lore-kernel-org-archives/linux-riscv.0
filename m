Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA16CD98DA
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 01:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2WO6x/uGkZv1Rh49MO1+OiA3U8XOGokJSptxYPRCBw=; b=HrqtiGhYXBBC2F
	DYZYVbfsWMnr/qYQoS1XhQVRgXVAWW/gyEU6qumyH2MKUjpJ+zi/63w5Fp+utI6RidWEypGXNhkBl
	iOs/Ufs8EKIqrZD1gWRxHY114kl4v01ohXdMC8C08DF2TSgsKrtCazO4Ezg3SbramK+PxCUaAG2EX
	Bp7JGj1oHxLcgp0oVVoRQKpNJRCF2D9foJcH5lwnvXky1PZgQKIqnxATg2dVd2+Kv6OHMFgIyLRNQ
	9fKj+ymvmkpvKp0hiUv+hue+0k5w+zrg2YN9Aq/lULP7FLfLR5LWwvuNhf/mF4afHvdTBme7DfVgD
	AJ0cXBHiLBkevIbqvGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIoF-0000000F4Ys-0YXm;
	Tue, 16 Jun 2026 01:41:47 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZIoC-0000000F4Xi-0XUS
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 01:41:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wsOFNkJBmgV+d21//gqWitPG9/QNviG/zuToqCNtEVM=;
	b=E9E2RAsaJ94APIHxGlkEkQt88JFU0JVTVH93EDXbzItkhDgzOJiw8t82twD0tOvOt8qPc3TqM
	MXrR8xwV+A1BBreYcFNG7+9MW8CQtsbjLFV3Tr8r1OR/ZZbEHzea76B977JaYxh4fijaWo526m+
	Hh8/Zior8DUaB+ls431ixjY=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gfTyt1wpDz1cyt0;
	Tue, 16 Jun 2026 09:33:26 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id C0F25405D0;
	Tue, 16 Jun 2026 09:41:22 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 16 Jun
 2026 09:41:21 +0800
Message-ID: <216ee1df-2945-4266-9c70-ebcd36faeb7f@huawei.com>
Date: Tue, 16 Jun 2026 09:41:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 0/3] riscv, bpf: Fix signed operations and add
 32 bit atomics
Content-Language: en-US
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
	<memxor@gmail.com>, <luke.r.nels@gmail.com>, <xi.wang@gmail.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
	<jolsa@kernel.org>, <alex@ghiti.fr>, <jserv@ccns.ncku.edu.tw>,
	<eleanor15x@gmail.com>, <marscheng@google.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260511221648.3251464-1-visitorckw@gmail.com>
 <ajAlwK990NFUAMwq@google.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <ajAlwK990NFUAMwq@google.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_184144_681009_5AE44153 
X-CRM114-Status: GOOD (  16.16  )
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



On 2026/6/16 0:18, Kuan-Wei Chiu wrote:
> Hi,
> 
> On Mon, May 11, 2026 at 10:16:45PM +0000, Kuan-Wei Chiu wrote:
>> Fix miscompiled signed operations and expands 32 bit atomic support in
>> the RV32 BPF JIT.
>>
>> The current implementation ignores the instruction offset field used by
>> the bpf instruction set to specify BPF_SDIV/BPF_SMOD and BPF_MOVSX.
>> This causes these operations to be treated as unsigned or
>> zero-extended, leading to test_bpf failures. Fix this by checking the
>> offset and emitting the correct instructions.
>>
>> Additionally, we leverage the mandatory A extension to natively support
>> 32 bit bpf atomics (and, or, xor, xchg) by mapping them directly to
>> amo*.w instructions. BPF_CMPXCHG continues to fall back to the
>> interpreter.
>>
>> As a result, test_bpf.ko now runs with 0 failures, and the total number
>> of successfully JIT'ed test cases increases from 843 to 902.
> 
> Is there anything else I need to do for this patchset to land?

Hi Kuan-wei, it seems Luke and Xi haven't been as active in the 
community for a while, I'll make time to cover the review and testing 
for this.

Regards,
Lehui

> 
> Regards,
> Kuan-wei
> 
>> ---
>> - Add missing Fixes tags.
>> - Fix memory ordering by emitting aq=1, rl=1
>>
>> Kuan-Wei Chiu (3):
>>    riscv, bpf: Fix support for BPF_SDIV and BPF_SMOD in RV32 JIT
>>    riscv, bpf: Fix support for BPF_MOVSX in RV32 JIT
>>    riscv, bpf: Add 32 bit atomic operations to RV32 JIT
>>
>>   arch/riscv/net/bpf_jit_comp32.c | 101 +++++++++++++++++++++++++++-----
>>   1 file changed, 85 insertions(+), 16 deletions(-)
>>
>> -- 
>> 2.54.0.563.g4f69b47b94-goog
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
