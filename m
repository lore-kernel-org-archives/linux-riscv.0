Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480D1C25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5Xgd4+CsLuwptd2aaWXz/nV7vGM8gXfNYC7teFS9eE=; b=bi75WP4e/3XdaP
	ZQohy3wWsYNZcNSjVAyXGK+EP7Xkg6ZXLwUiDxE6bVGMkJT0eaOlYzTnnABTkaoFuSyHZolwPHDfN
	FZ9EnB1l8/JfB0xhB55GHBwc3+UaDVIlYDKdJILnPrc5m59Bs7oj154GINLDUe2DX4nbEqkBkN3Ep
	hRMl95ldeJAnPTYIT8nwgevd0OKfM7I3imHYo4m4I/MpOiD/aL+X7nc6CN6DDeDZ04+ubRP+IVfnM
	Dc2SSA4mNEVVwEUvxPdWsSYKof0NhBgo8go4dUxhGBHQS3pRu8DJb6iDaoja/cVkpk8bNZwOvYh/e
	5io+QqLJGBGESYVXXbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHBu-00FmNY-3B;
	Fri, 27 Oct 2023 07:23:34 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHBr-00FmMV-0J;
	Fri, 27 Oct 2023 07:23:32 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39R7MCuA061681;
	Fri, 27 Oct 2023 15:22:12 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Fri, 27 Oct 2023 15:22:08 +0800
Date: Fri, 27 Oct 2023 15:22:03 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 RESEND 10/13] dt-bindings: riscv: Add Andes PMU
 extension description
Message-ID: <ZTtlCEnbmVoPGj5l@APC323>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-11-peterlin@andestech.com>
 <20231023-spectacle-module-0516fb35995a@spud>
 <ZTohvi7TPyVoO-Sl@APC323>
 <20231026-concierge-perfume-6c327fc5282f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026-concierge-perfume-6c327fc5282f@spud>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39R7MCuA061681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_002331_576713_78246021 
X-CRM114-Status: GOOD (  20.74  )
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

On Thu, Oct 26, 2023 at 03:09:30PM +0100, Conor Dooley wrote:
> On Thu, Oct 26, 2023 at 04:22:22PM +0800, Yu-Chien Peter Lin wrote:
> > Hi Conor,
> > 
> > On Mon, Oct 23, 2023 at 01:03:53PM +0100, Conor Dooley wrote:
> > > On Mon, Oct 23, 2023 at 08:40:57AM +0800, Yu Chien Peter Lin wrote:
> > > > Document the ISA string for Andes Technology performance monitor
> > > > extension which provides counter overflow interrupt and mode
> > > > filtering mechanisms.
> > > > 
> > > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > > ---
> > > > Changes v2 -> v3:
> > > >   - New patch
> > > > ---
> > > >  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > index 5e9291d258d5..e0694e2adbc2 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > @@ -246,6 +246,13 @@ properties:
> > > >              in commit 2e5236 ("Ztso is now ratified.") of the
> > > >              riscv-isa-manual.
> > > >  
> > > > +        - const: xandespmu
> > > > +          description:
> > > > +            The Andes Technology performance monitor extension for counter overflow
> > > > +            and privilege mode filtering. For more details, see Counter Related
> > > > +            Registers in the AX45MP datasheet.
> > > > +            https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> > > 
> > > Does/will this PMU function identically on the other CPUs that support it?
> > 
> > Yes, I can confirm that.
> 
> If there's a more generic document available, that'd be good.

While it is currently the most comprehensive and publicly available
document we have, I will update it here once I obtain a more specific
version of the extension.

> Otherwise,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the review.

Regards,
Peter Lin

> 
> Thanks,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
