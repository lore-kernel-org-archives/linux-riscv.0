Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ECACCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PpWnVSxKraKcXgSE7kaVpgT/W+LgiGZEP7OCxfDfw8=; b=AmSX5R3SYGZSSb
	DcUiNvicQrPTbuxJIebRTTZK6hu4pPEkMCNw1KBTXXf5Llt7VVF4xRckxDlMwsWufqdmQUwaXUuBT
	WPdJm/rUFRkyayyDevHHtfDd/5OQc22JNBnLcpStQBOAH8IuZAIKCP+VWBOZ0FIwpkgBxMGunVkva
	2AQ7Pt35B+nGoLUGJemmQ7QsBHMloMOs1uwqLrzqyO/5AERVDBMRT9pT7aqx/sQX6w87L1tqO1WCr
	mFp+Y0ioYqa8pd9NnCM25lkKskPGrTycEqnLMN9zlypQxb1ePrx2UoQAc5kNfJq6ZO3zktkP+LEo0
	vAVYRXhHYYC5ZIt0ejGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7sV-00000001kR4-1U24;
	Wed, 29 Oct 2025 15:14:23 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7sS-00000001kPg-2DPi
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 15:14:22 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2726D25746;
	Wed, 29 Oct 2025 16:14:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8G9h0oREbF2K; Wed, 29 Oct 2025 16:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761750854; bh=Un1263Y3t/Nka3u0iyTUOo72BpVIJVxFmdi8tdLbhK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dXiPVvjG4PegWw59QZbcyAN4cY6mmMlz60Ip2wVjreAYmKclVc1RyCIJb5+6vG7tL
	 o2dysstrnuIRKHOhSFr7yQDsJ44TlLI7GXJpF4nz5PgdAo4SDKRVWwD1WK+ud+AHhz
	 O9sPOnKqe3xEiyyHh7ls+AJPdhSpeX5wjLf3SgQYYiEo3MZDpG4I01rKjvkTi7Bey1
	 Yi3NxDzRpr2YwcdfmmwMADUgMNu3Y2F7bxuHrRKSZ/HPUkZyj2EKvZRo7hfK7Mzqva
	 MEbMHhbMJsRhJljA99pCaPv5JOzXPOlUXB9CqXYCot0e5Y8lWJS+qlPLco4X72B86d
	 yiedeL0ygHJdA==
Date: Wed, 29 Oct 2025 15:13:46 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH v3 3/5] reset: th1520: Prepare for supporting multiple
 controllers
Message-ID: <aQIvH4jbj9Ifd7Av@pie>
References: <20251014131032.49616-1-ziyao@disroot.org>
 <20251014131032.49616-4-ziyao@disroot.org>
 <aQIOgbUf2IHoWCf2@gen8>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQIOgbUf2IHoWCf2@gen8>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_081420_993618_8D687669 
X-CRM114-Status: GOOD (  20.52  )
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

On Wed, Oct 29, 2025 at 12:54:25PM +0000, Drew Fustini wrote:
> On Tue, Oct 14, 2025 at 01:10:30PM +0000, Yao Zi wrote:
> > TH1520 SoC is divided into several subsystems, shipping distinct reset
> > controllers with similar control logic. Let's make reset signal mapping
> > a data structure specific to one compatible to prepare for introduction
> > of more reset controllers in the future.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/reset/reset-th1520.c | 42 +++++++++++++++++++++++++-----------
> >  1 file changed, 30 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
> > index 14d964a9c6b6..2b65a95ed021 100644
> > --- a/drivers/reset/reset-th1520.c
> > +++ b/drivers/reset/reset-th1520.c
> [snip]
> > @@ -138,22 +147,31 @@ static int th1520_reset_probe(struct platform_device *pdev)
> >  	if (IS_ERR(priv->map))
> >  		return PTR_ERR(priv->map);
> >  
> > -	/* Initialize GPU resets to asserted state */
> > -	ret = regmap_update_bits(priv->map, TH1520_GPU_RST_CFG,
> > -				 TH1520_GPU_RST_CFG_MASK, 0);
> > -	if (ret)
> > -		return ret;
> > +	if (of_device_is_compatible(dev->of_node, "thead,th1520-reset")) {
> 
> Is there a reason that there is a now a conditional check for the
> compatible here?

Yes, this regmap operation is for initializing GPU resets and thus
modifies TH1520_GPU_RST_CFG, which only applies for the VO reset
controller (with compatible "thead,th1520-reset") but not others, or
other unrelated resets could be unexpectedly asserted.

> Thanks,
> Drew

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
