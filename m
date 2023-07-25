Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C674C001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 20:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=nmUXg/0NqWzP+16ir0bE0b+su/EC865fo0kPUU90heY=; b=fBInGS6+2x5Nyp
	K+xYbvLzQ7PA8lAwZG2rQVjj9rMjyop4+j7M3R+K5uLXh7tKCoezCVCG7BMpONU1w6ZbaMY1M5/um
	SMs13Pr1mO1ip9jXqscfUq7q9eRX6o1Zp8ettn4ASpA1LE0cdRCRwJgH+cSfoBNgsUVWYjSRmcTig
	bDQvw61RoaR3D3u9k+jSs7Iu8c+gqX/sZ2c2nrhz1lkrvqxOXg3hxdNP5cStdPtpeODlfl0hKqrlh
	e1lkjfez8MfQwhxXMcPHa2Eq2ZL6sDgjD0qd57Fhw9J5Ev3ho2YRuR+j2MvWM4PIO5inyAssYWUIs
	D9+zEeldtVGeAoN2PRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOvY-008TCn-1I;
	Tue, 25 Jul 2023 20:46:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOvV-008TCO-07
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 20:46:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3587C618E6;
	Tue, 25 Jul 2023 20:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52251C433C7;
	Tue, 25 Jul 2023 20:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690317995;
	bh=DLA6OAhIubZj4rPsH89WQo5bkfHHHDQZqjjyCtICNoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=P15Cwmwe3zkRSOi5sZtydKCn1t9svJ7FkJvS2yQHsKRGfMJkIIclKL2pya708tdZX
	 GQHGK+uoG4Azgywc3NbM0ZpCVsvXzPzSxjCHGNcx+ul6KwyfoOVqRh2d14cZEAIu0B
	 hOmkVXnZIvjLrAfjx3Gpx14hBhXdGaHHmEXZXbbrLlJDUBfpVVi9C3xPD6LSHIsGFS
	 uVmLUS6rhZehpMLjrHlzigGCOLy/lfmCZ5SAJ/IzehRg3Rga74lZuUgW/MCNzt/wrI
	 XfLXr3vTl6GHefhiXXY17tG/8QAyR7G4zNFRLPXyB5pKCqfZno8JBKVncxYxE/qGss
	 8j67/qhKSCN4A==
Date: Tue, 25 Jul 2023 15:46:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kevin Xie <kevin.xie@starfivetech.com>
Cc: Minda Chen <minda.chen@starfivetech.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 8/9] PCI: PLDA: starfive: Add JH7110 PCIe controller
Message-ID: <20230725204633.GA664368@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a687c273-48b1-651e-313f-d8140732c5d8@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_134637_182033_423B9019 
X-CRM114-Status: GOOD (  31.36  )
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

On Mon, Jul 24, 2023 at 06:48:47PM +0800, Kevin Xie wrote:
> On 2023/7/21 0:15, Bjorn Helgaas wrote:
> > On Thu, Jul 20, 2023 at 06:11:59PM +0800, Kevin Xie wrote:
> >> On 2023/7/20 0:48, Bjorn Helgaas wrote:
> >> > On Wed, Jul 19, 2023 at 06:20:56PM +0800, Minda Chen wrote:
> >> >> Add StarFive JH7110 SoC PCIe controller platform
> >> >> driver codes.

> >> However, in the compatibility testing with several NVMe SSD, we
> >> found that Lenovo Thinklife ST8000 NVMe can not get ready in 100ms,
> >> and it actually needs almost 200ms.  Thus, we increased the T_PVPERL
> >> value to 300ms for the better device compatibility.
> > ...
> > 
> > Thanks for this valuable information!  This NVMe issue potentially
> > affects many similar drivers, and we may need a more generic fix so
> > this device works well with all of them.
> > 
> > T_PVPERL is defined to start when power is stable.  Do you have a way
> > to accurately determine that point?  I'm guessing this:
> > 
> >   gpiod_set_value_cansleep(pcie->power_gpio, 1)
> > 
> > turns the power on?  But of course that doesn't mean it is instantly
> > stable.  Maybe your testing is telling you that your driver should
> > have a hardware-specific 200ms delay to wait for power to become
> > stable, followed by the standard 100ms for T_PVPERL?
> 
> You are right, we did not take the power stable cost into account.
> T_PVPERL is enough for Lenovo Thinklife ST8000 NVMe SSD to get ready,
> and the extra cost is from the power circuit of a PCIe to M.2 connector,
> which is used to verify M.2 SSD with our EVB at early stage.

Hmm.  That sounds potentially interesting.  I assume you're talking
about something like this: https://www.amazon.com/dp/B07JKH5VTL

I'm not familiar with the timing requirements for something like this.
There is a PCIe M.2 spec with some timing requirements, but I don't
know whether or how software is supposed to manage this.  There is a
T_PVPGL (power valid to PERST# inactive) parameter, but it's
implementation specific, so I don't know what the point of that is.
And I don't see a way for software to even detect the presence of such
an adapter.

But I assume some end users will use adapters like this and expect it
to "just work," so it would be nice if it did.

> As the Thinklife NVMe SSD may be a halted product, and the onboard
> power circuit of VisionFive V2 is no problem, we decided revert the
> sleep time to be 100ms.

Even though the product may be end-of-life, people will probably still
try to use it, and I would like it to work.  Otherwise we end up with
frustrated users and problem reports that are hard to resolve.  But I
don't know where to go here.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
