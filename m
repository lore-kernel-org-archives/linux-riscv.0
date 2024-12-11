Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62572E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scT46PzVkic0k96NNKONaBfTGIouISpKXQIGdtOR0uU=; b=kJk/2I8kZw6cCd
	eavD69lRNPaTy9/TPzcPOO31rNOIHG9lxsaxgfY8kif+2eLdQohAPFtpYmcteDZtGFB6q43F7/sg3
	gW8Qwgxfa+3SCwzgixAIiuKjAuf1R7JkvcBCcPpyS3Um+iLCSrMbGsEBFt9IXHXGvj+0LwpFxd0m/
	3RsgO0LMFsLRR/aTleR0wFxU7Nzk0yeCL6Ulk6zP/YWTFLjN9PVo4KloJGAFu4vsjtgZQPVvvqxu6
	/7AFAlCdQI2SuQvq09M8lQzao+xpbfvCY4H7cMbxbVQcIwFiCLPiZFWQPVCqgYbrSWVnMzO61ciRK
	KAaZIZYLJj9SGROI1RbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVM2-0000000GMsq-2B1a;
	Wed, 11 Dec 2024 22:38:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVG6-0000000GKZS-1CgG;
	Wed, 11 Dec 2024 22:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A14CC5C67FC;
	Wed, 11 Dec 2024 22:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BF5C4CED2;
	Wed, 11 Dec 2024 22:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956361;
	bh=il/LP0fiktwHyC77+kl7PbXayxiUWzB2aK3hHeyKOp0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y5CBumuGwdaTIUle2/mYmKPRDobxNEAa6rBA9JYi6bEbIedw9zcOvMM5DJA5ZB/mM
	 eBJPdavTIV5zeA0YCCQINKu9mGMdUWA0ufAK3v1xo3N8M1wPmqXw3uu8Ui8gCIzOR4
	 T7Q/G21LeE2qTojctC1ulmTVtfyUzQCyEBcjTzR0TykkdXTYP/rxRQkttrsLqn7Fmw
	 5S8OI7FlbZSdax0So7Bpu+k/453ZrHLon6OIs5btOoqZ8uzprsc9uF1Ug431XOrRt1
	 tWauQ4VvZ8v7rE1lmeXPQmFo11ZCU4/ohbbs+x9p3z5lkALa65fkEbJOCLs129/ijO
	 QHq4KQSfWq8ZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA9380A965;
	Wed, 11 Dec 2024 22:32:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] dma: fix typo in the comment
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395637749.1729195.15051372994717315610.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:57 +0000
References: <20240918034114.860132-1-yanzhen@vivo.com>
In-Reply-To: <20240918034114.860132-1-yanzhen@vivo.com>
To: Yan Zhen <yanzhen@vivo.com>
Cc: linux-riscv@lists.infradead.org, vkoul@kernel.org,
 paul.walmsley@sifive.com, samuel.holland@sifive.com, michal.simek@amd.com,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, opensource.kernel@vivo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143242_368105_5CE3627C 
X-CRM114-Status: UNSURE (   8.50  )
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
by Vinod Koul <vkoul@kernel.org>:

On Wed, 18 Sep 2024 11:41:14 +0800 you wrote:
> Correctly spelled comments make it easier for the reader to understand
> the code.
> 
> Replace 'enngine' with 'engine' in the comment &
> replace 'trascatioin' with 'transaction' in the comment &
> replace 'descripter' with 'descriptor' in the comment &
> replace 'descritpor' with 'descriptor' in the comment &
> replace 'rgisters' with 'registers' in the comment.
> 
> [...]

Here is the summary with links:
  - [v1] dma: fix typo in the comment
    https://git.kernel.org/riscv/c/39d283d14692

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
