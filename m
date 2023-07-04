Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19572EB64DA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9+ogDwcVpcJuZG0b9w/WTJ0umpciRKpm3LnBu19Xw8=; b=mvVEp5PzNIZML4
	xf7Q8cS3/0KCe0+4uUYMtP8B5PzE/NUH8ljBEsnFAxtQdZGfGPJ7JwZbSmS27RXxk8AmXdvjHE3xX
	aBG0gEsFSEoqSxzphKbCeD2ehI8sRa1FljEhpQ3G+QDGTtOoQTaIxJENGlrT6n+gA13aSyy9oKjL7
	TK/Yx0QL1R5aa5Prx3d77Reobyg8v+TxFQS9iGdDYL5V0wYBNGcdob4qj4SqpeOrkM2zBAtD0xSyq
	K+ozU+3iIAEgQgSy5Rm+K+ExWOZKrL5tHr66UJtga2b4Ek24ch8hIyJM0Zl0ca5/Qfw71CcVNh41Z
	bc/DEOaNHyJg1M8dJTow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhYC-00DabM-1V;
	Tue, 04 Jul 2023 15:02:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhY8-00DaZ4-0t
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 15:02:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 19B546129A;
	Tue,  4 Jul 2023 15:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E851C433C9;
	Tue,  4 Jul 2023 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688482952;
	bh=U0YGlk0+vjcwEzJc+SAebAX/boBY2dH4sqhG2t/t6Rw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OjgfEYxWa3CfpAATvrHZdnjCpuAdvf2NG5ZTAcCAaAzS8gxA8rcZAXuR3seIJVDMf
	 S+zsLILpPR37LEZ+Qy5JCE+qYSUDDHqbv+dKjqowzol5JMyFbQjeH1B5AZ+0ZVXyHS
	 hplliNw8smAb7/7a2LQ4dGGw0LvKmX/soUfRy/yo/h5WnGKUudpKZM30IUfc0PmmrJ
	 5dItMACBDsMMLToj5OpQLabLGAXoc2frOmSyryr3Z0zzPyWC7tiZgGmjG+dCc33Whf
	 2DvyBnAk7YIHCgqgoDCQaW4X8PRxQ4xwQ+SqVIr2kyRmaTyGunNIN1q+q/Q3dTT4EB
	 FHWAEgNw16e9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D773C691F0;
	Tue,  4 Jul 2023 15:02:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] RISC-V: Document that V registers are clobbered on
 syscalls
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168848295237.29521.9084782654449049850.git-patchwork-notify@kernel.org>
Date: Tue, 04 Jul 2023 15:02:32 +0000
References: <20230619190142.26498-1-palmer@rivosinc.com>
In-Reply-To: <20230619190142.26498-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, bjorn@kernel.org, remi@remlab.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_080240_379291_6B2999A9 
X-CRM114-Status: GOOD (  11.56  )
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

On Mon, 19 Jun 2023 12:01:43 -0700 you wrote:
> This is included in the ISA manual, but it's pretty common for bits of
> the ISA manual that are actually ABI to change.  So let's document it
> explicitly.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  Documentation/riscv/vector.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> [...]

Here is the summary with links:
  - [v3] RISC-V: Document that V registers are clobbered on syscalls
    https://git.kernel.org/riscv/c/bcc8790057c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
