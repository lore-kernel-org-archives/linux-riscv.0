Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31375C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 11:22:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 850236101D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 11:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 850236101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DII2xdtx4D4jT+d0kVLJfFGVKG14zulcgPXho2nUhTI=; b=sdb5gBeYnCHQ43
	lhkdkhsBTLHf+Vw/x5vgV26cEhyoQVx6rm+Yr8d0Yy2g/nbmIDfEZom+vnFMphASjS9kFcN3zIv2k
	LTdzoHFBmvO/fE5bYOXXk0T+7vE1NSkQGitA3sEuHZts/VlEA3i49yHqXMkYQ+udva2Lk2lXTJRmH
	Gk4I4f6W8PY5fWOyCFURPmOlz/UEuZ0Z/7Y5wMngIKrDiq+frGeAlDQMtuCuWNoNmp2p6/Awf6rdL
	of9LPbj3bJEv/51zM122D3T0CibVN4I/IpCYW2JQnZQU5U7kLKjQApy6hG0uWOzsJlnaI+AoGfCsi
	CwBB9ue3aD1mgjaWknew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1macJ7-00GGt3-EQ; Wed, 13 Oct 2021 11:20:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maanh-00FoJw-QA
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 09:43:55 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1maanc-0003ui-N1; Wed, 13 Oct 2021 11:43:48 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Anup Patel <anup@brainfault.org>
Cc: Guo Ren <guoren@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
Date: Wed, 13 Oct 2021 11:43:47 +0200
Message-ID: <4027415.QZv1u5a1DM@diego>
In-Reply-To: <CAAhSdy29WAXfBz6Ag-kAjNo_uhJO+AuC0e-UyWhwhaCmrw7pjw@mail.gmail.com>
References: <20211013012149.2834212-1-guoren@kernel.org>
 <4245323.jvX0RauA9x@diego>
 <CAAhSdy29WAXfBz6Ag-kAjNo_uhJO+AuC0e-UyWhwhaCmrw7pjw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_024353_896294_E1277245 
X-CRM114-Status: GOOD (  31.95  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 13. Oktober 2021, 11:19:53 CEST schrieb Anup Patel:
> On Wed, Oct 13, 2021 at 2:44 PM Heiko St=FCbner <heiko@sntech.de> wrote:
> >
> > Am Mittwoch, 13. Oktober 2021, 11:11:26 CEST schrieb Anup Patel:
> > > On Wed, Oct 13, 2021 at 2:27 PM Heiko St=FCbner <heiko@sntech.de> wro=
te:
> > > >
> > > > Hi Anup,
> > > >
> > > > Am Mittwoch, 13. Oktober 2021, 07:11:46 CEST schrieb Anup Patel:
> > > > > On Wed, Oct 13, 2021 at 6:52 AM <guoren@kernel.org> wrote:
> > > > > >
> > > > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > > > >
> > > > > > Add the compatible string "thead,c900-plic" to the riscv plic
> > > > > > bindings to support SOCs with thead,c9xx processor cores.
> > > > > >
> > > > > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > > > > Cc: Rob Herring <robh@kernel.org>
> > > > > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > > > > > Cc: Anup Patel <anup@brainfault.org>
> > > > > > Cc: Atish Patra <atish.patra@wdc.com>
> > > > > >
> > > > > > ---
> > > > > >
> > > > > > Changes since V3:
> > > > > >  - Rename "c9xx" to "c900"
> > > > > >  - Add thead,c900-plic in the description section
> > > > > > ---
> > > > > >  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml    | =
6 ++++++
> > > > > >  1 file changed, 6 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/interrupt-contro=
ller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-c=
ontroller/sifive,plic-1.0.0.yaml
> > > > > > index 08d5a57ce00f..82629832e5a5 100644
> > > > > > --- a/Documentation/devicetree/bindings/interrupt-controller/si=
five,plic-1.0.0.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/si=
five,plic-1.0.0.yaml
> > > > > > @@ -35,6 +35,11 @@ description:
> > > > > >    contains a specific memory layout, which is documented in ch=
apter 8 of the
> > > > > >    SiFive U5 Coreplex Series Manual <https://static.dev.sifive.=
com/U54-MC-RVCoreIP.pdf>.
> > > > > >
> > > > > > +  While the "thead,c900-plic" would mask IRQ with readl(claim)=
, so it needn't
> > > > > > +  mask/unmask which needed in RISC-V PLIC. When in IRQS_ONESHO=
T & IRQCHIP_EOI_THREADED
> > > > > > +  path, unnecessary mask operation would cause a blocking irq =
bug in thead,c900-plic.
> > > > > > +  Because when IRQ is disabled in c900, writel(hwirq, claim) w=
ould be invalid.
> > > > >
> > > > > This is a totally incorrect description of the errata required fo=
r C9xx PLIC.
> > > > >
> > > > > Please don't project non-compliance as a feature of C9xx PLIC.
> > > > >
> > > > > > +
> > > > > >  maintainers:
> > > > > >    - Sagar Kadam <sagar.kadam@sifive.com>
> > > > > >    - Paul Walmsley  <paul.walmsley@sifive.com>
> > > > > > @@ -46,6 +51,7 @@ properties:
> > > > > >        - enum:
> > > > > >            - sifive,fu540-c000-plic
> > > > > >            - canaan,k210-plic
> > > > > > +          - thead,c900-plic
> > > >
> > > > we still want specific SoC names in the compatible, the "c900"
> > > > is still a sort-of placeholder.
> > >
> > > Yes, we need "c900" compatible string as well. The "c9xx"
> > > compatible string is for the custom PLIC spec followed by T-HEAD.
> >
> > What I meant was that the soc-specific string should name the
> > actual SoC (c906, c910) and not some imaginary chip ;-)
> =

> Ahh, yes. It should be an actual soc name in the compatible
> string.
> =

> For example, SiFive uses "fu540" string to identify some of the
> devices on both SiFive unleashed and SiFive unmatched boards.
> =

> I was under the impression that "c900" is an actual SoC name.
> =

> Regards,
> Anup
> =

> >
> > See for example mali gpu bindings for a similar reference
> > in devicetree/bindings/gpu/arm,mali-bifrost.yaml .
> >
> >
> >
> >
> > >
> > > >
> > > >
> > > > > >        - const: sifive,plic-1.0.0
> > > > >
> > > > > The PLIC DT node requires two compatible string:
> > > > > <implementation_compat>, <spec_compat>
> > > > >
> > > > > The C9xx PLIC is not RISC-V PLIC so, the DT node should
> > > > > be: "thead,c900-plic", "thead,c9xx-plic"
> > > > >
> > > > > You need to change "- const: sifive,plic-1.0.0" to
> > > > > - enum:
> > > > >     - sifive,plic-1.0.0
> > > > >     - thead,c9xx-plic

isn't XuanTie the series containing the c906 and c910?
So maybe
	thead,xuantie-plic
for the spec compatible.

So doing in full
	compatible =3D "thead,c906-plic", "thead,xuantie-plic"


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
