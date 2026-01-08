Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7665D14893
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIjahXgxnoRgwakX9y8BMWtrvAzaQPk2j9R3zi5e4R8=; b=gDisVxmiMAsEbz
	sUSN85+ZlUcOYCX57El/VFyhvzNmeeq/46z/HLgLP9HV1YGLK/Il5Q8XB72+3QDYVcWFWF8BKGPsB
	v8eQsAE+/qd1Jsz+BsGjAklRbgC4P3F8/Nu+ubTJ12EQhP1PJCDj04t73AWaoVl1eVBmN/TAiBuQ3
	S4eyciCLYCNBSqtyI0fdjuVv+yPxcrOigj1lK2nZvyoWPAuVcGz3Px6cqrdrEgwCwnZ4Brwdu+Q+n
	p6rP+CGabOOh8ygmjRy/PZ1/Cm4YhAz0mEV7zM8Ry/uFt4jFw2MRnh/Y6MJAGv8xiJVRnYz52BXJr
	C5q1wXl/JStkx+qhKrrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdhcv-0000000FuV5-0Dbf;
	Thu, 08 Jan 2026 04:28:01 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdhct-0000000FuUi-1VPd
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 04:28:00 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 76CDF341E9C;
	Thu, 08 Jan 2026 04:27:57 +0000 (UTC)
Date: Thu, 8 Jan 2026 12:27:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <20260108042753-GYA2796@gentoo.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <20251227-pastel-certain-orca-4b53cf@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-pastel-certain-orca-4b53cf@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_202759_531880_BBF9A5EC 
X-CRM114-Status: GOOD (  13.99  )
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

Hi Troy, Krzysztof, 

On 14:00 Sat 27 Dec     , Krzysztof Kozlowski wrote:
> On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> > IO domain power control registers are used to configure the operating
> > voltage of dual-voltage GPIO banks. By default, these registers are
> > configured for 3.3V operation. As a result, even when a GPIO bank is
> > externally supplied with 1.8V, the internal logic continues to
> > operate in the 3.3V domain, which may lead to functional failures.
> > 
..
> > +	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
> > +	if (IS_ERR(pctrl->io_pd_reg))
> > +		return PTR_ERR(pctrl->io_pd_reg);
> > +
> > +	pctrl->regmap_apbc =
> > +		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
> > +						     &pctrl->regmap_apbc_offset);
> > +
> > +	if (IS_ERR(pctrl->regmap_apbc))
> > +		return dev_err_probe(dev, PTR_ERR(pctrl->regmap_apbc),
> > +				     "failed to get syscon\n");
> 
> Actual ABI break.
> 
Indeed, there will be a ABI break.

so, how about not abort in probe() if no "spacemit,apbc" phandle found?
and then do it in a compatible way as old behevior

We may still need to drop this property from "required" section in DT

> Best regards,
> Krzysztof
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
