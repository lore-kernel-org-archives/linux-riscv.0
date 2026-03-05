Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95743F3092C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvDi3kHvtIOFwOO1jf29smC9M0SuW3+qB10ZXsYgAY8=; b=LisioRDin7vFT6
	EXu7WvBdWXCLNIQP6jjcVs+UQ3DkejLbqSiT/knlkfcefMqF9InH2KnHXDTkWsoz9V8KKc/tzGeqG
	7raeBg4lLWg2LimLe7KTrUHSSZKqjW+Oy6ofB0cHz1KDxRiT88gkGv9RsWMJKrEqetOUI1wfzy7bM
	M7wLgIFQ4QttvOhXrk/WuJTf4SlyuRXlUE1eJF/9hItAh9ooKg6zjMyqrwLM4pO0ky3XEk4lNHPbR
	OeEtSoL+x+4hhLGAdrehImMjohuJVtAndcmhCDKOTQMt6cbB7S5bx/HJTXYVcJZcP1Ix44jDB4T5X
	Ay4RClrvCp/ekNQ8DTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8cR-00000001sFE-0xyN;
	Thu, 05 Mar 2026 13:19:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8cO-00000001sEn-3chA
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 13:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC64B43F53;
	Thu,  5 Mar 2026 13:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30848C116C6;
	Thu,  5 Mar 2026 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772716795;
	bh=2b6ErHbmsNp6ReRrw9T/1LHYX0rELD4FEX/8EiAMxiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jszM+s9veUVm+q8AzGoj+JgCcGNarYbGIpIDz/iQaCbiWWGX/aL6yBdKzx+RcpjWq
	 8tRHL3WXG/FyGYMfI43PZdoOljnANTwy5Sg9/K2SjMo5H/eWet3Py8wV/lDTdURheL
	 6iXXAfmPCKdAIkQwd3rcsJhFqKBXekgiEQyin0qKp3/6Al9GDyl33U7J5xj5alxJrZ
	 yFxcGaw0OqYHAj+XZtoDrWhEftts66Ie1SjcZEP2/pyUCTwl+zaz7vNmdxoYEdmMCP
	 EfQ8KNVfuM5PdV7uiV9Bzj6z2ox7FcX0NWhOVHbrTkxJ+pSa3a9XXN1l9cj/Aimh2A
	 94CObXLLHbSGQ==
Date: Thu, 5 Mar 2026 21:19:52 +0800
From: Yixun Lan <dlan@kernel.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Haylen Chu <heylenay@4d2.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: ccu_mix: fix inverted condition in
 ccu_mix_trigger_fc()
Message-ID: <20260305131952-GKA302167@kernel.org>
References: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_051956_949126_CE919E0C 
X-CRM114-Status: GOOD (  15.29  )
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

Hi Shuwei,

On 20:46 Thu 05 Mar     , Shuwei Wu wrote:
> Fix inverted condition that skips frequency change trigger,
> causing kernel panics during cpufreq scaling.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>

Thanks for catching this..

Reviewed-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu_mix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> index 9578366e9746..a8b407049bf4 100644
> --- a/drivers/clk/spacemit/ccu_mix.c
> +++ b/drivers/clk/spacemit/ccu_mix.c
> @@ -73,7 +73,7 @@ static int ccu_mix_trigger_fc(struct clk_hw *hw)
>  	struct ccu_common *common = hw_to_ccu_common(hw);
>  	unsigned int val;
>  
> -	if (common->reg_fc)
> +	if (!common->reg_fc)
>  		return 0;
>  
>  	ccu_update(common, fc, common->mask_fc, common->mask_fc);
> 
> ---
> base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
> change-id: 20260305-k1-clk-fix-25b101c88459
> 
> Best regards,
> -- 
> Shuwei Wu <shuwei.wu@mailbox.org>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
