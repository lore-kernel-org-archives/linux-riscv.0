Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E893AF506D5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3ZVn+d2g9+GgwPYMzXrRmAa0zLins4iZrDGwzbl5uE=; b=UpNdYN+89mimxz
	gzYzTQ8oGBabXZOzbOU2Eat8f1eZXJsLiBAKjgJHYM83Jlx9ydX4sxkFuyDfnBZxMBDqGlST5rAJC
	EyJk/17Vy/3IZs7VBfPf6zOLTwFJ1Xz8pyYNWfMyjsxUWGgMZ2Vo0fDYDUyfyhYDze8LaoQPK6ZAk
	/BaqZgI9xgertimEJkm7jQvubiw281UzyBTO4Hf9PKVTJ8K1guWMgzidzvmdCf+3RCIshNmxL/FcN
	dYsPKRfHkhQ9WHBrISGXr7jBWYpMf8L12RlBYk75T6fZaMrUczMHJSi0/6IP4YYQMl4796uUsf/oc
	t0hSRAS30qDaIt6ZXnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28pY-00000004AQE-0HLm;
	Mon, 16 Mar 2026 14:22:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28pW-00000004AQ8-3Egg
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1B3A600AD;
	Mon, 16 Mar 2026 14:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1B1C19425;
	Mon, 16 Mar 2026 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773670921;
	bh=iXFAkyHZVPA9Js7q3zVpJAkTrRXaqU4mUKoFiz/fVeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vb0KmWB/iuxyOrVhlK4FapCa9mzGM9nh5PwOvP5hUcrlaMDuUNCzi5wkoBiyWHY/z
	 fiKgUdjgNBKIBFECaUTHUebuRP/ifJ74CUnhNlbmvOAlk5d7pwZEGqq/6bRVvLADKj
	 jgjKDDwr/6RtuoCMnPW13oUD3QnhaY+DmO1wQPEL69HXv3xVL0lmRt+n8arUADfk8i
	 ZlpgmCUVCnesskPTC2+ro56U1mbwxfdhiSp7tTulsWEta/JALyYsMPH7oqxQowfpSp
	 NhbQXPZNKsG9L4snwizHaOAoIhOnL3oloIjuINpdgQuH0qfwgA7vG68ikaY/pXEsTB
	 +ycUgioU6SEOA==
Date: Mon, 16 Mar 2026 07:21:59 -0700
From: Drew Fustini <fustini@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <abgSB6DBABOtk+tU@x1>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <abWTO7QBFIcjxKn6@x1>
 <20260315-cogwheel-dislodge-a3efe31728d1@spud>
 <0f88a17c-7c21-4ae5-b418-dfb4b4ac5d6a@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f88a17c-7c21-4ae5-b418-dfb4b4ac5d6a@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Rahul Tanwar <rtanwar@maxlinear.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 16, 2026 at 07:11:37AM -0700, Guenter Roeck wrote:
> On 3/15/26 05:12, Conor Dooley wrote:
> > On Sat, Mar 14, 2026 at 09:56:27AM -0700, Drew Fustini wrote:
> > > On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> > > > The G and J coefficients provided by T-Head TH1520 manual (which calls
> > > > them A and C coefficients and calls H coefficient in the binding as B)
> > > > have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> > > > respectively), however the binding currently only allows coefficients as
> > > > precise as 100 milli-Celsius (1/10 degree Celsius).
> > > > 
> > > > Change the multipleOf value of these two coefficients to 10 (in the unit
> > > > of milli-Celsius) to satisfy the need of TH1520.
> > > > 
> > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > > > ---
> > > > Changes in v3:
> > > > - Added Drew's R-b.
> > > > - Fixed some typos in the commit message and slightly reworded the
> > > >    precision sentence.
> > > > 
> > > >   Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
> > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > index 56db2292f062d..7d57c2934a8a1 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > @@ -105,7 +105,7 @@ properties:
> > > >         G coefficient for temperature equation.
> > > >         Default for series 5 = 60000
> > > >         Default for series 6 = 57400
> > > > -    multipleOf: 100
> > > > +    multipleOf: 10
> > > >       minimum: 1000
> > > >       $ref: /schemas/types.yaml#/definitions/uint32
> > > > @@ -131,7 +131,7 @@ properties:
> > > >         J coefficient for temperature equation.
> > > >         Default for series 5 = -100
> > > >         Default for series 6 = 0
> > > > -    multipleOf: 100
> > > > +    multipleOf: 10
> > > >       maximum: 0
> > > >       $ref: /schemas/types.yaml#/definitions/int32
> > > > -- 
> > > > 2.52.0
> > > > 
> > > 
> > > I have applied this to thead-dt-for-next.
> > 
> > That's odd, why is a hwmon binding in your branch?
> > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=eb4fd43ff6793681f0a0a8e8ac861142caba2b19
> > 
> > I don't see an ack on it from the relevant maintainer either?
> 
> I don't get it either. Normally I am the one to apply hwmon bindings
> through the hwmon branch.

Sorry, I should not have done this. I should only be applying dts/dtsi
patches to my thead dt branch.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
