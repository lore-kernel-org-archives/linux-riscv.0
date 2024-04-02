Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E61C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsm2KN2gpwoTFblHj5k8FED6ZZw3oApuDZOu/SAS8eY=; b=IlY7WKzaVTjQRj
	EhNUgsWRZ0bGfNcrql8NmfaEarCygcsz5/Hen9QRYcXQcK+kAhQwPuEH/yjx1DF9Po4m24e87xid9
	fgP2awr5f16e1Y1DmDiSUuCi2oWsFRKRrssSYMVI9TCefqDDWheLektQA/8rnwcHyBzgZ8T41PZBh
	BQjBMzniCmc/j3777MIwPTtnDUZLRPSoAHxrsF+sBRQ6kMTI0JbCnYFH2mEvzJS5p2X/Ldo6xrETT
	Zx81POu2/jiJAj/TZ85+SrafTGcUmHa0rw00Aae5CJIl6AL6DCyK2w3QEmsmsLkAy7UdX5HdGOzD7
	bUoMQvGwP0XOCAOldemg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rraII-0000000APNj-0LI6;
	Tue, 02 Apr 2024 09:19:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rraIE-0000000APMp-1Kxv
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 09:19:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rraIB-0005sb-80; Tue, 02 Apr 2024 11:18:55 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rraI7-009xBm-My; Tue, 02 Apr 2024 11:18:51 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rraI7-0007gh-21;
	Tue, 02 Apr 2024 11:18:51 +0200
Message-ID: <cb394a00585091554df47f6e29758c17f89ed56b.camel@pengutronix.de>
Subject: Re: [PATCH v1 5/5] reset: k210: Deprecate SOC_CANAAN and use
 SOC_CANAAN_K210
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,  linux-gpio@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Tue, 02 Apr 2024 11:18:51 +0200
In-Reply-To: <tencent_8A35663124AED1894F53905E1BC0F1091705@qq.com>
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
	 <tencent_8A35663124AED1894F53905E1BC0F1091705@qq.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_021858_433513_08CAEFDE 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

On Fr, 2024-03-29 at 01:06 +0800, Yangyu Chen wrote:
> Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> SoCs is already in the mailing list [2,3,4,5], we remove the use of
> SOC_CANAAN and introduced SOC_CANAAN_K210 for K210-specific drivers,
> 
> Thus, we replace its drivers depends on SOC_CANAAN_K210 and default select
> when it has the symbol SOC_CANAAN_K210.
> 
> [1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
> [2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
> [3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
> [4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/
> [5] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
