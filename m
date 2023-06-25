Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3C4C0015E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yGvBmkZtqGPpA2GmFHUmrgwju96PIC4KtO1lf+4/+iE=; b=aECrrGB9KQIhkv
	gApelA0Kuya4ZSlWgao6W3C9ZUkCKOBsukr5ei1K0A0bFK/mXZnhbA6DMirGoTTCii08QK5aXJOjN
	C9FbXdjTXT7h7mWBxN7wBQcigyaxtg/Sqiy5oBWgxGIdBpsXlnE7pnf3rRqCiewM4og13ySIOj/Ty
	spBeWtvbgenm/Az+Yd5xoJpehd7RFMIjF4+nDrh9q3FeHkq4oVDQG1pAyPZK9wL4paACa1eOvguSz
	qVWRzrN+yWiD5nGrNs6hvlZ7uEe2DpQCYgYzq/ve+aAvproqorSxuDKiBmYqEH6VGrW7g1pX0vsyj
	C4vj8iT5c+D2otvnZVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ23-008uNn-35;
	Sun, 25 Jun 2023 23:20:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ1t-008uH4-2l;
	Sun, 25 Jun 2023 23:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E956760C53;
	Sun, 25 Jun 2023 23:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D703EC433D9;
	Sun, 25 Jun 2023 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687735223;
	bh=V0mEthuo2hM+n0Dz9lvr8KnNHGvgUzGhIENMGfcWTFA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=THDcRCI5g1R9tFFpbzLx4z7fNIuI6S/HAtD1IRVb6dp82gqwLCd4jZr9G0K7z+lNr
	 Dl/UYUl+OzU6Wlehhi180XVoQP7QiUWc2tol2DNJBW98UpVDiYzVd6cjS/5HiqQM+G
	 ly/I+dXcuFAQDB2uISrfrx6OxVgnIxs4mlPMqXdNOwTjfNFRLilgoT0V3dJ1nvLVWz
	 O/e5CB0dV5iaW6SfRIF8c2CQUm6ayeyV7c7m0z0Hv9uGyGRveoU201foCgC/sKLuct
	 mvYBzH6ChvEhQcCJtCDASos3X30RxzhFt32loak90uilAhlzPQDvDtvt3PdNcUQXpg
	 cQ1AXvjujVGqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD9C3E26D41;
	Sun, 25 Jun 2023 23:20:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2 0/4] Remove WARN_ON in save_processor_state
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168773522377.24181.6260932886978170161.git-patchwork-notify@kernel.org>
Date: Sun, 25 Jun 2023 23:20:23 +0000
References: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
In-Reply-To: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 chris@zankel.net, jcmvbkbc@gmail.com, steven.price@arm.com,
 vincenzo.frascino@arm.com, leyfoon.tan@starfivetech.com,
 mason.huo@starfivetech.com, jeeheng.sia@starfivetech.com,
 conor.dooley@microchip.com, ajones@ventanamicro.com, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_162025_937877_1D089860 
X-CRM114-Status: UNSURE (   9.79  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri,  9 Jun 2023 15:50:45 +0800 you wrote:
> During hibernation or restoration, freeze_secondary_cpus
> checks num_online_cpus via BUG_ON, and the subsequent
> save_processor_state also does the checking with WARN_ON.
> 
> In the case of CONFIG_PM_SLEEP_SMP=n, freeze_secondary_cpus
> is not defined, but the sole possible condition to disable
> CONFIG_PM_SLEEP_SMP is !SMP where num_online_cpus is always 1.
> We also don't have to check it in save_processor_state.
> 
> [...]

Here is the summary with links:
  - [V2,1/4] ARM: hibernate: remove WARN_ON in save_processor_state
    (no matching commit)
  - [V2,2/4] arm64: hibernate: remove WARN_ON in save_processor_state
    (no matching commit)
  - [V2,3/4] riscv: hibernate: remove WARN_ON in save_processor_state
    https://git.kernel.org/riscv/c/91afbaafd6b1
  - [V2,4/4] xtensa: hibernate: remove WARN_ON in save_processor_state
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
