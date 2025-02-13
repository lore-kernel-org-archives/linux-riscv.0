Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AF3C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 10:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZkMQAyguVXazmwndtPEotM6eEyumONEBf0WceXhJOE=; b=rM2OHCN6cJGyza
	fGrVQnMkCFduSNnVl3YQcrn+g+NNL5Izwp9AjbJ7pZ5lSpc0vluJzAAEizRc1EUhvLBsTHhdvmJ8u
	Br1Yj5oWgnws4d0L/A4puto/6qFPCXzrc8nA9kSyh2RW31x2R5B+DydRWvZYd/W5VVJUyAWrIh8Da
	JAnqpAUuiQydWYZ2gGsXknrdsIOPtN4SipuMwicfZbVVDbojwiyyJzC8TDIS6bdkZkw+MOSV63wD8
	DjON0DbKf+5H3A3BM1XP1ePNz/DP+0VcYzQa9yo8L4S7Oa0xAwO6N+YH0GziMAr8RWZyyfU3giSFW
	Nf9isoHXm3dZTYyLDoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWfk-0000000AhpT-2vID;
	Thu, 13 Feb 2025 10:42:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWMQ-0000000AeHW-2t6s
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 10:22:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiWMC-0000vH-7c; Thu, 13 Feb 2025 11:22:08 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiWMB-000jZp-2V;
	Thu, 13 Feb 2025 11:22:07 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiWMB-0003C6-2H;
	Thu, 13 Feb 2025 11:22:07 +0100
Message-ID: <619128481807b279e5d3b7967b00e7f094dae7ba.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] dt-bindings: reset: add generic bit reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto
 <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li
 <looong.bin@gmail.com>
Date: Thu, 13 Feb 2025 11:22:07 +0100
In-Reply-To: <20250213-cordial-elated-grebe-57aaae@krzk-bin>
References: <20250213020900.745551-1-inochiama@gmail.com>
	 <20250213020900.745551-2-inochiama@gmail.com>
	 <20250213-cordial-elated-grebe-57aaae@krzk-bin>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_022222_736494_D9432FF7 
X-CRM114-Status: GOOD (  14.70  )
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

On Do, 2025-02-13 at 10:35 +0100, Krzysztof Kozlowski wrote:
> On Thu, Feb 13, 2025 at 10:08:54AM +0800, Inochi Amaoto wrote:
> > Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
> > a simple reset controller by toggling bit. It is a hard time
> > for each device to add its own compatible to the driver.
> > Since this device share a common design, it is possible to
> > add a common device to reduce these unnecessary change.
> 
> SoC components are rarely that simple and even if it is just a bit,
> usually it is part of one or few registers.

Yes, in those cases (which are probably most of them), I would argue
this binding doesn't really fit.

> Anyway, there are already bindings for reset-simple and I do not
> understand why this has to be duplicated.

I think the motivation is to not have to add a new binding document and
modify reset-simple.c every time there is a new SoC. I wonder if some
of this can be mitigated by adding just the binding document similar to
trivial-devices.yaml, without the actual "reset-simple" compatible.

> 
regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
