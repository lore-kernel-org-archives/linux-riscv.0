Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF628C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPv7wA3vzsIoij/FivR7aBN0lWsaHkLK3VKO/uWAgog=; b=s0NQ/rJFDoDwJW
	l7i/JnC0eHoBsmGXNBa0e+YaFsi4DAzNQ+tTmZdB6btsCNY1xTNEhi8bYrGPu5giXRfKdCxJ9Va1P
	38PmCsPl/Km9m135siYPjdIiyfUJ/DH+XD24wmjdhBBQTXo4wZfElYB7sr/7sT6Tgys/4s7rgsiNi
	Lur9RJHwyYHQBmH+G5vM2ke/j7fTW8AdEtxaXL8i3zX6aH+sQV+X0RLrKOU//tATWW7V7q92T5oS7
	VGP9tlQBLNf8EGh6guXqJsHYBB3gQYJ09hGZP9Idhv5uM0kNaBuYqrGEfd+hKRRYNJSn4wrVJKNHf
	4IW0fHa1aOiv2Q+FFR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nC8-00000000fd3-08LX;
	Mon, 07 Apr 2025 14:11:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nC6-00000000fcf-1anh
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBAC661145;
	Mon,  7 Apr 2025 14:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB2DC4CEDD;
	Mon,  7 Apr 2025 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035081;
	bh=kZUcAvHfg06pFUq3u0ppbMfjOjpMz7azG1mzNbRZCds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLsODXQ6hUQvST6rpsd/56i2NZHg4QFuam+7YuMAvAIqqHs/DGMFXjuYdR4B1eqpj
	 YQv+Zzut5lVsD/IqFdy+OvkoUmg+nxGgxkNDzlSffilACynbqFCaJzH2T5VPbMk3gn
	 bUXhyDAV04SgHJLpTupeVxzpp1JVNo1MWsNu0VKOGgeEHcogj7ah3whTPAw0ciqmX+
	 fq5op1+7RJJqaBu0+zDC2ZqoZxbByLbBc8quTJJpOtfMcP7tTBT2zKbEz68LDjNLSm
	 FDYAeMPbbiuxsDUsfWADTCCXXvY/BXjMhjG+lNksaFW/dptlXhp0HGXvrPNp4H7SXg
	 hVXNSPW2k/zSA==
Date: Mon, 7 Apr 2025 09:11:19 -0500
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Longbin Li <looong.bin@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	ghost <2990955050@qq.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: sophgo: add pwm controller for
 SG2044
Message-ID: <20250407141119.GA2192351-robh@kernel.org>
References: <20250407072056.8629-1-looong.bin@gmail.com>
 <20250407072056.8629-2-looong.bin@gmail.com>
 <jq55x7uhftvejninh56tzk32jtmmwa5wxzna5uxbkk5woi7zi5@6wrg2ctmyg7b>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jq55x7uhftvejninh56tzk32jtmmwa5wxzna5uxbkk5woi7zi5@6wrg2ctmyg7b>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 07, 2025 at 02:31:24PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Mon, Apr 07, 2025 at 03:20:38PM +0800, Longbin Li wrote:
> > diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.ya=
ml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> > index bbb6326d47d7..e0e91aa237ec 100644
> > --- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> > @@ -17,7 +17,9 @@ allOf:
> > =

> >  properties:
> >    compatible:
> > -    const: sophgo,sg2042-pwm
> > +    enum:
> > +      - sophgo,sg2042-pwm
> > +      - sophgo,sg2044-pwm
> =

> Given that the sg2044 has more registers (to e.g. implement different
> polarity), but the sg2042 registers are identical, I wonder if the 2044
> device should use:
> =

> 	compatible =3D "sophgo,sg2044-pwm", "sophgo,sg2042-pwm";
> =

> Note, I'm unsure here, only providing input to people who are more
> knowledgeable in DT that I am.

Depends if s/w only understanding "sophgo,sg2042-pwm" will work on the =

2044. IOW, will a kernel without the driver change here work?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
