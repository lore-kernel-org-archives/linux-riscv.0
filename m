Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E451C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+PHeKuBMaYKwEOxYoE7iz2P1DguhBt0E1xCmG4/i7s=; b=aiG9mLsYfD1hZ2
	64cvFNPaaTwMsW0/znFEWG0NIKkvCU0b0VYdiJpFsqdKjEBIDwwNvrybSG7kx+NsBgR7KVFtRUZVZ
	XcebkC1JYQycSO58in9YIP25NPTaXlbjWcSkgWlXVzMvQggUorvOsK8jRnNuARrm9fWW4y/yQWrb8
	pwTDsjU/9mXs4sDFto/G7dQ1zlrKVDzn778rLOh8Q5Z42nWBP/alAom9068M2MimarXnGv7VVDhDm
	ALhxVx56wwlHjz5WJPFlGUD1QVEwN6woSrSiXdbr78f2j2sKwNGRLu0qTWbAFt1naee8Ht9pD+0Po
	rYtocYIHZkInaI8ZefqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLn3-006D71-9z; Wed, 16 Nov 2022 17:01:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLn1-006D50-KZ
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 17:01:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1DDEFB81DFB;
	Wed, 16 Nov 2022 17:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5287C433C1;
	Wed, 16 Nov 2022 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668618088;
	bh=NgoF6H00h3ybNCo6l/K8tFBS2V1ks1ySzik7gT4hXNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRoPIvZpsWLj/7UGSIdWIPvQjcFJalHa573TZ/VHCv4kLyK287rBf6Z1Xqy7Dc7RQ
	 7+TjvseRIv9wT9LpnMD52pFutfEuKT0QHDyZav2PKs+gFCG28hGSj1Qy1lYur1Jw6x
	 15B5y5ElxGxS6OVvFMWFZfjCsnQlUVEDT/P+GwI1sqRCuniXNLzVZfkP0JTJQ8qblq
	 MdTs48N9/9C1PNgkpN8FJgX1/TAl3oBnRdZvUVF1l6Oz60WDsEGObd9wJNoa64gN2g
	 /J7VNSVF+ezMZx1AAAPOJ9/rfI0OqFlqZjJ99CZuU1vY0mAuvyvHSkyCTP9r0ndMu8
	 JbduaOG9bh5Fg==
Date: Wed, 16 Nov 2022 17:01:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>, daire.mcnamara@microchip.com
Cc: daire.mcnamara@microchip.com, conor.dooley@microchip.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 8/9] PCI: microchip: Partition inbound address
 translation
Message-ID: <Y3UXYyyJUE0WexxD@spud>
References: <20221116135504.258687-9-daire.mcnamara@microchip.com>
 <20221116164933.GA1117375@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116164933.GA1117375@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_090131_836149_762EC6E1 
X-CRM114-Status: GOOD (  12.39  )
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

On Wed, Nov 16, 2022 at 10:49:33AM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 16, 2022 at 01:55:03PM +0000, daire.mcnamara@microchip.com wrote:
> > From: Daire McNamara <daire.mcnamara@microchip.com>
> > 
> > On Microchip PolarFire SoC the PCIe rootport is behind a set of fabric
> > inter connect (fic) busses that encapsulate busses like ABP/AHP, AXI-S
> > and AXI-M. Depending on which fic(s) the rootport is wired through to
> > cpu space, the rootport driver needs to take account of the address
> > translation done by a parent (e.g. fabric) node before setting up its
> > own inbound address translation tables from attached devices.
> 
> Hi Daire, minor nits:
> 
> s/inter connect/interconnect/
> s/fic/FIC/ ?  Sounds like an initialism similar to ABP, AHP, etc?

Daire, we've been living a lie. The TRM says "Fabric Interface
Controllers (FICs)" so I think we should switch the that wording.
Fits the acronym better too..


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
