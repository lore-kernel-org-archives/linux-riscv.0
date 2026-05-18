Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639CECD4F3D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 03:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdzHkLDTRXXoBL5E1sQH1/gt2W6i9EutOM1XlXJCq7Q=; b=fIhC7/LYTtn5Bt
	SWps1Du9BCpzPZXZk4KZSUS6BFcHrujbebnmNbLRBIu9+8OskgAVLokeXyy8JuAzgsTTITHu/hOiG
	gVPP+UoJb+BFxBpCVZVynS6GZxEYni1nYTAGflBDYpgPCSV045FAHZdeWe/pZSvT7FeDoHL3/hjcI
	iKmcuLAr7/TurFh0PayHpZ1iQlMgzdQomvAhh+7mg/k80lAXUzelnRVUzG6f2Of5YKX873L2m3rS1
	nPHAy32LRyiYCAP9WHzO4IEWO+jejS7ygoFMylsntLWxi/l6totQajrwEcJFFYBwzDJBC4gf/dEBv
	sJ6TDifOapewsCVj8ctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoKB-0000000E0yZ-1Fnz;
	Mon, 18 May 2026 03:07:23 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoK6-0000000E0wy-1k0p
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 03:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=XJKd3+IiOKB10QoMgGQXKpCTm/heRFRR4
	1Tj2dK9CTI=; b=cKxFTmbZIVOMI5YiR3XYzSgIoSFAeXhjsUMYC+0MnpoKekS4a
	zuICeD/5YuWkITQAlg+2zv8OEP9xPCdn/IOubBnQwqzpXQNUak0P/82JIbjqqSI9
	SF8VRx/mJV71ArzPOTeOlz4nu/3Y4wYRboB4VscCQeSkIIkIymvdI75ZPs=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUJ7ggpq97MEAA--.6085S2;
	Mon, 18 May 2026 11:07:39 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add UltraRISC DP1000 bindings
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260515-cyclic-frequency-50d690821af1@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-3-bf559589ea8a@ultrarisc.com>
 <20260515-cyclic-frequency-50d690821af1@wendy>
Date: Mon, 18 May 2026 11:06:58 +0800
Message-Id: <177907361849.2045074.12347174714063726227.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779073618; l=2538;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=opbHcjGJhGN0V2AsfKdod5Ei6jme1uyutNohcVTuoK8=;
 b=ZwWPpWn2mi3LpKg0v1Bzfdt07pmYtp4BrxR/JtKv7lBsuzhxrfCg+njdaEqN60m/eSVi2fEC6
 f7NZxRIHuwFCQgMIGjSWK9Sh6x2Y9bh2B6BKMJDoDGj/MTuL1rmBY+m
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwA3cUJ7ggpq97MEAA--.6085S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1xWr45ury3ZF17Gr1rZwb_yoW8KF43pa
	18GFn5AFyxJr13Can3t3W3A3Z5Xr48uFW5trsF934jyas8WFyjqrZ7K345u3WkAr4UGF42
	yF17uw1akw40vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWoFRsMACwAWsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_200719_186376_F7092815 
X-CRM114-Status: GOOD (  19.45  )
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

On 2026-05-15 11:08 +0100, Conor Dooley wrote:
> On Fri, May 15, 2026 at 09:17:59AM +0800, Jia Wang wrote:
> > Add DT binding documentation for the UltraRISC DP1000 SoC.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  .../devicetree/bindings/riscv/ultrarisc.yaml       | 27 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  6 +++++
> >  2 files changed, 33 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/ultrarisc.yaml b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> > new file mode 100644
> > index 000000000000..d4421c2ef945
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> > @@ -0,0 +1,27 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/ultrarisc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: UltraRISC SoC-based boards
> > +
> > +maintainers:
> > +  - Jia Wang <wangjia@ultrarisc.com>
> > +
> > +description:
> > +  UltraRISC DP1000 SoC-based boards
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - rongda,m0
> > +              - milkv,titan
> > +          - const: ultrarisc,dp1000
> > +
> > +additionalProperties: true
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b2040011a386..5bf971ff48b2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23082,6 +23082,12 @@ F:	include/dt-bindings/power/thead,th1520-power.h
> >  F:	include/dt-bindings/reset/thead,th1520-reset.h
> >  F:	include/linux/firmware/thead/thead,th1520-aon.h
> >  
> > +RISC-V ULTRARISC SoC SUPPORT
> > +M:	Jia Wang <wangjia@ultrarisc.com>
> > +L:	linux-riscv@lists.infradead.org
> > +S:	Maintained
> 
> You work for ultrasoc, probably this should be "Supported".
>

Will change S: to Supported in v2. Thanks.
 
> > +F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> 
> There's no git tree here where patches for the platform will be applied
> before sending them on to the SoC maintainers. Are you expecting me to
> apply patches for this platform?
> 

Will add a T: entry in v2. Thanks for pointing this out.

> > +
> >  RNBD BLOCK DRIVERS
> >  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> >  M:	Jack Wang <jinpu.wang@ionos.com>
> > 
> > -- 
> > 2.34.1
> > 

Best Regards,
Jia Wang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
