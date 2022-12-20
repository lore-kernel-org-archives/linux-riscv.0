Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC88FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 03:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dTa1LmL+hAruvwliVGcKWRvGW2KQV7k8RstQ35JENs=; b=bkMtwTaclHhIx1
	SVssbq6tbfxyv8UtgEvzBWaBWY5f2PiCnEwGsomfEINBTHQ75/fnJo5bP/R+AyWCjLB4fplqwrKhL
	1Aoybq7hnH7IMYpzBK7IBZ+gxtD1M8MW9zWNEKEYBgcRa4BewJOIsVJ3cY0qOLUyAgiigpDbvfVTN
	zNCdbhBRTzUSLi224G4rlXMcsLVP8Qo8qMh2BsDb3BmeC9oKxT8VvD+E/Vme9clQ4KGCPQDWCM95+
	g4Wbcp3hR3v4BAfldS6YsKJlS+F4r4231iQ5C2gpZN4vMKuw+m/0Nj1rg9zR+9oosklJlMjP3xjWi
	wmVNLoe+NXR/hSBaKD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7SsP-008Dmc-CB; Tue, 20 Dec 2022 03:01:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7SsL-008DaH-0Y
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 03:01:08 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NbhBd2DjHzmWjK;
	Tue, 20 Dec 2022 10:59:53 +0800 (CST)
Received: from [10.67.111.192] (10.67.111.192) by
 kwepemi500013.china.huawei.com (7.221.188.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 20 Dec 2022 11:00:58 +0800
Message-ID: <27a7b2ff-c0db-7fa0-2da0-8d76899f94f8@huawei.com>
Date: Tue, 20 Dec 2022 11:00:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH RESEND bpf-next 3/4] riscv, bpf: Add
 bpf_arch_text_poke support for RV64
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
 <20221220021319.1655871-4-pulehui@huaweicloud.com>
From: Xu Kuohai <xukuohai@huawei.com>
In-Reply-To: <20221220021319.1655871-4-pulehui@huaweicloud.com>
X-Originating-IP: [10.67.111.192]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_190105_504129_EC70D264 
X-CRM114-Status: GOOD (  22.64  )
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
> Implement bpf_arch_text_poke for RV64. For call scenario,
> ftrace framework reserve 4 nops for RV64 kernel function
> as function entry, and use auipc+jalr instructions to call
> kernel or module functions. However, since the auipc+jalr
> call instructions is non-atomic operation, we need to use
> stop-machine to make sure instruction patching in atomic
> context. As for jump scenario, since we only jump inside
> the trampoline, a jal instruction is sufficient.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   arch/riscv/net/bpf_jit.h        |   5 ++
>   arch/riscv/net/bpf_jit_comp64.c | 131 +++++++++++++++++++++++++++++++-
>   2 files changed, 134 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index d926e0f7ef57..bf9802a63061 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -573,6 +573,11 @@ static inline u32 rv_fence(u8 pred, u8 succ)
>   	return rv_i_insn(imm11_0, 0, 0, 0, 0xf);
>   }
>   
> +static inline u32 rv_nop(void)
> +{
> +	return rv_i_insn(0, 0, 0, 0, 0x13);
> +}
> +
>   /* RVC instrutions. */
>   
>   static inline u16 rvc_addi4spn(u8 rd, u32 imm10)
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index bf4721a99a09..fa8b03c52463 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -8,6 +8,8 @@
>   #include <linux/bitfield.h>
>   #include <linux/bpf.h>
>   #include <linux/filter.h>
> +#include <linux/memory.h>
> +#include <linux/stop_machine.h>
>   #include "bpf_jit.h"
>   
>   #define RV_REG_TCC RV_REG_A6
> @@ -238,7 +240,7 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
>   	if (!is_tail_call)
>   		emit_mv(RV_REG_A0, RV_REG_A5, ctx);
>   	emit_jalr(RV_REG_ZERO, is_tail_call ? RV_REG_T3 : RV_REG_RA,
> -		  is_tail_call ? 4 : 0, /* skip TCC init */
> +		  is_tail_call ? 20 : 0, /* skip reserved nops and TCC init */
>   		  ctx);
>   }
>   
> @@ -615,6 +617,127 @@ static int add_exception_handler(const struct bpf_insn *insn,
>   	return 0;
>   }
>   
> +struct text_poke_args {
> +	void *addr;
> +	const void *insns;
> +	size_t len;
> +	atomic_t cpu_count;
> +};
> +
> +static int do_text_poke(void *data)
> +{
> +	int ret = 0;
> +	struct text_poke_args *patch = data;
> +
> +	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {

seems this sync is not needed, why not calling stop machine like this:

stop_machine(do_text_poke, &patch, NULL);

> +		ret = patch_text_nosync(patch->addr, patch->insns, patch->len);
> +		atomic_inc(&patch->cpu_count);
> +	} else {
> +		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
> +			cpu_relax();
> +		smp_mb();
> +	}
> +
> +	return ret;
> +}
> +
> +static int bpf_text_poke_stop_machine(void *addr, const void *insns, size_t len)
> +{
> +	struct text_poke_args patch = {
> +		.addr = addr,
> +		.insns = insns,
> +		.len = len,
> +		.cpu_count = ATOMIC_INIT(0),
> +	};
> +
> +	return stop_machine(do_text_poke, &patch, cpu_online_mask);
> +}
> +
> +static int gen_call_or_nops(void *target, void *ip, u32 *insns)
> +{
> +	int i, ret;
> +	s64 rvoff;
> +	struct rv_jit_context ctx;
> +
> +	ctx.ninsns = 0;
> +	ctx.insns = (u16 *)insns;
> +
> +	if (!target) {
> +		for (i = 0; i < 4; i++)
> +			emit(rv_nop(), &ctx);
> +		return 0;
> +	}
> +
> +	rvoff = (s64)(target - ip);
> +	emit(rv_sd(RV_REG_SP, -8, RV_REG_RA), &ctx);
> +	ret = emit_jump_and_link(RV_REG_RA, rvoff, false, &ctx);
> +	if (ret)
> +		return ret;
> +	emit(rv_ld(RV_REG_RA, -8, RV_REG_SP), &ctx);
> +
> +	return 0;
> +
> +}
> +
> +static int bpf_text_poke_call(void *ip, void *old_addr, void *new_addr)
> +{
> +	int ret;
> +	u32 old_insns[4], new_insns[4];
> +
> +	ret = gen_call_or_nops(old_addr, ip + 4, old_insns);
> +	if (ret)
> +		return ret;
> +
> +	ret = gen_call_or_nops(new_addr, ip + 4, new_insns);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&text_mutex);
> +	if (memcmp(ip, old_insns, sizeof(old_insns))) {
> +		ret = -EFAULT;
> +		goto out;
> +	}
> +
> +	if (memcmp(ip, new_insns, sizeof(new_insns)))
> +		ret = bpf_text_poke_stop_machine(ip, new_insns, sizeof(new_insns));

since there are 4 instructions being replaced, it is possible that
serveral old instructions were already executed before stop machine.

> +out:
> +	mutex_unlock(&text_mutex);
> +	return ret;
> +}
> +
> +static int bpf_text_poke_jump(void *ip, void *old_addr, void *new_addr)
> +{
> +	int ret;
> +	u32 old_insn, new_insn;
> +
> +	old_insn = old_addr ? rv_jal(RV_REG_ZERO, (s64)(old_addr - ip) >> 1) : rv_nop();
> +	new_insn = new_addr ? rv_jal(RV_REG_ZERO, (s64)(new_addr - ip) >> 1) : rv_nop();
> +
> +	mutex_lock(&text_mutex);
> +	if (memcmp(ip, &old_insn, sizeof(old_insn))) {
> +		ret = -EFAULT;
> +		goto out;
> +	}
> +
> +	if (memcmp(ip, &new_insn, sizeof(new_insn)))
> +		ret = patch_text_nosync(ip, &new_insn, sizeof(new_insn));
> +out:
> +	mutex_unlock(&text_mutex);
> +	return ret;
> +}
> +
> +int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
> +		       void *old_addr, void *new_addr)
> +{
> +	if (!is_kernel_text((unsigned long)ip) &&
> +	    !is_bpf_text_address((unsigned long)ip))
> +		return -ENOTSUPP;
> +
> +	return poke_type == BPF_MOD_CALL ?
> +	       bpf_text_poke_call(ip, old_addr, new_addr) :
> +	       bpf_text_poke_jump(ip, old_addr, new_addr);
> +}
> +
>   int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   		      bool extra_pass)
>   {
> @@ -1266,7 +1389,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   
>   void bpf_jit_build_prologue(struct rv_jit_context *ctx)
>   {
> -	int stack_adjust = 0, store_offset, bpf_stack_adjust;
> +	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
>   	bool is_main_prog = ctx->prog->aux->func_idx == 0;
>   
>   	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, 16);
> @@ -1294,6 +1417,10 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx)
>   
>   	store_offset = stack_adjust - 8;
>   
> +	/* reserve 4 nop insns */
> +	for (i = 0; i < 4; i++)
> +		emit(rv_nop(), ctx);
> +
>   	/* First instruction is always setting the tail-call-counter
>   	 * (TCC) register. This instruction is skipped for tail calls.
>   	 * Force using a 4-byte (non-compressed) instruction.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
