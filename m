Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C9EC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pw/9Y6g9dPLwQC+HuXtVnUNV3/Ufkpb61aUojWklkak=; b=vzzM7ALh4yyaiC
	6gX8vDSas4zbVJ18IUZbd33cChDeQghpZ1uaaHUbkN6VSzjRqovKl8877kxw7Sall9yjVU7FMsEHl
	nJvTDAXsHbcCU2hJaXVKerxYdH7lCPNaRsPc7vp1tgksw1l0+v2OqEHzLsKYFDqLoOS9PQtQnviFI
	+KDPlrEtx5f7Rp2b2n9bjly0lcBI9qpLQm/skWp+a8++y590erYe4N+zXy2R++XymKZZDzIAXhZ4e
	IYyGRyBe0i8Wxv/ju9g7YesAePC55AkdLysSinT93vpMhe5buuuyKSF1fCsDQ2rmql+7Mc/rn80yy
	HKUa31O+sS/geoQkxMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6J7d-0000000B7Dy-21EA;
	Mon, 13 May 2024 00:00:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6J7U-0000000B77j-1XNt
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 00:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9803560BBC;
	Mon, 13 May 2024 00:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD42FC4AF08;
	Mon, 13 May 2024 00:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715558429;
	bh=e2NpOR2CweEKvqvlaEK0pm/6D2en3jgIpSgJ46eRceA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YzAXZuL24mQqZ0qK+/OMp07ToKUNqmOycs4b2wBwgP7vFX80wU8v2wXxnQRnH2Sj4
	 e45QZoxmPPjHGl5GwA+KAICSLYQVPKKfG22iKb2qBt/VTRs+ybs3O19PMCYinRzFeG
	 LuAruWUGwELm28J/rVCEAcFioBIV/iTGL3iyurJSVGSl7n2lEetRQE7T0rtWPSgcwu
	 z/prxpV4gNm3PtKqD6rONtXOXpJ9w64BBt9ilE80dCX2HeOJQxVhkYYEVGuB2iDXbm
	 QofhHKbCDcASOT8eSd2NEI4AAy765DtUJz80wRTBOdP1YWraBs9YeL4ACmrBLza+KZ
	 kSyrtKPuQ4Cyw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBEF1C43444;
	Mon, 13 May 2024 00:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf] riscv, bpf: make some atomic operations fully ordered
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171555842976.18024.13752863594876761911.git-patchwork-notify@kernel.org>
Date: Mon, 13 May 2024 00:00:29 +0000
References: <20240505201633.123115-1-puranjay@kernel.org>
In-Reply-To: <20240505201633.123115-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org,
 pulehui@huawei.com, paulmck@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 puranjay12@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_170044_505642_712F99B2 
X-CRM114-Status: UNSURE (   6.36  )
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

On Sun,  5 May 2024 20:16:33 +0000 you wrote:
> The BPF atomic operations with the BPF_FETCH modifier along with
> BPF_XCHG and BPF_CMPXCHG are fully ordered but the RISC-V JIT implements
> all atomic operations except BPF_CMPXCHG with relaxed ordering.
> 
> Section 8.1 of the "The RISC-V Instruction Set Manual Volume I:
> Unprivileged ISA" [1], titled, "Specifying Ordering of Atomic
> Instructions" says:
> 
> [...]

Here is the summary with links:
  - [bpf] riscv, bpf: make some atomic operations fully ordered
    https://git.kernel.org/bpf/bpf-next/c/20a759df3bba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
