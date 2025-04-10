Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C25C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 04:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFkUWNKN2TcXa0KR5ptDWWeqL528+LSvz8LeYGrzBTo=; b=E6Fw0adhlWCMJN
	N+rCv2wxrogZNQUJjaT/jpJGxV8grnFSUWzDG79ZVPwly3sKpRn9Y2Gvzbq7nvu/QiSnajJJttk6I
	JD5J/vV0ZeT/XVcSUUmBaoJnWj9lQ1dM+BY7mfU9mBNFp34rIorL5CWOT5TRcHpkMqsd7YDc1GIy0
	XcAxutXMWdSfeCRHrkFH42mWnyHB5mfXhPPSVhdTPsHYR+FXgj91cAd0gqkPz++D+zXAw6TeqOlQm
	2m4zvgLfaxMlf0aMld04FY9H1xcJaZfTinYbJUJg6NUCWUH5RpdUImHirxNIZQ8bvj0KMb1EyYk1I
	mSsyNI4bMfo4FbwTGOYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2jHE-00000009BnW-3NyB;
	Thu, 10 Apr 2025 04:12:32 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2jHB-00000009Bmr-40fo
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 04:12:31 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id C899C12FB451;
	Wed, 09 Apr 2025 21:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744258348; bh=vpU0jqyzYggE9pqYkka5SOv7jl7U8aHC+OFdlFP+Mus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCWABpiESCZwmNdguKYrROd+srKJ6YMfrJrbZTm0uKb8zOxUw2TXWYOL9D5fB1/gx
	 g2DTOAGxD3TKSnglhXv5CWVNmChorZRMrhB7kXKz9asGah0uwdA9+7xnsMvRjAssj5
	 GMmaKGZlLpVW4xsH4z8DxzwxJbUtJkSz6be3es9tPkOGT1Zvm11hZx7iaE5yNGPfcE
	 CP/oQXwDdLjrH4KG1LTeJZDGkVMIfXTPO0+GgoxwA1oonn35WMUfrRnQ4xeVJ7ZBj8
	 ic1BeQ2kN1gDqk4q5H5w1btSkWm0F4mS0HOP4+VrVt92atiBuk2aZh67d1RU3yvr0s
	 R5vWuvn1EhGTg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CSmZvWc90vW; Wed,  9 Apr 2025 21:12:25 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id AAACE12FB430;
	Wed, 09 Apr 2025 21:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744258345; bh=vpU0jqyzYggE9pqYkka5SOv7jl7U8aHC+OFdlFP+Mus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBc7TJQ6LNgmZMi0U0v3CO6KLvvq1xjvWdg6L+o+h0WboloJpHGJi+QZUr8BbXHVK
	 hqmVbmedYMqMGQd8mNz+SwYnZMFW31lcviw5g2ABrC21uY52PWyhYzb8AkOsfDUAP5
	 ZAfsIU4xWyDZiFioL3DP6boikHFqnl24hf7Q46qaGXX+2uOKycHxDEnPKXpVvQxLtp
	 IN2+DwEqtcWegErlM83Di6BluBZhaOByUXmGZ8Wg+WqFiVLoVJy1gymZuZM54Bcea8
	 tWyyXn+pEAx107Wq48guANSAiPW8KjYhKzg/nhaICsIbfJmGbi/rNTQt3dRm603YeZ
	 h8JHrHFstcz6w==
Date: Thu, 10 Apr 2025 04:12:17 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 6/6] riscv: defconfig: enable clock controller unit
 support for SpacemiT K1
Message-ID: <Z_dFIavJT9_KwT1O@ketchup>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-7-heylenay@4d2.org>
 <e2c5c2c2-61a8-458d-8e95-521c5ea752f9@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2c5c2c2-61a8-458d-8e95-521c5ea752f9@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_211230_247414_A8E97A91 
X-CRM114-Status: GOOD (  15.45  )
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

On Tue, Apr 08, 2025 at 02:37:35PM -0500, Alex Elder wrote:
> On 4/1/25 12:24 PM, Haylen Chu wrote:
> > Clock controller unit, or CCU, generates various clocks frequency for
> > peripherals integrated in SpacemiT K1 SoC and is essential for normal
> > operation. Let's enable it in defconfig.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >   arch/riscv/configs/defconfig | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 0f7dcbe3c45b..011788d16d93 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -252,6 +252,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
> >   CONFIG_CLK_SOPHGO_SG2042_PLL=y
> >   CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
> >   CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
> > +CONFIG_SPACEMIT_CCU=y
> > +CONFIG_SPACEMIT_K1_CCU=y
> 
> Maybe these could be specified with default values that
> are based on the value of CONFIG_ARCH_SPACEMIT instead of
> forcing them to be defined here?

As mentioned by Inochi earlier[1], putting defaults configuration in
defconfig instead through a "default" kconfig property is the preference
of clk subsystem, so I'd like to follow.

> 					-Alex
> 
> >   CONFIG_SUN8I_DE2_CCU=m
> >   CONFIG_SUN50I_IOMMU=y
> >   CONFIG_RPMSG_CHAR=y
> 

Regards,
Haylen Chu

[1] https://lore.kernel.org/all/xwo2jjqy634z4rimgyrbjmxlgzxzauxmqzl57qr5oasph74qwj@7we45fnhwfzh/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
