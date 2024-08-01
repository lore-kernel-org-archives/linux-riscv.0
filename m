Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F3CC49EA1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmf5j8ZpC0RZhYq06EiFGQGpCrAIFgsHYCIbdIF/ML8=; b=nOnwr8OZXjnZqY
	ffrDic4y9RCYvTaPbHWTBErQmbO+fMQbm9+T88GeLLMOVZcDGCnAAovwTxoI9bbPQ7CS9v89bS8Zx
	baw3LkYq31BZd3V5qZgzI1GpW7qmKgulMkV6UZD7c+87JeFNJJe5UJjn7PkBNHEz1Ei9r8pdjPwez
	wjcZH0MmffazufJqQxdlkprxXf9DYmDXu37SubaSKXEc0s/HpD1luxGoE7afFn/KFp9RYZcuMWINf
	eYD8XwZ+dvaycOmPpEFZCq6iGjLcLC4vPzBXV2zwITmorNGP8lIun0FOsKzKt+ibK5P4WnwjFXl7K
	F/DW2FaEqAmM/CvmBAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYs6-000000067Zn-0fNo;
	Thu, 01 Aug 2024 16:41:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYr8-000000067FA-0nGP
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Aug 2024 16:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PnFh+Xh1NzXJOMloG9SoXZiP522ZLJ4IkshElmj1gS8=; b=BcjvGpHHCKe2eBhkZfVjMqvIKM
	jZ/CUj8VSNEz/lOYvsod7fe9QjYaPXp46segyP9v9C4+LKtZYj2btQoPlWocOO0GzFZIzu+E+pasu
	WDwNvKArIIaUc0PAu6vYTnZ1fH1+9+7ChEqkb8zue0sNtUgdQRRf7XRAggWfuW6K9foE7+nUDEQTt
	ztSZ8W8qhdV9KN4irnRZuBQ2T5JJdmYpv56p2tiWAlh9E1jygAcEjT8OU8XwAVeKAmtFk2x2VEqvv
	bWIiQtQrveIBTf5BzMRIxU4BID5ZIC9VZdh2x9ctf7DELORTPjh8yRX4uSz0YlUaBh7BcB+IH67J/
	HK7khglg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYr4-00000005WEB-20fK
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 16:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3EC962925;
	Thu,  1 Aug 2024 16:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF67AC4AF16;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722530438;
	bh=UnU0PcJkTz7cc/UhgE+UHGawejA3Ev86arXcn5fJvjs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dw514SYO10HSU4S2KN37Up2qlHI6vk6ytedOFarXOZRly+IMAd9pRz72GDdLwhBWi
	 R+lf88ijiC5aRLJVcmfB85Ji92VAN/tc66Fmzbq+eZGs4ePA5CcNJz7E9v6e57wpfS
	 VQ5v4ZpzB4fRt6c21oqx2OlSBPut8caQd+v+xgkz0VMDoJ94h1tObTmtNTeV7LdI/6
	 gIQumVEs7Zxl2/ZyQ4mZa8Fr3qSYybc4vk+XAGSdOJxmYu1DDeQue4t+2qb3HpcoEa
	 7dAsoONg75R/16HL59dFCOUv8l0y8+JFKXq1RKkeheRjaErEPraODgIW9XSx9JCIep
	 txVSWHb2Tu+ag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CC884C3274E;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] cache: StarFive: Require a 64-bit system
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172253043783.13740.5911748203881194794.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 16:40:37 +0000
References: <20240722154519.25375-2-palmer@rivosinc.com>
In-Reply-To: <20240722154519.25375-2-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
 emil.renner.berthing@canonical.com, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_174042_796959_34B88F8C 
X-CRM114-Status: UNSURE (   9.87  )
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

On Mon, 22 Jul 2024 08:45:20 -0700 you wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This has a bunch of {read,write}q() calls, so it won't work on 32-bit
> systems.  I don't think there's any 32-bit StarFive systems, so for now
> just require 64-bit.
> 
> Fixes: cabff60ca77d ("cache: Add StarFive StarLink cache management")
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [v2] cache: StarFive: Require a 64-bit system
    https://git.kernel.org/riscv/c/57e5c814e915

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
