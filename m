Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1B2C61CE8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 00:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyH3Q33HefMoK9hqH3rtHzJ9QuEgEzA31Aq7yi1foe8=; b=M4pN8ppyIVv2BQ
	7daYnDR0Ujc5LbvGA24Tc/7H1FpHakopTzoVBSI0LIxBcqi1ynSLVwOvEiCg+Dz0hdOdGTFgOIPDu
	hU/hzDr604JOmEExeq5SESDnrZyOcPZphZ+fKOtzW5zqNnDO5bDhrV339kIulDc0Qjw4e0UBr17Uo
	EWf7iv9EJgeYZbnlIz3FdN9d44UwZF+k8qUiGBG9b6ApVy1+B52+2UvYvxYSnu8BpEaQy6VAU6re3
	E//HTn862+F4tjYJCUEAD90SH39JMbm7weLSEHOmI099c7XzcIAq/jqeq9p8T/iDlFGrOpDgSGRt1
	hkvqM+fWTZDGlsjVetWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsS8-0000000Ey8D-3zH2;
	Fri, 13 Jun 2025 00:39:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq8T-0000000El9W-3hwZ
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Jun 2025 22:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KriEKHEYlCTi88JAOccOhUjD8CzVygMM4sUtYzcDb5g=; b=FszwXWbU7qh4PIyOVrDjHEYI+A
	ejGndaTSpY7hCw4PKcplSMOLHFnU/2E4YsL78mr5ODBp/JuUu4kPSR8seFEyQoIy8Ges7x414dcyD
	VaL8EsPF5QCj/f0PF/xDrvSiNh/8aMCgJ8js8jEEb+PKD9sjbjB5XcUgM/1DBbKZw3JVIFWyMzTSI
	TVSbKqyWEbfYaWrgToPO4A3A87d+OZNXAf6NHJf2OgGKYWKkEb5mobU9NEWkux3qMk0O8Ftt41G4Q
	pDdZh9UvlcqMok+sHw145k9o+UhiBeRzIFEi0oQZsLb9Jtkso4VQ7fxRa0GH7Ag639HgIfsDTIKMp
	FvrEmHPw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq8R-00000002kMG-18od
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 22:11:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22c33677183so13493475ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 15:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749766256; x=1750371056; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KriEKHEYlCTi88JAOccOhUjD8CzVygMM4sUtYzcDb5g=;
        b=cqExJilsWoesbvCnDUDyg9ljE4MEuu39X9oGNmhPyO6XbnPHPbu1TkSMx7ndIWHrcM
         jVMYROdpbqmGyd7lZChGz67+vyBpRaxI0WLu02R66enmLZU5QCcbf+B80/705jkVMUBb
         b+vTpRI7TBr6OnJLZpSRjcaKqH0+voZmsc0s9d1t/S6XhQtUxf1Ma4c4UrtRoXf6pO9R
         tmtpLXhVFz3KmNpKUTetVwG4iuckJ3/lHzt1HA7N3lzBrqAGT2IpvJN5yvvHAAKBTccz
         hCrcJD2CfaSQ+vo0qSWwq7Qyag0o/fPG45DbqcKpkga0uz1iquLpumShboS3yfE6FfMT
         nIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749766256; x=1750371056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KriEKHEYlCTi88JAOccOhUjD8CzVygMM4sUtYzcDb5g=;
        b=bwPMJcXQSE4K/q/9+XQgic5RXrebF5JwkNPNCY0456b7zzscGS2eRo2XON689z9CI8
         /lONOsMX6nk2tEO6tbaxuEGrVveO2VIVgOVhnQ3iGSUn3St++WF+PkHkJUG3s6rc2Eub
         dXgsbN5lwN51deplPQhSUaautOMGvd3oPuIXbnsMfC+3AuZgTdj5ZBBjlglKp9nDuWS0
         J5GJG4EKYfuTP5r0+DJk2hu0+ONlAXZ0GxLkK6gZGrX1ulGuum0JeDcPCRJpqwH0Bmn4
         hBRlw32pxZsDPOssuMHCRX4BoWwqmRTvMTxtp2ryg0g+GZscPnrblrrpzP9RjzfznoKb
         Wueg==
X-Forwarded-Encrypted: i=1; AJvYcCWtxNeUD99rHonAZZflstOL6BTVLaOAYlQ+4AVshtx+W/JmiYzQpFvoK1x+JvJbPJb6o4x7Klfn2cg/Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7d6FAPlZCosfLn/NcXmhZYbEN2QSPdDHsvg/2H6jzbVae1OB/
	Qmn+W4FIGwZL/QvJrym+xp6bJyLswr3m9Bpuvy8x4iODScOfWb+C3rRj
X-Gm-Gg: ASbGncu0gNPKq51X/etGsa4WT6HDSQFEZpif4LIxodZGCZDLZwphna7tNJMyYxTsykS
	qdVWUyXCkapdQxuAPIt/M0NRxAIVd6C1jaKZNNzAlVQIW2XC6TXWlJjwiSytkxG3y7Qp2hJJRYK
	Y+4ixu73x4lwJ/h5OgXcWNZZcxwul6ng01zqu6YT9zimzOPIbuZ3beJ+6/1IkVdGqJukOz+8KLX
	+dqvZ4Ak8DLsDEeR6js2J+eqp0FP8eCatw46ly77UniKBRJu41zqJ1Hu0YWJr3zN9foVmtmvQe3
	HHLwrmLDzmxeVw/304YsXm5XdbBsHle2AE9xmw==
X-Google-Smtp-Source: AGHT+IF3VWf9CLIOpaSuBO7CmtrEXj75DaYp06Yzj+Kv4Xtv5ablupO9zYlfs0wiUHGpvDYApyEsXg==
X-Received: by 2002:a17:903:98b:b0:234:d7c5:a0f6 with SMTP id d9443c01a7336-2365da06f72mr9323335ad.31.1749766256233;
        Thu, 12 Jun 2025 15:10:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365decc11fsm2092655ad.222.2025.06.12.15.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:10:55 -0700 (PDT)
Date: Fri, 13 Jun 2025 06:09:47 +0800
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
Message-ID: <y6dkhbc4x5qvd3z2yyh3ba7zkq7gphcnrc5757fxlmpz3zh2nb@tk65ldng6oyl>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612-culpable-roman-295df1360198@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_231059_584934_DC053DEC 
X-CRM114-Status: GOOD (  21.27  )
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

On Thu, Jun 12, 2025 at 05:04:46PM +0100, Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> > The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> > access to configure related modules. It includes a usb2 phy and a dma
> > multiplexer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > new file mode 100644
> > index 000000000000..e8093a558c4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV18XX/SG200X SoC top system controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@outlook.com>
> > +
> > +description:
> > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > +  register access to configure related modules.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: sophgo,cv1800b-top-syscon
> > +          - const: syscon
> > +          - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +patternProperties:
> > +  "dma-router@[0-9a-f]+$":
> > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> 
> I think you're supposed to add "unevaluatedProperties: false" to each of
> these nodes.
> 

This is is OK for me.

> > +
> > +  "phy@[0-9a-f]+$":
> > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> 
> Why are these permitting random addresses? Are they not at fixed
> addreses given that you only support one platform (modulo the rebrand)?
> 

IIRC, they are fixed address. I use random addresses as I see many one
in binding do the same. Should I switch to the fixed one?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
