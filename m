Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72379CCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 03:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUnyQyMZS3cmHm//Kj1GyT9/uw45RYDiO6NiHpD+FXE=; b=3RIcW34RpTeiiq
	GAKpZqwGP2Z7L8ja2PAkMTVS9pvesHqW4uaTgb75hvxChfiE96Cb7Cg7rZjU0WAJ4APn/Ap4ZvS5N
	xRCY5dnb5iyy3pbfg8A3um+vCEm7tSnxP9yr6a6u2wkbAcvF4QauPC68YplzgZXk3LbZOH6GXTAJf
	1YZHB25hMKLJi7UqhoYViHLb2HYg3CCFYD6qPjngMlI9iUcPNSGN4c9ee5MRoFvOU+ZLvoDOWraGw
	EV5MrSXRpKzvdjpWnphOYEulf6I2meY2CvTLDbQ6tpSvAIq3nqUIkOcumOMKUk1Q/RDq7ZtVGNfy8
	Nq3MZ7FbIukVzjKqJaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBmHc-00000004ySm-33Vr;
	Thu, 23 Oct 2025 03:46:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBmHa-00000004yRi-1vjo
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 03:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E45C603AB;
	Thu, 23 Oct 2025 03:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D987C4CEE7;
	Thu, 23 Oct 2025 03:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761191193;
	bh=R6+qGnRv0D3b1rTURFdmpfihKe/n286445pssQyi9dk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M2+LWGJDAQKDoiCkT+PJ1a+IEtri8Ae8qctAsQ+HJyt7QfFpCRLqVxDyr7JuTL3I+
	 l7bdCxfuZ27baZiUqoSNGpBpQsQLKpCDkGsUNMVZwmuZY8ixhwvRDKd3tGSJVv7+Bz
	 Xcl3yUsoQLzDeroBVifD6oTCtC6y61bsqDmoJdC6y0GFNGBnEv4igbJLkQHDPjo8uL
	 wqi7pVcNWWHRtP05TZVu8rCdSKv563dKmOi23kNRaoP11Ub9nKdN5/bTkU6/bh7v9s
	 xVyP5ncxnlwfnrPpqxjF5/B+0z8opd7AXy+DITE3OV1DYcgd0BUJ/NefY/qPmlW6hQ
	 2DQ2NTW39cqyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D1B3809A04;
	Thu, 23 Oct 2025 03:46:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH][next] net: spacemit: Avoid -Wflex-array-member-not-at-end
 warnings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176119117374.2145463.16472197208570713304.git-patchwork-notify@kernel.org>
Date: Thu, 23 Oct 2025 03:46:13 +0000
References: <aPd0YjO-oP60Lgvj@kspp>
In-Reply-To: <aPd0YjO-oP60Lgvj@kspp>
To: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dlan@gentoo.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 21 Oct 2025 12:54:10 +0100 you wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use regular arrays instead of flexible-array members (they're not
> really needed in this case) in a couple of unions, and fix the
> following warnings:
> 
> [...]

Here is the summary with links:
  - [next] net: spacemit: Avoid -Wflex-array-member-not-at-end warnings
    https://git.kernel.org/netdev/net-next/c/10e0378f05d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
