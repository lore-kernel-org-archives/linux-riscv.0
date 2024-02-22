Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D873C5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 19:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTT5ZzERuPRhoOm7jJ0vNb3Ht2KuPzdpg9o8oy6FbIM=; b=sTs2prQWuYgJX/
	gxTFfpZNLGjfT+Xxbok4o+3MUOvHVneFBhG4UNrfOXZppekdFhHn01CT1UgZWaPAyf/UCenO/jHwU
	jdfWXHjRLZgO7pf1KQcAFEpeawl/TvuaoUPz1P744rGdB5EX8o7TYVKCj2cX6sCeKFgmHXZyZ1KLI
	LkfTI32xsAsWRItc8VXgI7VbpFp24wVpEQlSYLyzPBbKJ6+vx7muSaXpoEBOo+JEzsxNDOyX/qj8Z
	Rg8VjDMts09BcAyOB+WrGBRO2z9w3diOQbJcuydidw9RVK4dHN2fzO0ZpfbKz7YUeIZr//CA8he7b
	4yyhYimH4CPw3/ZeGC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdEsF-00000006MCP-0VEt;
	Thu, 22 Feb 2024 19:36:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdEsB-00000006MBh-3rJD;
	Thu, 22 Feb 2024 19:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2BF93CE28B7;
	Thu, 22 Feb 2024 19:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34538C433C7;
	Thu, 22 Feb 2024 19:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708630605;
	bh=mimHLt883XdmFq/Wm0Rkx9D2WOF046CaBE6YY7gWH2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYUx/u7h25KDz8BfvyXWk5Tf63l5gzlGdWG7C8XiqHsI/6yue9cwssXR2nNZpWIwB
	 ExHMi7J9oCrTc+zR5MvO7AqoROap7Bo2JakJWx7x73uMKGtt0R2yH7O5a+iGZylPta
	 o4ptRFQjzoCDnLwqO18dAUhqBssmsY6Ousd0f/N7j+7ESSZDAHzxUAXvuBzE5l3oaS
	 yf2h+ncRZi+LXA/JGwkGqGPE3wwjhpK15Qt/057a7JfmYENTiPTrIVS7kgUvmQn2Sr
	 eTH2GFDoJCX7AIKDXzp0kJl+Q6+Q/xjum7G3dPR1zC8WhPm5O/J1+COxDVPliGM/uP
	 m5Lm4TY1NcDJQ==
Date: Thu, 22 Feb 2024 13:36:42 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Eric Lin <eric.lin@sifive.com>, Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/6] dt-bindings: cache: Document the
 sifive,perfmon-counters property
Message-ID: <20240222193642.GA3713418-robh@kernel.org>
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
 <20240216000837.1868917-2-samuel.holland@sifive.com>
 <eeb2331d-10e6-4902-91ba-85896a8f0ee1@linaro.org>
 <72221da1-4a1a-4947-a202-9de203032f5c@sifive.com>
 <6ac4005b-01e6-48c2-971e-d6a127134d13@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ac4005b-01e6-48c2-971e-d6a127134d13@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_113648_337349_597D429E 
X-CRM114-Status: GOOD (  22.95  )
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

On Sun, Feb 18, 2024 at 07:35:35PM +0100, Krzysztof Kozlowski wrote:
> On 18/02/2024 16:29, Samuel Holland wrote:
> > Hi Krzysztof,
> > 
> > On 2024-02-17 3:00 AM, Krzysztof Kozlowski wrote:
> >> On 16/02/2024 01:08, Samuel Holland wrote:
> >>> The SiFive Composable Cache controller contains an optional PMU with a
> >>> configurable number of event counters. Document a property which
> >>
> >> Configurable in what context? By chip designers or by OS? Why this
> >> cannot be deduced from the compatible?
> > 
> > This parameter is configurable by the chip designers.
> > 
> > The information certainly can be deduced from the SoC-specific compatible
> > string, but doing so makes the driver only work on that specific list of SoCs.
> 
> Usually that's exactly what's expected, so why here usual approach is wrong?
> 
> > When provided via a property, the driver can work without changes on any SoC
> > that uses this IP block. (None of the SoCs currently listed in the binding
> 
> Sorry, properties are not a work-around for missing compatibles.
> 
> > contain a PMU, so there is no backward compatibility concern with adding the new
> > property.)
> > 
> > My understanding of the purpose of the SoC-specific compatible string is to
> > handle eventualities (silicon bugs, integration quirks, etc.), not to
> > intentionally limit the driver to a narrow list of hardware.
> 
> Depends what is the hardware. For most of licensed blocks, the final
> design is the hardware so equals to its compatible.

While I generally agree, I think a property is fine here for 2 reasons. 

This is going to vary on just about every design. That's true for any 
PMU. So maybe this shouldn't even be SiFfive specific.

The second is counters available to the OS may not equal the number in 
h/w because counters could be reserved for different priviledge levels 
(secure, hypervisor, guest, etc.). No idea if Risc-V supports this, but 
if not it is a matter of time. That's more likely for a core PMU than an 
uncore PMU.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
