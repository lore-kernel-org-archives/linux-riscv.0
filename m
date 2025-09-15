Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BEDCAC598
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cYHk69gRcWsYCJkQ42tJzlZhD6YftxTEu/o/4z5fr4=; b=ulntO/ut3X7xgS
	QinDPQBRvtcB6fGsvO3wGEyJeXFdygJlIDZZd8DslVUr7iX+tqUTC93IVLx6xjK7Mzas7mi68WCCM
	fGL5wVOKtyfhj/oe0HEkUeK7tqGzcUyDMSugjSPVt50umhgR9WGarxIKwhxqvwucv2GADP5gGyUxz
	aSvjad6dam0SeDrF8fQwV6NVYR2x+v+RBaHHJCEqoclu5g3/jNU7qbLv3886H5Md2rLXjoozJWdHp
	UHDs44nkOsjW2hAtBB3qClMy5bFIIusm9LwTwR/C938s2rEa8RMpGnKAUZjktrJ1ykvZjLa7+gs3M
	LpgPWU7T/Ya0EyTak0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5gv-00000003V9c-1GWk;
	Mon, 15 Sep 2025 09:40:09 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5gs-00000003V6z-127V
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 09:40:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4cQKkf1GYHzKHNCl
	for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 17:39:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id B94451A0BB3
	for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 17:39:54 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgBX82rn3sdoJxUmCg--.53822S2;
	Mon, 15 Sep 2025 17:39:53 +0800 (CST)
Message-ID: <a806d318-e51b-4e79-8d36-15d9a78af66b@huaweicloud.com>
Date: Mon, 15 Sep 2025 17:39:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 08/10] riscv, bpf: Add ex_insn_off and ex_jmp_off
 for exception table handling
To: Chris Mason <clm@meta.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Pu Lehui <pulehui@huawei.com>
References: <20250913155133.657930-1-clm@meta.com>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20250913155133.657930-1-clm@meta.com>
X-CM-TRANSID: _Ch0CgBX82rn3sdoJxUmCg--.53822S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw4rKr4fXrWkCFyrWr4xXrb_yoW5Xry8pF
	WUJ3s3AFWvgr1rJasrX3WUJw43Zan09rnrGrn5Wry3JFnIqF1IkF1fKayYya98Cry0gw1r
	ZFWqvryfCas3A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_024006_613575_C68A191F 
X-CRM114-Status: GOOD (  18.93  )
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



On 2025/9/13 23:51, Chris Mason wrote:
> On Sat, 19 Jul 2025 09:17:28 +0000 Pu Lehui <pulehui@huaweicloud.com> wrote:
> 
>> From: Pu Lehui <pulehui@huawei.com>
>>
>> Add ex_insn_off and ex_jmp_off fields to struct rv_jit_context so that
>> add_exception_handler() does not need to be immediately followed by the
>> instruction to add the exception table. ex_insn_off indicates the offset
>> of the instruction to add the exception table, and ex_jmp_off indicates
>> the offset to jump over the faulting instruction. This is to prepare for
>> adding the exception table to atomic instructions later, because some
>> atomic instructions need to perform zext or other operations.
>>
> 
> Hi everyone,
> 
> I've been working on some patch review automation, and I recently ran it on
> the bpf-next branch.  I don't know the verifier well enough to decide if this
> is a false positive, but Alexei asked me to kick off discussion, so:
> 
>> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
>> index 8e813809d3054..56b592af53a64 100644
>> --- a/arch/riscv/net/bpf_jit_comp64.c
>> +++ b/arch/riscv/net/bpf_jit_comp64.c
> 
> [ ... ]
> 
>> -static int emit_stx(u8 rd, s16 off, u8 rs, u8 size, struct rv_jit_context *ctx)
>> +static void emit_stx(u8 rd, s16 off, u8 rs, u8 size, struct rv_jit_context *ctx)
>>   {
>> -	int insns_start;
>> -
>>   	if (is_12b_int(off)) {
>> -		insns_start = ctx->ninsns;
>> +		ctx->ex_insn_off = ctx->ninsns;
>>   		emit_stx_insn(rd, off, rs, size, ctx);
>> -		return ctx->ninsns - insns_start;
>> +		ctx->ex_jmp_off = ctx->ex_jmp_off;

Hi Chris,

I'm not sure if I have misunderstood your intention, maybe just for 
talking about reviewing automation? But the code I checked in the 
bpf-next branch is inconsistent with yours. The code here in bpf-next is:

`ctx->ex_jmp_off = ctx->ninsns;`

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/riscv/net/bpf_jit_comp64.c?h=next-20250912#n553

> 
> Does this assignment leave ex_jmp_off uninitialized? Looking at emit_ldx()
> and emit_st(), this should probably be "ctx->ex_jmp_off = ctx->ninsns;" to
> match the pattern. Without proper initialization, add_exception_handler()
> might use stale offset values when creating exception table entries for
> the is_12b_int() code path in emit_stx().
> 
>> +		return;
>>   	}
>>   
>>   	emit_imm(RV_REG_T1, off, ctx);
>>   	emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
>> -	insns_start = ctx->ninsns;
>> +	ctx->ex_insn_off = ctx->ninsns;
>>   	emit_stx_insn(RV_REG_T1, 0, rs, size, ctx);
>> -	return ctx->ninsns - insns_start;
>> +	ctx->ex_jmp_off = ctx->ninsns;
>>   }
> 
> -chris


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
