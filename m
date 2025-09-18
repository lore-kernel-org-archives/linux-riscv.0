Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CB9CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKneA3LPKT/1MXgqa6IJtJTYMgVB+K2cnB6JF/rH/DM=; b=L64ABm0GBqtqOi
	FpNWp7XiKFyiuCYKKLnyRW8APGyMVF+YZ4Kg9bXd7B1Reod+RkMgTuMEfs5Gvh8Kp0w9KD3ruwKI+
	qD1IP9LJgZH27yMeqmt7OTEtIBP1Hit82xbdUYJYhVCSpI06Id4Q4ZeBHOFB8S88CQkJ75IiE7DcG
	Mx9PkSQ5STBHAawDJ4/9jM7I76exbk9xmcu7yzDAun2Cc1Ej96dJpK+rfNPubUbjWFu83Cy32esex
	wyBfAjuY4BeNw3pu3E4oQAcvifgYibilTSxrkExY4sZe2I3tNBRHeC5KzCOHlPctH+FIzM+gvN+/W
	iX5tKqu2v+peKOP9ynMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9Jx-0000000GaH6-3NZR;
	Thu, 18 Sep 2025 07:44:49 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9Ju-0000000GaCZ-2mHe
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 07:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758181418;
	bh=fKIhYdZo0gbuLJoLY01IaGGDghYLeBAKJXGGD1WoNs4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=lQ5R+OFT5MufPI+DsRqXbxo4lmoOugWOwnv3uLEDkGeKmpsDSwhelcatAEHS4msrl
	 S4ZHBEcJrfSOCuvU7dSunwHfE7Mcryb3yLhAO3M1jNtZq0Yq+11c/R5HIKepgs3kC+
	 HYqJG/f+Y7X0i0mJqiQBdveHGFlZBxGWxioGZCrs=
X-QQ-mid: esmtpsz11t1758181409t25a73e83
X-QQ-Originating-IP: TBFWLYNJiVsLazlBh4iNqndLkAwUI57Zz+YC92McJmE=
Received: from = ( [120.239.196.247])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Sep 2025 15:43:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8956593677624534324
EX-QQ-RecipientCnt: 17
Date: Thu, 18 Sep 2025 15:43:27 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Message-ID: <D2A109C6A8BDED08+aMu4H4xap2GSP50w@LT-Guozexi>
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
 <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
 <20250918001632-GYA1270371@gentoo.org>
 <f7e12797-ea17-4e92-bd25-cc562c66d2a7@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7e12797-ea17-4e92-bd25-cc562c66d2a7@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N3IC8um5pMyYh9hNCJhfVMgQzafTi66x7ya2/T3wzdUewhjfc1OAztkM
	tIRCcQMR2rSrteZ3Oc36tJ/zxmpnE5p7p04Hk4xSksEObthnpA3l9A0kLPduujAWKui3KAN
	shfpfMmRQnXiNEKIh0NaQiLAKjwBp7NB2s3A935HOqUNhdB0mu/3VM/O4+gMLa9UxAwVCjn
	ZCckIu1XKoejlseCJvPk/j4MhzKSQB/gMfm0CEUiYYQBM9q0gZUKbztDQz8G7yoOiNhhw01
	+d0m9JP+eM4G+JesT6tzMuXb05ELwnWW1fkBD6OcafZt7Dxe5tJjG7izZ+dq1wXDXe5I1PQ
	0jmMZAGkGqmbzvSOeDR0vhICAaYN/oiXgbhR0/vUl4wwQe9BBcY21w9vefSPHGBl9T4Z1bT
	dq4SY0djEa/3mcdir5+IT2K+hmtNgpyYpBGAuCtiZZ6+ZZN4zxfBUDKqHS9iZ02n+/d8D42
	hCu39Q9oKFHsMfAoevwulqT/2qpXH2hGUgCBzr1rh9vvYo7HK1iN6iCpdRinHwTsQ8CfrDZ
	TChdygCQBcdCBrwKyOQ0DFaczDQtIgSz6/RLcjtGV0RXYeuJcIlU5IlqRmP6dhhDxK9RJap
	qeP7r1CtQSP/uzmHV/ZVhhezovrqhtSPiYDz7oP/EfJMLDpTpGT2YltLraiUC9s+WogEkpI
	86KXuHvhjZ4C9Bw6P/J76Twc1Acv93FEpu85nUA5KpM57Hq7OZukCNIuy9RL7Y7yDnYgPtx
	NafO1JKORGKGgSD728DJlpPUG3IBBGPBeRtX3rv6ekspP7ZKK3TL9gTbC2KyEiEgb7qMZmO
	dZTBinxL39HKArkc9bP16ICrxFIuclaK2S1g67idHwYAgBI5YndbAbjVgOCrKmSY9ogf0C3
	2TD26NdGvLqa+cpKJH0f5Uqj2XKHtwONK9/mj4xT9SBhpcZ4vjwIFdl4GLQU2hsDN7yAwaH
	DQIE4fhbqsIXhnvh+kGtJAHtNe5QUq9wTDofhdRJwcB3wQUKXog5/y5F60N9ZohUT19iJgz
	Ou6mv+IRs7ckp/gId5+QZ/96MaaSK95DaAGI6k7aTWh+85OVNaPeHjw4qrnXA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_004447_155169_8433EA60 
X-CRM114-Status: GOOD (  38.39  )
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

On Wed, Sep 17, 2025 at 09:59:35PM -0500, Alex Elder wrote:
> On 9/17/25 7:16 PM, Yixun Lan wrote:
> > Hi Alex,
> > 
> > On 18:40 Wed 17 Sep     , Alex Elder wrote:
> > > On 9/17/25 6:15 PM, Yixun Lan wrote:
> > > > Hi Alex,
> > > > 
> > > > On 17:07 Wed 17 Sep     , Alex Elder wrote:
> > > > > Add support for the SPI controller implemented by the SpacemiT K1 SoC.
> > > > > 
> > > > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > > > ---
> > > > >    .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
> > > > >    1 file changed, 94 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> > > > > new file mode 100644
> > > > > index 0000000000000..5abd4fe268da9
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> > ..
> > > > > +
> > > > > +  spacemit,k1-ssp-id:
> > > > > +    description: SPI controller number
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > could you explain a little bit why this vendor specific property should
> > > > be introduced? I took a look at the code, and didn't get the reason
> > > > behind.. or what's the problem of simply using "pdev->id"?
> > > 
> > > This property was carried over from the vendor code.  It is
> > inherit from vendor code isn't a valid reason
> > 
> > > optional, and if it isn't specified, the platform device ID (-1)
> > > will be used.  It's just intended to provide a well-defined ID
> > > for a particular SPI controller.
> > > 
> > while looking at the code, it seems you can use alias to map specific id
> > to the spi controller, it even can do non-linear map, something like
> > 	spi0 = &spi3;
> I've never used this before, but yes, it looks like it's exactly
> what I want.  I'll just get rid of the "spacemit,k1-ssp-id" DT
> property entirely.  Easy.
> 
> > plese check of_alias_get_id()
> > 
> > note, I haven't actually verified on board, just look through the code
This is the right API that Alex what to use.
I have verified it in i2c driver.

                - Troy

> > 
> > > > we should really be careful to introduce vendor specific property..
> > > 
> > > If there were a standard way of doing this I'd love to use it.
> 
> Looks like you have told me the standard way of doing this.
> 
> Thank you.
> 
> 					-Alex
> 
> > > 
> > > And if it isn't necessary, please just explain to me why.  I
> > > have no problem removing it.
> > > 
> > on the opposite, please have explicit good reason to introduce vendor
> > speifici property, and if there is generic way, then we shouldn't do it
> > 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
