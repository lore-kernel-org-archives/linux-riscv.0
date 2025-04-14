Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DDAC369BB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 22:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b44HWsTL65QufZYV3ywp6EifpDNVQRYAyMYkkTr/6ZA=; b=Hg+vAss3gEqvKc
	+kFg3fDXaD8n+iFl7jfJ2AkM/rBFH8/Fm/OskUrvQ16cGWUEAFLWhSLAigSRQZSPU5TvgsCHcR+Fn
	3IxEfsA9YdVgiYb2+JfayI3xTZ9kAUnBO5QH2CrwYqQiwqVQa4VTIFCqfNCHQkpqTu0VfgRlS4uG6
	UPanNIuNDmIjydQvqeNAF4GNdpXMo8e7JZzFdDDZvUBASXbjWZfHCXlmUOxGs6TuzA4G4HWDjm8++
	2JM+tmim3Og/faUvyo3HP6jF2STS58VnU5EJyy+/0EELv29MndDG61n2FCPHKceuRomsVsrAgxgBI
	Fnqx4iP30B5hebxVcHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Rxv-00000003g4y-3wQe;
	Mon, 14 Apr 2025 22:07:43 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Raa-00000003b1X-33w5
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 21:43:37 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2307934306C;
	Mon, 14 Apr 2025 21:43:34 +0000 (UTC)
Date: Mon, 14 Apr 2025 21:43:30 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v7 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <20250414214330-GYA29591@gentoo>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-5-heylenay@4d2.org>
 <b557a075-a184-4234-9793-ca1d13eac9df@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b557a075-a184-4234-9793-ca1d13eac9df@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144336_785824_3F1BF133 
X-CRM114-Status: GOOD (  11.90  )
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

On 13:12 Mon 14 Apr     , Alex Elder wrote:
> On 4/12/25 2:44 AM, Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and has control registers split into several multifunction
> > devices: APBS (PLLs), MPMU, APBC and APMU.
> > 
> > All register operations are done through regmap to ensure atomiciy
> 
> s/atomiciy/atomicity/
> 
> I think Yixun can tweak that for you.
> 
sure, I will take care of it..
(if there is no more iteration)

> > between concurrent operations of clock driver and reset,
> > power-domain driver that will be introduced in the future.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 
> This looks good to me!
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
thanks
-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
