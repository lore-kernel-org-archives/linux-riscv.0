Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF501C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Si8UlZATXUjMwui7+YJLkSWjqEew5R5HIEHNAc6SiVk=; b=Y2vNcuMGaI/iEm
	PgkPU83iGB/y5fav9YoSdj6brNl7s10zgJU+NxXLsld3PUmVvHypsHGB2+rmSvNNhVtRKUV72Fud3
	TUDgSm4Ef2eDY24tieBpzWu9DUQM7E1OPDY52m7SrJIm+hmnb9znkK8cxjFZrBQOSSOpTm/vk+UqM
	rGWXDDlr7j8ubxfjRdOlmq20dbE2dN2DCbcDiO1ozZme/KUeTeIPUY6kyt3x7uBBV3OK0K/DEOjJL
	ulhTE7IF4loHuDvJKEsVphrutbcovsA+T3FyMRtEF0oliGZ/peQpvppUTen3bVuNXbnLnuUK4Cdma
	C4pw8wZsTnEPrzjqxGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxUiW-00A82W-50; Tue, 22 Nov 2022 14:57:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxUiQ-00A7xc-3k
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 14:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669129057; x=1700665057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ptcKDaqf3gRRwrB0yaoMEgRygHe9Kq+LCx/IHTSE3fY=;
  b=wgmk4/8ftGopG3oAqYKZ5dz71voVTiXCL7aGprz4aRmhoVBA2aVDFwDQ
   2GT0iwlEbH+nKzjCyxF79ipU0cSS6gjKHfpG6bzGHbuJ6QfwUyMnc56nC
   n5VLcVp4cX2Vau0kQU/evEFAnL8bGJShFY9OVxmEGU2ZKfsF7ajTy4Jb2
   U+gVh/3CVEFk7ZMBVIJgOALf8JJ7yxA+wwaw/m/ugUceLFof4SkBN2VCy
   BOt1imkom/YBf6GqlJS6c+SLxAG/E8fPYARldeS32xWw05IHExI7v11Bg
   7uMDVOBOuaXkvDJg29H9cqwl+BHDnTtrIkiLK5LHIjD2JO6UF/ON72K1O
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; 
   d="scan'208";a="124605464"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 07:57:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 07:57:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 07:57:23 -0700
Date: Tue, 22 Nov 2022 14:57:05 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <anup@brainfault.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Anup Patel
	<apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property
 riscv,timer-can-wake-cpu
Message-ID: <Y3zjQXqEHsaoVVvf@wendy>
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com>
 <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
 <CAK9=C2WjU+2cD7UZbja3TT++KCdRyWroT=50dw=fzi5mX30rcw@mail.gmail.com>
 <7a0477a0-9f0f-87d6-4070-30321745f4cc@linaro.org>
 <CAAhSdy20p5bkVanKGkGyArn94hWJhwncztnX7U+4WkN9-v7NsA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy20p5bkVanKGkGyArn94hWJhwncztnX7U+4WkN9-v7NsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_065738_308430_EAB0F0DC 
X-CRM114-Status: GOOD (  34.31  )
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

Hey Anup,

I've been meaning to get back to you on this stuff for quite a while,
but unfortunately I've gotten distracted with other stuff every time I
got close. Apologies for that :(

On Wed, Jul 27, 2022 at 07:04:57PM +0530, Anup Patel wrote:
> On Wed, Jul 27, 2022 at 6:05 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 27/07/2022 14:21, Anup Patel wrote:
> > > On Wed, Jul 27, 2022 at 5:37 PM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > >>
> > >> On 27/07/2022 13:43, Anup Patel wrote:
> > >
> > > Since, there is no dedicated timer node, we use CPU compatible string
> > > for probing the per-CPU timer.
> >
> > Next time you add a properties:
> > riscv,saata-can-wake-cpu
> > riscv,usb-can-wake-cpu
> > riscv,interrupt-controller-can-wake-cpu
> >
> > and so on and keep explaining that "historically" you did not define
> > separate nodes, so thus must be in CPU node.
> 
> This is a one-of-case with RISC-V DeviceTree where we are living with
> the fact that there is no timer DT node. If we add a timer DT node now
> then we have to deal with compatibility for existing platforms.

I don't really understand the argument here. Perhaps this made sense a
few months ago, but it no longer does IMO.

We have existing platforms that interpreted the SBI spec (or perhaps
predated the SBI spec in the relevant form?) differently. I've pasted it
several times now I feel but it's relevant so pasting it here again...

On the subject of suspend, the RISC-V SBI spec states:
> Request the SBI implementation to put the calling hart in a platform
> specific suspend (or low power) state specified by the suspend_type
> parameter. The hart will automatically come out of suspended state and
> resume normal execution when it receives an interrupt or platform
> specific hardware event.

This does not cover whether a given event actually reaches the hart or
not, just what the hart will do if it receives an event. For the
implementation on the Allwinner D1, timer events are not received during
suspend.

Through-out the various bits of conversation so far, I have been
operating on the assumption that on PolarFire SoC, and potentially other
SiFive based implementations, events from the RISC-V timer do reach a
hart during suspend.
I realised while writing this response that I have never actually tested
it - the C3STOP flag caused problems for me during regular operation &
not while using some DT defined sleep states.
I've been learning/piecing together the bits of what is happening here as
time goes on, so I made an assumption that may or may not be correct, and
I am still oh-so-far from an understanding.
I just took it for granted that the existing driver worked correctly for
"old" SiFive stuff which MPFS is based on & figured that with ~the same
core complex as the fu540 that we'd behave similarly.
Perhaps that was not a good idea & please let me know if I've been
barking up the wrong tree.

Do we know definitively what is/isn't the case for any of the existing
platforms?
I can test some stuff, but it'll take some time as it's a bad week in
my neck of the woods.

> If we add a timer DT node now
> then we have to deal with compatibility for existing platforms.

In terms of what to encode in a DT, and given the spec never says that
the timer interrupt must arrive during suspend, we must assume, by
default, that no timer events arrive during suspend.

We have a bunch of existing platforms that may (do?) get timer events
during suspend, the opposite of the proposed default behaviour.

I'm trying to follow the line of reasoning but I fail to see how taking
either the property or node approach allows us to maintain behaviour for
exiting platforms that that do see timer events during suspend without
adding *something* to the DT. No matter what we add, we've got some sort
of backwards compatibility issue, right?

I noted the above:

> Since, there is no dedicated timer node, we use CPU compatible string
> for probing the per-CPU timer.

If we could rely on the cpu compatible why would we need to add a
dt-property anyway? Forgive my naivety here, but is the timer event in
suspend behaviour not a "core complex" level attribute rather than a
something that can be consistently determined by the cpu compatible?

Either way, we need to figure out why enabling C3STOP is causing other
timer issues even when we are not in some sort of sleep state & do
something about that - or figure out some different way to communicate
the behavioural differences.
I would expect timers to continue working "normally" with the flag set,
even if how they work is subtly different?
On a D1, with the C3STOP "feature" flag set, and it's custom timer
implementation unused, how do timers behave?

Hopefully I've missed something blatant here Anup!

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
