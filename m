Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCC9C32774
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 07:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUCT1XlVXgN+yNwwWchHUNpu4HlvgWgtNGgizKjUGCs=; b=AF7pIWvT2yBJqt
	xzEr8D9RgM5MsC6/5ZjfK5ABPDNJZksMCBrF2Dna2McXBnEacyTnKZCpqgw7df/1w69KeGvEqs5WE
	0u9nafstSUMcdCWGKdYBjefaH/zOr2xkZCwbmOq2LL5Ee/Z7cFXDN16YCdIWClvqVb34V3RrQcQqp
	6nCJgyQFnUi2aFEftSeNbuYA1s7JzqcoBYfH2PgPGkPxAuO8lucKK0nOTyNXpoJywk3VuU58mDO5s
	VqeXnNp0ZVALOf2FzpSVbNJZcq4r7/SR/UOxv/6N9gYu8k87g9yw548Ck40qhvY9kpV0KM+btmZO2
	yWBbsZIb+8TO7BvUspIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQOa9-003Z2z-Mx; Tue, 23 Aug 2022 07:44:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQOa6-003YyV-MT
	for linux-riscv@lists.infradead.org; Tue, 23 Aug 2022 07:44:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9F0761538;
	Tue, 23 Aug 2022 07:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7401C433C1;
	Tue, 23 Aug 2022 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661240648;
	bh=bT8JLEYL7CvXHYG8IVYaH71kd/rfXTkG5EBbqkCKgcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKRGUQJq3omR1yzRzZOaVV2eBULrBmcDPW7XwoaCpoMcxVmrvV2Gw3YSZQ9pBfRvT
	 1PklB5pXIui5jLCwuV5ZXQp1gPoAF+IPozsTdUyh6CT9BRyDD+46VppsMGu/PNk+gP
	 RxO195aSkDBsVvRQ5spPNtBeQDyojLpRswUifvTuHUicbl5eD3w4hnCs1P6K+dJKkI
	 8oySsofzRgl4jEOc8asrCre5bWwXQ3VM9Ms/PTUPjb9kpoaqbiuZkvUNBAl6b6qx4V
	 Qs9KzEymFQK3PBX68huGrTvMrYG1c37LmBNkqt0s//7crbAbd13JMpsEYMJMJOrZhs
	 3hye9ihvhV4lw==
Date: Tue, 23 Aug 2022 09:43:59 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <mail@conchuod.ie>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	Greentime Hu <greentime.hu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: PCI: fu740-pci: fix missing
 clock-names
Message-ID: <YwSFPwOkPIVC02fM@lpieralisi>
References: <20220819231415.3860210-1-mail@conchuod.ie>
 <20220819231415.3860210-2-mail@conchuod.ie>
 <20220822192032.GA283027-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220822192032.GA283027-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_004414_798722_B9A6ACCA 
X-CRM114-Status: GOOD (  17.34  )
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

On Mon, Aug 22, 2022 at 02:20:32PM -0500, Rob Herring wrote:
> On Sat, 20 Aug 2022 00:14:10 +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > The commit b92225b034c0 ("dt-bindings: PCI: designware: Fix
> > 'unevaluatedProperties' warnings") removed the clock-names property as
> > a requirement and from the example as it triggered unevaluatedProperty
> > warnings. dtbs_check was not able to pick up on this at the time, but
> > now can:
> > 
> > arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: pcie@e00000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
> >         From schema: linux/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> > 
> > The property was already in use by the FU740 DTS and the clock must be
> > enabled. The Linux and FreeBSD drivers require the property to enable
> > the clocks correctly Re-add the property and its "clocks" dependency,
> > while making it required.
> > 
> > Fixes: b92225b034c0 ("dt-bindings: PCI: designware: Fix 'unevaluatedProperties' warnings")
> > Fixes: 43cea116be0b ("dt-bindings: PCI: Add SiFive FU740 PCIe host controller")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > v2022.08 of dt-schema is required.
> > ---
> >  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml        | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Should I pick these bindings updates up ?

Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
