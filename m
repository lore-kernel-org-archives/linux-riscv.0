Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF52E66886
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 02:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvTi1r1LWt/K3mJJ+cSVm6Xsg6lLqclB3k6aLz4vnrU=; b=tvfztu7PBuni6v
	hzcHdtOA5nxcxFaJY8nPfJAAeI0hHjCrvt1gdcx3h84+w4xtR0eR6IhoYzMKLW775gXxAPdC4h19L
	fySlXYQ2LLhLMGzDsJUi9hGiCQzaUdmxjG0wQRCztOyHEA1x/wsSwS7gzPSS1rL87RGmPEoWIWEKi
	gS2VqvvshzTIYWkulWtjjO6tFFQtJPyTPtLWrodypi6ydnXgDbKnPXyCpa6VmpgpkWX7Xo9SFxhLP
	6ztTSSLFqd2ovcZF1rk/YbBXiA85h2Kc7xMSYY7yILnPJM67t3qn0hCD495BkOUc69CZ77jTjqZoq
	xUC0kDdf3W3CI9j3YdBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXVPG-0000000Cyl2-0mqU;
	Mon, 22 Dec 2025 02:12:18 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXVPD-0000000Cykg-27wd
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 02:12:16 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7A841340F4B;
	Mon, 22 Dec 2025 02:12:12 +0000 (UTC)
Date: Mon, 22 Dec 2025 10:12:02 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mmc: spacemit,sdhci: add reset support
Message-ID: <20251222021202-GYA1977180@gentoo.org>
References: <20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org>
 <20251221-07-k1-sdhci-reset-v1-1-6780af7fa6e7@gentoo.org>
 <20251221-unnatural-resilient-trogon-7b20a7@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251221-unnatural-resilient-trogon-7b20a7@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_181215_590302_143B9D1F 
X-CRM114-Status: GOOD (  16.73  )
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

Hi Krzysztof, 

On 16:09 Sun 21 Dec     , Krzysztof Kozlowski wrote:
> On Sun, Dec 21, 2025 at 04:20:26PM +0800, Yixun Lan wrote:
> > The SpacemiT SDHCI controller has two reset lines, one connect to AXI bus
> > which shared by all controllers, while another one connect to individual
> > controller separately.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > index 13d9382058fb..322c69b056f4 100644
> > --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > @@ -32,12 +32,24 @@ properties:
> >        - const: core
> >        - const: io
> >  
> > +  resets:
> > +    items:
> > +      - description: axi reset, connect to AXI bus, shared by all controllers
> > +      - description: sdh reset, connect to individual controller separately
> > +
> > +  reset-names:
> > +    items:
> > +      - const: axi
> > +      - const: sdh
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - interrupts
> >    - clocks
> >    - clock-names
> > +  - resets
> > +  - reset-names
> 
> This is an ABI break without mentioning in commit msg and without any
> justification.
> 
Indeed, this will introduce a breakage when combining new kernel + old dtb

Since in current case, the eMMC works fine without reset line operation,
I then would make this property optional (drop it from 'required' section)
and switch to use devm_reset_control_get_optional_xx() API in driver code

Does this looks good to you?

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
