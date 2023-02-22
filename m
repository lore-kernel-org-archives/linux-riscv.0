Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C60C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcBL0VhCb84En1VJl9aOJjyaVawU4j4LykaIIU6k9SU=; b=Vgh/3BTnDjmn9z
	wei1vBuL+gLnneiboF4YN7Lb1B7RaTxMIPUjKel/h82PjSK80xhLZ6gqHbtIhazj/UxBoLS42cLzM
	w4tkCbKnQXlGopZZXeQTrfHeHLrhQcELDJ5oRLbLAXJuQfAnINlmbIN4BCPquRwlwHpliZbwhX/TP
	IZJmkD5+V+1RHlGHl8Vrihqiy25UcrKEvRp0Lu4wr4EIWpDzTSildrIxiEvUwItjP9mH5iLUmWWVy
	aBmfXZpVdFDzDscZIHaOclNc6dUAt9+Au/8VLv0wZexAQqX/Cd30j651u3CjEYEwSFZ94F6mI2nPr
	3ooP9pI0/AJmUgB2SwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbf-00Cm8l-9s; Wed, 22 Feb 2023 15:00:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbZ-00Cm55-05
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:00:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2C44614AA;
	Wed, 22 Feb 2023 15:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6844EC4331F;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=1eibqrEVyHu9DLfK/UXBBIAovcr/WxnHB/rsWksX1+g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kcfJwyFqxdeHC4R5LTjDXNmal+HVth0hqbbz+djzUU/Pi2yJBJvALDCiCbQhWG7Tm
	 VNF9j6Nuli2a1kV+qkktkV8teVIkEAQwd+gh/RfymM7HXQhKOy0U4VezZ/jkroa7vt
	 xelK2KlnFeHIe1r9CvCmdkDz+elp6kG395GaoL2FzY8i7FZ/lRWQGhsJHKftoZEG2I
	 vGnKDh5PttJSubPfQM1yZHLbDAZ50JVmZo9BDGz3UpSwUuB5IsukWQM7mXqz+Z/r9u
	 gblA6fzhBlxsuR2RGq+OioSt1RM0daB8wqf/TtC8x2vcqZES+rL8p8Gs7jmLy8kdr5
	 OgaPOfmXBQ4Ng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4E491C43151;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: mm: fix regression due to update_mmu_cache change
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802231.24438.5384447032819989101.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230129211818.686557-1-geomatsi@gmail.com>
In-Reply-To: <20230129211818.686557-1-geomatsi@gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 prabhakar.csengg@gmail.com, guoren@kernel.org, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com, heiko@sntech.de,
 sergey.matyukevich@syntacore.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_070025_097834_E7E04CDB 
X-CRM114-Status: GOOD (  10.57  )
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

On Mon, 30 Jan 2023 00:18:18 +0300 you wrote:
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> 
> This is a partial revert of the commit 4bd1d80efb5a ("riscv: mm: notify
> remote harts about mmu cache updates"). Original commit included two
> loosely related changes serving the same purpose of fixing stale TLB
> entries causing user-space application crash:
> - introduce deferred per-ASID TLB flush for CPUs not running the task
> - switch to per-ASID TLB flush on all CPUs running the task in update_mmu_cache
> 
> [...]

Here is the summary with links:
  - riscv: mm: fix regression due to update_mmu_cache change
    https://git.kernel.org/riscv/c/b49f700668ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
