Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B21AC61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYJJxS5gbLS3Qqa61GrCJ1InimR6TaJ3DodxHa1wewU=; b=Fs/V3xboz1rNcR
	yvl7As5rP3cwXu60v+RmvekZ9q+JWDcGC9p2d+FJWGN+yZgKgqPDYd/r/xn+HwFjwRVXSBhJU84oj
	9IiGsJjuA69VOxA47+7XJkI09/pwLdNdv0nGtBsuGbmy3GqEy9dJiT31AtgB9Pa3m5kujC/TvxsZO
	M8U+DC6DGhQKWq3sXnpU8mMExsUJSagjwNB3GmXiM/H1oW4tKiIZbZ7XcgIBEBNrIOE3wgJfW0chO
	sP7VVWCxDEv47y8oi6V8OhtRuBKSZJdaHzVyPWYr/u/xSvyxRd2EwkNSB2MR6n3M0dCyfEE+pUPOt
	HkNDUHCFWHv/T4sp2trw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7o0-00000008JZZ-2N5e;
	Tue, 10 Jun 2025 22:50:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6hW-000000087oH-2dyX
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 21:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADCCC629FE;
	Tue, 10 Jun 2025 21:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F691C4CEED;
	Tue, 10 Jun 2025 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749591609;
	bh=I3C23c35LbTCjt3P42E0c8wnjRpx2wGHYe3hD72e8gc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NL9DGDTlaARUaLJZZTn7ksNOX+zLB3+6FZ+AuN5PSd86X7zQ8On4907vZTWM9G0kD
	 A1hDfAPf+tfosN0GVSnu/Lw2fW8IJnwIY3bkiqZQ5S3A4yZHbSfvbjAbLsf6bqYQWz
	 hpr0bRl8lt0MaPgDefcXl4fNqCDL52addHhmcGgGDeTAzH9/s4cEqxgMTy/jYNpIPn
	 4jduecNRiW8ELZw7yN15z0soD2Xd064nZD+kWXwl323ASe/AICzANp/b8AqzfoURVx
	 LHwhyiEb8uw6+2YoY1GEiOWwWYl/KI9A7mV29dnZ8ir8jo6Rxt1qzQFeR/9NPbeZAt
	 mHpwnfzFniUlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEFC38111E3;
	Tue, 10 Jun 2025 21:40:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174959163949.2619474.5121888722070978371.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 21:40:39 +0000
References: <20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me>
In-Reply-To: <20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me>
To: Fangrui Song <i@maskray.me>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Mon, 02 Jun 2025 20:48:44 -0700 you wrote:
> .rodata is implicitly included in the PT_DYNAMIC segment due to
> inheriting the segment of the preceding .dynamic section (in both GNU ld
> and LLD).  When the .rodata section's size is not a multiple of 16
> bytes on riscv64, llvm-readelf will report a "PT_DYNAMIC dynamic table
> is invalid" warning.  Note: in the presence of the .dynamic section, GNU
> readelf and llvm-readelf's -d option decodes the dynamic section using
> the section.
> 
> [...]

Here is the summary with links:
  - riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
    https://git.kernel.org/riscv/c/e0eb1b6b0cd2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
