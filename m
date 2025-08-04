Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D42DC87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+J7Gonr+awjWgSGcbVA9lKx2su5iR3jyo75phH3Goa8=; b=RSdjRU+sTLDFwm
	k/u1DHXrVpo2DFpdGp1iuCLoYo2v7BW2OCcOua94T7/nv/UUINHn5rNnhaF34u+0UpjPwysY1j+GI
	3Y7fgdhFJct7x7uIJWBHdFzX1rVOYaiq5kicMb1nhOBmRxQo5T6RmUbWdir5+9K28n4m3DLQJtWg2
	dSN+DqHTNVzTNp2Tl+oQpirTDWS572Ua2HpDtEj7AsdcGDoVJY8ZLYs37BPN711UqsVkTo6aQzZCA
	n2K+NJWlk6DGKEW5Fw86NsbuAoIw+4/Yu88ywTxKRYlk/sez7I6yt9XIa1WpChZseIswnEW4RwfJs
	UtW2pXHKPMGQ50AaWd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiy1a-0000000AyZH-12Ih;
	Mon, 04 Aug 2025 16:26:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixxn-0000000AyDY-43tu
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 16:23:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE660601FD;
	Mon,  4 Aug 2025 16:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46125C4CEE7;
	Mon,  4 Aug 2025 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754324582;
	bh=pyi3WTqynredpH+/oouhiz4DXT7XbOBYQrKL8dXYwvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCvaLeHppq3GFNrqaQ6sQMa83jMh0jdCzPgWD1zWGcDVoaVu7OP6Bk/CnCtYojWC6
	 KiUfvkN8CKhRMUdeLNKJlMcssccOX8s1rZHgaPgsZDyts/dfr/Ru4RQrttbax9Qp/C
	 eoGbHjwj5n8sH5d4aodA+7RJ8sBk5OGLDdCiJPy5hK4ufvXB82gLKPQUy3QyIkqAMm
	 8Si36B0ucDhVy2X5AgDG0Yi2L/AL2Q4N/+fmArReC1XqfitwxDFGZyj61EqKxFZVdb
	 Ej+IrwCS4uS9/MU1zKQV8Oi5EbDknImKEphRUzd/eK6XflOeTaH7ZMNqZ6lAnmq7EY
	 FaKqT/iceob5A==
Date: Mon, 4 Aug 2025 09:23:00 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/3] net: stmmac: thead: Get and enable APB clock
 on initialization
Message-ID: <aJDeZJrKkqH23V/V@x1>
References: <20250801091240.46114-1-ziyao@disroot.org>
 <20250801091240.46114-3-ziyao@disroot.org>
 <20250803170206.GA525144-robh@kernel.org>
 <aJBBOptU4IXilK3I@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJBBOptU4IXilK3I@pie>
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

On Mon, Aug 04, 2025 at 05:12:26AM +0000, Yao Zi wrote:
> On Sun, Aug 03, 2025 at 12:02:06PM -0500, Rob Herring wrote:
> > On Fri, Aug 01, 2025 at 09:12:39AM +0000, Yao Zi wrote:
> > > It's necessary to adjust the MAC TX clock when the linkspeed changes,
> > > but it's noted such adjustment always fails on TH1520 SoC, and reading
> > > back from APB glue registers that control clock generation results in
> > > garbage, causing broken link.
> > > 
> > > With some testing, it's found a clock must be ungated for access to APB
> > > glue registers. Without any consumer, the clock is automatically
> > > disabled during late kernel startup. Let's get and enable it if it's
> > > described in devicetree.
> > > 
> > > Fixes: 33a1a01e3afa ("net: stmmac: Add glue layer for T-HEAD TH1520 SoC")
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > > Tested-by: Drew Fustini <fustini@kernel.org>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > index c72ee759aae5..95096244a846 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > @@ -211,6 +211,7 @@ static int thead_dwmac_probe(struct platform_device *pdev)
> > >  	struct stmmac_resources stmmac_res;
> > >  	struct plat_stmmacenet_data *plat;
> > >  	struct thead_dwmac *dwmac;
> > > +	struct clk *apb_clk;
> > >  	void __iomem *apb;
> > >  	int ret;
> > >  
> > > @@ -224,6 +225,11 @@ static int thead_dwmac_probe(struct platform_device *pdev)
> > >  		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> > >  				     "dt configuration failed\n");
> > >  
> > > +	apb_clk = devm_clk_get_optional_enabled(&pdev->dev, "apb");
> > 
> > The description sounds like this should not be optional. The binding 
> > change also makes it not optional.
> 
> Yes, it shouldn't be. But using the non-optional API will cause the
> driver fails to probe with the old (problematic) devicetree, IOW, it
> breaks the ABI. Comparing to unusable ethernet, failing to adjust the
> link speed sounds a minor point to me.

I've just read Conor's comment in the v1 again: 

 Nah, introduce the warnings. If the clock is required for operation, it
 should be marked as such. You've made it optional in the driver, which
 is the important part (backwards compatible) and you've got the dts
 patch in the series.

Thus I think the argument I made in my reply to this thread is
incorrect and the driver should remain backwards compatible.

> Maybe we could add a comment to explain why optional API is used, or
> just use the non-optional one if such ABI breakages are acceptable --
> for which I'd like to wait for more opinions.

I think a comment in the code about why it uses the optional variant of
the function is a good idea.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
