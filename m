Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034FDC7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYDYJbLdOP5Ir4vfuJ8PY3il/3jCbi8wXqWAVht47wM=; b=oopTm82GzOQ+Bu
	ta4m5fLWIf/zavlFjf8S5+jBlr+oCJgxjAVEGtrUrRrrkyuxl9x604AC/KHuaguFOSnlaAmdJFw88
	swMHiPLG3WbcKzAOoQEIr/hdyvv5rYhaI1pHK8tSmzI9BA2mHlc356d1RMwiZRTu/Jaks/LfTexku
	PyQiD9DjWHHTEIYB0JtbgiFgPJRwMh5ZPpGHAUOeOX8+envcXq58lLNgjq/5wI/EO6nSbG9Dt0gB0
	xEWoDUj6yXLi0dZJit4DykZSKbdN0paCzLBEwRE+R+iTkCrY8/3WKjPC2QQFnDM5aM+W/vzgNVNGd
	UNUTZZnkoFZNbHBva0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fYh-003WQU-0P;
	Sun, 21 May 2023 09:40:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fYd-003WPz-0q
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:40:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA69360AE8;
	Sun, 21 May 2023 09:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEE3C433EF;
	Sun, 21 May 2023 09:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684662054;
	bh=zn+bwbfOWEOxmWCFFGMUlWUHM6muZcBbeHLgBc2cySo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LulV7j/tBHNSTt3ElLvDShJGisLjKgLsLNuy8+Zuxti6O44lTU2sK2viChpxPMbS2
	 q0rTXLRt8uWQEQLdUvxNn94Fa2MmGLuBgk5xyA3Bb2Y2V3XOt9romGdOXSahOWrTp9
	 gz1RxOfYKiG83gCgxqX9zPifw43kOsHlHDyavBOmqfn3qLL0Gh6lXQYelLCjSeYU4j
	 NtLpjmmxYqeG/tH/lhBi+PgBv9Rq75RFA+VzJa0TLMtZwVhQUZ9oLekx9mT8OSj/Jz
	 kw7JU5wrgezUS5Nk3NjKHpu57AWl+my6sL4b+jbJ6nKsTskqG7/e6kPBNruLZqPDYD
	 t/u8SJeslUrmQ==
Date: Sun, 21 May 2023 17:29:41 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 06/10] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
Message-ID: <ZGnkhSlk8NaPELxh@xhacker>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-7-jszhang@kernel.org>
 <c6e44e14-35b2-da09-5e8c-4d47e7a7a055@sholland.org>
 <20230519-squad-undermine-6124aafebafa@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519-squad-undermine-6124aafebafa@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_024055_408756_FDE0DE43 
X-CRM114-Status: GOOD (  47.22  )
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

On Fri, May 19, 2023 at 12:55:02PM +0100, Conor Dooley wrote:
> On Thu, May 18, 2023 at 10:31:35PM -0500, Samuel Holland wrote:
> > Hi Jisheng, DT maintainers,
> 
> Sick, thanks for piping up Samuel!
> Both Rob and Krzysztof are not around at the moment, so that probably
> leaves it up to me.. I'm adding Arnd in case he has a take here too.
> 
> > On 5/18/23 10:22, Jisheng Zhang wrote:
> > > Several SoMs and boards are available that feature the Bouffalolab
> > > bl808 SoC. Document the compatible strings.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  .../bindings/riscv/bouffalolab.yaml           | 29 +++++++++++++++++++
> > >  1 file changed, 29 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > > new file mode 100644
> > > index 000000000000..3b25d1a5d04a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > > @@ -0,0 +1,29 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Bouffalo Lab Technology SoC-based boards
> > > +
> > > +maintainers:
> > > +  - Jisheng Zhang <jszhang@kernel.org>
> > > +
> > > +description:
> > > +  Bouffalo Lab Technology SoC-based boards
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    const: '/'
> > > +  compatible:
> > > +    oneOf:
> > > +      - description: Carrier boards for the Sipeed M1s SoM
> > > +        items:
> > > +          - enum:
> > > +              - sipeed,m1s-dock
> > > +          - const: sipeed,m1s
> > > +          - const: bouffalolab,bl808
> > 
> > As mentioned in the message for patch 5, "The Bouffalolab bl808 SoC
> > contains three riscv CPUs, namely M0, D0 and LP. The D0 is 64bit RISC-V
> > GC compatible, so can run linux."
> > 
> > I have also been running U-Boot and NOMMU Linux on the less powerful,
> > but still quite fast, "M0" core. However, this core needs a different

Just FYI, I successfully ran nommu rv32 linux kernel on the "M0" core
with some patches to the riscv head and irqchip driver.

> > DTB because:
> >  1) The CPU is different (T-HEAD E907 instead of C906).
> >  2) The interrupt routing is completely different.
> >     a. The M0 core contains a CLIC instead of a PLIC.
> >     b. The peripherals in the SoC are split between two buses. Those
> >        on one bus have their IRQs directly connected to M0, and share
> >        a multiplexed IRQ connection to D0; and vice versa for the
> >        other bus. So each bus's interrupt-parent needs to be swapped.
> > 
> > Using some preprocessor magic like we did for Allwinner and Renesas, I
> > was able to share most of the SoC and board DTs between the cores[1].
> > However, this still ends up with two DTs for each board. So here are my
> > questions:
> >  - Is this acceptable?
> 
> I expected it to look worse than it actually turned out to be.
> I don't think Krzysztof in particular is a fan of having conditional
> bits in dts files, but for the shared arm/riscv stuff there was not
> really another sensible option.
> 
> >  - Is there precedent for how we should name the two board DTs?
> 
> Arnd might have some idea about precedent here, but I like your naming
> well enough.
> 
> >  - How does this affect the board and SoC compatible strings?
> >    - Should there be a separate "bouffalolab,bl808-d0" in addition to
> >      "bouffalolab,bl808"?
> 
> What ordering were you intending here?
> "pine64,0x64" "bouffalolab,bl808" "bouffalolab,bl808-d0"?
> 
> That doesn't really seem correct though, as it does not get less specific
> as you move right.
> 
> "pine64,0x64" "bouffalolab,bl808-d0" "bouffalolab,bl808" doesn't seem
> right either though, for the same sort of reason.
> 
> >    - Is it acceptable to use the same board compatible string for both,
> >      since the _board_ part of the DT does not change, only things
> >      inside the SoC?

what about describing the DT as the SoC is, e.g
lp: cpu@0 {
	...
	status = disabled;
};

m0: cpu@1 {
	...
	status = disabled;
};

d0: cpu@2 {
	...
	status = disabled;
};

Then in m0 dts:
&m0 {
	status = okay;
};

in d0 dts:
&m0 {
	status = okay;
};


> 
> I think you may need to have 2 compatibles per board, depending on which
> cpu. Perhaps even as verbose as:
> "pine61,0x64-d0" "pine64,0x64" "bouffalolab,bl808-d0" "bouffalolab,bl808"
> 
> Not exactly straightforward though, is it!
> 
> > It would be possible to avoid having two DTs per board by guarding all
> > of the differences behind "#ifdef CONFIG_64BIT", but that seems wrong
> > because you would end up with two totally incompatible DTBs named the
> > same thing, depending on how the DTB was built.
> 
> I think having 2 dtbs is fine, and as I mentioned, I've seen Krzysztof
> complain previously about conditional bits like that.
> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
