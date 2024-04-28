Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B20C25B5C
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKGpnU81MQX1YZorPLDI7GR60qOlWqeSWqT3AFpah6A=; b=Rhi59tLKkbCS9k
	BlejuWv4wQpvONKNg//LtEJBRqW49VEGdOzNjMG1rKz+OvaLZOQdkg5Dnu+YQ4/GncOctsbpZWJP+
	JHzpTPgdjkvAbOQwUj0oHxHiKTY9yvd6h3mNI9ZBHfv/9rgJfz26CV8/qoRNqa8E6AuK2jCk4Pqa+
	qkKAhKOQEB/OrlDEqHyIZoROrZs2dNxYRrl9yjsRx7k3F1H+H/RXlsKlmYMwGWNwQRgFLagxuo8i/
	PAAvgQ2KvDWTbgylbbv29nUzm/mMDVdP+rm8JlaCK9haGwHwk/+Z4zueCD6wvYApfZrbpXxpx6Ygk
	Fz/nTSzdbvTkfcScHSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZo-00000000ns6-2G5T;
	Sun, 28 Apr 2024 22:00:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZa-00000000nkf-2odg
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 22:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F309A60BBA;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 173C8C4AF52;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714341635;
	bh=mpGXIGseswkwy/X0HaEjG1xZ79rl/VqE1STWpXX45A0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=du89f0oHiq3nXGlnpyBAUwBEJ2qOsDYuLqcQNeQQEK5UkBu7x3Pbal5O6wvgPNPJs
	 RwcMLzMWK7c7RDcgNj7nE+U+DF6ztXp7Xxc4wR93DpTiIdaNHorNagM9QE27S5Hi86
	 7V9Xjl7LwSH1v2Mlbw42SoFLe6ako4A6b1hakrZ6Hv1q70BDxWuqSpa4C782hHoNNU
	 Mjp0Ussy1rSq+PpgoKN+JGojN18yS2p1t8D318GI9Bl0V6+LABLupZYC9oDP4leX5L
	 vSSoJ6RPBBRblAjBRwDX2XOiBAtU8ZU1DU5PSMPnceu1+SUSgp8tXR+QIDv6w1TjyF
	 +SieVbD/j0+6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D1C6C43638;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: misaligned: remove CONFIG_RISCV_M_MODE specific
 code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171434163504.22130.15555293049692650403.git-patchwork-notify@kernel.org>
Date: Sun, 28 Apr 2024 22:00:35 +0000
References: <20240206154104.896809-1-cleger@rivosinc.com>
In-Reply-To: <20240206154104.896809-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 ben.dooks@codethink.co.uk, David.Laight@ACULAB.COM, charlie@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_150038_789062_6FEA1760 
X-CRM114-Status: GOOD (  10.88  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  6 Feb 2024 16:40:59 +0100 you wrote:
> While reworking code to fix sparse errors, it appears that the
> RISCV_M_MODE specific could actually be removed and use the one for
> normal mode. Even though RISCV_M_MODE can do direct user memory access,
> using the user uaccess helpers is also going to work. Since there is no
> need anymore for specific accessors (load_u8()/store_u8()), we can
> directly use memcpy()/copy_{to/from}_user() and get rid of the copy
> loop entirely. __read_insn() is also fixed to use an unsigned long
> instead of a pointer which was cast in __user address space. The
> insn_addr parameter is now cast from unsigned lnog to the correct
> address space directly.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code
    https://git.kernel.org/riscv/c/441381506ba7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
