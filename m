Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397D0D68BE8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gss6AqKjr5wJXUOaw+JPIAiTnnf16VKz55KKGUdWNI=; b=k51dz5+UmATEUN
	2Hd1Bi6KKpxe/M/RxmheoyJTZiOh/NKoP7qVc1QDkP1cnDNBADfWUWkrc0J1CAEZ3SIubiCuu3OAT
	58W8Yico9iZWLzhTLcDUEDzGQY5elb4NZJcNHnPmxx38gwOkZTFYYlubmk0Y15LNK6azBSyS6mRMV
	RlNoj63+Mx+o8AfZSWfi7XlIEBjewUJgHkWHeUAiO1V4RsKP8quobQWaA2lNQmuCyr4JbyyfPD48u
	D1MTyvZlPH299z/seSrWyF/xBrWXdBWYtOR19u+sD0Yj8jJ0c4jhipLVdhkZsSKVVOBbVdIjezMT1
	utvKfTkFY6vIF6BsBSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8dS-00000007yLx-4Boy;
	Thu, 18 Dec 2025 07:41:19 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8dQ-00000007yLX-2DUL
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 07:41:17 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 15BB7340F3B;
	Thu, 18 Dec 2025 07:41:14 +0000 (UTC)
Date: Thu, 18 Dec 2025 15:41:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yao Zi <me@ziyao.cc>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 4/4] clk: spacemit: k3: add the clock tree
Message-ID: <20251218074110-GYB1943598@gentoo.org>
References: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
 <20251211-k3-clk-v1-4-8ee47c70c5bc@gentoo.org>
 <aTo8sCPpVM1o9PKX@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aTo8sCPpVM1o9PKX@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_234116_679101_71810DDE 
X-CRM114-Status: GOOD (  17.96  )
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

Hi Yao,

On 03:38 Thu 11 Dec     , Yao Zi wrote:
> On Thu, Dec 11, 2025 at 09:19:44AM +0800, Yixun Lan wrote:
> > Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> > blocks which are APBC, APBS, APMU, DCIU, MPUM.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/clk/spacemit/Kconfig     |    6 +
> >  drivers/clk/spacemit/Makefile    |   11 +-
> >  drivers/clk/spacemit/ccu-k3.c    | 1641 ++++++++++++++++++++++++++++++++++++++
> >  include/soc/spacemit/ccu.h       |   18 +
> >  include/soc/spacemit/k1-syscon.h |   12 +-
> >  include/soc/spacemit/k3-syscon.h |  273 +++++++
> >  6 files changed, 1947 insertions(+), 14 deletions(-)
> 
...
> > +
> > +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> > +}
> 
> This piece of code looks quiet similar to types/functions with the same
> names in ccu-k1.c. If I'm correct, could we separate the logic into a
> new file and avoid duplication?
> 
make sense, will do

> 
> k3_ccu_probe looks quote similar to k1_ccu_probe, too. The only
> difference is that k3_ccu_probe checks for spacemit,k3-pll instead of
> spacemit,k1-pll.
> 
> We could share most of the probe code by writing a SoC-independent probe
> function,
> 
> 	int spacemit_ccu_probe(struct platform_dev *pdev,
> 			       const char *pll_compatible);
> 
> and calling it in ccu-k1.c and ccu-k3.c with different pll_compatible.
> 
ditto

thanks
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
