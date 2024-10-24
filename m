Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D226CCE8E9A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=KLXFNoJcoE2shJOZ4A17nywTlE4NLjB0nHPRoHxOzDU=; b=NvrMOdQCBUURym
	dp3jLrVSW1PwyGJgPDzS64Md2BtuZQjJqdQ7nxHy7BnfXz5MKjGSSCkOLAoBh3kAs/RCRI/4+IyTw
	bmiBM21OeW7NWMPncLsbvsDvlGOwJz4FJDnwWfKgKntIalSqKYCNshDVK6N8JsIu7BNSWzPXTCo+z
	HuGPqe80+LmRRzSXTDOSg4td0znxyt2UKjajDiBbbPOF7Y0jsb9A37VXbeOYWvMW58fjJPNaCop+I
	PO2LP9x9bP+pz0vvkuJ4HLfhVcopTt2PEv7vD3Sl/TgwQ0r0v9rymFvR3GYHqyNOhGttdKPxHLGH1
	jZBJqkVsK4yUnozCJ06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42rI-00000001U3t-1DVs;
	Thu, 24 Oct 2024 18:46:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t42rE-00000001U3S-2IMR
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 18:46:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40207A45644;
	Thu, 24 Oct 2024 18:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6897C4CEC7;
	Thu, 24 Oct 2024 18:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729795611;
	bh=5FVyEGboaM4rj+GScXdt9qEVYfTNOXNL6tZ7z4VeYFo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UVgkk0YnFNtvfXKZbtHA23X2t0DzDyhu17nPkgpQtV/XewjU9cZpGGRGY29oopDx2
	 jeQ+6pQ+4u/zDsdh7qT2DeFqTOYRwLbzccirvWp0KwT1QLmYLRtHgd0fkVWeblVExC
	 ptAvZ4ntayRZsIdrF24TyQxb9+XtMfvzNOpWwnI0ou2hC+jnNpwzXIa2FyRD2AU8I3
	 WVGSw0VmdPkxxPXwZXl3Ut9E/L35tPM8GmiHUddw6oZKtxdXl6uM9yzBSfgHg5ru3j
	 C7j8ulGmYRuieHdCXHxQMCvBmwA8QSMvawhxjk3jH6Cx4CQIqbgbf+jigVf8XVaEla
	 CwbcKlzONrSOA==
Date: Thu, 24 Oct 2024 13:46:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-pci@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/2] PCI: microchip: support using either instance 1
 or 2
Message-ID: <20241024184649.GA967731@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241024-gout-kinfolk-0f24b28d41b7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_114652_669689_DEA3FBED 
X-CRM114-Status: GOOD (  14.16  )
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

On Thu, Oct 24, 2024 at 10:38:11AM +0100, Conor Dooley wrote:
> On Wed, Aug 14, 2024 at 09:08:40AM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > The current driver and binding for PolarFire SoC's PCI controller assume
> > that the root port instance in use is instance 1. The second reg
> > property constitutes the region encompassing both "control" and "bridge"
> > registers for both instances. In the driver, a fixed offset is applied to
> > find the base addresses for instance 1's "control" and "bridge"
> > registers. The BeagleV Fire uses root port instance 2, so something must
> > be done so that software can differentiate. This series splits the
> > second reg property in two, with dedicated "control" and "bridge"
> > entries so that either instance can be used.
> 
> Just attempting to bump this patchset. It has gone over 2 months without
> response, and I am afraid it has completely fallen between the cracks.

Thanks for bumping this.  It looks pretty straightforward to me, so if
nobody acts on it soon, I'll pick it up.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
