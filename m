Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B94C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 11:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyS/iFP64QQ3q/mizatCmZH4fOMDXmH93tRLgpdeyKI=; b=CZkEPJiWo77gOd
	QRuJv/EBy6aF86dADjgw0JufM22owo/PBRqpSF4BV4MHnKNjFT9ofKY/b6TLcvQzHNPvnBaAvg4hZ
	2ymhPTHmDg+Hj5bDfDBelf52hJ2DUms8fg/CuIeIHNwwXNF1gEUTufLIx6f7TKUO2iFTzBXabqEgV
	zNIggQ2WukNqYlprHti/xL//LS0Qdn0gg4/47VPGcWNf5lZQAvSw8yRU7wDWphuYtf2+vROcwJhqP
	XJ6lTkN/EFqUbo6zEQqTM58SjlnTwIdDH6X7YqG/GuTke+C0E7/hM7NX1dmrL7RMsLfLN+JbF1i6N
	hJ5HHJp/nSmjk5nWr7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXBO-0000000AnMU-1UYj;
	Thu, 13 Feb 2025 11:15:02 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXAo-0000000AnGQ-0vEO
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 11:14:28 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id B300A122FE62;
	Thu, 13 Feb 2025 03:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1739445261; bh=ezyedybHgoW6oyvPGrkHRiI3fE698KvW6mm+hZJtHs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1BzMojZL3ro81eOzFy386qDclbivD9UfUH3JBSOK2LPuAO5S1N5cgzUs7CS8o4/V
	 mOCZwFx8y6DJXR4PLilK3ZA/kweR4PW2TT11/aflC/nZ/9LK/UJq+4yx6XzoDRvtY/
	 WmK/WVNdQufjgL/UicmtFIq6iiktdwX52VwKgMoyjW8bG85Hp80eP2T8giwBelNIQg
	 h9tX7lCKKW0QjANPZFOxjRZJBltMWrnQKX80N1DfmOWqCUnpjeWaGrmDV3o6YSwp0V
	 01t5J/ruSf4S5PbZInrehDr6AurD7XWBKbittq6hziy6doUF/hRAWclmYly4Bs+2iw
	 r2EKjMeKs2Nrg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8X_IBNMwRZY3; Thu, 13 Feb 2025 03:14:17 -0800 (PST)
Received: from ketchup (unknown [183.217.81.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 6C167122FE26;
	Thu, 13 Feb 2025 03:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1739445257; bh=ezyedybHgoW6oyvPGrkHRiI3fE698KvW6mm+hZJtHs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ykJRpAK+KgoLP8ji1hI8VKi1mmSh/k3SGDM/qo2eIVrZtmY60RkpRyKEpqSumOImI
	 AI2hfL8YAxa5kOJAow37Fgq4QYdqHSI0JAMeSoEfWlbOIBWr8EOYstW9B1WHXGrVKW
	 ogTtGTv/u8AKWLGjQqNeefFSCC1EcOJqjI629hIx9oEGJoMXe/sgTMX3Y4LpNt2NVF
	 TpvSjLyPgoD+2VyXShy1+voNISY7J28WbTkbSdwcUHTqyispsQyxvoyahfm8qwZQVh
	 07TVm9AFsOy8VfnZFeBnTEyWermOtFZaOEauqAi7vDRruq6aXUPcrvEJuhZ22V2JYe
	 mAJWzmy2HEcDg==
Date: Thu, 13 Feb 2025 11:14:04 +0000
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
Message-ID: <Z63T_EDvXiuRQbvb@ketchup>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-4-heylenay@4d2.org>
 <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
 <Z6rdBhQ7s2ReOgBL@ketchup>
 <19e5129b-8423-4660-8e4f-8b898214d275@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19e5129b-8423-4660-8e4f-8b898214d275@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_031426_537642_BDB955D4 
X-CRM114-Status: GOOD (  31.73  )
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

On Tue, Feb 11, 2025 at 09:03:20AM +0100, Krzysztof Kozlowski wrote:
> On 11/02/2025 06:15, Haylen Chu wrote:
> > On Sat, Jan 04, 2025 at 11:07:58AM +0100, Krzysztof Kozlowski wrote:
> >> On Fri, Jan 03, 2025 at 09:56:35PM +0000, Haylen Chu wrote:
> >>> Add documentation to describe Spacemit K1 system controller registers.
> >>>
> >>> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> >>> ---
> >>>  .../soc/spacemit/spacemit,k1-syscon.yaml      | 52 +++++++++++++++++++
> >>>  1 file changed, 52 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> >>> new file mode 100644
> >>> index 000000000000..79c4a74ff30e
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> >>> @@ -0,0 +1,52 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Spacemit K1 SoC System Controller
> >>> +
> >>> +maintainers:
> >>> +  - Haylen Chu <heylenay@4d2.org>
> >>> +
> >>> +description:
> >>> +  The Spacemit K1 SoC system controller provides access to shared register files
> >>> +  for related SoC modules, such as clock controller and reset controller.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - spacemit,k1-apbc-syscon
> >>> +          - spacemit,k1-apbs-syscon
> >>> +          - spacemit,k1-apmu-syscon
> >>> +          - spacemit,k1-mpmu-syscon
> >>> +      - const: syscon
> >>> +      - const: simple-mfd
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  clock-controller:
> >>> +    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
> >>> +    type: object
> >>
> >> So now we see the full picture and it leads to questions.
> >>
> >> 1. Why spacemit,k1-apbc-syscon with spacemit,k1-ccu-apmu child is a
> >> correct combination?
> >>
> >> 2. Why having this split in the first place? Please confirm that clock
> >> controller is really, really a separate device and its child in
> >> datasheet. IOW, fake child for your Linux is a no-go. Fake child while
> >> devices are independent is another no-go.
> > 
> > These syscons are introduced because the clock controllers share
> > registers with reset controllers. Folding them into the parents results
> 
> So a fake split...
> 
> > in devicetree nodes act as both reset and clock controllers, like what
> 
> Which is correct hardware representation, isn't it?
> 
> > has been done for Rockchip SoCs. Such folding isn't practical for the
> > MPMU region either, since watchdog and other misc bits (e.g. PLL lock
> > status) locates in it.

I have to correct that the watchdog doesn't stay in the MPMU region, I
misremembered it.

> Hm? Why? You have a device which is reset and clock controller, so why
> one device node is not practical? Other vendors do not have problem with
> this.

Merging reset and clock controllers together is fine to me. What I want
to mention is that APMU and MPMU, abbreviated from Application/Main Power
Management Unit, contain not only clock/reset-related registers but also
power management ones[1]. Additionally, the PLL lock status bits locate
at MPMU, split from the PLL configuration registers as you've already
seen in the binding of spacemit,k1-ccu-apbs where I refer to it with a
phandle.

Since reset/clock and power management registers interleave in the MMIO
region, do you think syscons are acceptable in this situation or it
should be handled in another way? The reset and clock controllers could
still be folded together as they share the same registers. The device
tree will look like,

	syscon_mpmu: system-controller@d4050000 {
		compatible = "spacemit,mpmu-syscon", "syscon", "simple-mfd";
		reg = <0xd4050000 0x10000>;

		cru_mpmu: clock-controller {
			compatible = "spacemit,k1-cru-mpmu";
			#clock-cells = <1>;
			#reset-cells = <1>;
		};

		power_mpmu: power-controller {
			compatible = "spacemit,k1-powerdomain-mpmu";
			/* ... */
			#power-domain-cells = <0>;
		};
	};

For the other two clock controllers (APBS and APBC), syscons are really
unnecessary and it's simple to fold them.

> > 
> > If you're more comfortable with reset and clock controllers folded
> > together and eliminating most of these syscons, I'm willing to make the
> > change.
> 
> This is expected.

Thanks for the explanation.

> 
> 
> Best regards,
> Krzysztof

Best regards,
Haylen Chu

[1]: https://developer.spacemit.com/documentation?token=T7TnwVZz1iPBk1kKwAPc6lyKnNb#part958

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
