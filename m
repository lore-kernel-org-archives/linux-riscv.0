Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79129CCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 02:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTS244HuyQfi0ET7CfUQmcCHSWwuPY/6ohebpiU9v/w=; b=uch2g5v943Y/za
	iK+Yc5qpkuY+IHqN+UID8Zokb0Ujp7sT6MzPxECbslTwsQZzUUoB0fOXsV0w61mG5GE/OGl9juHIy
	DNoNo52egI72DwG2iohozmDCs+3ARHguMJG1N+pDApHd54s7UH90UczLlZ/v3kEW5JEug9PnIftLR
	GM5rLfYmvAx6I5c577JNR/p5BvyoffcOZxEzGX16zmKa6N04NG0upTim06Fsid+5OHiXFmbKNWohk
	KrfjfLDl6x/2LS5ePT23xHMq3MCd0YMXMODF84oeohYJcn9MgOaZMveehBHwnRydqtcuKCsjbqYiK
	jRYeY++419nt6IGmLJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72r2-00000007Uyy-0ZaK;
	Fri, 10 Oct 2025 02:27:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72qy-00000007UyB-34uB
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 02:27:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C22BD4368C;
	Fri, 10 Oct 2025 02:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C23EC4AF09;
	Fri, 10 Oct 2025 02:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760063251;
	bh=WdaR/Hhu12IphEu5iAM2TzbHpgJPVxeGQf1ik2Mps1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m6yDLkBHs3od5J9K+GT0WbgiCDCw/GjVUMAolgeUqyHnoYE2m44SIi4EcCOLisB5x
	 40iIsHyNZlJy1YLlK/BtFrv8sJEzVjX3BJhOhjLiApHEKQFUDksBSvQtwM1+LpDqHb
	 L8keqsNqZEhhopB3ht3LssiE8CJ0idh4SW7rDVvsfKI8bjgaFhoxuGvKq9BtSPyaz2
	 s6Wb830DXwh3VNsJYUoV8Uz5/otF52IQOvVsm2CtXsLpACHJjotgxuAs87yvWJMgmz
	 0LTqVIc9i9fbFy2hdxx0nyuRPqKsJb41F6ubtSl/7GwoPgOr/Ox3bCBVpmMkCwzcnV
	 sTqZ4JfduI+gg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC8E3A55FB5;
	Fri, 10 Oct 2025 02:27:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: kprobes: Fix probe address validation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176006323925.354358.7825559946978649755.git-patchwork-notify@kernel.org>
Date: Fri, 10 Oct 2025 02:27:19 +0000
References: <6191817.lOV4Wx5bFT@fvogt-thinkpad>
In-Reply-To: <6191817.lOV4Wx5bFT@fvogt-thinkpad>
To: Fabian Vogt <fvogt@suse.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, marvin.friedrich@suse.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 bjorn@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_192732_795107_5F42803D 
X-CRM114-Status: GOOD (  11.14  )
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
by Paul Walmsley <pjw@kernel.org>:

On Wed, 10 Sep 2025 17:25:13 +0200 you wrote:
> When adding a kprobe such as "p:probe/tcp_sendmsg _text+15392192",
> arch_check_kprobe would start iterating all instructions starting from
> _text until the probed address. Not only is this very inefficient, but
> literal values in there (e.g. left by function patching) are
> misinterpreted in a way that causes a desync.
> 
> Fix this by doing it like x86: start the iteration at the closest
> preceding symbol instead of the given starting point.
> 
> [...]

Here is the summary with links:
  - riscv: kprobes: Fix probe address validation
    https://git.kernel.org/riscv/c/9e68bd803fac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
