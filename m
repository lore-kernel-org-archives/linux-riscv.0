Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2320C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 09:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kpn3ZoIErWduBbdzoqrueTTPwuXoCoVYl1IdL1omQaI=; b=pIlWhIr0avgvVJ
	WrOtZE17dZiFL8MBUYV6MrdqNPKssPv7C5NyIVsoaFgWrAN4jUFmfCCdbXQYfCXw89ZxlkuuJxBWt
	RQ7GkSslN2JUSRrRZmTLliMrr9sCbEHnqB4lQ53EBazTU9/h66mzSKMZh6IrGTAHYmdDRuQoMMoJ+
	+pJCDh+urZz50cTtRyBjw5wtgagzGMqv8IMuI1Ap8zXSzAFZZI/ah+dSOk4vBAOBt2gI43CpUHy7j
	4w/PTXt/r+eVsqwQUvmfraK56j45sFe3devaSMS74c3yrmKub9mOfuh59clQSXtP7tf6DORi0dMcg
	dqS/jqUhXoGz2iuA4IUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfEF-0000000Bcab-1caX;
	Tue, 16 Apr 2024 09:35:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfEB-0000000BcXP-2qKb;
	Tue, 16 Apr 2024 09:35:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VJf320VSzztRy8;
	Tue, 16 Apr 2024 17:32:46 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 33A07180080;
	Tue, 16 Apr 2024 17:35:37 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 16 Apr 2024 17:35:36 +0800
Message-ID: <39b55f13-69a1-401e-b87e-1040e33c9368@huawei.com>
Date: Tue, 16 Apr 2024 17:35:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/2] riscv, bpf: Fix incorrect runtime stats
To: Xu Kuohai <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>
CC: Ivan Babrou <ivan@cloudflare.com>, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
References: <20240416064208.2919073-1-xukuohai@huaweicloud.com>
 <20240416064208.2919073-3-xukuohai@huaweicloud.com>
Content-Language: en-US
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240416064208.2919073-3-xukuohai@huaweicloud.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_023547_926862_C451631F 
X-CRM114-Status: GOOD (  14.01  )
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


On 2024/4/16 14:42, Xu Kuohai wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
> 
> When __bpf_prog_enter() returns zero, the s1 register is not set to zero,
> resulting in incorrect runtime stats. Fix it by setting s1 immediately upon
> the return of __bpf_prog_enter().
> 
> Fixes: 49b5e77ae3e2 ("riscv, bpf: Add bpf trampoline support for RV64")
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>   arch/riscv/net/bpf_jit_comp64.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 15e482f2c657..e713704be837 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -730,6 +730,9 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
>   	if (ret)
>   		return ret;
>   
> +	/* store prog start time */
> +	emit_mv(RV_REG_S1, RV_REG_A0, ctx);
> +
>   	/* if (__bpf_prog_enter(prog) == 0)
>   	 *	goto skip_exec_of_prog;
>   	 */
> @@ -737,9 +740,6 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
>   	/* nop reserved for conditional jump */
>   	emit(rv_nop(), ctx);
>   
> -	/* store prog start time */
> -	emit_mv(RV_REG_S1, RV_REG_A0, ctx);
> -
>   	/* arg1: &args_off */
>   	emit_addi(RV_REG_A0, RV_REG_FP, -args_off, ctx);
>   	if (!p->jited)

Thanks.

Reviewed-by: Pu Lehui <pulehui@huawei.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
