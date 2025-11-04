Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB48CCFA05
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 01:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4JCYT38buYrJYX7KHuVtg16yWtedITFd+QpOqokkAw=; b=Eg+TYIZFtLEfb9
	ZJFMWTyDVF9CKw8Pbg7bm18RbNV0BLD9xeduEzKVoqahfJYLyy/agTHRR/Sho19wI43SNZUTSft9z
	tVOq6E+iygQro9tNmIGk5slAXps5S5/Q9fMZV71PrKIGPyg5WqbVgv7iQYHqMCMOResLm+aTSARd/
	/Sxh03ra84S733ZQIaUBTH63hvOp9b5005mi9g8jvVIIKR/Bgbv6FbO+n7oDXVkAVaPykAmPSt2jy
	fjPVGuKSdxbxXrfcDN1Zg/VIxjytgBxZHqHPlrr3V+GIf1fhUdJSLTmYkcwNA6wTXo715X4veZTnt
	EBdzdNkONeRMEi/IZKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG62Q-0000000AwQ3-3VVD;
	Tue, 04 Nov 2025 01:40:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG62O-0000000AwPi-0Fbi
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 01:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88983435FC;
	Tue,  4 Nov 2025 01:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F3DC4CEFD;
	Tue,  4 Nov 2025 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762220443;
	bh=hLOl+nIyoL9YpIF2ua5v7KC49yNxnmSmLEI5ZrCaKFc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ObB97N3HwireapfZhr8VJvNPleWkPGkmwUNnms1y1dHu2ThRp3qpqa5G2NF6ULO5w
	 G53Lysn7IsIG/u2sDuZbevMK95L4wlHfvtrU5effNZSFgKUGl1rw3stn6sxpwARV44
	 J4YIt23RHSrRw8ZnuSJP21Uf5nSXumCkqmqc6f1iGZCPE/WLMvMGfz7cY3eFuALsWJ
	 creCiWq5x/be52kQNiYOPHpBpe8o2KmFF1lKFN+mMIuPj2yt/CspD+C3OdDetM4DNZ
	 nt1fa6KUqQbIzLEqB0rjQFheMdpbjVET++CXi51/qAyBylBW05ochj/Me+Yc9koPwh
	 hx0CvJSbhZnMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADB83809A8A;
	Tue,  4 Nov 2025 01:40:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net v3] net: spacemit: Check netif_running() in
 emac_set_pauseparam()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176222041749.2285814.8859925220463360389.git-patchwork-notify@kernel.org>
Date: Tue, 04 Nov 2025 01:40:17 +0000
References: <20251103-k1-ethernet-remove-fc-v3-1-2083770cd282@iscas.ac.cn>
In-Reply-To: <20251103-k1-ethernet-remove-fc-v3-1-2083770cd282@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dlan@gentoo.org,
 maxime.chevallier@bootlin.com, troy.mitchell@linux.spacemit.com,
 vadim.fedorenko@linux.dev, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_174044_137898_DBC499AD 
X-CRM114-Status: UNSURE (   8.95  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 03 Nov 2025 10:02:49 +0800 you wrote:
> Currently, emac_set_pauseparam() will oops if userspace calls it while
> the interface is not up, because phydev is NULL, but it is still
> accessed in emac_set_fc() and emac_set_fc_autoneg().
> 
> Check for netif_running(dev) in emac_set_pauseparam() before proceeding.
> 
> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> 
> [...]

Here is the summary with links:
  - [net,v3] net: spacemit: Check netif_running() in emac_set_pauseparam()
    https://git.kernel.org/netdev/net/c/5556f23478e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
