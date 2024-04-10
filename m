Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF46CD129A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WD68rFlnzI/Zy8KKIZM54ZV9mJWWYkKR5NHbk2alOSY=; b=RiEW49VMSEPxtN
	ORrsT61HnuF2fVXi1GzpoLokt4hQsglRs6WY9Up1btcqnptepGkjSlmWImlfck0N1unEwpJq3znOA
	/HmkqhMXvQErS4r4M2IqOEPKwxHJ/OuZePscPXtrh9R4rMusJCKEVRn827p54LAP97wRMBM8NCQ/a
	gH+p+hnW+Yv0Fa6rXhFayBrluWJOoXnW26JJqr99XuIkhcLXhTRsE81OQoxv9SI/YsZgIX5F9S6ID
	q09G8gwas+LdIk0y0bBxm+sr3tauTkD5bv80PfkrLxHAGdRs21UV5bNt976j5L6aNjSmN8i+Y+H42
	qMiJ9Rf0JzOETI/CY4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYeq-00000007OSg-3vsP;
	Wed, 10 Apr 2024 14:10:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYek-00000007OPB-2pgZ
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22DE961D77;
	Wed, 10 Apr 2024 14:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C4D7C433B2;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758229;
	bh=F9ACgS7cWelDT7epvt7ZecgrWTrrldqZ71X+OkUkYrQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WSrS7PUkZjXDMvMwRg+842OxNUdkNs2MAAgGudcRwuoK/PVyYdhINSIHmOilKlFtI
	 lrO/2w2sJF2GzPbfyi7B05MmT6cSAZafZ/e4uQ68r6ksI2Fr0WKqcTnkfKAaiTDbes
	 6EoBSVqD1Y4HZcQmEyon+HaGDdhf2eaNwGF4BRbunDq4/82uN3KeSGf24nGPeXrBDI
	 0pSPO2QkNaX8En3yBCIyAsb30Ny6+bqJ9n5yH2xUkpvhLD9EfF3W3fmNq5yE5Sl/RA
	 XdmaDQDrvbefQXiCTfxcR8+9YbpuCgeWQyLmhukRRI1KwGT5t8ZdqRbt0VNvcRp0rf
	 TTnWB1VzfKAwQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6680DD6030E;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: merge two if-blocks for KBUILD_IMAGE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275822941.12683.5122789501184205985.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:10:29 +0000
References: <20240323113500.1249272-1-masahiroy@kernel.org>
In-Reply-To: <20240323113500.1249272-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_071030_817887_DD45DF62 
X-CRM114-Status: UNSURE (   7.58  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sat, 23 Mar 2024 20:35:00 +0900 you wrote:
> In arch/riscv/Makefile, KBUILD_IMAGE is assigned in two separate
> if-blocks.
> 
> When CONFIG_XIP_KERNEL is disabled, the decision made by the first
> if-block is overwritten by the second one, which is redundant and
> unreadable.
> 
> [...]

Here is the summary with links:
  - riscv: merge two if-blocks for KBUILD_IMAGE
    https://git.kernel.org/riscv/c/3b938e231b66

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
