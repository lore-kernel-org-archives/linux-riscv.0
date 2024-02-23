Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FFFC47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hr09TcQaLBaihWK9ig23y7jUVvNiM+INF6YSjpOVvp0=; b=xsw8SuBhHop4zn
	/LrexLlN+hJkpSPq2PRMNw1RFyeKM7GfSw0hcl4RNSPu3Z+2xUBbUteBsgqGqQ3dQxxu8L0DRczJd
	BFmDWcUZOA2AUiZHyE1kNdiiL4vuRfLX+WCm52/aq8IMQqMBAJTaCUicCH9hdvgS5OVj8gycWOtcO
	SzkbpbrZJBrSRH+8PmY5HyocWwgjvU9RLTORQ9v+HmIBo6d/s1t+PCtCZ8WeYi7Dgxi/wWYEWn4EZ
	7WyhWQAMsfWnu1HXCJ1PGhqHZobaFEUFvejHV0Nnd3SAZmwYWvuUs6GOvZM1rQe3y098Tiw2jlTdV
	aOeQNY8hDCNLeEvhusXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJNF-000000079sN-3oBw;
	Fri, 23 Feb 2024 00:25:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJMu-000000079p8-0I6S
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71DC261348;
	Fri, 23 Feb 2024 00:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F619C433C7;
	Fri, 23 Feb 2024 00:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708647887;
	bh=6RQYh1c+2WGB747k5Q8GGgtAQbYiwufgRsISUMvWeQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzHm2f57w8oQ2CKM9OBagrwZLTrD/zFgJ4JyVHlKPWO7vG6JD5bPJ+V4ArEaOdbyg
	 g55eElDLh8+jCDJIrQdkzYfyeU15LGZk+un8e1MufskvuEmF0zGYZOoIVxbvdnIHL3
	 hNFph744wKpQzIEszSlMJALrD6ZIrDHo06Sx+VkWneFq8paQjxGNBXBAtyIpdecsmf
	 6VrQFclphPwRR4h9C3JsqeeltI5YpWw+bsib9axBuWFi/TDBsET+mmFsGMZEeqbb6I
	 TFASGZSvtjh1zJflNpr2PSHrDqYNiDrqrF4HYvi38csYMuRaq+pltiBTZBzl2R+mkk
	 XMmyR2Zll5IZA==
Date: Thu, 22 Feb 2024 17:24:43 -0700
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Alex Soo <yuklin.soo@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH v2 1/6] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
Message-ID: <20240223002443.GA3877354-robh@kernel.org>
References: <20240220064246.467216-1-yuklin.soo@starfivetech.com>
 <20240220064246.467216-2-yuklin.soo@starfivetech.com>
 <1a11cee2-2ef1-4ce0-8cc1-63c6cc97863f@linaro.org>
 <20240220-bottling-reverence-e0ee08f48ccc@spud>
 <cafccf8d-b8f7-44cb-bc41-3c7a908fd1e4@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cafccf8d-b8f7-44cb-bc41-3c7a908fd1e4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_162453_498094_04630F10 
X-CRM114-Status: GOOD (  17.27  )
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

On Wed, Feb 21, 2024 at 08:24:26AM +0100, Krzysztof Kozlowski wrote:
> On 20/02/2024 20:10, Conor Dooley wrote:
> > On Tue, Feb 20, 2024 at 09:11:43AM +0100, Krzysztof Kozlowski wrote:
> >> On 20/02/2024 07:42, Alex Soo wrote:
> >>> Add documentation and header file for JH8100 pinctrl driver.
> >>>
> >>> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> >>> ---
> >>
> >>
> >> RFC? Why isn't this patch ready for review?
> > 
> > The TL;DR is that Emil and I didn't want to apply the dts patches to
> > support a platform that hadn't actually been taped out yet. 
> > For an SoC in that state, at least the bindings for, clock and pinctrl
> > could be subject to changes before tapeou. I think putting RFC on those
> > patches is a good idea, but of course the rationale should be mentioned.
> 
> That would be useful information. We also could mark some bindings
> unstable and accept breaking ABI under certain conditions, like that it
> is early work without users for long time.

The challenge with that is when do things get marked stable? No one has 
any motivation to do that (unless users complain). For example, We have 
a couple of platforms that have an unstable bindings statement that has 
been there "forever".

I would like a solution though. The only idea I have is passing 
SystemReady cert, but that's an Arm thing.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
