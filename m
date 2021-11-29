Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CE6C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 12:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6FJb4mVXEFtSvZM6YdPYAaMdy4pgS7CRVRliUG2gIA=; b=X2tsztbFenuSLp
	a5stM5R6kiRzMaL42o6/5fK3ym71vcu0gTJGjnUtrLWHC2f580fkt3PNfFvqAqGe/jzhlF6as4X+G
	8pnpOnDQczZkbNzLAhSWmrUnSx/A2S4WKuYJFPTxtKed2Sp7s/KGpxLiFUXjSZm3Cfo7/ubFjbGak
	nc46CpZVpB43u3/BguY1LXhqpDFaV3lbcx+4vxHtzsIAY7brFxb1XYvaW7DX0UQ8tC0gYkqiBJb4S
	eSsizURm/axzAlPRwzPnwHaaf8IqcAgKD2ix20lRmS4KAu+Vbp73R+cogJ64sGmKGIiCp8Q12xhnv
	n0eaMQI+LSpMw19rUbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrfQe-000cgx-Nz; Mon, 29 Nov 2021 12:06:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrfQb-000cg1-AJ
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 12:06:39 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mrfQP-0006lK-70; Mon, 29 Nov 2021 13:06:25 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: wefu@redhat.com, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 gordan.markus@canonical.com, guoren@linux.alibaba.com, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, dlustig@nvidia.com, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, Anup Patel <anup@brainfault.org>,
 Rob Herring <robh+dt@kernel.org>, anup.patel@wdc.com, atishp04@gmail.com,
 palmer@dabbelt.com, guoren@kernel.org, christoph.muellner@vrull.eu,
 philipp.tomsich@vrull.eu, hch@lst.de, liush@allwinnertech.com,
 lazyparser@gmail.com, drew@beagleboard.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
Date: Mon, 29 Nov 2021 13:06:23 +0100
Message-ID: <9930802.MB9u6SvQ6m@diego>
In-Reply-To: <97431cab-d67d-4bc7-e181-d64534791f03@canonical.com>
References: <20211129014007.286478-1-wefu@redhat.com>
 <20211129014007.286478-2-wefu@redhat.com>
 <97431cab-d67d-4bc7-e181-d64534791f03@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_040637_394276_0C16E346 
X-CRM114-Status: GOOD (  22.17  )
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

Am Montag, 29. November 2021, 09:54:39 CET schrieb Heinrich Schuchardt:
> On 11/29/21 02:40, wefu@redhat.com wrote:
> > From: Wei Fu <wefu@redhat.com>
> > 
> > Previous patch has added svpbmt in arch/riscv and add "riscv,svpmbt"
> > in the DT mmu node. Update dt-bindings related property here.
> > 
> > Signed-off-by: Wei Fu <wefu@redhat.com>
> > Co-developed-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > ---
> >   Documentation/devicetree/bindings/riscv/cpus.yaml | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index aa5fb64d57eb..9ff9cbdd8a85 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -63,6 +63,16 @@ properties:
> >         - riscv,sv48
> >         - riscv,none
> >   
> > +  mmu:
> 
> Shouldn't we keep the items be in alphabetic order, i.e. mmu before 
> mmu-type?
> 
> > +    description:
> > +      Describes the CPU's MMU Standard Extensions support.
> > +      These values originate from the RISC-V Privileged
> > +      Specification document, available from
> > +      https://riscv.org/specifications/
> > +    $ref: '/schemas/types.yaml#/definitions/string'
> > +    enum:
> > +      - riscv,svpmbt
> 
> The privileged specification has multiple MMU related extensions: 
> Svnapot, Svpbmt, Svinval. Shall they all be modeled in this enum?

I remember in some earlier version some way back there was the
suggestion of using a sub-node instead and then adding boolean
properties for the supported extensions.

Aka something like
	mmu {
		riscv,svpbmt;	
	};

Which I guess would be a lot nicer. Also right now there is string-
comparison done on the code side, which would look way easier
when just looking for booleans in the dt instead.

Also isn't an enum a "one-of" selection, so wouldn't work directly
for multiple extensions?


Heiko


> 
> Best regards
> 
> Heinrich
> 
> > +
> >     riscv,isa:
> >       description:
> >         Identifies the specific RISC-V instruction set architecture
> > 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
