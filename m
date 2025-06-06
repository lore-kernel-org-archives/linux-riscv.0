Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6F3C61CE8
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJLHHKs9QiX1rmQ6nC/FFbrUdqUHLlMYVCf7UEFJQtM=; b=2evIpQIORhC5yz
	fJhs4kVKj6V+tnd4RT2ixPR6OYhX6YrTjyOaIj8RH1fwjoQdU38wORHowygbcypS/POxt2O9qixCw
	6UAF+oGZ+lOn0XmhMyFwc5/ZK3xSX+i423jWC1zeD3aRcGmA4PudvNPM6nFH0iCz2KlwFCKS9FT3V
	+uUlBujXhm4OH82nSTG1pzo/VLLaVZMIWQTWgKGPmv0SxAyb/mlv32IMf2diF8fAjnwuX3Ns9kmOz
	xGVpjAnfNc5tgECnpcHeMYbpC314UHc50OXJ2L7qcOsZlEk0pgDMAjRndMttWkI/qIjkkOJpbem8q
	xCElNGi+XKYWC0PXKFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNVUF-000000009HQ-14SM;
	Fri, 06 Jun 2025 11:43:51 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNVUB-000000009H2-2vSD
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 11:43:49 +0000
Received: from localhost (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.17.176.245])
	by smtp.qiye.163.com (Hmail) with ESMTP id 17c6f2803;
	Fri, 6 Jun 2025 19:43:38 +0800 (GMT+08:00)
Date: Fri, 6 Jun 2025 19:43:38 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] usb: dwc3: add generic driver to support
 flattened DT
Message-ID: <aELUajmfzmb7w3W9@jean.localdomain>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
 <20250605213443.17a7aa26b@smtp.qiye.163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250605213443.17a7aa26b@smtp.qiye.163.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSkkfVkoeTU4ZH0xDGEweQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKTFVKTE1VSU9OWVdZFhoPEhUdFFlBWU9LSFVKS0lIQkhCVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a97450dc07b03a1kunmea2195ced05ae
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ogg6Phw5ODE1SBgyIwoTFiMq
	CjcaCkpVSlVKTE9CSUpLSUpCTUlPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKTFVKTE1VSU9OWVdZCAFZQUpCTE83Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_044347_934049_B96F7DD3 
X-CRM114-Status: GOOD (  13.23  )
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

On Thu, Jun 05, 2025 at 01:34:27PM +0000, Yixun Lan wrote:
> Hi Ze,
> 
> On 22:40 Mon 26 May     , Ze Huang wrote:
> > To support flattened dwc3 dt model and drop the glue layer, introduce the
> > `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> > and offers an alternative to the existing glue driver `dwc3-of-simple`.
> > 
> > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > ---
...
> > +	ret = reset_control_deassert(dwc3->resets);
> > +	if (ret) {
> > +		dev_err(dev, "failed to deassert reset\n");
> > +		goto reset_assert;
> > +	}
> > +
> > +	ret = clk_bulk_get_all(dwc3->dev, &dwc3->clks);
> can you check if able to use devres api for reset/clock here?
> (functions start devm_ prefix)
> 

OK, will do

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
