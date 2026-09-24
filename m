Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07437C9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 19:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Utn8VGY8QrlVHC1R0sdL0Eaw3c70xirq6BXhhauPzCE=; b=NO4UXVkezusJmy
	Arln1Uc8xIPO7Xv4218Jfj7/kavrcwULnE68Z2qU/9yKHU/DJimfCm799bV0+NWtLy436PpreoNa4
	O1m6uxkHU6KP7AURxMSQBTTN+q/VRSIAcgFF3J7ApdG7BIwWfShrblhLP0lRv+0qWChM6dNNTZEfM
	towFM87wYPFI3a2mjmIvbahg9LVQ7P8o88eMIYiEZjFQ8Kfsy7thpQOrtGSKPnzAA8Gl2IAmgIa8F
	BcSgXabDxEyEaOGPC37Mm3XSDj1unf2KKymaWMcVTxMZCsZjEtqR5nEN8il1zyZa82artkZrG1JYL
	0bpy6I53ycou/h/f8ZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oq7-0000000C0RM-15ZY;
	Thu, 24 Sep 2026 19:10:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oq6-0000000C0RG-2Srn
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 19:10:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F05CD4343E;
	Thu, 24 Sep 2026 19:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BBF1F000FF;
	Thu, 24 Sep 2026 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790277037;
	bh=Kd2YCVG/DT6OoKg16iQl9WZoswB9MDypzc/aqsM6ReU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WajlDcbthQEkexNwUprP2yxNO2wt9mEX3S7zwc3uLhnwaNrXHnCd/CWoHz8xtW4po
	 VZOa2opqqxC6xUvfzvrJMA4Q5Ryt7jy7Hsf7uXf0xVoYSrtXsZ8eSqpGClR9Sr1IjA
	 msWNIKTHFMOeiqS1nJogKNueQ1LESMz905bnXI+vKn0Vw0+V3MhM9ULENzgH6j5Yt/
	 dwLFeTxCjQgQtioaSmLw3vjX6YHGQgmCoHb186I/GyRcZ9Eqfe4YJ6cipMu0Bctv2T
	 2/FO18CZM77pkDVe6N1WSc0r31+Okh9qiOx1LxYHavwwCQfG9t3lsZCBY8T13IOXGF
	 s9odmWuDcxrNA==
Date: Thu, 24 Sep 2026 12:10:36 -0700
From: Drew Fustini <fustini@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: tenstorrent: use regmap_assign_bits() for
 conditional set/clear
Message-ID: <arV1rOMRG6D9erK8@thelio>
References: <20260924083439.461769-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924083439.461769-1-peng.fan@oss.nxp.com>
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

On Thu, Sep 24, 2026 at 04:34:38PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() call.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/tenstorrent/atlantis-prcm.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
> index 6d4386eeb7dae..854b9c48816f2 100644
> --- a/drivers/clk/tenstorrent/atlantis-prcm.c
> +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> @@ -205,14 +205,9 @@ static int atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)
>  {
>  	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
>  
> -	if (enable)
> -		return regmap_set_bits(gate->common.regmap,
> -				       gate->config.reg_offset,
> -				       gate->config.enable);
> -	else
> -		return regmap_clear_bits(gate->common.regmap,
> -					 gate->config.reg_offset,
> -					 gate->config.enable);
> +	return regmap_assign_bits(gate->common.regmap,
> +				  gate->config.reg_offset,
> +				  gate->config.enable, enable);
>  }
>  
>  static int atlantis_clk_gate_enable(struct clk_hw *hw)
> -- 
> 2.50.1

Reviewed-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>

I will apply this to tenstorrent-clk-for-next.

Thanks,
Drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
