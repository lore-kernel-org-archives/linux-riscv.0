Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DC3CDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CHtXcWjXgtSQr29TwDtwfY6kAfhreecmN7jlEPyEJg=; b=Qi/ftd/xGJd4A0
	oQv2KYg7caGFZc/Xo641c7CoDgqX4dlHgw63CC31aOWZ5qQklVeMydYNyDFi0o2YNlmqUw6Y8UzBT
	UL443zKckE/AK29+SvX9aIpYvXuO8pEStRTWmQGqTaGlPHej++CL1K+sQFoSeHpe+KfUZMHdrh+xz
	dkK2TdEF+AUCCGz8ggRC6+pDp1WHiVsCQuoiZrL0RekRz6dRWi/0AphudhlzIahBLY3twnxCfo56t
	eAqzoRViIqnrg7HClUQmy6LJwYElgYhuZID1DVef5vyh2Ca8YfYEzsTNUYO1oppGQTcJh3/8t4s2K
	JyRSRNfsUTpPj9smebKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1p5-0000000Aoh2-0xG5;
	Fri, 26 Jun 2026 08:22:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1od-0000000AndQ-2Fi6;
	Fri, 26 Jun 2026 08:21:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4CA760128;
	Fri, 26 Jun 2026 08:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AFA1F000E9;
	Fri, 26 Jun 2026 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462092;
	bh=pRZU8ZxtOY0lRSxM6BMlawMDkS+1j8/GDNqwfO8SsKg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JWge7yFEcbX5HwC56y6lJf82j8Qk7JIMft0JYjUFwoHLpfWA1I/XbHyXRsjxqH6fe
	 iiTgFW97grIaqYBEx5xGC8Qb5IbWkTAqcb1DWY/TU5mctuDGkrBuEx/2n3stAx16QL
	 mjeKr/CBa3E82xT0SrvsZCLzntztblL6BM8FP8OJGMWziXGpW+UgSKCXitpYcVO7mJ
	 oaiNsiDDD8n180AH0CE37p+mIYqquF392JM6XCpfT9C4VdlcPpeY+1vOfDzbBE+p4f
	 RyyKGEkTgnQdrkh09X+lFxp1hMLp+yGd0p8pNyA1wkj0gSctO4CT27ILMbDDCydUxA
	 fzjBJEGL89sSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938F739389E8;
	Fri, 26 Jun 2026 08:21:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] module: force sh_addr=0 for arch-specific sections
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246207923.3816447.7091870447864059948.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:19 +0000
References: <20260327080023.861105-1-petr.pavlu@suse.com>
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-riscv@lists.infradead.org, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, geert@linux-m68k.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 samitolvanen@google.com, alex@ghiti.fr, mcgrof@kernel.org,
 da.gomez@kernel.org, atomlin@atomlin.com, joe.lawrence@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
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
by Sami Tolvanen <samitolvanen@google.com>:

On Fri, 27 Mar 2026 08:58:59 +0100 you wrote:
> When linking modules with 'ld.bfd -r', sections defined without an address
> inherit the location counter, resulting in non-zero sh_addr values in the
> resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
> all sections. Non-zero addresses are confusing in this context, typically
> worse compressible, and may cause tools to misbehave [1].
> 
> Joe Lawrence previously addressed the same issue in the main
> scripts/module.lds.S file [2] and we discussed that the same fix should be
> also applied to architecture-specific module sections. This series
> implements these changes.
> 
> [...]

Here is the summary with links:
  - [1/4] module, arm: force sh_addr=0 for arch-specific sections
    https://git.kernel.org/riscv/c/ffe1545ce8a0
  - [2/4] module, arm64: force sh_addr=0 for arch-specific sections
    https://git.kernel.org/riscv/c/c5553deb577f
  - [3/4] module, m68k: force sh_addr=0 for arch-specific sections
    https://git.kernel.org/riscv/c/9cb4d4dc8227
  - [4/4] module, riscv: force sh_addr=0 for arch-specific sections
    https://git.kernel.org/riscv/c/04e17ca3f77e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
