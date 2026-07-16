Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7271C44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 07:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmsadxs7PMcjIwEda0r6qQLVLqVHnxDqrzWp5KNv8n0=; b=JoKvA0KuB7YyxI
	llGL0Jfrh6K4spIZvqgaYNtyHYOMFRQSn5jBwdLKPXBdRGn5aeup0bh7HDc7AtjBj7RKx4X4sr9ED
	dbWlfFu5e+oWybNfdX5r+9oCtrevQ+FIIWUDKnpNFPFPoth4eKN04Dy+XN6aiG9oEEPT7rc5wRti6
	6CPiBI//K5qPBw3Pb/nPLHR/JtrpCMxuAhkm07ieWK5UIt+nGYJNShyUtt1QXJRTGPdKegZ/BNPV7
	WdUwBqp/HVEZKIYNQkI7uEaUtsT8/taf94QPYY8PVpuVbPZ4BVbyqggy6trPQFaFJ/NJl0S3jk3Bf
	dIsQFPJ0F+1Pz5jGZ5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG6S-0000000Gbf8-2hqN;
	Thu, 16 Jul 2026 07:01:52 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG6P-0000000Gbe9-0e4n
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 07:01:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VbdhA8Y5NdBAGbIMkJD62B07nlb+nNjilt6Rs/mVUq4=;
	b=Cu2Prxq7U5U7TZXFseJCYQADjZvzmqWYEMfaFLyHmt5u0DAFQ2fkJ5SgpRXasysLM70RbCr5o
	6YW9DXxtxBtG9QqFIrxfXhk76U4amAp692hvZoFguW2F6M0Jud2tvweQ6EhCEOeWVFAea/qCqfH
	HnYw86Mu9MZ0wHMrZ52hHMA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4h13cd5fNYz1prm3;
	Thu, 16 Jul 2026 14:52:01 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id B052040538;
	Thu, 16 Jul 2026 15:01:22 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 16 Jul
 2026 15:01:21 +0800
Message-ID: <ed7c71d1-f692-4a8f-954e-2d3ea9177c28@huawei.com>
Date: Thu, 16 Jul 2026 15:01:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bpf, riscv: fix missing extable entry for arena
 load_acquire
Content-Language: en-US
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
	<memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	<jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>
CC: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260716-bpf-riscv-fix-extable-v1-1-af023cc17af4@kylinos.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260716-bpf-riscv-fix-extable-v1-1-af023cc17af4@kylinos.cn>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_000149_846716_CB01620C 
X-CRM114-Status: GOOD (  15.42  )
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


On 2026/7/16 14:15, Feng Jiang wrote:
> emit_atomic_ld_st() returns 1 to have build_body() skip the zext after
> a sub-word load_acquire. The caller does "ret = ret ?:
> add_exception_handler(...)", which skips add_exception_handler() on any
> non-zero ret, so the extable entry is missing and a faulting
> PROBE_ATOMIC load_acquire oopses.
> 
> Check ret >= 0 before calling add_exception_handler(), and return ret
> unchanged so build_body() still skips the zext.
> 
> Fixes: fb7cefabae81 ("riscv, bpf: Add support arena atomics for RV64")
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> ---
>   arch/riscv/net/bpf_jit_comp64.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index f9d5347ba966..4fd4392dd080 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -1986,10 +1986,14 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   		else
>   			ret = emit_atomic_rmw(rd, rs, insn, ctx);
>   
> -		ret = ret ?: add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);
> -		if (ret)
> -			return ret;
> -		break;
> +		/* ret can be 1 (skip-zext); extable entry still needs to be added */
> +		if (ret >= 0) {
> +			int err = add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);

Thanks Feng Jiang. Maybe we could remove this additional variable.

```
/* ret can be 1 (skip-zext); extable entry still needs to be added */
if (ret >= 0)
   ret = add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx) ?: ret;

if (ret)
   return ret;

break;
```


> +
> +			if (err)
> +				return err;
> +		}
> +		return ret;
>   
>   	default:
>   		pr_err("bpf-jit: unknown opcode %02x\n", code);
> 
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260716-bpf-riscv-fix-extable-399947ca778d
> 
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
