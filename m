Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D783AE8304A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 04:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YmIblU53GXHJMGERbkDsbIyCCX0ofcm2i5VOnKjPpKk=; b=46f5ke1zka+PqR
	mbr0cSlA5kpa0xTjpW6/xXQ/HgxcqZ1rPTvSGurOy9+ezZC3NoXrbOBdrq2nm30o8LqJ7OmtpkYyT
	hCV70KxD96YyBRx+5MpdolzkRdyYYHufjIig3A4xMQacQKv/MHMTf1018rcu/QYhfdMZYlDxsK98/
	aTsCngJJBZuOfF9qcrJN+Md3dGNfxvJ+9g6dRsmwyyQG+uasv57iW9Mx83jTLqtuIpBfLkDNvLrZB
	tTPjS5vijon4sQKFWwXrkIgpogCVaWJ5knMo3i5TU8sGwU5sRqdtIpLxsc+0X+7ZmQZ+S3XJX7uj4
	fRubwZ5oWIyY9A/fEaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7tb-0000000631l-0qeu;
	Tue, 03 Feb 2026 04:20:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7tZ-0000000631a-3yut
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 04:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 058C8600AA;
	Tue,  3 Feb 2026 04:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9611C116D0;
	Tue,  3 Feb 2026 04:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770092408;
	bh=0YAWDIS+eysLPVl7yK0G0fnhNv1PM/4TCL5u/TuVNpI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UKGh6I5ZSbFuQyF6DyfPCFHB9zdBfTUzUeJCejaTBm/dpEDVsBM9akcfz3ux8mjSN
	 V1GGYH7vDQuV6SIe/LPBTMFw0tV7KFHHMj74U1Nl1DEZATxxV+Apfi1UU2R4TPvm81
	 p586sz5MMkfS8KUKTGZFF2vHVgfyJ01+ADhtSsbgPWPVUT2XYTGX8oChOUyQg4LhjC
	 fANHZLY9Px53Wst1UDYbFQNpV3xWQ+XSv+K975fxhQ5ENsHYcY7aRzFc0qzYUQPV68
	 caRRSkpontpG4cOKKEKWy/Wl2kId12Yd2BtpjqbnnxUTwhqVo8h7Qzr5O0Rqz9T7Z7
	 DG0+ZRQWAJRKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9104D3808200;
	Tue,  3 Feb 2026 04:20:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net v3] net: spacemit: k1-emac: fix jumbo frame support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177009240524.1309272.13521907862288181709.git-patchwork-notify@kernel.org>
Date: Tue, 03 Feb 2026 04:20:05 +0000
References: <20260130102301.477514-1-tmshlvck@gmail.com>
In-Reply-To: <20260130102301.477514-1-tmshlvck@gmail.com>
To: Tomas Hlavacek <tmshlvck@gmail.com>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dlan@kernel.org, wangruikang@iscas.ac.cn,
 stable@vger.kernel.org
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 30 Jan 2026 11:23:01 +0100 you wrote:
> The driver never programs the MAC frame size and jabber registers,
> causing the hardware to reject frames larger than the default 1518
> bytes even when larger DMA buffers are allocated.
> 
> Program MAC_MAXIMUM_FRAME_SIZE, MAC_TRANSMIT_JABBER_SIZE, and
> MAC_RECEIVE_JABBER_SIZE based on the configured MTU. Also fix the
> maximum buffer size from 4096 to 4095, since the descriptor buffer
> size field is only 12 bits. Account for double VLAN tags in frame
> size calculations.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: spacemit: k1-emac: fix jumbo frame support
    https://git.kernel.org/netdev/net/c/3125fc170169

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
