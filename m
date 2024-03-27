Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ECDC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1WKejqdRKr5dbhskIpUMh/8jC3pH/v54A1V5C0Z0Kk=; b=r0v9D6bP7mcG3F
	MbaKP0Q05Da0/Ec95uYwUG8LYfVvhopK/2U/om44yjB8lNz5yYFfXXccQtw1wQpNTQ9GmaEujaooM
	GSX8R+lLC/54oeVGzvbdTcu7vOTBpcTQbWusiOhnI3znzAZTsevW+2Gwa4E3oXzN+ePUUgTzH4TuI
	Ts0WMWsRCyy74UpxD6Ut3j8gsjQS+6g7eJ8ILqDbJdtnkHZDt7OrrtRkoWKvhYNrzRvIb+hM5mMQ4
	S9/KCn92uWBI1ibszAyhsgKei9j7H46iPdF2GzPEQmRCBoLeLApGOSluF/HeDjTTU+ct5Z4uFqxPk
	iNNvbkYRpzrp8e0Ev8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpNhJ-00000007obT-135L;
	Wed, 27 Mar 2024 07:27:45 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpNhF-00000007oYm-00qK
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 07:27:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4V4JCd2Nvxz4f3p1J
	for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 15:27:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 7724B1A017A
	for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 15:27:33 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgAn555jygNmnhRfIA--.55082S2;
	Wed, 27 Mar 2024 15:27:33 +0800 (CST)
Message-ID: <cea8a4c6-0614-451f-b878-4f9af62cf209@huaweicloud.com>
Date: Wed, 27 Mar 2024 15:27:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 1/2] bpf,riscv: Implement PROBE_MEM32 pseudo
 instructions
Content-Language: en-US
To: Puranjay Mohan <puranjay12@gmail.com>
References: <20240326224943.86912-1-puranjay12@gmail.com>
 <20240326224943.86912-2-puranjay12@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20240326224943.86912-2-puranjay12@gmail.com>
X-CM-TRANSID: _Ch0CgAn555jygNmnhRfIA--.55082S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1xCw1kuFWDWFyxCryfJFb_yoW8JFWDpa
	1jga1xX3s0qrs2yFyDJry2va4rAw4UCFnrWFy3tw18XrWaqrs3KF1UtF1ak3WYy3s3Z3y5
	JF4xurZFy3srWrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUFDGOUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_002741_440560_20039263 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
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



On 2024/3/27 6:49, Puranjay Mohan wrote:
> Add support for [LDX | STX | ST], PROBE_MEM32, [B | H | W | DW]
[SNIP]
>   	if (WARN_ON_ONCE(ctx->nexentries >= ctx->prog->aux->num_exentries))
> @@ -1539,6 +1547,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   	case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
>   	case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
>   	case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
> +	/* LDX | PROBE_MEM32: dst = *(unsigned size *)(src + S7 + off)*/

still some nits. please align, change S7 here to reg_arena.

> +	case BPF_LDX | BPF_PROBE_MEM32 | BPF_B:
> +	case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
> +	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
> +	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
[SNIP]
> +
> +		switch (BPF_SIZE(code)) {
> +		case BPF_B:
> +			if (is_12b_int(off)) {
> +				insns_start = ctx->ninsns;
> +				emit(rv_sb(rd, off, RV_REG_T1), ctx);
> +				insn_len = ctx->ninsns - insns_start;
> +				break;
> +			}
> +
> +			emit_imm(RV_REG_T2, off, ctx);
> +			emit_add(RV_REG_T2, RV_REG_T2, rd, ctx);
> +			insns_start = ctx->ninsns;
> +			emit(rv_sb(RV_REG_T2, 0, RV_REG_T1), ctx);
> +			insn_len = ctx->ninsns - insns_start;
> +
redundant blank.
> +			break;
> +
ditto.

Others, looks good to me.

Reviewed-by: Pu Lehui <pulehui@huawei.com>
Tested-by: Pu Lehui <pulehui@huawei.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
