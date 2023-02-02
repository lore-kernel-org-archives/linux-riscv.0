Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB13AC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 17:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGDYjRFHo4G3ZP/wz88VQj83QAf4l9q2b4XPlizFLTk=; b=prW0AxwVpcS9Q6
	atN/s1zY4TDwL053c+jfvno0rhVXan4Lmudm5aHawczn3ZWmbZ3/oXJimr+YsD8ssWQFlBLdSldZB
	fQpigKS2ssv5BrYnIJ1/qPK2mJ0K1yvMz23PmZ7nHcATLcNj+IALtx2pmI1cz8nicFT7Cqi7PDzCk
	oT14EoV5zTjkUF+/Bv656XxbUMoCRA6LZpW5w6nPlSbEXovZINFjRm2VdUf+wgNuPqQBhqfREi9+a
	dFRTpXX0JgONoqDDIshrpMzaxZf13z67jJApr3+x5XsgixBK+rGAsu5MbqOzcgrbqaS4A3I+CHjw8
	DozTZ4rWObvXuyJYvINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNdPm-00GnO5-LM; Thu, 02 Feb 2023 17:30:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNdPj-00GnLT-IU
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 17:30:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C4AC0B82748;
	Thu,  2 Feb 2023 17:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BB70C4339C;
	Thu,  2 Feb 2023 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675359017;
	bh=LriLzzcrjvf2aq9MHuzmDWOO4COF/M+nniJBrNFPJiU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CnRcPgvyJWF1VvbsBLfnIFk6aay8Un57fO/Z+N/h2Se0ciBQbNcWtVMoZkRmbZGXT
	 edYhJ4qszoAaJatmOU3Zl0NBJGgkQ71PIo7vH3JwJof/9m3ckasayATA9wOaB6ZvDY
	 iPJByZ7fYw+D3pN6RNw4yxKoPAulNkEmIvdt8y56Dk/BkBAnWLsHDyNmaq1MoU+c2G
	 MMYzQOr1rhkYOehZekSCmtF5osZ0BbVG4SM8TOYueywf2p5xPcHRxd2XCO8RhKuFNQ
	 Di26NBNBitvR6REAIot0W1bte9XEcuEGgq1ewdCPWNvTeRKnnizTsSOZoswd6mKJFr
	 4gQRKoxVNdwNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5473EC0C40E;
	Thu,  2 Feb 2023 17:30:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: disable generation of unwind tables
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167535901734.19827.9982979775688143971.git-patchwork-notify@kernel.org>
Date: Thu, 02 Feb 2023 17:30:17 +0000
References: <mvmzg9xybqu.fsf@suse.de>
In-Reply-To: <mvmzg9xybqu.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_093023_785035_0121A833 
X-CRM114-Status: UNSURE (   9.91  )
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

On Wed, 01 Feb 2023 10:29:45 +0100 you wrote:
> GCC 13 will enable -fasynchronous-unwind-tables by default on riscv.  In
> the kernel, we don't have any use for unwind tables yet, so disable them.
> More importantly, the .eh_frame section brings relocations
> (R_RISC_32_PCREL, R_RISCV_SET{6,8,16}, R_RISCV_SUB{6,8,16}) into modules
> that we are not prepared to handle.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> 
> [...]

Here is the summary with links:
  - riscv: disable generation of unwind tables
    https://git.kernel.org/riscv/c/2f394c0e7d11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
