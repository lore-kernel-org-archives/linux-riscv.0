Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570C5C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 06:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWAxifK/t2AGRIoURev17y9Lml2DuEBbTzedJG1t5O4=; b=ZC4aWBzYClXi3b
	LTBD6IXX2L31N7pjh32fQKbZwdPMatBCqCl7Xd1V58VmaZ+ShkdTWh1QZD+cseRB9NUbSHHamR7jb
	pGhU0wY3LfVkDookZh4USPIAtSeecg+uvqH/JnbvGivbDnsCY2grAcbc93EEEzMo1f51RsXbrtCKW
	AHUFX0QCBKmXQEsDpqoTPa8RUgl5I2Bt64XVaZ+x7BbY7JhsTrwYO7ceKiwNwdb8ZLujKEKTAbiKM
	06r4X075NxMZnSVpFH4a/DKhYUz8+ttCB/9JuAdqdlekWfEl0JQURjis4l2xWsBlGhSI1KRS694f0
	eKEh1QmdQGociw8vK6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPcjD-0000000F5Db-1grv;
	Fri, 05 Jul 2024 06:47:31 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPcjB-0000000F5D8-0Moa
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 06:47:30 +0000
Date: Fri, 5 Jul 2024 06:47:21 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Meng Zhang <zhangmeng.kevin@spacemit.com>
Subject: Re: [PATCH v3 06/11] dt-bindings: serial: 8250: Add SpacemiT K1 uart
 compatible
Message-ID: <20240705064721.GB3042186@ofsar>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
 <20240703-k1-01-basic-dt-v3-6-12f73b47461e@gentoo.org>
 <ZoarsYMNJRu1-_wn@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZoarsYMNJRu1-_wn@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_234729_204629_CE3795E9 
X-CRM114-Status: GOOD (  21.56  )
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


On 22:03 Thu 04 Jul     , Jisheng Zhang wrote:
> On Wed, Jul 03, 2024 at 02:55:09PM +0000, Yixun Lan wrote:
> > Found SpacemiT's K1 uart controller is compatible with
> > Intel's Xscale uart, but it's still worth to introduce a new compatible.
> 
> Per vendor's kernel source code, all the uarts support 64Bytes FIFO.
> So if it's compatible with Xscale, it's a xscale uart 64 Bytes FIFO.
yes, I agree

further question would how to implement specific support for spacemit's k1 SoC
one possible option to add a PORT_SPACEMIT compatible data to 8250_port.c - uart_config[]


> >From this PoV, the uart isn't a Xscale but a mrvl pxa.
see my previous comment, probably need further clarification/investigation..

> 
> But I have one question: is the uart really a mrvl/intel pxa uart? or is just
No, I'm unable to answer this, I'm not an employee of SpacemiT
All informations are based on public available source + docs..

> reg programming compatible with pxa?
> 
To my knowledge, it's compatible with pxa, but it would be great that vendor can clarify this

> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  Documentation/devicetree/bindings/serial/8250.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
> > index 692aa05500fd5..0bde2379e8647 100644
> > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > @@ -111,7 +111,9 @@ properties:
> >                - mediatek,mt7623-btif
> >            - const: mediatek,mtk-btif
> >        - items:
> > -          - const: mrvl,mmp-uart
> > +          - enum:
> > +              - mrvl,mmp-uart
> > +              - spacemit,k1-uart
> >            - const: intel,xscale-uart
> >        - items:
> >            - enum:
> > 
> > -- 
> > 2.45.2
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
