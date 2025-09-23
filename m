Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45393CAC5A7
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scW0z/ltlu9Lv2Tpe8na6lefMhAPC1vLo1mXCQk1e+Y=; b=QatEpCUnDHvpmt
	4Dh//a3/PKoKd3+t5GmlF2MN1YqtjQqETbq4IuMcr/kG8oNNLHQ8U0DEZH0tsqRqjjGh4tuZsfGNN
	NCiGtIxGpAEgwPsWOYhl+BSpu36epIciF1kuWzOwb4yFFN91SFn7Ic2M82G7vU7TQ6HsgxDiuJgvB
	cxs8UAJqj9JPj5NzDqUyIhJAOhqcVYfsueDLTqHNOEEz4c6bLY7vY//jmzIysh0HNn2px+3mmYZVs
	fcLEEUaHwGtFMFLYfTGVu6O8K7IxRhF5lZq+SMr26nxwS86KbfjsMLKHFUPWkt5nY2AYzfTgUMJ11
	RWj+5ZPlTnXcwBJp/t5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xY4-0000000ChOA-1zcw;
	Tue, 23 Sep 2025 07:34:52 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xY1-0000000ChMV-2S3y
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 07:34:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cWBYN6W1lztTWp;
	Tue, 23 Sep 2025 15:33:44 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id CF8AA1800B1;
	Tue, 23 Sep 2025 15:34:37 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 23 Sep 2025 15:34:36 +0800
Message-ID: <97c8e410-5482-42cc-85e1-5c22bfd1d192@huawei.com>
Date: Tue, 23 Sep 2025 15:34:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] riscv: bpf: Fix uninitialized symbol 'retval_off'
Content-Language: en-US
To: Chenghao Duan <duanchenghao@kylinos.cn>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <bjorn@kernel.org>,
	<puranjay@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>
CC: <martin.lau@linux.dev>, <eddyz87@gmail.com>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <john.fastabend@gmail.com>, <kpsingh@kernel.org>,
	<sdf@fomichev.me>, <haoluo@google.com>, <jolsa@kernel.org>, <alex@ghiti.fr>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250922062244.822937-1-duanchenghao@kylinos.cn>
 <20250922062244.822937-2-duanchenghao@kylinos.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20250922062244.822937-2-duanchenghao@kylinos.cn>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_003449_806024_7FEA779F 
X-CRM114-Status: GOOD (  14.39  )
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



On 2025/9/22 14:22, Chenghao Duan wrote:
> In the __arch_prepare_bpf_trampoline() function, retval_off is only
> meaningful when save_ret is true, so the current logic is correct.
> However, in the original logic, retval_off is only initialized under
> certain conditions; for example, in the fmod_ret logic, the compiler is
> not aware that the flags of the fmod_ret program (prog) have set
> BPF_TRAMP_F_CALL_ORIG, which results in an uninitialized symbol
> compilation warning.
> 
> So initialize retval_off unconditionally to fix it.
> 
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>   arch/riscv/net/bpf_jit_comp64.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 9883a55d61b5..8475a8ab5715 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -1079,10 +1079,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
>   	stack_size += 16;
>   
>   	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
> -	if (save_ret) {
> +	if (save_ret)
>   		stack_size += 16; /* Save both A5 (BPF R0) and A0 */
> -		retval_off = stack_size;
> -	}
> +	retval_off = stack_size;
>   
>   	stack_size += nr_arg_slots * 8;
>   	args_off = stack_size;

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
