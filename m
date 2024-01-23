Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8232DC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 22:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzx0ji2GQa4UvbclS//zWJtFvrt6/kgcV6gVuWFOz3g=; b=jYW17K80VrKc5/
	YidtaoNk6d1xfBNMo1q0+afuf+V5qgXpg9RRRElgY7fPUvyBiwtMSNNVHvfNJ7p0LPtQNmqmc3tRy
	7H7IhnT6RGYDl9iKqrGa4pioG/1gmAx2nrtzF60Naq8dYR0fBqrrLvq83Z/NQv2H/1t8cOP2qXjvx
	rgRAy3hFDZZk54ZpdrV5nL5W3wTVmRtabVf5IuS+YVbaark3UMJ2DMxfYFruh2AdWfu30SbUWAz+V
	yg7Ox8i3yJVqWQUaXp6jCCGl0HfaC1sw7morGL3w/SltZG2H3FiM5G79mtUDXcLphP4J3D8boAUSS
	J13jIBXaWEbol/HuVMSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSPSQ-000jJy-33;
	Tue, 23 Jan 2024 22:41:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSPSO-000jJG-1S
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 22:41:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 26F78CE2FBA;
	Tue, 23 Jan 2024 22:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D1F8C433F1;
	Tue, 23 Jan 2024 22:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706049681;
	bh=KBDvm6jR3jzfuV1y7xgwPcuBi4NbghpqGKRgTpdaYA0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ID5Mj2TG0vzsElzcLaMMnAeMTMVOy3C7JHQmAlFvDkTN6e51X3uYJw58Msqy0vT1P
	 Sh2qQipu6ey19zHf7Lg3RNlPjzBpjW9T/P2fKyDQpxbrBMstepn64I2VFf5FraHQ3A
	 gk5JYjZY+mJPUZfaTzY/eX6l2/BZLpOitxIdeHie+fA7QKeQAQQlgv5PU9AjolshuV
	 V+hKnmz6hxJoi6WKcMT55N3wLRzhvfIg4H5NTXp4KeRzgtPJ/QIv4bep2o/UXBwg/5
	 3z7lS0DKBMV4mgimBuNujDHL4xl747fdAY6S1tla2VhN+eJmR9u8yGYr+L95BzmT3A
	 OyhtMLfb/pCyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 489EBDFF761;
	Tue, 23 Jan 2024 22:41:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf] riscv,
 bpf: Fix unpredictable kernel crash about RV64 struct_ops
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170604968128.538.9171637206468068779.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jan 2024 22:41:21 +0000
References: <20240123023207.1917284-1-pulehui@huaweicloud.com>
In-Reply-To: <20240123023207.1917284-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, palmer@dabbelt.com,
 luke.r.nels@gmail.com, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_144124_687016_7A61F45B 
X-CRM114-Status: UNSURE (   8.48  )
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
by Daniel Borkmann <daniel@iogearbox.net>:

On Tue, 23 Jan 2024 02:32:07 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> We encountered a kernel crash triggered by the bpf_tcp_ca testcase as
> show below:
> 
> Unable to handle kernel paging request at virtual address ff60000088554500
> Oops [#1]
> ...
> CPU: 3 PID: 458 Comm: test_progs Tainted: G           OE      6.8.0-rc1-kselftest_plain #1
> Hardware name: riscv-virtio,qemu (DT)
> epc : 0xff60000088554500
>  ra : tcp_ack+0x288/0x1232
> epc : ff60000088554500 ra : ffffffff80cc7166 sp : ff2000000117ba50
>  gp : ffffffff82587b60 tp : ff60000087be0040 t0 : ff60000088554500
>  t1 : ffffffff801ed24e t2 : 0000000000000000 s0 : ff2000000117bbc0
>  s1 : 0000000000000500 a0 : ff20000000691000 a1 : 0000000000000018
>  a2 : 0000000000000001 a3 : ff60000087be03a0 a4 : 0000000000000000
>  a5 : 0000000000000000 a6 : 0000000000000021 a7 : ffffffff8263f880
>  s2 : 000000004ac3c13b s3 : 000000004ac3c13a s4 : 0000000000008200
>  s5 : 0000000000000001 s6 : 0000000000000104 s7 : ff2000000117bb00
>  s8 : ff600000885544c0 s9 : 0000000000000000 s10: ff60000086ff0b80
>  s11: 000055557983a9c0 t3 : 0000000000000000 t4 : 000000000000ffc4
>  t5 : ffffffff8154f170 t6 : 0000000000000030
> status: 0000000200000120 badaddr: ff60000088554500 cause: 000000000000000c
> Code: c796 67d7 0000 0000 0052 0002 c13b 4ac3 0000 0000 (0001) 0000
> 
> [...]

Here is the summary with links:
  - [bpf] riscv, bpf: Fix unpredictable kernel crash about RV64 struct_ops
    https://git.kernel.org/bpf/bpf/c/1732ebc4a261

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
