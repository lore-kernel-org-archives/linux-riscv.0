Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F7CC7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 21:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baCPS+ujbyMGlcVEga1jmgRfgujJWg4v2RSHKWhWETA=; b=U4qJ0G0Sary+fM
	TTPaX00WGp5ARwr8/FVQyCMe42Yrx+f9YdSaf+y/APBRtr4VuZU4JViiBSbyRx3oMZBQBfJrt7Sxs
	D4EU9sxzWqaOrLVoyKkE3O8rtCAi7Nn/bIxAv39LccNk13dv4ccQnz6wEEwehMfYJVdjAL4f0AAgR
	t/cf+eZaNUOV0n1AEGRUNtb/fqdvJ9GlAaQMaxvNu5VrOKXl0pjQ0tZJJ5uIWjKvs2e+jwcnW/kut
	12MCuKaEIsedKx9xz5sgtImVAqVvz981c0VZMsLfLxhWhIv6jIP5u3SGAM/gYcK/ipA2tbkTNFiEI
	xcCSc/BcSVJP2YNAilsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXpY-00000009yhm-0moF;
	Wed, 25 Jun 2025 21:38:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWGq-00000009nXb-12KR
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 19:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B6CD5C5CDB;
	Wed, 25 Jun 2025 19:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECD4C4CEEA;
	Wed, 25 Jun 2025 19:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881539;
	bh=/QqjKA1nb6MHEABcPVKqJW38bKn+uzRsO95qFrtWnas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGQgAtxXVdUaq5D0XGTFjnPhGxs89C40PEYlONinnaK/PlHyPtgQw+SphbOjV6l5Y
	 LtU0X9Ds5KNGuHEmrBl5oFTrd6u+WP9tPCaNV5Q5nZ49L4sFN1aVZm6D+JZzsuG5Ui
	 /X0Y5k1fQhzEXcCN/1HUKyQD7/JtcTJjQE8YzgCQ6meTb7mFjRltPQU2TcmJxCppb8
	 3cDpmgvTzR4s3D8cv005uy5QVF8kFdcC30+2tv7w9YK/klqlVJfImpQLR8t4bdguRQ
	 qQ0+iFxS3WuUXqIIl61zM1V5SORd0Eho1ue8Bocpu1kGmBCSgKX7Xpbw3FjtQ3fvWN
	 hZsIowV/uZm4Q==
Date: Wed, 25 Jun 2025 14:58:58 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20250625195858.GA2115486-robh@kernel.org>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612-culpable-roman-295df1360198@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_125900_369639_5620419B 
X-CRM114-Status: GOOD (  17.37  )
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

Not necessary if the referenced schema has 
unevaluatedProperties/additionalProperties set to false. The tools check 
for this.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
