Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F35C88CB2
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 22:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fp05wsMXLDbQWP5CM6IXb+YTjmjGjd6RsZwel2VRbw=; b=DchsbIfugeEsjV
	COKno3JY7IFbdodrfshh3I2x+A1N/BFqVWGWaPxyuwGOXapW6NP1JdfooZCacSims/7b+TR6UPtSr
	toYiWYLhbuJy0z9HCagHLHKSmsNoTx0JQ8gj6ug7gkh2unYPIZv/Jn6/Ik7kYSdniYg5LG1CTAGEx
	m1M3r+vEqLZfRCaWZ4zd85n8BDYuusYpN11FraRePmUtiLUirzdh9ObHlkTZK1VRO7//xuxkoOiar
	qLR6ezwoxdytG4HWQ4fUBbn5xWj0ZLSpA9liTY1KZ7WgJGtN/G9lxu0i8W6G19Wku3CkJsKfk8zAe
	kVdUppBjRY2KpJh65G3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbpiJ-00Fs5X-0w;
	Thu, 31 Aug 2023 22:00:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbpiF-00Fs5A-2L
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 22:00:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F6B561F75;
	Thu, 31 Aug 2023 22:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D664BC433C9;
	Thu, 31 Aug 2023 22:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693519225;
	bh=isH+3en++nFgCm/dPeYJswG9ch6sxrAYuSSbkrNGRmQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LS136V1uQfD89bRa3oyHtwQ7fDXQV+EO0z8VmbyRfdoR9PuiWR+TqFWT3wOc7s/Q2
	 9SNuxOhYo3IxggycO7HY2RHwfdtsxxqsMKFa0dXy+1XaMBq/sm7FQ5vDHD6QGU7Q4z
	 hDqU69Pp6pzM8/GDitBCS/ld8dYqYCU6OWEpiSc56imZIRExeeE6k1x657EHVq0m/d
	 YXk4sLtMeR6WjKI3VXbpCBUph7Yaqg3Lg6FnolZIoKoShyv7KrK6X/m4e64UViHt34
	 rJNu1n4ihkZCKw/5fb3xNf136zKQt4FRZcpYbQMKPxEF/1O6vbbyVbQUqUz2HzBC2N
	 DHNRS2vGpavCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA0CCE270FB;
	Thu, 31 Aug 2023 22:00:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Remove unused "size" in ptrace
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169351922575.30031.7635043144697154059.git-patchwork-notify@kernel.org>
Date: Thu, 31 Aug 2023 22:00:25 +0000
References: <20230830203754.24940-1-palmer@rivosinc.com>
In-Reply-To: <20230830203754.24940-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, andy.chiu@sifive.com, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_150027_829984_0AE97AF4 
X-CRM114-Status: UNSURE (   9.14  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 30 Aug 2023 13:37:54 -0700 you wrote:
> Looks like this just got lost somewhere in the respins.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308310306.tOrkoBmI-lkp@intel.com/
> Fixes: dbe46b094026 ("RISC-V: Add ptrace support for vectors")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - RISC-V: Remove unused "size" in ptrace
    https://git.kernel.org/riscv/c/899230bac3b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
