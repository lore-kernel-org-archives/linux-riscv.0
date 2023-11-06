Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E73C4167D
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/+krR3Un3/Jtlfm86n42lZOuwjK6KM2NC17mLR51Yc=; b=CfT2uYTbpL8gzX
	EyEE13aT9x800W8RBgImUDHr1fsXZ51nRE9DQr8yvO05dQ+veKX/AvqhovDunw6o1HvU9p6zTdOFy
	Js83ihC8X7YTKoSu4mvMIJ7z77FYsF1129ULvArax9or+nVn7qNMC466wACnYy8XXAMyyvaYmq1Wa
	rlNi5BesAUpguj54yHYWeGdj+zkK6DyC6TLWtwM0ckQDERt3/c1FgCIK8mnr8W2V1c5f6diG6uxuO
	LSnlatEnlWe5jOFU4dZfTFEPW6+sskk3RenLMyC/4wTYqySoC5mfnyg0iDKGDL1eZVqI/VdHD+ls0
	rmOS+/mSzvKhNfeZNW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r015d-00Gvcz-0a;
	Mon, 06 Nov 2023 15:00:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r015a-00Gvao-1i
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F2C660FA5;
	Mon,  6 Nov 2023 15:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51D00C43391;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699282829;
	bh=+IkgCci2CVR2RK1E54OUNo+9XrRa7iGFAkIPDs7u4rA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qz1rcVQCZXc7c2x6lRLP6XvMHa6Lfu3aib6mxgwSW6yMlZos4Jxv7Dp7w0uRRpFqF
	 aFTEsfRt6mOTDmPboZ84lu6xHm0cbl/vm+9zCuXS367dO9hjV6/lCPpVuzTYBgSIow
	 lZnnZl4Xxlup0K3OT8vqdWhW1aYvkuxyKauU+M3ncpf2Ek/5oCxG2N0CpsBRQCVwIO
	 SDL0mBDRBnOcGqjv6Qift/SrFBTVrTRongmTf5D5bGY9Mmlw/AYm7wPcYB5jU/5Iog
	 33b1p2ZViB4QwuJw8wOqYiatA36MngQoXYy8/w5HlgFTfDhOk1fYbAzxPO7EiThTjI
	 7/0KWZitn3IUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33578E0009B;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: mm: update T-Head memory type definitions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169928282920.16503.8733188249165369994.git-patchwork-notify@kernel.org>
Date: Mon, 06 Nov 2023 15:00:29 +0000
References: <20230912072510.2510-1-jszhang@kernel.org>
In-Reply-To: <20230912072510.2510-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 guoren@kernel.org, dfustini@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_070030_612095_CCFF08AD 
X-CRM114-Status: UNSURE (   8.05  )
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

On Tue, 12 Sep 2023 15:25:10 +0800 you wrote:
> Update T-Head memory type definitions according to C910 doc [1]
> For NC and IO, SH property isn't configurable, hardcoded as SH,
> so set SH for NOCACHE and IO.
> 
> And also set bit[61](Bufferable) for NOCACHE according to the
> table 6.1 in the doc [1].
> 
> [...]

Here is the summary with links:
  - [v2] riscv: mm: update T-Head memory type definitions
    https://git.kernel.org/riscv/c/dbfbda3bd6bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
