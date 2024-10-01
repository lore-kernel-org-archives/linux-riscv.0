Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CDFCE7D13
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 11:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yA58jsR+lu3/s913SbrZmHCk8CWWO/I3XByFq5bTefM=; b=eGBS5KIfhq5LFf
	kvCQ2JQ9Mk8lb+d3GEz5S+FuTyCtwUIagmPwsGxx60fL8TRETGIJrzApd/gYfFArrUZ6LeFfeWs9J
	E1B+EPP+f/CnT1+sOhn9gP2i8iuLItODLJxBs+BbwmXVu9wwtTpKHgmaHn6aoLwi/ff+RGjDsNpXD
	bj6DyiKRIOjwyR/7rQU5OiuLyN05me6RDkWW0wHH57XBg/qF00EjH7rRlr2FgK+YdHBG/acy5NPTU
	de+8njpcG3vtOQ/HukQmqkJhxazNgyiyqFe0e6XRszoEAGNXte4KQnb54Ft5UE+RpSOMGjFnEBPCB
	L56AJ+mGxm56hQLvvZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbPh-00000002agG-3ttS;
	Tue, 01 Oct 2024 11:51:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svbA0-00000002XNX-2LiK
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 11:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F361E5C537C
	for <linux-riscv@lists.infradead.org>; Tue,  1 Oct 2024 11:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ACCC4CED3;
	Tue,  1 Oct 2024 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782519;
	bh=0ZFiVCrmS9naVpaACl4Ktl8cNQxxn0tRk7utNPinZeQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tvBeCh6QSYdEebeQSSxalYM9wCp8HDT19xOKQvlYfuJqBy7s6mobTBDNiwPIkBfMZ
	 qmw1N32peSDTgQNpjgtik5LJUf5fec485ugWknbHwtZPq6/eKKaw345dEwPA+eVdEv
	 8/IOmN7sFegmkCK4Hv6CfuscBQC8qAeM0YboObrtB+nNOfeqQRrmMPJHWrFpro1M6v
	 mTXaXOp2kTKUhIhDJtxJPuv5zEtwpz9ZUmD/buj/vLY8qZpmU/vfuAecUhw7RnBnlh
	 TL0CuQyF8EAQfQKSuYf6XE1uSljHCZOJ9qfAVQifWKqd1Ao4KgIomd8ofJ3AVftiiR
	 VDtK6eS2RBXsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DEB380DBF7;
	Tue,  1 Oct 2024 11:35:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V soc driver fixes for v6.11-rc6
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172778252275.314421.12651797029685769171.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:22 +0000
References: <20240828-fidelity-almighty-18d5434aaef0@spud>
In-Reply-To: <20240828-fidelity-almighty-18d5434aaef0@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043520_662704_0B4206E9 
X-CRM114-Status: UNSURE (   7.61  )
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

This pull request was applied to riscv/linux.git (fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Aug 2024 16:26:40 +0100 you wrote:
> Hey Arnd,
> 
> Please pull a single fix for 6.11, as things have been rather quiet on
> this front over the summer.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc driver fixes for v6.11-rc6
    https://git.kernel.org/riscv/c/3536c01d6577

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
