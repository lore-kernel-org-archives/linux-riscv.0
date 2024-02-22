Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9E2C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 20:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMNtb9qO8B+ZRra6uWJ27jgUJ2XE3f2BHGjWEj6FyQs=; b=Dq7i/mVLBOIMzs
	bGIFPfefrYWs2P2iu0N/lFx/RnsG7hNAFVpeNxTY3TeI2lkRYDCEa62Ck/sc7r0GnK2WI7B9/L3dX
	kV/saW4aQ7wNItpV4rM9xyjw/e9J8qShWXrP8qidnVmdH5ciBWCunw6kt5ef9T69hyJAzlsI4rIN8
	Rl5pHHfF3o3zWAKuxGNqhW+JKS9zrrY9Ra/JJ2EijXgZKLbhXxQToCH4OdCsDYLJtLxEMKEp3HT1S
	P/0D4uxaaOv+MlJFM/UeKNxDx6P1sfgUGd3CvnnX0bCp8bbCtVvP3Hqf4k2/gxhC1Isd9ssbQ+c7z
	FDQg2/7mKR33J/3j7gkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdFYa-00000006Str-2LXY;
	Thu, 22 Feb 2024 20:20:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdFYY-00000006SsV-07np
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 20:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B39CFCE2954;
	Thu, 22 Feb 2024 20:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B95EC433F1;
	Thu, 22 Feb 2024 20:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708633231;
	bh=0P5C2465GuFA4aUaMuXI5r/adEpiwFiW6ygPXKIJTSo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ExdEeTc077MQc+GV14zKSMiI5T6093L979lgyGHZj4DIWKwSiENlqeh5VjurZ6QK6
	 gytN4yh6hm+WwTtI8LpstgqC7qVP1bPzdzkXH1NeHXXLNGl6Dmv4CGLpgcSyoURbiO
	 havvpA8hYC9xEOhnczjnoIpNqmTd2qbWFu5khxELC+1JBy9dnverTLdtqGhTl5eeWS
	 WLCNBN1peQXmiioFAVzFsfX8dosB1HSqg38MkEdqnj0UBnvR+fNYTuo+Qy+EEZIZdl
	 b0Uu0tLcjfJ+SXUAQJBRKtLidwR8dSHQmgNOR4x04yqCsGrX/6lR1MQnZ7CNqcTG6u
	 aCpPdZ/vr+Lsw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2AAE0C395F1;
	Thu, 22 Feb 2024 20:20:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/4] membarrier: riscv: Core serializing command
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170863323116.27873.1775668437490163810.git-patchwork-notify@kernel.org>
Date: Thu, 22 Feb 2024 20:20:31 +0000
References: <20240131144936.29190-1-parri.andrea@gmail.com>
In-Reply-To: <20240131144936.29190-1-parri.andrea@gmail.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mathieu.desnoyers@efficios.com,
 paulmck@kernel.org, corbet@lwn.net, mmaas@google.com, hboehm@google.com,
 striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
 rdunlap@infradead.org, sorear@fastmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_122034_254635_DE5572F5 
X-CRM114-Status: UNSURE (   5.99  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 31 Jan 2024 15:49:32 +0100 you wrote:
> Changes since v3 ([1]):
>   - amend documentation
> 
> Changes since v2 ([2]):
>   - amend inline comments
>   - drop ARCH_HAS_MEMBARRIER, create membarrrier.rst
> 
> [...]

Here is the summary with links:
  - [v4,1/4] membarrier: riscv: Add full memory barrier in switch_mm()
    https://git.kernel.org/riscv/c/d6cfd1770f20
  - [v4,2/4] membarrier: Create Documentation/scheduler/membarrier.rst
    https://git.kernel.org/riscv/c/a14d11a0f5f4
  - [v4,3/4] locking: Introduce prepare_sync_core_cmd()
    https://git.kernel.org/riscv/c/4ff4c745a16c
  - [v4,4/4] membarrier: riscv: Provide core serializing command
    https://git.kernel.org/riscv/c/cd9b29014dc6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
