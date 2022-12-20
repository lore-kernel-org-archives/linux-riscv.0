Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79395C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 02:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/GLomzvctObIR1I3A3lmjW5D15TvfUpfa43rieH/i0=; b=tYeKcvZOxd/ixy
	gWytwS1xDAo2FbnSIOCl5RXGma0r7b/88RTAxmllhvzDK90pekVxNVAeRdtNAEzxt0O4RPOcuhkDq
	Ao3hgeNN5OfYvawYPHwOvDTmy8kG+uUvgnO4nMXp8bUAbFTs0piLiQIcvju9m7Ivv9S2wNnDUIxxe
	r0Z7ysp4OdDf7SkoAc+gIrIYHM8nYALJ4it/vuEbcpnDQwh/whBiHEwHmva0F1RwuZ2z3ehAsi+uW
	mNj5jnJpwxKWnGbInv80PoI54/387PYEdKmFuIVEx/leKRibKHgf3Rn/ltHMoJrz5E4Q3Tx/0s2HG
	NWUXWbh0eD0vqGvF5pQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7SQv-007KZu-KV; Tue, 20 Dec 2022 02:32:45 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7SQr-007KKX-VX
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 02:32:44 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NbgYx6xz5zJqV7;
	Tue, 20 Dec 2022 10:31:33 +0800 (CST)
Received: from [10.67.111.192] (10.67.111.192) by
 kwepemi500013.china.huawei.com (7.221.188.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 20 Dec 2022 10:32:32 +0800
Message-ID: <a2bf7ed9-4977-608c-d5a5-8ee6a520cf52@huawei.com>
Date: Tue, 20 Dec 2022 10:32:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH RESEND bpf-next 1/4] bpf: Rollback to text_poke when
 arch not supported ftrace direct call
Content-Language: en-US
To: Pu Lehui <pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Pu Lehui
	<pulehui@huawei.com>
References: <20221220021319.1655871-1-pulehui@huaweicloud.com>
 <20221220021319.1655871-2-pulehui@huaweicloud.com>
From: Xu Kuohai <xukuohai@huawei.com>
In-Reply-To: <20221220021319.1655871-2-pulehui@huaweicloud.com>
X-Originating-IP: [10.67.111.192]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_183242_238111_71B7E3D1 
X-CRM114-Status: GOOD (  14.41  )
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

On 12/20/2022 10:13 AM, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> The current bpf trampoline attach to kernel functions via ftrace direct
> call API, while text_poke is applied for bpf2bpf attach and tail call
> optimization. For architectures that do not support ftrace direct call,
> text_poke is still able to attach bpf trampoline to kernel functions.
> Let's relax it by rollback to text_poke when architecture not supported.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   kernel/bpf/trampoline.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> index d6395215b849..386197a7952c 100644
> --- a/kernel/bpf/trampoline.c
> +++ b/kernel/bpf/trampoline.c
> @@ -228,15 +228,11 @@ static int modify_fentry(struct bpf_trampoline *tr, void *old_addr, void *new_ad
>   static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
>   {
>   	void *ip = tr->func.addr;
> -	unsigned long faddr;
>   	int ret;
>   
> -	faddr = ftrace_location((unsigned long)ip);
> -	if (faddr) {
> -		if (!tr->fops)
> -			return -ENOTSUPP;
> +	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS) &&
> +	    !!ftrace_location((unsigned long)ip))
>   		tr->func.ftrace_managed = true;
> -	}
>

After this patch, a kernel function with true trace_location will be patched
by bpf when CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS is disabled, which means
that a kernel function may be patched by both bpf and ftrace in a mutually
unaware way. This will cause ftrace and bpf_arch_text_poke to fail in a
somewhat random way if the function to be patched was already patched
by the other.

>   	if (bpf_trampoline_module_get(tr))
>   		return -ENOENT;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
