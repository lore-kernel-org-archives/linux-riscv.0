Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B941C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 09:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqe7dAI26/hfmrTG2lOzlD8Xqu2F9WUDgqYacSEJndQ=; b=JNsAGXf2Go3a1l
	fBgE+ndzYKSbX95QHqPOfUUSZ5BGyKYkMPhpj3rEx/DRqBbH8ji2CXhNcA9nqeWHJ/WWqYsvbjmhJ
	xjLIPP+TybwRXT2PN9AMmS097PKVIr8WcLdwygiifo/NusPyLlnvaVemvMIY/JRyrGW+sHEACzbmt
	ajJtFJ/JW+ZK/3tVUjlEm708i6LK+CNdIQkduA0NlbwXFmbBRCMJIJwOX6wtZQbV8sLkL0VgcJ3ZF
	k2BjP9fCbOts5Q0ZpFx/21OH8M/wWfzLX2/ZUh1sgCG0oauoS2Whi3oeC0WHUxdIs66kK5ZWpZwFZ
	DPUYo3OW0YJ1I/pxoqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOa28-00000006Dev-2uy6;
	Tue, 02 Jul 2024 09:42:44 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOa26-00000006De0-0oHE
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 09:42:44 +0000
Date: Tue, 2 Jul 2024 09:42:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 03/10] dt-bindings: riscv: add SpacemiT K1 bindings
Message-ID: <20240702094235.GA2506224@ofsar>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-3-cc06c7555f07@gentoo.org>
 <20240701-undercook-flatterer-7f18f7420a6d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701-undercook-flatterer-7f18f7420a6d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_024242_281160_19B45C07 
X-CRM114-Status: GOOD (  19.10  )
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

Hi

On 13:24 Mon 01 Jul     , Conor Dooley wrote:
> On Thu, Jun 27, 2024 at 03:31:17PM +0000, Yixun Lan wrote:
> > From: Yangyu Chen <cyy@cyyself.name>
> > 
> > Add DT binding documentation for the SpacemiT K1 Soc[1] and the Banana
> > Pi BPi-F3 board[2] which used it.
> > 
> > [1] https://www.spacemit.com/en/spacemit-key-stone-2/
> > [2] https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3
> > 
> 
> Please make these link tags when you resend, like
> 
> Link: https://foo [1]
> 
> and don't leave blank lines between them and the signoff.
> 
sure, will fix in v3

> > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  .../devicetree/bindings/riscv/spacemit.yaml        | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > new file mode 100644
> > index 0000000000000..3b151fd02473e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > @@ -0,0 +1,24 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/spacemit.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT SoC-based boards
> > +
> > +description:
> > +  SpacemiT SoC-based boards
> 
> Please work out who is gonna maintain these SoCs and add that here to
> resolve the bot's report.
> 
sure, talked to Yangyu, will also add him as maintainer
this should fix bot's complaint..

btw, thanks for all your other comments in the whole thread, will fix them all
> Thanls,
> Conor.
> 
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - bananapi,bpi-f3
> > +          - const: spacemit,k1
> > +
> > +additionalProperties: true
> > +
> > +...
> > 
> > -- 
> > 2.45.2
> > 



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
