Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E003C5AC67
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JabePfhCSiYXE65nq1MEUs3TnGdhulqVLFanCPU/0Rk=; b=Tdc+gfqVlAZnYp
	aaXLfX8Cv3b3e7GGVWmuX+hJHm1XHDnYP56KqLnq1ZHrv8yPSXB3tRQN8YBLmMw/IU5WzTkgfJ7ti
	JwvDzzXO1B4dCWqdIdmvMnZDw3x9haDw3RVMhhl65VjxDVsRwYwKB2uipNOwD/e3qJhonm1HUocmK
	OkaRZC2o+P/+FB9+pRB+Blj+NsPKSwU91a5rfyktFt9j3+jsOnCPzOfDiimTWUcJqX67cg8vSOuGN
	Exn8UU6OG6CLBffIf3qjsqBiHOnmI+zJ8Jvsk7+uJrLV3zvzqdFQeO/za+51G4UZS+sYCGI9QGJFe
	w5JUwkps6CHyUaTtJ+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wslLm-00000009Z87-1tkD;
	Sat, 08 Aug 2026 18:00:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wslLk-00000009Z7X-3gZn
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 18:00:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E21D643DF7;
	Sat,  8 Aug 2026 18:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C468F1F000E9;
	Sat,  8 Aug 2026 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786212047;
	bh=3MJCt1He2zsbLqVXjy//wJhJ0zIZ6C/TWcTiFL8fPqs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NHsAD4FfXOVHgtDzk5cAkofVCypGgSqK8qfLH0e8ux5ExweNX2976EIdVwIEWymRC
	 hr/4W6hdC6Uz4ahITNZt6MSiDrVmSM8lPAKStVDBQvtdXrTjlIfv2W5cI+zgcf3HgU
	 uFGv0rfyycU0zMegSlizQC7PnMG/WsovTvg0ID50YIdjSAGZR3PaaFOGFO857XQ+zU
	 RJR06xVOMh//82hjVMTT2rHI1vBldJJcow0leCEXjBzPLH+1DwEGBI2KRgXtGR2oCG
	 Q1vEFmPrmIfF0eIHWCPcJwQPGIOKRxGUVGjT0NkuFbIw1nqerOKtNauv4O17RgY6Pl
	 1PUdx0bv2uuFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 03C10380CFEE;
	Sat,  8 Aug 2026 18:00:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: lib: Fix ZBB strnlen reading past count boundary
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178621200564.2716124.18450500018830260.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 18:00:05 +0000
References: <20260413010738.1622423-1-mikey@neuling.org>
In-Reply-To: <20260413010738.1622423-1-mikey@neuling.org>
To: Michael Neuling <mikey@neuling.org>
Cc: linux-riscv@lists.infradead.org, jiangfeng@kylinos.cn, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org
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

On Mon, 13 Apr 2026 01:07:38 +0000 you wrote:
> The ZBB-optimized strnlen loop loads one word ahead before checking the
> aligned boundary:
> 
>     REG_L   t1, SZREG(t0)       // load next word
>     addi    t0, t0, SZREG       // advance
>     orc.b   t1, t1
>     bgeu    t0, t4, 4f          // boundary check AFTER load
> 
> [...]

Here is the summary with links:
  - riscv: lib: Fix ZBB strnlen reading past count boundary
    https://git.kernel.org/riscv/c/5d588c684833

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
