Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A0BCA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBW8rkUDUyi4lu/qaGX9mo3gUzVi857++voJRhdpUiY=; b=h/Y7eEf+e9esTT
	pRZJoWCYMQHkUtZu3OrK+mxaol5WJraZjMD7bpE+EWKEDpPfuZegdJDtuu3aCbGuKXGe/YDkoOe9E
	mmFjn8uVMZXFgOTBzXoilnnNlZqsdyJVRUFqp7rwqr71h1bkhhDdtoAMInQ7tXnQkpvBUexlnqmMT
	ANozQJzfd4VCIupjkI+yIbXwkkd1YDdofFGcqET6Aqi7hpl/w2wlwvQmGjZ9ucFvYrj6tt0Koon79
	BjW6tmm81zoubM8xDf0zObkEZPSLmvWVQtXFuo12jCbrYMPJLIV1HlzbtEaKkfUhD2WMaXioM1e2q
	KB5f1VW2eJjZza5ZML9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGBv-00000000GTF-1MN5;
	Thu, 18 Sep 2025 15:04:59 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGBt-00000000GSq-0WSN
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 15:04:58 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C2BEC34210A;
	Thu, 18 Sep 2025 15:04:55 +0000 (UTC)
Date: Thu, 18 Sep 2025 23:04:50 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
Message-ID: <20250918150450-GYD1274501@gentoo.org>
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
 <20250918133209-GYB1273705@gentoo.org>
 <5956e320-7cbb-4d9a-95a7-720cfa6b9654@riscstar.com>
 <20250918140633-GYA1274501@gentoo.org>
 <0053c0ca-340f-46fd-adb1-6af6928717ee@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0053c0ca-340f-46fd-adb1-6af6928717ee@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_080457_186966_19D43657 
X-CRM114-Status: GOOD (  16.07  )
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

On 09:20 Thu 18 Sep     , Alex Elder wrote:
> On 9/18/25 9:06 AM, Yixun Lan wrote:
> > Hi Alex,
> > 
> > On 08:51 Thu 18 Sep     , Alex Elder wrote:
> >> On 9/18/25 8:32 AM, Yixun Lan wrote:
> >>>> +			spi3: spi@d401c000 {
> >>>> +				compatible = "spacemit,k1-spi";
> >>>> +				reg = <0x0 0xd401c000 0x0 0x30>;
> >>>> +				#address-cells = <1>;
> >>>> +				#size-cells = <0>;
> >>>> +				clocks = <&syscon_apbc CLK_SSP3>,
> >>>> +					 <&syscon_apbc CLK_SSP3_BUS>;
> >>> ..
> >>>> +				clock-names = "core",
> >>>> +					      "bus";
> >>> can you simply put them together in one line? it's kind of tedious to split..
> >>
> >> Sure I can do that.  I've seen it both ways.
> >>
> > right, it's merely a coding style I want to enforce, to make it slightly consistent
> > 
> >>>> +				resets = <&syscon_apbc RESET_SSP3>;
> >>>> +				interrupts-extended = <&plic 55>;
> >>> why use interrupts-extended?
> >>
> >> Because it specifies both the controller and interrupt number
> >> explicitly.  Why *not* use interrupts-extended?
> >>
> > It's just unnecessary, the SPI node will fall back to find parent node's interrupt
> > which already specific as &plic, brings no benefits
> 
> The benefit it brings is that I don't have to search backward to
> see what the interrupt controller is.  I realize it's redundant
> but I do prefer interrupts-extended over just interrupts.
> 
although both should work fine, I do prefer simple "interrupts" version
for dts wide consistence, at least for SpacemiT

while reading Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
interrupts-extended is useful when there are multi interrupt parents, or need
to specific different one..

Yes, we have different opinion here, let's wait and see what DT maintainer think

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
