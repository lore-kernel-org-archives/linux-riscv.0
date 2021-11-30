Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D6DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9emMB1dIamMqsikX03iKmioFtdkZEGHWyF1boDSBR38=; b=xCE0YrIgZWLtVO
	zDzcp4ySs4yWY5BCHIibK9tjpvElyCcU9paAEQnQcXNh1eg7XgCxmU/ARxS0a3A8x+pInwcM2boBB
	cj90MefGxkxX9W5u64apCwVWAj3voqITbkTAOYRQ58sNWs4DLQhkDfHHkgzVGVjts4j3+srZ3egi0
	Bk4jpLEapsjHoGiiB35QS3d3rIXGfoi+/lcjEFmnk/pD+CidIXBMbvcQwpFxwELJv+XY93XXi2RBv
	U+TIyPveU+WrpXyISwO2FCQdjDGao2VK4NhczxGj1O+HnNsMKbfySPWUjKv20axLagyh4QhLlQf8u
	xC/R+SyaEpCSZZP8ADWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms1vN-0051Ci-3X; Tue, 30 Nov 2021 12:07:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms1vJ-0051B0-Mz
 for linux-riscv@lists.infradead.org; Tue, 30 Nov 2021 12:07:51 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1ms1v9-0004iV-CX; Tue, 30 Nov 2021 13:07:39 +0100
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
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
Date: Tue, 30 Nov 2021 13:07:37 +0100
Message-ID: <1909580.k68io2XIxi@diego>
In-Reply-To: <9930802.MB9u6SvQ6m@diego>
References: <20211129014007.286478-1-wefu@redhat.com>
 <97431cab-d67d-4bc7-e181-d64534791f03@canonical.com>
 <9930802.MB9u6SvQ6m@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_040749_786763_DCA08CAC 
X-CRM114-Status: GOOD (  26.95  )
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

Am Montag, 29. November 2021, 13:06:23 CET schrieb Heiko St=FCbner:
> Am Montag, 29. November 2021, 09:54:39 CET schrieb Heinrich Schuchardt:
> > On 11/29/21 02:40, wefu@redhat.com wrote:
> > > From: Wei Fu <wefu@redhat.com>
> > > =

> > > Previous patch has added svpbmt in arch/riscv and add "riscv,svpmbt"
> > > in the DT mmu node. Update dt-bindings related property here.
> > > =

> > > Signed-off-by: Wei Fu <wefu@redhat.com>
> > > Co-developed-by: Guo Ren <guoren@kernel.org>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > Cc: Anup Patel <anup@brainfault.org>
> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > ---
> > >   Documentation/devicetree/bindings/riscv/cpus.yaml | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > =

> > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Docu=
mentation/devicetree/bindings/riscv/cpus.yaml
> > > index aa5fb64d57eb..9ff9cbdd8a85 100644
> > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > @@ -63,6 +63,16 @@ properties:
> > >         - riscv,sv48
> > >         - riscv,none
> > >   =

> > > +  mmu:
> > =

> > Shouldn't we keep the items be in alphabetic order, i.e. mmu before =

> > mmu-type?
> > =

> > > +    description:
> > > +      Describes the CPU's MMU Standard Extensions support.
> > > +      These values originate from the RISC-V Privileged
> > > +      Specification document, available from
> > > +      https://riscv.org/specifications/
> > > +    $ref: '/schemas/types.yaml#/definitions/string'
> > > +    enum:
> > > +      - riscv,svpmbt
> > =

> > The privileged specification has multiple MMU related extensions: =

> > Svnapot, Svpbmt, Svinval. Shall they all be modeled in this enum?
> =

> I remember in some earlier version some way back there was the
> suggestion of using a sub-node instead and then adding boolean
> properties for the supported extensions.
> =

> Aka something like
> 	mmu {
> 		riscv,svpbmt;	=

> 	};

For the record, I'm talking about the mail from september
https://lore.kernel.org/linux-riscv/CAAeLtUChjjzG+P8yg45GLZMJy5UR2K5RRBoLFV=
ZhtOaZ5pPtEA@mail.gmail.com/

So having a sub-node would make adding future extensions
way nicer.

> =

> Which I guess would be a lot nicer. Also right now there is string-
> comparison done on the code side, which would look way easier
> when just looking for booleans in the dt instead.
> =

> Also isn't an enum a "one-of" selection, so wouldn't work directly
> for multiple extensions?
> =

> =

> Heiko
> =

> =

> > =

> > Best regards
> > =

> > Heinrich
> > =

> > > +
> > >     riscv,isa:
> > >       description:
> > >         Identifies the specific RISC-V instruction set architecture
> > > =

> > =

> > =

> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > =

> =

> =

> =

> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
