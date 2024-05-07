Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ED6C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 19:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfA47Pq7b4vbQ8IxlXeHEvD5kkE3CMPX54podD+We+I=; b=s53LC09gDq+H26
	gpLhqW2qHhiVB3Plue+DBpORcK+084j6Dv8ITPEmp5B5sG3jRZ77ziJBP3RzHJaAIZVi2e7vjYr7T
	d6pyTnl/GDMB+EdC3HyULl4kfWigQkOV45k3CdMDmrgSFkVbAUBILEjYT/n9Mfo//qSVlFhcDCPS2
	TDPzxjhEwzzyKBCTiwtDN7Q6TPrus3d312dtEIk/EYy14Tm2cCN97uHkOczZFfPQ8vGc5qDIczh/g
	Z7TnZa2rAsqvCALRtvDUZSh+ghYUjVMAgzjw67/eTqA4dC2M9/f+0d7BEYbzZIqsYxJCRIudru303
	NJOD95zOJgTZy/5yjNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QB2-0000000CVML-45R8;
	Tue, 07 May 2024 19:08:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QAz-0000000CVLF-2PWY;
	Tue, 07 May 2024 19:08:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C31F0CE11B8;
	Tue,  7 May 2024 19:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C717BC2BBFC;
	Tue,  7 May 2024 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715108911;
	bh=Z+Gs4K1iFlTKEsI/ZJ2cPV1zHuwnpGQ6xDGnZ/DD6bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJTeUt+vJycbfnEVNS1ZdMopYgv8iosNhuG2fz/gb1xJymTpq+6OzvzQZrTsYtAOK
	 LVn7kECHrDAeg6B0+vBuyuXqdw2diKiI+yQyLsqflS8Oj0EdjeLM//yoH+n4LahIWX
	 ZCOf33/p5o5gYo4sqmlu+KWU+6t7ihgu7/ttIGAEUnUp3O+/U92f29lpdQ3OhF9jtt
	 RaB4IYnzF3RYyKv5UrBjJOd4tN8u//NTAdiYXLDw4CiJKUxKOGsClT+QIa99BGdle1
	 k9SIwsUGxBEoAcqpoy97EZqTZFbqhh8iHvIeVZyJhy1ltRPZBUWZnnnoWVE+6Oc96g
	 PiOjnKd4xIGLw==
Date: Tue, 7 May 2024 14:08:29 -0500
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <20240507190829.GA880949-robh@kernel.org>
References: <IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953612130BFC78A8E92F6C5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <595f76bf-5e89-4027-87e5-ff316c699669@kernel.org>
 <IA1PR20MB4953FC99B680A3040D4CB611BB1C2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953FC99B680A3040D4CB611BB1C2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_120834_086168_AEBAE277 
X-CRM114-Status: GOOD (  24.94  )
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

On Mon, May 06, 2024 at 08:17:30PM +0800, Inochi Amaoto wrote:
> On Mon, May 06, 2024 at 08:51:59AM GMT, Krzysztof Kozlowski wrote:
> > On 05/05/2024 03:52, Inochi Amaoto wrote:
> > > The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> > > "VBUS_DET" to get the right operation mode. If this pin is not
> > > connected, it only supports setting the mode manually.
> > > 
> > > Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
> > 
> > ...
> > 
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: phy
> > > +      - const: app
> > > +      - const: stb
> > > +      - const: lpm
> > > +
> > > +  vbus_det-gpios:
> > 
> > No underscores.
> > 
> 
> Thanks.
> 
> > > +    description: GPIO to the USB OTG VBUS detect pin. This should not be
> > > +      defined if vbus_det pin and switch pin are connected, which may
> > > +      break the VBUS detection.
> > 
> > Why is this property of the PHY? VBUS pin goes to the connector, doesn't
> > it? It looks like you combined two or three (!!!) bindings into one.
> > 
> 
> Yes, but I am not sure which is the best to write this bindings.
> The topology of USB likes this:
> 
> controller -- phy -- switch --> (host) port/hub
>                             --> (device) port
> 
> The vbus-detect connect to the device port, but it will change the mode for
> both phy and switch. And the switch is just a switching circuit.
> I am pretty confused on how to split this binding. I think it may like the 
> following:
> 
> phy {
> 	switch {
> 		/* This is the switch in the follows */
> 		connector1 {
> 			/* host port */
> 		};
> 		connector2 {
> 			/* device port*/
> 			/* the vbus pin is here */
> 		};
> 	};
> };
> 
> Could you share some suggestion on this?

Something like the above assuming 2 physical connectors, but probably 
should be a child of the USB controller or on its own. PHYs usually 
aren't put into a parent/child hierarchy, but are out of band.

Is this switch implemented on the board level? If so, you should create 
something that would work on any platform with a GPIO controlled USB 
switch like this. 

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
