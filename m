Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2320FC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQ50UDXM0SYPSY5ZjBlRw729RlvxKkZsaqFH0QXafII=; b=eGshxQSpflqAOw
	zaYmelG5pE/iyoNPG6MM8VLskZZgEZZHGukNCKydYu5UMIxfxhur/vkwUMYHV6zXRsEooIIqvskfW
	Hpmtj6F3wXdjPnYrJ5sWmjtsmo7te07IOaO+qmyo3PvZZFWvCDCFT/OMu5tBBDOov+eRMUr9ds3El
	kqUkkiJFLSIjItPV6mVajGCuhlYQpGj4bCPMq8Vh4VMkl2zKV5SBaCwljftboV9q5af3VCtif1wPD
	D0jrBtrNjF7wBodWABBb3k/tKHuLwrxxJSltVhBnCceWNzTapaJkWzny1gTx7GFA1bo7itv05GKRJ
	WsS2lHxewsGjWsoSbN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtH5-0000000BITE-06qa;
	Thu, 27 Jun 2024 17:51:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGu-0000000BIK6-1UF2
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 76FAACE33A6;
	Thu, 27 Jun 2024 17:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C66C2C4AF0B;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510656;
	bh=YUjyg0q4v3BZyzysolzPu/T8WS3EYTPzZ+otN37RtXA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N2nrl5DseeenBGaeHfDLdEjo4/BG92v3NRt3x1NnXe6DxoxFD0JrT9SfThyrOF3qk
	 fTexPLpWMIcX00TfMNpyR9FGFm2dRthpim4bB/WKcas0F6hF3u4Cyy59Lygl0I0Nte
	 ImeWjAtKzA8sForbwTZ9YzyoTAlTwHlYGr9Q1DyDOPxl1sl9oGiaQQ7hipBe7NV8Nb
	 8L8hr69PEUERGq2MXhshdyS4RqosypRU5mUVWfkoxX03fz7nMTbpgbBpfbQ5cRK85U
	 pMfPII7jfFpCUW/fhA+4jTInUnnAxnDzIkazRxYJ02hQQa6xgOJRlaJa8fH/0AAxcL
	 +5pRHMl3AuNuA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 91B0FC433A2;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: dmi: Add SMBIOS/DMI support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171951065659.6762.4551986079431885211.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 17:50:56 +0000
References: <20240613065507.287577-1-haibo1.xu@intel.com>
In-Reply-To: <20240613065507.287577-1-haibo1.xu@intel.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, aou@eecs.berkeley.edu, atishp@rivosinc.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, xiaobo55x@gmail.com,
 ardb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_105100_692008_C005EA80 
X-CRM114-Status: UNSURE (   9.34  )
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

On Thu, 13 Jun 2024 14:55:07 +0800 you wrote:
> Enable the dmi driver for riscv which would allow access the
> SMBIOS info through some userspace file(/sys/firmware/dmi/*).
> 
> The change was based on that of arm64 and has been verified
> by dmidecode tool.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [v3] riscv: dmi: Add SMBIOS/DMI support
    https://git.kernel.org/riscv/c/d6ecd188937f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
