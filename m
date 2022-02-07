Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA908C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QD6PbEpDv2srrsMyGugeChHbCUzBlwPOSKjKZ6clZz8=; b=ZxmSKPthkod1ZI
	9gG+7/AJKuxKfB30Ii+bzvStxsFWiEz6EMFAH6wXlSztE0jXu0rjHVaD/75lhVaWKrvvcMPxyl5YX
	2IRbzdmTTEFB1fZ0gYFuBairyF6WBa3UhdBR6ImncyYwa2JlDvoEE+Kwxjlu5k2iZXrluc5tjptOj
	kJYPo6xdk9BAbcuDKOemT/WZw4vG9AzrEvdkU3Y1ymWwKrkutm5Ttbx4DafvEMwVK8UdHy3H72sqR
	RN90S6xs3o/J69K6bG/vrHWjmEj7uPjND2ykOIR/oKeNFtLNEK56BGDR/GaVd2f0TafZ84ExFhRjJ
	1AwXbY6k7w1ciG7mfQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH74A-00B9qI-7k; Mon, 07 Feb 2022 16:40:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH6tz-00B5id-Sm
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 16:30:09 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nH6tm-0004ET-2l; Mon, 07 Feb 2022 17:29:54 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wefu@redhat.com, liush@allwinnertech.com,
 guoren@kernel.org, atishp@atishpatra.org, anup@brainfault.org,
 drew@beagleboard.org, hch@lst.de, arnd@arndb.de, wens@csie.org,
 maxime@cerno.tech, dlustig@nvidia.com, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH v5 11/14] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
Date: Mon, 07 Feb 2022 14:39:31 +0100
Message-ID: <2446197.JSQJs4Nv0J@phil>
In-Reply-To: <Yf2pxvmG0t6eugOz@robh.at.kernel.org>
References: <20220121163618.351934-1-heiko@sntech.de>
 <20220121163618.351934-12-heiko@sntech.de>
 <Yf2pxvmG0t6eugOz@robh.at.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_083007_991298_A46236B3 
X-CRM114-Status: GOOD (  19.15  )
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

Am Freitag, 4. Februar 2022, 23:33:42 CET schrieb Rob Herring:
> On Fri, Jan 21, 2022 at 05:36:15PM +0100, Heiko Stuebner wrote:
> > From: Wei Fu <wefu@redhat.com>
> > 
> > Previous patch has added svpbmt in arch/riscv and add "riscv,svpmbt"
> > in the DT mmu node. Update dt-bindings related property here.
> > 
> > Signed-off-by: Wei Fu <wefu@redhat.com>
> > Co-developed-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index aa5fb64d57eb..3ad2593f1400 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -63,6 +63,16 @@ properties:
> >        - riscv,sv48
> >        - riscv,none
> >  
> > +  mmu:
> 
> riscv,mmu
> 
> > +    description:
> > +      Describes the CPU's MMU Standard Extensions support.
> > +      These values originate from the RISC-V Privileged
> > +      Specification document, available from
> > +      https://riscv.org/specifications/
> > +    $ref: '/schemas/types.yaml#/definitions/string'
> > +    enum:
> > +      - riscv,svpbmt
> 
> Are there per vendor MMU extensions? If not, drop the 'riscv,' part. 

Judging by the somewhat wild-west nature, I guess there might already
be non-riscv extensions existing somewhere, or at least the probability
is quite high that there will be in the future ;-)

> 
> > +
> >    riscv,isa:
> >      description:
> >        Identifies the specific RISC-V instruction set architecture
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
