Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D18C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 07:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGDchK/fujP829YFjd/7AhKxm0pryeZrdNDVwDOe7W4=; b=48ctFeQPUHq/47
	D5UcQXG8T0yuOgRDIErEoVVQCppzcHYT+cZ5PI7E4Uv6OzdqhDYOfRyXczVyxuEfeAVVHYItibn18
	5hnQ8BR4LXcUS+cgpWAWDjuGLQPnh0wGdLgmMr1KxkbkSNB3DUPU3O7J5mtFVEQbSHwsnBCnQek82
	VLMwDiHqr6oI9+fCW3GlqsnFyEIuQkfVUP4B2cJbbuwyhS1vjPs31eIu6sW00GqpgR6j1DjZWyNP2
	iIrc5zTA0kEbwon9v3vEP7irXPdz/qY7V8ned+HzRdFN9s9Z8i2XHRu2IkGsC4o0CyqK7awreBVFT
	CzueVLnEkY45y3+PPzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmvF-000ZvR-Mp; Fri, 22 Jul 2022 07:18:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmvA-000Zrr-Nr
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 07:18:02 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oEmuu-0005DJ-1O; Fri, 22 Jul 2022 09:17:44 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org, guoren@kernel.org, mick@ics.forth.gr, alexandre.ghiti@canonical.com, Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, crash-utility@redhat.com, huanyi.xj@alibaba-inc.com, heinrich.schuchardt@canonical.com, k-hagio-ab@nec.com, hschauhan@nulltrace.org, Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH 2/5] RISC-V: use __smp_processor_id() instead of smp_processor_id()
Date: Fri, 22 Jul 2022 09:17:43 +0200
Message-ID: <2189907.iZASKD2KPV@diego>
In-Reply-To: <20220717101323.370245-3-xianting.tian@linux.alibaba.com>
References: <20220717101323.370245-1-xianting.tian@linux.alibaba.com> <20220717101323.370245-3-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_001800_816206_3CCE4156 
X-CRM114-Status: GOOD (  11.31  )
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

Am Sonntag, 17. Juli 2022, 12:13:20 CEST schrieb Xianting Tian:
> Use __smp_processor_id() to avoid check the preemption context when
> CONFIG_DEBUG_PREEMPT enabled, as we will enter crash kernel and no
> return.
> 
> Without the patch,
> [  103.781044] sysrq: Trigger a crash
> [  103.784625] Kernel panic - not syncing: sysrq triggered crash
> [  103.837634] CPU1: off
> [  103.889668] CPU2: off
> [  103.933479] CPU3: off
> [  103.939424] Starting crashdump kernel...
> [  103.943442] BUG: using smp_processor_id() in preemptible [00000000] code: sh/346
> [  103.950884] caller is debug_smp_processor_id+0x1c/0x26
> [  103.956051] CPU: 0 PID: 346 Comm: sh Kdump: loaded Not tainted 5.10.113-00002-gce03f03bf4ec-dirty #149
> [  103.965355] Call Trace:
> [  103.967805] [<ffffffe00020372a>] walk_stackframe+0x0/0xa2
> [  103.973206] [<ffffffe000bcf1f4>] show_stack+0x32/0x3e
> [  103.978258] [<ffffffe000bd382a>] dump_stack_lvl+0x72/0x8e
> [  103.983655] [<ffffffe000bd385a>] dump_stack+0x14/0x1c
> [  103.988705] [<ffffffe000bdc8fe>] check_preemption_disabled+0x9e/0xaa
> [  103.995057] [<ffffffe000bdc926>] debug_smp_processor_id+0x1c/0x26
> [  104.001150] [<ffffffe000206c64>] machine_kexec+0x22/0xd0
> [  104.006463] [<ffffffe000291a7e>] __crash_kexec+0x6a/0xa4
> [  104.011774] [<ffffffe000bcf3fa>] panic+0xfc/0x2b0
> [  104.016480] [<ffffffe000656ca4>] sysrq_reset_seq_param_set+0x0/0x70
> [  104.022745] [<ffffffe000657310>] __handle_sysrq+0x8c/0x154
> [  104.028229] [<ffffffe0006577e8>] write_sysrq_trigger+0x5a/0x6a
> [  104.034061] [<ffffffe0003d90e0>] proc_reg_write+0x58/0xd4
> [  104.039459] [<ffffffe00036cff4>] vfs_write+0x7e/0x254
> [  104.044509] [<ffffffe00036d2f6>] ksys_write+0x58/0xbe
> [  104.049558] [<ffffffe00036d36a>] sys_write+0xe/0x16
> [  104.054434] [<ffffffe000201b9a>] ret_from_syscall+0x0/0x2
> [  104.067863] Will call new kernel at ecc00000 from hart id 0
> [  104.074939] FDT image at fc5ee000
> [  104.079523] Bye...
> 
> With the patch we can got clear output,
> [   67.740553] sysrq: Trigger a crash
> [   67.744166] Kernel panic - not syncing: sysrq triggered crash
> [   67.809123] CPU1: off
> [   67.865210] CPU2: off
> [   67.909075] CPU3: off
> [   67.919123] Starting crashdump kernel...
> [   67.924900] Will call new kernel at ecc00000 from hart id 0
> [   67.932045] FDT image at fc5ee000
> [   67.935560] Bye...
> 
> Fixes: 0e105f1d0037 ("riscv: use hart id instead of cpu id on machine_kexec")
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
