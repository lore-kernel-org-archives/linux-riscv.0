Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB31EC7EE37
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJ8IIz42zqhdKjZ41OQU1/q2FiA2TyKOEVxHmFZ0eCY=; b=BfDTXedKkNfRj/
	Rjat04+Xt+Hi7IrMTA835bZLaGeR6n+5F4fVHGFMpO9NssMB3Da6GoHpt5IlfYuRcnXF6ZpBhaA3w
	R38aejCOR4A+xOFOUwaFdxuDVgo8k2Ms1Nl6dF3zhbL4fijgzxJw93IXsGUItvfkIpsAJm0XgPY5d
	2gpO65SBX6AAJ7Vwbpd/v+FDS0B84pvaQ3z4jhrB4g5osPkJwc43XMu5VxhPhfk9jKbC5b8wFxZNm
	2CaTzA6+dd0oIkz5l+eT78TXGIAedkC/fDk1E2paXCOpscZ9K2XweKtx9NPEIunvGiNyuwQYrxuIM
	YHKsuR17Km7wCb4oIR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GLM-009aNy-12;
	Thu, 08 Jun 2023 14:10:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GLI-009aM6-3A
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 14:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26AC560B10;
	Thu,  8 Jun 2023 14:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CB23C433D2;
	Thu,  8 Jun 2023 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686233421;
	bh=UuSTUIAPSAYL95ZEDOcNCVrYvfTlSpIeyLDoZK+9CwU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eFxcodm+bFSXdjMlZECpgQdrrROS64IKqOvbbI1BIs9QbUHnRMtCiJDH++uLwPg4u
	 ai8zUkDXOVlgzA0tRTM5z5CrBgUZGLUDU+sg5VR4jRp4DFOLpSDzCK3eBjUJqW5T+d
	 S3zfvku1uHTio6baDhkK1N9KEWp2z8m96E06dhq9rxi3FlXSIY8CKLa6yuARkpYkkR
	 HsXH1i/DU+Li+F5HsLjggFomuu+OxNjafQZMBEmVokHNgnM/wvB4osDBDu/08l2M9d
	 ckjLCkTnf/P3ju5VOuxSOybBiHVOWm1qUG2TgThI3rZx0v+AkiI57WXTdLUyIAGYIE
	 fgDo7FQmCiJLg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5AACFE451B4;
	Thu,  8 Jun 2023 14:10:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix kfence now that the linear mapping can be backed
 by PUD/P4D/PGD
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168623342136.30670.5165804559719545344.git-patchwork-notify@kernel.org>
Date: Thu, 08 Jun 2023 14:10:21 +0000
References: <20230606130444.25090-1-alexghiti@rivosinc.com>
In-Reply-To: <20230606130444.25090-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, glider@google.com, elver@google.com,
 dvyukov@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, robh@kernel.org, anup@brainfault.org,
 ajones@ventanamicro.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org,
 syzbot+a74d57bddabbedd75135@syzkaller.appspotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_071025_060676_F9D513E9 
X-CRM114-Status: UNSURE (   9.66  )
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

On Tue,  6 Jun 2023 15:04:44 +0200 you wrote:
> RISC-V Kfence implementation used to rely on the fact the linear mapping
> was backed by at most PMD hugepages, which is not true anymore since
> commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear
> mapping").
> 
> Instead of splitting PUD/P4D/PGD mappings afterwards, directly map the
> kfence pool region using PTE mappings by allocating this region before
> setup_vm_final().
> 
> [...]

Here is the summary with links:
  - riscv: Fix kfence now that the linear mapping can be backed by PUD/P4D/PGD
    https://git.kernel.org/riscv/c/25abe0db9243

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
