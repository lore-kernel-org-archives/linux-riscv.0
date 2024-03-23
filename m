Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C543C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:CC:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mRqVyUap4pi4QGK/T2RQPQaaNqY3pNq3sYBbUwqi+8=; b=2dIvvyzXvCcNIE
	Qe4g1BqvYBZBEgH7gsOVjqJ9ZDEbOq2KI3rcJA1RJh4I+KAxuGyU9ZArdCt22OSBdF7n8X2ywXvEc
	idreA/OMoWnkj6Bws+veSvaJblg/D/peidup3PqHWChVer0DK5+uYqExaF4uAQksTDqsi8/Hu+oDl
	rRgquApk6diecovs8xay9FG2WFi8n/bC7fBo24lMU75BMrWf6C0BUm/RgcPHjuvY1HRcR+P+QjI+A
	E13ssvj86mAOblrWJFOppG2VsG0Z9cXINf5F3D4m9YYn21TOdpUhT8epbQ+g/cfAmADGtE7LIbWGY
	S71DJupyWvar0YA94MdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro4TI-0000000AkT5-0z2Q;
	Sat, 23 Mar 2024 16:43:52 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro4TF-0000000AkSL-05kL
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 16:43:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V24hG5Fmtz2BhGd;
	Sun, 24 Mar 2024 00:41:02 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id F3E161A0172;
	Sun, 24 Mar 2024 00:43:38 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sun, 24 Mar 2024 00:43:38 +0800
Message-ID: <3e07fb21-da08-4183-8bd4-064b519c7ddb@huawei.com>
Date: Sun, 24 Mar 2024 00:43:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/2] bpf,riscv: Implement bpf_addr_space_cast
 instruction
Content-Language: en-US
To: Puranjay Mohan <puranjay12@gmail.com>
References: <20240323154652.54572-1-puranjay12@gmail.com>
 <20240323154652.54572-3-puranjay12@gmail.com>
CC: Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240323154652.54572-3-puranjay12@gmail.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_094349_317880_CB59B4F8 
X-CRM114-Status: UNSURE (   7.20  )
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


On 2024/3/23 23:46, Puranjay Mohan wrote:
> LLVM generates bpf_addr_space_cast instruction while translating
[snip]
>   
>   /* Convert from ninsns to bytes. */
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index f51b832eafb6..3c389e75cb96 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -1083,6 +1083,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   	/* dst = src */
>   	case BPF_ALU | BPF_MOV | BPF_X:
>   	case BPF_ALU64 | BPF_MOV | BPF_X:
> +		if (BPF_CLASS(insn->code) == BPF_ALU64 && insn->off == BPF_ADDR_SPACE_CAST &&
> +		    insn->imm == 1U << 16) {
> +			emit_mv(RV_REG_T1, rs, ctx); > +			emit_zextw(RV_REG_T1, RV_REG_T1, ctx);
combine mv and zextw will be better
> +			emit_imm(rd, (ctx->user_vm_start >> 32) << 32, ctx);
> +			emit(rv_beq(RV_REG_T1, RV_REG_ZERO, 4), ctx);
> +			emit_or(RV_REG_T1, rd, RV_REG_T1, ctx);
> +			emit_mv(rd, RV_REG_T1, ctx);
ditto, but for or and mv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
