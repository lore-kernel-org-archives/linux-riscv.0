Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4E1C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SCXq49Pb/WNUNwRJYkdHu6yyNoSbRzWIeD2UBSzqg0=; b=5B16e8wBH/pi5d
	66RG3qkQmkA/J+UlUSyY1+vQMXMt3Y9D5zUrmRHiq5j1fCKsj6d+svil1oK5yGPLJxsqA+7UKRCQT
	nP0qsrYeu8iXek39AouJ0UV5m2/1OlLVcLKjUeTXCRvCwwTTTpLu6Quqpb6KmeRi1RkyDl/AR0aOJ
	hMUk/9GDqA3v+I2f5ZPdvN2xkUD5r5IwXo+iuA+f0loc3pNQv7csMz2VxrXa1DP8NlLxcQMIVvTUT
	iqIIa/Rzr+cDxxgdmpxgW4iZs/00Q3+suWVhDayTm1fySIWpE04FgHBSA9/R5psgtG02gy5uuNjWJ
	8BQJeq+Ql1gBuU/RizvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pH-005fvx-2K;
	Wed, 19 Apr 2023 14:30:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pD-005ftL-2l
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:30:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 755D063846;
	Wed, 19 Apr 2023 14:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CF4FC433A1;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914622;
	bh=/WREqY3wIE/Cwcop8rOx7h8eVLYcI+oeYzjU0KDvjMY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kfyEyDqGSGWDILwqsq2ctLK3EZM2bZ4vZFeMgVRkuLOP6MPZW4UEnnomPqxGgzizX
	 WEPGPPdfxhQr43w4QFfI1aditmhq0pJM2KBo9QA3hFKu+MKh+4nz1JKOEQSfv3RQbV
	 7X8tAgKs/CaCVhNVJS5ol3beEGqPZ/wVy9CF1fGZlIEv6pbrWEUOKnUEcBO52+lTFB
	 oYdinORWPGtUVeKhUhs9hTtulZ+qgc6qI3UGFV82j/ZTXFremSHNYvhv8ERlMEtFp3
	 fE4VakNx61y24mXN7s9vheifazf39brUGSlgXwuGC7jLz0tSZnMyNtxOQ1pq1HdEa3
	 2iBBFfPL2oDfw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53D20E270E5;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/3] riscv: Use PUD/P4D/PGD pages for the linear mapping
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168191462233.22791.1513309055394935140.git-patchwork-notify@kernel.org>
Date: Wed, 19 Apr 2023 14:30:22 +0000
References: <20230324155421.271544-1-alexghiti@rivosinc.com>
In-Reply-To: <20230324155421.271544-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, robh+dt@kernel.org,
 frowand.list@gmail.com, ajones@ventanamicro.com, anup@brainfault.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_073023_931944_9A4ADE2E 
X-CRM114-Status: GOOD (  13.38  )
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

On Fri, 24 Mar 2023 16:54:18 +0100 you wrote:
> This patchset intends to improve tlb utilization by using hugepages for
> the linear mapping.
> 
> As reported by Anup in v6, when STRICT_KERNEL_RWX is enabled, we must
> take care of isolating the kernel text and rodata so that they are not
> mapped with a PUD mapping which would then assign wrong permissions to
> the whole region: it is achieved the same way as arm64 by using the
> memblock nomap API which isolates those regions and re-merge them afterwards
> thus avoiding any issue with the system resources tree creation.
> 
> [...]

Here is the summary with links:
  - [v9,1/3] riscv: Get rid of riscv_pfn_base variable
    https://git.kernel.org/riscv/c/a7407a1318a9
  - [v9,2/3] riscv: Move the linear mapping creation in its own function
    https://git.kernel.org/riscv/c/8589e346bbb6
  - [v9,3/3] riscv: Use PUD/P4D/PGD pages for the linear mapping
    https://git.kernel.org/riscv/c/3335068f8721

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
