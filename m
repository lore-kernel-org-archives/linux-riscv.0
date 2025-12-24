Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397C1E74906
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 03:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GpV995ILKHazIlZVAftA5YjWFMrSrMsQCqqi5WraD0=; b=TS7iaJJfAfZ/B/
	8maEscXrX+RkL8ZX4RU8IVfbTYFwgcf9U0YzBZ0f96H/NoW4SXUs8bZq/bTYF4AYr8SgO0USxce/u
	y+6RcM4ew5GvOVvEqsfDEQ4yaCRJLXXCQiGjr5hNdxes3zCGdfU/PSawfooQAHU/kju7ylvHkoBP2
	gUYFq/dA5nkpqeJUjiUDH/190K9oJho6t86tO3/3fxHIp6wM2hpXmBS/XfnYb/CCU+Shs8n9Piljf
	W/B95+JXFMbqrONw1WpEZj3EX0Eac+TvsJCrCscwuXzkRfIFBkzez5OB0CxnN1ruGmpGtTEtXHgy8
	3p8E0/gYNjAJBDDQ9c2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYFAl-0000000GLIC-1bHq;
	Wed, 24 Dec 2025 03:04:23 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYFAi-0000000GLHp-3tUm
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 03:04:21 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4551B34173F;
	Wed, 24 Dec 2025 03:04:19 +0000 (UTC)
Date: Wed, 24 Dec 2025 11:04:14 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC
 support
Message-ID: <20251224030414-GYA1992051@gentoo.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-1-f6f4aea60abf@gentoo.org>
 <8840B91CE3D9278B+aUtWX6fizXnheGMl@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8840B91CE3D9278B+aUtWX6fizXnheGMl@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_190421_013626_FB4EB833 
X-CRM114-Status: GOOD (  14.83  )
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

Hi Troy,

On 10:56 Wed 24 Dec     , Troy Mitchell wrote:
> Hi Yixun,
> 
> On Sat, Dec 20, 2025 at 06:14:53PM +0800, Yixun Lan wrote:
> > Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> > almost same logic with previous K1 generation, but has different register
> > offset and pin configuration, for example the drive strength and
> > schmitter trigger settings has been changed.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > index d80e88aa07b4..c5b0218ad625 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > @@ -11,7 +11,9 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    const: spacemit,k1-pinctrl
> > +    enum:
> > +      - spacemit,k1-pinctrl
> > +      - spacemit,k3-pinctrl
> The drive-strength description should be updated. The driver uses a
> different current table between K1 and K3, but the binding description does not
> mention K3.
> 
yes, I realised already, will update in next version

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
