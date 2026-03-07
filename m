Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94046FC9EC3
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2026 03:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3KR7tpjudZQo95KZQmVrIyocwmwqjMtuWq7K5MKdqg=; b=Ds5MsG00sYKvD7
	BT1zYRYiolgtSAFR+9rknOU13rLEz8DTszqF79Y9Ymbq0PxTr7suK2CBcysRH8KNQ+4daySy9yxJu
	QDzzu0yLwlPTZwynAnRfs6xPC8CvsqI6LTnUeIP5Qw0X8UuI5oscaQB8zf7RhWFd0zXhWv9cEpCMJ
	as5FxHsvx0hzK92T7k/KLZp4ab9nVQHiwGttAgNJfO45WqYDb17oTJr5w2yS/AJUpSNR6J8XTZPmc
	331hO8hOWQrF27DnnpV1wqeNjP0O2e2ND+dtbflEFsbZcXwSie07cHU1878k0Xj6NhJBJcNBdhA7D
	rwANLvv2tvF+29FWW/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyi3e-00000004pjz-1lk9;
	Sat, 07 Mar 2026 03:10:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyi3d-00000004pjt-08VV
	for linux-riscv@lists.infradead.org;
	Sat, 07 Mar 2026 03:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15FCB60053;
	Sat,  7 Mar 2026 03:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC62C4CEF7;
	Sat,  7 Mar 2026 03:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772853023;
	bh=TiajJF8FGs34cMcYXnME5ueOoAbs9UDJQ7cGdkNKzsU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FaSUnY5+LJDvosPvE9K6uYmazcUbcnbAqKdoouAsxz742LnmiJrFiO+V9Qly3I4bS
	 Yb2x9XSbRgA65bXi5UmhFpiepN2/SSREYhtTrI1mMk8txuWHbG6CcDsLprjMozZ2tW
	 QhVheN+Xw7JmX1LuNxudVvy1yTzOb34l/d/xO/VWH7WboKPBxyEi7uPYwb147kXeEV
	 BkvXHJr07CcKGceE/H+7I964JxyuALRUPyWI5kg1xVuaZpVy34hjXmnI6f6CCX+9i5
	 ROD8JW2J2EnpXMZa5LKj1DsU8kJwYP/PGTBkrCtsQYQKGo5Z8pT7JndoOINSC/i1FK
	 IgXsfifn4SZvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C763808200;
	Sat,  7 Mar 2026 03:10:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: spacemit: Remove unused buff_addr fields
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177285302252.135595.8145843484531781952.git-patchwork-notify@kernel.org>
Date: Sat, 07 Mar 2026 03:10:22 +0000
References: <20260305-k1-ethernet-cleanup-buff_addr-v1-1-e978ef119231@iscas.ac.cn>
In-Reply-To: <20260305-k1-ethernet-cleanup-buff_addr-v1-1-e978ef119231@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dlan@kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 05 Mar 2026 15:00:29 +0800 you wrote:
> These were never used. Just remove them.
> 
> No functional change intended.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> Cleanup patch split out from:
> 
> [...]

Here is the summary with links:
  - [net-next] net: spacemit: Remove unused buff_addr fields
    https://git.kernel.org/netdev/net-next/c/70eba59f9207

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
