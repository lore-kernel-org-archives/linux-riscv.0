Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A96C46CA0
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2niirolrO+c2VAwMcZzhaT8/GaOlBHFnK/xxUec2QPA=; b=bleXiUPIErj0qm
	ANCv4PJOqTMj/2PBBkUO1C2qC9Je8TTbvSKQzY2S71Oq7vHgGK49tUoROMWPWhu3Z+1ajfwlUxWg1
	RJJLO/441bmZoPWSjJL7Fal4m1XJzfMtzZRWrvBE3GrHnBAEcCKFK/Sc76uhkXtgZZ5qknwtKxEyX
	u6fWJnyY2NRcBex+oR9dJh0g/QjxCtLktcEsCi25uFWEnGBM4CGWTXeO1Zm2Xv4395e6mg12+68tk
	bW/R+u63BSMWXZXMYQbTcT6Kr9YFLvk8vBmnW9raQdreTUJDkTe6v4/987IkPpPC5yIvPTYVSh541
	QTsaJzQ5ZpJ2iIQ90cwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGB3-00DALN-2D;
	Thu, 07 Dec 2023 15:20:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGAx-00DAFW-2e
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 15:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E7585B828B6;
	Thu,  7 Dec 2023 15:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA114C433CB;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962425;
	bh=rw/aIpkgwRdkXf+EVs58MqLQ5IOCNAngxP/UOBWeFZw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PeFdZ4+PtWw2dA9USImV4k3ih0q9njnaGoqBzbhyCa8JCpXrN4hOrV5+hFZ8Pweyn
	 Lxne6NtK1Xwa8WeeWxMwu7gbMYsZ20taYSmc/dqhSXOUZ5Cr4dC0B5jVfL11cw4rBE
	 wxmUltJ+cAnm8yoSo+5zyKhss3CsRMvpz/J137+yA8dOrfHJxZZW8V8eyp3nK6ZqO3
	 VCPWmfqygJPKQyzPIYocqVuak5XM42dkigOmeDF6J6uGjBykuAaB1jmWQq8gXBH+WH
	 fU2Pbk0iUmoQfWr+MScJbkHQ0awtNLhU5aecfJdCuBVUo4g2RnMtqxo4Un0o3eUbf4
	 j7xkgpER+ni5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C17C5C595C3;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next] RISC-V: hwprobe: Always use u64 for extension bits
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170196242578.12999.9102455009815315888.git-patchwork-notify@kernel.org>
Date: Thu, 07 Dec 2023 15:20:25 +0000
References: <20231101141908.192198-2-ajones@ventanamicro.com>
In-Reply-To: <20231101141908.192198-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com,
 conor.dooley@microchip.com, apatel@ventanamicro.com, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_072032_007884_8150ECC8 
X-CRM114-Status: UNSURE (   8.26  )
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

On Wed,  1 Nov 2023 15:19:09 +0100 you wrote:
> Extensions are getting added quickly and their hwprobe bits will soon
> exceed 31 (which pair values accommodate, since they're of type u64).
> However, in one tree, where a bunch of extensions got merged prior to
> zicboz, zicboz already got pushed to bit 32. Pushing it exposed a
> 32-bit compilation bug, since unsigned long was used instead of u64.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310311801.hxduISrr-lkp@intel.com/
> Fixes: 9c7646d5ffd2 ("RISC-V: hwprobe: Expose Zicboz extension and its block size")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - [-next] RISC-V: hwprobe: Always use u64 for extension bits
    https://git.kernel.org/riscv/c/777c0d761be7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
