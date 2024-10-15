Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5FDD216B7
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 14:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKQI3Xq31vqzEyxtnTStzU4A1yUm28yjxJ8aFQ7HfGI=; b=zc10r8d3p4EatQ
	5td1jjPtYOukAjm5pGlRVtLtsG+4w8yqgOCJyxLWCTaKoRHvtNQOh7efVPou3yL4WhbaMVvxi530o
	yUIGHMt7ounlU4L4vzjIQg/6FV8C3ZXO+JJMa3WpadBleescUTXx5LYm43HQp5gnAZzFKcj1J/Jv5
	4tFEcZcSjAed1GviYSAKWcBbK9o2dWW68lHQUzicYbKcTn4EThJCT605lB54/CwcLv8Q1+dVGzELM
	0+4/Nh4Ctb7Max6vRRHWTcfkUZbyHTiIyy76h2Pc5dmzvqWKFu0j5k+M67K/wDwDYuQLG46f9AHkQ
	oGNz/7YgXa0O0za3vwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0iZG-00000008WJB-3KBb;
	Tue, 15 Oct 2024 14:30:34 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hU9-00000008Kw1-38QM
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 13:21:15 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 1A234122FE21;
	Tue, 15 Oct 2024 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1728998472; bh=BifDifB6wdUvkl5Iu/cIT7h0gvstAeks818zu+TYv74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjUCldBFec5UnpTkUwhnE14W7FBEE7CGTFEWgvSSW8YP4q5cXW85B80/5znrdIhvE
	 YSgz3uRlW8xACFzs1pyfp0lMZoYWDMUtRsMhZAiqyXdqjNhGg9nQR8weK3velaT1Rw
	 YOQI9JHF6+ywyFKZuA3per0KMo/g65m3LhG6sQ/dhwuALlB2bBLhMjuBB+POoYix/h
	 1bwrw3U/UZowAlizH+fbYZqmNwLcU1yEETVW3OVaLSR23eCVGXgWpjTUwl89DeNkjs
	 KEORSaahgeaZ/HPFnXqeJggxQAVXt7vhA9NQk9JgtiOcSWKqaCkV6+8D+E/meRm4p5
	 HB0izStlZSdew==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59EUaKZiQaZK; Tue, 15 Oct 2024 06:21:08 -0700 (PDT)
Received: from ketchup (unknown [110.52.220.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id F1E91122FE1E;
	Tue, 15 Oct 2024 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1728998468; bh=BifDifB6wdUvkl5Iu/cIT7h0gvstAeks818zu+TYv74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vnMZI+8p5fXNQrO5i/2EDsem9c/EUus7ofhbdg/7N+T70XusEsqnVOpUrIfzU1sA5
	 dghyXpOG1v48hoT77sv7mlqriSd74qa5Fdw4iirLnW/DqBdxQpM5e0Nji+dk2xds5Q
	 /zoy6xucE6lhrJeT4/nsOAQOFbaUeHC/ZV5lsXy1R5y2kRqVKrwJtglhY7KGFBzuNY
	 gsT6VD135fSlZgNzJo7Q1j2ozWvNkJlHQUErAPTKHhlB00UzvDAg6Wt8BVAhSfBNG8
	 r7cJRju+03XLm+owuPVX05aY5jLxJEgDkFVt29eZJoQ6qccKePiURH0u9x5kD6Bi2R
	 3c6zUv9dQSMNA==
Date: Tue, 15 Oct 2024 13:20:54 +0000
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
Message-ID: <Zw5sNqiradqQzmDD@ketchup>
References: <20241014073813.23984-1-heylenay@4d2.org>
 <20241014073813.23984-2-heylenay@4d2.org>
 <4ey46hxumhldwrbzalyw6xzn2l52cejggxvg6e3imus3qqzsjn@r55xpxvkpodu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ey46hxumhldwrbzalyw6xzn2l52cejggxvg6e3imus3qqzsjn@r55xpxvkpodu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_062113_835656_C0826D66 
X-CRM114-Status: GOOD (  18.31  )
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

On Tue, Oct 15, 2024 at 07:55:10AM +0200, Krzysztof Kozlowski wrote:
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
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  sample-rate-hz:
> > +    minimum: 1
> > +    maximum: 1908
> > +    default: 1
> 
> 1. Why this is a property of a board?
> 2. I do not see this property defined in any common schema and I am not
> sure if it even should. Sample rate appears from time to time, but not
> in context of thermal sensors, so this should have vendor prefix.

Thanks, I decide to remove this property.

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
