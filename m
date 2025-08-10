Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7C8C87FDA
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wuc2eZ/NIKo/3PunXumgWVKVrsGM2rqvppAUp6+wJjA=; b=cM7JfnbGyW+I37
	NXqyJ8+Ifl1zstxtEFVivYQQ0Nb95lSD4o2Ul8L3Ch3nL1ISpHmF2fmEbHXDm2EtNdQ1U+UX16htL
	LJ23lMOcfGrq9jmuG+RY3caxyOeOJSRl+LpS3JpYyDdx3jc1CgGWDjJ0URVWVCiXcet8rEBDRbW92
	IL43hEeOhJ+TlIUiuk2++fEaO4YEIJTAEnhO6Xpzd8l6QYc8u24EG4kQivlPwE1ciZRh1jPlR/kOg
	rF8fX04IipDxWUKJXgbh2y+DfoEFzX3c2T01EspDD2POuLY4ZyipifeXK46u/vKR6fOvFZUe2jS9T
	4uEru6vVq93GZAbo3NBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDSY-000000061RS-0dor;
	Sun, 10 Aug 2025 21:20:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKz-00000005zcC-0Qwp
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 21:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E992761410;
	Sun, 10 Aug 2025 21:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDC6C4CEEB;
	Sun, 10 Aug 2025 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860332;
	bh=Nk+nlMj8RvGrT4DnRJpYaYLBYV46+pgSfSCrnwqmvis=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ivL7QVkhykah8Omp/xFVgPDQSPoT8cIdd4Im4ynihPf2YbWyPmaNvPTw0HMhYUz/a
	 pbal64NXxrXhpFBa03AfI5GX9PNQZZ5idrrx+g3S9/abi0O35bASo20zdfJOSEz/7j
	 3TfcwH7JtDCjBLWvI8/J20EHVLISYGk425x8i6JKPo/4Y9mE/nNbM4k6np6jNUm1tA
	 cIr3bixLpGp6psNrTIIqq/DJAd3euWqY0AAOCYGfTeZwMGpEbdkAdH5DV4DGN4Wv89
	 dNWT3b5gLlN/kP/B5Dc7Uijo4Yw7caeoFU8JThW+R05PMi5Vde3d1h/ni+jDxcT5ya
	 U2QfoCm9jPNwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D2039D0C2B;
	Sun, 10 Aug 2025 21:12:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] docs: Remove false positives from check-sysctl-docs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486034524.1221929.1694480113579330478.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:25 +0000
References: <20250701-jag-sysctldoc-v1-0-936912553f58@kernel.org>
In-Reply-To: <20250701-jag-sysctldoc-v1-0-936912553f58@kernel.org>
To: Joel Granados <joel.granados@kernel.org>
Cc: linux-riscv@lists.infradead.org, kees@kernel.org, corbet@lwn.net,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org
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
by Joel Granados <joel.granados@kernel.org>:

On Tue, 01 Jul 2025 10:56:41 +0200 you wrote:
> Removed false positives from check-sysctl-docs where there where
> ctl_tables that were implemented and had documentation but were being
> marked as undocumented or unimplemented.
> 
> Besides adjusting the patterns in the check-sysctl-docs script, I also
> corrected formatting in the kernel.rst and vm.rst doc files (no wording
> changes!)
> 
> [...]

Here is the summary with links:
  - [1/6] docs: nixify check-sysctl-docs
    https://git.kernel.org/riscv/c/89b491bcf2d1
  - [2/6] docs: Use skiplist when checking sysctl admin-guide
    https://git.kernel.org/riscv/c/be0aef10dca8
  - [3/6] docs: Add awk section for ucount sysctl entries
    https://git.kernel.org/riscv/c/e97a96baa527
  - [4/6] docs: Remove colon from ctltable title in vm.rst
    https://git.kernel.org/riscv/c/30ec9fde45b5
  - [5/6] docs: Replace spaces with tabs in check-sysctl-docs
    https://git.kernel.org/riscv/c/999aab7f5645
  - [6/6] docs: Downgrade arm64 & riscv from titles to comment
    https://git.kernel.org/riscv/c/ffc137c5c195

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
