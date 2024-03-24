Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC79C54E67
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2024 02:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jiZi9N0jM9HzHWlCD04AN5mlj4OWf86xejdRNgzZznc=; b=EiUa6RLdU2hFxn
	YjqFzPeZcke1pzLOGx8b9b6WwWQRdBmcZw6UDnojLjCQ6xQy35Da+hVxKKdgQiJ2PqneWjaVUFVLu
	Y9tReTAo5vRPFoJZYo9/TpPcuMVJ50fkN4+RFAhR73pB6v8zym8uOlw+tErSIruisJl8zjaZAPGsJ
	AK9Ma1brxkUSGzU8YV2leGPo5OifftdYJdoSNvqpU5PneGzgzyhWj58hFg6kAVJAd7NktQj0IqhvJ
	WSIDiVojNRs4qHBKcpaOH+o14CXoRl97l+nKIklS5TnqIWC/iWmZz8nfsOqTIowL4nVlXhQ1S8AE2
	vbmODC27uUzkXaaikFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roDmH-0000000Bfdl-3t6X;
	Sun, 24 Mar 2024 02:40:05 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roDmD-0000000Bfbq-3BD4
	for linux-riscv@lists.infradead.org;
	Sun, 24 Mar 2024 02:40:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V2KwN53PpztQWp;
	Sun, 24 Mar 2024 10:37:24 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C7CC1404F7;
	Sun, 24 Mar 2024 10:39:45 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sun, 24 Mar 2024 10:39:44 +0800
Message-ID: <6095ba3b-ffda-4ca7-9da4-d841782006a2@huawei.com>
Date: Sun, 24 Mar 2024 10:39:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/2] bpf,riscv: Implement bpf_addr_space_cast
 instruction
Content-Language: en-US
To: Puranjay Mohan <puranjay12@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240323154652.54572-1-puranjay12@gmail.com>
 <20240323154652.54572-3-puranjay12@gmail.com>
 <3e07fb21-da08-4183-8bd4-064b519c7ddb@huawei.com>
 <mb61pjzlslwp9.fsf@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <mb61pjzlslwp9.fsf@gmail.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_194002_434112_4E1BCF0C 
X-CRM114-Status: GOOD (  11.86  )
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



On 2024/3/24 0:49, Puranjay Mohan wrote:
> Pu Lehui <pulehui@huawei.com> writes:
> 
>> On 2024/3/23 23:46, Puranjay Mohan wrote:
>>> LLVM generates bpf_addr_space_cast instruction while translating
>> [snip]
>>>    
>>>    /* Convert from ninsns to bytes. */
>>> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
>>> index f51b832eafb6..3c389e75cb96 100644
>>> --- a/arch/riscv/net/bpf_jit_comp64.c
>>> +++ b/arch/riscv/net/bpf_jit_comp64.c
>>> @@ -1083,6 +1083,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>>>    	/* dst = src */
>>>    	case BPF_ALU | BPF_MOV | BPF_X:
>>>    	case BPF_ALU64 | BPF_MOV | BPF_X:
>>> +		if (BPF_CLASS(insn->code) == BPF_ALU64 && insn->off == BPF_ADDR_SPACE_CAST &&
>>> +		    insn->imm == 1U << 16) {
>>> +			emit_mv(RV_REG_T1, rs, ctx); > +			emit_zextw(RV_REG_T1, RV_REG_T1, ctx);
>> combine mv and zextw will be better
> 
> Do you suggest doing:
> 
> emit_zextw(RV_REG_T1, rs, ctx);
> 
> Will do it in next version.
> 
>>> +			emit_imm(rd, (ctx->user_vm_start >> 32) << 32, ctx);
>>> +			emit(rv_beq(RV_REG_T1, RV_REG_ZERO, 4), ctx);
>>> +			emit_or(RV_REG_T1, rd, RV_REG_T1, ctx);
>>> +			emit_mv(rd, RV_REG_T1, ctx);
>> ditto, but for or and mv
> 
> How would we combine or and mv?
> also, we have a beq above and in one case both or and mv should happen,
> but in other case only mv should happen.
> 
Okay, another branch is that t1 is zero, but not rd.

> Thanks,
> Puranjay

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
