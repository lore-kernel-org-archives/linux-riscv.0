Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB996C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 22:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMd+AJ/dKC00s5B6YdtkkMsFhXvCbm4pEF5NOvC4Rbk=; b=dYLqUHqj9lqPUH
	QmaKH7mZwkeLD+r5vOR6fUSQQh/x6s7kbbE22JOjHtiR5N+uE8BsdHJZFxM6sSNHfENyqDjV9Qj2F
	kezJeNTtrbFf7E8j9ScevWL37aQZzB/+2nXVaGlgUpy9bx+JJMGque5t8hBlS4vwXjIVk4cjLc7Sp
	7vwilTuIInY6HNgFH8PVP0BQ0PeQTZeCK2E2+YnGE02+cgCuPTbq6Eyp+UN9xconqn8vY6zTKe+9H
	xmMZ8CtFzwk7FM7/HuVTmfeyk/R8QMk5nMurwRAIIJZA8ujfGHBkpw/w0YW5XtsRWt6Pk4jsCGRzY
	3FWGrOswiER5AwH3oPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqoX-0000000Eoc0-0SUJ;
	Thu, 12 Jun 2025 22:54:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpem-0000000EfLZ-4B79
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Jun 2025 21:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aVjeQZeG2SS5dmd7BOMypHCAQa682PxfaFKrZKN7p1A=; b=KIXN4ys9PZ3rXNYr4M5ZLcf/2l
	M5zgOqdofi+ONAGxfVSLoMuc09He+LIWhL3BkS6O/LjYstniZHlb6dqYjxbf2P0ZV2vBf93kvaefB
	Bq4eyrOq/HSOy0U2uX7n5NLvRxnkD/f+QZiypTWf0HPZ5DXmCKAhOopHRpsP8vsJ2h6+ZeDx1nYKD
	wFQDuWKr0hq3sK75buzwuQSp8xppgNiHWx1B3k04+YAVUZzYwYXo9JpQWevG0sOyY1mmGOfRUvtgD
	9VhT2NCglXJzKOh3scXLun5T9AsiysXJRAkJMp/8JMEPaDk6eKrFlm+guf5jgT/UPY6tDUaXC9JFj
	vk4+c2KQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpeY-00000002j6r-3oX0
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 21:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41A5DA52170;
	Thu, 12 Jun 2025 21:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0D2C4CEEA;
	Thu, 12 Jun 2025 21:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749764398;
	bh=ObnlVfJEB9QvQfc6CH70qi9cYvBWWCfz4W4K8ajRjeE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=URdeh8erkeYSt22fj8fayc6c4bZJHA7lByFZC1u17a1DVuVNn37zzHJFTG8IOzG6i
	 ZNDcL/Ddk8guWej01itzSA+cKJHlVSVabDe0dtmkBJnKWrkFkLhrxz3d4HeIy3YXDG
	 WhGrd/TAgBW6YeIKV3YVJricVoZ2zbfacQmic648YzKlzIVHDJcJJ9fQEndL3mjIgn
	 F0NJl3ivWa57tIbkI8vY3lgS0I3ItKU5S7qBMR5OXXQLCjGpKqPUOJUa6UC3Pp8uRc
	 4WumfFt2L8nln9ghQO9j7cDE4Q/RNzVdnlPInKxK07rd1uCGFWtE14bGWGnwLPNpzt
	 C08ny4y9bzZpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD363822D43;
	Thu, 12 Jun 2025 21:40:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174976442875.118664.14858626447477465303.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jun 2025 21:40:28 +0000
References: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
In-Reply-To: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, guodong@riscstar.com, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_224014_482182_006429AD 
X-CRM114-Status: UNSURE (   8.31  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Wed, 11 Jun 2025 22:56:04 +0800 you wrote:
> Changes to defconfig should be always updated via 'make
> savedefconfig', run this command to make it aligned again.
> 
> This will ease the effort of reviewing changes of defconfig
> in the future.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> [...]

Here is the summary with links:
  - riscv: defconfig: run savedefconfig to reorder it
    https://git.kernel.org/riscv/c/d958097bdf88

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
