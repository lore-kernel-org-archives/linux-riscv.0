Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B23C83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09y0ds82tnej4+jS89WK6s5jw7w7nt2RZVsAV5T9x64=; b=tO5NUns4f1TXgv
	a1bMBLt35qNYc52v2cGxf2+ZDQc+8xqItFJ9WFiGJfkPAZ3JBw8516JRQgtScQfDMtWnEaQdquXGo
	awV1stOlKhs3A6pTiHdKf0uc1/MsyouxyjtFjUTJJyhGgJiJchtJKBzM4jsFVBhAsOXinoOnitv9W
	s3CHqmPF3kx/ekKkAmoEbP+och7Vjmi4cqCA7Kq2dqqczCwxH6af7S/g4DLIby52EmsS30RUyHMyA
	oy/v5G9H9/0Yj4LYnrmb+YgR2xw3dYrBTmwr7vac63DNolFXzTDA2Vm/jKzVDSzbgcz8GB2uM5fJB
	U/NtnoRDVOo3pooD/Wdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7l-00DXcA-1f;
	Wed, 30 Aug 2023 13:20:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7c-00DXUW-1E
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DEDE61133;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F295C433CC;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=+mcncrJ2K/+urVw4ibq9DcmsLPHXcb8+oqYgBZVMwyw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kHRkPPXX4wvwuVQ+EbBADi81zLCq+8WPczycvkoa0smgSGJJaIwWkSXFX6xY5QPs5
	 2+uWYW62LuADLtD2tOfaeNndTunf0pXqtNITqxaRcO9/igxPzq+F5/5T/tCeblu3yp
	 drWAE+xNNGYkEJNR+VSZVeo2qx9oR7XTBHJwcjDd9p5sA5X6iwfQLGvWM0bHyrxZ/R
	 N0OhHRx37BpCXfJXbjm9KOw2tHaAgLtHRY5GlBR2+YcjEmjM9lSHy4s+kI3b22itGS
	 Q6cu6MTa+gZpkAYv4NLFlfjJS1P/j8khhzM4Ios0SwfqJfgK8jLx+HRZgSc9xyat1q
	 WkgbYYEA/oYlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7403DE29F34;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] RISC-V: Enable cbo.zero in usermode
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163447.19859.7372275191513999075.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230809115516.214537-8-ajones@ventanamicro.com>
In-Reply-To: <20230809115516.214537-8-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com,
 conor.dooley@microchip.com, apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062036_478718_B9610966 
X-CRM114-Status: GOOD (  11.80  )
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

On Wed,  9 Aug 2023 13:55:17 +0200 you wrote:
> In order for usermode to issue cbo.zero, it needs privilege granted to
> issue the extension instruction (patch 2) and to know that the extension
> is available and its block size (patch 3). Patch 1 could be separate from
> this series (it just fixes up some error messages), patches 4-5 convert
> the hwprobe selftest to a statically-linked, TAP test and patch 6 adds a
> new hwprobe test for the new information as well as testing CBO
> instructions can or cannot be issued as appropriate.
> 
> [...]

Here is the summary with links:
  - [1/6] RISC-V: Make zicbom/zicboz errors consistent
    https://git.kernel.org/riscv/c/66e02b1d6430
  - [2/6] RISC-V: Enable cbo.zero in usermode
    https://git.kernel.org/riscv/c/090925374690
  - [3/6] RISC-V: hwprobe: Expose Zicboz extension and its block size
    https://git.kernel.org/riscv/c/d45243f8c239
  - [4/6] RISC-V: selftests: Statically link hwprobe test
    https://git.kernel.org/riscv/c/0ca410a80172
  - [5/6] RISC-V: selftests: Convert hwprobe test to kselftest API
    https://git.kernel.org/riscv/c/d79a646354a9
  - [6/6] RISC-V: selftests: Add CBO tests
    https://git.kernel.org/riscv/c/026645838c86

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
