Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CF3C19F32
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gs7+KWWI+COzVbDGcoPIj7KvyK1e+DE2Lp8pNg4kYLI=; b=Y6E6aHwAcPxEWx
	o+RPgn+VFctVEAtOHHYOFg3NbQSFYZ47+os1bRHTXPXZvkiX0kqSR8CBjP7+rG4uD4HXkj7pqRhxa
	Hf9gCBNQVBwM0oEJ/FrrkxSgwTnH67uh6wDyCMwyaPKww4ATnJPIQmX7sPK/JYPc2DkYWDvudFGx0
	a/NtQVqUXS9hMVWivWUz6E5jIn0VT/pahKLO48jJPWLA0pfUyfyQdOVKx8QOvMumnDpqW2HPsT7++
	x0S8lP4autsWMDBtAgOuYVi1MMy+yfaCZQ1ip2XxFodzfH2bFFlneZM6n3gjjz++6MP88QIO9qA3+
	9W9VJZSUYpMyEY5qqWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqT2k-0000000DYum-0vuy;
	Fri, 07 Mar 2025 08:26:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqT2h-0000000DYuM-3i3q
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 08:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B4BD5C5432;
	Fri,  7 Mar 2025 08:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78902C4CED1;
	Fri,  7 Mar 2025 08:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741336010;
	bh=4g4KFVEllHF9Fzyk30OF0hRqc9JoCbYtjKmWSqDx7uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUy9Ewf3tVuuvEuoi4JjxRnHfFDBBZ8agqsMeht/L3IHHDfmSNPi0UcsbLnezXZxm
	 gICDgiLTQMxGAwN2+xp1MhFsfCf5CnUY6LOjVJEHwxiKwbN8zbNrNTLCLSqt61c2wD
	 PF9YNGMMQ4DILHADeaTzVndOBQuO82CVSjjF4UJf6U6fmYzN53Hki4xhfMIbEKFs/X
	 BPR8yGXVrX6vXPSeSeDKo7eVscXnAgDTJ7d3DvqQlBkPSoU3bE1MsU9vh9ba0gMUqF
	 CWkvb8SPDaPFJb4sHYjPfNqslI17euLFM9qRWgBokn7/9AlaM0N6Aw8LQRhw806TZs
	 KrlUrV+tyxZmQ==
Date: Fri, 7 Mar 2025 09:26:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Yixun Lan <dlan@gentoo.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <20250307-impossible-fine-panther-38c66b@krzk-bin>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
 <20250307005149-GYA66361@gentoo>
 <Z8qVOssDHaVDQmLY@ketchup>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8qVOssDHaVDQmLY@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_002651_986149_2077A85B 
X-CRM114-Status: GOOD (  15.12  )
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

On Fri, Mar 07, 2025 at 06:42:02AM +0000, Haylen Chu wrote:
> > > +static int k1_ccu_probe(struct platform_device *pdev)
> > > +{
> > > +	struct regmap *base_regmap, *lock_regmap = NULL;
> > > +	struct device *dev = &pdev->dev;
> > > +	int ret;
> > > +
> > > +	base_regmap = device_node_to_regmap(dev->of_node);
> > > +	if (IS_ERR(base_regmap))
> > > +		return dev_err_probe(dev, PTR_ERR(base_regmap),
> > > +				     "failed to get regmap\n");
> > > +
> > > +	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> > ..
> > > +		struct device_node *mpmu = of_parse_phandle(dev->of_node,
> > > +							    "spacemit,mpmu", 0);
> > > +		if (!mpmu)
> > > +			return dev_err_probe(dev, -ENODEV,
> > > +					     "Cannot parse MPMU region\n");
> > > +
> > > +		lock_regmap = device_node_to_regmap(mpmu);
> > > +		of_node_put(mpmu);
> > > +
> > you can simplify above with syscon_regmap_lookup_by_phandle(), which
> > would save a few lines
> > 
> > or further, just call syscon_regmap_lookup_by_compatible()? then
> > won't be necessary to introduce the "spacemit,mpmu" property..
> > 
> 
> These syscon_* functions differ a little from device_node_to_regmap():
> they get and enable the first item in "clocks" property when
> instantiating a regmap, which isn't desired for a clock controller.

Yes. And mpmu is not a syscon, so it would be inaccurate or even wrong
API to use.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
