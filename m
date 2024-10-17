Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC025D374A6
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2cEhspT3NmxZh+qJyacDmm5RERFBLczHReWO2M8+lY=; b=Dg/w5tFTaeVLef
	pWq5I+V0zRZG07HJBnQf13jTTLxPmk0HGpUZMeH/n83zUYmyvOfjwiDj+Kmr84qi1D2dwev0Hbo1y
	FGdsTIs6GT/MVDwgwgKaFQdTXfNosiYedb3PgD+ul5aqijSCf9pemBCM4ZDkea+j122Xa/seUIigZ
	d7SV+QwO2drubJblmq3NNsmR6F/+i0VFNFCzMVUjCdYptF2J+VzWgPjI5njKJ1pBMluK3AEtpj73E
	j5h0i5EJIlJHm869Wffa+mZ9/T899+T8wR29Cey9Y1DuSUf2IFP2N1ztHxymnCcC+6PM9cUwI5+sG
	I+0qgmf6kMPqPRVWZOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S8x-0000000FEUH-2CnA;
	Thu, 17 Oct 2024 15:10:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S8u-0000000FETp-3A3Y
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 15:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 881C35C61A5;
	Thu, 17 Oct 2024 15:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F33CC4CEC3;
	Thu, 17 Oct 2024 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729177823;
	bh=hvs6/KkeeLfo/pqdhicK7HWBMyjlkj8lfbeYVi+E85w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mBpGVze83vITnoccm1uqKS79tpMySV/jX0eTav9Z5urwp1U94OmasOPoHrRw3xPeL
	 b9WiR5VDQyOOQcEZSkvjyRUZCDSXbhiOlaypWaYskkAjdGevdGNjC1tifV9we5jz/P
	 RGMVA73P08br45YQ01NONFZ6/tS7Rto5ehMj/FX10aIkc9FAMfFyMTpoSV+7KvfZUh
	 SieevRshTF1UnQDDiPYar99am7wndpUWtjVIQk/RbidOXYcHakVlY8xYN9L98DmgLm
	 pQ2sk755QpAS4cq94TqVJY6Yl2/j6Kfg142d9HSgPkJ+jQDx/tH9pPV/hnC6BaDqPy
	 e5nJM/G8Kk5EQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D023809A8A;
	Thu, 17 Oct 2024 15:10:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv, bpf: Make BPF_CMPXCHG fully ordered
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172917782901.2501843.16846439136645084983.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 15:10:29 +0000
References: <20241017143628.2673894-1-parri.andrea@gmail.com>
In-Reply-To: <20241017143628.2673894-1-parri.andrea@gmail.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_081024_876504_154E5775 
X-CRM114-Status: UNSURE (   7.28  )
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

On Thu, 17 Oct 2024 17:36:28 +0300 you wrote:
> According to the prototype formal BPF memory consistency model
> discussed e.g. in [1] and following the ordering properties of
> the C/in-kernel macro atomic_cmpxchg(), a BPF atomic operation
> with the BPF_CMPXCHG modifier is fully ordered.  However, the
> current RISC-V JIT lowerings fail to meet such memory ordering
> property.  This is illustrated by the following litmus test:
> 
> [...]

Here is the summary with links:
  - riscv, bpf: Make BPF_CMPXCHG fully ordered
    https://git.kernel.org/bpf/bpf/c/98cd61955771

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
