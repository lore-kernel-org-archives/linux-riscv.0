Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651AEC5AE49
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sk7pEXf7bH2zvYRVJjVdNWwjELTtP5f376+9vnmuDwc=; b=QHejBxmMsyKc8t
	LisMWsiVsUw4VKI1Q9mrAjfVZggT+AMRNIQXtmyQF/6jrh9gMLcWv4rJxROfd9vD4NhdCjA2Q9KDG
	3IWs1ON/J7Xsd7PYA2jaMM1ehKv/Alqnkx2sld3be4Ni66v0URAZc1XF1iu+hAXRnBqYW7jUI45M+
	myiUmbjyGXuJrIUD6ket+JECMslCZbdWaEdKQSAltqtNmrjFQS5l3gbTttYwXZCr9gccim46l0C/J
	mx+0+QDEWiW593KkofoSCKfi9SxQvQVlp8Mar2V3NwbjfYyfLdCf3Ex2N2LIp4NAmvX3xfeZHZt6N
	KzM1SuB9kgKcN7UxMuew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRAk-0000000C2aL-49kA;
	Mon, 10 Aug 2026 14:40:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRAj-0000000C2Zn-2NRc
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 14:40:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C75243D5E;
	Mon, 10 Aug 2026 14:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1571F00A3A;
	Mon, 10 Aug 2026 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786372812;
	bh=8feQUfAa8YgzcjKaeXHGn9dNOOz7m+wLPxIS5k4j/MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ieceNF4mq+jG+Dn9poFV2sy4oGAKPx+7xU5KtivSxNxEmRn1XyfdINcSY4N6yMzzA
	 EFhnOsszlCm2mN8SbX+9LWyQu/gBZzJ57kceLRojqU3dsSSG5mqjwHzJ6ttxB7YEDp
	 ZSC/V70qwoSxt6wjfPZ4P11zyFosdSFhHUtU+A5SqCs3peLgKTkrloJmWINeNRiCTE
	 Xa2JoSEgM1Yy4qC6AA9MTEzafBq7WId9xtEHWW0qUlvwSGF+C2YGEcpNplVdtf15+r
	 GimqrKhAF4LFM5O4KazMYbr5Gake3e9yYsqNrZ59FGQYGvsfn5POi4mdxbpmqB97zE
	 uVrll3d5171bg==
Date: Mon, 10 Aug 2026 09:40:12 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260810144012.GA1574021-robh@kernel.org>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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

On Mon, Aug 10, 2026 at 09:51:07AM +0000, Changhuang Liang wrote:
> Hi, Rob
> 
> > On Sun, 09 Aug 2026 23:36:32 -0700, Changhuang Liang wrote:
> > > Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> > > controller.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
> > >  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
> > >  2 files changed, 181 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl
> > > .yaml  create mode 100644
> > > include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > >
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.exa
> > mple.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl): gpio-ranges:1: [4]
> > is too short
> > 	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See
> > https://patchwork.kernel.org/project/devicetree/patch/20260810063650.23
> > 9303-4-changhuang.liang@starfivetech.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above error(s),
> > then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your
> > schema.
> 
> Hi Rob,
> 
> Regarding this link: https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/gpio/gpio.yaml#L71
> 
> It seems that the configuration to support #gpio-cells = <3>; has not been added here yet, is that correct?

Shrug. Based on the description, gpio-ranges doesn't depend the # of 
cells.

Why do you need 3 cells? You haven't described the cell content.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
