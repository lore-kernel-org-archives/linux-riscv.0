Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB30FC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3BpscEYEGznM5qo5+230dnfLOroTaUe6VzcXj6UvhE=; b=19CnwxOtby2DEh
	Zf7WkQetGJ12oyOPQM1fyaFA5EZn8XoMLkL2SxxsodY5SFuzWDDQVP1I+Qpp8YpMEUMNPT/ER9H9q
	OI3x7F6Adb+N6jD9fWPaP1YXJd87TQA9o96fo6FYJRlvAXgPX/DiMfbs75kgcQB3VL02QNxbdSAEN
	aatqYbLFMpcttLHF+jsuivJ/QWw/L3tM5OdFrVhrNLJ67GzmWq/F5W2YP5l9m14E/kFjyw97R/lnw
	mlABC4tq10I1e/MiAL8Daf3UfzpN3BtIrv2GXv2sRHuDCwCwEtzTUctHmDWyDHjR4UcHDAA22yLH5
	0q7UkvdW2yaG8HI32Ehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAXBh-00000009IL1-3uPC;
	Fri, 24 May 2024 15:50:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAXBe-00000009IKM-2H8e
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 15:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80E1263193;
	Fri, 24 May 2024 15:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F08FC32782;
	Fri, 24 May 2024 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716565829;
	bh=4jIIEb6/gXnMNCg0cderAh9wEIoOYtF0udZJb/wrl+E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jeE5LjSmmqOHVFQZidJJzaINJGj4SkgBwTUUkJ/px4uTN/JxeS6Xz0Sx/iUKO4dIu
	 DEh+zeP+4CheqspYZGnoqJOGl4LPVdKWsA1A7n5vuTFpGyjNtOKdaDxvBXZsTyhIA6
	 HLYUOev/CYKAadJxJGm1tY4tAGdQCJd3Cuitj8psNJkHSHh35fkkX/32OtExMZSGQZ
	 fQx0GtjhIHOHQ9gjFpBUyf48LgYiMBtNONrTi7XV9JlivuUkwYtJFUZjLXGQIYVd6g
	 AXxCPXNx9B5Cp/SV9BL6nHAQIuARL8a6VzHyNSIMfygyyjm+PKeFJQmKw4CNnNgi0Y
	 iOqdEhIh81Ejw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EFC6FC4332E;
	Fri, 24 May 2024 15:50:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv, bpf: try RVC for reg move within BPF_CMPXCHG JIT
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171656582897.29053.8717064385202136071.git-patchwork-notify@kernel.org>
Date: Fri, 24 May 2024 15:50:28 +0000
References: <20240519050507.2217791-1-xiao.w.wang@intel.com>
In-Reply-To: <20240519050507.2217791-1-xiao.w.wang@intel.com>
To: Wang@ci.codeaurora.org, Xiao W <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, pulehui@huawei.com,
 haicheng.li@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_085030_645734_94DE4824 
X-CRM114-Status: UNSURE (   8.41  )
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

This patch was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Sun, 19 May 2024 13:05:07 +0800 you wrote:
> We could try to emit compressed insn for reg move operation during CMPXCHG
> JIT, the instruction compression has no impact on the jump offsets of
> following forward and backward jump instructions.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  arch/riscv/net/bpf_jit_comp64.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Here is the summary with links:
  - riscv, bpf: try RVC for reg move within BPF_CMPXCHG JIT
    https://git.kernel.org/bpf/bpf-next/c/99fa63d9ca60

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
