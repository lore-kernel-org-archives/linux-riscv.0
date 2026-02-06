Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B532DECD9BC
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 02:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ui2P1V0u/diZ2keg/AfPhWpNvcp04bHjKGfuUU1+Ufo=; b=YyQSq5NAV02w0f
	gMGpchgsUySgl0+2RR1n7thNv/ZFGa6E7QYK+9GbRUxl92Fj0LD4JktMsqOeHCi+0qRJOnwzMPwqQ
	nsqwNY8ScVd1m+wWj2ETH20510zlVyM/AwticnITtIjl5OJiJR4ptkXNDvrEfsxTJuQSDvLh9eHUm
	kAg/AJzr325ClQHbEYQ+2Q6qmM8vG0fDMLvR9jgziOz6ZfxVIgHHfEh/gamPY96yi8dKbDR4FFe31
	7GrkJ6vncjiSolePZC0Ii6Ff8gY3kdaisH3Fgcj9fGcOTkPab/12HtfOD/KBAvUlFKBEfGunZqjNE
	Kfj/qR44287TJti+Q3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voC1U-0000000Ami6-3sYl;
	Fri, 06 Feb 2026 02:56:44 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voC1L-0000000Amh9-2QYa
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 02:56:38 +0000
Received: from duge-virtual-machine (unknown [183.192.223.177])
	by APP-01 (Coremail) with SMTP id qwCowACHLmpTWIVpqMY9Bw--.33109S2;
	Fri, 06 Feb 2026 10:56:21 +0800 (CST)
Date: Fri, 6 Feb 2026 10:56:19 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH 1/3] dt-bindings: mmc: Add sdhci support for Canaan k230
Message-ID: <aYVYU5ZwK1pfhumY@duge-virtual-machine>
References: <20260204082908.27501-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260204082908.27501-2-jiayu.riscv@isrc.iscas.ac.cn>
 <20260204-imperfect-blitz-55fe5a85590f@spud>
 <aYRC/JVvyI6znWS6@duge-virtual-machine>
 <20260205-choice-require-1794796b10e5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205-choice-require-1794796b10e5@spud>
X-CM-TRANSID: qwCowACHLmpTWIVpqMY9Bw--.33109S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4kWFyfZw4UCF4DtryfCrg_yoW5KrWUpF
	ZxAF98KF1vgF1Yy34Fv3WkC3ZIyr4ktr1kXrn8try7XFsYgF13Kr47Kw1Y9r1xXF1xJr4a
	9ayjg343Gw1ayFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-Originating-IP: [183.192.223.177]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_185635_990676_F2B755F8 
X-CRM114-Status: GOOD (  33.42  )
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

On Thu, Feb 05, 2026 at 07:19:36PM +0000, Conor Dooley wrote:
> On Thu, Feb 05, 2026 at 03:13:00PM +0800, Jiayu Du wrote:
> > On Wed, Feb 04, 2026 at 06:10:25PM +0000, Conor Dooley wrote:
> > > On Wed, Feb 04, 2026 at 04:29:06PM +0800, Jiayu Du wrote:
> > > > The Canaan k230 uses the SDHCI from Synopsys. Add compatible strings
> > > > to the k230. The k230 has two controllers. MMC0 supports eMMC, while
> > > > MMC1 supports SDIO.
> > > > 
> > > > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > > > ---
> > > >  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 22 +++++++++++++++++++
> > > >  1 file changed, 22 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > > > index 7e7c55dc2440..cab33da3af7d 100644
> > > > --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > > > +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > > > @@ -23,6 +23,8 @@ properties:
> > > >            - const: sophgo,sg2044-dwcmshc
> > > >            - const: sophgo,sg2042-dwcmshc
> > > >        - enum:
> > > > +          - canaan,k230-emmc
> > > > +          - canaan,k230-sdio
> > > 
> > > I don't understand why there are two compatibles here, when the driver
> > > is able to handle them both identically, using the common properties for
> > > mmc controllers to differentiate. Is which is emmc and which sdio
> > > actually just determined by how the k230 boards use them?
> > > 
> > > Or, if there are pinout differences, would pinctrl allow each to be used
> > > for either?
> > 
> > Hi, Thanks for the review!
> > 
> > Actually, the two compatibles aren't just board choices. They come from
> > real SoC-level differences between the two MMC controllers.
> > 
> > From the K230 Hardware Guide [1]:
> > - MMC0 supports eMMC5.0 and SDIO3.0, usually for eMMC chips.
> > - MMC1 only does SDIO3.0 in 4/1-bit mode up to SDR104, and the manual
> >   clearly says it can't handle eMMC because of pin count and limits.
> > 
> > And the driver treats them a bit differently, such as whether there
> > is a phy and the initialization method. So I think keeping separate
> > compatibles makes sense to show these hardware differences clearly.
> 
> Ah, I didn't notice that there was some logic, I just checked the match
> data and I missed that. What you have is fine then I think.
> 
> > 
> > About pinctrl, MMC1 pins can mux to other things like GPIO, but MMC0
> > pins are fixed in hardware. In next version, I will add pinctrl node
> > for MMC1 in the board dts.
> > 
> > Link: https://github.com/kendryte/k230_docs/blob/main/en/00_hardware/K230_Hardware_Design_Guide.md#mmc-circuit [1]
> > > 
> > > >            - rockchip,rk3568-dwcmshc
> > > >            - rockchip,rk3588-dwcmshc
> > > >            - snps,dwcmshc-sdhci
> > > > @@ -87,6 +89,26 @@ required:
> > > >  allOf:
> > > >    - $ref: mmc-controller.yaml#
> > > >  
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - canaan,k230-emmc
> > > > +              - canaan,k230-sdio
> > > > +    then:
> > > > +      properties:
> > > > +        clocks:
> > > > +          minItems: 2
> > > > +          maxItems: 5
> 
> Additionally, why does this have a range? Why is it not minItems: 5?
> You've got only one instance per compatible, so the number of clocks for
> each compatible is not variable.

You're right. In the next version, I will change it to minItems: 5.
Thank you for your review!

Regards,
Jiayu Du

> > > > +        clock-names:
> > > > +          items:
> > > > +            - const: core
> > > > +            - const: bus
> > > > +            - const: axi
> > > > +            - const: block
> > > > +            - const: timer
> > > > +
> > > >    - if:
> > > >        properties:
> > > >          compatible:
> > > > -- 
> > > > 2.52.0
> > > > 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
