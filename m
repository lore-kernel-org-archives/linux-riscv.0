Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7993A606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 18:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uYxbV3sW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XZzTrYeD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B7/vPv+IhaCrJEzaeD4KjSTTEExbJdWcWV1iKw0oXzU=; b=uYxbV3sWTdl83aBAeRqGrknYj7
	jWsjLqbwZ9kqiDxywULIm4EpPrI5f5VvNXPDPv1WSkfWn42SQs3KUpuDlJNtvH1fXpRU0hjeZChgQ
	wVmCrAWGOblj6RQ/7ipi3yl7JBIbJJAnqPK12M3StYQNrEvW5KUZibDfqrQ8kyk3odHpQsrRnbA9A
	N5uv9aGQN3sOKwYkW4zkNeyQwLQ4fJOHVNtUwi5V2AL+aovVEqYMFG4RCbTTxLsKBaQwT1EkoAGvQ
	RngZgGvvdxYytJllRgfpYhAo/rrXtM2mrojAvh1lAzjs8XpuHSNFoYoQl3QRj0JX/3ENOGo+2vpEj
	7LtUQ+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvJB-00000007VD6-45MZ;
	Tue, 24 Nov 2026 18:32:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvJA-00000007VCf-0ND2
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 18:32:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 994E1431CC;
	Tue, 24 Nov 2026 18:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087051F000C4;
	Tue, 24 Nov 2026 18:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795545119;
	bh=gw/J6tsrEEBYQGZcVt2c5cjvJDfXcBGni2CbulyGeQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XZzTrYeDqn0b1CMgtlMjAD0oeEVxxe0f2v6I1ntpfCuzWkLiuvfwl7s4n5VqAC6DU
	 xmVE+ZHysFW+GEoreUW7STi1p9rsvFt3OVxJ/fJ79j77hlpcCUezvLZhPRTYggyWRZ
	 gDe5m5bfA3egdwacje+pIMEiNFscAXgvd/SH7+vYB+FPSIN8J4HWjbm8tHU/I7Hxa9
	 IJdxsFTILMp6OV1FWbJJrGPeeS77oJ/UNHnqvwIIUr1d3Qb30Lnyjb3DC/yPtlBreg
	 5WSPEHYqsYZjWlLcBkGJOMtkKRlOj9LTCTTQNpNXi85g1VYNBMdunnSata6wwEF6OF
	 P1386DUcOZ6Rw==
Date: Tue, 24 Nov 2026 13:31:56 -0500
From: Brian Masney <masneyb@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 08/10] clk: tenstorrent: Poll atomically in
 atlantis_clk_pll_enable()
Message-ID: <awXYHBcmdDQ9OvlD@x1g10>
References: <20261123164834.3330320-1-lee@kernel.org>
 <20261123164834.3330320-9-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123164834.3330320-9-lee@kernel.org>
User-Agent: Mutt/2.4.3 (2026-10-09)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lee,

On Mon, Nov 23, 2026 at 04:47:41PM +0000, Lee Jones wrote:
> The Common Clock Framework invokes .enable callbacks in atomic context
> with interrupts disabled and enable_lock held.  In atlantis_clk_pll_ops,
> atlantis_clk_pll_enable() is registered as the .enable callback yet
> waits for PLL lock using regmap_read_poll_timeout() with a 500 us sleep
> interval, triggering a sleep-in-atomic bug via usleep_range().
> 
> Since the PRCM regmap is backed by MMIO, use
> regmap_read_poll_timeout_atomic() instead.
> 
> Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
> Closes: https://sashiko.dev/#/bug/linux-980395a6-f282-478a-bf18-b5695a725735
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/clk/tenstorrent/atlantis-prcm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
> index eccc8015da23..d9155f133713 100644
> --- a/drivers/clk/tenstorrent/atlantis-prcm.c
> +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> @@ -313,10 +313,11 @@ static int atlantis_clk_pll_enable(struct clk_hw *hw)
>  			   PLL_CFG_EN_BIT, PLL_CFG_EN_BIT);
>  
>  	/* Step 3: Wait for PLL lock */
> -	ret = regmap_read_poll_timeout(pll->common.regmap,
> -				       pll->config.reg_offset, val,
> -				       val & PLL_CFG_LOCK_BIT,
> -				       PLL_BYPASS_WAIT_US, PLL_LOCK_TIMEOUT_US);
> +	ret = regmap_read_poll_timeout_atomic(pll->common.regmap,
> +					      pll->config.reg_offset, val,
> +					      val & PLL_CFG_LOCK_BIT,
> +					      PLL_BYPASS_WAIT_US,
> +					      PLL_LOCK_TIMEOUT_US);

This should actually be converted to use the enable lock instead of the
prepare lock since this will sleep with interrupts disabled. The _atomic
variant won't be needed there.

Brian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
