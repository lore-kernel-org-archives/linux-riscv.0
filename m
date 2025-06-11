Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE4FC61DB2
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 01:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARWzTPlcVy7yfAlPSvHPGu65bHA5qiDq53FeaZuzrlU=; b=V4rcftYVIsuugC
	IxeTxGpEu/eFzE1rxN7gKHl1wJglAaGsXC1R3JLvYyq7kgK01xF3x7REdy+AR6fx4ZdYpY45GwDTO
	+ovhIWAQKKrKnZLNkLaohWToqIMBUhjuvOE+xOpBke7/XDWoMEhgk8fAkXt8YnqDbZC8QA6VjWXxC
	DbWlBDqecwR64kllZiUdBgFncRv/K+0EzmjTnOwCsy2PmsxcwU13E4ucai0rjt1b7JbMxR8MU636b
	guSwyKF4WZRDXuQhxshCnjeOL2sjbxWGcwFT5c9h0kskheV1rx1MTEUcRA7SvHF9vDmCcKN15uo9J
	WP3NKoLNlgMo4qpXtg1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAHx-00000008YWx-3DMk;
	Wed, 11 Jun 2025 01:30:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAHw-00000008YWY-0JIw
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 01:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DB9E60008;
	Wed, 11 Jun 2025 01:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A6EC4CEED;
	Wed, 11 Jun 2025 01:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749605397;
	bh=r1RV6yWcPTMdXv7fcO+LFlOF0On2abCreVsMxm4BoXo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jBU4i5CFrmBcAS/iwe2PgxqcewiXD1vFGdE3VUxmepKIju5h1vBe+VFJp5WTe8MUd
	 rDsIFriUPwrZQOdQPBNCfuX0jZydOvM5qDiGEd/tHd+FzGzFbsSl8Qm/e04ljn69oR
	 Dig6eQByqMlPJ4kffeQyG67e4/ccC0NzqSZr6YDdTMR1OMXD8cd6R6HRAIdfmkgYAp
	 rHg5c6j/Xa/hnTbHzpLZ6IOX9M9Pc77wtuZpJ2VPNfVzGBUyc8WCOOm+tlQLOTM9Q5
	 oawapUlxdvsoIVPxMFXB3erJnvGoKnrday+xzliO8fEJC78nMrkxrWT52POFguexqA
	 Gfxb9cUU89Elg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C0839D6540;
	Wed, 11 Jun 2025 01:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1 0/1] fix riscv runtime constant support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174960542825.2762376.5266886940672974555.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jun 2025 01:30:28 +0000
References: <20250530211422.784415-1-cmirabil@redhat.com>
In-Reply-To: <20250530211422.784415-1-cmirabil@redhat.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, charlie@rivosinc.com
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 30 May 2025 17:14:21 -0400 you wrote:
> I discovered that something broke basic booting on riscv64 for a nommu
> kernel with a minimal configuration running on qemu between 6.13 and
> current master. The symptom was that the kernel would hang and print
> nothing instead of booting normally. I bisected my way to:
> 
> commit a44fb5722199 ("riscv: Add runtime constant support")
> 
> [...]

Here is the summary with links:
  - [v1,1/1] riscv: fix runtime constant support for nommu kernels
    https://git.kernel.org/riscv/c/8d90d9872eda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
