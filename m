Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB19BC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 21:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSfUcvzd9y07OOAFchJgRIPmWmGVxN1w1BoFGU+0rw8=; b=z4JOit2i79Ousv
	2AeXXhvMy23Lng9NcRib94ILWB0PH9basTAKlExSQEm99/untJEVSBD/jO8DZF4WZ15pSnYSkk9nE
	dAA2gODYFAHMeSW0KJaeyEs1sYbx+72NHWqBZXz+2o+Owq+DBbHPrJKk6wN4mmWzelKDmAKi21Zsv
	AZV1Ys4ywVTz7XUCLzkBtvpBW5MutQGuvoMHCGKTtkZLY5ULmEV2b8J+gFUbr/ttegdTa16ZkOFRU
	Z1l8YzfP2m3nUP4XJpKJ0W7klefW2olrEEhI7mmhb9RwDxeH4mUNS1YvOLe3sCYgNdaZ2ynYVLTgQ
	CokaxaYiQQaVoA9kDzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0Rm-00Bbe0-1o; Fri, 22 Jul 2022 21:44:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0RX-00BbUW-E2; Fri, 22 Jul 2022 21:44:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C7AACB82B23;
	Fri, 22 Jul 2022 21:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FB2C341D0;
	Fri, 22 Jul 2022 21:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658526255;
	bh=unLKN3dDJ250Ji3PNaWPqJmxilG4HG7jEUIhS2fQ4kk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D7y/Gc90K2FwJgEKyoPR+l9x8KnoXLYfiHO67CMLUk0nqEQkMSANb7HAvP8GFVR9F
	 2QfWtWQ8ajpn+TcDsfToZrvDvoNwkzMqtr/wEgOX9yujj67UnqeS95dp0mF1hKqVUO
	 yvW56CBwMRcnTWqzRJzeajoZ2wkbNsqGsXG/uX/9zWbb69iq6FsUFB0ue2a5I5nSbZ
	 AnsTXgeLVMmQfeS7lLX0MQlXMnKsIySn1l/ygCazRDzc25rNqbTSmvjSTz1OqCkSeS
	 eqAD9nQK9EYg8k59KuQZeQielHj5XPdgxd/rVaV9T/2f5DRbXGJsAt2SzkIXY4DNbv
	 /mZlTjkh+XeLg==
Received: by mail-vs1-f47.google.com with SMTP id x125so5444100vsb.13;
        Fri, 22 Jul 2022 14:44:15 -0700 (PDT)
X-Gm-Message-State: AJIora+fEWKqDv7hVOchJZCO9BQTPESPqsO1z4Qd0gfRm+/MPn9k2IKT
	3dN5l0BrortydLQVc7AeS9yUCab0lr+vq1Ja9g==
X-Google-Smtp-Source: AGRyM1uOA5mKxKNbMfK1iM2rXyIXLWKI6rg7qWhyDKLK8Bz3Y56+URolypOYpf4ujZ+/u80xlma0hrbuDyh+YtgD+So=
X-Received: by 2002:a67:c088:0:b0:358:bb1:fdf7 with SMTP id
 x8-20020a67c088000000b003580bb1fdf7mr639124vsi.85.1658526254680; Fri, 22 Jul
 2022 14:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_Jsq+_5-fhXddhxG2mr-4HD_brcKZExkZqvME1yEpa6dOGGg@mail.gmail.com>
 <mhng-7e3146ca-79b8-4e16-98a9-e354fb6d03ba@palmer-mbp2014>
 <CAL_JsqJHZEcnJi+UHQbYWVoy1okQjHSc9T377P1q8oOJnHBWFw@mail.gmail.com> <CAK8P3a2aTS74TG8F+cVHX969hMQHKP3Ai5V0h-m+GeAq6kq5pQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2aTS74TG8F+cVHX969hMQHKP3Ai5V0h-m+GeAq6kq5pQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 22 Jul 2022 15:44:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZoru2VZLeovPnQWe01ZMdw0krq0tcPx1O6YFUKa-L0g@mail.gmail.com>
Message-ID: <CAL_JsqKZoru2VZLeovPnQWe01ZMdw0krq0tcPx1O6YFUKa-L0g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] asm-generic: Add new pci.h and use it
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Stafford Horne <shorne@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-um <linux-um@lists.infradead.org>, 
	PCI <linux-pci@vger.kernel.org>, 
	"open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_144419_796855_C2DBEC66 
X-CRM114-Status: GOOD (  22.96  )
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

On Fri, Jul 22, 2022 at 1:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jul 22, 2022 at 6:36 PM Rob Herring <robh@kernel.org> wrote:
> > On Fri, Jul 22, 2022 at 9:27 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > From fu740:
> >                        ranges = <0x81000000  0x0 0x60080000  0x0
> > 0x60080000 0x0 0x10000>,      /* I/O */
> ...
> > So again, how does one get a 0 address handed out when that's not even
> > a valid region according to DT? Is there some legacy stuff that
> > ignores the bridge windows?
>
> The PCI-side port number 0x60080000 gets turned into Linux I/O resource 0,
> which I think is what __pci_assign_resource operates on.
>
> The other question is why the platform would want to configure the
> PCI bus to have a PCI I/O space window of size 0x10000 at the address
> it's mapped into, rather than putting it at address zero. Is this a hardware
> bug, a bootloader bug, or just badly set up in the DT?

...putting it at *PCI* address zero, right? Yeah, that looks
suspicious. The core code seems to not use the PCI address, but
various drivers do. Maybe they are miscalculating things and still end
up with 0. If so, we're stuck with that ABI though we could fix it up
in the ranges parsing code and make driver behavior consistent.

In any case, that seems to be a somewhat common occurrence. A somewhat
accurate search (ignore the MBUS_ID ones):

$ git grep -A4 '\sranges =' -- arch/ | grep '0x81000000' | grep -v -E
'0x81000000\s[0x]+\s[0x]+\s'
arch/arm/boot/dts/armada-370.dtsi-
0x81000000 0x1 0     MBUS_ID(0x04, 0xe0) 0       1 0 /* Port 0.0 IO
*/
arch/arm/boot/dts/armada-375.dtsi-
0x81000000 0x1 0       MBUS_ID(0x04, 0xe0) 0 1 0 /* Port 0 IO  */
arch/arm/boot/dts/armada-xp-98dx3236.dtsi-
 0x81000000 0x1 0       MBUS_ID(0x04, 0xe0) 0 1 0 /* Port 0.0 IO  */>;
arch/arm/boot/dts/bcm47622.dtsi:                ranges = <0 0x81000000
0x818000>;
arch/arm/boot/dts/dove.dtsi-                              0x81000000
0x1 0x0 MBUS_ID(0x04, 0xe0) 0 1 0   /* Port 0.0 I/O */
arch/arm/boot/dts/kirkwood-6192.dtsi-
0x81000000 0x1 0     MBUS_ID(0x04, 0xe0) 0       1 0 /* Port 0.0 IO
*/>;
arch/arm/boot/dts/kirkwood-6281.dtsi-
0x81000000 0x1 0     MBUS_ID(0x04, 0xe0) 0       1 0 /* Port 0.0 IO
*/>;
arch/arm/boot/dts/kirkwood-98dx4122.dtsi-
 0x81000000 0x1 0     MBUS_ID(0x04, 0xe0) 0       1 0 /* Port 0.0 IO
*/>;
arch/arm/boot/dts/mt7623.dtsi:          ranges = <0x81000000 0
0x1a160000 0 0x1a160000 0 0x00010000
arch/arm/boot/dts/qcom-ipq4019.dtsi:                    ranges =
<0x81000000 0 0x40200000 0x40200000 0 0x00100000>,
arch/arm/boot/dts/qcom-ipq8064.dtsi:                    ranges =
<0x81000000 0 0x0fe00000 0x0fe00000 0 0x00100000   /* downstream I/O
*/
arch/arm/boot/dts/qcom-ipq8064.dtsi:                    ranges =
<0x81000000 0 0x31e00000 0x31e00000 0 0x00100000   /* downstream I/O
*/
arch/arm/boot/dts/qcom-ipq8064.dtsi:                    ranges =
<0x81000000 0 0x35e00000 0x35e00000 0 0x00100000   /* downstream I/O
*/
arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi:              ranges
= <0x00 0x00 0x81000000 0x4000>;
arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts: ranges =
<0x81000000 0 0xe8000000   0 0xe8000000   0 0x01000000   /* Port 0 IO
*/
arch/arm64/boot/dts/mediatek/mt8192.dtsi-
  <0x81000000 0 0x12800000 0x0 0x12800000 0 0x0800000>;
arch/arm64/boot/dts/qcom/ipq6018.dtsi:                  ranges =
<0x81000000 0 0x20200000 0 0x20200000
arch/arm64/boot/dts/qcom/ipq8074.dtsi:                  ranges =
<0x81000000 0 0x10200000 0x10200000
arch/arm64/boot/dts/qcom/ipq8074.dtsi:                  ranges =
<0x81000000 0 0x20200000 0x20200000
arch/arm64/boot/dts/rockchip/rk3399.dtsi-
<0x81000000 0x0 0xfbe00000 0x0 0xfbe00000 0x0 0x100000>;
arch/arm64/boot/dts/toshiba/tmpv7708.dtsi:                      ranges
= <0x81000000 0 0x40000000 0 0x40000000 0 0x00010000
arch/riscv/boot/dts/sifive/fu740-c000.dtsi:                     ranges
= <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000>,      /*
I/O */


> Putting the PCI address of the I/O space window at port 0 is usually
> better because it works with PCI devices and drivers that assume that
> port numbers are below 0xfffff, and makes the PCI port number match
> the Linux port number.

I could make the PCI schema check for this, but I guess technically
any 32-bit PCI I/O address is valid even if 64K is the practical
limit.

Rob

P.S. I really wish I/O space would disappear completely.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
