Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC7CC25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 08:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCKGkvULu8UbD7DUlBn2hN15fI3qctaoci2EdAe+wlc=; b=f3qMxlIg1rak3o
	/IgcWQ1fiKZ4LjPWw8tT17y/7yqhqzE9wBqZ8fOZTP4NexigdWiMm6L+mLtcaCWdPRPLJSplenxN6
	9xKitjKil3jWmX7Lshtu2f0X6i3IHRwp/WbYj1e2qsWk8qvDmfR6N8bUl7FuJHUR3cspOvflN9s4s
	3Y9EmXOTdbN72iZKn+1BEUz8hk/p3IotrCff7fuxf80ppVK4GvmFF83jU8qWMX+BOqTMndSAaYlPM
	IPtk2GVxSCFcUQAwnYnzPueffT7OSXRNxlawv+f5lIfjPTyZT33Q2fAaqEohW81p1wPIF5AV1TH9L
	OoTxZozbf2Fy2KOsPBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvf3-00DwfY-04;
	Thu, 26 Oct 2023 08:24:13 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvey-00Dwf5-1z;
	Thu, 26 Oct 2023 08:24:10 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39Q8MUGX059449;
	Thu, 26 Oct 2023 16:22:30 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Thu, 26 Oct 2023 16:22:26 +0800
Date: Thu, 26 Oct 2023 16:22:22 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 RESEND 10/13] dt-bindings: riscv: Add Andes PMU
 extension description
Message-ID: <ZTohvi7TPyVoO-Sl@APC323>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-11-peterlin@andestech.com>
 <20231023-spectacle-module-0516fb35995a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023-spectacle-module-0516fb35995a@spud>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39Q8MUGX059449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_012409_101979_3C2BCA91 
X-CRM114-Status: GOOD (  17.04  )
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

On Mon, Oct 23, 2023 at 01:03:53PM +0100, Conor Dooley wrote:
> On Mon, Oct 23, 2023 at 08:40:57AM +0800, Yu Chien Peter Lin wrote:
> > Document the ISA string for Andes Technology performance monitor
> > extension which provides counter overflow interrupt and mode
> > filtering mechanisms.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> > Changes v2 -> v3:
> >   - New patch
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 5e9291d258d5..e0694e2adbc2 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -246,6 +246,13 @@ properties:
> >              in commit 2e5236 ("Ztso is now ratified.") of the
> >              riscv-isa-manual.
> >  
> > +        - const: xandespmu
> > +          description:
> > +            The Andes Technology performance monitor extension for counter overflow
> > +            and privilege mode filtering. For more details, see Counter Related
> > +            Registers in the AX45MP datasheet.
> > +            https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> 
> Does/will this PMU function identically on the other CPUs that support it?

Yes, I can confirm that.
Thanks for the review.

Best regards,
Peter Lin

> I assume the answer is yes.
> 
> Cheers,
> Conor.
> 
> > +
> >          - const: xtheadpmu
> >            description:
> >              The T-Head performance monitor extension for counter overflow. For more
> > -- 
> > 2.34.1
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
