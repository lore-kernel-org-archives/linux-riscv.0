Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282F4C19F32
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWRPBz5GyHK9DD3NyUcKQQmm9/VD6CvyueXwyRxUSUQ=; b=rt4IxpEb59/5Jt
	7Q6WUROVB1+96Py6wMhTY+ejKwkcg2TdZzAsxSoBOchZ86DkZamzuISFSoHI3gGb6NCe8rpj9eUCn
	0qw/UB9swpholco0Qsw2K54T3EZGbXKseK3ATZ8lmu4ZzRufoPu3ZkAcZqLbW/9GTDAdIKSJ0LHyY
	3QjrdM/vVztXSz1UmpWEmgMtLnOy3neAW4GWILws82LDRHJMI7sj0bfMfeGbDsUGNOeodA2t/t9nx
	CDD+KXc80CThspyNzra/P/SEUXADFDaFvBIx4ji/oH99Tk+pHxAHivlMtTjsDOq0B3ngw/kxxWaul
	Zgqrv2RiieHUr+kizqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSwe-0000000DY9p-49Ko;
	Fri, 07 Mar 2025 08:20:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSwc-0000000DY8m-27xJ
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 08:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D29B05C53D0;
	Fri,  7 Mar 2025 08:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2A3C4CED1;
	Fri,  7 Mar 2025 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741335633;
	bh=oVm6oRCCgzBMQKbkDLj8w69l734KJkAdES1OKCD4igk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/Mz7WNUDOZ1u5k0Wuo5/k21xfyiEhb/Cjpfb27pbxbYX1EbvCHMAplOU3mkboTUZ
	 2XMVL+8aOp05AdPnRfld+3CH6QgZqctsozW7o2Jf3tV9QF0kvlmZadAaqjPhMiwjPS
	 Nl4TEfepZbaPrq+kHW+gXnXDDKQh9CfmlXR16NPvrMI2Yt3TjkrkdR6BDL+PES94Sv
	 yXW0cG5V7Yjdobw9AvBqgFPE41ipjurPpmCBrSshGI1cNL2JKYQhX4o6zjqdKKD6RX
	 kYoYwiG5jZ9r6EHt1yrzis5Yql/ypJLoC4/QSIAM0F0LPMou5shfp6UDZ4dtPubwlR
	 WgwN+bAnFwPdQ==
Date: Fri, 7 Mar 2025 09:20:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Yixun Lan <dlan@gentoo.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: clock: spacemit: Add spacemit,k1-pll
Message-ID: <20250307-juicy-grasshopper-of-enthusiasm-9bfb15@krzk-bin>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-4-heylenay@4d2.org>
 <20250307002943-GYA64516@gentoo>
 <Z8qTh1zRJTjYNCtz@ketchup>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8qTh1zRJTjYNCtz@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_002034_602598_4CE40FCD 
X-CRM114-Status: UNSURE (   8.42  )
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

On Fri, Mar 07, 2025 at 06:34:47AM +0000, Haylen Chu wrote:
> > > +properties:
> > > +  compatible:
> > > +    const: spacemit,k1-pll
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description: External 24MHz oscillator
> > > +
> > > +  spacemit,mpmu:
> > how about naming it as "spacemit,mpmu-syscon" explicitly?
> > to indicate this is a syscon phandle, it's more readable
> 
> It's okay but I'm not sure whether this helps a lot... will wait for the
> maintainer to decide the name.

Can mpmu be not a syscon phandle? And what exactly means "syscon" here
that it brings additional information?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
