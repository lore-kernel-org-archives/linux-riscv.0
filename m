Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E26C0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 05:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IO+TCOA2Uo1eZKGqFjfqbuS31Vhw30gpc8CprLma3uc=; b=KCPgZz9hN4Vnx6
	AOhI2DW/RH6Wak3lF8gJchM8ATh7YwAydwI2f8e0fDv5hPmNAQPocPlqrIgd7H9dhKTtkLM8/QfND
	xBzgGl0Jrde5UO+TpJ3jmWyVJbx3zdiJEDDYjfW6aX6YijHhl0YcR9x1BnDWljbnKZd7d0OEtOPI2
	YYizHgG6kbbuaxdKIcqqGhj646PH4Tp2okGHX5lJDRVPSbGYQDyX5dT0gjZShVAC7BCnOs4mqaiaB
	GVXkP0D62okVNfzEvK9oxZN642HVL0E1E2sodavfkFPf4sN/8/Tj4bW334CTjNnrSqXGPkCxCpSuZ
	uR1VjYDKBgmkBeSqy/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thidp-00000002ZC5-0lnx;
	Tue, 11 Feb 2025 05:17:01 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thid9-00000002Z8F-0ORm
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 05:16:20 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 587C0122FE5F;
	Mon, 10 Feb 2025 21:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1739250974; bh=FN1LucoCbTc7+M/GZvEt8vYIt4uB2BvVXHfxWPX4kZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v8o7fNGv9Zaqha8RjVEqM2IWywdriu0mBx/IFCCmVvQ+XrXKWq0X3iCVceMimuqUf
	 TfZufiZOGt132Vr8T/nriOX8TofSCX5B5QHgZktU1FO9qw3pcoKyhPSQ/X0R9esjCF
	 80DuaBEGuBOoL7lJOnZkPuRUEZ/m2Jeyzcg11Xjr8kvasaKIw6GdS7tpEuye8i0GAS
	 KoUKFrcQfsfF1N6O4BR/ro2VruVxRmwQ2JApif6bbLFE16zpO2Y6vlAxLCRxHexBO5
	 K4PtHDf0gmxcJ4UVzr34w4LBinIKcmab03rz5WiYUHNXFturTOqgcSR61kltnOLozl
	 bCfNAFiZLJoYg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnxHnOhZCS-n; Mon, 10 Feb 2025 21:16:02 -0800 (PST)
Received: from ketchup (unknown [183.217.81.160])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id E462B122FE21;
	Mon, 10 Feb 2025 21:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1739250962; bh=FN1LucoCbTc7+M/GZvEt8vYIt4uB2BvVXHfxWPX4kZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wqmG01jJ/0yHHWdc2qUdEnH9Nf0yqDio3fPcsdKuOJhiU9PxYqqAqbQ0EDykmbUpc
	 ccwdVTqENqhHUrANZ03HIhXtQ5a6nokJvCx1rHiNg570K4qf2FSWQwd9g4I6sLTX2q
	 X7NaJV/j2bctiyTq4HvmI+4xgzrIzOg47c5IcFn5h9K64Mvhha+78666Wx0/K3P67+
	 UVcTw9DfIz7hLtifrY2ThA4K6cnKt0Y/Pk7bZ5KTWAwTNc1ZbdbSvzmLNwasiLUvjb
	 ZnB6zsK5PwZGXNyWdvHds9ZKvxSdnabk/HiMRWvMmJuhU0oMKvfUYOn1RKRpX5Xusf
	 L0Xy2FKm6LJ5A==
Date: Tue, 11 Feb 2025 05:15:50 +0000
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
Message-ID: <Z6rdBhQ7s2ReOgBL@ketchup>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-4-heylenay@4d2.org>
 <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_211619_427114_9DBADA45 
X-CRM114-Status: GOOD (  25.94  )
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

On Sat, Jan 04, 2025 at 11:07:58AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 03, 2025 at 09:56:35PM +0000, Haylen Chu wrote:
> > Add documentation to describe Spacemit K1 system controller registers.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  .../soc/spacemit/spacemit,k1-syscon.yaml      | 52 +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > new file mode 100644
> > index 000000000000..79c4a74ff30e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Spacemit K1 SoC System Controller
> > +
> > +maintainers:
> > +  - Haylen Chu <heylenay@4d2.org>
> > +
> > +description:
> > +  The Spacemit K1 SoC system controller provides access to shared register files
> > +  for related SoC modules, such as clock controller and reset controller.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - spacemit,k1-apbc-syscon
> > +          - spacemit,k1-apbs-syscon
> > +          - spacemit,k1-apmu-syscon
> > +          - spacemit,k1-mpmu-syscon
> > +      - const: syscon
> > +      - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clock-controller:
> > +    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
> > +    type: object
> 
> So now we see the full picture and it leads to questions.
> 
> 1. Why spacemit,k1-apbc-syscon with spacemit,k1-ccu-apmu child is a
> correct combination?
> 
> 2. Why having this split in the first place? Please confirm that clock
> controller is really, really a separate device and its child in
> datasheet. IOW, fake child for your Linux is a no-go. Fake child while
> devices are independent is another no-go.

These syscons are introduced because the clock controllers share
registers with reset controllers. Folding them into the parents results
in devicetree nodes act as both reset and clock controllers, like what
has been done for Rockchip SoCs. Such folding isn't practical for the
MPMU region either, since watchdog and other misc bits (e.g. PLL lock
status) locates in it.

If you're more comfortable with reset and clock controllers folded
together and eliminating most of these syscons, I'm willing to make the
change.

> Actual answer for 1+2 above would be to fold the child into parent,
> assuming clock controller split is fake in terms of datasheet.
> 
> If it is real device, then allOf:if:then: narrowing the compatibles of
> child might not be worth the complexity.
> 
> 3. Why using different naming, look:
> 
> spacemit,k1-XXXX-syscon
> spacemit,k1-ccu-XXXX

I didn't consider about consistency when naming them. Talked to Yixun,
I'll unify them as spacemit,k1-syscon-* and spacemit,k1-ccu-*, keeping
synchronized with other K1 peripherals.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
