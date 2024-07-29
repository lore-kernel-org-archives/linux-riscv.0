Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5107DC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xd0GjHkwTtcN3A2fu0nOyCf9at+1Ygac2tK4fOzzPMg=; b=4+GV5M5XRTl8Ue
	dFYYXEGlz9efGQsMC/oCtmzo7uNvKiuq/YXKPxgNkxlyLhyP35haJK3sjUFIX3q9MgnTXwl9CDGbS
	HD0m6vj43/0Gl5SWa9XJecQza66v6PZz8kyPVNTl06seyRLXt3/xc/bQ9CWeR0Euvj5Lfr8NT9hbf
	+W8mF9oEgmaY+PExtJH/NllCQ7E/olRFDmU7N1+vUyj4piTsqIJwU3TB8eFKGxxDGsSeEBUCK3FAW
	Ztp1VdYSID6ABTSpooiWg9Val2emf+Qhad04IKChRlbcpWzR5+px0TCGO5F9zDoDOyV9vLpn1kE3+
	JFyvW/aZmjbvl3DQERig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTQM-0000000C55Z-3n2z;
	Mon, 29 Jul 2024 16:40:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTPS-0000000C4i3-1pWR
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 16:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A3A25CE0E0D;
	Mon, 29 Jul 2024 16:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2731C4AF0A;
	Mon, 29 Jul 2024 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722271179;
	bh=tV0WP6zuukv/K7rpCEKp9CjVyvve7l3T8OQ4RSahhJA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WCzN9v2gTw/VXhcnzDeDSTwz3IOxts6+aG/u1k3IUN8HNNTS6E3qdvgkUB/vjLb2V
	 wWGyJk/Im5VCJ/TfiAnj+rQ4oIXTVoUAggkZdUCLJW15u2uzcEvzRpX4ng97U59mMO
	 mJ0llnZYgLLOXoQQrNFPe+CaAIZZRgw6ZRXoCXsYfP3Xrajf+uUlhxG3/b9yUSXApm
	 qbDRNCExeu74cYZvak5zlSR3Tcish5YKTDh9kMUT2A5ldLGrtkmv6w3Dgief//IO9X
	 GZxkEbHXTSJRulnR7M7gzmMXnfurpbMDoWMWXisooaga9+qr+Jjxa0O/Q7nsyRRxr0
	 jflGvgmgnphrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB457C43443;
	Mon, 29 Jul 2024 16:39:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Remove unnecessary int cast in variable_fls()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172227117982.3603.14088911643823119013.git-patchwork-notify@kernel.org>
Date: Mon, 29 Jul 2024 16:39:39 +0000
References: <20240710202416.710880-3-thorsten.blum@toblux.com>
In-Reply-To: <20240710202416.710880-3-thorsten.blum@toblux.com>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: linux-riscv@lists.infradead.org, yury.norov@gmail.com,
 linux@rasmusvillemoes.dk, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_093942_795782_703AC979 
X-CRM114-Status: UNSURE (   8.55  )
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

This patch was applied to riscv/linux.git (fixes)
by Yury Norov <yury.norov@gmail.com>:

On Wed, 10 Jul 2024 22:24:18 +0200 you wrote:
> __builtin_clz() returns an int and casting the whole expression to int
> is unnecessary. Remove it.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  arch/riscv/include/asm/bitops.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: Remove unnecessary int cast in variable_fls()
    https://git.kernel.org/riscv/c/fb9086e95ad8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
