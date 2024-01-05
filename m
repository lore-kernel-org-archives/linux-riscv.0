Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61891C3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 21:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkZaXV6J3rOBHOwEC7GJthMA3ouR8CrAAZkRS5svgeM=; b=0sl6pQa6aEujXD
	AIGK3TahnRnKJuUBwrlzIZcHntFt6nHRXFzZ8OBHEtNPoFrjfXas3tvpXNH1whrID4InaFxiMUZ6l
	Gp9mh1wE1EPO6bqXsmcLVsvxDzyXjdqvc0rNrvPvmm+WgwA41KzHczNnJk3KmDVbzGpBkroPZBcxb
	EIQGGT30FYOSlVsDvJtxl828p4p8rDyNmOGBXMIf2J7ptPkM1Zo5fgquNziGw88SFlatbknjL64e/
	7GX5ZQXdAqn7YQ/+9QA+y8kbJUy9qUMUQVvN10fcjzaHc6GssLUuev2dvkhlt5xxWHumkVvfjEllS
	55gvIRw3MqfAxRUGsflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5I-000IvU-2E;
	Fri, 05 Jan 2024 21:50:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5F-000Itg-1K
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 21:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 213CC615E6;
	Fri,  5 Jan 2024 21:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCB4CC433C8;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704491427;
	bh=p/B1O0r+YQ/Z4tDjcQ/pjutR7YcnXY2qajqhdidShBI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e2xcmSPrev3wbMlmCgsV3kdDTWpxEqMrIO/B+OngbVUz91q8n0SYkhBgCPLgnMh7D
	 9G0i2CavIniixCUbEm/p4C8ZSL37FId9ZHgCQ4RB/vUMtaz6ojMI+adUWOEZaIhvvt
	 LkLkWNYfp6JjLcYwlIyuiKIljAz9NI+oVI3eVXt8vlhxZGypWOI/hqXFWAxacMtXKG
	 XZV9NZduRUEc30V8N7dPJVCxvgTGA3BdTQSbtzzJ3iL9aT+EDaCA3k8Kj6U8GzqtBF
	 E52lTD/07jg0dQpySQQkuJdPXW3OeQH9+Jq0Uq4BLYb8jsiTNklRmhsP3oLAp59v1E
	 BXDO+4K1iq47Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A701BDCB6F7;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Remove obsolete rv32_defconfig file
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170449142768.26226.3943147801325806226.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jan 2024 21:50:27 +0000
References: <20231121225320.3430550-1-samuel.holland@sifive.com>
In-Reply-To: <20231121225320.3430550-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, raven@themaw.net, paul.walmsley@sifive.com,
 svenjoac@gmx.de, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_135029_517922_F3788982 
X-CRM114-Status: UNSURE (   7.70  )
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

On Tue, 21 Nov 2023 14:53:18 -0800 you wrote:
> This file is not used since commit 72f045d19f25 ("riscv: Fixup
> difference with defconfig"), where it was replaced by the
> 32-bit.config fragment. Delete the old file to avoid any confusion.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> [...]

Here is the summary with links:
  - riscv: Remove obsolete rv32_defconfig file
    https://git.kernel.org/riscv/c/f4727fe60ff6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
