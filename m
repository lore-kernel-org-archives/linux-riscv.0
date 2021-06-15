Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C95C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:10:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFB9613B1
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCFB9613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIWjfzqrObBXnQXVr50fHc4p7Wx3IRRE2NrYL0T9YCs=; b=IC0HLnnYHEN1L5
	OKg9kOV3a7nEHGNoSpndDYUe8UAnp1CsY5xVYU3pu7qZFxHHlKzQbsGQzXGwc1Z3P8zIYrvcq6AFw
	6g18WQPoR1F5WFP75H1ovwWH3+hCRy0H1AAPVKF8ifDdLjrrL3V5yq1mqJpkYS828OzeLaHKriUdZ
	u2UMrM1r057bqSHL3Qd/wIns4EU0h4JRrgFgV8ZUDYGLFqig6mKat+d+yZJfDCDixL7mTUG+sm11V
	6veEPurgHZxEUkuPRbuXP82Dm3mEIrx89pvq7SKCSop4CdrTg0jiZ47j7NNJuac4L8Ri4JVG9oGrI
	ei78NVObamYt2BrlF/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGJd-0031zq-UP; Tue, 15 Jun 2021 21:09:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCt2-001kMp-Pb
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 17:30:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1FFAF61410;
 Tue, 15 Jun 2021 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623778204;
 bh=ruOmnkYu+/y18YVU7ZKGdWrKmlayBFEh1kkkhqIsZO8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=vI/fEfbW0SLojT9pSYbswEYYNCDELgxZL61hER3AxpTTFTowSzbRljJtUFfsn+T7I
 SXyQl4T6uY2tGSKchtKkkfw/WrD4atokEfsLDE+ze5/ZjxHhZJ9rZI3wTHnybTE+qc
 VO4vACN+xjOnMMMlZVcHvhSSCcFThht5/OHCo93hPMIXxadoHdQCGOCgyfDofAXeJF
 rdUrp8fSltrFlf84qX1sDO8qrDD+hG/B4/iUJxdNu23aKYkgTEUAWDRHix16SuNbtn
 76S7BnA9zzNAEOvuqB5c0j8K3jY147QBTH8Pv7pRAqYMiC4QKgP3eQ+x85TeFHJ6ps
 ojsp+gNBCVfbQ==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] stmmac: align RX buffers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162377820406.32202.2352789207444259585.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 17:30:04 +0000
References: <20210614022504.24458-1-mcroce@linux.microsoft.com>
In-Reply-To: <20210614022504.24458-1-mcroce@linux.microsoft.com>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, davem@davemloft.net, kuba@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, drew@beagleboard.org,
 kernel@esmil.dk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103004_909216_55324EE8 
X-CRM114-Status: UNSURE (   9.96  )
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Mon, 14 Jun 2021 04:25:04 +0200 you wrote:
> From: Matteo Croce <mcroce@microsoft.com>
> 
> On RX an SKB is allocated and the received buffer is copied into it.
> But on some architectures, the memcpy() needs the source and destination
> buffers to have the same alignment to be efficient.
> 
> This is not our case, because SKB data pointer is misaligned by two bytes
> to compensate the ethernet header.
> 
> [...]

Here is the summary with links:
  - [net-next] stmmac: align RX buffers
    https://git.kernel.org/netdev/net-next/c/a955318fe67e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
