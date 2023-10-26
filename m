Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F7EC25B6B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 08:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+or2rjHy+oB7SB3mcE8i/VJQ3etD2zEci+KKu3p6VM=; b=qDZSqh1s3lDfwl
	0OhsWZsxQq9v5UyKuhKLRS/fQOBWtUeUvov9p5Dk+RImPDFSbcSpCPderZQuTYOjWYGQrAUtQWUNU
	s5YBJzXo21beCjbl8IyM5WL7xYyTzxTJYwzFzOADuMq6SKFkMz3NBHnP8QNZKr0k8nxGyBsad1eQ4
	KlZMas35++eFLOIPWNfCikn8xV2by3dtdAptG6FanV6hSIOrFXeEDXh1LOj7+oBVWe9YbnRsxCZu+
	ut9KbCP+IiG4hP5pRO83P+5xByKXN1Me4EkXnodSWukE+LubrheGl1FwTAlz7i/Rkfr6B3WxbErmI
	XLrdf3Kc1B6h5JYIk27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvw5n-00E0AQ-1E;
	Thu, 26 Oct 2023 08:51:51 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvw5k-00E09c-1Z;
	Thu, 26 Oct 2023 08:51:50 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39Q8oXK5074274;
	Thu, 26 Oct 2023 16:50:33 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Thu, 26 Oct 2023 16:50:32 +0800
Date: Thu, 26 Oct 2023 16:50:27 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 RESEND 04/13] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
Message-ID: <ZTooUz-UyVuIMOsN@APC323>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-5-peterlin@andestech.com>
 <20231023-contented-passcode-2e8d082afed4@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023-contented-passcode-2e8d082afed4@spud>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39Q8oXK5074274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_015148_972077_6C837978 
X-CRM114-Status: GOOD (  24.44  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On Mon, Oct 23, 2023 at 02:15:21PM +0100, Conor Dooley wrote:
> On Mon, Oct 23, 2023 at 08:40:51AM +0800, Yu Chien Peter Lin wrote:
> > Add "andestech,cpu-intc" compatible string which indicates that
> > Andes specific local interrupt is supported on the core,
> > e.g. AX45MP cores have 3 types of non-standard local interrupt
> > can be handled in supervisor mode:
> > 
> > - Slave port ECC error interrupt
> > - Bus write transaction error interrupt
> > - Performance monitor overflow interrupt
> > 
> > These interrupts are enabled/disabled via a custom register
> > SLIE instead of the standard interrupt enable register SIE.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> > Changes v1 -> v2:
> >   - New patch
> > Changes v2 -> v3:
> >   - Updated commit message
> >   - Fixed possible compatibles for Andes INTC
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index 97e8441eda1c..4c1bbcf07406 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -99,7 +99,12 @@ properties:
> >          const: 1
> >  
> >        compatible:
> > -        const: riscv,cpu-intc
> > +        oneOf:
> > +          - items:
> > +              - enum:
> > +                  - andestech,cpu-intc
> 
> Why is this an enum rather than const? What other entries are we going
> to add here in the near future?

I have no plan to add other entries here, will update in the next
version of patch. Thanks for the review.

> > +              - const: riscv,cpu-intc
> 
> My follow-up question, if my original question on the v2 series had been
> answered was going to be about how generic the "andestech,cpu-intc"
> compatible is.

This can be applied to any Linux-capable CPUs from Andes.

Best regards,
Peter Lin

> Having a cpu-specific compatible in addition to "andestech,cpu-intc"
> one makes sense to me, so that we can differentiate between
> implementations/integrations of this intc, especially if Andes have no
> plans to move to the standard implementation.
> 
> Cheers,
> Conor.
> 
> > +          - const: riscv,cpu-intc
> >  
> >        interrupt-controller: true
> >  
> > -- 
> > 2.34.1
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
