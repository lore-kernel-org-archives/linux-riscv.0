Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537F7C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7E7zNB3K0qnEvnB7b78fjYkhritwXX4AUMwHTaHrwcQ=; b=ZjeULSBb6xCdw+
	9wsflihjJGxxUjuxjzlII+blxYlbipJUjhWJLFKLIosxtz7KBEEpRAl3P3T/emZjo2srSIEd47bkY
	ouhU46XFPyaGGAP1Oy7CmqQg+u1iGEbjzi7f7O6xDFTA9SUtTfa41bMxvpmne00qJCuKFR+MTm8jj
	aJTNvViW4ZKPKE5tfHXBkYWNttwghJzXrrbjcXYSDn4zOUrS08iKR84zKzLUCrn0JkL73gGcy2K4j
	d5mnW+nKXXugF6eHtvxd0nL5nrcZhQd9+zhPMVXMPh1ET4j09vI0plKdaJOOSHiTmU1pZcwXHepST
	USRI2CifvcqQnhL1mgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbG-008OEX-2M;
	Sat, 20 Jan 2024 21:09:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbC-008O9R-1j
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4ECDECE118B;
	Sat, 20 Jan 2024 21:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B6CCC433F1;
	Sat, 20 Jan 2024 21:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784987;
	bh=bNkiilsgov/ziqTxm0fKOOWZnPue85pExT1FEtv2t1w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aOPKD02LaWcihHz6A2D2EmoHJGpZG+DenkDQxfZo9Vp/DXj/b+9K131PT5VChef1Z
	 DRwsBO1507eN5pMwbW0oNXW6iwMhBcYh0FZ4ZHe/tBH4roGPDhfsSELwxiwaKZvYbl
	 ITpvJ67ovyUnDjtvcOpmRsf3DAS5dvX/zrWjrr3HlY00cxT2VpgBKar0eMSTBaP8dY
	 /1/PJtdv35ZGAjnQ5oTbz0WKdPlDWoQxxBqQoVQlvoJ3gZhopGMO+5pch5Zrybi/aO
	 UBBvkq27YpD3FCA4MUMjost+pI9Ig19rAMRjRcRnV5j1oDtNvmMT3CSdySFzJ1AyXk
	 Jkv0LqpS4LVkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 74393D8C978;
	Sat, 20 Jan 2024 21:09:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: Implement archrandom when Zkr is available
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578498747.24348.16243159445263810097.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:47 +0000
References: <20231130111704.1319081-1-cleger@rivosinc.com>
In-Reply-To: <20231130111704.1319081-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 sameo@rivosinc.com, ben.dooks@codethink.co.uk, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130954_765875_1DB0995F 
X-CRM114-Status: UNSURE (   8.38  )
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

On Thu, 30 Nov 2023 12:17:02 +0100 you wrote:
> From: Samuel Ortiz <sameo@rivosinc.com>
> 
> The Zkr extension is ratified and provides 16 bits of entropy seed when
> reading the SEED CSR.
> 
> We can implement arch_get_random_seed_longs() by doing multiple csrrw to
> that CSR and filling an unsigned long with valid entropy bits.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: Implement archrandom when Zkr is available
    https://git.kernel.org/riscv/c/102434010592

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
