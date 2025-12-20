Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4589E668B1
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxuIVcvIAJgG2sNz1Eojcfxx0+a7Huiz1HhqUDhyagI=; b=AW2MhBDe0zAOFB
	ZEaUo5FEDCGG3a0xWM3LFBdqpLvz+YCcQ5cCepViw1T46G4ePpes265P4ZX/QGJjCO+U9WQ5IQzCN
	ISYq/64KZZiOUsCmFxsE2wHLhVpwWCq0dfe2Ky8y/fV0l0RD9z34eASYIpLZ6jn3LcwffVUlBQr/w
	XizQ5DUbV4Sa7l4w6Ub63YWwmV1OMHv+3DrmrVls00kSEZNMXUNaw3MM6TQBcLsM65UuTmGcM+ryj
	wCCgEmxNO8m1Fw9bsBNmr0exi+vZCSAJMhGiECK/lgcSimaFZ4pKCicIKuyQO1zbW5ArLiJyZm+Bx
	TrPmfY7BDj0hfeORWtSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWrU2-0000000BOAR-2XJF;
	Sat, 20 Dec 2025 07:34:34 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWrTz-0000000BOA2-2ahg
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 07:34:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766216061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S91jpqXqsg0Jhi5+sYGwbVyxcd6hPUpwSC+NwxrECyc=;
	b=HeyY+W2S4IlGyi42CgeG9vVBzjsFsJ67uIQQZ7TAghIE8ud81U6CuHRBCmHAPcCWX78aRA
	a2YBH5bXwtw83cTHp/1M/5tCVBn1cqLNWzYN6JO3eKrKIBa9aF3poFQ+Hu+zbB0qyYdphy
	K0vH8DouyMMx4ZNMWBPTQWyv+ML2t4M=
From: Menglong Dong <menglong.dong@linux.dev>
To: Menglong Dong <menglong8.dong@gmail.com>, schwab@linux-m68k.org,
 Pu Lehui <pulehui@huawei.com>, andrii@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org, puranjay@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf v2] riscv,
 bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK
Date: Sat, 20 Dec 2025 15:33:58 +0800
Message-ID: <8619181.T7Z3S40VBb@7950hx>
In-Reply-To: <33977244-1266-4590-af38-e3be3e46d7f4@huawei.com>
References: <20251219142948.204312-1-dongml2@chinatelecom.cn>
 <33977244-1266-4590-af38-e3be3e46d7f4@huawei.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_233432_037499_EAEB5E10 
X-CRM114-Status: GOOD (  20.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2025/12/20 10:59, Pu Lehui wrote:
> 
> On 2025/12/19 22:29, Menglong Dong wrote:
> > The usage of BPF_TRAMP_F_ORIG_STACK in __arch_prepare_bpf_trampoline() is
> > wrong, and it should be BPF_TRAMP_F_CALL_ORIG, which caused crash as
> > Andreas reported:
> > 
> >    Insufficient stack space to handle exception!
> >    Task stack:     [0xff20000000010000..0xff20000000014000]
> >    Overflow stack: [0xff600000ffdad070..0xff600000ffdae070]
> >    CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)
> >    Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
> >    epc : copy_from_kernel_nofault+0xa/0x198
> >     ra : bpf_probe_read_kernel+0x20/0x60
> >    epc : ffffffff802b732a ra : ffffffff801e6070 sp : ff2000000000ffe0
> >     gp : ffffffff82262ed0 tp : 0000000000000000 t0 : ffffffff80022320
> >     t1 : ffffffff801e6056 t2 : 0000000000000000 s0 : ff20000000010040
> >     s1 : 0000000000000008 a0 : ff20000000010050 a1 : ff60000083b3d320
> >     a2 : 0000000000000008 a3 : 0000000000000097 a4 : 0000000000000000
> >     a5 : 0000000000000000 a6 : 0000000000000021 a7 : 0000000000000003
> >     s2 : ff20000000010050 s3 : ff6000008459fc18 s4 : ff60000083b3d340
> >     s5 : ff20000000010060 s6 : 0000000000000000 s7 : ff20000000013aa8
> >     s8 : 0000000000000000 s9 : 0000000000008000 s10: 000000000058dcb0
> >     s11: 000000000058dca7 t3 : 000000006925116d t4 : ff6000008090f026
> >     t5 : 00007fff9b0cbaa8 t6 : 0000000000000016
> >    status: 0000000200000120 badaddr: 0000000000000000 cause: 8000000000000005
> >    Kernel panic - not syncing: Kernel stack overflow
> >    CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)
> >    Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
> >    Call Trace:
> >    [<ffffffff8001a1f8>] dump_backtrace+0x28/0x38
> >    [<ffffffff80002502>] show_stack+0x3a/0x50
> >    [<ffffffff800122be>] dump_stack_lvl+0x56/0x80
> >    [<ffffffff80012300>] dump_stack+0x18/0x22
> >    [<ffffffff80002abe>] vpanic+0xf6/0x328
> >    [<ffffffff80002d2e>] panic+0x3e/0x40
> >    [<ffffffff80019ef0>] handle_bad_stack+0x98/0xa0
> >    [<ffffffff801e6070>] bpf_probe_read_kernel+0x20/0x60
> > 
> > Just fix it.
> > 
> > Fixes: 47c9214dcbea ("bpf: fix the usage of BPF_TRAMP_F_SKIP_FRAME")
> > Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> > Closes: https://lore.kernel.org/bpf/874ipnkfvt.fsf@igel.home/
> > Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> > ---
> > v2:
> > - merge the code
> > ---
> >   arch/riscv/net/bpf_jit_comp64.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> > index 5f9457e910e8..37888abee70c 100644
> > --- a/arch/riscv/net/bpf_jit_comp64.c
> > +++ b/arch/riscv/net/bpf_jit_comp64.c
> > @@ -1133,10 +1133,6 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> >   
> >   	store_args(nr_arg_slots, args_off, ctx);
> >   
> > -	/* skip to actual body of traced function */
> > -	if (flags & BPF_TRAMP_F_ORIG_STACK)
> 
> Oh, how did this weird flags get in here...

It's my fault. I wanted to use BPF_TRAMP_F_CALL_ORIG here, and
a copy-paste mistake happen. They look a little similar :(

> 
> > -		orig_call += RV_FENTRY_NINSNS * 4;
> > -
> >   	if (flags & BPF_TRAMP_F_CALL_ORIG) {
> >   		emit_imm(RV_REG_A0, ctx->insns ? (const s64)im : RV_MAX_COUNT_IMM, ctx);
> >   		ret = emit_call((const u64)__bpf_tramp_enter, true, ctx);
> > @@ -1171,6 +1167,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> >   	}
> >   
> >   	if (flags & BPF_TRAMP_F_CALL_ORIG) {
> > +		/* skip to actual body of traced function */
> > +		orig_call += RV_FENTRY_NINSNS * 4;
> 
> 
> LGTM, let's revert it.
> 
> Reviewed-by: Pu Lehui <pulehui@huawei.com>
> 
> >   		restore_args(min_t(int, nr_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
> >   		restore_stack_args(nr_arg_slots - RV_MAX_REG_ARGS, args_off, stk_arg_off, ctx);
> >   		ret = emit_call((const u64)orig_call, true, ctx);

Andreas suggested that we remove the variable "orig_call" and use
"func_addr + RV_FENTRY_NINSNS * 4" directly here. But I saw the V2
is already applied. Hmm...I think it doesn't matter.

Thanks!
Menglong Dong

> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
