Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32442C4742C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 07:07:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991E72071E
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 07:07:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GUtv+jYT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZ038gYH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 991E72071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tBEN3ckco8pRgydzQIAvPZze3zLJumDNgOsopCtlHsk=; b=GUtv+jYTNwO8BqoeHcgqOS/bg
	PVoL6lH7x1uT+NBl37nvg6WmaUvDdEYTQY1o/D+oyStHEHRbZ/MIwIoPIcoem/tEcRpz+RhqDUOGF
	Td88ACv5KAdGSAWeNY21R154aiiPNGETsQrCiYSMcRFbjF3vW20Ii9IWG6Yklr3ON9awXtsHEpKbE
	hUeLinbzAB4mYXu/DAgtV3WdWpvEjXqKklISjJaVqUM1NheJbV2uL0H0yyrwHoWZaYBLjVYU1XOSI
	SihbLHIWuTnQIhNom3GKHgsCMj4qyWkfoRJS5miwGWCOtWjvQd7oj4W/gyNm7F1sAN4mydK0gq0ue
	Xp1Rr4FVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYbL-00005U-KT; Mon, 16 Nov 2020 07:06:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYbI-0008VF-EH
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 07:06:57 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 580CE2078E;
 Mon, 16 Nov 2020 07:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605510414;
 bh=4vaNtfCqdJUurqy3FJA41ufFG5N1KaaL1IPJ71eCFe8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=oZ038gYHLaHG/Z4BTqv8BDY/QNGIh5D7reKoYhwcU1/AkgOuQa7Qqb9S9wVykxpTm
 JVin1f/wdjH5kjgQqxQk1BzJv8fC/wV36vWUKUGYdsh2csBAvbPOKiFHGwsDs57VP3
 79gKITZqNHWcJuFWrHb/5/2pqNf7rRfWlacXtEww=
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB65142F688DB54141C46D1D92E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-9-damien.lemoal@wdc.com>
 <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com>
 <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
 <160525398691.60232.17463845218341195554@swboyd.mtv.corp.google.com>
 <BL0PR04MB65144DA979067F3760D26B01E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
 <160525508016.60232.12394737512819290718@swboyd.mtv.corp.google.com>
 <BL0PR04MB65142F688DB54141C46D1D92E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Sun, 15 Nov 2020 23:06:52 -0800
Message-ID: <160551041285.60232.8430654706414782453@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020656_565400_4F2581D7 
X-CRM114-Status: GOOD (  17.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Damien Le Moal (2020-11-13 00:23:52)
> On 2020/11/13 17:11, Stephen Boyd wrote:
> > 
> > Also of_clk_init() is for the CLK_OF_DECLARE() users and if they can
> > wait to platform bus population time then they could be converted to
> > regular old platform device drivers. Maybe the problem is the clk driver
> > you're using is only using CLK_OF_DECLARE() and not registering a
> > platform driver?
> 
> Yep, correct, that is what I did. SO yes, indeed, if I where to use a regular
> platform_driver, then the of_clk_init() change would not be needed.
> 
> For the clock driver, I followed the pattern used by most other drivers with the
> majority I think using CLK_OF_DECLARE(). I did see some using the platform
> driver declaration though.
> 
> I could spend time trying to figure out if I can get away without using
> CLK_OF_DECLARE(), but since I think other riscv board clock driver are arriving,
> we may as well keep that of_clk_init() change, no ?
> 

Sure keeping of_clk_init() in riscv architecture code is fine. It would
be good to use a platform driver though and avoid the use of
CLK_OF_DECLARE() so we don't burden ourselves with more code that
registers clks early unnecessarily.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
