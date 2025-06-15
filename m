Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69EBC7114A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 01:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6y7406gvcsoQL5iiaYGkuKvufFEDDKWjNyJTueGDSM=; b=M5NGGcaK62frjL
	L/Fupoi4b2nqlRbRcvNJVyNhID8+tL4A+83l6orFGREEFvDoOQc3Nu/gb50pfk2o6PJUql4y+KfWN
	cTf7rhjZeK9Gx8uHPXFbtUHiIM4uaof6+oVJn01Q+gDHvmdfnQQ1XPfYaVQOodIXHOXomdOF/i1pM
	BjgGGBaEQJDv5pgMby4OGy3hW2BETvEfcp4e+YH3YhgvG/VXBSCEveonMmN2ZgcwAK8N9erh2FPv2
	3jhwKIXKgjwePXpav1LCe+WZEP475EncZlRQbyXkP0NKA+LDO/c8+yDV3rnD/zYQqdDFPxVKAHl/6
	Vg9rAJJeYIcusj3JwxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQcOY-000000026oa-3OtK;
	Sun, 15 Jun 2025 01:42:50 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQcOW-000000026o8-1zrP
	for linux-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 01:42:49 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b2f62bbb5d6so2580490a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 18:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749951768; x=1750556568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SrxySgbd2izx1maOgVxP9ZTfn4E4sjc7PUTQCsZRh48=;
        b=GXr/j2qVFO5eRWE4dEbbMd37grl5RccXarl3CNWRuZ+K8aJYL9rMoQ6ewXHxjG0K/O
         aw0XjQfZLu0aQqLOUsPDL/QDR+TAZ30txsNeTnHWkQx419wXZDlej7115pCM3AnS+Raf
         fGhlTiU6BLuQzw9uIsYh3eObACBIe1CdoxlnPQHFdREL+4Pp1tvKp6OykqELFkW4zZZ2
         bXsjmbRwHj2GaOgDsPZr3r1tkUIcB3nd812/Xfikb82HyQoQ4neQQgPMEFD/a2t7YWqr
         9QCLZEoRxyF2gsq6drDuwVr/GE0f8WAbsxYKGyFBWUhrvhQ4OC2xjfNyHOXTT5HEM4V8
         Pa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749951768; x=1750556568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrxySgbd2izx1maOgVxP9ZTfn4E4sjc7PUTQCsZRh48=;
        b=X+whX5GoAk0fZkPfx5+1y0664jBBCN3K7uDVhBhMozUhEj9JOTzrCDhVbCDQVzrZ7V
         k1Lmr5GoMfsTV0FnIQBMHKi1p9xZxQc3D8LpAe0gYX3jL0IdHCTeUpC19hHd3xyL1pWL
         4Z3MdbjTqza2TqQTLlpdfBo5fa/0lah30NOslYghGplCZT8u9i4sdlSLub/LnyTwEWWY
         Q3vGDL5JctzcVu4jHA+kKQTu224enz1cIrsjxKX+DuDvZBjgUxVzt55+cmE0pCDKTLSk
         dXNWBlrAwXhFvsVfbD71M49lIkIVeAtpwwFp9wIeBDyIyvQ2WTcqwaBFN5qg++bH38Vu
         Z1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl86BMW9IknTr1uyvquG7gWkHZfNfEl3A3+CPiER4lDqaTN4/M27QThsUlVGnme+Tyep4bX7Dwdi3bVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc5oEhBNseeV0ogI1Ic0q+mgqrHY8ivXmOGR0rRhVAbg7XOyVM
	RhO4xI97WNvE2xx30u2uA7FGmJVI9pTkr5Z2trYtuiPeI67yc8DBTYR6
X-Gm-Gg: ASbGncv6xSXJoCNlni4Dnq03+EEa2gAn8QL65pLUPd2ycoSRN2TwGDQR8oa0AdWBTwu
	Z/x41oQIJZOjjlrN4ctbNK0NRQD2wi6aPE9isOKVqBu9Z+F4VP87Gu3oWr0yR7heoRd68xRSMmU
	Gdx9JcCaOpczd0AVWGC5d0ngPvJW5Yk6GKTiej71vwcI8TU+N62F+qEv87gDDkrYxHzuDx97aCk
	pAnWBLMTEfc2QR1Lp+XKjMC/XE0Dpei3+oDq6LplfC6+z4DYOoBJFUDmGiSMbVRyz9nYb1Le9NM
	PKEN/3PsqtXNe9mtdy+/8/qxKkQ0KZKYanJ/doZ/rqTc2WTesdbwdCQw9O+MiA==
X-Google-Smtp-Source: AGHT+IFQJycihrzqStgqBch1SxHHFFK4UJbfgDZpFK6aOcFb18jbAbwV9uqWfmoR+F4PY5gp6uTNHQ==
X-Received: by 2002:a05:6a21:3982:b0:201:2834:6c62 with SMTP id adf61e73a8af0-21fbd5f2087mr6758634637.25.1749951767631;
        Sat, 14 Jun 2025 18:42:47 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe163a470sm4139687a12.9.2025.06.14.18.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 18:42:47 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:41:34 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <z2msqxjwfwieqafr4trj4xvdam5tapfl3ls65vecgtgpz2f2zw@rv6zd5ovsjz7>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
 <y6dkhbc4x5qvd3z2yyh3ba7zkq7gphcnrc5757fxlmpz3zh2nb@tk65ldng6oyl>
 <20250613-paving-reimburse-fa5ed8c40c7f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613-paving-reimburse-fa5ed8c40c7f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_184248_519409_A0088582 
X-CRM114-Status: GOOD (  29.64  )
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

On Fri, Jun 13, 2025 at 03:23:26PM +0100, Conor Dooley wrote:
> On Fri, Jun 13, 2025 at 06:09:47AM +0800, Inochi Amaoto wrote:
> > On Thu, Jun 12, 2025 at 05:04:46PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> > > > The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> > > > access to configure related modules. It includes a usb2 phy and a dma
> > > > multiplexer.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
> > > >  1 file changed, 57 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > > > new file mode 100644
> > > > index 000000000000..e8093a558c4e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > > > @@ -0,0 +1,57 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Sophgo CV18XX/SG200X SoC top system controller
> > > > +
> > > > +maintainers:
> > > > +  - Inochi Amaoto <inochiama@outlook.com>
> > > > +
> > > > +description:
> > > > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > > > +  register access to configure related modules.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: sophgo,cv1800b-top-syscon
> > > > +          - const: syscon
> > > > +          - const: simple-mfd
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 1
> > > > +
> > > > +patternProperties:
> > > > +  "dma-router@[0-9a-f]+$":
> > > > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > > 
> > > I think you're supposed to add "unevaluatedProperties: false" to each of
> > > these nodes.
> > > 
> > 
> > This is is OK for me.
> > 
> > > > +
> > > > +  "phy@[0-9a-f]+$":
> > > > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> > > 
> > > Why are these permitting random addresses? Are they not at fixed
> > > addreses given that you only support one platform (modulo the rebrand)?
> > > 
> > 
> > IIRC, they are fixed address. I use random addresses as I see many one
> > in binding do the same. Should I switch to the fixed one?
> 
> If things are actually possible to have at variable addresses, then sure
> use pattern properties and a regex. It may be like that if a new device
> is released that reuses the dmamux or phy but locates it differently or
> on a platform with multiple phys etc. If not, then then just restrict the
> address to the only permitted one.

Great, Since all the CV1800 devices I can reach have the same register
layout, I will switch to fixed address.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
