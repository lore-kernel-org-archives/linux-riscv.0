Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1650C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 21:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3mXTfZKT4D/uvVvdaouToeOSPug+CpB5VtuQCGfhAw=; b=AukGFK0Sxlth3J
	4IL/JsNrgldkZibZmfrTJaE4fw4oNO6amjo5wttMPiAj+cc3MLSYX2m1Qo12gETnhQWt2f0FsCTUI
	tRqNI8D3ddU7mxwQ1IrP3J8UYU2AVd5QtmYDtHpX7MA1wyBp7aqy6irml8D+me0ct4IF+wL99k1vm
	vAfETqPNkiE8kXdw2n1CIwQ00y8LJZyO+4SafdqCb5+WR4eVw5BygGyf/ZcI2Gd1sx2giwnPjZOlW
	j3IYRdSxjV2N43h12IXXidthX6Ws2oMOOaPskuyX4yIB91JUM8V444ghGxEVHTIhmJx7AfdDgGBEL
	Abu2T8zgEvRA/SjFi/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUD5a-008kBo-0p;
	Thu, 10 Aug 2023 21:21:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUD5W-008kAj-0e;
	Thu, 10 Aug 2023 21:20:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A40A1629FB;
	Thu, 10 Aug 2023 21:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64306C433C8;
	Thu, 10 Aug 2023 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691702457;
	bh=aTpruaCrN8EvcNDHyPLrwo7LwRpHf6ghS06t2onmua0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQBd3jojma44HVwAccg4LRHTT/59zulJtym26IzwXS1wlOY//9ssSpzDcUfpyZ9lr
	 ZuSQq56O7bKVoeXphfT6MWxcVQx//hCENtHI57ioJsOX52Bbswox6NSKwv23nzKri1
	 qGQp7wRtMVDK+565w5ISpAs/P75YXUEr/47nuFN6Ftx3lrmYpYbnSFrdJROIyDfSP3
	 LvqQDMli1mTrRgbde6+BpzecSMaFFG9CnjyV5yTojbNs2aDSDG+lNRIdMTABANTCaR
	 PeXnmiwmFFprXvxR/oO3RWlxwxbNTIeZX9UkXdK5RMqwgLwFcsKwfRxAA7jHSM/mQo
	 fX+FkfK3Kxfgg==
Received: (nullmailer pid 1209197 invoked by uid 1000);
	Thu, 10 Aug 2023 21:20:54 -0000
Date: Thu, 10 Aug 2023 15:20:54 -0600
From: Rob Herring <robh@kernel.org>
To: Aleksandr Shubin <privatesub2@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20230810212054.GA1207489-robh@kernel.org>
References: <20230810145443.1053387-1-privatesub2@gmail.com>
 <20230810145443.1053387-2-privatesub2@gmail.com>
 <169168449014.480213.11243622755862466051.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <169168449014.480213.11243622755862466051.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_142058_329958_8276AED2 
X-CRM114-Status: GOOD (  21.58  )
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
Cc: linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 10, 2023 at 10:21:30AM -0600, Rob Herring wrote:
> 
> On Thu, 10 Aug 2023 17:54:26 +0300, Aleksandr Shubin wrote:
> > Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> > controller witch is different from the previous pwm-sun4i.
> > 
> > The D1 and T113 are identical in terms of peripherals,
> > they differ only in the architecture of the CPU core, and
> > even share the majority of their DT. Because of that,
> > using the same compatible makes sense.
> > The R329 is a different SoC though, and should have
> > a different compatible string added, especially as there
> > is a difference in the number of channels.
> > 
> > D1 and T113s SoCs have one PWM controller with 8 channels.
> > R329 SoC has two PWM controllers in both power domains, one of
> > them has 9 channels (CPUX one) and the other has 6 (CPUS one).
> > 
> > Add a device tree binding for them.
> > 
> > Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> > ---
> >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 86 +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230810145443.1053387-2-privatesub2@gmail.com

The bot was having an issue. This can be ignored.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
