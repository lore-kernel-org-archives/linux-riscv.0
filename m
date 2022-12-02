Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A0AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00PlUjp0JXtJNWwqVTBt7Hho5yp0f3Mitb1T8/CBZLY=; b=MIVyfs6ezaz5ki
	XkHUudIx4JwVKI9FBy0SrExKxGoSiGT6i3Nu/kGGvDMeYqaqyAA5f5eg8yBC944frBJwilJsqnQF5
	sbgj9yXsff+s+6LG8FtYwWcpCk48U7KS/UzGbl3WwzD5Dq467bdPXbUD6VKmcBOFmvUjwVvLWOQgC
	AohSshZH+8R7N5iMmtG8r0GG/u8tf0o3PoMXg1R18luKD67x2b5ktLlxvXpSElImebpOyzG72XAMV
	Z9sjpkGm0U2t8hKoCBI8yGyIh/JvLduBkdsf6Jt5bDlltJdDxGuaygnxPbquGyKGKEJtK5I7WgFsk
	xtxQKlXMUBeIRjjcv9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1DXX-001MGC-36; Fri, 02 Dec 2022 21:25:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1DXU-001MFO-1h
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 21:25:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5998DB822B9;
	Fri,  2 Dec 2022 21:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04DE9C433B5;
	Fri,  2 Dec 2022 21:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670016340;
	bh=ZSNmLjAEQTy4eBPjv6LPuyzN7BpFgsze+bz+aijm7bU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oC6oulAVFXlo1KgpkTuEdT1+fVqew0hfcsRBuD11uLPEgGslFSqLa1Lcvspf6KShu
	 E/yaqnJD2OPc5alOucAYpYSS+HAh1ZFKG7DBoe0l8X0lNZdaar6uaUwIXGWYxDxg0R
	 2WfmLW17eyDtca/Brnys7riUu4kNLf/SUPDk+LCmC7ZutwGPDu98fMJfVEqAgJzkhH
	 HwUU+Y7t8Bgop284Rh9ySPm0yvf3aIpPCba1YOAVJZG92S4efKtXeFLLeUav6xhKiW
	 vADjcBN5gDN3Q4c5q+6CdnviNoUak6wUclzP4DTsf4MToJwYFd73l4rQTBBMeOgKsM
	 6hQ7BLpcPZsRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D74B4E21EEF;
	Fri,  2 Dec 2022 21:25:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next 0/2]riscv/mm: two modifications on hugepage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167001633987.19139.13919979874169762631.git-patchwork-notify@kernel.org>
Date: Fri, 02 Dec 2022 21:25:39 +0000
References: <20221024094725.3054311-1-tongtiangen@huawei.com>
In-Reply-To: <20221024094725.3054311-1-tongtiangen@huawei.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 wangkefeng.wang@huawei.com, guohanjun@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_132544_275478_D3B10C45 
X-CRM114-Status: UNSURE (   7.45  )
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

On Mon, 24 Oct 2022 09:47:23 +0000 you wrote:
> Tong Tiangen (2):
>   riscv/mm: hugepage's PG_dcache_clean flag is only set in head page
>   riscv/mm: add arch hook arch_clear_hugepage_flags
> 
>  arch/riscv/include/asm/cacheflush.h | 7 +++++++
>  arch/riscv/include/asm/hugetlb.h    | 6 ++++++
>  arch/riscv/mm/cacheflush.c          | 7 +++++++
>  3 files changed, 20 insertions(+)

Here is the summary with links:
  - [-next,1/2] riscv/mm: hugepage's PG_dcache_clean flag is only set in head page
    https://git.kernel.org/riscv/c/d33deda095d3
  - [-next,2/2] riscv/mm: add arch hook arch_clear_hugepage_flags
    https://git.kernel.org/riscv/c/d8bf77a1dc30

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
