Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3DCD78774
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJ6dgJon9XAmQEVyp46cBw3HgUMKiHqRyZ/1Q8pr35A=; b=5GGBY379TAAxUh
	qsPYzgy945ol41VKiAiBCbU6jSS1+qi+2b1EacD5uVMzS1yL0ldf+LmwwDwVwYhn5duZ4QPNtKIs5
	nY1ti/++TZ/deiD7bVPz2SRUtRL/2994zHkPO/FopzSQ57A++yFNLohc9txam52cuAxeTyOLDkIAZ
	1aNdFNMn7vdZrPaScIJ8JjYZWDHRi17PTpyBSNDyxOvuzhiuLZ/wFl0Q/tBAPd59NQBvzxtCD0OwK
	uXc6szZtZHCTln1eKz0izZ9XeR8WLq+T6coIGXncCA0SEQ38OgI15V1zzKf/9VvcGkKwesUkEmwU6
	p52K38pNnNo7a+Rx65nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaa8-0000000ALuB-2kHI;
	Fri, 19 Dec 2025 13:31:44 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaa4-0000000ALth-1zKE
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 13:31:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766151091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xzagi6miXzd7e3OGU5ATRhbk9IjjwnMd+L1LSEqQQXY=;
	b=Oj+jYrIfLYRp1HI4kxh6Bw2BVLKLb02cZW5Ufy9/+AIbsgRgQ4adW/UrkTkxG81DFMc7wh
	3D3uy4Rmy24ThRL8sfgZipaqe0NCA+mHGozG7IvAjyx0PaJRSduBzCJoEz/quzVzyCyD2W
	LAgsXsscB7zaUq9Z2UOWACzx2UgajH4=
From: Menglong Dong <menglong.dong@linux.dev>
To: ast@kernel.org
Cc: Andreas Schwab <schwab@linux-m68k.org>,
 Menglong Dong <menglong8.dong@gmail.com>, rostedt@goodmis.org,
 daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, mhiramat@kernel.org,
 mark.rutland@arm.com, mathieu.desnoyers@efficios.com, jiang.biao@linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf-next v3 3/6] bpf: fix the usage of BPF_TRAMP_F_SKIP_FRAME
Date: Fri, 19 Dec 2025 21:31:13 +0800
Message-ID: <1948844.tdWV9SEqCh@7950hx>
In-Reply-To: <5070743.31r3eYUQgx@7950hx>
References: <20251118123639.688444-1-dongml2@chinatelecom.cn> <875xa2g0m0.fsf@igel.home>
 <5070743.31r3eYUQgx@7950hx>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_053141_855747_61D4383B 
X-CRM114-Status: GOOD (  19.74  )
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

On 2025/12/19 20:27, Menglong Dong wrote:
> On 2025/12/19 19:41, Andreas Schwab wrote:
> > On Dez 19 2025, Menglong Dong wrote:
> > 
> > > BPF_TRAMP_F_ORIG_STACK
> > 
> > How can that ever be set?
> 
> Oops, my bad! It should be BPF_TRAMP_F_CALL_ORIG here. I think
> it is some kind of copy-paste mistake. I'll send a fix for it.

I sent the following patch twice, but I didn't see it in the
mail list. I suspect there is something wrong with my gmail.

Hi, Alexei. Can you see my patch?

-->patch<--

From 5dbae5dcba3aa7fa10e506e9fd1a28a6802d9b00 Mon Sep 17 00:00:00 2001
From: Menglong Dong <dongml2@chinatelecom.cn>
Date: Fri, 19 Dec 2025 20:33:10 +0800
Subject: [PATCH RESEND bpf] riscv, bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK

The usage of BPF_TRAMP_F_ORIG_STACK in __arch_prepare_bpf_trampoline() is
wrong, and it should be BPF_TRAMP_F_CALL_ORIG, which caused crash as
Andreas reported:

  Insufficient stack space to handle exception!
  Task stack:     [0xff20000000010000..0xff20000000014000]
  Overflow stack: [0xff600000ffdad070..0xff600000ffdae070]
  CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)
  Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
  epc : copy_from_kernel_nofault+0xa/0x198
   ra : bpf_probe_read_kernel+0x20/0x60
  epc : ffffffff802b732a ra : ffffffff801e6070 sp : ff2000000000ffe0
   gp : ffffffff82262ed0 tp : 0000000000000000 t0 : ffffffff80022320
   t1 : ffffffff801e6056 t2 : 0000000000000000 s0 : ff20000000010040
   s1 : 0000000000000008 a0 : ff20000000010050 a1 : ff60000083b3d320
   a2 : 0000000000000008 a3 : 0000000000000097 a4 : 0000000000000000
   a5 : 0000000000000000 a6 : 0000000000000021 a7 : 0000000000000003
   s2 : ff20000000010050 s3 : ff6000008459fc18 s4 : ff60000083b3d340
   s5 : ff20000000010060 s6 : 0000000000000000 s7 : ff20000000013aa8
   s8 : 0000000000000000 s9 : 0000000000008000 s10: 000000000058dcb0
   s11: 000000000058dca7 t3 : 000000006925116d t4 : ff6000008090f026
   t5 : 00007fff9b0cbaa8 t6 : 0000000000000016
  status: 0000000200000120 badaddr: 0000000000000000 cause: 8000000000000005
  Kernel panic - not syncing: Kernel stack overflow
  CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)
  Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
  Call Trace:
  [<ffffffff8001a1f8>] dump_backtrace+0x28/0x38
  [<ffffffff80002502>] show_stack+0x3a/0x50
  [<ffffffff800122be>] dump_stack_lvl+0x56/0x80
  [<ffffffff80012300>] dump_stack+0x18/0x22
  [<ffffffff80002abe>] vpanic+0xf6/0x328
  [<ffffffff80002d2e>] panic+0x3e/0x40
  [<ffffffff80019ef0>] handle_bad_stack+0x98/0xa0
  [<ffffffff801e6070>] bpf_probe_read_kernel+0x20/0x60

Just fix it.

Fixes: 47c9214dcbea ("bpf: fix the usage of BPF_TRAMP_F_SKIP_FRAME")
Reported-by: Andreas Schwab <schwab@linux-m68k.org>
Closes: https://lore.kernel.org/bpf/874ipnkfvt.fsf@igel.home/
Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 arch/riscv/net/bpf_jit_comp64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 5f9457e910e8..09b70bf362d3 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1134,7 +1134,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	store_args(nr_arg_slots, args_off, ctx);
 
 	/* skip to actual body of traced function */
-	if (flags & BPF_TRAMP_F_ORIG_STACK)
+	if (flags & BPF_TRAMP_F_CALL_ORIG)
 		orig_call += RV_FENTRY_NINSNS * 4;
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
-- 
2.52.0

--<patch>--

> 
> Thanks!
> Menglong Dong
> 
> > 
> > 	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
> > 		return -ENOTSUPP;
> > 
> > 
> 
> 
> 
> 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
