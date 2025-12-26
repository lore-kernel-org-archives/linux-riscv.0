Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819E1E8FDA2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekjPW1mwk6D8U+q/S4GJz+D4hJJ1JJkobP0Q1bNQKZk=; b=C7c1/3md6TNJ53
	93Ce0LZSWqgA3F2E3PnjZtGiXruRVHm+4V3fq967rPnLv6Cv5bRTKUbaHB3hQRhaRblzILy8G8VXY
	bQto2JNmHEJYDqNUK4c84ebWuWpo3GimfUNJPB8qhwVc6neW7xzLf/A5nHwe+sslGuPc4E1NnppB8
	+DcFMz3JUZBH8zP76CsMsY1O/feL2FDCXgjtbQTGRcag/TwEEgT2EPxjpm5Zzr/8/BwVVeCpcgLqy
	QtlCAbrig7JBJ8jBTSUoTlof4fZD4RVbVc1CFCjNoacZ9u9XsUwTCM0n8nMlCcRW1hTZXfHQ7/I2E
	2kZM7qhbCf8cKLmCzOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ6lz-00000001AeL-0PLf;
	Fri, 26 Dec 2025 12:18:23 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ6lv-00000001Ady-3TlQ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 12:18:21 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E0D16341F62;
	Fri, 26 Dec 2025 12:18:17 +0000 (UTC)
Date: Fri, 26 Dec 2025 20:18:12 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yao Zi <me@ziyao.cc>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] clk: spacemit: k3: add the clock tree
Message-ID: <20251226121812-GYA2007514@gentoo.org>
References: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
 <20251226-k3-clk-v3-5-602ce93bb6c3@gentoo.org>
 <aU50DIe9qMneb0GT@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aU50DIe9qMneb0GT@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_041819_952476_562E2307 
X-CRM114-Status: GOOD (  23.12  )
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

On 11:39 Fri 26 Dec     , Yao Zi wrote:
> On Fri, Dec 26, 2025 at 07:01:20PM +0800, Yixun Lan wrote:
> > Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> > blocks which are APBC, APBS, APMU, DCIU, MPUM.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/clk/spacemit/Kconfig      |    6 +
> >  drivers/clk/spacemit/Makefile     |    3 +
> >  drivers/clk/spacemit/ccu-k3.c     | 1482 +++++++++++++++++++++++++++++++++++++
> >  drivers/clk/spacemit/ccu_common.c |    3 +-
> >  4 files changed, 1493 insertions(+), 1 deletion(-)
> 
> ...
> 
> > diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
> > index f1a837aafb46..5132f73be68d 100644
> > --- a/drivers/clk/spacemit/ccu_common.c
> > +++ b/drivers/clk/spacemit/ccu_common.c
> > @@ -144,7 +144,8 @@ int spacemit_ccu_probe(struct platform_device *pdev)
> >  	 * are in APBS region. Reference to MPMU syscon is required to check PLL
> >  	 * status.
> >  	 */
> > -	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> > +	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll") ||
> > +		of_device_is_compatible(dev->of_node, "spacemit,k3-pll")) {
> 
> To me it's better to add a argument to spacemit_ccu_probe to specify the
> compatible of PLL, so we don't need to modify ccu_common.c each time a
> new SoC is introduced, and the condition won't be pretty long in the
> future.
Adding extra argument will break {struct platform_driver}.probe() prototype

I can think of creating a sepecific helper function for each driver to
hide the change, but still will bring extra cost, something will like:
 k1_ccu_probe(pdev) -> spacemit_ccu_probe(pdev, compatible)

> 
> It isn't a serious issue for now, and I think this piece of code is
> acceptable.
right, I'd be reluctant to do the change

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
