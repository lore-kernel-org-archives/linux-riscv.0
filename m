Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D2DC5CFCF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JILqoY8spQWbrnHXVJ7gaorfaaGWoUwft1aw75iXCOw=; b=U/iw+a0V9zKcGE
	q2sgQcP6Ris7l+W9xZNBbwn1OeAG/EpNi7G+RVbEQlCm/GzKS4/P0KemBzXKCQ/Xxks7bed4KKAyW
	qmV+HqsalmD3lUNBTDkzcS3DBpUg7TstTY5vEwtolxi3UhItbRg3LFY+U40+IbISdWYEQT0fGoi4x
	W2KrQOZNiohWn5gYgbQPqYNcQaP6/ex0cTfPofvksou7l+k+FHjq1bR2VwDTV9mvGifAvJCvy45R+
	RIZk2/4wQb9ns3A3NHbGQdDLyZSTVdaonLR69HJzeewRSNmJtwYfrHEbQML7HBXOjbgrAZINzqWSR
	LpJ9cC5ophXXvu2b47PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuuxi-00000002w07-1jq1;
	Fri, 14 Aug 2026 16:40:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuuxg-00000002vzz-3Mlg
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 16:40:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C39C260120;
	Fri, 14 Aug 2026 16:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760E51F000E9;
	Fri, 14 Aug 2026 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786725651;
	bh=pesslFaOEa8JvyJ8uAg+pzK1/3qJ0pf9Cp98BtT67BA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=B5t8JaxHUQsD7z+6awfaL8VBAOPgBvTwnd1TusZLms3Y8soHGmIJAHOHbio/T4xE/
	 QYp8VF4B1BXPHpookI2WFs8a+y5LyfNhCwD+ETzU7dJiJEm1ilkh+7rEEx0R2zSOyO
	 3uBO02WIuIs62GgIQeEv5kMPjK7JkZNfIZdgg0rLXMUKMeIlhrE9qkZoXR/qHpNC0Q
	 0fWdEJVAXAqA2Z8e7JQ01rSzfxkKWwfyCp13rqCtUkrt235VJEogbacq4vAt3CFCSK
	 NGFQYs7VQZoOZrCrpvzRroHx8K60FV+nz/zJZ1q7ZswhpZT5zXMvVrVS+nclttMcA7
	 J1ELHJ3pykqYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D099A3924451;
	Fri, 14 Aug 2026 16:40:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] riscv,
 bpf: Fix missing sign-ext for signed 1-byte and 2-byte kfunc args
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178672560540.3871347.8662836444766849077.git-patchwork-notify@kernel.org>
Date: Fri, 14 Aug 2026 16:40:05 +0000
References: <20260814064726.3607615-1-pulehui@huaweicloud.com>
In-Reply-To: <20260814064726.3607615-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
 pulehui@huawei.com
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

On Fri, 14 Aug 2026 06:47:26 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> On RV64, the ABI requires sign-extension for signed 1-byte and 2-byte
> kfunc args. However, the RV64 JIT currently does not perform
> sign-extension for such kfunc args.
> 
> Before commit 7ce090afbf72 ("bpf: Infer zext_dst based on static
> register liveness analysis"), state pruning could potentially omit
> zero-extension of 32-bit subregisters, which inadvertently masked the
> above issue by making the args appear as if they had been properly
> sign-extended. After that commit, the problem is exposed, causing the
> kfunc_call/kfunc_call_test4 selftest to fail.
> 
> [...]

Here is the summary with links:
  - [bpf-next] riscv, bpf: Fix missing sign-ext for signed 1-byte and 2-byte kfunc args
    https://git.kernel.org/bpf/bpf-next/c/f2aaa6215910

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
