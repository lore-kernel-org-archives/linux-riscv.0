Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BDCCAC58E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 02:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVjf18CBnOmpyprZ12WOysE1U3/qpjtPmoi8hGEBYa8=; b=CTSVSGeBaBrSbj
	QDgxrAwwJtM+S4yGt02k2AHGa22GxaN21n2FS1OQeY06kxZJIRhnBd+gy78Yq9L+7Otp4abABPVWJ
	9JZKU0/WlqaUFEfxhJQJMGux+lUifUz4rcau198XdW10IEK8UYDZyRbDjeqo9P3v7IoAlJz1TwTCU
	uSWAP+namoD6zcs7WFnOFNG+Si7SdE6Tw04DpyxYNndjF+iGbdGB2Xc47fIpu6PTzrWeO8hB9OVPp
	Kx5DY6haqFYT3hTjJVtYRa/9sgQUxlhebGi7HD7e/OJL9ckN7BJDbJRWI4MH6GmbodWkSbIRLIipm
	ea/F+hAzLRWZbQmGC8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXRb-00000000TV4-2xyY;
	Thu, 11 Sep 2025 02:53:55 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXRW-00000000TTi-3WnV
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 02:53:55 +0000
Received: from localhost (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [IPV6:240e:474:b942:3f59:6226:58b7:4db:46bd])
	by smtp.qiye.163.com (Hmail) with ESMTP id 22684c28a;
	Thu, 11 Sep 2025 10:53:41 +0800 (GMT+08:00)
Date: Thu, 11 Sep 2025 10:53:41 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Frank Li <Frank.li@nxp.com>, Ze Huang <huang.ze@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ze Huang <huangze@whut.edu.cn>
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <aMI5tSq3e2MbFrlV@monica.localdomain>
References: <20250729-dwc3_generic-v7-0-5c791bba826f@linux.dev>
 <20250729-dwc3_generic-v7-1-5c791bba826f@linux.dev>
 <aMH5P3Xae0MCt6wu@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMH5P3Xae0MCt6wu@lizhi-Precision-Tower-5810>
X-HM-Tid: 0a9936b16c3d03a1kunm4e2ef7fb19acdd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHkkZVkgZSk5MTUlMTkNDSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQU9MT0EZQk9JQUgdTkJBTUlJTUFOQxlMQU8fGUFPTRkfWVdZFhoPEh
	UdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_195351_044683_A48B0B41 
X-CRM114-Status: GOOD (  12.22  )
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

On Wed, Sep 10, 2025 at 06:18:39PM -0400, Frank Li wrote:
> On Tue, Jul 29, 2025 at 12:33:55AM +0800, Ze Huang wrote:
> > Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> > in the SpacemiT K1 SoC. The controller is based on the Synopsys
> > DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> > DRD mode.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > ---
> 
> Ze Huang:
> 
>    I seen Krzysztof and Thinh Nguyen already acked this patches. Do you
> wait for greg pick it up or need respin?
> 
>    My one layerscape usb patch depend on this one!
> 
> Frank

Hi Frank,

I'll remove the PCIe reset in the update - since Alex's latest combo PHY
work now manages this functionality. The patch is otherwise in good shape though.

Look for the updated series from me before end of week.

Best,
Ze

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
