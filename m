Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32602C3601A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9/gCxwZSL2xkXGttZ6B37f1sur1XuZoJbCN3P8Jkzo=; b=jmvNxbVVamLlgz
	/Ukc4n7oLDKYMN32BMJNnqckSf+HQjO0UbHHUonFNqtmqD5ougRBMjBaWNhqnU1L3xPRyDgzMAHLb
	YALfD+NsuBLo3BrN399d1c2EHpVKHcjWTmivvrgUl+brhBSeIONWYfuPN/UmzO6C1ySGKmKxzYxnV
	tTZH2aeosQjMp8Ni73SnF4d4muGFHsWyaaVENmcXPa5WANuowF0ubaDLpyWf8sUB2f/N7TtLTcio6
	2zKdp7cplazysFze9a2WRD8izqKIIVBfyRpZ3MEN1QpXDnN6kDnIU9CuQDqqeiEl342WRMNFKZwjV
	rLSR/+XMereiELci3Hcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIS-00000009LBo-0fdB;
	Thu, 03 Apr 2025 16:20:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIR-00000009LBR-1Nib
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 16:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D4A761364;
	Thu,  3 Apr 2025 16:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4742FC4CEE3;
	Thu,  3 Apr 2025 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697202;
	bh=bX/eqFqTAZib4IifIZyHWRQYMwAIbQlXwCICt6K1lso=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PA2z4Ni3NHkaparTHZPL+uyTig9fbaFWAexoEt2ORhGOC2jyu5dqfj6oz5Oc0JKeT
	 OuVNZeCiqkHezq3cX6aRPJjuyZEBwqe7AfyYMwd2n44nE0pFU1F/qvYiPW8D4Qgajg
	 th4VQiF64ThMHqu0IlzzbG9upBmGs7o3zIAFqIbJsXs2voJB+cnCWXjm4jHGkt3400
	 oLQbwd8FroYOJRqHO9rBhNMdzCZCigHraTsgAzdQBZwfMEr6neZPMmsRcVd78uyj0w
	 +PnKpADnP/TPkiSKgQHkun7BLIy+LIqPJTuFdRw7LJkS//2BIVRkRhB6vUXSsVZq26
	 wggFu5zQ7UWnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D3C380664C;
	Thu,  3 Apr 2025 16:20:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Make sure toolchain supports zba before using zba
 instructions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174369723899.2563936.11573121851709668346.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:38 +0000
References: <20250328115422.253670-1-alexghiti@rivosinc.com>
In-Reply-To: <20250328115422.253670-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel@vger.kernel.org,
 lkp@intel.com
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

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 28 Mar 2025 12:54:22 +0100 you wrote:
> Old toolchain like gcc 8.5.0 does not support zba, so we must check that
> the toolchain supports this extension before using it in the kernel.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503281836.8pntHm6I-lkp@intel.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - riscv: Make sure toolchain supports zba before using zba instructions
    https://git.kernel.org/riscv/c/8a2f20ac8e14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
