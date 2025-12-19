Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F69E66884
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 20:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YLrI0GowbJtt23Br4Vwf0gK/NlmA7ohZ+numwRBYAI=; b=K00ea3eKP8hAAa
	ljMOkPbIrbgPDAreN7BdFWuP7RE5Tx2UA+BIqBZDR3ulemejZPRVVMrxp1J0YnPsxx99Mtvw9wFNS
	a/E2nu/RBFrwYJ4zy2xISZHgaqZtKGqWiNFafCJrmCkDhqHq3bfkR27GwoWeFImNF7TjOAnVZxTNj
	+4vrDphSeZFe8cEkDnubATHCPlIGZxNKVeOzTDAg166yP4JCN7SgiUAqzLL1xrgV0ZU8t4dxVIotz
	6WNsV882HdsQR+PgUxZVMpux8Z6dSbl/9XoE+i7brW2SqYnWmp6/vH8KtkqZ2AXqfL8M72TML6sCF
	v6BhD7ZVzi9B4Xvf2pLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgqn-0000000Aw3E-1ygW;
	Fri, 19 Dec 2025 20:13:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgql-0000000Aw15-0OCI
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 20:13:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E3E5406C1;
	Fri, 19 Dec 2025 20:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB65C4CEF1;
	Fri, 19 Dec 2025 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766175198;
	bh=aRwMUESpiltUQ2s00opo5VRbvw+oBsSsn0KkMj6sCz4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qBB3IN/BWyjWIhM3of5YvVNu7B/uxLto2mVzhrtEx0zo/jg9M5yuumJ2r7OkZiDfm
	 Nu1TPDoIZVFqICPzqqU3DCvcTEXKxemGWLw+Td5BPjXlA+VFC+kJA4PU0FgYjRokQp
	 0fWf5H8kAnTEP8wM6hQmvB7fK2aoK+dtYILB7pyTi+JW0cOG9COZQzVsp43uLC02vp
	 3HQQM/vWVnyyW/FW/0yEnmpLCxmF4Imf+PA4IGU4t/iqfckoepw6u0rmUYWBHz2JTD
	 kTx0C1ZHsVoTPl43yhWAYRd+jQTXPGHRKl0bjIg+aTPJx0YKx/CR6Tg9EBesyF5Ew5
	 NCumm2TLTi/KA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B56DC380AAF2;
	Fri, 19 Dec 2025 20:10:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf v2] riscv,
 bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176617500654.3992426.2561516989478104083.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 20:10:06 +0000
References: <20251219142948.204312-1-dongml2@chinatelecom.cn>
In-Reply-To: <20251219142948.204312-1-dongml2@chinatelecom.cn>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org, schwab@linux-m68k.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_121319_166034_1F819559 
X-CRM114-Status: UNSURE (   9.30  )
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

This patch was applied to bpf/bpf.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

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
    https://git.kernel.org/bpf/bpf/c/22cc16c04b78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
