Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE375CCD19A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkpanltWw1DSs+IaFhxATuPAvY6M0QJJSwW0Tfu/f98=; b=o5DkOHtYOVvL3a
	pPfT7H1Caz90OmPloFhTzEjPqtFbjUdAtbaSZNe2dNUtehLb1H6N1luk6Lo0YSzGgpfFfTiNsZa2c
	Ul/v1vZyM/HUrWFHdwK2dCHY+4UkfCJs1+J3OSy5IUsj7mdpXQSBZ1yk8lgPgm7wCzF+DqcZxAukB
	jWOZ7xxXeHXG9mwQ2ICJHMf1K0dYBpc6iLbAOf0IH4dp7M+C4UXSZ1ibGqRoLsOw9z4AtF69g0hwU
	EDhSu3b2VhK5v/yVa2fMvtZiWfXH/UOFN5v/arY4/56eAx8L0khUt0hGT3x/XJNknoejChc1icsMu
	/JFhlJmpig6gG1LBZz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9grd-00000007KJo-1ecl;
	Fri, 17 Oct 2025 09:35:09 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9grZ-00000007KIG-2gM1
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 09:35:07 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29091d29fc8so18344685ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760693704; x=1761298504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6sefhtiMhuuPq8nFOLwvYqf8fe7o6Hmrgpdt61rNn/I=;
        b=XPZFm15vgsEDguiXv5eB49iVY0zMPesCYIEOw7HuSACjL3Ci1J0E0weK7UZ+4wLrr9
         lxtVg1K+R5vq2gPSyP6AQ/IfCPbNCwk3KvRfIJZCIlzClymkSzCzPocWlAgAhfOVvZGh
         kDFV7TRAKkt51BIwocfCjQR3w0PxpNt1EZboZhQ8Q5GBE/IeIlmILWBDuY2USTQ4BsoM
         +IsLK63rkGmXb1St8SB/tRVmCItPwxbJXbFzW6Pm0GO6zDuSNJe1S/b64A9HUqr6LS66
         6RrqSfaxGyn21O/v+6vvm+V3RIoWZLZQdmwEPOaRMgdsXiL6hcykYai0AjiP387/5TK9
         nERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760693704; x=1761298504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sefhtiMhuuPq8nFOLwvYqf8fe7o6Hmrgpdt61rNn/I=;
        b=g2eDZcQ41An6UnXaTk2EgB0t3XmjRrQDUHeRx6ozr67g20qqsPf1fUavhYvAgztQcW
         Eyh6FEqk82xSmBA8PWplZyaxtx0A3mGEodEB3YcwUUcNL5MGgBFXzeiHPLwoJbdXVTd/
         eguX3+6Vz/WzBPW6+9ZLgass8RjglFdqk5NKkaG03o6BQPxjkAqP59WuvMoVMa9b7JBN
         xifMnRRxFPdrJxPVS9Vc0WlNm3rfyxiCettFqJTEIv3Uu7qik3q/l9K+pQQcpBQsVAOm
         /6COtdFDShLw0lofWuqKBKRiDgdYX1a9rAd3Vzy+/jifxn86pl1dgaaZtbOgnT1z9oo0
         /FgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpRMxH6+I29Q6+8hyi8XhKX3tWLq3aGHnFLuA0nqta3WYOO7YouXX7vEiO4HLIvrw1KsJC/NlQiSksnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPz5jIvsjSP/yMGdhb0KdPTz018FJu5WkvTrznJj7HIj0o5Tnd
	u/WN4P8b9tD55OWFpBolguwZLX0D5F+yhg0RAfau2kpVUS0tSoOL8WiR
X-Gm-Gg: ASbGncsmaUVVY2ew5GCXlwbzQzWd/1RHdVPplqwDkZApWgRM4iqbVhGJ5Ns6PTb1s1E
	dpSIZa5+Y9xxvDJ22zB+nl7A6QqShrcS2h5hJT1CDrpovAczr/14OCgB91hUxWq5HpxOxPsU+iw
	eKolB5JJX6qXVRK9+RmtgviLdGKIGOd33XQiRIM78FWdfiGGl/W8l46hvglI7d20tkwCwq/dh8m
	52ubLiP/3cgInHxXsx3SBIjpZfSipfa+K+O/XJhfOE08KqK1TNwxdEXkpBj/Ua3uD56wZf8WQi9
	Xc37/YuRh1Fhw8d34T79whyA7nrtAtdBWljPjy9KXtLzAWxQwpD4zS4I1U+Goa0jdyUhz+KZFVw
	rBSb1UcXEo6CvDH7GH3fs98pp80h0iGEzcaV/gK+uXMcfqXt7LCLPyqTX0vE4U6jyBEpjVJwijD
	70
X-Google-Smtp-Source: AGHT+IFZ4r5YhjGJi2lIzlRtB+okPhBm2JAHvMOho4Si8E/kA0x/N3K19f//5A+MqBicWT22P9DP/g==
X-Received: by 2002:a17:903:244b:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-290c9cb77d1mr36187715ad.18.1760693704058;
        Fri, 17 Oct 2025 02:35:04 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099ab4668sm57316645ad.90.2025.10.17.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:35:03 -0700 (PDT)
Date: Fri, 17 Oct 2025 17:35:00 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <ief5lt3mxa4epnlhwgsx7kvi556f3fo3gqff36hmzvitexlphx@ztpueijr5nb6>
References: <20251012022555.6240-1-looong.bin@gmail.com>
 <20251012022555.6240-2-looong.bin@gmail.com>
 <20251015134144.GA3265377-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251015134144.GA3265377-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_023505_680873_8C8276C9 
X-CRM114-Status: GOOD (  21.47  )
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

On Wed, Oct 15, 2025 at 08:41:44AM -0500, Rob Herring wrote:
> On Sun, Oct 12, 2025 at 10:25:52AM +0800, Longbin Li wrote:
> > The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> > access to configure related modules. It includes a usb2 phy and a dma
> > multiplexer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > new file mode 100644
> > index 000000000000..d1993f2156b4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > @@ -0,0 +1,59 @@
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
> 
> Also need 'ranges'
> 
> > +
> > +patternProperties:
> > +  "dma-router@154":
> 
> This allows 'foodma-router@154bar'. It's not a pattern as-is, but 
> generally we don't put fixed unit-addresses into the schema. So instead, 
> should be "^dma-router@[0-9a-f]+$".
> 
> > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > +    unevaluatedProperties: false
> > +
> > +  "phy@48":
> 
> And similar here.
> 
> > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    syscon@3000000 {
> > +      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
> > +      reg = <0x03000000 0x1000>;
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> 
> Please make the example complete with child nodes.
> 
> > +    };
> > +
> > +...
> > --
> > 2.51.0

Thanks, I will fix it.

longbin li

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
