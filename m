Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6FAC79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 13:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U++s4x6AR6Op3zHqMWXQDLHLNPc426H16Eeg5NGfpd8=; b=WNEXScIxrtS8x4
	T7LawvONMuNYhosG4ZvepkpKbMDUIyXVDaasNTerXpgPL88wjaTYYN3v2092ThRxFphUKPUcw/r5m
	TZ17jTzkDOixbbiZ2CCcVsAXio2Qrcx1iOHYoKTDRDu09CX8m7MlvYwWirWw8RJZBBKtQ2mXkDS47
	N/LshAeinTOcgIrvSReEAt+7hrXbEsA+zRnx7/33gytuNcFpem5Ho6P1AjN80067fuKooNYdJ2h5j
	fLG3NyCfAglm85XWgpWBpJsYEryh9ODxNPdLoZHtZywzjKT2DRLRCRzQX/OAzqMNkhAoHJaBnA6k4
	foqag2aHHQZzcMuDb1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4esr-0000000ETZ7-3mf9;
	Thu, 10 Sep 2026 13:32:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4esq-0000000ETYV-0b6j
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 13:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QH+V9w9Z80FoWtzevrNm8AoJe6kQe6v9Q0++V5yLfDs=; b=D729bbOai3hQ+SHJQtwGpC2TJk
	VXFo05Eoi8lw8fu8qi5whFX/ZRnm/gVpZVDc4T5VxQwnBbTnzTGPlnHgUtWNfgTG97D9Tbro1uM6l
	7B9aRBG8jH4A19yckK+8VPFlNYNS9Uv80FdaVu9j0UYnjLtN/OUwr1zUcs1g5Ul8ZBfy4J8mhuNcs
	f8sLmsfAGvQFki9h8OLBLkk73JVx3tgdjWprpwSrP4gPxiWMiKvH+70nSIkBEuChuQVnnU8HvsQj1
	IluPxw83HpXEJ52+lJHBw5NohFot69j0/Jtzj9DA0uzaibXranO3Prk2SpG/dVhU4CO/t56IYT9rH
	TvTjJnuw==;
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4esl-00000002XLU-3DBF
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 13:32:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789047110; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PWleW4TiyktR2f0EHZ9mwGoDojVKJftnewHry74RhnvpGAvtKipeyRDDUoOMARIcxwbFS4jCiyE2/dZquBT5Sufm/j84i8GEW8PjOTJ0KykuDLdvTZ5TBmkYUsAsb51lUkyWiCHaj2+jV9rZzy+k8U5mV6CQ5CYnR8ke+9lxxyQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789047110; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QH+V9w9Z80FoWtzevrNm8AoJe6kQe6v9Q0++V5yLfDs=; 
	b=cY+1fW+XDwvoCBE4MbMYO92tLurFAnByflni2Ex5Ygxhp/emLcfH9IalQZA8wIUcISNEmjmsxSci6/B073aRfE9jEoV68UNCn0zQ75yCeos0TFieIsfhtOVxFQVj2bXcEeIrTNL/DCk25gdIm2/r6YsjGsCChp828H3lVQGo59c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789047110;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=QH+V9w9Z80FoWtzevrNm8AoJe6kQe6v9Q0++V5yLfDs=;
	b=lgmF7+hdb6EFZi7h2f5+cgYne1yz7xjTWBiRWsQ3mii7W1ME9QtCkcjeAtete8yr
	cwPdcrWSRlEJC4MW8wQR5cwxE9zB6wWsSL6iO9XX03uSGdV/XVLtOXcM1ivXoIKgppb
	9ljJhdVT/4nE91vgBBLDqyfhRNNV+3UdQbxQvscs=
Received: by mx.zohomail.com with SMTPS id 1789047108143553.7058137232074;
	Thu, 10 Sep 2026 06:31:48 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:31:30 +0000
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
Subject: Re: [PATCH 4/5] clk: spacemit: reject rate changes to running
 firmware PLLs
Message-ID: <aqKxMmgpFLE3CmQ8@pie>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
 <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.29.40
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_143204_224516_0430F1AB 
X-CRM114-Status: GOOD (  10.17  )
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

On Wed, Sep 09, 2026 at 10:07:04PM +0800, Troy Mitchell wrote:
> CLK_SET_RATE_GATE only protects clocks prepared through CCF. A PLL left
> running by firmware can have a zero prepare count, so this flag alone
> cannot prevent set_rate() from reprogramming a live PLL.

Would it be a better idea to simply turn off the PLL before reprogramming,
since protected by CLK_SET_RATE_GATE, re-programming never happens when
the PLL is required by downstream? This also seems to be simpler.

> Check the hardware state and reject set_rate() while either the enable
> or lock bit is set on K1 PLLs and K3 PLLAs. Propagate register read/write
> failures and reject rate requests with no table candidate. Callers must
> still move consumers away and stop the PLL before changing its rate.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Fixes: 3a086236c600 ("clk: spacemit: ccu_pll: add plla type clock")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
