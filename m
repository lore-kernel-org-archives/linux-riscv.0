Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00312D216A2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 13:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bueotqlck1jbIIR1zAhnfyaBjF8hiYQpipuGGbfGQV8=; b=QsO1W86I5gsjMD
	HFsxFUf4t0J6ptz0FagAlQ+AyFR1uySPqfiA/XXN2EeFaE96yFyDpJal54lHsasjlTK6ssV6lUiWA
	aINOH0XgPlcK4X5Mv6Gevqil3ukJJ3QDu1HWD7vQV1uWYjEc79qkbKU9ZsWfrwUk42MfRWGTKsGfx
	/by+h6RD2qARD2wh+wYSTMl+DgDk9if0APuldb20OzjPT1a04J23MwbTdUX9+Z7Sf93Z21S/7AwQk
	bLlXjPw6jprVH9w7/Njw5GnQO8kYwQ25MnLXOpLmu0Stg4SWiLFuBSxoavUZOTx3g7zLZMyW1wkJM
	AaOZ4n4YxcVlqe/ye2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hH7-00000008HbP-1cZl;
	Tue, 15 Oct 2024 13:07:45 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hH3-00000008Ha3-1tY8
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 13:07:43 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 68EC7122FE21;
	Tue, 15 Oct 2024 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1728997656; bh=z8CMqF1Qkrr11chR38o4qGiOfMIibQckV72yf00J/J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/Xfs3EfOWgr0NZuSh+H4k6e3qGH2F/B9PnPqW3VW+740K0nPmK9nkFAsT667IK/A
	 Xmt2BLwhU2JZsCkN+DGTH8bNVCIZZyivM6+cQxxLdr0TrrdXs8Gj6OE0qZLsNKXJs9
	 lfsp53kARAC1XHOb9bkKmzeYPh4UKZFdZTudtpaQ9rBxszrF2EiE8l2VoUC0gxv31k
	 mTDERgn4QqE9TDGyiStvylX5DwNyAUig/AwXzovZoE3EMUtBQi77zEdu0K19X8mR7H
	 mCzwRy+xbrdybg7HI1UqhkT2vQBHTDmuwkb4WACoXGxrZXynuqZ9J4VlEH73C/x1qS
	 PMKgMYZ9suxfA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkmRudQO2a8g; Tue, 15 Oct 2024 06:07:33 -0700 (PDT)
Received: from ketchup (unknown [110.52.220.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 99CB0122FE1E;
	Tue, 15 Oct 2024 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1728997653; bh=z8CMqF1Qkrr11chR38o4qGiOfMIibQckV72yf00J/J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7ya//8LT+6l88z0sqOEUvAZ3tXkFMTajQE+HilwRcmp3JqyvcM+MDr75SHUiiUEX
	 kdqUQojZVzKbbrVTh3WKRguUqy5uWAO9FMg/TAjgltU+QIlBzz0g1wpdkRB7lhNBLO
	 zR3BOol17M6FEribXcTnomnXCm/jxaZxfrGrmxNlBVcI6mmTiHtHmtsa34IrsI05yj
	 NNP3I+Vtjwgq6M5D2+OLvukn9uG2X4lNgteg8lEXh+8/Twv+Tq3wpEPSAtSKp4tWvq
	 Jftbn2xZoBeEtkPKz5y3SWiRs6YcgGlwj8tiTOY9ZIpYk7Ceu0Tzmz+AFfVg99511x
	 ihEp6vcWORHiA==
Date: Tue, 15 Oct 2024 13:07:19 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: thermal: sophgo,cv1800-thermal: Add
 Sophgo CV1800 thermal
Message-ID: <Zw5pB_tPuOgIbaxV@ketchup>
References: <20241014073813.23984-1-heylenay@4d2.org>
 <20241014073813.23984-2-heylenay@4d2.org>
 <cycdlsi3tb6nqgbzzmypmblpcxxqmn3slqcbf5mq2okw3lqrdr@ghvswymvnslp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cycdlsi3tb6nqgbzzmypmblpcxxqmn3slqcbf5mq2okw3lqrdr@ghvswymvnslp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_060741_815409_6798CE5C 
X-CRM114-Status: GOOD (  16.39  )
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

On Tue, Oct 15, 2024 at 07:52:33AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 14, 2024 at 07:38:11AM +0000, Haylen Chu wrote:
> > Add devicetree binding documentation for thermal sensors integrated in
> > Sophgo CV1800 SoCs.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  .../thermal/sophgo,cv1800-thermal.yaml        | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
> > new file mode 100644
> > index 000000000000..14abeb7a272a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/sophgo,cv1800-thermal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV1800 on-SoC Thermal Sensor
> > +
> > +maintainers:
> > +  - Haylen Chu <heylenay@4d2.org>
> > +
> > +description: Sophgo CV1800 on-SoC thermal sensor
> > +
> > +$ref: thermal-sensor.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sophgo,cv1800-thermal
> 
> Not much improved, judging by other patches there is no "CV1800" SoC,
> but that's a family name.  Otherwise please point us to bindings or DTS
> using this SoC.

"cv1800" is referenced in the clock binding[1] and usb binding[2]. I
don't think there are other CV1800 SoC variants. Usage of "CV1800"
should be specific and unambiguous.

Best regards,
Haylen Chu

[1]: https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
[2]: https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/devicetree/bindings/usb/dwc2.yaml#L62

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
