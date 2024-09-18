Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ECECDD543
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1KtpG86ea0ip3jnHITKET17q8Np+lllQbKm5OLld4g=; b=TogIemQnhAyfOJ
	/uPe2nSNt3Mj4RJjsuLYOkmqAA6JsN0UqEIsdAFROTsG+XxMfOzEeif/nCTI/q3TewRoV2ppQ1ttC
	ORvDw2weM//ILZV2LbVlK3nVDBDDnnU56HMyrog6gdYT8V0ua/oXq3hkOVqs/nh4bdF/9kVf0O0nA
	c9sayybg/mOCOuEjwEooEnUd4QpC6Z8mLD/7RwbEfY8FW2qzQFxmTSV3/SdkJPpT/94yr292AeBF9
	emZnsfOxpeUk7nNJQ75W0NYfEoAdgY245aKnu8VIhZJiDindPpPIHP7ITw1TY5navqdQRV4EzDnUn
	880wSPQeVcJDIA2LhqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqwip-00000008Xsb-1jFb;
	Wed, 18 Sep 2024 15:36:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqwim-00000008Xrv-22RJ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 15:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7ABC5C589B;
	Wed, 18 Sep 2024 15:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FDFC4CEC2;
	Wed, 18 Sep 2024 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726673759;
	bh=t6/c5gLj5Sr5S19QSIiY4LV1QuDRPt2TAIfzZnvEPL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sb1eBrFgQG+VGo4qvB3wbm8AsE/+UXeCFh2UwONZyzvBE034FqXsJKUcm5oWvdAYc
	 OsPjknNg2Zq9regd9voTw8vbPTwI9/XIebsla9aKJVlE4B0t2q42T0C/CSWnk6Ktee
	 81fXj7YOLONzahwPJg7911QqFFd2NPRQFV2RJTs8LAVAbM+9zPEpoL5DxJ60aIrwiM
	 OedF3BhOGnapShKgYlav/hBKYLfdylDomJEhYg2LmZ9C55rCoNXNKOCcYQdRv4jkqc
	 SruDPZEsKKDkLqWnJxSr0r0rf8fWPlnz0mmTbxrlae18oHKsXrhnw6P3hVs18nbBjP
	 98vAHay3S0+1w==
Date: Wed, 18 Sep 2024 10:35:58 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	peterlin@andestech.com, dminus@andestech.com, ycliang@andestech.com,
	jassisinghbrar@gmail.com, krzk+dt@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, conor+dt@kernel.org,
	conor.dooley@microchip.com
Subject: Re: [PATCH v1 2/5] dt-bindings: mailbox: add binding for Microchip
 IPC mailbox driver
Message-ID: <20240918153558.GA1567736-robh@kernel.org>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
 <b4acc0a7-b7da-4947-904d-8406aa5ba95b@sifive.com>
 <20240916-palpable-flock-7217424ed8db@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240916-palpable-flock-7217424ed8db@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_083600_637457_913FC5DB 
X-CRM114-Status: GOOD (  27.76  )
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

On Mon, Sep 16, 2024 at 05:31:36PM +0100, Conor Dooley wrote:
> On Thu, Sep 12, 2024 at 04:23:44PM -0500, Samuel Holland wrote:
> > Hi Valentina,
> > 
> > On 2024-09-12 12:00 PM, Valentina Fernandez wrote:
> > > Add a dt-binding for the Microchip Inter-Processor Communication (IPC)
> > > mailbox controller.
> > > 
> > > Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> > > ---
> > >  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++++++++++++++++
> > >  1 file changed, 115 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> > > new file mode 100644
> > > index 000000000000..dc2cbd5eb28f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> > > @@ -0,0 +1,115 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mailbox/microchip,sbi-ipc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Microchip Inter-processor communication (IPC) mailbox controller
> > > +
> > > +maintainers:
> > > +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> > > +
> > > +description:
> > > +  The Microchip Inter-processor Communication (IPC) facilitates
> > > +  message passing between processors using an interrupt signaling
> > > +  mechanism.
> > > +  This SBI interface is compatible with the Mi-V Inter-hart
> > > +  Communication (IHC) IP.
> > > +  The microchip,sbi-ipc compatible string is inteded for use by software
> > > +  running in supervisor privileged mode (s-mode). The SoC-specific
> > > +  compatibles are inteded for use by the SBI implementation in machine
> > > +  mode (m-mode).
> > 
> > There is a lot of conditional logic in this binding for how small it is. Would
> > it make sense to split this into two separate bindings? For example, with the
> > current binding microchip,ihc-chan-disabled-mask is allowed for the SBI
> > interface, but doesn't look like it belongs there.
> 
> I dunno. Part of me says that because this is two compatibles for the
> same piece of hardware (the choice depending on which programming model
> you use) they should be documented together. The other part of me is of
> the opinion that they effectively describe different things, given one
> describes the hardware and the other describes a firmware interface that
> may have any sort of hardware backing it.
> 
> I suppose it's more of a problem for "us" (that being me/Rob/Krzysztof)
> than for Valentina, and how to handle firmware interfaces to hardware
> like this is one of the topics that's planned for Krzysztof's devicetree
> BoF session at LPC.

If how the client interacts with the device is fundamentally different, 
then I think different compatibles is fine.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
