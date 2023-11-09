Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB03C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 22:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05nYYeUyfswAe49PLbWHXUrJCFRhyGl7ts17J7/B8W0=; b=aM2qKFsvbSP3cx
	qnm4LDQpjeaF9OHJr5C/0chOvgW5KujZBQT3IJuhhdf0CmAdc3fCBMmDofAeWiDY9L0mMydsvfkzk
	RXN7k96NHZajV1B+LiwEcg8K7vlzHQWRPEIGT7rnpYRGVM9D7QiY9TXg2X3JoFFIQLFCBANeGgYA6
	LFoxAMCzb/Y+wLSeQvxhc1vJ96ZVExOLVn9yq1njxDsX06HbrsJKaztwGxSSMXFFd9hPsTJMrHgkj
	Xvy08RVjsljYwzsga8ZzJ1i69osnjrjH2eGhJP2A9bSbJAtgU8xUd2Bz+6wO3OIKOC8neGq0WfNUO
	DJG3HVWxlw9WPU1Boglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1DhS-007MWl-0n;
	Thu, 09 Nov 2023 22:40:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1DhP-007MVW-19
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 22:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 08B0BB821DA;
	Thu,  9 Nov 2023 22:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F10CC433C7;
	Thu,  9 Nov 2023 22:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699569625;
	bh=I9vnYUT5EwbBj4gKZfskPZcdeePW/vcdMZ/ipcSe6bg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OkmpxAfV/vkOZ43LqBK8zWZzCgZrjZljMxcjl4bBz2TMFbozmCFllXFXKb4fJ70d7
	 wpIEWxVUTtKFF7IMmN8KtkguoU3Sp/WiJOlpxhfBNHZKdnc7+KnbK0ovs1hLWE1nIx
	 2IEA4OdHIstSME9/iqrl+AOhQ1hOkN0B/7LP4H7X8CX4qW1JzdoerLynO3NkGFUOUE
	 F9bYpHiXxRrKLS4IpZjnALTy4NqpWqeesRopGxKh3m4SRnVbfUZDerR60Z9CTsBmt3
	 1aO6xsmrLAkEMiUC0mhWGI/YvrK2OjwCHo36ajHaRnzODdAkz7U+p+lOIVziLuSS68
	 xKECwTYCWaNdg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F01F9C3274C;
	Thu,  9 Nov 2023 22:40:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/2] riscv: Optimize bitops with Zbb extension
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169956962496.25145.13807826919853509041.git-patchwork-notify@kernel.org>
Date: Thu, 09 Nov 2023 22:40:24 +0000
References: <20231031064553.2319688-1-xiao.w.wang@intel.com>
In-Reply-To: <20231031064553.2319688-1-xiao.w.wang@intel.com>
To: Wang@ci.codeaurora.org, Xiao W <xiao.w.wang@intel.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ardb@kernel.org,
 anup@brainfault.org, haicheng.li@intel.com, ajones@ventanamicro.com,
 yujie.liu@intel.com, charlie@rivosinc.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_144031_529728_B5107FB9 
X-CRM114-Status: UNSURE (   8.46  )
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

On Tue, 31 Oct 2023 14:45:51 +0800 you wrote:
> Bitops optimization with specialized instructions is common practice in
> popular ISAs, this patch set uses RISC-V Zbb extension to optimize four
> bitops: __ffs, __fls, ffs and fls.
> 
> The first patch rearranges the content in hwcap.h and cpufeature.h, it helps
> to avoid a cyclic header including issue for patch 2.
> 
> [...]

Here is the summary with links:
  - [v5,1/2] riscv: Rearrange hwcap.h and cpufeature.h
    https://git.kernel.org/riscv/c/e72c4333d2f2
  - [v5,2/2] riscv: Optimize bitops with Zbb extension
    https://git.kernel.org/riscv/c/457926b25320

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
