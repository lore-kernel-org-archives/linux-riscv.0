Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBFCC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 18:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g50tmnwIr7cvZYHUJE0pPURuJdDT38fWvHStTtSmyos=; b=eVa5aArIvF0BFc
	UzZFT3smkjtSIj2MTNEFucFRfidN9Vsrzx5TxLbztiV6zZv9NvNeJoWvqNWP6CWDhONFNP6iGcFEO
	JH16Wim0TQKLsJGfA8wnrWs48Iz+HSY/olEt3LQOom5t0BuTig7AfQdLCU0TC5D+16+udyAdML4FM
	hBoMRa2CtPuP31RkhAwyykVo6uhMLAZr0GgypQUrWj9zu38/ubeER/HHgLXoO8hVN2vMIg/apROgX
	rco6KEBONbhQyye2RAPbbM+YzslNWYg2K6S3PdEhA9MsAy594oni0DQN5sFETQt36Vvl2ESlwbcVW
	EGxryjEnzoSKD+96QXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwotP-006mqs-0x;
	Wed, 10 May 2023 18:50:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwotM-006mq8-08
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 18:50:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 966C56104E;
	Wed, 10 May 2023 18:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05F1BC433D2;
	Wed, 10 May 2023 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683744621;
	bh=kXzQk7xycngFctnvk0+DiB25T65v/Wg84JRhNZNwaGM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tCnwSXv5ScEZKB7ZtjGc2AtS9fPNtPgTLAbYb1T3zBqmKs1k2zyK/UV7qavJqFKTJ
	 2Fiz7oYWFDS4XsNZUaptAQ/Hu1HA250XokTNY0V+ymMrYAx071Wd6cY/x7AJPJt+wx
	 B2OporcGi80AsrondtpVLljuBEXZPy8o1Yq7wprldURmmAWaXBtvI9+yyf1jSknFs8
	 eFMen1CEqnnn0UwmVNIgSaMI7cTvsgboo8YpaUNZcfcBe4Sliijo5MIGXDYjYIzb7z
	 jQleRUaKGLeArm0NBtcIADYPVlsKtiLdOdHoZ3hZeIl7Ec2jftEvr/4WjaomP+Sqtw
	 oKlztk8u2eySg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E2B04E26D21;
	Wed, 10 May 2023 18:50:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Fix orphan section warnings caused by kernel/pi
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168374462092.20912.15148241104611653227.git-patchwork-notify@kernel.org>
Date: Wed, 10 May 2023 18:50:20 +0000
References: <20230504120759.18730-1-alexghiti@rivosinc.com>
In-Reply-To: <20230504120759.18730-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_115024_146627_ECED1D6A 
X-CRM114-Status: GOOD (  11.93  )
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

On Thu,  4 May 2023 14:07:59 +0200 you wrote:
> kernel/pi gives rise to a lot of new sections that end up orphans: the
> first attempt to fix that tried to enumerate them all in the linker
> script, but kernel test robot with a random config keeps finding more of
> them.
> 
> So prefix all those sections with .init.pi instead of only .init in
> order to be able to easily catch them all in the linker script.
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Fix orphan section warnings caused by kernel/pi
    https://git.kernel.org/riscv/c/3b90b09af5be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
