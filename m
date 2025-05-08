Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E6CC3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBPztiwX2YkBmxkCQYfQsKtlMOKyOqXQ3Y4T2eHiEgI=; b=gvZ1snNMpiPcEk
	Sk8i27Co1WvMwNB3b/OR3uhEF2PVBWZHtjmlh9s3c9ppfixfR4uIoJSJZQzlTvS3BYs8ONQMV/Icc
	nfWsZZ4fdUhfLEbrjI/qPxZZo8I9ZoNcZ6OI3MPkutPTAip0fZ4f6H1HS5Yzpx1vHUgni2I64aRmS
	tc2dVCYpOIybaXbmTN0duFSaRhVdS1dKObiEfvmVQgEfbcLxwTomCn/3auhvvQtipVJJBuYGYUI41
	L4T6fYJaVzsmiFoqVBg2PUo9BqZas6KixhQZFsqJZa7Va8KqbsAaX9tIHJM5Z7bA7jqQF4P0B3n75
	RGP2bYU/yoF3aVFRsJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0fj-00000000f04-12tJ;
	Thu, 08 May 2025 12:48:19 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Yk-00000000dl2-3XqW
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 12:41:07 +0000
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 09AA4342FA1;
	Thu, 08 May 2025 12:41:04 +0000 (UTC)
Date: Thu, 8 May 2025 12:40:59 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: define
 spacemit,k1-ccu resets
Message-ID: <20250508124059-GYA506797@gentoo>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-2-elder@riscstar.com>
 <20250507223554-GYA505240@gentoo>
 <22b7b5fc-6f5a-4ce8-ae12-a7423925c113@kernel.org>
 <1521c828-31f3-4e45-a651-750ce2e37364@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1521c828-31f3-4e45-a651-750ce2e37364@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_054106_926988_0C15BB84 
X-CRM114-Status: GOOD (  23.08  )
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

Hi Alex,

On 07:17 Thu 08 May     , Alex Elder wrote:
> On 5/8/25 7:02 AM, Krzysztof Kozlowski wrote:
> > On 08/05/2025 00:35, Yixun Lan wrote:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - spacemit,k1-syscon-apbc
> >>> +              - spacemit,k1-syscon-apmu
> >>> +              - spacemit,k1-syscon-mpmu
> >>> +    then:
> >>> +      required:
> >>> +        - clocks
> >>> +        - clock-names
> >>> +        - "#clock-cells"
> >>>   
> >>>   additionalProperties: false
> >>>   
> >>> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
> >>> index 35968ae982466..f5965dda3b905 100644
> >>> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
> >>> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
> >> would it be better to move all reset definition to its dedicated dir?
> >> which like: include/dt-bindings/reset/spacemit,k1-syscon.h?
> > 
> > Please kindly trim the replies from unnecessary context. It makes it
> > much easier to find new content.
> > 
> > 
> > I don't get why such comments are appearing so late - at v6. There was
> > nothing from you about this in v1, v2 and v3, which finally got reviewed.
> 
> Stephen Boyd said "please rework this to use the auxiliary driver
> framework" on version 5 of the series; it was otherwise "done" at
> that point.
> 
> Doing this meant there was a much clearer separation of the clock
> definitions from the reset definitions.  And Yixun's suggestion
> came from viewing things in that context.
> 
> Given the rework, I considered sending this as v1 of a new series
> but did not.
> 
> > I just feel people wait for maintainers to review and only after they
> > will add their 2 cents of nitpicks or even some more important things
> > potentially invalidating the review. Lesson for me: do not review
> > people's work before it reaches v10, right?
> 
> That's not what happened here--or at least, it's not as simple
> as that.  Your quick review was very much appreciated.
> 
> Yixun:  Krzysztof was satisfied with things the way they're
> defined here.  Do you feel strongly I should make your suggested
> change?  Or are you OK with me just keeping things defined this
> way for the next version?  I'd like this question resolved before
> I send the next version.
> 

I was fine with squashing all definitions in one file for old version,
but now, a new reset driver is introduced, I think it is deemed an
independent header file? all newly added macros are related to reset.

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
