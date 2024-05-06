Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8F5C10F16
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8J1pl0c4d5Cas0Dv3jNkm9gsbDuFr+b7+xXuD18XH58=; b=bFV+Cp0usVr38L
	ghUl+eG4wgjgDFWsPW/Bt1h8BffSnIAAx65jnbG+xullYIkXhyOBCJEjV8w3z7dh+s4RJ3u1vUtIf
	MSawW5hGYBCcC5IEQa4cnmNAK7ZmVH7b+EWXiQfDJqVlLrdBrcfCHroz+pLBsrC0mYF34P9hv3MQu
	NlP/5eOC5Kj5/v4I2S8xZYY074+yvBtHSq7YqstaaZ7jHtoJEv/tHgnIyX6RpQPxxSQKazWUxUUCn
	TsIXVIrJ8UITRUrP3OKj6At63k7QNNiukDCZSaTzOM1UisAjfObq1tbxOcfcl+LcKGwb776hRe8TD
	oWZj6MeJ3wvVL4HIS5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40Q2-00000007tHT-05np;
	Mon, 06 May 2024 15:38:22 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40Px-00000007tEn-1eA9
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 15:38:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VY5893TxrzNw6Y;
	Mon,  6 May 2024 23:35:21 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 3AE2218007D;
	Mon,  6 May 2024 23:38:06 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 23:38:05 +0800
Message-ID: <5df237e2-5bfd-4f31-a168-abfbf7808822@huawei.com>
Date: Mon, 6 May 2024 23:38:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf] riscv, bpf: make some atomic operations fully ordered
To: Puranjay Mohan <puranjay@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, "Paul E. McKenney"
	<paulmck@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <puranjay12@gmail.com>
References: <20240505201633.123115-1-puranjay@kernel.org>
Content-Language: en-US
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240505201633.123115-1-puranjay@kernel.org>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_083817_973567_95297B36 
X-CRM114-Status: GOOD (  14.36  )
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



On 2024/5/6 4:16, Puranjay Mohan wrote:
> The BPF atomic operations with the BPF_FETCH modifier along with
> BPF_XCHG and BPF_CMPXCHG are fully ordered but the RISC-V JIT implements
> all atomic operations except BPF_CMPXCHG with relaxed ordering.
> 
> Section 8.1 of the "The RISC-V Instruction Set Manual Volume I:
> Unprivileged ISA" [1], titled, "Specifying Ordering of Atomic
> Instructions" says:
> 
> | To provide more efficient support for release consistency [5], each
> | atomic instruction has two bits, aq and rl, used to specify additional
> | memory ordering constraints as viewed by other RISC-V harts.
> 
> and
> 
> | If only the aq bit is set, the atomic memory operation is treated as
> | an acquire access.
> | If only the rl bit is set, the atomic memory operation is treated as a
> | release access.
> |
> | If both the aq and rl bits are set, the atomic memory operation is
> | sequentially consistent.
> 
> Fix this by setting both aq and rl bits as 1 for operations with
> BPF_FETCH and BPF_XCHG.
> 
> [1] https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
> 
> Fixes: dd642ccb45ec ("riscv, bpf: Implement more atomic operations for RV64")
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>   arch/riscv/net/bpf_jit_comp64.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index ec9d692838fc..fb5d1950042b 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -498,33 +498,33 @@ static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
>   		break;
>   	/* src_reg = atomic_fetch_<op>(dst_reg + off16, src_reg) */
>   	case BPF_ADD | BPF_FETCH:
> -		emit(is64 ? rv_amoadd_d(rs, rs, rd, 0, 0) :
> -		     rv_amoadd_w(rs, rs, rd, 0, 0), ctx);
> +		emit(is64 ? rv_amoadd_d(rs, rs, rd, 1, 1) :
> +		     rv_amoadd_w(rs, rs, rd, 1, 1), ctx);
>   		if (!is64)
>   			emit_zextw(rs, rs, ctx);
>   		break;
>   	case BPF_AND | BPF_FETCH:
> -		emit(is64 ? rv_amoand_d(rs, rs, rd, 0, 0) :
> -		     rv_amoand_w(rs, rs, rd, 0, 0), ctx);
> +		emit(is64 ? rv_amoand_d(rs, rs, rd, 1, 1) :
> +		     rv_amoand_w(rs, rs, rd, 1, 1), ctx);
>   		if (!is64)
>   			emit_zextw(rs, rs, ctx);
>   		break;
>   	case BPF_OR | BPF_FETCH:
> -		emit(is64 ? rv_amoor_d(rs, rs, rd, 0, 0) :
> -		     rv_amoor_w(rs, rs, rd, 0, 0), ctx);
> +		emit(is64 ? rv_amoor_d(rs, rs, rd, 1, 1) :
> +		     rv_amoor_w(rs, rs, rd, 1, 1), ctx);
>   		if (!is64)
>   			emit_zextw(rs, rs, ctx);
>   		break;
>   	case BPF_XOR | BPF_FETCH:
> -		emit(is64 ? rv_amoxor_d(rs, rs, rd, 0, 0) :
> -		     rv_amoxor_w(rs, rs, rd, 0, 0), ctx);
> +		emit(is64 ? rv_amoxor_d(rs, rs, rd, 1, 1) :
> +		     rv_amoxor_w(rs, rs, rd, 1, 1), ctx);
>   		if (!is64)
>   			emit_zextw(rs, rs, ctx);
>   		break;
>   	/* src_reg = atomic_xchg(dst_reg + off16, src_reg); */
>   	case BPF_XCHG:
> -		emit(is64 ? rv_amoswap_d(rs, rs, rd, 0, 0) :
> -		     rv_amoswap_w(rs, rs, rd, 0, 0), ctx);
> +		emit(is64 ? rv_amoswap_d(rs, rs, rd, 1, 1) :
> +		     rv_amoswap_w(rs, rs, rd, 1, 1), ctx);
>   		if (!is64)
>   			emit_zextw(rs, rs, ctx);
>   		break;

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
