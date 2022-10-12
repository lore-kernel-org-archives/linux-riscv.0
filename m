Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE20C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5Key1W7onTjxLcydCmtMegUgr+nbkpU49E/rMsWBtY=; b=4ZgXdUGpzkpLJw
	KMCucOW8EBbnHuKfD+npqQNNmomp5gjRlZsCtl+J2RHq5uvrTLB5kFn4nwVACpssbibs1XQOh/gdr
	0UtLMv3pnQzXSnn+hQ1xMy/jHujuuQBsYkysmFHlN448qqMspiJWiKdSSPU8yI9ne7sZu6n6jnDpr
	YgRQ9Qfm5Oix7IT060E0USYLfFzhKM0ij7w7FYuwJH1e81Q741drPE2EwIhJ/alKeB4q6AXHFl608
	eXQZKBkX6Ecv9YF+gpT19jnFAwGwCviEGZ2T6S2NC6VJQ7zVm1D+rkwktbDDqEw3LaNpFqfmfnpa6
	RbVaP8PzLcDPZI5GAEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oicMa-008Jgc-7b; Wed, 12 Oct 2022 14:05:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oicMX-008JgF-5L
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 14:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665583532; x=1697119532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YqIauvraatao1KA8yPWOhmJyrNRczVNaBMKcZve1xvY=;
  b=ZcMtshpZcYN1gyU3KpFNRbnI6yEGYUMgd/s3mjbgPtwRuSjObw3DkRxN
   FMchBudgXDm+Q6RStOqEhA4bsCIJ7/CmQsINkb+HbWsGPDuc5nATMe1cL
   iCRagqm8QW6KL5vCXk0GRbS/p+zC41o9Sae66KDwzyALaQFW36teENKHR
   gBjWlLgzChde9ZwSy5VCwaRQ3WMPXwVC7y8ar0Bz7Mx6htqXLTxcMndxH
   FialBlNwwzTvspyXMy9vwqSF94IsUWDs83c+HciefAcmCGGyotDYcl2oG
   OM4LqD8ymiMmAOoK63TWrpH8Isk8mwpydcBFG2TVuHfEWXxndwS3AkPyL
   A==;
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; 
   d="scan'208";a="195051104"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Oct 2022 07:05:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 12 Oct 2022 07:05:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 12 Oct 2022 07:05:26 -0700
Date: Wed, 12 Oct 2022 15:05:04 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hal Feng
	<hal.feng@linux.starfivetech.com>
CC: Hal Feng <hal.feng@linux.starfivetech.com>, Rob Herring <robh@kernel.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Emil
 Renner Berthing <kernel@esmil.dk>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 12/30] dt-bindings: reset: Add starfive,jh7110-reset
 bindings
Message-ID: <Y0bJkGQklX+eOGyW@wendy>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929175147.19749-1-hal.feng@linux.starfivetech.com>
 <20220929184349.GA2551443-robh@kernel.org>
 <8BEAFAD2C4CE6E4A+0a00376c-1e3e-f597-bcf6-106ff294859a@linux.starfivetech.com>
 <2f1d1afd-3c97-6ce0-8247-6e1c4a24e548@linaro.org>
 <4769BE3503398017+b1699221-ccc9-a0c1-0b11-141ce9644d74@linux.starfivetech.com>
 <9f04267d-2592-b303-9b79-9cef672c970a@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f04267d-2592-b303-9b79-9cef672c970a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_070533_245283_3524514D 
X-CRM114-Status: GOOD (  16.29  )
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

Hey Hal Feng,

On Wed, Oct 12, 2022 at 09:33:42AM -0400, Krzysztof Kozlowski wrote:
> >>> These two properties are the key differences among different reset controllers.
> >>
> >> Different as in different compatibles? Please answer the questions..> 
> >>> There are five memory regions for clock and reset in StarFive JH7110 SoC. They
> >>> are "syscrg", "aoncrg", "stgcrg", "ispcrg" and "voutcrg". Each memory region
> >>> has different reset ASSERT/STATUS register offset and different number of reset
> >>> signals. 
> >>
> >> Then these are not exactly the same devices, so using one compatible for
> >> them does not look correct.
> > 
> > One compatible can just be matched by one device? I think this is what
> > confuses me.
> 
> I don't understand the question.

If two SoCs have exactly the same device/peripheral then they _can_ use
the same compatible. If they share some common, viable feature-set then
one can "fall back" to the other depending on what your Venn diagram of
common features looks like. I've not been following this too closely,
but I think what Krzysztof is suggesting is that you have a jh7100 and
a jh7110 compatible. Then in your driver you just "know" that if you
match against jh7110 which values to use for register offsets & vice
versa for a match against the jh7100. There's many examples over the
tree for how to handle this sort of thing rather than including it in
the devicetree.

Maybe Rob and Krzysztof will scream at me for this description, but
devicetree is about how periperhals etc are connected together in the
system not about the internals of a given peripheral.

Following that logic, the devicetree should not contain register offsets
etc that are a known quanitity once you've determined that you are running
on vendor,soc-foo.

Hopefully that helps with your confusion somewhat?
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
