Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6275C5518F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnLAKtbiKRpGLHLy63B+yPweSsyuCHd9f2my/P0gz7w=; b=WyoXjhGinSuPpe
	znmbyQUlwnP3C5+OhEs6GGsdIE9+lTNPxkY3RlOrVymWKp2/sfwIbNoB3uRjvKETcFFuyQQuQd0ZF
	f6czZxMsu2JP930TazJ4Zx2RHG65z9mGX2BHCdvYd6LiwqpwXayjTOFe7o+/t7yPi8qrAhPT/Qx6B
	rwpoQ08aixcxofWOECNnFAshrhgBw6+6xJRg1yxbaXFMXe+N+ZyfgZHkXyYrmBIqgw7eefTNLeUx2
	AOwS14d2zbTyaFMw1ePS0SmSg7StXq2CsnBcELyw2hSzqfQL9l3OBq105LHYUc2hOTmxUt3AvIgAb
	5ypQB3kbDVeMqznnrelg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAEj-00000001IDr-3gir;
	Tue, 04 Aug 2026 08:10:57 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAEh-00000001IDQ-3lQS
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 08:10:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785831029; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QLFfD1V+4nQg5tkAgOyb25zWmDiwfVkh8QfkmFdrnqGMcSwbIwPPlhAEo3ufL4bhC0xieYoX+UbpBE4xWj8Ol5hJ4T6CliKdqgWlraL3tAuylSRDfdCPfPsyi8nOXkzLvNg4tYBRDPfuKSDUkWRCJLE+6ZYxq3i2TflWI67SGUA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785831029; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6iE1had4Tg/gR0N8etf03PCwEV/trK2r9t6ymr9IPEg=; 
	b=KwbX9K3oE2geWJjVPNeiMO56FgO9ztodEKLXzVYpB8HTUdTwS3bAt5iiJ7K+dROFUfGO2h4CBW3bLslrAQ7Y3OpddqDvV+ZM3SuQSr74Yukc5YUon4OyR4Un1WwQsqduui3RbblU8Bqj90ec2e8YKB9uM8kjykW8RibsEbmRtmQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785831029;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=6iE1had4Tg/gR0N8etf03PCwEV/trK2r9t6ymr9IPEg=;
	b=ak86VaXIIMkrnmk5pJ98XNGP4niTPwXb6zjaTL2AwzA38i4LpOW0EmyWXPaPOW7U
	GsmdOEkx3f/xTNLuS21iA2fOgVHpWni1e0yeRAOouIe14Hs9TELcShb6MezcOoyvz+m
	dTd9rpoeYXJfBUppxrEZYgFaPlOTQkJGz+3CWCXc=
Received: by mx.zohomail.com with SMTPS id 1785831026677755.103961666094;
	Tue, 4 Aug 2026 01:10:26 -0700 (PDT)
Date: Tue, 4 Aug 2026 08:10:14 +0000
From: Yao Zi <me@ziyao.cc>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 1/2] clk: spacemit: re-enable PLLs after init
Message-ID: <anGeZk0-YShccqwE@pie>
References: <20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com>
 <20260804-k3-pll5-pll8-1800mhz-v1-1-a3a75866ce32@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260804-k3-pll5-pll8-1800mhz-v1-1-a3a75866ce32@linux.spacemit.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/285.815.77
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_011056_220680_2BC0B393 
X-CRM114-Status: GOOD (  12.97  )
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

On Tue, Aug 04, 2026 at 12:02:55AM -0700, Troy Mitchell wrote:
> The PLL and PLLA init callbacks gate off and reprogram a PLL when its
> firmware configuration is absent from the rate table. However, they
> leave the PLL gated off after updating the registers.

I don't think this patch makes sense.

If this PLL is essential for some components of the systems to work,
there's no chance to re-program it safely after the kernel gets started,
since all the PLLs in K1 and K3 are specified as CLK_SET_RATE_GATE.

If the essential clocks could be re-parented glitchlessly, registering
a notifier and re-parenting it before the PLL disables might be a
solution. In this case, we need to delay the operation in
ccu_pll*_init() until clock registration fully completes.

Otherwise, re-enabling the PLL seems totally extra here, they could be
enabled on the fly when it's going to be used.

> Re-enable the PLL to complete the sequence and propagate any lock
> timeout to clock registration.

Regards,
Yao Zi

> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Fixes: 3a086236c600 ("clk: spacemit: ccu_pll: add plla type clock")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
