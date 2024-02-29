Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD18C54E55
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 22:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ap1HUlFhx2IpNkMBavFHixYmcHZfV1R0FscDMTo6fmk=; b=RLVy0XDAMksIRa
	3poyyucowb0bM4nHdbjP9prkMAhrbbAFYAykeTYUhDzBg+LPRW8JK4Y7MJH4M6oHz2XZHYCjJMD3E
	y6NMKgVlE3kXavDiAZxqTjgzWD262zdhJDo/sGgDRO/XlBEQZIuAK9mg+GK5bybzSbhnLzdONvO/G
	oSK9OueiztRp9+qL4aMCEeUVdsXgB7CiYgJIB2Cys6trkJ8zBSyTDjhyU4YL7YMnkXWc9GsCvpoM8
	uwNeK2FUDTrORfnJGun47PDDCaTWsgJwpL6pqjchnuGliC2oC4Olb3Jxbydz+iRJR1sItK4FefdOu
	mOSMou7HhRWUoXD9WIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfoc1-0000000FQA3-3Aoy;
	Thu, 29 Feb 2024 22:10:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfobu-0000000FQ83-0gQq
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 22:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6FAA3CE1D3E;
	Thu, 29 Feb 2024 22:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7695C43394;
	Thu, 29 Feb 2024 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709244634;
	bh=tUo71G6vN1xdSm/Cxcki/r+K/AKoYBs0PEiPWXD9No8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HhnqoDpIDEeE/DcU6GIaH1NLVMLEgFwkhn7TnLEkSu1kp9dWR7Ql/gZieWyPdrFU5
	 CwPX7xlukzJxD+UAtPDsbITzX0uTrV64wQvJCdi2FOvjIn3EOcevuxs1YlbglhZKCX
	 jg/74d/7lWpe7rKBmp/4ZcS+9RwfPOcpnyGnI5yTYw0sKdI/4eBmN82PUwq08c5oZu
	 RrsOc7l0WPc08dh3wG2ffAe05yBLDt+LcfBIQJbc91/FPPVrd5nc4jqv6oRCmegcdY
	 uD+5+3hruILgkWzJi6SMjJfcYS/ZHyhRVecwbodhXOnvKCaX4XPOYIDE7zB3Aw2wRv
	 WoLqr0ans9yjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C723D990A4;
	Thu, 29 Feb 2024 22:10:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes 1/2] riscv: Fix enabling cbo.zero when running in
 M-mode
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170924463463.14902.9593113600242840892.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 22:10:34 +0000
References: <20240212022642.1968739-1-samuel.holland@sifive.com>
In-Reply-To: <20240212022642.1968739-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, ajones@ventanamicro.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org, stable@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_141038_405469_62156573 
X-CRM114-Status: UNSURE (   8.09  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 11 Feb 2024 18:26:14 -0800 you wrote:
> When the kernel is running in M-mode, the CBZE bit must be set in the
> menvcfg CSR, not in senvcfg.
> 
> Cc: stable@kernel.org
> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - [-fixes,1/2] riscv: Fix enabling cbo.zero when running in M-mode
    https://git.kernel.org/riscv/c/3fb3f7164edc
  - [-fixes,2/2] riscv: Save/restore envcfg CSR during CPU suspend
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
