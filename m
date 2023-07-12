Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE91EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3LugemDN/VgQm+4BASr6NinoDDKConZaAYfXVnJ1oY=; b=gWo+k2/etw9mVC
	Kvn4OjiIPRp+ECMg/aZilh+CS2/T9ox1p4A9W1wYF6EjDCcIvWU6Es9gi0DeB+9cEysaIqfLljlsI
	lpOYp3JFUfGd/rlLc4W7NuCPWi056FRcmgI7uC8YyYj8DmwcWB4KovBeYHtUV/bvuZc+RhdVbXBPe
	bFb045rNlKk2Shg2oLuiwUvpYSuLIkBJGhJLpU2e0AP4WyEI607j8K+ouTuzXtMUNUEz3h1VPmXB9
	ps1pnfKettLJJItujdikabKU9bF2+wcwgjNreEMiuGF5AQjWxuXSmQhIbjlxLU5s1v2Yuw8FED5aX
	69NfyKU10EU4LbLSvvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaEc-0006ae-37;
	Wed, 12 Jul 2023 13:50:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaEZ-0006Zi-1b
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 13:50:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7ED3E617CE;
	Wed, 12 Jul 2023 13:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2C1BC433C9;
	Wed, 12 Jul 2023 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689169821;
	bh=0wFk1A/aNUUTpjvhGUBpRWPsahwPmj+gEshvobF0bE8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IMl2jc9KaRv0leEA0CFOdFBQ9YH99BxBnfhVcNFs23Fu66Cp2ebzp2XnMnufb29yX
	 3hzEPYEbhZxoox/hFBTmSFYAo5ERYWdB8FNiZkZB9UBKb8nXr2LIUe1FYqfGvN/pW2
	 RJ9JhghgaHWcbB6YO03g/kstgbfp3za9Q863r1nEO5PCuHByLKKie7VHbwiHrWgbCU
	 KY/8fDMqkw1+o3sjdOJjhJ76bB6tb7xojpdZgEqe9gcWTFfhSY1OHc18VzF8UQV36H
	 p6jEBp5BsB3mYtcypgz9mfMgr5VZVAoV+Puqybqe0gadPB4CbEd4kFgls4+sc5n3xA
	 ghuXJzuEGPOhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C66C1C04E32;
	Wed, 12 Jul 2023 13:50:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Documentation: RISC-V: hwprobe: Fix a formatting error
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168916982180.8919.16048088678378231987.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jul 2023 13:50:21 +0000
References: <20230710193329.2742-1-palmer@rivosinc.com>
In-Reply-To: <20230710193329.2742-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 evan@rivosinc.com, heiko@sntech.de, andy.chiu@sifive.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_065023_592166_739CB458 
X-CRM114-Status: GOOD (  11.42  )
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

On Mon, 10 Jul 2023 12:33:30 -0700 you wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> I'm not sure what I was trying to do with the ':'s, but they're just
> rendered to HTML which looks odd.   This makes "fence.i" look like
> "mvendorid" and such, which is seems reasonable to me.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - Documentation: RISC-V: hwprobe: Fix a formatting error
    https://git.kernel.org/riscv/c/d6e724d3ef0b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
