Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F82DC74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 21:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhYA5LULE8nYWlY7d649OrPtdP1r2gzzCnbe45JHU+I=; b=gXUXtjaqdFURR4
	Ur3X0izGYCCEY9bqxE6w3cBHANO1f/vPPoBOTOap1Dwpm9oHhOGVSOQ7ma4xN/KSVX/8ZZedvlMiN
	3io2LTqNrYAD9B46hxT3UbMbo/xAOnxelVcVPLh6TWSfH6AQlQDbSxLa5D70xid6jLsyXVT0K7r8d
	nZByZgc+8ReSTiAblTJY/vmiPozmLtaUQeJZc2yY0D3x0e/LyRLsaRFHg/YQvDPMbIxUuhWSWfv0W
	IO11n6OhR6qHeLSWYGqiNhfzfTOV0jxSPhIjZnVk1wuQVWC1cmDo5VStuf/9zq2qkLoaha448wlcN
	zToOv4sTRCz/6nMtwwKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfS2q-002yD0-2e;
	Thu, 23 Mar 2023 21:00:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfS2o-002yBz-1j
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 21:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8F3E628CA;
	Thu, 23 Mar 2023 21:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09242C4339B;
	Thu, 23 Mar 2023 21:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679605221;
	bh=qz9uUNeJqZdiJlk66x6Wzj9ssG31ZuZs/3b6NtQinPE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VQDGvG0nMfeA/pF4tJWDj0mxY0iow9oifsGHClP9HZgYgROWBf1LBJ1mkJQvjYMwm
	 sZyDqUoQReYbPP81QT/S5AjcBasEEXxUV43ftrRrMcYsGUQKJ2qphI80iHmc0F1TG1
	 JvCy/2e4rS4FUPpT2QD+f71ixU+K0K5c7JA0ghzuahIMDH0j2qKpOSlTDr3wQH8cdO
	 aliTjnwoIAZ8ZmqexUo4kP4OBq5cIuhgjE2TXjgKZc4rt03mMWAWihQqNTNFAVDf1h
	 fV4wz9gNsJvnfDHtPS8p92eKBvNREv/nNbZ9QzWkqkBM7SlvjzaWkErMZEtcxTnQZ7
	 tQMvaHAFoKb8A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DD26BE61B87;
	Thu, 23 Mar 2023 21:00:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Handle zicsr/zifencei issues between clang and
 binutils
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167960522090.10481.16047974592958596683.git-patchwork-notify@kernel.org>
Date: Thu, 23 Mar 2023 21:00:20 +0000
References: <20230313-riscv-zicsr-zifencei-fiasco-v1-1-dd1b7840a551@kernel.org>
In-Reply-To: <20230313-riscv-zicsr-zifencei-fiasco-v1-1-dd1b7840a551@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 ndesaulniers@google.com, trix@redhat.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_140022_633125_75C8E167 
X-CRM114-Status: UNSURE (   9.99  )
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

On Mon, 13 Mar 2023 16:00:23 -0700 you wrote:
> There are two related issues that appear in certain combinations with
> clang and GNU binutils.
> 
> The first occurs when a version of clang that supports zicsr or zifencei
> via '-march=' [1] (i.e, >= 17.x) is used in combination with a version
> of GNU binutils that do not recognize zicsr and zifencei in the
> '-march=' value (i.e., < 2.36):
> 
> [...]

Here is the summary with links:
  - riscv: Handle zicsr/zifencei issues between clang and binutils
    https://git.kernel.org/riscv/c/e89c2e815e76

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
