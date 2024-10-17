Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D40D3C521
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XA31+uQbIf8Eozn0jb2OWZol7jsXPaUUFAom169ELQ=; b=eoUtLz6EhSyEZm
	My0oEU7FXQHWlLVSxO7jq3+bIBnGa1UyDBLjbBXL1yIz1Gt8jECwGuF4T3O4Vrz2MXc9GRrdXzXxo
	qoSolOiuoTn2SuM1/K4QQefcnrIv6DKW6QqOHS9o51gh5CI506mDQwTR7vD+P7dZIk2wNodufPPhm
	Mh/+TuzSZmedrAEkDm0mSTpMWmYzMD36Q5DTh17n5GeNzQp8lWjhl3Fzln2sKMEUuUJBsNhC5jb5a
	rDUMVA1iHY8YEt86Z/UBRTkkpZ8KALQxDE2FWtpuucMXYge0Mqb6RZIXJTcYD+oAmVEl1Adb2VtoN
	PKYXD2x/+kA+khy1hR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TQL-0000000FVvP-2o43;
	Thu, 17 Oct 2024 16:32:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TOV-0000000FUuW-2NUg
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 16:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24CCCA441AF;
	Thu, 17 Oct 2024 16:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABE6C4CEC3;
	Thu, 17 Oct 2024 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182633;
	bh=JgEDONuZMW0RXmaThVkqpbpBWNhaPxsT+5egJGMHYzA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RmyEsbHGJAFaHiUBDwYWaCxAkoe/fElZTdhpk551hhl+E9A0vMX0cin3kJAUY3lY1
	 vHjQCAL5mVFrNo9hUrhQvhPf8vMt4+WSRP6P85GDcsuAE2flniQ8OFZ0mXWS1+8hEG
	 5JMiqJXovkeJMvSpy5Yo2eHTfwuoOxhgzxfUjqaLlJWAWaUXYhfUbH1iydiuVWnW9F
	 vjlIfsdgxrqA4JMJNB/2djZwOZp3TUoAb2Ftui6ul6GMpAfKw7I7YF4KvWXquvGW6k
	 4VxTC5DZw+nvX//mjmG5JpT42NRuGa9s/0N5R33LIswep+fA9RLvpj1bUU9gzDa/fA
	 mUwcQxTw+HgjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713BE3809A8A;
	Thu, 17 Oct 2024 16:30:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] riscv: efi: Set NX compat flag in PE/COFF header
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172918263898.2528145.2599453059177986723.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 16:30:38 +0000
References: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ardb@kernel.org,
 emil.renner.berthing@canonical.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_093035_694315_EC13A603 
X-CRM114-Status: UNSURE (   9.34  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 29 Sep 2024 16:02:33 +0200 you wrote:
> The IMAGE_DLLCHARACTERISTICS_NX_COMPAT informs the firmware that the
> EFI binary does not rely on pages that are both executable and
> writable.
> 
> The flag is used by some distro versions of GRUB to decide if the EFI
> binary may be executed.
> 
> [...]

Here is the summary with links:
  - [1/1] riscv: efi: Set NX compat flag in PE/COFF header
    https://git.kernel.org/riscv/c/22a159b2d2a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
