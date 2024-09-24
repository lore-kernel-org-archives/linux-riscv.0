Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CE7CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 06:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8m1KYJarxKlwlId0V3P2+6CU9orVOgmfUJWQhbVaB4=; b=OLfT/zru2DAUhQ
	kPCTZkHa/YsHsP3YHvoaKt6mWVE2C8PRkZ/COuCg3A689e/eOpRFGBje+p6QaBiYEtxrTPjaJ3IQo
	HGg6Y6ITjv2QDnKNffjeAZhHrh9rCeoq23JjMqIwi45pd5811w6oFQr8jIWDR8VxJKn8ALs3VCS8S
	nzRuxaurwBWQ4Ff6wAxidilcvEEyFibIoTcB0z5SFL3sISpQt7J0yzqxIkgEhpJniVSJUvaAfWpMl
	ETarHM6os1rC9/7cJ3TFCBQZg0c9nObdAuO/EbzAxR57YXssUXlb5mopWKBv0lo1zEEYQSKVjRyRy
	zqQreU2LMh0GVPJjz0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sszDq-00000001HpR-3ybW;
	Tue, 24 Sep 2024 06:40:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sszDn-00000001Hnn-2pvi
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 06:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA512A43195;
	Tue, 24 Sep 2024 06:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A283CC4CEC4;
	Tue, 24 Sep 2024 06:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727160026;
	bh=om1pN1QTZvdrpe7l+Q60/DGIUzN5Y0snEy9rwFg0pMg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p1WauIL1aVGCsJuHkdce6XeneCuno6wJN0j7MKwpN7ZKkUt5ap1nKnEybskZPN+ry
	 acrQQGYahvrD+LQmwaHoeT72fyUggarjJv8pkYz1a+ogsf166bbsb5cnJ/kBLGwi29
	 vzXP+2ouHd0JCTE8QhBLVgkkLtYGasj2EprklIbiIWsqNDAHcjmI++uIJWQul/MIDA
	 ca8T1UUueENn/sHaFGxQ/dzBY4oaUReJ/Jnwnq++UkGtgOB0pATgruWTb4vbJk/EOV
	 wlHJBlg6WZLNSsOIYnhAiCgmXFzvJRDAZWvxDokXqytG3X7f/2mnYWdk7Mo1Ny/FRE
	 aQEVAgO0+SsxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E163806655;
	Tue, 24 Sep 2024 06:40:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] tools: Add barrier implementations for riscv
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172716002873.3899939.6509449388750546652.git-patchwork-notify@kernel.org>
Date: Tue, 24 Sep 2024 06:40:28 +0000
References: <20240806-optimize_ring_buffer_read_riscv-v2-0-ca7e193ae198@rivosinc.com>
In-Reply-To: <20240806-optimize_ring_buffer_read_riscv-v2-0-ca7e193ae198@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, parri.andrea@gmail.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_234027_797294_C7B93196 
X-CRM114-Status: UNSURE (   9.70  )
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

On Tue, 06 Aug 2024 15:01:22 -0700 you wrote:
> Add support for riscv specific barrier implementations to the tools
> tree, so that fence instructions can be emitted for synchronization.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> Changes in v2:
> - Fix typo in commit message
> - Link to v1: https://lore.kernel.org/r/20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com
> 
> [...]

Here is the summary with links:
  - [v2,1/2] tools: Add riscv barrier implementation
    https://git.kernel.org/riscv/c/6d74d178fe6e
  - [v2,2/2] tools: Optimize ring buffer for riscv
    https://git.kernel.org/riscv/c/aa5736dc7aa4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
