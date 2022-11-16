Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE38C43217
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mVO3/Z+afIZAptDexTPChmuj5YNXG797QCeW1BMKuwU=; b=Xb77jBfIM9fEKc
	WdVUK2+kbCWgrs2PnLbZj9NneX4jAf24ykdtoGO73NYTSUp2Lv0hOT/XXOARvcdVnIkn6bZkdNPmv
	pLMROZW9P733Wz7jCwCozL9KvU82LkrquZwMR2ze4XOtYuZZjPHe3nuhSdKDroXm07VJ3e7x2ut7G
	e3x+5PG5jFxYNj51RDPEHJzOcV/zi4TttMTXcvqOnvPLA/OfEYV94WWODEPy84sDmbT7wIRDu3+p2
	xwt9mcTI6qW0U8EzeFXR9emZLBFTato5B4Lwd23BZe5S0+6yiZnpUUD4O8pVONKD0gTBa/F5zMDLc
	lgQP/40sGGxsMGlpg01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLbg-0063mJ-Dj; Wed, 16 Nov 2022 16:49:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLbV-0063eh-6I
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 16:49:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE57561EEF;
	Wed, 16 Nov 2022 16:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E388EC433D6;
	Wed, 16 Nov 2022 16:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668617375;
	bh=VAFDprgM6w7FOLGVwkM8iPVVvSqgQuNzd6tbPutPWOE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=i1vHS5JM7e1vrCk1xFOU0C6Byb275qT2HJSd2hGKjzth775JIW22x0K9zPcQhd8S7
	 RGN3bMso+90e0cbcFsMlX5ohXxh1Bh9Ezfi7e5YnvoTd7xfNu0qrIsSdSNJld7XXlr
	 tcZMGKJOxo2oXhvLh3ubSk2XSbPDtdiuNMcVKIRqmId1NdOKEteD39y3pv4QBFJM4Z
	 algaWvkuY1A4FI8T5lM5pcaYyFzkw4ZqbAEypOa5JmNsOz3cAWQa416P7r9N1H8ZMn
	 7aCTF0hLppuay8Gw39EQ0FYkrNNpoPIRRuq9I0ZzvJj0evbcbVrPVmVtZHChKmJLau
	 6/G39SdL6/yOw==
Date: Wed, 16 Nov 2022 10:49:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 8/9] PCI: microchip: Partition inbound address
 translation
Message-ID: <20221116164933.GA1117375@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116135504.258687-9-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_084937_285730_602AB7D1 
X-CRM114-Status: GOOD (  11.85  )
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

On Wed, Nov 16, 2022 at 01:55:03PM +0000, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> On Microchip PolarFire SoC the PCIe rootport is behind a set of fabric
> inter connect (fic) busses that encapsulate busses like ABP/AHP, AXI-S
> and AXI-M. Depending on which fic(s) the rootport is wired through to
> cpu space, the rootport driver needs to take account of the address
> translation done by a parent (e.g. fabric) node before setting up its
> own inbound address translation tables from attached devices.

Hi Daire, minor nits:

s/inter connect/interconnect/
s/fic/FIC/ ?  Sounds like an initialism similar to ABP, AHP, etc?
s/busses/buses/  Both ok, but "buses" much more common in drivers/pci/
s/cpu/CPU/
s/rootport/Root Port/  I try to follow PCIe spec usage.  Below you use
"root port" (with a space).  At least add the space to make consistent
here.

Some apply to previous commit logs, too, IIRC.

> +	/*
> +	 * check for one level up; will need to adjust
> +	 * address translation tables for these

Wrap to fill 78 columns or so.  Most existing comments in the file are
also capitalized per normal English conventions.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
