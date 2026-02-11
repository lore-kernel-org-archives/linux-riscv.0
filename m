Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B90ECD6EE
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 21:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQH+c8O9gSWg8Qwfu2cGB9tzEl/XZ+efz/DrI/treb8=; b=C3wV2zm+CGldBV
	Vqdbp++sE+G19HcNZ4Fif2174qRw9OMJdRODqKY9CikbbIUzQYoJ51s1GDeu5JV4iwKGEh4hNhp8d
	mtw6sGbJiGLfL+L1pzO6s8SpiYD3wiaPoncq3MgGLcWrnFEOmTXdRlTjC/GUmFMKQ0HoG1sbTpoFV
	JVMbl0bhavg9zzcFUdKLJ+w7UVxEWhVGT4KXhN5ecBMiXx8yTTylbdEOhaICO5wRi4tib0nxvlzKZ
	d4sij5qCEYsEeU52rJtLL/ETLtDxaWNFbUAAcFTlMVpTVLEjZlWZBUDruOs4LukjCEmfUlWk/Iwzw
	hjdc53Ra5aLuPLEs3nqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHmq-000000015Mt-3AoQ;
	Wed, 11 Feb 2026 21:30:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHmq-000000015Mn-1G2r
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 21:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33AB260010;
	Wed, 11 Feb 2026 21:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAF8C4CEF7;
	Wed, 11 Feb 2026 21:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770845414;
	bh=jGSWgobZu8SSkt96gwsYuyQDTPK+maSuIoQySGd+Yiw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LXLE/ffKLeIzA6+Yz0lSWUCmtRxXLvs310sCDcDp3Pb+tTvSP498dd6ZZpS4+7Ou3
	 3eiZNuzIpH2TrskdtyHS+LmQK5J+7TdpXfa4NasD169uYdxXpkKQqX+VKvkOuJVZzi
	 xsjIlBF2p2eyVBYdCO4BiRgukzeYj+LgLFn6wWq6Jr/ukm7wYZlwomhLWqblETvo+K
	 8ijDgH3//TIh1OnD0x7eaAJ3oQidiOKrdalseABYmvHojkwYPuH/yCS4HlH0RSMACA
	 ccWVC8ERTUbtRkiCNsozjHKmfIsv+pMyTTyjoE2eoORMIpOf2aE0+r2ar2t8Ye1CYR
	 RXXXn3hV7mj9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C265C39EF964;
	Wed, 11 Feb 2026 21:30:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v4 0/3] bpf: fsession support for riscv
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177084540958.756737.255449740151994166.git-patchwork-notify@kernel.org>
Date: Wed, 11 Feb 2026 21:30:09 +0000
References: <20260208053311.698352-1-dongml2@chinatelecom.cn>
In-Reply-To: <20260208053311.698352-1-dongml2@chinatelecom.cn>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org, bjorn@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jiang.biao@linux.dev
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

This series was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Sun,  8 Feb 2026 13:33:08 +0800 you wrote:
> Implement bpf fsession for the riscv architecture.
> 
> Changes v4 -> v3:
> * fix the build error
> * v3: https://lore.kernel.org/bpf/20260206122002.1494125-1-dongml2@chinatelecom.cn/
> 
> Changes v3 -> v2:
> * fix some comments.
> * v2: https://lore.kernel.org/bpf/20260206115823.1070354-1-dongml2@chinatelecom.cn/T/#t
> 
> [...]

Here is the summary with links:
  - [bpf-next,v4,1/3] bpf, riscv: introduce emit_store_stack_imm64() for trampoline
    https://git.kernel.org/bpf/bpf/c/63ad3d614241
  - [bpf-next,v4,2/3] bpf, riscv: add fsession support for trampolines
    https://git.kernel.org/bpf/bpf/c/2277c14bc90b
  - [bpf-next,v4,3/3] selftests/bpf: enable fsession_test on riscv64
    https://git.kernel.org/bpf/bpf/c/5749b6532b4c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
