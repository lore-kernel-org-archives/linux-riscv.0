Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD747CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 22:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVUUn2s82nNidFXPW94vLtWtlavMA/BdQH8MAhsTSuo=; b=mlqctQny/RMyL5
	4mphvKfVxTLvLMWfcGIA1E8C5wPbIkB51lkt1Y0Rrbp4lvnbLeD7oNg8TFSGjbvZNZ89pQ/f+OnXG
	KQvNxc/2m+mrph8aeCnHKQ2vPaMOwKqg/RjvQBoSJFQtESm++9UGqK1EEvSpfKoZddg6a5WcY1t/J
	VF8agCrKs8t402psgRSUK6hOOEgLRan+6G1DE2zkVodWk20q5jc5u2dAo4etiMRyUvjMjUJ7/ZFq3
	Clp1P6RFtWppe9GFTuQ2MDcb158SbTKT41mKLHUwLrRfcOSlzZzV20U1o0FkxptxYWe/WQSCfnfAF
	mazvhhMYrQauISZaA+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsVRq-00000004Qmk-3vYB;
	Thu, 04 Apr 2024 22:20:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsVRh-00000004QjO-3dzM
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 22:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90DC3616DD;
	Thu,  4 Apr 2024 22:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30B19C433F1;
	Thu,  4 Apr 2024 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712269232;
	bh=ITc7lhybI9dOMuknPIwOvjsPCGJG6azRtbKJsWOMuF4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KzoNgv3qqEMfvifn/aFpHeHtWDLxRInKP4Ys41Y6MVtbc0sBdvxABkFmXEzqoRTRG
	 emDga91/39sQhaRcQE0MiXo9hHm9PtrSX2lB80hc2n+PIbQ5MCTXN8oADLAp+KbHWf
	 cQELvjswRZyHsC6wlilCc6uwxqgrrj7PXCu63MdSLpa70Rx+CqHIUkiDes2IM+x9e3
	 sxHFXwpJe5vzD5ChjCv7vLZG0QRVKbEp0qihT7l6hSOaUxWdtwbA4hChN0708A6XuN
	 X3ZZtVyBlRXCAK6qKyswktdyW1D7vmldhyknWN9+yFaRy5saoPGun4LTw09G4YAr2a
	 zXMNwREznDJHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 17970D84BAE;
	Thu,  4 Apr 2024 22:20:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] ftrace fixes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171226923209.6067.4357956363525619450.git-patchwork-notify@kernel.org>
Date: Thu, 04 Apr 2024 22:20:32 +0000
References: <20240326203017.310422-1-alexghiti@rivosinc.com>
In-Reply-To: <20240326203017.310422-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jszhang@kernel.org,
 bjorn@kernel.org, pulehui@huawei.com, daniel@iogearbox.net,
 puranjay12@gmail.com, zong.li@sifive.com, mhiramat@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_152033_999331_26162B0C 
X-CRM114-Status: UNSURE (   6.75  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 26 Mar 2024 21:30:15 +0100 you wrote:
> Both were reported recently as there are efforts ongoing to
> reimplement ftrace on riscv and both are independent of this rework,
> so here they are.
> 
> Alexandre Ghiti (2):
>   riscv: Fix warning by declaring arch_cpu_idle() as noinstr
>   riscv: Disable preemption when using patch_map()
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: Fix warning by declaring arch_cpu_idle() as noinstr
    https://git.kernel.org/riscv/c/8a48ea87ce89
  - [2/2] riscv: Disable preemption when using patch_map()
    https://git.kernel.org/riscv/c/a370c2419e46

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
