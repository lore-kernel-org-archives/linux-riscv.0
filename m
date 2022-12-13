Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C43C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 06:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KSUdsMVw/lQc7zpPj2U+H4gNEIAafCFPopPribCceE=; b=OIJdIJ9J0gF4/R
	O8xQchB851TFFdolOQ/4u6y3Qbav8HiJSUavAzVD/vwUBqp3ke9QJPgmRyDHco0dvuMuLPk8bIt3X
	ypnKmB3hOBpw1fU+podBWPMJlN2gOgCT4N14rnpmKhZjVlUjJYLS/YAigMsUbMPhWWVnawPUZT9WI
	e94loJJe/nc0yz7u1GmJvcuPWxRX0CDKdhnwAYvkBTihfiMyH3pgQ3VYqa/gKBCb8vRJAYGlP/YVs
	tQLKQ0QRUXIyvG9MP9oebSfMF/7tJrBDVIyDwqwWxbVVlmWIzBCyyxrRlVHPsU16cvQ83YlU/3L66
	boKj4n1Bqune1ARJSDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4yeN-00BKxa-4i; Tue, 13 Dec 2022 06:20:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4yeK-00BKpi-Bi
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 06:20:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 092EE6130C;
	Tue, 13 Dec 2022 06:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31FA7C433F0;
	Tue, 13 Dec 2022 06:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670912418;
	bh=lXO8/1CnS/fPdHOgjcDQhLRQhUXmhy2+rqnlrKJDH8s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DyqzVKfskC3sGktrinycjG3OGMb0LUcoGXB2/cNUCD4nUNO7G7Q9gcupYF4d23uGa
	 QzMSUthLyQGnmvHQmpvbV8YJTiRT1CJiiTu1IWnpbGApejoL7jnAxrCzK5cvlQ7QkR
	 mvN8bwitXb64Z8H+VZKnAhBsI/ul3W8+HfNvx6yu8tbRfJdX4S267+axJkR22qVD+s
	 sxr7O7o3RVkVnlT+T2Dkcz1DSfI2tXE9jgVg8RdMiZMMXeKrMvCUBJHSR7d7Pfm/mE
	 32C6/tV1kFdD9sLAuM0JahCo5mPrye+WPRxvYvV2sNBOjaA2c9H7BpO1afmZubmuyw
	 pO6U3lTupfBqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 15B13C00445;
	Tue, 13 Dec 2022 06:20:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] RISC-V: Align the shadow stack
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167091241808.24276.8153329766826159166.git-patchwork-notify@kernel.org>
Date: Tue, 13 Dec 2022 06:20:18 +0000
References: <20221130023515.20217-1-palmer@rivosinc.com>
In-Reply-To: <20221130023515.20217-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, jszhang@kernel.org, guoren@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_222020_476662_2D35326D 
X-CRM114-Status: UNSURE (   9.82  )
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

On Tue, 29 Nov 2022 18:35:14 -0800 you wrote:
> The standard RISC-V ABIs all require 16-byte stack alignment.  We're
> only calling that one function on the shadow stack so I doubt it'd
> result in a real issue, but might as well keep this lined up.
> 
> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [1/2] RISC-V: Align the shadow stack
    https://git.kernel.org/riscv/c/b003b3b77d65
  - [2/2] RISC-V: Add some comments about the shadow and overflow stacks
    https://git.kernel.org/riscv/c/de57ecc47610

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
