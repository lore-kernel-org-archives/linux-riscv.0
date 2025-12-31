Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115FBEE57D1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 03:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYDeoTg3XrgNEGIp4TuXI8gzNVBAGzrZkYz4SK42ybY=; b=UeTt+DrWyMvWvh
	48ehgmn7iK9UMT/YqRQ3wRPNKkcWk0mn4AXbsa1IfY1EEwgNKYLLo/4C48T9DUNQ9YewpRnb8Xh/I
	4ViEUx/Ku9Df/fyA1eMrUMhoiFpzt01QwE8KvTi08GVt4jFKjXVvMG5zUgnG4l2zFfQzHG1lsnQ+y
	m/rFx3iXXldCGJRRwaRiaWX/iSkz34snMxmwTuieY7YugedsUj2AUrhBvEk9Qt1CXEdinQN3l5sAI
	gXZ4Xdxf1a2tMrrEo8qBGKIyojgjLMC4k7jNq1vgUS8FXgOZYjg6rohjeXkce+JLXhrncmc0X4n1w
	Xn4Jyer/dzHaf20fxwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamzD-00000005e5A-1uXZ;
	Wed, 31 Dec 2025 03:34:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamzA-00000005e4G-0Xbc
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 03:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0C3840E48;
	Wed, 31 Dec 2025 03:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE99C116B1;
	Wed, 31 Dec 2025 03:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767152094;
	bh=W67htXk7veB8kQWZBdf+dxwYDMiW/M+g7D0+HEH2ynQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KwikY9o0/aljAeEMwyEV3HVhnF+RivFEW5Hd/pE5cfla4xzY+juJuHvU4Whox5aWD
	 v7qtEnsclZcofyobHm7mpfsYW/p6OFBTyx/66pOvjxF8WSmnWwzNLKFYPAPWRza2Ga
	 53FjmLrPDQl7I0oOv67LNLc8WVCfCJ4VoH5Yqrb0LqrSM/460b8g2q5NhaB4FhFxn+
	 EvhhVb4f30nAtg391PkStzEEm8smWMVM9uoLO8ljWKVXuQhce+8rvpxHzQwje4GvRf
	 jkq7Df8Tslj1LWOcQ1K7OPvuiGlAtvKNELTh6KnSzC31JqOfb0Xhiwovxb0HIcGyxF
	 R0/FXQuqhutag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78A0D3809A19;
	Wed, 31 Dec 2025 03:31:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: Add Spectre v1 mitigations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176715189629.3416240.5165553541798344765.git-patchwork-notify@kernel.org>
Date: Wed, 31 Dec 2025 03:31:36 +0000
References: <20251218191332.35849-1-lukas.gerlach@cispa.de>
In-Reply-To: <20251218191332.35849-1-lukas.gerlach@cispa.de>
To: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org,
 daniel.weber@cispa.de, michael.schwarz@cispa.de, marton.bognar@kuleuven.be,
 jo.vanbulck@kuleuven.be
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_193456_196559_DC07DF35 
X-CRM114-Status: UNSURE (   9.34  )
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

This series was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Thu, 18 Dec 2025 20:13:30 +0100 you wrote:
> This series adds Spectre v1 to RISC-V in line with x86 and arm64.
> 
> Modern RISC-V CPUs with deep pipelines (e.g., XuanTie C910, SiFive P550)
> are susceptible to Spectre v1 attacks where an attacker can speculatively
> bypass bounds checks and leak kernel memory via cache side channels.
> 
> The first patch adds pointer masking to uaccess routines. Similar to
> arm64's uaccess_mask_ptr(), this clears the top bit of user pointers
> before access, ensuring that even under speculation, a user-controlled
> pointer cannot reach kernel memory.
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: Use pointer masking to limit uaccess speculation
    (no matching commit)
  - [2/2] riscv: Sanitize syscall table indexing under speculation
    https://git.kernel.org/riscv/c/25fd7ee7bf58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
