Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D791DC0015E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zyHJZ8xNbMCgtaDac4MyekQJKIFImuR2ZyoQFP2AVc=; b=ZsjXWilAvF5RC+
	pZEFGyR0t6KVC+YYLavsaDtnEd68bydX1Ox+tx6z0CVnVPof+smf9K0qYszEogkU7kGoubPVszYa0
	DOjauznkOtJGziIvurI9YgciWsdjo5yYivla1c14bSiAbZvpZ5VSIZdZ2XhUp6YDtld6VpPOBTWvf
	Gz0iS6KsawlwnAp81wIzlDajbXma+SkNoo55GmLhn6Pa/ssO0ucya74Xj71MdC6L1bI5Zvt8vb3Vm
	R4/Iu3h9VmaWlCfup33yVEi7cO3nsxrxlIT0CLvhGujKZp39ZXvEU6+LTh6XQPhKdvvzf3i9t24+h
	BnBZKS2tuUIw4lGEfVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ1x-008uJo-2J;
	Sun, 25 Jun 2023 23:20:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ1t-008uH3-2C
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 23:20:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E196F60C5C;
	Sun, 25 Jun 2023 23:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D49F7C433CC;
	Sun, 25 Jun 2023 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687735223;
	bh=gagWmDDmJDWh5KRnFaIWUefc8TSh7VfmTp4h0BJ3A3U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BsqL/Cr2+wxAhY2pBMHaTW9gn1+N0Zxr7bERHmmV53dwdavZiipk26DK4BfGZfIXr
	 cDarj/r0hkn8qzbxsxzv6N5jp7rZwAaVcL/cd/OYkBAydLmVP79EpU+qXwiiKY2yFE
	 Lp16tS7WheKIeE0lqOg47Rf2FWQKQOuVWIwTqH2xxE+sNFxfV4UlJ0qjRFJf0e6U3I
	 GBZk9a5O0KoWG3PA6I0fnRLdC2uMAeTtwz2ZrDRH5R3YtKrD6wmCyYESL+Z+CaKtPZ
	 rqeko1UBt4EAb7F4epr7nakTJCZ0Nn9BMhVR40EUFqDXs+5BNdPJb6C9Y8YsQyh15y
	 fVDdifylmyKyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B3DE1C691EE;
	Sun, 25 Jun 2023 23:20:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] dt-bindings: riscv: cpus: switch to
 unevaluatedProperties: false
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168773522373.24181.11034691970216052141.git-patchwork-notify@kernel.org>
Date: Sun, 25 Jun 2023 23:20:23 +0000
References: <20230615-creamer-emu-ade0fa0bdb68@spud>
In-Reply-To: <20230615-creamer-emu-ade0fa0bdb68@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_162025_777606_D8936511 
X-CRM114-Status: UNSURE (   9.59  )
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

On Thu, 15 Jun 2023 23:50:13 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Do the various bits needed to drop the additionalProperties: true that
> we currently have in riscv/cpu.yaml, to permit actually enforcing what
> people put in cpus nodes.
> 
> Changes in v2:
> - drop patches 2 -> 5, they're now standard in dt-schema
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: riscv: cpus: add a ref the common cpu schema
    https://git.kernel.org/riscv/c/3c1b4758a954
  - [v2,2/2] dt-bindings: riscv: cpus: switch to unevaluatedProperties: false
    https://git.kernel.org/riscv/c/1ffe6ddc5c64

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
