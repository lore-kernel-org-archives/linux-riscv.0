Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D781AC83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgPOY5tciKJpeR50k2BM8Ih/fGlOs4JsE4XdJ+dvq+M=; b=w0MnxKhOGFg8Ur
	ASIolqib0VvloOZTMitb+NFezeo88YFIF88EVk+zo+zHl4gXAibHSYF0VGZ+qmNok3YLyD4m3y8Tr
	Y1iYemnguyc4HjEFVwioDjyWg8L7T7UTcVaSj695p2FjUWe9mqNrrIqILD8G8Vc2ddVofeBS4nVZy
	Run/NETXacpz9ryV/pjf6fvqp7oYRN/7Kl5CMrMe9G0yXt8QkcdJZphbmcpR+scTtiVKs8o+1ZmC4
	26YBaawEAwCZ+H+As/bhVk+seu8Uu44UrpUeD3z8t1vb4QP7JQXrONkUkb+343RQdd/xhcCDs3A/G
	rFXYKeGEAQctVm78lTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugh36-0000000GS9l-264S;
	Tue, 29 Jul 2025 09:55:08 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggt9-0000000GQoX-48KU
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 09:44:53 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AB7BE22E3A;
	Tue, 29 Jul 2025 11:44:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VG1y5xU0OrVJ; Tue, 29 Jul 2025 11:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753782289; bh=wwhfdEjKk3TD0g/+LXfOKPPQJZrSqxYsRtEHez2gGEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b+ta6P8GfdeL2XpBmv4IbvF6ca52Tkf9nYHzCEKOcEZ6dxiQC87AOb7dmQjNI0kW+
	 dTmcsSrR8iTyN4+UCJ6j+A7yJAppQu/CXkc4pasuuAOjgPgWYt+9b9X1RD74kJDDpj
	 RDYBe8llF+zGEvpP5UnCvPWjMzh3GiB6jUItGfm0MnZ5agxWAWKXOXxjI30y+K/lDo
	 mJ5W+SDybRsXe3znDYxeRfwjVe1zYkiTpA9+kJSO6rIX3bwyizEtYpQKXe9/lTXJMe
	 2wDyg7Hue6mL32UTbdQJMQktsth6Jj9Mt8UUzZOHzQSOKslVwfguWhlPTYh3+K1LRD
	 HYMUPj1/I7W1w==
Date: Tue, 29 Jul 2025 09:44:37 +0000
From: Yao Zi <ziyao@disroot.org>
To: Ze Huang <huangze@whut.edu.cn>, Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <aIiYBaEMNWg20f8-@pie>
References: <20250729-dwc3_generic-v7-0-5c791bba826f@linux.dev>
 <20250729-dwc3_generic-v7-1-5c791bba826f@linux.dev>
 <aIgmrQ7afSO5sjB_@pie>
 <aIhi9JKZvuYh2Rz_@cse-cd03-lnx.ap.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIhi9JKZvuYh2Rz_@cse-cd03-lnx.ap.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_024452_154913_69D67B85 
X-CRM114-Status: GOOD (  24.25  )
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

On Tue, Jul 29, 2025 at 01:58:12PM +0800, Ze Huang wrote:
> On Tue, Jul 29, 2025 at 01:41:01AM +0000, Yao Zi wrote:
> > On Tue, Jul 29, 2025 at 12:33:55AM +0800, Ze Huang wrote:
> > > Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> > > in the SpacemiT K1 SoC. The controller is based on the Synopsys
> > > DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> > > DRD mode.
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > > ---
> > >  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 124 +++++++++++++++++++++
> > >  1 file changed, 124 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..7007e2bd42016ae0e50c4007e75d26bada34d983
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > > @@ -0,0 +1,124 @@
> > 
> > ...
> > 
> > > +  resets:
> > > +    items:
> > > +      - description: USB3.0 AHB reset
> > > +      - description: USB3.0 VCC reset
> > > +      - description: USB3.0 PHY reset
> > > +      - description: PCIE0 global reset (for combo phy)
> > 
> > Why should the USB driver takes care of the PCIe stuff? This sounds
> > strange to me.
> > 
> 
> On K1, PHY depends on the clocks and resets it shares with the controller,
> and the controller driver is guarantees that any needed clocks are enabled,
> and any resets that affect the PHY are de-asserted before using the PHY.

So does the "PCIe0 global reset" make effects to both USB3 and PCIe
**controllers**? If not, this is something wrong in the devicetree side.

> RESET_PCIE0_GLOBAL reset is necessary during, and only, the calibration stage
> of combo phy.

If it's only used by PHY, why couldn't it be a property of the PHY?
Sorry, but I still cannot get the point.

Regards,
Yao Zi

> To simplify both the driver architecture and the device tree files,
> RESET_PCIE0_GLOBAL (and some other clk/reset) are now managed by the
> relevant controller driver (either USB3 or PCIe0) instead of PHY driver.
> 
> Only one of USB3.0 SuperSpeed and PCIe-0 will be activated in a boot.
> PCIe-0 will not be affected when it's working.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
