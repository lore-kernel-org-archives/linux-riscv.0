Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F592C87FC9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 05:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvQiqOkw+cyZ2cfL56NtW50A66l/R0H6C8+6/eUZ8A8=; b=mXsm2ptSImPWJe
	r48vLgu+Vs9Q8i5QFwHd1g2BJIhHjKdXB7jgGwamNOXcHLiLum9JQBVKl+RGpsjHzmVrAT+w0Krmg
	5IFZTUQNdCkmA5ew8xCShwz4GtTmD0Q/HTqWpqfLA96A11HFiQKhhm0n+RlIDXbJHhkMvcMR54pbi
	jVqApRJ5eLtSungiPcDqudC8dIgAX0F0tb1tQMxj2eLEIr/cVDoOajWhbHOvHRIEgdrSXDg3Oonal
	UG2HDW3zlpOAPbLUU0+htzchv7lPpyGiYRTuWuZKQXSK0jiOjn/cHMXpWSQyGz/4U6uEC5FgbbVGu
	tO4cz7mQq6hcBNvtAOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdM4-0000000FzAl-1ySu;
	Tue, 29 Jul 2025 05:58:28 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdM0-0000000FzAA-37Ck
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 05:58:26 +0000
Received: from localhost (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [114.94.8.21])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d9200ef5;
	Tue, 29 Jul 2025 13:58:13 +0800 (GMT+08:00)
Date: Tue, 29 Jul 2025 13:58:12 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Yao Zi <ziyao@disroot.org>, Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ze Huang <huangze@whut.edu.cn>
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <aIhi9JKZvuYh2Rz_@cse-cd03-lnx.ap.qualcomm.com>
References: <20250729-dwc3_generic-v7-0-5c791bba826f@linux.dev>
 <20250729-dwc3_generic-v7-1-5c791bba826f@linux.dev>
 <aIgmrQ7afSO5sjB_@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIgmrQ7afSO5sjB_@pie>
X-HM-Tid: 0a9854c28f5e03a1kunm053f6d441bb8a9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTx4dVk9CGhgZS0xMGB4aSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk9VQk9VQ1VJSllXWRYaDxIVHRRZQVlPS0hVSktJQk1LSlVKS0tVS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_225825_020508_0B7BF080 
X-CRM114-Status: GOOD (  19.60  )
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

On Tue, Jul 29, 2025 at 01:41:01AM +0000, Yao Zi wrote:
> On Tue, Jul 29, 2025 at 12:33:55AM +0800, Ze Huang wrote:
> > Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> > in the SpacemiT K1 SoC. The controller is based on the Synopsys
> > DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> > DRD mode.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > ---
> >  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 124 +++++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7007e2bd42016ae0e50c4007e75d26bada34d983
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > @@ -0,0 +1,124 @@
> 
> ...
> 
> > +  resets:
> > +    items:
> > +      - description: USB3.0 AHB reset
> > +      - description: USB3.0 VCC reset
> > +      - description: USB3.0 PHY reset
> > +      - description: PCIE0 global reset (for combo phy)
> 
> Why should the USB driver takes care of the PCIe stuff? This sounds
> strange to me.
> 

On K1, PHY depends on the clocks and resets it shares with the controller,
and the controller driver is guarantees that any needed clocks are enabled,
and any resets that affect the PHY are de-asserted before using the PHY.

RESET_PCIE0_GLOBAL reset is necessary during, and only, the calibration stage
of combo phy.

To simplify both the driver architecture and the device tree files,
RESET_PCIE0_GLOBAL (and some other clk/reset) are now managed by the
relevant controller driver (either USB3 or PCIe0) instead of PHY driver.

Only one of USB3.0 SuperSpeed and PCIe-0 will be activated in a boot.
PCIe-0 will not be affected when it's working.



Hi Alex, please correct me if anything wrong

> > +  reset-names:
> > +    items:
> > +      - const: ahb
> > +      - const: vcc
> > +      - const: phy
> > +      - const: pcie0
> 
> Best regards,
> Yao Zi
> 
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
