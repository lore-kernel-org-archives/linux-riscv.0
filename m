Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D01CC4361B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 11:30:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD4FC235F7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 11:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD4FC235F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2gfAGmcq8rgZtxyGIp/r85YRXNBu5Rhymr0/8hmLiG4=; b=hnsGCL/g1TKmc6r1Xs0Z+AzYN
	sgJLAMgHbTU55MiChift7ZSRyd+UfKIevNWV1WEzIa+MdfAE4dddFklKJRHfob3ydzoZoC+oRJtAA
	qbT9g2Qu9pDMtzZIJNa2SNoEkfrRV3I58UYyAvJFI8XM6TuyRfVj0qtwK/yStiefGb8+3kCJf+hc6
	44RZ4ZEESsRMumZW+zBToNeD8+Q/xUGYwgcl7K/oFI5rT0C2cYF72xrPYBxr5E8COfS3VXZ7Ez9bW
	jsouNvFhsSZ2TpTA9NSJTGq8AvDC2l8VMYWB1UVpIP2psXfSeYDNt50QcAv8i8jGRDScTUTlO0e9j
	fJHT9Ffqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmxfM-0007ii-Nb; Wed, 09 Dec 2020 11:29:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmxfJ-0007hJ-FE
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 11:29:50 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kmxfG-0004Pq-QY; Wed, 09 Dec 2020 12:29:46 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kmxfF-0001N1-Jx; Wed, 09 Dec 2020 12:29:45 +0100
Message-ID: <a168ae4fdf17e2f9e422354f5dadc62bcad3e4d8.camel@pengutronix.de>
Subject: Re: [PATCH v5 12/21] riscv: Add Canaan Kendryte K210 reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>,  "sboyd@kernel.org" <sboyd@kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
Date: Wed, 09 Dec 2020 12:29:45 +0100
In-Reply-To: <57d4ae6e06551a56e41a4d50078ef51cbad67083.camel@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
 <20201208073355.40828-13-damien.lemoal@wdc.com>
 <4d0a0c80e57b156b7d86dfca250285048ab30825.camel@pengutronix.de>
 <57d4ae6e06551a56e41a4d50078ef51cbad67083.camel@wdc.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_062949_558681_524046AB 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Wed, 2020-12-09 at 05:26 +0000, Damien Le Moal wrote:
[...]
> I added COMPILE_TEST. I also removed the RISCV dependency since SOC_CANAAN
> already depend on it (due to the SOC_EARLY_INIT_DECLARE() use in the sysctl
> driver). Stricktly speaking, I think we could also remove the SOC_CANAAN
> dependency for the reset driver, but I do not really see the point since it is
> cannot be used for any other SoC.

Thank you, this is fine. Depending on SOC_CANAAN is nice for users of
other SoCs, as they aren't shown this option to enable a kernel driver
that we know they don't need.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
