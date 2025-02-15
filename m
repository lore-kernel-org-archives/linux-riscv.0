Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BD4C021A0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2025 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5plC6IYTtISgZaP1yXvE3cYv2XvTUtHTHD/nuL6Q1A=; b=4Np4eMuI761x+O
	QIktnyYb1Hv0QzH52OaDigPUrlHRTc5uLKQzPpNni5PyLRtw0uCm/CwXH311UxyOSPyjQtNUCjNeV
	X8HfP16jFo2qnDHqe2b54L4d725YgMCWvT+7aKwgM7ynaYONhNcGqnUZUxSMlvVHm2Cire7DYPwTT
	MGrSy2+3S+YbBJku09XQjRIWzch2zBT11JiObRyCLKmhgaSakpKonNakg19HcY8/eMp75qJSMNC27
	ZgRqF1JZ10UoWF4XQQ6GPrQeDvXgbxe4OY0eQgyqQ4jhXszKlSdsKYX8is3Pb4wOJ/SFPhUua86aA
	e4ZZVu9Ssj6gY5nUDDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjDkn-0000000HGbN-0NqF;
	Sat, 15 Feb 2025 08:42:25 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjDkk-0000000HGai-2JG3
	for linux-riscv@lists.infradead.org;
	Sat, 15 Feb 2025 08:42:24 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 14C35122FE22;
	Sat, 15 Feb 2025 00:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1739608938; bh=/+GA9MhStHPkQplMZrvm16d9WGpWymsKHs9P+2n2Vr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dd6U6CU23N5EIEcguaJpZREr8naTARBYBRN9xd+9GwkNnS6a/FR/CnzBg9sm3BpyD
	 eI93NpIgFjb7cgByn3BwStMA2+xsMkQtkpLtGae0Jx6Om4MBJMdLa8M1VgaURtD2Mb
	 JS2JIYU7QQAhTN7fUAaEO2/8DzoP3PrS31YcHrlmF06w/srpAyj9HCcqm+QxQnYLJm
	 UA6d26frScSQGUCxz4VBRJm4YjG4+y8k12FveIpTRcEdelq2VEnFTAIrqMQ9JsxUSt
	 o5kzcCsdl9/wAnekeLrvZ5qsEBowAHrxzuuLVTmCwIBXLa0UrYB9qi3xPu/PGpOQSA
	 FwCzyst/xxDww==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1fnst-8DDHs; Sat, 15 Feb 2025 00:42:12 -0800 (PST)
Received: from ketchup (unknown [183.217.81.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 4EB9B122FE21;
	Sat, 15 Feb 2025 00:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1739608931; bh=/+GA9MhStHPkQplMZrvm16d9WGpWymsKHs9P+2n2Vr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aiueXKvQ5p7deu1Qfjf17v3ZWvqFX06iCAk+Ja84KpUtk5uKHInBC/aUKlTW7i0l9
	 OZ3jdlPGnAzZTr2Vr9Jm9N5HvE4m1LLjH0YRCuMgmeTL164P/fROSlZgWwBFPAKaoO
	 VqJJ3h8Mc/3Nhln3fWYMaSRSR3KwWzViNtG/sK1MleX2VmLkAQvphvag8cErXi7zRq
	 ETEoTuNmaiVmv3NGWUWpU8RrLlcz3i9vC5HAh7zBL51BSTDpy0Hyt4fcXK0ZAVT/Uz
	 A/Ihz+77XcP4pRHTvpN0G9mwNTgdJ5YXyE6RjL4tfkrTiEm7hKOofaFWKF0ZgJr6xR
	 ithZ71LTjakZg==
Date: Sat, 15 Feb 2025 08:41:58 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Message-ID: <Z7BTVu10EKHMqOnJ@ketchup>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-4-heylenay@4d2.org>
 <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
 <Z6rdBhQ7s2ReOgBL@ketchup>
 <19e5129b-8423-4660-8e4f-8b898214d275@kernel.org>
 <Z63T_EDvXiuRQbvb@ketchup>
 <2ab715bd-e26c-41bb-ac64-baa864d90414@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ab715bd-e26c-41bb-ac64-baa864d90414@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_004222_918038_E2EC918E 
X-CRM114-Status: GOOD (  44.14  )
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

On Thu, Feb 13, 2025 at 07:07:55PM +0100, Krzysztof Kozlowski wrote:
> On 13/02/2025 12:14, Haylen Chu wrote:
> > On Tue, Feb 11, 2025 at 09:03:20AM +0100, Krzysztof Kozlowski wrote:
> >> On 11/02/2025 06:15, Haylen Chu wrote:
> >>> On Sat, Jan 04, 2025 at 11:07:58AM +0100, Krzysztof Kozlowski wrote:
> >>>> On Fri, Jan 03, 2025 at 09:56:35PM +0000, Haylen Chu wrote:
> >>>>> Add documentation to describe Spacemit K1 system controller registers.
> >>>>>
> >>>>> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> >>>>> ---
> >>>>>  .../soc/spacemit/spacemit,k1-syscon.yaml      | 52 +++++++++++++++++++
> >>>>>  1 file changed, 52 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..79c4a74ff30e
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> >>>>> @@ -0,0 +1,52 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: Spacemit K1 SoC System Controller
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Haylen Chu <heylenay@4d2.org>
> >>>>> +
> >>>>> +description:
> >>>>> +  The Spacemit K1 SoC system controller provides access to shared register files
> >>>>> +  for related SoC modules, such as clock controller and reset controller.
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    items:
> >>>>> +      - enum:
> >>>>> +          - spacemit,k1-apbc-syscon
> >>>>> +          - spacemit,k1-apbs-syscon
> >>>>> +          - spacemit,k1-apmu-syscon
> >>>>> +          - spacemit,k1-mpmu-syscon
> >>>>> +      - const: syscon
> >>>>> +      - const: simple-mfd
> >>>>> +
> >>>>> +  reg:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +  clock-controller:
> >>>>> +    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
> >>>>> +    type: object
> >>>>
> >>>> So now we see the full picture and it leads to questions.
> >>>>
> >>>> 1. Why spacemit,k1-apbc-syscon with spacemit,k1-ccu-apmu child is a
> >>>> correct combination?
> >>>>
> >>>> 2. Why having this split in the first place? Please confirm that clock
> >>>> controller is really, really a separate device and its child in
> >>>> datasheet. IOW, fake child for your Linux is a no-go. Fake child while
> >>>> devices are independent is another no-go.
> >>>
> >>> These syscons are introduced because the clock controllers share
> >>> registers with reset controllers. Folding them into the parents results
> >>
> >> So a fake split...
> >>
> >>> in devicetree nodes act as both reset and clock controllers, like what
> >>
> >> Which is correct hardware representation, isn't it?
> >>
> >>> has been done for Rockchip SoCs. Such folding isn't practical for the
> >>> MPMU region either, since watchdog and other misc bits (e.g. PLL lock
> >>> status) locates in it.
> > 
> > I have to correct that the watchdog doesn't stay in the MPMU region, I
> > misremembered it.
> > 
> >> Hm? Why? You have a device which is reset and clock controller, so why
> >> one device node is not practical? Other vendors do not have problem with
> >> this.
> > 
> > Merging reset and clock controllers together is fine to me. What I want
> > to mention is that APMU and MPMU, abbreviated from Application/Main Power
> > Management Unit, contain not only clock/reset-related registers but also
> > power management ones[1]. Additionally, the PLL lock status bits locate
> > at MPMU, split from the PLL configuration registers as you've already
> > seen in the binding of spacemit,k1-ccu-apbs where I refer to it with a
> > phandle.
> 
> You need to define what is the device here. Don't create fake nodes just
> for your drivers. If registers are interleaved and manual says "this is
> block APMU/MPMU" then you have one device, so one node with 'reg'.
> 
> If subblocks are re-usable hardware (unlikely) or at least
> separate/distinguishable, you could have children. If subblocks are
> re-usable but addresses are interleaved, then children should not have
> 'reg'. If children do not have any resources as an effect, this is
> strong indication these are not re-usable, separate subblocks.
> 
> > 
> > Since reset/clock and power management registers interleave in the MMIO
> > region, do you think syscons are acceptable in this situation or it
> > should be handled in another way? The reset and clock controllers could
> > still be folded together as they share the same registers. The device
> > tree will look like,
> > 
> > 	syscon_mpmu: system-controller@d4050000 {
> > 		compatible = "spacemit,mpmu-syscon", "syscon", "simple-mfd";
> > 		reg = <0xd4050000 0x10000>;
> > 
> > 		cru_mpmu: clock-controller {
> > 			compatible = "spacemit,k1-cru-mpmu";
> > 			#clock-cells = <1>;
> > 			#reset-cells = <1>;
> > 		};
> > 
> > 		power_mpmu: power-controller {
> > 			compatible = "spacemit,k1-powerdomain-mpmu";
> > 			/* ... */
> > 			#power-domain-cells = <0>;
> > 		};
> 
> Based on above, I do not see any need for children device nodes. It's
> fake split to match driver design.

Okay, I'll make APMU/MPMU act as a whole device without split children
and drop bindings for the childern (spacemit,k1-ccu-mpmu) in the next
revision. Do I get the point?

> > 	};
> > 
> > For the other two clock controllers (APBS and APBC), syscons are really
> > unnecessary and it's simple to fold them.
> 
> 
> I don't follow. Do we talk about children or syscon compatible?

APBS region contains only clock (PLL) bits and APBC region contains only
reset and clock bits, so I was thinking about dropping the syscon nodes
and changing their compatible to spacemit,k1-plls and
spacemit,k1-cru-apbc.

In summary, my plan is,

- For MPMU, APMU and APBC region, keep the binding in soc/spacemit.
  They'll be reset, clock and power controllers, with compatible
  "spacemit,k1-syscon-*".
- For APBS region, write a new binding clock/spacemit,k1-plls, as it
  contains only PLL-related bits. It acts as clock controller.
- All split children will be eliminated, there'll be only four device
  nodes, one for each region, matching the datasheet.
- Put all clock-related binding definition of SpacemiT K1 in
  dt-bindings/clock/spacemit,k1-ccu.h

Is it fine for you?

> 
> Best regards,
> Krzysztof

Thanks,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
