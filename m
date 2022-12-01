Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE9AC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 16:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROuiAP0d5yRKqf+Pjb9/MenEsHCo225X/bUBUhUiwGY=; b=hmUwHt7iByMRf1
	4onxgmNmApFXEOYriZTjB41XaoRd7e6wnXfeGGP7iBNKDrZdu7Zi9kFKEK+eBVbV6QdDnxnQnAfJ/
	Qe1LMeI45Vhj0/YAK0uL7hYU2OZ194XKBi8nGPLLii4alnYjSizQbzRDvQ8eAQrHoaZTpFdZMD0V7
	4/651eJo4dkW1fe7FdJT1nCjSo90KT4BI4Jm6ZWzjpP3c7Gx0gR7qc+klsQV+sahmWxVDpeby/+fS
	KfPprsrDwr1hk7/EUluRZszbQsXhoBve5EzIhiR0TAqvChvZ1DmzJOpuNGT38Gqmio/v6AuvqrDIO
	EDiTiJexromRln3bNEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mhL-008fQj-Kg; Thu, 01 Dec 2022 16:46:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mhI-008fNR-7u
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 16:46:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A6686B81F98;
	Thu,  1 Dec 2022 16:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AFAC433C1;
	Thu,  1 Dec 2022 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669913161;
	bh=3Q6iXy/xYg6uP/f+JVE/FhVqO1PPrAY0s5KAVCFBU0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ke+Hjq9YiFRCq0yj/GyKBDUTWPJJXuzvkPYM6eNdRTdgw64OYUqJr+o8gbjct6hO0
	 KHqXt1PFL/Hi3ew9rfbkn5emIOR1tvOitOauyeQMezokvwd3MpWvclih1D+uFSpxOp
	 AE452lttx1oA67YxwbpLo+ajBFISI3fZrZalrzJ93hE1WIBvjiudYrEjiG6JS75tWb
	 njDOwYF1aO2oT6t0B0JLVXF+0gW8sYglf+w27YexYvrZViwcDlly24fG+eQCZE1FDE
	 LRPcEHtL3fGsE9fvmbMHRLkUHTZl4OG+nxIBerYWMzFfN1qKvjhfiY8AWlc/gjRoEu
	 qQzg9kaJXzxSQ==
Date: Thu, 1 Dec 2022 16:45:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: Yanhong Wang <yanhong.wang@starfivetech.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	"David S . Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: net: Add bindings for StarFive dwmac
Message-ID: <Y4jaQ4snp6x1oU6k@spud>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-4-yanhong.wang@starfivetech.com>
 <166990139276.476262.15116409959152660279.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <166990139276.476262.15116409959152660279.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_084604_621482_68C83F1B 
X-CRM114-Status: GOOD (  23.27  )
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

Hey Yanhong,

On Thu, Dec 01, 2022 at 07:36:29AM -0600, Rob Herring wrote:
> 
> On Thu, 01 Dec 2022 17:02:38 +0800, Yanhong Wang wrote:
> > Add bindings for the StarFive dwmac module on the StarFive RISC-V SoCs.
> > 
> > Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> >  .../bindings/net/starfive,dwmac-plat.yaml     | 106 ++++++++++++++++++
> >  MAINTAINERS                                   |   5 +
> >  3 files changed, 112 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml:30:16: [warning] wrong indentation: expected 14 but found 15 (indentation)
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/net/starfive,dwmac-plat.yaml#
> Documentation/devicetree/bindings/net/starfive,dwmac-plat.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No such file or directory
>    21 |         #include <dt-bindings/clock/starfive-jh7110.h>

Perhaps, rather than putting a long list of "prerequisite-patch-id" in
your cover letters etc, you drop the need for headers from your bindings
entirely? Otherwise, you need to wait for the clock bindings to be applied
before any of your other peripherals etc can have drivers/bindings upstream.

AFAIU, and Rob/Krzk please correct me, the example in a dt-binding
really is an *example* and there's no requirement for it to match the
jh7110 dts exactly. Because of that you can drop the header & just do
something like `clocks = <&clk 7>, <&clk 77>;` etc and the example is
still valid. Same goes for all of the other driver patchsets for new
StarFive stuff, like the pmu or crypto, that also have dt-bindings.

The only person who has to worry then about dependencies is me when I
apply the .dts patches :)

>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/net/starfive,dwmac-plat.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201090242.2381-4-yanhong.wang@starfivetech.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
