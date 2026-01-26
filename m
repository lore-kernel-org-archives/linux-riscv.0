Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AB2C88E43
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xoZH8edShPa+HWTY8fYej1uDSC42KazU/LnBPTTnEc=; b=fkaEdHUh9F4jv5
	yvtl8NPFYWyaYJxDY9qbmDFvMJL6SIsaRW8vbrPK7w777rMh3/5L7Sj7IylV06eRcyLt3LjVGktbF
	bwMP50ZxyFg+kkVuEK8Gv711/b13gK0Ufnx0mYXFtHAzq1HPAyaaXiNmslGTql1bIGkg1AIaNGHDj
	zEVD28/IrgUq5Q6EBZt9hacvPRiPTCCE59numiUOsfB8R9pH/CDc616d/KmOhWToCPJ0Zm8V1sTXq
	Wb7kKJ8Ur0WC6G0K+gWM/E24t0Sdv63Rk0KUprPojkDBbIdSP0R/X3gSAHerSwQ9szOBE758zqzX4
	hcYNpxsTJTywp3a8KfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE70-0000000BsaF-2o3B;
	Mon, 26 Jan 2026 04:22:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE6u-0000000BsY9-2DxK
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:21:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94843444A3;
	Mon, 26 Jan 2026 04:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A981C19425;
	Mon, 26 Jan 2026 04:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769401315;
	bh=Jx+su4XvEX1CZyM9jePAP3z0M6axAToPzY131VK8tko=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PLwuS2I79MVl7aCppoGfqUgjVYTb/MU+gQ8S9BJPqIrT4p2yBLk+l13sFuVdRvnGs
	 hAEPu/Byg0EBDg0arshMBfDn0gDRnKuASHuAdUGBi3xL8uAr7XPaRDVBQ7XoS6gLBa
	 DFa6P86HshyML1yHXQ+KGTZTsYk3AMn1SpLm9gF4koM/yfkRj6lz/Yugtl7NK2Hwgb
	 Z0aIGIFiemuDqJt+pJaECN3MzfOogXJnTOqHdRanMGHXXzEW+m41g7couuAMnR2eVL
	 cDGP3xfmZ1wCxim6sIrJViTG2+fXTISwqgDvi+AeczN7GCBjdTAOLo54A59nAXWBQM
	 dijPdY1wlDI2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4ECDD3809A22;
	Mon, 26 Jan 2026 04:21:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf v2] riscv,
 bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176940130985.4057692.9394372597802605336.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 04:21:49 +0000
References: <20251219142948.204312-1-dongml2@chinatelecom.cn>
In-Reply-To: <20251219142948.204312-1-dongml2@chinatelecom.cn>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: linux-riscv@lists.infradead.org, ast@kernel.org, schwab@linux-m68k.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_202156_611253_411C410A 
X-CRM114-Status: UNSURE (   9.34  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Alexei Starovoitov <ast@kernel.org>:

On Fri, 19 Dec 2025 22:29:48 +0800 you wrote:
> The usage of BPF_TRAMP_F_ORIG_STACK in __arch_prepare_bpf_trampoline() is
> wrong, and it should be BPF_TRAMP_F_CALL_ORIG, which caused crash as
> Andreas reported:
> 
>   Insufficient stack space to handle exception!
>   Task stack:     [0xff20000000010000..0xff20000000014000]
>   Overflow stack: [0xff600000ffdad070..0xff600000ffdae070]
>   CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)
>   Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
>   epc : copy_from_kernel_nofault+0xa/0x198
>    ra : bpf_probe_read_kernel+0x20/0x60
>   epc : ffffffff802b732a ra : ffffffff801e6070 sp : ff2000000000ffe0
>    gp : ffffffff82262ed0 tp : 0000000000000000 t0 : ffffffff80022320
>    t1 : ffffffff801e6056 t2 : 0000000000000000 s0 : ff20000000010040
>    s1 : 0000000000000008 a0 : ff20000000010050 a1 : ff60000083b3d320
>    a2 : 0000000000000008 a3 : 0000000000000097 a4 : 0000000000000000
>    a5 : 0000000000000000 a6 : 0000000000000021 a7 : 0000000000000003
>    s2 : ff20000000010050 s3 : ff6000008459fc18 s4 : ff60000083b3d340
>    s5 : ff20000000010060 s6 : 0000000000000000 s7 : ff20000000013aa8
>    s8 : 0000000000000000 s9 : 0000000000008000 s10: 000000000058dcb0
>    s11: 000000000058dca7 t3 : 000000006925116d t4 : ff6000008090f026
>    t5 : 00007fff9b0cbaa8 t6 : 0000000000000016
>   status: 0000000200000120 badaddr: 0000000000000000 cause: 8000000000000005
>   Kernel panic - not syncing: Kernel stack overflow
>   CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted 6.18.0-rc5+ #15 PREEMPT(voluntary)
>   Hardware name: riscv-virtio qemu/qemu, BIOS 2025.10 10/01/2025
>   Call Trace:
>   [<ffffffff8001a1f8>] dump_backtrace+0x28/0x38
>   [<ffffffff80002502>] show_stack+0x3a/0x50
>   [<ffffffff800122be>] dump_stack_lvl+0x56/0x80
>   [<ffffffff80012300>] dump_stack+0x18/0x22
>   [<ffffffff80002abe>] vpanic+0xf6/0x328
>   [<ffffffff80002d2e>] panic+0x3e/0x40
>   [<ffffffff80019ef0>] handle_bad_stack+0x98/0xa0
>   [<ffffffff801e6070>] bpf_probe_read_kernel+0x20/0x60
> 
> [...]

Here is the summary with links:
  - [bpf,v2] riscv, bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK
    https://git.kernel.org/riscv/c/8f3e00af8e52

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
