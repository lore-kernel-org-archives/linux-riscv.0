Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923CFCE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 08:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xu7/2VfbMHpkGoGWwWIJzuqdj8HKBnTgD0GY0xtioZ4=; b=z9NGI0NEiLcxEY
	S2k7MP2iB4LwPQFSjXzOOaru5j9VOMinzIO1OwrQpjt2DH79LUxZ9lpKtWf9470B1p0q3BVWwtclZ
	wi9bMClIkiiH0zFGBcAZMQHITcAR/OlJOHHRoTM7dyS1oAUtrErnUB3okWDtmsAdn16IM9GZMY0vd
	4h2IiIT5mk5k4OPEEw7TckryIOIQFF7WB6VrJaQttlrvn66e0Ry9hgINX2mAXVscHJsVDd6nbH/0f
	+wctk5eGGI4TAu0vG2YhSa2zNEdPGRKPmI/nR9neoWzF4iUB+Rf1q2CQE9WaSSgxdhIcLUZMn7RTa
	sEaLLAtX+gws2L54IZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuKH-0000000FfIC-0Zyk;
	Mon, 17 Nov 2025 08:11:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuKE-0000000FfHO-05oA
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 08:11:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D79B44095B;
	Mon, 17 Nov 2025 08:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923EAC2BCB2;
	Mon, 17 Nov 2025 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763367059;
	bh=FwCaRbfCgnDGXnyMi9WdlNQ88dEMN/spT83VD+phDPY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qpHh4hkJT98D2I8vRaYi0UNHLMoqsQLCdj6dQp5C2FCNj6KTLnd8UQLneYIrRStl2
	 70SK7e4e9n/43tiFcaHj8j2HLY9wJxmlH6KuL/YWmdDffcwsDue8JCiZbm0fZfZNAI
	 VkfMMoI+gZKEdt0QdqD4G3/4ApCvUA859+Dmr0FC9kgO5IV1Dj1GXWIDUIPCwAAyoS
	 z9y6lEz0QxRQgV1O6sWg6POhXmlZf+Qfei0l2VkPbVbyFE8yUwIUoiNd2f58UhRjMF
	 qnNwJK8HQobAFFf9p33IKDtKGh9Wl85kbhy7kGIzVCyEOeNYqw9QjH6GrnuaELnTy+
	 Ka5s5CYjjmDIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE9B3A82557;
	Mon, 17 Nov 2025 08:10:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] tools: riscv: Fixed misalignment of CSR related
 definitions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176336702651.2854411.4994928849294651323.git-patchwork-notify@kernel.org>
Date: Mon, 17 Nov 2025 08:10:26 +0000
References: <20251114071215.816-1-cp0613@linux.alibaba.com>
In-Reply-To: <20251114071215.816-1-cp0613@linux.alibaba.com>
To: None <cp0613@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, haibo1.xu@intel.com,
 guoren@kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_001102_110815_742911BE 
X-CRM114-Status: UNSURE (   7.87  )
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
by Paul Walmsley <pjw@kernel.org>:

On Fri, 14 Nov 2025 15:12:15 +0800 you wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> The file tools/arch/riscv/include/asm/csr.h borrows from
> arch/riscv/include/asm/csr.h, and subsequent modifications
> related to CSR should maintain consistency.
> 
> Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")
> Fixes: d1927f64e0e1 ("RISC-V: Fix the typo in Scountovf CSR name")
> 
> [...]

Here is the summary with links:
  - tools: riscv: Fixed misalignment of CSR related definitions
    https://git.kernel.org/riscv/c/e2cb69263e79

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
