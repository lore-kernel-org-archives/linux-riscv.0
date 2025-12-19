Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B61D711CC
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 02:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QpGOeOnhNMMACN/EgGRQIqKTCyZeWnxDAoH0RKnc7M=; b=fA8pNowVBCsDiw
	84vhBsLKqXIuoI+7NRtcQkBQ7BbBPd7h4SfOEuVePPqWfly2R8jmxGQSXBAwWHQ5n7e18+Rv8N+Ss
	Zj6iT4WzJUhpdUSG/4tfg64W3vzipHy9cIRV+ZL0ED+wu7XE7GoxpXQxpNZXmbLbMETq60dCIv2j6
	bEgPKnvborHN3hdt2ykwRWOKZ8t42T2clpyPPWm5Qz2VEBcgNK4Ubbta3XuU1FZMRxhKpMzt0ARGS
	vRXH9g0xej8gAwXn2cMdbQpqFmcbokF/ETD7+d7kEheg3t+SCQW3Dge/bHfccttOp8UkCSsdGMati
	mO3D2weuL+phRgOlfu5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQ8U-00000009URs-3JDZ;
	Fri, 19 Dec 2025 02:22:30 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQ8R-00000009URJ-1Sa5
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 02:22:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766110942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TyQzwBodYywkgk4jBa2kV8ck8KpscrsX72/zFGuY28=;
	b=gFvARDstKR2YOm1qlYuFUuZg61y9vl4v1PgCXezoaeXnnkt1K1ytJBzsrED+79AUJKcyyP
	6B6z8vaZTigiRG7W7Nwb/3KOI/o+64bFxyBDdSXuvY0oIGref+FbkRXsBPuU5UdvOz8Y0b
	7aNCN8BXeggb0NQlPqQ8JllQy788WcM=
From: Menglong Dong <menglong.dong@linux.dev>
To: Menglong Dong <menglong8.dong@gmail.com>,
 Andreas Schwab <schwab@linux-m68k.org>
Cc: ast@kernel.org, rostedt@goodmis.org, daniel@iogearbox.net,
 john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 mhiramat@kernel.org, mark.rutland@arm.com, mathieu.desnoyers@efficios.com,
 jiang.biao@linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf-next v3 3/6] bpf: fix the usage of BPF_TRAMP_F_SKIP_FRAME
Date: Fri, 19 Dec 2025 10:22:01 +0800
Message-ID: <3730454.R56niFO833@7940hx>
In-Reply-To: <874ipnkfvt.fsf@igel.home>
References: <20251118123639.688444-1-dongml2@chinatelecom.cn>
 <20251118123639.688444-4-dongml2@chinatelecom.cn> <874ipnkfvt.fsf@igel.home>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_182228_155505_9D400C84 
X-CRM114-Status: UNSURE (   8.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2025/12/18 22:45 Andreas Schwab <schwab@linux-m68k.org> write:
> On Nov 18 2025, Menglong Dong wrote:
> 
> > Some places calculate the origin_call by checking if
> > BPF_TRAMP_F_SKIP_FRAME is set. However, it should use
> > BPF_TRAMP_F_ORIG_STACK for this propose. Just fix them.
> >
> > Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> > Acked-by: Alexei Starovoitov <ast@kernel.org>
> 
> This breaks RISC-V:

Hi, Andreas. Can you offer more information here? After my analysis,
I didn't see the problem. BPF_TRAMP_F_SKIP_FRAME and
BPF_TRAMP_F_ORIG_STACK are set together all the time in RISC-V, so
I changed BPF_TRAMP_F_SKIP_FRAME to BPF_TRAMP_F_ORIG_STACK
*should* have no influence.

Thanks!
Menglong Dong

> 
> [    8.584381][    T1] systemd[1]: bpf-restrict-fs: LSM BPF program attached
> [    8.588359][    T1] Insufficient stack space to handle exception!
> [    8.588823][    T1] Task stack:     [0xff20000000010000..0xff20000000014000]
> [    8.589219][    T1] Overflow stack: [0xff600000ffdad070..0xff600000ffdae070]
> [    8.590133][    T1] CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)  c900881ed1c1988ec5cf3e914d0edeb1b4d83ca3
> [    8.590898][    T1] Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
> [    8.591494][    T1] epc : copy_from_kernel_nofault+0xa/0x198
> [    8.592292][    T1]  ra : bpf_probe_read_kernel+0x20/0x60
> [    8.592658][    T1] epc : ffffffff802b732a ra : ffffffff801e6070 sp : ff2000000000ffe0
> [    8.593121][    T1]  gp : ffffffff82262ed0 tp : 0000000000000000 t0 : ffffffff80022320
> [    8.593566][    T1]  t1 : ffffffff801e6056 t2 : 0000000000000000 s0 : ff20000000010040
> [    8.593997][    T1]  s1 : 0000000000000008 a0 : ff20000000010050 a1 : ff60000083b3d320
> [    8.594446][    T1]  a2 : 0000000000000008 a3 : 0000000000000097 a4 : 0000000000000000
> [    8.594940][    T1]  a5 : 0000000000000000 a6 : 0000000000000021 a7 : 0000000000000003
> [    8.595396][    T1]  s2 : ff20000000010050 s3 : ff6000008459fc18 s4 : ff60000083b3d340
> [    8.595831][    T1]  s5 : ff20000000010060 s6 : 0000000000000000 s7 : ff20000000013aa8
> [    8.596215][    T1]  s8 : 0000000000000000 s9 : 0000000000008000 s10: 000000000058dcb0
> [    8.596641][    T1]  s11: 000000000058dca7 t3 : 000000006925116d t4 : ff6000008090f026
> [    8.597065][    T1]  t5 : 00007fff9b0cbaa8 t6 : 0000000000000016
> [    8.597363][    T1] status: 0000000200000120 badaddr: 0000000000000000 cause: 8000000000000005
> [    8.598033][    T1] Kernel panic - not syncing: Kernel stack overflow
> [    8.598597][    T1] CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)  c900881ed1c1988ec5cf3e914d0edeb1b4d83ca3
> [    8.599244][    T1] Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
> [    8.599659][    T1] Call Trace:
> [    8.600117][    T1] [<ffffffff8001a1f8>] dump_backtrace+0x28/0x38
> [    8.600517][    T1] [<ffffffff80002502>] show_stack+0x3a/0x50
> [    8.600844][    T1] [<ffffffff800122be>] dump_stack_lvl+0x56/0x80
> [    8.601176][    T1] [<ffffffff80012300>] dump_stack+0x18/0x22
> [    8.601518][    T1] [<ffffffff80002abe>] vpanic+0xf6/0x328
> [    8.601819][    T1] [<ffffffff80002d2e>] panic+0x3e/0x40
> [    8.602088][    T1] [<ffffffff80019ef0>] handle_bad_stack+0x98/0xa0
> [    8.602395][    T1] [<ffffffff801e6070>] bpf_probe_read_kernel+0x20/0x60
> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
