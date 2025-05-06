Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537E8C3ABBC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtdhGVELE+Mq3AzSgQtNEiToffZkBg/hvyOJwk8RKu0=; b=Vtq0oVyC8hGadV
	hyu+4qUsnWRRWYdYfGecXTV3Q5okjs/MdfirXBFfWND7oQjGQQ3E6NvuXjeEkTuLy/iroKQxPJaeY
	cHkwsci/5HPGL2gAYWfX6hhNLzKR7XaQoqzeUDOMYlBpZlXXOL95A5HTJ3uZqyL0RkGTvXN2l1myH
	lEiML6VkTNETn/Rb2CmoFku34TiW19gBPVwjLyWY492OGSQojr6/Ra8sq5LykfZ1RwhcwRJewv24J
	/RTyUKK9leeWGky2jMnnWRPsYrcmyGtGlVaaifqAWHSrFV2TNfgH5X0+YPu/NsIjL5ZPSb3tm85FP
	O8aO0N1M49LUA6UZmglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMLO-0000000Ct8O-0Fpu;
	Tue, 06 May 2025 17:44:38 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIu3-0000000CFAO-3xhw
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 14:04:13 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZsKqh0LNYz2TS2d;
	Tue,  6 May 2025 22:03:28 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F554140203;
	Tue,  6 May 2025 22:04:01 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 6 May 2025 22:03:59 +0800
Message-ID: <83698e73-3b47-4cdc-af50-c4f3ca479b7a@huawei.com>
Date: Tue, 6 May 2025 22:03:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/8] bpf/verifier: Handle BPF_LOAD_ACQ
 instructions in insn_def_regno()
Content-Language: en-US
To: Peilin Ye <yepeilin@google.com>, <bpf@vger.kernel.org>
CC: <linux-riscv@lists.infradead.org>, Andrea Parri <parri.andrea@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko
	<mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Josh Don
	<joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu
	<neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
References: <cover.1745970908.git.yepeilin@google.com>
 <2c1ec0e60974f8438730dc5126f9ed986b32a3f6.1745970908.git.yepeilin@google.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <2c1ec0e60974f8438730dc5126f9ed986b32a3f6.1745970908.git.yepeilin@google.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_070412_304868_9E336FFE 
X-CRM114-Status: GOOD (  12.85  )
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



On 2025/4/30 8:50, Peilin Ye wrote:
> In preparation for supporting BPF load-acquire and store-release
> instructions for architectures where bpf_jit_needs_zext() returns true
> (e.g. riscv64), make insn_def_regno() handle load-acquires properly.
> 
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>   kernel/bpf/verifier.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 54c6953a8b84..6435ea23fee4 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -3649,13 +3649,16 @@ static int insn_def_regno(const struct bpf_insn *insn)
>   	case BPF_ST:
>   		return -1;
>   	case BPF_STX:
> -		if ((BPF_MODE(insn->code) == BPF_ATOMIC ||
> -		     BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) &&
> -		    (insn->imm & BPF_FETCH)) {
> +		if (BPF_MODE(insn->code) == BPF_ATOMIC ||
> +		    BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) {
>   			if (insn->imm == BPF_CMPXCHG)
>   				return BPF_REG_0;
> -			else
> +			else if (insn->imm == BPF_LOAD_ACQ)
> +				return insn->dst_reg;
> +			else if (insn->imm & BPF_FETCH)
>   				return insn->src_reg;
> +			else
> +				return -1;
>   		} else {
>   			return -1;
>   		}

How about simplify like this:
```
static int insn_def_regno(const struct bpf_insn *insn)
{
         switch (BPF_CLASS(insn->code)) {
         case BPF_JMP:
         case BPF_JMP32:
         case BPF_ST:
                 return -1;
         case BPF_STX:
                 if (BPF_MODE(insn->code) == BPF_ATOMIC ||
                     BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) {
                         if (insn->imm == BPF_CMPXCHG)
                                 return BPF_REG_0;
                         else if (insn->imm == BPF_LOAD_ACQ)
                                 return insn->dst_reg;
                         else if (insn->imm & BPF_FETCH)
                                 return insn->src_reg;
                 }
                 return -1;
         default:
                 return insn->dst_reg;
         }
}
```

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
