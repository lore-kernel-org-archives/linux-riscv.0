Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE66CCAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 00:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwkrIaMXqOh2GnIGJR/V2wUxTC5C2i6vUCz4fCmHpBQ=; b=amq2KtSOLJylLr
	8b5L8gDMYsXrN5Abne6w2iQrjWpD8Q7BeHgjwg0fmBst62G2Bv7VKgmhLiMNT4mn87b1SblDGtyw0
	zvDDmVbRsljEg+q6GUKfBhrdA3vl3O0p4DZEBrNxtFJQGZCtCXcbqygAc6uBmw4sYHNm1lmw28iZ/
	aqCDsihOHKkOZo+8flE/ADm73nd/mB6Ds/GsamlsEFu6f6W/HkD01d4PIjRJ1Tui8gFZS6Xanx7xE
	EdWJsIzgvT4mHN40Uo1Sgpe/U3YMe7UFFQKi/gG/I0N/8wGHG2jwaIEVis1mU1IEqBabRSLEVZl/4
	CL7gFwpYBdG6Gf8YpkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2KH-0000000FkxA-3hR7;
	Thu, 18 Sep 2025 00:16:41 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2KF-0000000Fkvt-3nxO
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 00:16:41 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4A5493410AF;
	Thu, 18 Sep 2025 00:16:37 +0000 (UTC)
Date: Thu, 18 Sep 2025 08:16:32 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Message-ID: <20250918001632-GYA1270371@gentoo.org>
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
 <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_171639_971916_99B7A55A 
X-CRM114-Status: GOOD (  26.54  )
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

On 18:40 Wed 17 Sep     , Alex Elder wrote:
> On 9/17/25 6:15 PM, Yixun Lan wrote:
> > Hi Alex,
> > 
> > On 17:07 Wed 17 Sep     , Alex Elder wrote:
> >> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
> >>
> >> Signed-off-by: Alex Elder <elder@riscstar.com>
> >> ---
> >>   .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
> >>   1 file changed, 94 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> >> new file mode 100644
> >> index 0000000000000..5abd4fe268da9
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
..
> >> +
> >> +  spacemit,k1-ssp-id:
> >> +    description: SPI controller number
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> > could you explain a little bit why this vendor specific property should
> > be introduced? I took a look at the code, and didn't get the reason
> > behind.. or what's the problem of simply using "pdev->id"?
> 
> This property was carried over from the vendor code.  It is
inherit from vendor code isn't a valid reason

> optional, and if it isn't specified, the platform device ID (-1)
> will be used.  It's just intended to provide a well-defined ID
> for a particular SPI controller.
> 
while looking at the code, it seems you can use alias to map specific id
to the spi controller, it even can do non-linear map, something like
	spi0 = &spi3;

plese check of_alias_get_id()

note, I haven't actually verified on board, just look through the code

> > we should really be careful to introduce vendor specific property..
> 
> If there were a standard way of doing this I'd love to use it.
> 
> And if it isn't necessary, please just explain to me why.  I
> have no problem removing it.
> 
on the opposite, please have explicit good reason to introduce vendor
speifici property, and if there is generic way, then we shouldn't do it

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
