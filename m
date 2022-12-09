Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC97FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 22:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWLmSdH0Cg5Eki/dvwaesJT01d3GKI/p/pLoJ5MpPIg=; b=bdf8EHBxtgh9Gm
	GKBOhSrIy/THMnLvoBJ44zQraMeMT7nu5470IdU0xWPqMD/uB2h9+MigPSGY/JlwqspBccRUAdDZ3
	USVdgelQnr+zHc6SkosMvR2H4PNLzuicuOmJG3ufRfyNqsMkBxfnBA/i5JwHvuFtcgdYRnzqv1Lmn
	NmY8Vxu1v5JyZ7d7fV592CvutVSRdeLMI22XdMDU0wPrG7Ku7BBex9c7TTpm7fsJX/LDlLG6lr1/c
	BGpI6igXSeYURYC2DP/WssMQung1S2VI1wQ2hXCpEBwuXY/n144EL522idaguWLQDsAX4spOSmGXS
	DoagPbfJgseetL4CBnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3lst-00BsJS-0O; Fri, 09 Dec 2022 22:30:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3lsq-00BsIi-DQ
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 22:30:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C8796B8293B;
	Fri,  9 Dec 2022 22:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87D86C433EF;
	Fri,  9 Dec 2022 22:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670625017;
	bh=2Xh3vCqZ1odxCvK5f9bCXkVfiGq9OG7oTrnj9h9MJEk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WFKSmr0DqkqXPQ5+tX7/mAXoa61kdGa/lY47cUU2Hajc/Rly8hkpOnJQrC5SLd7iH
	 9XbnqdwTOKxCjHQREAzNbjhgMuY4d5QMHXXYckncCIvyZWZFbKYP7jWe1sWuLVOSwJ
	 Swy5evR4dQFfnCKoijEd22YDQD46XF7hgNhzyc7TMYm1/L5Igu+geOjFGgPUgVrp/d
	 H2y6eKaWJNqvi7p82f26Rzjx92Mqe7rYbz3AYQiNxOLkuL8c5oA4NMl4TBrjtcZn/4
	 3ne7Yeq0y14yVH460HFTIO/0By5equX/52q2lb6MQFQqKaPlR8Mq5X11GChVWOg4Tn
	 2QrRvybyVuA3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72AEEC41612;
	Fri,  9 Dec 2022 22:30:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3] RISC-V: Ensure Zicbom has a valid block size
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167062501746.3088.13063280790225807236.git-patchwork-notify@kernel.org>
Date: Fri, 09 Dec 2022 22:30:17 +0000
References: <20221129143447.49714-1-ajones@ventanamicro.com>
In-Reply-To: <20221129143447.49714-1-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 heiko@sntech.de, apatel@ventanamicro.com, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_143020_617390_15E2E211 
X-CRM114-Status: GOOD (  11.68  )
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

On Tue, 29 Nov 2022 15:34:44 +0100 you wrote:
> When a DT puts zicbom in the isa string, but does not provide a block
> size, ALT_CMO_OP() will attempt to do cache operations on address
> zero since the start address will be ANDed with zero. We can't simply
> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> size because the failure will happen before logging works, leaving
> users to scratch their heads as to why the boot hung. Instead, ensure
> Zicbom is disabled and output an error which will hopefully alert
> people that the DT needs to be fixed. While at it, add a check that
> the block size is a power-of-2 too.
> 
> [...]

Here is the summary with links:
  - [v3,1/3] RISC-V: Improve use of isa2hwcap[]
    https://git.kernel.org/riscv/c/78eda777d2f1
  - [v3,2/3] RISC-V: Introduce riscv_isa_extension_check
    https://git.kernel.org/riscv/c/132cfeb2b7fd
  - [v3,3/3] RISC-V: Ensure Zicbom has a valid block size
    https://git.kernel.org/riscv/c/68dc0718407d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
