Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2462FF6E85
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 21:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hEr1Z/CwAx5kNhE/gEhHFHpFxH8zTLI05B9k8vwVvk=; b=m2V2iwenzzCvh6
	aDwQ8Nf9MEjDFwODdHpZiCoUZZWmp+F+08jVXRizs+gxZ5qKDYdn2UIvlp1EwVgDk9pWQOHBuZZrx
	aJDFXHyTzFr8Zp7acQHjiF/siWXTHJiBfvAjYr2XgPoRHExjnkbVXwY1zT7pR2LsNiT8rurrZGwDS
	4iGkITBurAIawYnES9L5Qn04XL0lrkwL2uAP5cBwSKuqyy6UfYejuDT9unVyvVNskGmUCjjAmZjOM
	pcMsdL6PAYATucQeeWZk39lEi3+sMNojkL4vyaRxCk6DJg5IJ+tTHT5WsIY42LkN4L1VuxNtsXmI1
	PTTZ3AHNPjAZx4RMhtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2cDQ-00000007Gsa-0cEi;
	Tue, 17 Mar 2026 21:44:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2cDO-00000007Gru-0Ypj
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 21:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E57343504;
	Tue, 17 Mar 2026 21:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F6BC4CEF7;
	Tue, 17 Mar 2026 21:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773783877;
	bh=YnJxAqY3yVW0rBxCTAK9ZMy9uB7s9ePxLZFBfN6k5Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CTiOJc38tOqLBn6rKI1YCPrqaDNI0pR0suhd/76OSH8FqwhojyJL044wxft0zFGA7
	 w+I48l+FEX6LtDsEgVFl2jI8n39BjNL59z9UROKhQOiG7OZvEJOigEYsBP2wi5hk9O
	 FmsEpuMyAgqtQpmGo2Rexj+dRBKotiX5FNyPpAJMjkFtMAw2GXApL7KCUZ6KWrHea/
	 en+WOvZRSy2Z0HiZnCp0iRwgqX9uSrgiqbfoXRncbkq+FkqQ+P6Roz4MKSke+pZXQN
	 kc6l8umBVg5mToKGRlv82fTPz3cnr9E2MpwCL4ID403lX93cBrlYJ18gAnG6zkENKE
	 LfzKPrZQwg0rw==
Date: Wed, 18 Mar 2026 05:44:35 +0800
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: spacemit: add support for K3
 SoC
Message-ID: <20260317214435-GKA453922@kernel.org>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
 <20260317-shortness-gecko-72f14fbc79f2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317-shortness-gecko-72f14fbc79f2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_144438_217980_93FF74FB 
X-CRM114-Status: GOOD (  17.95  )
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

Hi Conor,

On 12:55 Tue 17 Mar     , Conor Dooley wrote:
> On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> > Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
> > The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
> > USB2.0 functionality, and requires only one USB2.0 PHY connected.
> > 
> > Explicitly reduce number of phy property to minimal one.
> 
> Is this valid for the existing compatible, will it work with only one
> clock?
> 
I didn't change clock binding, do you mean phy?

Both k1 and k3 work with one clock (no change here)

for phy, the existing k1 requires two. for k3, one controller requires
one phy due to only has USB2.0 support, other controllers requires two
phys - USB2, USB3 PHY

> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > index 0f0b5e061ca1..cc27b363ca79 100644
> > --- a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > @@ -27,7 +27,9 @@ allOf:
> >  
> >  properties:
> >    compatible:
> > -    const: spacemit,k1-dwc3
> > +    enum:
> > +      - spacemit,k1-dwc3
> > +      - spacemit,k3-dwc3
> >  
> >    reg:
> >      maxItems: 1
> > @@ -42,11 +44,13 @@ properties:
> >      maxItems: 1
> >  
> >    phys:
> > +    minItems: 1
> >      items:
> >        - description: phandle to USB2/HS PHY
> >        - description: phandle to USB3/SS PHY
> >  
> >    phy-names:
> > +    minItems: 1
> >      items:
> >        - const: usb2-phy
> >        - const: usb3-phy
> > 
> > -- 
> > 2.53.0
> > 



-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
