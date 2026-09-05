Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6B0C624D6
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVwKf07b76P4rl3zggZ2vsoiYtd/M9jokhqBS6IWqhE=; b=v4VQMHQ2uDitxz
	6lIhx+mSeV1+2TmmVqOADklfJPtTCePusBidejFpTNJ7q1A1WMwIFUiUjSAdHRu0+LmFJMTUODzF2
	RnrUrhYGdFc/EvHD0UbjMVBN1UBTmB2+me3nEsdGx+mkoy59+2+HarXsJdkBBRURhLJAU5/S7eC7q
	3A9ZNuTApR0GFIZzhhaqdUtsVhl8B1KBqPPemjsv6sb/UrjZaatBZv4+XL+ypBmYVidyNV2OFrtnU
	Z4am5nltWTZeb3MXOd80URDY+3NLpdc5BolxL+xTUc3yoMSn/b7FXcl5NRTUdDnKjYEzcz+8sReOt
	TsWiHHia641IioLF/XEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lUh-00000003q3H-0AcA;
	Sat, 05 Sep 2026 08:11:23 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lUc-00000003q2i-2sNE
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 08:11:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hcQxJ5dgHzKHMXc
	for <linux-riscv@lists.infradead.org>; Sat,  5 Sep 2026 16:10:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 672FE4056D
	for <linux-riscv@lists.infradead.org>; Sat,  5 Sep 2026 16:11:09 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgB32peczptqrBRUAw--.52213S2;
	Sat, 05 Sep 2026 16:11:09 +0800 (CST)
Message-ID: <793cb69d-8f5f-4f30-a634-638fd01094f4@huaweicloud.com>
Date: Sat, 5 Sep 2026 16:11:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 1/3] riscv, bpf: Remap BPF_REG_0 and
 RV_REG_TCC
Content-Language: en-US
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jiangfeng@kylinos.cn
Cc: bjorn@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
 pulehui@huawei.com, martin.lau@kernel.org, mason@kernel.org
References: <20260905070409.4141522-2-pulehui@huaweicloud.com>
 <27b33e8d655c23498a546736e58ef01721ddc18462164e181864295a3b01ef42@mail.kernel.org>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <27b33e8d655c23498a546736e58ef01721ddc18462164e181864295a3b01ef42@mail.kernel.org>
X-CM-TRANSID: gCh0CgB32peczptqrBRUAw--.52213S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFyrJw1rWw4kCry5Kw17KFg_yoW8XF45pr
	W0kF4fAr4vqw18Xw4xt3WrXr4rtw4vvw47CFy5Kr1rZFsIgryftF1rGF4Yvr98ZFn5Ca4U
	JFs0grn5Cw1kZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	j7l19UUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_011120_579955_B8B457F9 
X-CRM114-Status: GOOD (  11.50  )
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



On 2026/9/5 16:00, bot+bpf-ci@kernel.org wrote:
>> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
>> index e7378be171a9..aac128b9f0a4 100644
>> --- a/arch/riscv/net/bpf_jit_comp64.c
>> +++ b/arch/riscv/net/bpf_jit_comp64.c
> 
> [ ... ]
> 
>> @@ -1075,7 +1075,7 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
>>
>>   	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
>>   	if (save_ret)
>> -		stack_size += 16; /* Save both A5 (BPF R0) and A0 */
>> +		stack_size += 16; /* Save both T6 (BPF R0) and A0 */
> 
> Should the comment read "Save both T6 (BPF R0) and A0"? The patch updates
> regmap[BPF_REG_0] from RV_REG_A5 to RV_REG_T6, and the stack slot at
> retval_off - 8 is written via regmap[BPF_REG_0] in the save_ret block
> (emit_sd(RV_REG_FP, -(retval_off - 8), regmap[BPF_REG_0], ctx)), so the
> comment still naming "A5" contradicts the new mapping. After this series
> a5 becomes an argument register (the 6th BPF argument maps to a5 in a
> later commit), which makes "A5" actively misleading here since a reader
> could mistake this slot for argument spill space rather than R0/return
> value storage.

good cache, will update

> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33952202002


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
