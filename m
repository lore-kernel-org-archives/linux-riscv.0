Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC310C19F32
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 06:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d75tNeGwjd3jVO+WM2GhbsmaTjNVYaokJzVwx29gfUg=; b=F4kf1XmDXyyyJC
	Y1WAJjz2jf7xiRRhuSnirt13/rhICAf0/r7o3KjkiISTndyPCnqcwpj0ityCzwvnFe23vW7P9LRYR
	//XcWKuwARzyfarVhJGt/iWSNAW5hMOK5cFP7qE5yv8aOKFbYB5tCmE6GqbSIfEL9d05BkcBUnDwf
	o7VAvGB5C8l0z8gIfEWDK0Kh46tuitygSpulPriGp68IEBjU2+Y84iQ3eKurEP+GxDKFp2imIGR/t
	NJUxsJOsvGprs0A75/6VDwLdQHKvURy5+okxy7uHqf6tO8C30q426Nm+IEntvXHEWZXEFxMVhM/PF
	t8XZPdRU0yF/dg+Grmnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRJE-0000000DJxj-45tt;
	Fri, 07 Mar 2025 06:35:48 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRIU-0000000DJmo-2Baa
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 06:35:03 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id D22E4EC59F6;
	Thu, 06 Mar 2025 22:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741329300; bh=D0GUM9vwdTZADtSV9LFCdv8+sJcUQRqRldlU0zdH/Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7ZlE6PWaawE93M3WiN3Ctu8ZMkfFbWmBZcco7iFTg2miH6Nb7t6zuDELQwrLhCJ/
	 KQUC1xnD5eXMMcdGsH0BnfKU0iTikfafXQm5phKMnv8ujrxJJv2je7vgEUTLIK16i7
	 MZ4T8ScsTeFhJ9bdjed/nGuJ14yUCIxq4hPjpq1Jk5D1hJXwCmcgUQMFI5YndozlFd
	 iokjC9YfGJ4zXAFrykQXpdaTc7VwSpsiNLzzTdsNOd5e7pbqRJwiJCpPhmZu9Q3c2P
	 61GykHhV9N7DDtEKqWYpNUy5cAc4I+f1aVOIHDWxQcoe5EdgrKhoHdoBfdbTDXjXYI
	 TVWt77h5BEhPA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVSd8SIkaOAx; Thu,  6 Mar 2025 22:34:57 -0800 (PST)
Received: from ketchup (unknown [183.217.80.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 1F74EEC59F2;
	Thu, 06 Mar 2025 22:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741329297; bh=D0GUM9vwdTZADtSV9LFCdv8+sJcUQRqRldlU0zdH/Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0oEXldotZARGvdAvlWurLFHbM4qjHDcFLotl2vSXHITGYzNoDq/oWYl67NBfdFL5M
	 mW7FREbGrtIrLlKHdHKTsYxw97Bi8T0R0a2q2+P4cicA5l5zl4SCMg5Y8Re6+//8t3
	 KShp/r8nOMlFxEv09O6jNtAs+SfXb7QyUzQzV1fTwkuhdOgA3WkXJb+NFRKKNRkrPN
	 EmKPs/0fUmUWYg1EitGOvAk9q6MdJ0nw3ccBi8eE8pzOmByj3FEEsrIB4f/vxdcG7y
	 qPVlyWLu9zsqltQLnvs9GVst9O9IrAytpK+/Evs6AUsD6UxFgTkS0v7TpLOtdAek4Q
	 oxDApqq2bPxJw==
Date: Fri, 7 Mar 2025 06:34:47 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: clock: spacemit: Add spacemit,k1-pll
Message-ID: <Z8qTh1zRJTjYNCtz@ketchup>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-4-heylenay@4d2.org>
 <20250307002943-GYA64516@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250307002943-GYA64516@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_223502_599749_C61AAF98 
X-CRM114-Status: GOOD (  19.04  )
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

On Fri, Mar 07, 2025 at 12:29:43AM +0000, Yixun Lan wrote:
> Hi Haylen:
> 
> On 17:57 Thu 06 Mar     , Haylen Chu wrote:
> > Add definition for the PLL found on Spacemit K1 SoC, which takes the
> > external 24MHz oscillator as input and generates clocks in various
> > frequencies for the system.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  .../bindings/clock/spacemit,k1-pll.yaml       | 50 +++++++++++++++++++
> >  include/dt-bindings/clock/spacemit,k1-ccu.h   | 37 ++++++++++++++
> >  2 files changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> > new file mode 100644
> > index 000000000000..23d7aa1bc573
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/spacemit,k1-pll.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Spacemit K1 PLL
> > +
> > +maintainers:
> > +  - Haylen Chu <heylenay@4d2.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-pll
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: External 24MHz oscillator
> > +
> > +  spacemit,mpmu:
> how about naming it as "spacemit,mpmu-syscon" explicitly?
> to indicate this is a syscon phandle, it's more readable

It's okay but I'm not sure whether this helps a lot... will wait for the
maintainer to decide the name.

> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the "Main PMU (MPMU)" syscon. It is used to check PLL
> > +      lock status.
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +    description:
> > +      See <dt-bindings/clock/spacemit,k1-ccu.h> for valid indices.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - spacemit,mpmu
> > +  - "#clock-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    clock-controller@d4090000 {
> > +        compatible = "spacemit,k1-pll";
> > +        reg = <0xd4090000 0x1000>;
> > +        clocks = <&vctcxo_24m>;
> > +        spacemit,mpmu = <&sysctl_mpmu>;
> > +        #clock-cells = <1>;
> > +    };
> -- 

...

> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
