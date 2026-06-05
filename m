Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50705CD6E7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMPc35xx44uDnM2uw5ZopsoR4s1VPHgfQFZbb7sJ4ag=; b=XMfk+IXVsMCsgu
	CnNawBvtHL8QodcPAbHsfP8FhFSdj6Vyd1kiEDxsBFYogh39Re4avwh1SiUeCOUYNXlg4w3PDyxDi
	NmnPauwBx5lWZUIo7HaDVGqg67U+zK8KpI7X7Gt4VyX4k/ejZpCygBRGHxYmydqOvr6/7F8tp1AV2
	zI/DbXy618NapgTaHkaFcEZGo5y6yTZLMadQMRnRYXQ+JqV0na6yVdpbvneYTFOyInynSRabn+OWj
	Hj6kxOl7+AbGCkUI5wcB8WjotRFjiem9Aidj1J9DK6vcPzLnYXyCAPgCu4RTgdiXZAxboPDc4SSA/
	xIRUxrKK3uWPfZJczZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVbC9-00000001ACX-0ezm;
	Fri, 05 Jun 2026 20:31:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVbC7-00000001ACP-3HE3
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 20:31:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 17EFA42DC5;
	Fri,  5 Jun 2026 20:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE811F00893;
	Fri,  5 Jun 2026 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780691467;
	bh=fB5aY5VBvW9cwcvB4CN9kyV3CvrLkjHsB6HcVxxbVYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lFakIHLhEeF4FkN2OUlTtrI74XnS22YkLLEtsiuyDGP+sUG3FqDl+SC0T5Egk/ZXc
	 1WoESo0sfszchRVA0z9SDCpyEGNSZwehEsU7PWGHaVOIn91DSyMFDwOS55nFqPz0w3
	 TOUJNMCU1KMt3cS65PVAhHgm/ZH4EbE8IVk2emCEPOqEy4dZOxNVWoqEgdvBN7iXyk
	 Ay05vVQyqiVlXV9eOdFEEonE/OZXBl5HcSjlcxQvhkTZ4Pb/WtAIr3v926ck1/efJh
	 Ov3YwJKv+9wyBITAXpMiUDId4j5NcUaIJ56bwu7e1APtduHRL1tdu1bRRW4SJqJMur
	 dfLIz77q1CoMA==
Date: Fri, 5 Jun 2026 15:31:06 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Paul Walmsley <pjw@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/7] riscv: dts: tenstorrent: Add Atlantis platform
Message-ID: <20260605203106.GA98957-robh@kernel.org>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-8-joel@jms.id.au>
 <20260604-pacifier-sludge-196f47ab3c11@spud>
 <f3fd53dc-7010-4b3d-a33c-4d1d32d3a1a6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3fd53dc-7010-4b3d-a33c-4d1d32d3a1a6@kernel.org>
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

On Sat, Jun 06, 2026 at 12:02:41AM +1000, Michael Ellerman wrote:
> On 5/6/26 2:47 am, Conor Dooley wrote:
> > On Fri, Jun 05, 2026 at 12:09:53AM +0930, Joel Stanley wrote:
> > > Add initial support for the Tenstorrent Atlantis platform, based on the
> > > Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
> > > 
> > > The evb machine represents an internal bringup vehicle with just the
> > > interrupt controllers and a UART. This will be replaced in time with a
> > > full featured machine once details are available.
> ...
> > > diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
> > > new file mode 100644
> > > index 000000000000..06259cca8357
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
> > > @@ -0,0 +1,33 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/dts-v1/;
> > > +
> > > +#include "atlantis-soc.dtsi"
> > > +
> > > +/ {
> > > +	model = "Tenstorrent Atlantis development platform";
> > > +	compatible = "tenstorrent,atlantis-evb", "tenstorrent,atlantis";
> > > +
> > > +	#address-cells = <2>;
> > > +	#size-cells = <2>;
> > > +
> > > +	memory@0 {
> > > +		device_type = "memory";
> > > +		reg = <0x0 0x00000000 0x0 0x80000000>,
> > > +		      <0x1 0x80000000 0x0 0x80000000>;
> > > +	};
> > > +
> > > +	aliases {
> > > +		serial0 = &uart1;
> > > +	};
> > > +
> > > +	chosen {
> > > +		bootargs = "earlycon console=ttyS0";
> > 
> > FYI, this should not be in here.
> 
> It should be there if you want a working console :)
> 
> I know it's a "rule" to not include bootargs, but this system has no boot
> loader, so not setting bootargs just means the DTS is no use to anyone.

'console' is redundant as 'stdout-path' is set.

'earlycon' is only needed if you don't boot to the regular UART console. 
I would hope by default this system boots all the way.

> 
> > > +		stdout-path = "serial0";


Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
