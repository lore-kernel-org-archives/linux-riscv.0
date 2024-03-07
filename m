Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1856AC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 13:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:CC:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htPGGUPD5GZ4rgGTWKP3J202OcKML7nz2D5gBt5xUls=; b=qqewSWJ31GHLev
	Z3zgLH3vNcC1+7D/S/bxDp0S1gAzeltvLY1CW8YPlGYrDTUunD7Ey7suIwRU/ZqXW7JJaPm5n4/zJ
	ZF7sDlwZwkG/6qCJp5QKzaMbWxwXri9C91ydwZwD9UBuqsRJEZKngeWSjbh/OeqfkufuFlQJnAdx2
	66ycaaCZi+wu6jYeVI3EZXX2yk3yhlU2cISNCO0YaxGnL8EVcVQZHthzew2l2orA+q+Nvp3W/3YYx
	g+OCCZhWJ8XiFjZZXNGrmf0M3zAI4l9MC1DV3jXMe+Q9eIdfORkaUeWR8D1hrtzXSSsHfzrP3HAlc
	rQRS3EIRxYchWGeBe+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDwd-00000004mEB-1fxQ;
	Thu, 07 Mar 2024 13:37:59 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDwZ-00000004mAQ-29vX
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 13:37:57 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Tr9MK5mltz1vvq5;
	Thu,  7 Mar 2024 21:37:01 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B29B1A016C;
	Thu,  7 Mar 2024 21:37:42 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 7 Mar 2024 21:37:41 +0800
Message-ID: <6beb3f5a-5d72-4443-81bf-3c809b86f7e0@huawei.com>
Date: Thu, 7 Mar 2024 21:37:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/1] riscv64/cfi,bpf: Support kCFI + BPF on
 riscv64
Content-Language: en-US
To: Puranjay Mohan <puranjay12@gmail.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240303170207.82201-1-puranjay12@gmail.com>
 <20240303170207.82201-2-puranjay12@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook
	<keescook@chromium.org>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240303170207.82201-2-puranjay12@gmail.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_053755_805390_738C2116 
X-CRM114-Status: UNSURE (   4.81  )
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


On 2024/3/4 1:02, Puranjay Mohan wrote:
> The riscv BPF JIT doesn't emit proper kCFI prologues for BPF programs

[SNIP]

>   
> -void bpf_jit_build_prologue(struct rv_jit_context *ctx)
> +void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)

Not tracked in time. Some nits, although it has been merged. We don't 
need to add new parameters here since we can fetch prog in ctx. Others, 
it looks great.

>   {
>   	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
>   
> @@ -1740,6 +1749,9 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx)
>   
>   	store_offset = stack_adjust - 8;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
