Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DC5C04FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 18:55:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14C5361360
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 18:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14C5361360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Tj2Spsyz8/Qx9LxOPBkgrlfBY01Qh3L0Z2T72cX4aQ=; b=oX0xUGpga9geOg
	LWJrfL14WsFnDoAN3A3YE7rujT3OXfJeKLfFHIjOjTgGZlwdKF5xLxWMrCBcktSUtHj3jMx/YmJ5l
	1yppXp8O2r9knTi0+XJzKqUmCGhXEKmduCbITJLRdK3rc/6vUdERR8x5DX/qcJUG2g5SnWAGDWSme
	P/NZWjCrgvIAeec+yH7KGzJUn3aFbQyhp2DZqxeUv3KQcUF2nwMsCJYctx4AEDXvTrL2CpCAVIBhY
	xdQUF2XPpwskDgZKU5oxi8VdON/r+VxnmcXCbx25HXV53PEfj0Hfe5Zk9zgtpgqE71rMTnEOb/m9j
	8Eg+lZTV2QWkV5XcOkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llFis-001YgI-6C; Mon, 24 May 2021 18:54:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkxOF-000bnC-Lw
 for linux-riscv@lists.infradead.org; Sun, 23 May 2021 23:20:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 379BD61155;
 Sun, 23 May 2021 23:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621812010;
 bh=ZVwz9mgA/9pfrVoLf+QE6jVCN2xSXMW4+QKcBMtLNLI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=m5X8RJ1mf/wIV4vY7DXE+0qoDYJaslSuD1KMzydY5DTIG6KO15e2Yzfxew2EMJnwp
 T4xQCym4tMzfODTHdUy2RxigYFnUF3qUtBkU82T6WLpSGKsIs/uk50aiR0+i0k2zEm
 XCRkhlWtg4G5sQvyZeL0smsKMaUBX0PFAruxO+CpTBh6MClcm7VwaMjzE5PMD38bRW
 /vgD9ESlrjHO7b3trdBxOZLqiaNQKnd71lLUQfSuol4mrrPmRhxW6lJl6Ad9jJR2sf
 xTjPypVIdapxBtUmtpBbdyHqzOY0SEgRP+pkFRVAifl/4pSgLyRqghg4vnYMIWehLK
 lVGU97s175c7g==
MIME-Version: 1.0
Subject: Re: [PATCH v2] net: macb: ensure the device is available before
 accessing GEMGXL control registers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162181201014.2631.11068199845594648051.git-patchwork-notify@kernel.org>
Date: Sun, 23 May 2021 23:20:10 +0000
References: <20210522091611.36920-1-zong.li@sifive.com>
In-Reply-To: <20210522091611.36920-1-zong.li@sifive.com>
To: Zong Li <zong.li@sifive.com>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 davem@davemloft.net, kuba@kernel.org, f.fainelli@gmail.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, schwab@linux-m68k.org,
 sboyd@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 geert@linux-m68k.org, yixun.lan@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_162011_779871_7DA76140 
X-CRM114-Status: UNSURE (   7.11  )
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

This patch was applied to netdev/net.git (refs/heads/master):

On Sat, 22 May 2021 17:16:11 +0800 you wrote:
> If runtime power menagement is enabled, the gigabit ethernet PLL would
> be disabled after macb_probe(). During this period of time, the system
> would hang up if we try to access GEMGXL control registers.
> 
> We can't put runtime_pm_get/runtime_pm_put/ there due to the issue of
> sleep inside atomic section (7fa2955ff70ce453 ("sh_eth: Fix sleeping
> function called from invalid context"). Add netif_running checking to
> ensure the device is available before accessing GEMGXL device.
> 
> [...]

Here is the summary with links:
  - [v2] net: macb: ensure the device is available before accessing GEMGXL control registers
    https://git.kernel.org/netdev/net/c/5eff1461a6de

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
