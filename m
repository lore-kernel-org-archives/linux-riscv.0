Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD62CEDDA9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 01:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApiPR6qZwBr/Tr34D6JkWf6svBjxGJuPM5VNCwHsjZw=; b=n1cPVdO+22H26S
	uLT8S/ea3LEcGNKVXc0DtboeaDduY2o/pwBYF8+7iA5+5VAqT7rOnLxQRpUjljAPxyHfu1zdjljeT
	SVOC6eylQ4n3SsUT6p6jc614nfigO+9kuP3ZMuP703Sl7ojtXGKfR1GyphG2CBR031Y0uLHmQrGfh
	6vXdB+rrONMzWBkNxfvSRQi+2AZif334yEODT6IqVc6dCa6g836VA+lHr9nW/QqvrPCUdD0wCNd/X
	P2gWZ9ofExMhOOPi0iC2g0wuyOemmRehDJCnTwukAuMvfjQu4NmIeffgA75vFggqc9kM0ceu20A8Q
	OoRwny92m7IbFbY/5VFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syi0d-0000000BDcp-110Y;
	Thu, 10 Oct 2024 01:30:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syi0a-0000000BDcO-0jhx
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 01:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C66585C4BAA;
	Thu, 10 Oct 2024 01:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE64C4CECE;
	Thu, 10 Oct 2024 01:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728523825;
	bh=QLp0IT+USLybtIEn9rosf67rYcbk9sKmf9oRcZt4NGA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hua9PJVtuJX/DNJFfBdnSZv+Hsf74Z0Fo42dgBwfETPvhiV4vfjDSVfvftOF+oJ2S
	 13BEHeb9EDTrHDledEcub+1YY3oMQeuTGC81PvijgO5KJt/cKMQyarT30cjTw3M/TZ
	 nLIXsrGNVhfamLgC6GMuSYUrZofz40J9WDXub7IGn4yXOH8nJDzKpxlb2buqAT0lf0
	 a44m/jxo0NkASm0flaeptTL2lDXuDli05k5iohdJ7g/71WOLwmOIsikbdKzkQDeZSS
	 mnRPC6IAk0OMH4AdNxZNuJi0HfUbEeXldn5m0B5SiQkvhQWr1jJCvuw4WcdgQBUmqd
	 tTRZ8Bc4p9utw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3473806644;
	Thu, 10 Oct 2024 01:30:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf] riscv,
 bpf: Fix possible infinite tailcall when CONFIG_CFI_CLANG is enabled
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172852382954.1532001.10566819180554959939.git-patchwork-notify@kernel.org>
Date: Thu, 10 Oct 2024 01:30:29 +0000
References: <20241008124544.171161-1-pulehui@huaweicloud.com>
In-Reply-To: <20241008124544.171161-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, bjorn@kernel.org, puranjay@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_183028_276616_F83AFED9 
X-CRM114-Status: UNSURE (   7.65  )
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
by Alexei Starovoitov <ast@kernel.org>:

On Tue,  8 Oct 2024 12:45:44 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> When CONFIG_CFI_CLANG is enabled, the number of prologue instructions
> skipped by tailcall needs to include the kcfi instruction, otherwise the
> TCC will be initialized every tailcall is called, which may result in
> infinite tailcalls.
> 
> [...]

Here is the summary with links:
  - [bpf] riscv, bpf: Fix possible infinite tailcall when CONFIG_CFI_CLANG is enabled
    https://git.kernel.org/bpf/bpf/c/30a59cc79754

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
