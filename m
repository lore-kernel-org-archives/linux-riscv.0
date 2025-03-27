Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51761C36018
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHxKQdLwulUMxIbXm9ObFuNrMPeMmws8OpcBq4CQ0mQ=; b=CFRXQRwAiyN7M+
	FMeT5lTinbMkpz92NmlWdnQI8wCQ3reIWvpm0ml5thHqvG5m1C8A50yxvJNWHK7OH78wXmeUR3c/l
	rfLAQLm8r+a3nrcRAdEX7dJmCnPZdpA5Qf/G7TodMEUC2wazsRCt7d3+BRB0XJzM/qWizFrRSEBhO
	aVti8xTIVgq2+lVaBalK8Eo2h5DAA2mmZio9g3x2YtK91EyvcoZsvbHgTRVH+47YB6PJtv8+c5D55
	hpMikSXKyrGSchXig4/BTFZO1vXsZEe0XIXDLQCjl7TEySW7rB6/tX2lf6pfXdf4FMpiCBr5ZT/yt
	AnF517NzlUhrzf3G6B0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf18-0000000A9xl-3TF5;
	Thu, 27 Mar 2025 04:38:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdrJ-0000000A4pV-1FSC
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Mar 2025 03:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fjcE0KXS3jtgcZQfEYkX93nTgTBUIYdHvUkuHspJtcA=; b=JW04JVu+eIKqsEimag0ZIbTYtZ
	vPm7zuBrckwsrTbbjs2X0LViswe3ObL9802NaAwfmtbw/OvlyezB11f5qaXrTEBVgMTieWfJrKViD
	dfWbFGWtk89Ed1djJ44fP2F/YrCo+9WXzCIqLmuJam3vfhqknmUQ6PRDAxw5TuFacmOEINInTBvsO
	CAaRzLpuS0Z/lb7AUzgG9KqrQ2t3NfLKAkMdNjOAnXrd1Ubr9lM/6TlVDTEaDz4wJOBRlv/a24PiV
	f6wR0jA3ZwGBwRVsRvKi456A6HPqvVKGpJOagB7gRI36+nIc+p4BmvI7Urkz36WEbGc3rhYbBO0GC
	7dowzjew==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdrA-00000005tKV-04Qw
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 642F443A35;
	Thu, 27 Mar 2025 03:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4D1C4CEDD;
	Thu, 27 Mar 2025 03:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045870;
	bh=hXiuac50AZWLBrwvx/7arCrBymRUVVFamfJ/mIqZ9xc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LlIvJ/YbFZ50LDGe8JlpoUnN8s9jUfyHw8ifySjv/APazheITxwvoKFDJvA7DY5n/
	 Kp7kARTfyqLSg04oOEA7sswL0YxU6KRK4PS245j/OAc9SW6dTyefLxqP0vDSIV8e8m
	 vm27y0RrHzxRPU8+MbCnfEc0Cs5HbPX8VkZt5vnb6AK6Sek8PRVpo9Knnaadzz39sV
	 cWmvDPp85kbz6Wlhd1nuCmwzvnpDFzkAgpXzRXAblBlPZqpYeBFMNSiMhmPKoE24Tm
	 lGzfVusTxSTW7u/onMh5YBxjj7fdwBaXq/bni1OEyXIsLnTw1OgYLpNtuhacrGikNd
	 rH13tbCDkqNzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33AF2380AAFD;
	Thu, 27 Mar 2025 03:25:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Remove duplicate CLINT_TIMER selections
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304590675.1549280.14334203508337500301.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:06 +0000
References: <ce55529a42fa232cacd580e38866c60701f91095.1738764474.git.geert+renesas@glider.be>
In-Reply-To: <ce55529a42fa232cacd580e38866c60701f91095.1738764474.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_032436_638219_9E01C65E 
X-CRM114-Status: UNSURE (   7.23  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  5 Feb 2025 15:09:03 +0100 you wrote:
> Since commit f862bbf4cdca696e ("riscv: Allow NOMMU kernels to run in
> S-mode") in v6.10, CLINT_TIMER is selected by the main RISCV symbol when
> RISCV_M_MODE is enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Remove duplicate CLINT_TIMER selections
    https://git.kernel.org/riscv/c/72770690e02c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
