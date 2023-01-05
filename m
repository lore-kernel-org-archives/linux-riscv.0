Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30872C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 23:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Jh3HGQadu7IHuxHSQ3yQ9Nn6cB12VBhbJR0NSBMuCA=; b=0mfpaBJQkL5dNZ
	zF07gw8GkygkOyD16W539Jlkip6PKb5slmbEdGFOTDaX1RoCaL7paaZ2mZ7lOc2lFU25uC9fHZWNO
	2diLfdjV2NibKPZZNhx9Wdv5juS1mi/keS8IducrRB+TKBP9ly79yPOjY3DzV7JmhEOEIVauVTYo7
	nAZXoIB4Zt5PG3pdPiX6Tb69vOBrhW8k1xUtQpMGASpmsJL+vLdWtZy8UqNBCEH8JohJcJ28Bv0rI
	2LBRq8x/sXWNNQxGkQatfUXk5i2OiIVobQXzjYTQkCGfMTlOblU6MvWCVI2iwMAUa/1Et5zrQ6PTF
	FOB5ASdt2uS9LJakvAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZw2-00GISt-Lx; Thu, 05 Jan 2023 23:46:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZDf-00Fsvd-TU
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 23:00:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D79B161C99;
	Thu,  5 Jan 2023 23:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B40FC433F2;
	Thu,  5 Jan 2023 23:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672959616;
	bh=D5EHiJpROSuZ6P66ntkt9Xvxx1BijBthqB0kyLC3nmo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VEYHaVbdtW1o3ZVcYpOmTq9pILMnqMklO0d56bWmskp84HvyAxtrkVNSQXLi9w1q0
	 zy3853jqxRn/e3f4rTiCmj4yAi+C7NbwlnPlgPltF93DF7D/i2dlVaNZifoBA5atrx
	 f8drl/AnI3LWBvkYTpwBFmMOmh+YdiZD9BGqTDRKU8sdBV8qQ6An4dOk3S8BS5fXGv
	 otqdlZLHikVXWyw78mro6MJf7ZlCQk4gUpfh+YtOJml8F4pU0vSH4j5KdlKb36ULB9
	 pVBwNaY2k0bcpVAMujm4e/TLjUzbrVaW4qUBZ3gpkclhHBfOHXbs9BCKwzxNzwoA0K
	 f75Cy+7cmBShA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B355E4D007;
	Thu,  5 Jan 2023 23:00:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: uaccess: fix type of 0 variable on error in get_user()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167295961617.27641.4395161455545202996.git-patchwork-notify@kernel.org>
Date: Thu, 05 Jan 2023 23:00:16 +0000
References: <20221229170545.718264-1-ben-linux@fluff.org>
In-Reply-To: <20221229170545.718264-1-ben-linux@fluff.org>
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_150020_046277_26497C9E 
X-CRM114-Status: GOOD (  10.78  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 29 Dec 2022 17:05:45 +0000 you wrote:
> If the get_user(x, ptr) has x as a pointer, then the setting
> of (x) = 0 is going to produce the following sparse warning,
> so fix this by forcing the type of 'x' when access_ok() fails.
> 
> fs/aio.c:2073:21: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> 
> [...]

Here is the summary with links:
  - riscv: uaccess: fix type of 0 variable on error in get_user()
    https://git.kernel.org/riscv/c/b9b916aee671

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
