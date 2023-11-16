Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F10FC197A0
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 18:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6e4/UgcD3NK+FnsJiM5m0pGKKAF6beArp02PH1Uqis=; b=QQ7cW6leYB4MR4
	fEUH3i9xvUSU6CPOwuHDGAuY1jHQUhC9lqrUyLwkojUyLFzBhZlqfAdSuM2Z23rz2kzV/a2cmBOrp
	7Z/+YECabrQtOC7G+qwjeWjpsxXbnF3a/IGT45dCOKLjDQVO4yw2XeL005DIK9vfwHXJ8kMxqLy0f
	5REaPdSQk+nNmLhEFnuWHdDBHLnDJr+CCWE0/2BXfecBGn5gs50rPVtNb11mGcRoo6ND+NTEzqgCs
	h2gP2FegdtA8FHV0EY6NNp8Eus1HMlGkcXnknrJ2Zuj/XZ9u3oScUp5pbzpS009go6DCfhZGOw+wn
	Bp8Bh0IQMGlv1wOdSTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3grf-004HAM-1o;
	Thu, 16 Nov 2023 18:13:19 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3grd-004H8j-04
	for linux-riscv@lists.infradead.org;
	Thu, 16 Nov 2023 18:13:18 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1e9c42fc0c9so507421fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Nov 2023 10:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700158394; x=1700763194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMupz1Ersx7G8Y0V72zO2fVjriizbVlDybDUE6gNC5o=;
        b=fY6myXI7u4YqpMXXkDIjU1iV8DPlzTdW3VTQANNlNsj8WYmncA+aQXBslM5d2nxkLR
         gLVyeTgEM+cYWjJV5W6gvfASPStBUf0Chnr0fVSgMg1VJhVGp72w4Hi4ir6Fz1Jhk83/
         KciAr2+VB2T7LQqUfiSxXWZUMjMcbrz+FjaDWXpLjLGWiU3QXsKkFfG0P/fdf5l/iS/y
         IaWoVUmAFDUt8xK55npE/D/+XBqF+TfTN9rjoVwaMw+rCsxzZmyLQMYyBoTE8BjAcIrb
         gBLpPmAHY7atg1j8K6eb8ns6hdEBRa2qhW3AeC61gj5DTovIsnacr+ZBemoFHDHn2ELI
         zCbQ==
X-Gm-Message-State: AOJu0YzxQ1fp+ClHCmoOTDTcHGwrReLBC7Hq4cfAqeFP0G2GbAGG5Y3w
	jiLV6jwnFzWJ2E6GYyYUgg==
X-Google-Smtp-Source: AGHT+IE4qXE3fwLtFQUpSkyT2Q9sqt2XnsLJBMw8YKmQlxdpMl7Oyy3/SUQgOiKwtUToqHuLJZXSQg==
X-Received: by 2002:a05:6870:538f:b0:1d5:aed5:6579 with SMTP id h15-20020a056870538f00b001d5aed56579mr17940362oan.4.1700158394319;
        Thu, 16 Nov 2023 10:13:14 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id gc12-20020a056870678c00b001f48e4537b9sm2302007oab.33.2023.11.16.10.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 10:13:13 -0800 (PST)
Received: (nullmailer pid 2655665 invoked by uid 1000);
	Thu, 16 Nov 2023 18:13:11 -0000
Date: Thu, 16 Nov 2023 12:13:11 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com, sboyd@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 2/5] dt-bindings: soc: sophgo: Add Sophgo syscon module
Message-ID: <20231116181311.GA2624502-robh@kernel.org>
References: <cover.1699879741.git.unicorn_wang@outlook.com>
 <3c286171af30101b88f0aaf645fb0a7d5880ac0a.1699879741.git.unicorn_wang@outlook.com>
 <20231114-timid-habitat-a06e52e59c9c@squawk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231114-timid-habitat-a06e52e59c9c@squawk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_101317_084370_43ECAB8F 
X-CRM114-Status: GOOD (  20.62  )
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

On Tue, Nov 14, 2023 at 05:40:20PM +0000, Conor Dooley wrote:
> On Mon, Nov 13, 2023 at 09:19:02PM +0800, Chen Wang wrote:
> > From: Chen Wang <unicorn_wang@outlook.com>
> > 
> > Add documentation to describe Sophgo System Controller Registers for
> > SG2042.
> > 
> > Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> > ---
> >  .../soc/sophgo/sophgo,sg2042-syscon.yaml      | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
> > new file mode 100644
> > index 000000000000..829abede4fd5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
> > @@ -0,0 +1,38 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-syscon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo SG2042 SoC system controller
> > +
> > +maintainers:
> > +  - Chen Wang <unicorn_wang@outlook.com>
> > +
> > +description:
> > +  The Sophgo SG2042 SoC system controller provides register information such
> > +  as offset, mask and shift to configure related modules.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - sophgo,sg2042-syscon
> > +          - const: syscon
> 
> THere's only one option here, so the oneOf should be removed. Similarly,
> since there's only one SoC, and it sounds like the next large sophgo
> system is going to be using an entirely different core provider, I think
> should just simplify this to a pair of "const:" entries.

For a simple syscon binding like this, you can just add the compatible 
to syscon.yaml.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
