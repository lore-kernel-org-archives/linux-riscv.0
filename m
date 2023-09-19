Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB569CD548F
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 07:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJQpC8hg7++6utUVNHkUMQhRnsUfle7GW/RAWNStDDM=; b=yMGiFKHumzl0Ls
	4L6QU21KJrwzNC2MO5FJFpzhhQ+5ks2qcD8h/+cI5fQbiIuBYM5pmLkcLwI2VtqZ3JK6vxpLsmKuc
	0YxoJCDXnB/XtgArkSRRya+izFD9EkOKY7x+RV2UaEiiiTAELah9BI2BdKzFUDub68xFT8RNWLBJJ
	DO/DG6Zx0gWlbZKKyJU6BPdCGltIUqsou2bagFCr6Cqz8w7FM/0sPIfQB4xQrcU+Ce7Nw1c6waZte
	JJEoKt4gaxF4cfUpNzqN/hsuirYwKRMCaAQAG+JXHYL7jCgvqa89WkH/SMNSgxkF2oyv1dJl6QiZI
	51505bSHm3hiqqTayAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVOV-00HHn1-36;
	Tue, 19 Sep 2023 07:43:39 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVOS-00HHkK-0B
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 07:43:38 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4RqYYh3VSYz4f3kFp
	for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 15:43:20 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgD3itobUQllqvpkAw--.22769S2;
	Tue, 19 Sep 2023 15:43:24 +0800 (CST)
Message-ID: <ed2be1b1-f556-42a5-878a-f3e499c18f2a@huaweicloud.com>
Date: Tue, 19 Sep 2023 15:43:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 4/6] riscv, bpf: Add necessary Zbb
 instructions
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <20230919035839.3297328-5-pulehui@huaweicloud.com>
 <20230919-a19c47b423c995826615a89e@fedora>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20230919-a19c47b423c995826615a89e@fedora>
X-CM-TRANSID: gCh0CgD3itobUQllqvpkAw--.22769S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4DGry8uFW7ZFWkurWruFg_yoW8Jw4xpF
	48GF45CrWvqrn7Gr9aqF18Wr15tF4Fqr13Gr47XrW8JFZFg345Krn5Gw1YgFn8uFyIkF1F
	vrWfWFn3CF4jvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280
	aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07UZ18PUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_004336_435623_A4DFD030 
X-CRM114-Status: GOOD (  11.59  )
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



On 2023/9/19 15:38, Conor Dooley wrote:
> On Tue, Sep 19, 2023 at 11:58:37AM +0800, Pu Lehui wrote:
>> From: Pu Lehui <pulehui@huawei.com>
>>
>> Add necessary Zbb instructions introduced by [0] to reduce code size and
>> improve performance of RV64 JIT. Meanwhile, a runtime deteted helper is
>> added to check whether the CPU supports Zbb instructions.
>>
>> Link: https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bitmanip-1.0.0-38-g865e7a7.pdf [0]
>> Suggested-by: Conor Dooley <conor@kernel.org>
> 
> Nah, you can drop this. It was just a review comment :)
> 
OK, will drop if have next

>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>> ---
>>   arch/riscv/net/bpf_jit.h | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
>> index 8e0ef4d08..4e24fb2bd 100644
>> --- a/arch/riscv/net/bpf_jit.h
>> +++ b/arch/riscv/net/bpf_jit.h
>> @@ -18,6 +18,11 @@ static inline bool rvc_enabled(void)
>>   	return IS_ENABLED(CONFIG_RISCV_ISA_C);
>>   }
>>   
>> +static inline bool rvzbb_enabled(void)
>> +{
>> +	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
> 
> This looks like it should work, thanks for changing it.
> 
> Cheers,
> Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
