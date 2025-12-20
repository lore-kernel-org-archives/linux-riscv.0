Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB3DE668A7
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 02:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqA7Q6mROppHRrpTkdDlyS9pOzB4MefJSIQ0PGER9/s=; b=ODH/OHdLM4YSzj
	Nb7FYg4RZ+qCj9p09UfDJkz59FY6sSqbuKhIVN5nX3OUxI7VLuu8X/STY3QFyrvwBsbf2kD7I3V+r
	Y125d8nhUsBoBXM/tdeepr9u08GTX/37nOAvx7Z4h1yVxa7oEBbVq8Hc2esho1kJ5K8VW55eEd8JY
	a8OT09xlTh+rput7vxOHVog4lubC7hEInGHQMPdvEQzH+++2ICylPAL7fErRtghJrKjISJ8mk3az6
	keUJ2OMs+SJouQ+aKGpQpUeNb7mxM95k3L2eN+iiVY9U/A3H//maJaiBwTdAsKQoEE7eSIoUB+LcA
	xTgfVvRXoDMUlCoeMXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWnBk-0000000BE2p-0xw9;
	Sat, 20 Dec 2025 02:59:24 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWnBg-0000000BE2F-3T6q
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 02:59:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EpoQBSY67OhCanzVgZjorTnzYdt3NJZkBJh3zM1mpp8=;
	b=j21JweUC5ESmLGgsK0TPWA/tth8ojUddCNMdrk1uSnsDcKHygAwVt005gstkJX3WwaI3v+8lK
	oD9rFsnImjAnrmaHoq7QJ/g15R4bEFlDZSWOz25sQCXTFXP+6Kmo0BgTX9/T9pZZDjETOKV9aAo
	sLHqTtuXSAwJv0sVuwxZdP8=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dY8FG1xtpz1T4GK;
	Sat, 20 Dec 2025 10:56:50 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 3FC2840569;
	Sat, 20 Dec 2025 10:59:06 +0800 (CST)
Received: from [10.67.108.204] (10.67.108.204) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 20 Dec 2025 10:59:05 +0800
Message-ID: <33977244-1266-4590-af38-e3be3e46d7f4@huawei.com>
Date: Sat, 20 Dec 2025 10:59:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf v2] riscv, bpf: fix incorrect usage of
 BPF_TRAMP_F_ORIG_STACK
Content-Language: en-US
To: Menglong Dong <menglong8.dong@gmail.com>, <ast@kernel.org>,
	<schwab@linux-m68k.org>
CC: <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
	<eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>,
	<haoluo@google.com>, <jolsa@kernel.org>, <bjorn@kernel.org>,
	<puranjay@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251219142948.204312-1-dongml2@chinatelecom.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20251219142948.204312-1-dongml2@chinatelecom.cn>
X-Originating-IP: [10.67.108.204]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_185921_539531_D439F2F8 
X-CRM114-Status: GOOD (  15.28  )
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



On 2025/12/19 22:29, Menglong Dong wrote:
> The usage of BPF_TRAMP_F_ORIG_STACK in __arch_prepare_bpf_trampoline() is
> wrong, and it should be BPF_TRAMP_F_CALL_ORIG, which caused crash as
> Andreas reported:
> 
>    Insufficient stack space to handle exception!
>    Task stack:     [0xff20000000010000..0xff20000000014000]
>    Overflow stack: [0xff600000ffdad070..0xff600000ffdae070]
>    CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)
>    Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
>    epc : copy_from_kernel_nofault+0xa/0x198
>     ra : bpf_probe_read_kernel+0x20/0x60
>    epc : ffffffff802b732a ra : ffffffff801e6070 sp : ff2000000000ffe0
>     gp : ffffffff82262ed0 tp : 0000000000000000 t0 : ffffffff80022320
>     t1 : ffffffff801e6056 t2 : 0000000000000000 s0 : ff20000000010040
>     s1 : 0000000000000008 a0 : ff20000000010050 a1 : ff60000083b3d320
>     a2 : 0000000000000008 a3 : 0000000000000097 a4 : 0000000000000000
>     a5 : 0000000000000000 a6 : 0000000000000021 a7 : 0000000000000003
>     s2 : ff20000000010050 s3 : ff6000008459fc18 s4 : ff60000083b3d340
>     s5 : ff20000000010060 s6 : 0000000000000000 s7 : ff20000000013aa8
>     s8 : 0000000000000000 s9 : 0000000000008000 s10: 000000000058dcb0
>     s11: 000000000058dca7 t3 : 000000006925116d t4 : ff6000008090f026
>     t5 : 00007fff9b0cbaa8 t6 : 0000000000000016
>    status: 0000000200000120 badaddr: 0000000000000000 cause: 8000000000000005
>    Kernel panic - not syncing: Kernel stack overflow
>    CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)
>    Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
>    Call Trace:
>    [<ffffffff8001a1f8>] dump_backtrace+0x28/0x38
>    [<ffffffff80002502>] show_stack+0x3a/0x50
>    [<ffffffff800122be>] dump_stack_lvl+0x56/0x80
>    [<ffffffff80012300>] dump_stack+0x18/0x22
>    [<ffffffff80002abe>] vpanic+0xf6/0x328
>    [<ffffffff80002d2e>] panic+0x3e/0x40
>    [<ffffffff80019ef0>] handle_bad_stack+0x98/0xa0
>    [<ffffffff801e6070>] bpf_probe_read_kernel+0x20/0x60
> 
> Just fix it.
> 
> Fixes: 47c9214dcbea ("bpf: fix the usage of BPF_TRAMP_F_SKIP_FRAME")
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Closes: https://lore.kernel.org/bpf/874ipnkfvt.fsf@igel.home/
> Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> ---
> v2:
> - merge the code
> ---
>   arch/riscv/net/bpf_jit_comp64.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 5f9457e910e8..37888abee70c 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -1133,10 +1133,6 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
>   
>   	store_args(nr_arg_slots, args_off, ctx);
>   
> -	/* skip to actual body of traced function */
> -	if (flags & BPF_TRAMP_F_ORIG_STACK)

Oh, how did this weird flags get in here...

> -		orig_call += RV_FENTRY_NINSNS * 4;
> -
>   	if (flags & BPF_TRAMP_F_CALL_ORIG) {
>   		emit_imm(RV_REG_A0, ctx->insns ? (const s64)im : RV_MAX_COUNT_IMM, ctx);
>   		ret = emit_call((const u64)__bpf_tramp_enter, true, ctx);
> @@ -1171,6 +1167,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
>   	}
>   
>   	if (flags & BPF_TRAMP_F_CALL_ORIG) {
> +		/* skip to actual body of traced function */
> +		orig_call += RV_FENTRY_NINSNS * 4;


LGTM, let's revert it.

Reviewed-by: Pu Lehui <pulehui@huawei.com>

>   		restore_args(min_t(int, nr_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
>   		restore_stack_args(nr_arg_slots - RV_MAX_REG_ARGS, args_off, stk_arg_off, ctx);
>   		ret = emit_call((const u64)orig_call, true, ctx);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
