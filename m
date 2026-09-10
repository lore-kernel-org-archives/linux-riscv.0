Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682A2C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPsWsgt17hfjw9P+r5WggHeVlNMITDn/eKtWaA07/zI=; b=kHlbZ1j+pZOSid
	wSxfM30qANWR3hDZmfzTJkClZvhLte9D/06MEPG8XjWIH03TWNV8QnFVmQQzyugnBV3JBhUYYalRH
	uQ88gYB9eZu5yQPa8vweom9OstsDIL7oHh0/aD67nv2LAj7vhTf4dnw8GXvsg1dyWha2HuCSe+vqB
	OoItEKO/87w/KyjaWYLoVqxwHLMs9BeTX9T03GMh/7f6MssFp+3YWoYBH1/Pd5ZEzCSboidsUIWrg
	qbw07BRgokirEqNGfEyb0yGB8mB1L2lZ91FqkFbuNKoIdFNg1eYAmS1StfKqaigY1fH1OK2AxrpjU
	UjcyebyYV1hIUA/W1y9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ePx-0000000EQ3B-41ib;
	Thu, 10 Sep 2026 13:02:17 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ePu-0000000EQ2U-49Nq
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 13:02:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789045318; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lHpaTgX2lR6byZhp3HNgrrg+eHsQoyKnpEOL3YjMpvnsDvc50yZBRpsUFirnmc3qQNzMBLtd4JF/+VyFIFaEEEvcyNStjT/dvbFKppFL3+VsOwdz5ibYeSnl//2mEY9Pg77ECz1T8ItGgeVP0uT+X6uJrfPWfUJvpGro2xi+8qA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789045318; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=45nffq/Zr2o5JdVjGW3q6mmCc+x5WnknLVPkYUCAZq4=; 
	b=M7pZyTw5EtUm8IBdgFL7EicITtLG3RKxLGTFXRICT3osAtIpgk4cQjURjZwvvhLIEDLN8QI0NIeV7kqjhSUiXUP8QhJRpBdo6M+b22se7hRcT1n3nQJG7C+GzmjXh3jlbjptcDpI/+zfvXNxISu+Yi2g6r7ocZtiQFxvysEO1hk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789045318;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=45nffq/Zr2o5JdVjGW3q6mmCc+x5WnknLVPkYUCAZq4=;
	b=ATru7tAnfYYtc0DMIMF6ID7+HJHOYpLIN/MZ6uzWOyq7Jhx+dbM2xD8jzSlLBZM5
	XMY3BB7iJvqxpMkHygNJRTo1N+miXigrshtfW+MbItPWjPx4sKbW5nYfRi4m57ACH/t
	HoL4nkg/jo8Pqs80yfNrFu/bOsZm3Z4vGFt9vdeU=
Received: by mx.zohomail.com with SMTPS id 1789045316428631.4804164269831;
	Thu, 10 Sep 2026 06:01:56 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:01:30 +0000
From: Yao Zi <me@ziyao.cc>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Yixun Lan <dlan@kernel.org>, Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 2/5] clk: spacemit: make MIX rate selection consistent
Message-ID: <aqKqKkXbTkcS-pnY@pie>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
 <20260909-spacemit-pll-init-v1-2-b3065ad5a4ac@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260909-spacemit-pll-init-v1-2-b3065ad5a4ac@linux.spacemit.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.29.40
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_060215_073726_BF3C65DA 
X-CRM114-Status: GOOD (  17.88  )
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

On Wed, Sep 09, 2026 at 10:07:02PM +0800, Troy Mitchell wrote:
> CCF passes the selected parent's rate to set_rate(). Searching other
> parents at that point can produce a divider for a different source,
> making the programmed rate disagree with CCF's selection.
> 
> Restrict divider selection to the supplied parent rate and use the same
> rounding as divider_recalc_rate(). Track the best error separately so
> low-rate requests do not leave the initial zero-Hz candidate selected.
> Skip zero-rate parents and have determine_rate() reject requests when no
> usable parent exists.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/clk/spacemit/ccu_mix.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> index a8b407049bf4d..da3c5685d4f65 100644
> --- a/drivers/clk/spacemit/ccu_mix.c
> +++ b/drivers/clk/spacemit/ccu_mix.c
> @@ -107,22 +107,27 @@ ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate,
>  	struct ccu_mix *mix = hw_to_ccu_mix(hw);
>  	unsigned int parent_num = clk_hw_get_num_parents(hw);
>  	struct ccu_div_config *div = &mix->div;
> -	u32 div_max = 1 << div->width;
>  	unsigned long best_rate = 0;
> +	unsigned long best_delta = ULONG_MAX;
>  
>  	for (int i = 0; i < parent_num; i++) {
>  		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
>  		unsigned long parent_rate;
> +		u32 div_max = 1 << div->width;

div_max should be invariant across iterations. Is there a reason moving
it inside the loop?

>  		if (!parent)
>  			continue;
>  
>  		parent_rate = clk_hw_get_rate(parent);
> +		if (!parent_rate)
> +			continue;
>  
>  		for (int j = 1; j <= div_max; j++) {
> -			unsigned long tmp = DIV_ROUND_CLOSEST_ULL(parent_rate, j);
> +			unsigned long tmp = DIV_ROUND_UP_ULL(parent_rate, j);
> +			unsigned long delta = abs_diff(tmp, rate);
>  
> -			if (abs(tmp - rate) < abs(best_rate - rate)) {
> +			if (delta < best_delta) {
> +				best_delta = delta;
>  				best_rate = tmp;
>  
>  				if (div_val)

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
