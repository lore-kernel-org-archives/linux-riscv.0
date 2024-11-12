Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC63DD597B5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pYP6D95Jg/BpoijzjXxqXN+3uXglII8hjCFfQeLMag=; b=yH77lV6dDXQaFa
	tSIeSUAusKa9zu5+IkFERCRXM19VvPQADkDdhJlKa88srjk0MIr2lKN6eGkLVtxm3fHand7RLT7m5
	cQcNEyBoa3xeueOHaZhuYKSGge1upyjsiPGxG+Gi6vJ/DsJOc3Pm5QlRz6JZnes92nGC+WXO3ryKw
	hkGNRit7aKs1sK19iqUWLrCKoZ41tciNnYq4GkyvmxV4o6Z8ODDVmHCrUAlITN0vXsbLEc8AxOpWV
	owfCbCfKyyq5dHMW2iOuRGXlz/Fp6PDhyPqOpipdBcS9fusB2VuKx4wY8M+/Dp+ubjxwhaCwjbYFn
	Q0z1AsZQaRKIwLVXHQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzmi-00000005COY-06p7;
	Tue, 12 Nov 2024 22:54:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzku-00000005C7N-3WUu
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 22:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC9ACA419C4;
	Tue, 12 Nov 2024 22:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F323AC4CECD;
	Tue, 12 Nov 2024 22:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731451984;
	bh=yQwt2DsCgJNyhwxurxcyAkIppPnQMY1VaVKG7hi5I50=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q6y6LtGktbgmjw7H7iEjQnUw2HgxVOxdQdc3XvkpzYIwS3B5Bg7247bL18aVlvf6c
	 HruMzh6Ko1Z6shqY/8X6eMEliFKSNrAGHS4/4Gcijrjs1UEkqkNoEqSTHUaZFrDJEb
	 gdMrbkSjLDbKB6sAihOeai9Ad4VstoFrf0AAF1cS13kfFvglzDCWVE3PgFXTzsHimE
	 IVH8dkBDV5m2c3gm2t0Ees/AGJmcOdAt5qLgyZsn1B3WYif5ivyXEdgPMXyqyOvJtb
	 QbqFFo/TMAivSPSeohmtQmadCT9s+3jD4Qd0eMqU7D/cVZPZxP6YEeSfcQb2sXnRKj
	 VdxC4cxziwnBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C503809A80;
	Tue, 12 Nov 2024 22:53:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] mmc: core: Only set maximum DMA segment size if DMA is
 supported
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173145199424.701548.5612261824540957185.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:53:14 +0000
References: <20240924210123.2288529-1-linux@roeck-us.net>
In-Reply-To: <20240924210123.2288529-1-linux@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-riscv@lists.infradead.org, ulf.hansson@linaro.org,
 paul.walmsley@sifive.com, samuel.holland@sifive.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, hch@lst.de,
 robin.murphy@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_145304_974132_A2FF1E33 
X-CRM114-Status: UNSURE (   8.97  )
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
by Ulf Hansson <ulf.hansson@linaro.org>:

On Tue, 24 Sep 2024 14:01:23 -0700 you wrote:
> Since upstream commit 334304ac2bac ("dma-mapping: don't return errors
> from dma_set_max_seg_size") calling dma_set_max_seg_size() on a device
> not supporting DMA results in a warning traceback. This is seen when
> booting the sifive_u machine from SD. The underlying SPI controller
> (sifive,spi0 compatible) explicitly sets dma_mask to NULL.
> 
> Avoid the backtrace by only calling dma_set_max_seg_size() if DMA is
> supported.
> 
> [...]

Here is the summary with links:
  - mmc: core: Only set maximum DMA segment size if DMA is supported
    https://git.kernel.org/riscv/c/c26339faed11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
