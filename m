Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4891EC83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3VMB/inA9Us3eAy4fgCgmdsujyT7qfOXJAHaOatVJU=; b=2Dt0xFmhzxN0/5
	b+webkU+88B7eWQ++bDMZAxq1srabLvNMvc0O2forlEyxeliEtHuuerWuWqDqLzbXjfMfAV2ApX/O
	iX9zaj3cg3puinXdBcS1hlU7a3VCXkQCgrqdUNKLTkA/FXz9+Mr4QxtjnGavAJdQXgmCvqeJpbGdq
	Hu2ltYBL96s2cxJK+OtJrYXpy0vwV7Q2Ku1UYk+RgtiDeEtZCVzkWH3LiXzsbW7MsD/ujiV7nnJ0j
	aLszn4ZR83k/ELZq5unnwhetzIkXtov6kR+vfdJuxOAxF4mmKmd5JCuq7RCZi2s7QrmyVIALl73Vo
	WZD2hh4ADVIbj7Rlqv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL82-00DXns-2r;
	Wed, 30 Aug 2023 13:21:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7f-00DXXX-2G
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E816D6214F;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE2DBC433BD;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=cuLPLucPgzyIA7ym72xVrHdEZINVLlHnb8WQoni9rVU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QyAIgZuy/C/TOqnKxD161167AISrmBTCr1WmpxsiHP9AB9WxONiSxAqsmPsdKVHUF
	 4OYpw5mxRottJwKTojqVJPa2C/v62LniRZjK4/e5wabj3jKPvZq4+Irz4tRpUyKO+H
	 0/PPE6BCIgU6UH8YxRPAn1+c5jmuOuNrpYNbrVqMLYgcn9Vetd5P8mgQCaWOD3Aq19
	 QwW85d/nhsNKh3ACcxwAvmyEENZ8k80nd2BNolhJp1pnDBT+F2y0nC0A7gtirpm12E
	 bvVPAVM1ZVxROqfUicljxB4n2sY77M1HYh+Win+uNdf32y6Ej/jMc6Zjn/277UAh+3
	 ZY/Htaz9xw1LQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C648EE29F3B;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: support PREEMPT_DYNAMIC with static keys
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163480.19859.2206176253038715452.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230716164925.1858-1-jszhang@kernel.org>
In-Reply-To: <20230716164925.1858-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062039_821396_963A90BE 
X-CRM114-Status: GOOD (  10.74  )
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

On Mon, 17 Jul 2023 00:49:25 +0800 you wrote:
> Currently, each architecture can support PREEMPT_DYNAMIC through
> either static calls or static keys. To support PREEMPT_DYNAMIC on
> riscv, we face three choices:
> 
> 1. only add static calls support to riscv
> As Mark pointed out in commit 99cf983cc8bc ("sched/preempt: Add
> PREEMPT_DYNAMIC using static keys"), static keys "...should have
> slightly lower overhead than non-inline static calls, as this
> effectively inlines each trampoline into the start of its callee. This
> may avoid redundant work, and may integrate better with CFI schemes."
> So even we add static calls(without inline static calls) to riscv,
> static keys is still a better choice.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: support PREEMPT_DYNAMIC with static keys
    https://git.kernel.org/riscv/c/15e062726f55

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
