Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85975CA6004
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWd6r4+sqPnSediGA0SitQ7tSGEu2FEKeiEp+4Yo0lo=; b=xcd1Rl5xrrKh9l
	b7Zj71BgIDXH+8HHvl2BJRqebdKCqTONrwU8fOWP7C7k0hXl9clJyYEQnS3PIe/NiaH4t6xk+KXTE
	obV4Ucw3cqN1g0R7JJsjGchQq9Vik0/kQKk0i6pJ+02VpKwG8kn1BeXGG9NhmQZewINWCqcoigkcX
	aC4fxEkzUh1rpUkmiPExw8FhzuiOlEpOQGqZ4nI59f59ZlK6+nt30qphzD3ulyGYwocD+g8/OkBYX
	W9TTXnhEF10SvkLSUct9Y5hy/oS16LgoDMeec+bsYlR8FWtvJ8qt0Xk4asdWI+YDBxFl8kumrN5ZP
	umIPk2fYdNszhXzQowbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEe5n-00000003PZh-1yWh;
	Thu, 08 Oct 2026 02:42:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEe5m-00000003PZb-0F2N
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 02:42:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 699C860136;
	Thu,  8 Oct 2026 02:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A031F000FF;
	Thu,  8 Oct 2026 02:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791427365;
	bh=kqosaf+Q/VJaHyGe9K/rhBnyBgCjwDrSRQ9qYscTxqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bnAr6IIChMXbyHpyYVtiHSNmfoTW9Fb89YGeS0tqMybD45ygPPD7jCKU1NBNmC06A
	 dqYylv8brG0CBaHNWXJeRm0hAPIM6t5wAgkWI+wmlGFp1w1iAM6up22ptvM1SKmOC+
	 KbXAGEQEhoz6x62LMstG2EwrLR57M1yRwDFQTpMBj0K0jbj/Z8+l9DyAxlnVi4liez
	 7uC5ESyl7tpp/0K+UktmKATbXammTy3Cqpq9S3YzCqaaJi35R7EsKT0VvMQ7RLo7Zz
	 1Lh4zKj6rCbbNkevwBdYsg796pLsRg38Az1xRZyqpINIoE3olzVW8Y2/7TFGupLYo2
	 hFSCSnU6CGO/w==
Date: Thu, 8 Oct 2026 02:42:42 +0000
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: spacemit: Add power domain
 controller
Message-ID: <20261008024242-GKA2005@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-1-0acd2b36b96f@kernel.org>
 <20260928183026.GA211865-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928183026.GA211865-robh@kernel.org>
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

Hi Rob,

On 13:30 Mon 28 Sep     , Rob Herring wrote:
> On Fri, Sep 18, 2026 at 02:40:13AM +0000, Yixun Lan wrote:
> > Add initial power domain driver support for SpacemiT K1/K3 SoC, The Power
> > Domain Controller is SoC internal module which is part of APMU (Advanced
> > Power Management Unit), it is responsible for managing power across multi
> > power domains, which includes power on/off, isolation, power-on sequence.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  .../bindings/power/spacemit,power-controller.yaml  | 43 ++++++++++++++++++++++
> >  include/dt-bindings/power/spacemit,k1-power.h      | 14 +++++++
> >  include/dt-bindings/power/spacemit,k3-power.h      | 12 ++++++
> >  3 files changed, 69 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/power/spacemit,power-controller.yaml b/Documentation/devicetree/bindings/power/spacemit,power-controller.yaml
> > new file mode 100644
> > index 000000000000..f869285f84da
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/spacemit,power-controller.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/spacemit,power-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT Power Domains Controller
> > +
> > +maintainers:
> > +  - Yixun Lan <dlan@kernel.org>
> > +
> > +description: |
> > +  SpacemiT processors include support for multiple power domains which can be
> > +  powered on/off by software based on different application scenes to save power.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - spacemit,k1-power-controller
> > +      - spacemit,k3-power-controller
> > +
> > +  '#power-domain-cells':
> > +    const: 1
> > +
> > +  spacemit,apmu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A phandle to APMU syscon to control registers for power domain
> 
> Sounds like the APMU should be the power-domain provider directly. You 
> don't seem to have any other registers for this node.
> 
em, you right, I will convert this patch to auxiliary driver which will
make this dt-binding doc obsolete

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
