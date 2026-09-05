Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DD2C624DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 09:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2JJ/kfwtPA99XKXA/XmaaxcmXe1GMdV0jPG7A6x40Q=; b=IOQwzQdH4rJwHD
	DdAe50SX4a4qh5OAfU5nuhcQw2U8xbPrjx/n5JRplDskXk83MvbMSbe5doqb5R1AdXkMCoY9A8fa6
	VcAhiiP4m7dDugGpkFL6PJF68m2BOym/vczd8WAV2kaXRs0uTIGd/Yb28lWiaCfPSPAcpWtYhxRgK
	oYngtyrthVDBlhiINGEENMcy5FNfq5m3rCDrczw4uUvLeGFeqQa+vMion13/fOCDsdXNbfG78nMZs
	NsyndwdwFeNKtpCpR9ShuqDtce2Yhe/xLLjGWU8ThSWj290xSbXQcV9p3EiCdEWcFdrJreksUBDS0
	sJzbKMHqzLQb/YY34nGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2n8L-00000003xPj-3ZBw;
	Sat, 05 Sep 2026 09:56:25 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2n8I-00000003xOx-3hP8
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 09:56:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hcTGm3gqnzYQtwW
	for <linux-riscv@lists.infradead.org>; Sat,  5 Sep 2026 17:55:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id A04B340574
	for <linux-riscv@lists.infradead.org>; Sat,  5 Sep 2026 17:56:14 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgB3IpA955tqJERdAw--.352S2;
	Sat, 05 Sep 2026 17:56:14 +0800 (CST)
Message-ID: <5bbd9eda-96e9-4cc4-883d-9bda93bea2b3@huaweicloud.com>
Date: Sat, 5 Sep 2026 17:56:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 1/3] riscv, bpf: Remap BPF_REG_0 and
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
References: <20260905085857.14143-2-pulehui@huaweicloud.com>
 <f7ac0b75cec70f36753ef48c97ffdca950d7c92632a74aa24187b9c076b7f115@mail.kernel.org>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <f7ac0b75cec70f36753ef48c97ffdca950d7c92632a74aa24187b9c076b7f115@mail.kernel.org>
X-CM-TRANSID: gCh0CgB3IpA955tqJERdAw--.352S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF1kCw1fZw48Kr1DXw1xAFb_yoW5GrWDpw
	47CrnxJrWvga1rCry8KF1kXa1Skw40g3ZrCrySkrW5Jr9Fgr95JanFqw4Yy3s5CrWF9r4F
	yFn0v3ySva1DArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	bAw3UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_025623_282918_ED417199 
X-CRM114-Status: GOOD (  12.53  )
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


On 2026/9/5 17:42, bot+bpf-ci@kernel.org wrote:
>> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
>> index e7378be171a9..fc1c8c5480b6 100644
>> --- a/arch/riscv/net/bpf_jit_comp64.c
>> +++ b/arch/riscv/net/bpf_jit_comp64.c
>> @@ -23,11 +23,11 @@
>>   /* fentry and TCC init insns will be skipped on tailcall */
>>   #define RV_TAILCALL_OFFSET ((RV_FENTRY_NINSNS + 1) * 4)
>>
>> -#define RV_REG_TCC RV_REG_A6
>> +#define RV_REG_TCC RV_REG_T5
>>   #define RV_REG_ARENA RV_REG_S7 /* For storing arena_vm_start */
>>
>>   static const int regmap[] = {
>> -	[BPF_REG_0] =	RV_REG_A5,
>> +	[BPF_REG_0] =	RV_REG_T6,
>>   	[BPF_REG_1] =	RV_REG_A0,
>>   	[BPF_REG_2] =	RV_REG_A1,
>>   	[BPF_REG_3] =	RV_REG_A2,
> 
> This isn't a bug, but does moving BPF_REG_0 to t6 affect code density?
> arch/riscv/net/bpf_jit.h:is_creg() only accepts fp, s1, and a0-a5 for
> RVC-compressible forms. With CONFIG_RISCV_ISA_C, every emitter that gates
> on is_creg() now falls back to 4-byte instructions whenever BPF R0 is the
> destination or base register. Since R0 holds return values and helper
> results, could this measurably grow JIT image size for R0-heavy code?

This is expected. The bpf prog image size growth is expected to be 
negligible, and it is a necessary trade-off to free up registers for the 
calling convention.

> 
> The changelog explains why a5 and a6 needed to be freed, but it doesn't
> mention why t6 and t5 were chosen. Could a sentence be added about the
> register selection rationale, particularly since t4 appears unused by
> the JIT?

It's fine, let's mention here. We prefer caller-saved registers that are 
unused both now and going forward.

> 
>> @@ -47,13 +47,13 @@ static const int pt_regmap[] = {
>>   	[RV_REG_A2] = offsetof(struct pt_regs, a2),
>>   	[RV_REG_A3] = offsetof(struct pt_regs, a3),
>>   	[RV_REG_A4] = offsetof(struct pt_regs, a4),
>> -	[RV_REG_A5] = offsetof(struct pt_regs, a5),
>>   	[RV_REG_S1] = offsetof(struct pt_regs, s1),
>>   	[RV_REG_S2] = offsetof(struct pt_regs, s2),
>>   	[RV_REG_S3] = offsetof(struct pt_regs, s3),
>>   	[RV_REG_S4] = offsetof(struct pt_regs, s4),
>>   	[RV_REG_S5] = offsetof(struct pt_regs, s5),
>>   	[RV_REG_T0] = offsetof(struct pt_regs, t0),
>> +	[RV_REG_T6] = offsetof(struct pt_regs, t6),
>>   };
> 
> [ ... ]
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33956847598


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
