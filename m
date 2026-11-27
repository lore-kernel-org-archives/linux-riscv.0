Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2A6606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ksktbfdi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMDtk+JA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xh+gTIjBLalB9Vfs6S8JHYggE84cTzO7K/+DiIcxvEo=; b=ksktbfdi7nk2rI0FPWw+J3uGjU
	KkFrnuibUqyxZ9ceUZaG8WHpADPTkKND743Qr+Q2lJpLdcliVC8nDTmNGFlbzREWNTOKSQxeMySwE
	tdr/7WKqnoxJI69C0LXsHG+/O2Ml5PCtl25lB22Qfjh3gT1vTmGk/G2DwQqJP+75Lbhk5LKXauYYj
	VxD18CTGvwI5c/BiKVp09VbGj57H5yXn6vhV/9ISSWzgCrC6uU59Q8ejguO7fuJy9vbr3t5xtAgFQ
	uCs7k/rc9EU3ru0KrYaVTx1LPoZR8wfM99l5CLS5qd45azZ+VJcGmsuQAmwCwcCeLnA5bXFIKumZl
	3X2ddxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuZ0-0000000Fuqz-3h4D;
	Fri, 27 Nov 2026 11:56:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuYz-0000000Fuqk-3rpF
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 11:56:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 068F6621A1;
	Fri, 27 Nov 2026 11:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67F41F00893;
	Fri, 27 Nov 2026 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780584;
	bh=IkLuTMyUuvtAIOJvKS4W5OnPvsELCClQmcENJYo+ClY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AMDtk+JAMxtOsgCYR7Tusz2QRsZZkiHpXp/v/sh6QrwjcI3WBGSXtxfnxKtudM1el
	 k/fR9W90ToPqji3UmUEgWCcGVUt7Vxjy9ZvYn1qSYmpO+EAyboFVmiPYeeOXyxiQgE
	 /Xgna69TWzSsbE7X4Gi997HAaFWidlZG67RwmcW0tqiHzqGeR5MkCXfNvfX6Htg6hG
	 jq6ma+ygm98psveaQlvUD4oZpqRtgMS3QTxS6vlCIgUPHhe5ATRznlgnL7+qLqmjua
	 gbR1CaX3PKh3vkBFRiNdYNxSJ3Lbhv0HS97EV6E2zlOpIaIvqCjuZjvAX94/L851oc
	 Uc/w+4yjIbhgw==
Date: Fri, 27 Nov 2026 11:56:19 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Wang Yang <yang.wang@deepcomputing.io>
Cc: Yixun Lan <dlan@kernel.org>, Benson Leung <bleung@chromium.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] platform/chrome: Add SpacemiT K3 eSPI EC transport
Message-ID: <awlv4wDjNQ8nXYiH@google.com>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-6-yang.wang@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118085742.1817536-6-yang.wang@deepcomputing.io>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 04:57:38PM +0800, Wang Yang wrote:
> Add the K3-specific EC transport as a separate driver. Use a vendor-
> scoped Kconfig symbol, module name and compatible. The register mapping
> and recovery API are tied to the SpacemiT K3 controller, so this does
> not claim to be a generic eSPI EC transport.
> 
> Preserve the original independent eSPI command and event logic. Existing
> EC core, LPC, protocol and keyboard implementations remain unchanged.

I haven't done a detailed review as some functions in this patch
(ec_response_timed_out, pkt_xfer, cmd_xfer, readmem) are based on (and
very similar to) cros_ec_lpc.c.  Is it possible to refactor
cros_ec_lpc.c to extract the common logic first so that this driver can
reuse it?

E.g.:
- cros_ec_lpc_proto.c and cros_ec_lpc_proto.h for the common logic.
- cros_ec_lpc uses the common logic.
- This driver (consider renaming to cros_ec_espi_spacemit) reuses the
  common logic.

Similarly, instead of handling ec->irq in the driver, refactor
cros_ec_register() first and reuse the logic in the driver.

E.g., only set it to IRQF_TRIGGER_LOW if it was unset:
    unsigned long irqflags = IRQF_ONESHOT;
    if (irq_get_trigger_type(ec_dev->irq) == IRQ_TYPE_NONE)
        irqflags |= IRQF_TRIGGER_LOW;

Or introduce an ec_dev->irqflags field:
    if (ec_dev->irqflags == 0)
        ec_dev->irqflags = IRQF_TRIGGER_LOW | IRQF_ONESHOT;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
