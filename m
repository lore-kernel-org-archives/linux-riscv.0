Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D61EECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 22:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyE2L4PyBUZPNVs6zRGmF9oV8RuzQ/kYQmnAEdIJH4U=; b=i+Cdy1Z7MIWuuC
	Fu2hkunFhpg9IAD4Sg+UAvInPefEMEac+oIANt+/3fDYXvhKPlly+Gga4CLTzhcNHnUjMSf3g6Xw+
	VTSgLnGMP2TVsK/CrjAUfBICQNkEjRRBcwhXs+oacaJGBKGvQaBfeR5ACGJX2hQw3qZQSz6cz5HwH
	4KvSsSVaWtSbbae9dqWkvUCtC/YDMxM3RicnlAJRNLHm5ZknjFbHXF9IPc6cPCsrCDb1K5IRKdWmp
	dAbYxgwz5EFEjbxipaXNeXl3JRsAsruSyXZyWqKdSYxYPdGULiMTSmrW2AliUSvRtUkF4bzN0XVOV
	18xUfEu8Q5lFTEui20tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opH4D-0043qx-Ut; Sun, 30 Oct 2022 22:46:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opH4A-0043nG-3S
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 22:46:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 82F84B810A3;
	Sun, 30 Oct 2022 22:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46ADDC433D7;
	Sun, 30 Oct 2022 22:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667169963;
	bh=tGWr42AUVp1Ags+b6ewPYgwnBAY+EKl2aVQqVQP6HrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NydTDwnaSNUY74JE8GCIv+/KkUwQBuV6fMeTeU7Wiq2riesVlmOXm2Ye2dKGqRyqK
	 4qqIh256Ivme4ZrNMb33Dxm3EIm6OOX6mRi2jJJnfw2WnCF7PjBv97qCeitpkGD3HC
	 9ouMGOK23O9m2D27WXt6KfdyR1yiWZOkz8jx8azWxDwT8mjreRYeRZyIiSXDoiXJWG
	 uvNHDTOhclFUfxC7jwUS+PuCSAmEyQlvoIAKytQQFgKc0/nocKq0mm+vJ+ghgDQ8VH
	 O2pym4airGUh8gaTL8xiMxwfdHcWcTXo0+8V2meC1RemV2QepJ8Gy4eDaDqQWi4xSq
	 bICEB+hpMs6wA==
Date: Sun, 30 Oct 2022 22:45:56 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
Message-ID: <Y17+pHAg/SBJAEXq@spud>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y17BWPuEcmY7Bba3@spud>
 <CA+V-a8uKQ8QvYi5qLC9O=QAQN5CxNB7cOTmw4vk+ndB2R8d3nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8uKQ8QvYi5qLC9O=QAQN5CxNB7cOTmw4vk+ndB2R8d3nQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_154606_443615_922BDFDE 
X-CRM114-Status: GOOD (  29.19  )
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

On Sun, Oct 30, 2022 at 10:37:01PM +0000, Lad, Prabhakar wrote:
> Hi Conor,
> 
> On Sun, Oct 30, 2022 at 6:24 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Fri, Oct 28, 2022 at 05:59:14PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Hi All,
> > >
> > > The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> > > 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> > > as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> > > entry-class social infrastructure gateway control and industrial gateway
> > > control.
> > >
> > > This patch series adds initial SoC DTSi support for Renesas RZ/Five
> > > (R9A07G043) SoC. Below is the list of IP blocks enabled in the initial
> > > board DTS which can be used to boot via initramfs on RZ/Five SMARC EVK:
> > > - AX45MP CPU
> > > - CPG
> > > - PINCTRL
> >
> > Hey,
> > Looks like you've got a pair of warnings here from dtbs_check. I tested
> > this on top of 20221028's next, with the three branches below merged in,
> > hopefully my merges aren't the source of them:
> >
> > linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: 'interrupt-controller' is a required property
> >         From schema: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: '#interrupt-cells' is a required property
> >         From schema: linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> >
> Thanks for the review and test. The warnings above are coming from [0]
> as support for IRQC is missing, once that is added the warnings should
> go away.

Right. I merged in the stuff in Geert's trees & I don't think I saw any
pending patches in the cover that I missed. Is there something else that
adds the support that's not going to make v6.2? I got rid of all the
dtbs_check warnings for v6.1 and I'd really like to keep things that
way!

> > With this sorted, whatever wasn't already is now:
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Thanks for putting up with my messing around re: kconfig symbols and I
> > am glad that we ended up being able to share the dts across archs in the
> > end, so thanks to everyone involved in that :)
> >
> :-)
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> 
> Cheers,
> Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
