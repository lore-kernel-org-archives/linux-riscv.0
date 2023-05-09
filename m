Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6F8C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGEtVT4j5FdURy+h/UexaSdvOzt4f2EMyCgqgST2Leo=; b=hmtJfq0Spuf4BW
	rYLmSiXfyy4qDSuO/DUtYZtAUcsFZpPCjidJl7Rg8wa/O2QBRM43/MDIFTG7ngHX0NOb8KB5OsNUG
	Oa9O6l7vTq8m55hrauSdpElnQCzO2xHLG1i/ydLpe+3OICQcQnZDeadHm5cSYYXCl87Ns1acYyBQj
	1Gfql1UcfDMIFUJDFO9AbN0X25HoUVP44uHjs8tQKh/mRw5+jtEKg0Cc7CiKtS05iFL96UjFM9VDB
	O4eY2KlAjWtIOdY1Xx7TnLYWsQbCY6IyEFHceUU6AxMouGk0Q3uGs0G9vYsQHxophmYtsY+Qv+mwj
	zaxD6oe4NBzdfks+100Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwGx1-002PtM-30;
	Tue, 09 May 2023 06:35:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwGwy-002Psg-29
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 06:35:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8AB0062C1E;
	Tue,  9 May 2023 06:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7EDC433D2;
	Tue,  9 May 2023 06:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683614151;
	bh=zpOHSdqVCQBn2YAqILJfgbw4dfnb2g8xfAWRoqWAjbE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=JT/X4jPsrFCl2gJQ7d8jDxK0p5UfTg/oyy1MHnUzjjAgEVn9WHYrBBIntVUVkH8Wu
	 59H2HnO1TDxDNSiAmlaL99d/yrr2tAhm8w3QIVUMHSPxsPuLYyiM9UFx/A0djr2FLc
	 jOKADTqF05GzBoJ/XBhO1hWCzhcT2K2+jgRpucDp56FCv/tyLCoq2NDqDxq3MBLKUb
	 WviSYUPRcfq/DRFas9g//bfcOkCSlUZqye0mkzbXkVO0omebzPToapGKZqw8DRNT6t
	 ganRqlzDoi0SzRy5s7iMeEjMlRSY5j6rv8p8sIqyDDH1wwyHDJgxdrVeR+YWiOMpKn
	 wQtUctAEqNQGQ==
Date: Tue, 09 May 2023 07:35:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
CC: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_5/7=5D_dt-bindings=3A_soc=3A?= =?US-ASCII?Q?_starfive=3A_Add_StarFive_syscon_module?=
User-Agent: K-9 Mail for Android
In-Reply-To: <014dd7b2-9623-805c-97a6-5b3c5f120b79@starfivetech.com>
References: <20230414024157.53203-1-xingyu.wu@starfivetech.com> <20230414024157.53203-6-xingyu.wu@starfivetech.com> <20230424-footsie-compost-d6624c8ef4e8@spud> <20230508-margarita-fondling-c9b970ad73a9@spud> <014dd7b2-9623-805c-97a6-5b3c5f120b79@starfivetech.com>
Message-ID: <7527C059-95A2-49EA-AFE0-B089D3651A6B@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_233552_811521_A51C067F 
X-CRM114-Status: GOOD (  23.17  )
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



On 9 May 2023 07:23:18 IST, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>On 2023/5/9 3:24, Conor Dooley wrote:
>> On Mon, Apr 24, 2023 at 06:15:47PM +0100, Conor Dooley wrote:
>>> On Fri, Apr 14, 2023 at 10:41:55AM +0800, Xingyu Wu wrote:
>>> > From: William Qiu <william.qiu@starfivetech.com>
>>> > 
>>> > Add documentation to describe StarFive System Controller Registers.
>>> > 
>>> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>> > ---
>>> >  .../soc/starfive/starfive,jh7110-syscon.yaml  | 58 +++++++++++++++++++
>>> >  MAINTAINERS                                   |  6 ++
>>> >  2 files changed, 64 insertions(+)
>>> >  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>> > 
>>> > diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>> > new file mode 100644
>>> > index 000000000000..de086e74a229
>>> > --- /dev/null
>>> > +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>> > @@ -0,0 +1,58 @@
>>> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> > +%YAML 1.2
>>> > +---
>>> > +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
>>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> > +
>>> > +title: StarFive JH7110 SoC system controller
>>> > +
>>> > +maintainers:
>>> > +  - William Qiu <william.qiu@starfivetech.com>
>>> > +
>>> > +description: |
>>> > +  The StarFive JH7110 SoC system controller provides register information such
>>> > +  as offset, mask and shift to configure related modules such as MMC and PCIe.
>>> > +
>>> > +properties:
>>> > +  compatible:
>>> > +    oneOf:
>>> > +      - items:
>>> > +          - enum:
>>> > +              - starfive,jh7110-aon-syscon
>>> > +              - starfive,jh7110-sys-syscon
>>> > +          - const: syscon
>>> > +          - const: simple-mfd
>>> > +      - items:
>>> > +          - const: starfive,jh7110-stg-syscon
>>> > +          - const: syscon
>>> > +
>>> > +  reg:
>>> > +    maxItems: 1
>>> > +
>>> > +  clock-controller:
>>> > +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
>>> > +    type: object
>>> > +
>>> > +  power-controller:
>>> > +    $ref: /schemas/power/starfive,jh7110-pmu.yaml#
>>> > +    type: object
>>> 
>>> My plan was to grab this patch after the merge window, but there's been
>>> some back and forth [1] about what exactly should be a power-controller
>>> here. Given the merge window is open & I know Emil wants to look at the
>>> various clock bits for the JH7110, I don't think there's a pressing need
>>> for you to do anything here, but figured I'd at least mention how things
>>> are going on this thread too.
>> 
>> To follow up on this, it transpired in that thread that this node, not a
>> child node, should be the power controller.
>> 
>> Up to you StarFive folk how you wish to resend, but I am fine with it
>> being in this series, I shall just not pick up the soc driver patches
>> until the resent binding is applied by Stephen.
>> 
>
>Thanks. I had discussed with changhuang.liang about this. And I will drop
>the 'starfive,jh7110-aon-syscon' and 'power-controller' in next patchset.
>Changhuang will take these in his patchset.

Won't that result in broken bindings, since there's a ref to the pll binding?
Keeping it in the same series (i.e. this one) makes
the most sense to me.

Cheers,
Conor.

>
>Best regards,
>Xingyu Wu
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
