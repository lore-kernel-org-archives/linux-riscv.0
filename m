Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C100C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQjLGEaG99/31Roj9KMFfYYAoCy6UiqyZJw9rvkFBbY=; b=Vae5Q7BOFe8Hju
	XY+Ka7hV4+PcCKeLxFy8v2I3RGAbv+xxVzIm/M1oaSDRP2eesSySyBZjHPsaYmcsme848YN7HGst2
	pY61bgD1mp5sp9OWn41k27wF3vxlGDDFtuU33cJb/jhmdFkb6+coL8f+5fsPIewkK8/eJ8ehAKoWb
	JWt2ypONYir0nalAwrp6XBELvnBZrK9smQ8CGA8pq83FwQtWq9mimx1+rEKdk4Zo5XbwAUjnlCH7f
	llab9EgNICMBrMBxDYHuUbL7aoYYEv9Qh4qWsHu+f4NN45kRluf6GWC7NVnfcAJ6i8S3uh98fYITU
	1a23LNTlkQtfXFvgKS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRuu-0000000Bnf7-2iBq;
	Mon, 29 Jul 2024 15:04:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRsy-0000000Bmt6-051p
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 15:02:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4646B61A40;
	Mon, 29 Jul 2024 15:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8DCC4AF0A;
	Mon, 29 Jul 2024 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722265323;
	bh=Z3oEEBdSHgN0bkthRPf/JvesgDNuaiaeKjStAc4mw50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6iGGnrtRtgbzF+GVoKbEna+hIBbGBcUCsSMuF5McoWT/DJ4yBe2042p+ul1uG3RU
	 2f/r7rAnOKSv4zOlkVZnI9FYajrktdEVoxTm5yr4sVZDJqeYVSu13jfrsFipQmCoJi
	 B5t3OAqmCNnacxvx4bVTt4+WAxFMNmswFHbvFfBrGsuCMlf/ZI/phWU86Z3gPce3Ua
	 GIC9K8NmupfdOLfEUI5DbZMNT8nDEWtMLTotRUJiwVDw8J3Qux0QySHGHGMG7AoVvI
	 FhsiHc300H7YJEHW1hMpXL3Z467J3QKSAKRk3U4JxDU3ZLT7h/MD+PYuk9WxzTIHhd
	 BejSYQcZDgP4A==
Date: Mon, 29 Jul 2024 10:02:01 -0500
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	dmaengine@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>, linux-riscv@lists.infradead.org,
	Chen Wang <unicorn_wang@outlook.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v8 RESEND 1/3] dt-bindings: dmaengine: Add dma
 multiplexer for CV18XX/SG200X series SoC
Message-ID: <20240729150201.GA334758-robh@kernel.org>
References: <IA1PR20MB49535EC188F8EE3F8FD0B68DBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953865775FA926B2BA4580CBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <172223050278.2763977.11180028101195359000.robh@kernel.org>
 <IA1PR20MB4953E3AEACAC85765AE9442BBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <2e4b504c-6413-42fc-a544-472d4cc1a06b@linaro.org>
 <IA1PR20MB4953343445D88F046E1D28EFBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953343445D88F046E1D28EFBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_080204_217350_DF1F7BD2 
X-CRM114-Status: GOOD (  21.41  )
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

On Mon, Jul 29, 2024 at 08:28:09PM +0800, Inochi Amaoto wrote:
> On Mon, Jul 29, 2024 at 11:30:20AM GMT, Krzysztof Kozlowski wrote:
> > On 29/07/2024 09:00, Inochi Amaoto wrote:
> > >> yamllint warnings/errors:
> > >>
> > >> dtschema/dtc warnings/errors:
> > >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> > >> 	from schema $id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
> > >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> > >> 	from schema $id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
> > >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> > >> 	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
> > >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> > >> 	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
> > >>
> > > 
> > > Hi Rob,
> > > 
> > > Could you share some suggestions? I can not reproduce this error with
> > > latest dtschema. I think this is more like a misreporting.
> > 
> > You would need dtschema from the master branch, so newer than 2024.05.
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> Is it a must for the type array to have more than 1 element?
> I have tested the value "<&dmac 0>" and "<&dmac>, <&dmac>".
> Both pass the check (These value are just for test, not the
> real hardware).
> 
> Setting dma-masters to type "phandle" also has no change. 
> It do not accept the value "<&dmac>", Is there any suggestion
> for this? Thanks in advance.

The issue is 'dma-masters' is also defined as a uint32 in the Spear 
binding. Types aren't local to a binding, so when there's a 4 byte 
value, is that a phandle or plain uint32? I'm working on a fix in 
dtschema for this. It should be committed shortly.


Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
