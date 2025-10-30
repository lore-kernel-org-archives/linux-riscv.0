Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CCDCCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 12:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/A/eQwX9v+u/VwgG+qKrCoi1u7i5UFi7LrT0LS7n1g=; b=OKJf31hsI7iSbW
	4hw5AJE6bf0SrK5pLQ+yFsGUh5XiSUa+GbsP2/Jce0WWPsZT7zTvo4psN6XcXnFi0rSEI/ansqbMF
	pFRCSsQrolg5oBOgYRqvbT/auDggAZ0ddMwYD2QxAKKtr99Sncs6GUr5LF53y9nDEbx7fHC/gXMAN
	+hf0J7vzAXXiITI4EwA0zuxpgFD21tZqFVF0X4mPQnpqU/g5QFbsOyC7cYhHTRdQau2D7x5Mziw4w
	o87HG/k+H4Q6mko5xzuVsKWLjGT1ZJaZ3uyli4LA4t9mEXeAsIsS3iMr11PsrWtIHCnYgWedflcJa
	1Jp6EYwTPoVySMNeNKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERbY-000000046R2-3CnJ;
	Thu, 30 Oct 2025 12:18:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERbU-000000046QP-1Aj3
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 12:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 002FB423BD;
	Thu, 30 Oct 2025 12:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDE6C4CEF1;
	Thu, 30 Oct 2025 12:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761826686;
	bh=c/5NhRaDMZ/kbf4ALWp9C3bkG4NzH2gCZR2gh2BS+5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eqwvNwZ6OXvD0PLLo9oKFlOauS0KB9w85q0SZ3Xda7sQevCZ+PF82wJOLsJwYVa8J
	 1876w8uLPUw/grmthVZBX1OwHBWnWfh/zmDlS2ZyeNUGt17A6GXXqYHgyC01Wg4nP9
	 lyC1pnN2cdKNa069kddROOPKTXz8sdfvgbqsp2K5m5AbGGI5cMnoBqIk7nkTXWGD7B
	 qHg3KdbmcIwJKg+nCcKhbU70mhjWFFaHX+gynoFm2YmmwmXNcwEZLAY7PdGfXh+Brl
	 udhaAHnl3jScbhaAQdPhAsXaix37XODTzGa5lfTJa6icjLK7SVb1kCjZgZhgvxT/XD
	 pzVl8j7N89Y0w==
Date: Thu, 30 Oct 2025 12:17:58 +0000
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
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
Message-ID: <aQNXdmH_sA6hgOKC@gen8>
References: <20251014131032.49616-1-ziyao@disroot.org>
 <20251014131032.49616-4-ziyao@disroot.org>
 <aQIOgbUf2IHoWCf2@gen8>
 <aQIvH4jbj9Ifd7Av@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQIvH4jbj9Ifd7Av@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_051808_799145_C6A79731 
X-CRM114-Status: GOOD (  21.82  )
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

On Wed, Oct 29, 2025 at 03:13:46PM +0000, Yao Zi wrote:
> On Wed, Oct 29, 2025 at 12:54:25PM +0000, Drew Fustini wrote:
> > On Tue, Oct 14, 2025 at 01:10:30PM +0000, Yao Zi wrote:
> > > TH1520 SoC is divided into several subsystems, shipping distinct reset
> > > controllers with similar control logic. Let's make reset signal mapping
> > > a data structure specific to one compatible to prepare for introduction
> > > of more reset controllers in the future.
> > > 
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > >  drivers/reset/reset-th1520.c | 42 +++++++++++++++++++++++++-----------
> > >  1 file changed, 30 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
> > > index 14d964a9c6b6..2b65a95ed021 100644
> > > --- a/drivers/reset/reset-th1520.c
> > > +++ b/drivers/reset/reset-th1520.c
> > [snip]
> > > @@ -138,22 +147,31 @@ static int th1520_reset_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(priv->map))
> > >  		return PTR_ERR(priv->map);
> > >  
> > > -	/* Initialize GPU resets to asserted state */
> > > -	ret = regmap_update_bits(priv->map, TH1520_GPU_RST_CFG,
> > > -				 TH1520_GPU_RST_CFG_MASK, 0);
> > > -	if (ret)
> > > -		return ret;
> > > +	if (of_device_is_compatible(dev->of_node, "thead,th1520-reset")) {
> > 
> > Is there a reason that there is a now a conditional check for the
> > compatible here?
> 
> Yes, this regmap operation is for initializing GPU resets and thus
> modifies TH1520_GPU_RST_CFG, which only applies for the VO reset
> controller (with compatible "thead,th1520-reset") but not others, or
> other unrelated resets could be unexpectedly asserted.

Thanks for the explanation.

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
