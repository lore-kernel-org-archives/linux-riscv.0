Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6DBEB363C
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 22:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTpEdwQcVx7nCmNRoTLOI8AuVH1gl2bP0qg2MBvkTnU=; b=1Rh32vS6SuSE5h
	6SV2LcREJRjrrfzBA5/cSmdNZG/F3I0kcoDAEG9iL0jgut6FPNsgVSkXmlvYHXPOqsv0WFc3C3ERL
	sooEKWsVx3Q15Siycfj6b8ResdwwQYF9KApJ8OZEm12NiAlvB6Z8tjUu7R66V/C1GY2a/x9aZ0fvN
	kgMc+LxFe/bdFRB4LZ48Q4FHzTVtrMOX6nXMsc+0qvNi1BZ2r9yE50zaJX3uRyVDpySbdE5R6Ggyd
	B8jmMqN91s25vLgBFJn3KZ9T/8uhQtQ0ZFBRqLh0oXyFhTyc8w3i32XYw2DRfDNn6fTpn6FZyixJ+
	vFxgsGES/tPWVVC5LLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBtx-0000000E8FN-1h7i;
	Mon, 02 Mar 2026 22:38:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBtu-0000000E8Ex-2fxM
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 22:38:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C52F7431C1;
	Mon,  2 Mar 2026 22:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E90C19423;
	Mon,  2 Mar 2026 22:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772491085;
	bh=68t5OIEMxY77Fq28mnKG3kcyRPmRItOFd7ujtleGQZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZkucZxDNFGuPU9SCSuMLEfMlasncGepkmMVtmm88jjrbeMmhAiSAJngM4Pj0BFjx
	 7Od15qYYNB8XvtJflCF5sZjR+KTRIdB5kQj0ixEHyfKnE80E9rprTH+VbOw2qRAMor
	 x/yoGexhoGOKfeYep9uzc2KgaQ7rDZwvdapTkYndfwCaGihKgSn0M9E8gxkiH3O96s
	 VR4Qr+Uwska92y39hcooTewslioUa0EMxgoJ43xZswbYxFA18rVJsooZpwGju1vx5y
	 99J6uU/pbA4hwveulHsIG1eSKkjmilviFrL4lyPnnV0u111z2jVNwfyXwvHAbjeGas
	 MM7UNvvPHbm+Q==
Date: Tue, 3 Mar 2026 06:38:03 +0800
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: mmc: spacemit,sdhci: add AIB voltage
 switching registers
Message-ID: <20260302223803-GKB289813@kernel.org>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-1-89c219973c0c@gmail.com>
 <20260302-crewman-faster-9fd00b62e30c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302-crewman-faster-9fd00b62e30c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_143806_722187_0F5876FD 
X-CRM114-Status: GOOD (  20.23  )
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

Hi Iker, Conor,

On 18:25 Mon 02 Mar     , Conor Dooley wrote:
> On Mon, Mar 02, 2026 at 04:13:22PM +0100, Iker Pedrosa wrote:
> > Add SpacemiT K1 AIB register properties for UHS voltage switching
> > support:
> > 
> > - spacemit,aib-mmc1-io-reg: AIB MMC1 IO register address for voltage
> >   switching
> > - spacemit,apbc-asfar-reg: APBC ASFAR register address for AIB access
> > - spacemit,apbc-assar-reg: APBC ASSAR register address for AIB access
> > 
> > These properties enable the driver to perform voltage switching between
> > 3.3V and 1.8V required for UHS SD card modes.
> > 
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > index 13d9382058fbc1c12be1024d1c550f04a825673c..4d6590aa8262009b6e5697a04b45cf3736c0fa42 100644
> > --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > @@ -32,6 +32,18 @@ properties:
> >        - const: core
> >        - const: io
> >  
> > +  spacemit,aib-mmc1-io-reg:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: AIB MMC1 IO register address for voltage switching
> > +
> > +  spacemit,apbc-asfar-reg:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: APBC ASFAR register address for AIB access
> > +
> > +  spacemit,apbc-assar-reg:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: APBC ASSAR register address for AIB access
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -50,4 +62,7 @@ examples:
> >        interrupt-parent = <&plic>;
> >        clocks = <&clk_apmu 10>, <&clk_apmu 13>;
> >        clock-names = "core", "io";
> > +      spacemit,aib-mmc1-io-reg = <0xd401e81c>;
> 
> This looks very very wrong to me. This is part of the pinctrl
> reservation:
> 		pinctrl: pinctrl@d401e000 {
> 			compatible = "spacemit,k1-pinctrl";
> 			reg = <0x0 0xd401e000 0x0 0x1000>;
> 			clocks = <&syscon_apbc CLK_AIB>,
> 				 <&syscon_apbc CLK_AIB_BUS>;
> 			clock-names = "func", "bus";
> 			spacemit,apbc = <&syscon_apbc>;
> 		};
> so if you need to change something here, you need to do it via pinctrl.
> 
> > +      spacemit,apbc-asfar-reg = <0xd4015050>;
> > +      spacemit,apbc-assar-reg = <0xd4015054>;
> 
> These two are the apbc syscon:
> 		syscon_apbc: system-controller@d4015000 {
> 			compatible = "spacemit,k1-syscon-apbc";
> 			reg = <0x0 0xd4015000 0x0 0x1000>;
> 			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> 				 <&vctcxo_24m>;
> 			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> 				      "vctcxo_24m";
> 			#clock-cells = <1>;
> 			#reset-cells = <1>;
> 		};
> so add a phandle to the syscon (like the pinctrl currently has) and
> access these via its regmap. What you've got here is a non-runner,
> sorry.

We've gained this support in pinctrl which already accepted in mainline,
it's done as Conor suggested here, so you can drop these properties along
with the patch [5/10], see 

https://lore.kernel.org/all/20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com/

> pw-bot: changes-requested
> 
> Thanks,
> Conor.



-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
