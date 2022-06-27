Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A443AC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rvLxTISuvnP+zhsctUAK181ZHW7xiWLC+NZqJWConY=; b=Ia3yB/ZVIoA4Tu1Y75shBJvD8F
	o0whilSzatiyyXxg/zjW9ArEuxSHI1gbfvHNKJV+LaV2vu65Qd48l4a/oN3JJR2k/4MH733HYqlq9
	lr5TDrOxgKeMy99qgKpKps/UuiKkErS2d8SQjVj9YdheKGYNVT1A1CnuBwAgEOlHWyVjgApl+lukN
	v8CI6/u3aWftu5ak9VsIyNXrfWUoNMtHIOeTWkGzHemoTTQKD64tG+GNhuLIwIEvOtZ5Nn/SXbcHh
	u1zLfv5MYwLqZYvHxUhJA04/dd2lOZmLN9XRkUr0jRStlKEeGlm9JQjNmkF2g1yqQPYqzrshY4Ruq
	c5NX/CWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pd2-001OmG-Jt; Mon, 27 Jun 2022 14:22:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5pcz-001Ol6-87
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 14:22:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C81E9614D9;
	Mon, 27 Jun 2022 14:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8558DC3411D;
	Mon, 27 Jun 2022 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656339732;
	bh=tbJJZM38KKTKF7ztOTPHwtQvMueD3cEf4XJoqh9xBGA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VlKVh1Gn1syHgeSU2fgl8TITGLA1uHaj9Pz6nTUhb0dtZANF4DTYTZ/ajfONoF3wT
	 lp2O2xb1l4zhUtpOykJ+l2Ru7/7puXju+W0YerouKtdl2eNB0ZA7pZlwWA22gr2qSN
	 cwRgrNdYpgXUfk7d+rdMpQiPGnG6z/fOXs/bAgJtXSyQHC1X3TwFyA9CNB8UqQ/emO
	 JXjli1QLv8lFiyJH+iUkwtjwysbzN4jZu6CXnL0X7kLXHFD8n7QvCLEkSZqIiLxbNS
	 ReWhsDwxucI+VdmzIbDcxYg6ZkIrpxPEDCMnd7jjcGuKjL0KSsTerZRmlv+k4CG6c2
	 i7YMpyq5brTjQ==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1o5pcw-003TFl-BT;
	Mon, 27 Jun 2022 15:22:10 +0100
MIME-Version: 1.0
Date: Mon, 27 Jun 2022 15:22:10 +0100
From: Marc Zyngier <maz@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Document Renesas RZ/Five SoC
In-Reply-To: <CA+V-a8sihw9=Ychakh6tV+1+MpRayr=1VSnhSYZNp0F+f4Hdnw@mail.gmail.com>
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87tu87eh5h.wl-maz@kernel.org>
 <CA+V-a8sihw9=Ychakh6tV+1+MpRayr=1VSnhSYZNp0F+f4Hdnw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1eb7b6525a98b330894b6ce2f9167dc2@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: prabhakar.csengg@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sagar.kadam@sifive.com, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_072213_415299_D9214609 
X-CRM114-Status: GOOD (  28.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-06-27 13:27, Lad, Prabhakar wrote:
> Hi Marc,
> 
> Thank you for the review.
> 
> On Sun, Jun 26, 2022 at 1:35 PM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On Sun, 26 Jun 2022 01:43:25 +0100,
>> Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>> >
>> > Document Renesas RZ/Five (R9A07G043) SoC.
>> >
>> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> > ---
>> > v1->v2:
>> > * Fixed binding doc
>> > * Fixed review comments pointed by Krzysztof.
>> >
>> > RFC->v1:
>> > * Fixed Review comments pointed by Geert and Rob
>> > ---
>> >  .../sifive,plic-1.0.0.yaml                    | 44 +++++++++++++++++--
>> >  1 file changed, 41 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
>> > index 27092c6a86c4..59df367d1e44 100644
>> > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
>> > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
>> > @@ -28,7 +28,10 @@ description:
>> >
>> >    While the PLIC supports both edge-triggered and level-triggered interrupts,
>> >    interrupt handlers are oblivious to this distinction and therefore it is not
>> > -  specified in the PLIC device-tree binding.
>> > +  specified in the PLIC device-tree binding for SiFive PLIC (and similar PLIC's),
>> > +  but for the Renesas RZ/Five Soc (AX45MP AndesCore) which has NCEPLIC100 we need
>> > +  to specify the interrupt type as the flow for EDGE interrupts is different
>> > +  compared to LEVEL interrupts.
>> >
>> >    While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
>> >    "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
>> > @@ -57,6 +60,7 @@ properties:
>> >            - enum:
>> >                - allwinner,sun20i-d1-plic
>> >            - const: thead,c900-plic
>> > +      - const: renesas,r9a07g043-plic
>> 
>> Since it is the NCEPLIC100 that is broken, shouldn't the compatible
>> string actually reflect that? I'd rather see 'andes,nceplic100' once
>> and for all instead of starting with Renesas, quickly followed by all
>> the other licensees that will inevitably integrate the same IP (which
>> isn't even specific to the AX45MP).
>> 
>> This IP also comes with all sort of added (mis-)features, which may or
>> may not be used in the future, and it would make sense to identify it
>> specifically.
>> 
> Agreed, I'll update it as above.

Please synchronise with Samuel to have a common series that fixes
both the Renesas and Thead platforms.

Thanks,

          M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
