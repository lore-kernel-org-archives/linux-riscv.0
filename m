Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8893CC30654
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjB0VVC4Y2qup3aWLBf85GceogUeET6DqSLcpepuo8A=; b=IPQWdxRaZBzRUw
	dO/isJCngHsBQNJsebNAL3k935o8UaF4gGPpwvOL/RSpy0xlwF8da4fj7dT76F5n8e82/+6UwvpJC
	q8oDCiNgECpXvfB88Vg7bI+EAPaIDYA5tUjz+WCJMvuWVT8VT95gvvnn5Vphdil2l+377fIOarXWS
	bMxX0xoNHgOVyHzjcznCXmCfHvEwkZJE3F1WjwE036G76LYyUxBVBRinBmW+FIHK8XS0v76gDqCje
	q2OzliW11UJNUtHrTIbYaXeLeF3iRMAq3nVOz5o5MNF1FfgSVFrCrJV6NQW7nh4qL1BysImkdyqpe
	bBuiO80CtUGeK1lJp0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWenb-006fUi-20;
	Thu, 17 Aug 2023 15:20:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWenS-006fRp-2j
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 15:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBCD562035;
	Thu, 17 Aug 2023 15:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7298C433CD;
	Thu, 17 Aug 2023 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692285624;
	bh=54jSAxQsEgLssz13NsAAtywsNx0kXc+SSq2W5eBTFP0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QsnyW9XADwnvJTdjkajzdDkn88kCCSpnJCjXp/B92LUSgDpNJra51PJqsR01WP2dd
	 SPoPmOB/gWBcwRDORlzqu8MXv09VPD/KbakRS+Xfud5E6Z1/KCqoZvBoe9ds/MrsCe
	 eVnKW3pIG4WFbD4l4JIzTxn/5KL1IHwUzxrkwUOoZ10sgEfc5ASqP5VbSBEg6NF9/p
	 vkcgtgZDjA9yI5o0YwRscsRZr4N3BUhU3XFAWtrPxTCrrR6ookYrriUrw2JbehMEqP
	 /lGVjVLEru7v2+xbOeouIAeOcENR+X8+RkTKUvU/k2DGi0r44FX20FtO8HX/WQMqLG
	 XdnbPwJDcyg3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD9D6E26D3A;
	Thu, 17 Aug 2023 15:20:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v2] riscv: uaccess: Return the number of bytes
 effectively not copied
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169228562477.20811.12846984495723558384.git-patchwork-notify@kernel.org>
Date: Thu, 17 Aug 2023 15:20:24 +0000
References: <20230811150604.1621784-1-alexghiti@rivosinc.com>
In-Reply-To: <20230811150604.1621784-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alankao@andestech.com,
 linux-kernel@vger.kernel.org, tsu.yubo@gmail.com, aurelien@aurel32.net,
 bjorn@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_082026_943363_8445CEE2 
X-CRM114-Status: GOOD (  12.73  )
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

On Fri, 11 Aug 2023 17:06:04 +0200 you wrote:
> It was reported that the riscv kernel hangs while executing the test
> in [1].
> 
> Indeed, the test hangs when trying to write a buffer to a file. The
> problem is that the riscv implementation of raw_copy_from_user() does not
> return the correct number of bytes not written when an exception happens
> and is fixed up, instead it always returns the initial size to copy,
> even if some bytes were actually copied.
> 
> [...]

Here is the summary with links:
  - [-fixes,v2] riscv: uaccess: Return the number of bytes effectively not copied
    https://git.kernel.org/riscv/c/4b05b993900d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
