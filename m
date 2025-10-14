Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BAFCCD185
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 01:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFuqcJ7Nf6mjTJCpgZqPBAtGMZ+7Km5VhkSJdWjs6CA=; b=oe4OPwjprLeLYO
	e7xX0Z2H4ETyw7WPjPHphOKn6PcmBP6DZcPSJY5FW0fDf+CdDwL6rtGOx7ehjvZuBPGG5FoPlTX6O
	pnJySWhCg50QiX7cSPMnpJX1X6DaYjZbVWYpGAaTJFCj6f3MG1gl3KLLAkKGLGPTwzGspzWiKHfM1
	yAwYwu0GWLEHW7BDpX8ec2/Z5n37sdu0ps+UyXU10jnNjB8JUviuoY0IOIkfHdlghoe+fHGw62fXP
	BilGJLepLWZzky3Vwsmv2x7orHLKPj18cYYKjbL9NpOb5vaRE8EaxPS5LGlL9ttzO8MvmqQtNrK2w
	kh1rIxrkIIQRwo5xPM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8TaV-0000000Eryo-2Nhu;
	Tue, 14 Oct 2025 01:12:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8TaS-0000000Erxd-05iO;
	Tue, 14 Oct 2025 01:12:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9AC645082;
	Tue, 14 Oct 2025 01:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1278C4CEE7;
	Tue, 14 Oct 2025 01:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760404342;
	bh=v1eh061b6dkek5M9HJLBkji6LBvb2K8CkWCnfAVgFRU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MvlkGI6Z2YTW1djrM0AQMX/ZnMuujXo3RFRqY6qbgf1EEsX2N1t830Khh849kvBzF
	 5XsljbgJAS2NHJbFyF1cKlJhfnN1ZVZ/PAYxTTvdWTn0L1g/K0piBjFw/AzquP2mKp
	 mHVJFtptmyIYe/JM+FEQvob7UIwecA+O9CFExGSCat4HrcwSbSokflIx2IqqWpXDni
	 BGaDKMl0aXHjOHSUCQd1MSZTigEu3VtW5WFHx0pZQ+L4K+CunYhkS9tT99qBwuwm2J
	 tEvNvig7VqXOi2COajpKaRKMotsvjloIm+Cnyb6meKSzOnr3W9jumwEB6nQ0uQwtHi
	 U30g6rEx8OFoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC6380A962;
	Tue, 14 Oct 2025 01:12:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] kcfi: Prepare for GCC support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176040432799.3390136.12370033021047300981.git-patchwork-notify@kernel.org>
Date: Tue, 14 Oct 2025 01:12:07 +0000
References: <20250825141316.work.967-kees@kernel.org>
In-Reply-To: <20250825141316.work.967-kees@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org,
 samitolvanen@google.com, dwmw2@infradead.org, linus.walleij@linaro.org,
 mark.rutland@arm.com, puranjay@kernel.org, corbet@lwn.net, nathan@kernel.org,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_181224_076109_AEDFE35F 
X-CRM114-Status: GOOD (  10.89  )
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
by Peter Zijlstra <peterz@infradead.org>:

On Mon, 25 Aug 2025 07:25:47 -0700 you wrote:
> Hi,
> 
> With KCFI support in GCC coming[1], we need to make some (relatively
> small) changes in the kernel to deal with it:
> 
> - move __nocfi out of compilers-clang.h (so GCC can see it too)
> - add cfi=debug so future Kees can find breakage easier
> - remove problematic __noinitretpoline usage
> - rename CONFIG_CFI_CLANG to CONFIG_CFI (otherwise is it quite confusing)
> 
> [...]

Here is the summary with links:
  - [1/5] compiler_types.h: Move __nocfi out of compiler-specific header
    https://git.kernel.org/riscv/c/038c7dc66e27
  - [2/5] x86/traps: Clarify KCFI instruction layout
    https://git.kernel.org/riscv/c/628a15e0536a
  - [3/5] x86/cfi: Add option for cfi=debug bootparam
    (no matching commit)
  - [4/5] x86/cfi: Remove __noinitretpoline and __noretpoline
    https://git.kernel.org/riscv/c/0b815825b1b0
  - [5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
