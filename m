Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76563C25B4F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5QCyH9iUwSIFuOK9SYi9FK/K1itqgXIKoHvF4pCqWw=; b=09nf5eLDh+u/wM
	3/7M9J3EShmi3kT3rYtsz/iuqgIT3aYMLC3l8DPEAhEYsS2QPS4DDYN3Sb+zGs95YblN0AbLAoBim
	FNlhuuFsSOgSRraQZtDTz74V0zBPdYxTpkgQc0sy/xJ6CY0pk9+8oT2NExGjNrgLyIHFBeSqh44Fg
	TCqSzYcln5rmUjxpLr4e9fOLUIwl3XB9NY3oqY7Mmkaf30xh4fitpu5UJbbPwck5wP9JPbCecMMpS
	FDiMGU0hN47t4ZSnN8XC3BHAWVOtgRcZVhp+6ocTVoMdc3hjm0GN+hHMFQRwp1GcA7eRCpE7yx+C8
	0l/z50sUZhZzEr9/bfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6J7p-0000000B7Jb-2vgN;
	Mon, 13 May 2024 00:01:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6J7U-0000000B77x-1Wt0
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 00:00:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69F2260BD3;
	Mon, 13 May 2024 00:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BAA6C4AF68;
	Mon, 13 May 2024 00:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715558430;
	bh=DiRTuxx7jNsBtxssJVhLLs4f7CaGC42GVb0//KHi0+Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DNezXcoAnZJoDgMjJrPT+jgW4KILzJjpEM9I1RtcUGJaYC+xaKT3GH36QU49ZGauM
	 D6GRY1JhP+lgWjY13ekzLROJQGQrwGpEYG23kSIO8rhVWMFQE85a466uE05fLHh+M0
	 tpUuyxGA90OFXWrZFO6j7SgBHVtj6YySFLgDqa3TckzZcOaOevrl+vCbSmJDS0NG5d
	 dl63CnVVAKaINqsr29kIpxYjbVO8qhLjd1Qmngtjb0gnklBRcPrZnURQKQ+L/9Fs6Y
	 FAn2A7ehdYOaabu2DvDuJ82ZGekpsU0ht20RCfMszzsB+ComXlYHlqrgRkVT7v1mJF
	 xQ0Gps4GxHOyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EB394C43336;
	Mon, 13 May 2024 00:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv, bpf: Fix typo in comment
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171555842995.18024.4820208884159276915.git-patchwork-notify@kernel.org>
Date: Mon, 13 May 2024 00:00:29 +0000
References: <20240507111618.437121-1-xiao.w.wang@intel.com>
In-Reply-To: <20240507111618.437121-1-xiao.w.wang@intel.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, pulehui@huawei.com,
 haicheng.li@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_170044_512175_7C59C99A 
X-CRM114-Status: UNSURE (   8.70  )
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
by Alexei Starovoitov <ast@kernel.org>:

On Tue,  7 May 2024 19:16:18 +0800 you wrote:
> We can use either "instruction" or "insn" in the comment.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  arch/riscv/net/bpf_jit.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - riscv, bpf: Fix typo in comment
    https://git.kernel.org/bpf/bpf-next/c/80c5a07ae673

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
