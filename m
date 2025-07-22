Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E36C83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 01:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2diPOxEaeB2at6PYJBR+RDR6r0z2WoZH/e5f6Qn2Ew=; b=Pix91VMBidMO+c
	q8OKrLIAhgzQGkelcCS/v4oohXrA1qbMLwQQ6lOT42vAOErBZQTmGhoiDlKRj5V0e54fNvNu6LfVj
	r+bEPXj6xL2IXixqOeW/p9+7gU91FaLZac04Jou4Kgk27MMWB+yeN8epr9dKBiLW5pdQNeFAaw8Ev
	qt3NplCqb4jGfXqEbbKCO81p3D1h5zBSsBbu28Q+mdv4+RcR0n3e6M0RsnK123j9h8PnkNvV5GP7X
	IgQzorVZMIYX3WHDiiirnWtY7cqXnxACBwqpqdG5Z5LRS9/OWHnbtyLKGLk24fnjJRyxX7xzWKEdP
	E1+UEPogSC9giycKYsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue1Uq-00000000zuj-3OE4;
	Tue, 22 Jul 2025 01:08:44 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue1Uo-00000000zuO-4C8T
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 01:08:44 +0000
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id EC46212FB405;
	Mon, 21 Jul 2025 18:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1753146522; bh=hzdmz95quMdnRHb2ogS+Jsja1esz0IU+CTYKaAqwBy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpjlIG9X0fYRhCy7fPJxukgUtsATP1cL7cp/jkkFfEypXx4DQ0ZUIuEr7k/FFTBlM
	 y1YxXEBBOwpkk9cacvkm8XRybsyHXzkxiwCOcP5YsyS5pXNAq4iJb7zWl7dAB/V3hb
	 WTuytjfzmKPJwLVREVSkEmH2QEDD4hXC+3kzCe07jLdMEM91by8GptsNhMq2nM4V8w
	 lKrXyTK4AAmkZy85a2SSRowJRloY6lar5ASCefHNuwzqT8Wo0xqkMk5SeAYpotbHfl
	 d3+n5fZR8P3wtwvUOWCs7Kk0sJ6OpotRKY0K9k5/K6BuYtL4ErUl/mL/Ib/ArKGVVq
	 2s9t4ThajmKvA==
X-Virus-Scanned: amavis at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLCFKPPPdY6W; Mon, 21 Jul 2025 18:08:39 -0700 (PDT)
Received: from ketchup (unknown [117.171.64.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id A2A2A12FB43F;
	Mon, 21 Jul 2025 18:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1753146519; bh=hzdmz95quMdnRHb2ogS+Jsja1esz0IU+CTYKaAqwBy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=et0UNwGoYlgBCdiG4K4MpGoiHLRWz+FgFR125Mrse1zkZk7CFpTTBqiri2ZzY4fpm
	 GQiRwoXFGAR/R0e2usVbi5884N6XQIV5cK1HzIcA1A2qaprVDYD2cnHhY25u8N0NwS
	 sJ+X4Oj29p/U+BnnrffO499qQIZP9oiT1SWd6Oml2++dGNxc75fSshucIfLbZQz+Sd
	 3XbTrSCo1cZmuDl2cE2zL71A6Gy9bi8yFHQ9MilMiIV0IzUzUonJ4HgzufCrLbwF4p
	 qTcRRyFksV57gP5lc98J8nY0ljbWZLIuiAlqnAMQSU99+OieavZypLHDt7dXHOdWAt
	 7lwgYYyFgS8qQ==
Date: Tue, 22 Jul 2025 01:08:30 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>, mturquette@baylibre.com,
	sboyd@kernel.org, dlan@gentoo.org, elder@riscstar.com,
	inochiama@outlook.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heylenay@outlook.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	unicornxdotw@foxmail.com, jszhang@kernel.org,
	zhangmeng.kevin@linux.spacemit.com, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] clk: spacemit: ccu_pll: fix error return value in
 recalc_rate callback
Message-ID: <aH7kjkC_YSEi7dFz@ketchup>
References: <aH6P3lChCXhi3pe4@bhairav-test.ee.iitb.ac.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aH6P3lChCXhi3pe4@bhairav-test.ee.iitb.ac.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_180843_064205_7A36A13D 
X-CRM114-Status: GOOD (  13.34  )
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

On Tue, Jul 22, 2025 at 12:37:10AM +0530, Akhilesh Patil wrote:
> Return 0 instead of -EINVAL if function ccu_pll_recalc_rate() fails to
> get correct rate entry. Follow .recalc_rate callback documentation
> as mentioned in include/linux/clk-provider.h for error return value.

Nice catch, thanks.

> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>

Here misses a Fixes tag. With this added,

Reviewed-by: Haylen Chu <heylenay@4d2.org>

> ---
>  drivers/clk/spacemit/ccu_pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> index 4427dcfbbb97..45f540073a65 100644
> --- a/drivers/clk/spacemit/ccu_pll.c
> +++ b/drivers/clk/spacemit/ccu_pll.c
> @@ -122,7 +122,7 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
>  
>  	WARN_ON_ONCE(!entry);
>  
> -	return entry ? entry->rate : -EINVAL;
> +	return entry ? entry->rate : 0;
>  }
>  
>  static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
