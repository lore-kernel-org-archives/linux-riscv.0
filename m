Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986E1C27C6E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 06:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQqydIyG6l6q4kznqw9Db4K5K4ZLEVwnHbF2/hLmRJc=; b=EoSIxHH/1o2eJj
	FN4wNqMckzsFx0Iu3Ykc9NFJjePAde2qr8TP+hCpA1j6ygiFwrOkL4Qt47DufOnmAn/lHPPQvrAUC
	WBqY4pb5AqUb8ZVYnWnGO8KXgtHaxalyZLiuNHgf1jHEUtxaYtuix4igqtVAhiJtnuhEf+JtWTnoF
	3jllXivXA7SBYXVSNNmLW6oPRZzFqPGhJ2FHidLDhh5mcjp/54IFZSzilZV2oRwKutw5wSsrRbxfV
	hp1Td73QrNLfTi83o2v14MCtbc1Qe+qU0HQHz/87ALmCuh7LWIiuE1vGzr3Ok3VwTTRkSogzDjFiv
	GR8CrDEG4qDLP9M6EAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5SQ-00000009HjW-07cc;
	Mon, 17 Jun 2024 06:03:10 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5SM-00000009Hiq-3RXp
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 06:03:08 +0000
Date: Mon, 17 Jun 2024 06:02:50 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 7/9] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <20240617060250.GA4068816@ofsar>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_701082E2DAE48E2FB857316321778D737C08@qq.com>
 <20240616225314.GA3988639@ofsar>
 <tencent_6863DCC298D59097467C3E0641106D0D4707@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_6863DCC298D59097467C3E0641106D0D4707@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_230306_982424_BE6B18E2 
X-CRM114-Status: GOOD (  16.57  )
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

Hi Yangyu

On 10:10 Mon 17 Jun     , Yangyu Chen wrote:
> 
> 
> > On Jun 17, 2024, at 06:53, Yixun Lan <dlan@gentoo.org> wrote:
> > 
> > On 01:20 Mon 17 Jun     , Yangyu Chen wrote:
> >> Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> >> 
> > .. snip
> >> + uart0: serial@d4017000 {
> >> + compatible = "intel,xscale-uart";
> > are you sure the uart IP is fully compatible with xscale?
> > otherwise I'd suggest to introduce a vendor specific one..
> > 
> 
> Sounds like a good idea. I will add it soon.
> 
> >> + reg = <0x0 0xd4017000 0x0 0x100>;
> >> + interrupts = <42>;
> >> + clock-frequency = <14000000>;
> >> + reg-shift = <2>;
> >> + reg-io-width = <4>;
> >> + status = "disabled";
> >> + };
> >> + };
> >> +};
> > it's better to also add other uart nodes, I feel it's more complete
> > 
> 
> I should test it before adding them. However, if I remember correctly,
> there is only one UART on BPI-F3.
I'm not talking about BPI-F3 specifically, but from the SoC perspective
you can check vendor's dts file of k1-x.dtsi, there are uart0-uart9(uart1 is
missing)..

> 
> > -- 
> > Yixun Lan (dlan)
> > Gentoo Linux Developer
> > GPG Key ID AABEFD55

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
