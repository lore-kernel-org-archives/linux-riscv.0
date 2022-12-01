Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE15C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 11:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ck1aV9F7TUmtlOl2G5SLIuUxrAd6My9Lzb5moZyvIic=; b=svv0KAvl04Hvix
	tTBN/Y66gUhpZVQDMv815WPeavdNGBM67S7uwVsC8ueuNDzAGCZVQRPoJeBHcwi/CuDQ11Csel2Cf
	N9eW3SeNUX8KqDK6/s6guWVOdWqF5bKnkbGlpm4OuJcnubellJZkxmMfHLNGXi8Sa6I8n6XGdubmc
	afh8Uc1SNLVBgEVpPSfNqvzE+adhA7iTvjCCfVsHQ1IwnkQREjfVKUwfT/23ggWGyjdHNXdFN5VGg
	NIFPTdG8GYiqcmkRlAaW/PkTJLSivh64dDIgITOcTaKzSUt3qiIoYthbNfsJi3v3mMxfverqAxFqP
	kwjQrlfTeM6MJ04Pz/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hXP-00701U-17; Thu, 01 Dec 2022 11:15:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hX8-006ztY-My
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 11:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669893315; x=1701429315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rM+K1icdCaFKZCqOFV+QNCG9qeXYbf+NhJP0kyV2GKQ=;
  b=vxWBNehwxImCCblXDxK/ZXQ3R4taU74wFJ6dAoK94ptBidqPBsjclLQL
   5S9UhORHOqF+pGYESXvb4KIGc+EB9GmxIPjbE4bIqT4WEcI7ABdPommhY
   Ax7Cwt7rVLOtiiMiimNUlHjO+5r5WPOdquojDlG3dQ9AJ6bAD2z38k/7D
   PXOMWLwyuKrQLKikR8mLEPPjS9rscfq0ykmefq6mLXNDA5pEnqrWamB/s
   uzzXdH/X7VHopEBmR4vp9MBKlCrZBgRFnaD1CrvJyuStsH60K4SrJSiCn
   ED3favSXDGh9s5rTryIlT2aM0gk6Fi4QbgSkkZJJxJoX8PikH5v98z7rV
   A==;
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="191275759"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Dec 2022 04:15:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Dec 2022 04:15:13 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Dec 2022 04:15:10 -0700
Date: Thu, 1 Dec 2022 11:14:52 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Ilpo =?iso-8859-1?Q?J=E4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>
Subject: Re: [PATCH v2 5/9] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
Message-ID: <Y4iMrKjLAHpkCygo@wendy>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-6-jszhang@kernel.org>
 <60991459-945f-35db-f26a-fb27824728ad@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60991459-945f-35db-f26a-fb27824728ad@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_031514_833566_10E1B1D6 
X-CRM114-Status: GOOD (  14.97  )
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

Hey Krzysztof,

On Thu, Dec 01, 2022 at 12:05:04PM +0100, Krzysztof Kozlowski wrote:
> On 27/11/2022 14:24, Jisheng Zhang wrote:
> > Several SoMs and boards are available that feature the Bouffalolab
> > bl808 SoC. Document the compatible strings.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../bindings/riscv/bouffalolab.yaml           | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > new file mode 100644
> > index 000000000000..91ca9dbdc798
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > @@ -0,0 +1,34 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Bouffalo Lab Technology SoC-based boards
> > +
> > +maintainers:
> > +  - Jisheng Zhang <jszhang@kernel.org>
> > +
> > +description:
> > +  Bouffalo Lab Technology SoC-based boards
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - description: Sipeed M1s SoM:
> > +        items:
> > +          - const: sipeed,m1s
> > +          - const: bouffalolab,bl808
> 
> I don't think that SoM is usable alone. It always needs a carrier, so
> drop this entry.

For my own information, if a SoM is not capable of functioning without a
carrier there is no merit in it having a compatible?
Does this also apply if there are multiple possible carriers from
different vendors?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
