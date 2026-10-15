Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C41CC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 08:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGe7qu3uPoV5Q/o3z5hT+hdnW884/9dW2nm6LVD4bjE=; b=Kfo1zFTP8NRydR
	YTEwrDKMi4o0wTS5VMnH6tA8GAgUvGXNxxxQjO0cIAVS4P2zMYdMkQ+u7O+iumLoggAdU8JAN8n9M
	pu9/hQDzB/zK3vHXq0oU3P4M5FNCBuJ/K2Br0/9GZZYajfyOURSVQ1Qi+mUi4zPns+/tzPyXG9kjD
	aZJnWrWH1Hfgrnxg7aPhLvCxDVoTSMWk5GuwevgDwZOeMWH5Kddc3fLXsLRI/4nu/LDP2zlcgkr7M
	0m1SG5935BYZsiNsoeTkJuas9SKwxT52BBtadDU9FVr1XMquhd5TE+4pwG9w/f3M6T90iF4dmGS7Z
	N+8lIWWBtFtaJgm3emfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHIq-0000000HCgd-2Ay3;
	Thu, 15 Oct 2026 08:59:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHIo-0000000HCg5-01p4
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 08:59:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e7e742a2c7so34263595ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054745; x=1792659545; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iY/Ca6upnPsDr/ZtUeBJxSM1jnY+ETFKViUNpFJNrus=;
        b=rW1i88F5FD/wy5xEGzpnJPKQBgqx/gtPrWyq0HxoMxMfoOnaZ3TiXyekTIcvgi3Hq7
         kKnZFAa56bYBGXCFrRNRkNzEBeK62bRi/QZ3CUsuxeDF0ZIkEHmhh9Hby29oo7OpiV5g
         1/rB3YUo5hTE5zPDT/HF2sLiFJZtp0Em1DNh12Dm936b3ATVmhTS4LJZi4KgMN3lb9hb
         pWTGGFIMi0/JjBT0pLSkCaj3ZFbyCo+rBhyCS1f1digFze10IVnKodXiXzGJq1i5aHy+
         1j0ZkmjZv9aOHKoX+kxG0DrClmoDPhZJmys04iQCKnBLDJPhn8CdvD6zqMebG/16GqUD
         5Zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054745; x=1792659545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iY/Ca6upnPsDr/ZtUeBJxSM1jnY+ETFKViUNpFJNrus=;
        b=wRb6uA5UQsMRDyqZldmjuX/2yMop9U10hwPMCREBA185dr66AvRYuh7iPmELcPpTSW
         NJ2FmF0ty3RByWFDi8JFji7H0EEa1XmIm8VZyAfINwNKD5lGwZarmZv92EHtbCwo5KK2
         NjcDr9PxEvv8DIocfNMhUyUFyzWShIXJ/C5N6pUeBGLzw6m+3xf3CLKPfh7jHo4U2jtT
         6R33WjgP/dN1PGWLZ/Em/i3GsuZQ47SGOtqgGKMoNAkN8APuFWj1Q7HdOvYEfqzfv7/H
         seMETRidIyVlSA8OvT8OnDXv0kZOmrDnBbqOvgaJmbhWWFiusJ5B0Gx3s1O7H1xYdVZ1
         KGgg==
X-Forwarded-Encrypted: i=1; AKwUvBzW3O/ooR/udGlPC7zcUMlwG5H/sg/DkjmWkcTom3yfW0JQAx7OMH+8AyxwPzYRhnzec5UD0UMnB4UW5Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLwWjHSC6zgREIATufm4VBy6Pl5BRb2JTtlFbS7a8lsRs924cqk
	xta5rINEmUej6OOWBTDkUJrGri0TGADkNpPkK7QJPCL6T2Hd4U02MRWD
X-Gm-Gg: AYBFou2cSLgmyxKxQHz1P6a8hatcS/iY3xH8Zg6D0z/DN0H9lmPdzu7bwn8XkU7ylY5
	ouSoQd7LscFRhHFtc8ZUYiW5D45PBz7rPTZp6C75UnYJmyb9JpKOo9OFuYyWN566ixZT5rVXqqB
	Tp3FGVO1B0I1Ib9Rrw/QHxJpSCdOjRvPtViNnZON0T/khxYPC/o0G6psH7scnAyaHEe6hmU9nQc
	nPiUo5CmtDr33JzUdpWKNyJrnRpGCowgbvTV8/9wjnXiQlgGNV/hDWDYE1h1CQp0p47jB5Zho9U
	rEQHujtmecEtoHNWC8qvQDxCc829Uj3EwPnf34cPviH07COSK9Qpd988HjHlb2ydPIXgh8VdtAq
	KZUGlUqxyPAVAz88VW8rREvwvz0LbmFY8M4TGNtGPhv81YXvYxPVzRlfboct1fpWhah0X8qDCNi
	s84N/PNqRPQLDXjF8Jyzmw0t9LHV3qWJtKSGd4PbjNP6C8Lrg1OXktTqi3w3CGHp/3bIu+Bg==
X-Received: by 2002:a17:902:f70c:b0:2df:aae1:4905 with SMTP id d9443c01a7336-2e842cf990amr110281435ad.26.1792054744748;
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e94ba30f6asm13269885ad.57.2026.10.15.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:58:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Message-ID: <atCVYXd5cIkcB0oS@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-2-inochiama@gmail.com>
 <20261014-humorous-cryptic-llama-cf6a6c@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-humorous-cryptic-llama-cf6a6c@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_015906_070106_0C1DF17A 
X-CRM114-Status: GOOD (  19.35  )
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

On Wed, Oct 14, 2026 at 01:43:29PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 03:45:13PM +0800, Inochi Amaoto wrote:
> > Sophgo SG2044 uses eFuses used to store factory-programmed data
> > such as ROM patch, public keys and other factory information.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/nvmem/sophgo,efuse.yaml          | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> 
> Filename should match compatible.
> 

Thanks, I will fix it.

> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> > new file mode 100644
> > index 000000000000..d4bffe2724ac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo SoC eFuse-based NVMEM
> > +
> > +description:
> > +  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
> > +  public key and other factory information.
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +allOf:
> > +  - $ref: nvmem.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sophgo,sg2044-efuse
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> 
> Why is this flexible?
> 
> Best regards,
> Krzysztof
> 

This is a mistake I missed. It should be the only clock, so maxItem is
needed.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
