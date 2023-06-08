Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A13C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4e+l8e/EzcYCDovE0/lxsH7taTsH32I9OBnZEkqaSAA=; b=Y+oS0qRpvYPGhl
	rCtqn1Dy0qlB49CJePDS4IzEFvY5dXF2WatIjv4/6CKNnZUjKjkgXY+wYFqmWFdHH+xXk/v7A0X7t
	XIiv3kyz7bnMn4Fa0RDUd0EgBHPB37RyHbsN+G7G5+4Dz2EsKwaiTiHKeohM8BdqYzuN6VXu86N1D
	JT3RATol41ov8lr8rijBnheOTQPDQ9ZB3xi25+oREIQKU3u+RZVWgZa6HvwnvfW1CkRV+WP0i2fC3
	FPWfQhVFlLMdlUEfcK3Jah+ofoOprIIzv8vYQPr9xlS9aJ+yfhyTn+X+rJELusl6R/0G7bWmLPhb3
	m8U/pqB8siAG41X5MJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GLM-009aOE-2l;
	Thu, 08 Jun 2023 14:10:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GLI-009aM8-36
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 14:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35CF064E03;
	Thu,  8 Jun 2023 14:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 910F0C4339E;
	Thu,  8 Jun 2023 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686233421;
	bh=M2hdkj/aqger+2hxUCmWq7hrnZFgudHDHrlIG8mCorA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SHK5/HCPiCK7LLA9ghCjDWIWcqFKwE+hFRmZqnRFs7eSPR+j2fjG6N619VtOqonyz
	 i2XOUZjlQ31LKy//mmJQEbmK9m2lgFam1mCxeep5bf450SHKizPYblnR4hcVp2fqRd
	 Zz/y+o/5FmxlXKp+rwEqvNhOHEiSX1ilMBRDeziJTR0tTD+1pryHV4iFgNCELv0egl
	 ZmyGGUIcNB28cVBoGDij2FThim8FBA38wrPOckAmgGN64PRyswO3DDnb27K9frdNPO
	 ZGpL5n8HY4o91Ky9LP5BhvIkVaUmk6tHQ04YDO5T+pundJabJqMoNLJCb+5PgSdMry
	 XF+weIEX8dyBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 739DFE4D031;
	Thu,  8 Jun 2023 14:10:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Check the virtual alignment before choosing a
 map size
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168623342146.30670.13170012353498536520.git-patchwork-notify@kernel.org>
Date: Thu, 08 Jun 2023 14:10:21 +0000
References: <20230607125851.63370-1-alexghiti@rivosinc.com>
In-Reply-To: <20230607125851.63370-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
 robh@kernel.org, anup@brainfault.org, linux-kernel@vger.kernel.org,
 songshuaishuai@tinylab.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_071025_060341_8D5C93C1 
X-CRM114-Status: GOOD (  11.16  )
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

On Wed,  7 Jun 2023 14:58:51 +0200 you wrote:
> We used to only check the alignment of the physical address to decide
> which mapping would fit for a certain region of the linear mapping, but
> it is not enough since the virtual address must also be aligned, so check
> that too.
> 
> Fixes: 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
> Reported-by: Song Shuai <songshuaishuai@tinylab.org>
> Link: https://lore.kernel.org/linux-riscv/tencent_7C3B580B47C1B17C16488EC1@qq.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Check the virtual alignment before choosing a map size
    https://git.kernel.org/riscv/c/49a0a3731596

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
