Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897A3CDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9lcyBvWV/cejeQNQvy+YRog43IFxdIU5oYrZjtNeZU=; b=a8gdT1CTLK9Kq9
	nosRa6+DkVZAzc1Fz9rsI3/IjogcTBc9krBPJn+RkmfDuOxtvhDfOMXb9A5fNCO5IiGJKzU3Qlc7G
	DPomMieayNV4GwB/UP3oHmGvrEb+RuaNrKfuQibvp5ZjmTYdDqkm0D9DMk9TVM6+BPFasjUJGtCln
	tyWEEuidHGHUF5k6Lm8N0LFlYGWiEIcJ8gTB2QGsIfY7LFp8T2WyVu7Y37FnnRdXUtZ0gDXwHuFTQ
	tOH+Aa6uTFdwBZ08NVq78O9auv4KNExsFPz/2H8POG8Jaumf87gTRaLiSqXOEKxPNeOPGiqaLTZ/k
	XP7rNHdqxKs2k+SOgYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkYw-001WLb-35;
	Fri, 20 Oct 2023 08:08:54 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkYu-001WKm-1d
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 08:08:54 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39K88Sw2002009;
	Fri, 20 Oct 2023 16:08:28 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Fri, 20 Oct 2023 16:08:27 +0800
Date: Fri, 20 Oct 2023 16:08:27 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <conor@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>, <dminus@andestech.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: riscv: Add andestech,cpu-intc to
 interrupt-controller
Message-ID: <ZTI1ex8xlif7w8tM@APC323>
References: <20231019135905.3658215-1-peterlin@andestech.com>
 <ba3ac1b2-d924-44cb-97dd-6af65a1db7a8@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba3ac1b2-d924-44cb-97dd-6af65a1db7a8@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39K88Sw2002009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_010852_983913_DB6F4CD9 
X-CRM114-Status: GOOD (  14.70  )
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

On Fri, Oct 20, 2023 at 09:00:03AM +0200, Krzysztof Kozlowski wrote:
> On 19/10/2023 15:59, Yu Chien Peter Lin wrote:
> > Add "andestech,cpu-intc" compatible string for Andes INTC which
> > provides Andes-specific IRQ chip functions.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> > Changes v1 -> v2:
> >   - New patch
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index 97e8441eda1c..5b216e11c69f 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -99,7 +99,9 @@ properties:
> >          const: 1
> >  
> >        compatible:
> > -        const: riscv,cpu-intc
> > +        enum:
> > +          - riscv,cpu-intc
> > +          - andestech,cpu-intc
> 
> Keep alphabetical order. Do not add stuff to the end of the lists. This
> is a generic rule. Everywhere.

Hi Krzysztof,

Thansk for pointing this out.
Will fix this in PATCH v3.

Best regards,
Peter Lin

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
