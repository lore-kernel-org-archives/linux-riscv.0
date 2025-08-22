Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2753ACA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhE/cu2DE0Seg2Sx2pR21Q2RP7PwnJEBFaOu6mqu6UE=; b=geHA9FLT3KEmeV
	GMMqNaUPaju/7UZJi2A/KEIp4jfsGjaK8QCng8vWoWrjvk1+Wm4lB9KkuwrhOlHQXcqqkbgavAtc7
	BXQDcQaR79vaOpli8wyJpTW9Der7a5n7izZGLgponw9a3cJ/XZD1iUyugagbiAJe9yOA1ZuxG0aYh
	o1jT+LTbi16Xltbgno+k9As2v8MoXGpR3KogpMbyE8+RHMZJZ/2MfIzgDiVuF7wIF3NOkWWLoZDNF
	hGy1qYeQO+NuLdsV1WpClofaeY3MugRdXnZdvdjVySzifa6/0H3flopDeVZnlZciEfTr1cvaDDY7w
	oqMVJxZqFC83LUWNa9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmi-000000032Sy-0l7n;
	Fri, 22 Aug 2025 15:34:32 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upN8j-00000001wXk-02BW
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 08:28:51 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BDEB825D78;
	Fri, 22 Aug 2025 10:28:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meLimCg_NvAA; Fri, 22 Aug 2025 10:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755851325; bh=HtCqrpkvP1bYtOkdVWB6M9lAvEMzJbL55TwSdi6Ww+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JFVxF0Eb+86f11LQnDaqhXg40EgLPCop+LSrtry4aFC0MscuLU6mpErrPqlssRm+q
	 MiIRoC0R2U5ef2bI7pKDB6jnqPBGdnuO+xwBoLO4DmJS721+FdPlxKq0/AaUJ9spd+
	 bO2s76sWcVz3sf9EhQA+oYfFxM9+4RAlfn7GW5phLvE7+o1SVC1AbXp68wEanJczFa
	 FLvFMrkMZf/FQRREBKNYkTNXevPaZNV/KbbgGBfYC6XbCPcLbX0UOkjGEyQjpvKKhG
	 wWb3Nw7vnLCq6D6b0F3nacsFWLCdJF0jc4CHsTuvLARsU87RVLzbvxZ3JLSB+5n0vV
	 SWhuK0JvjakTQ==
Date: Fri, 22 Aug 2025 08:28:21 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: Scope the compatible to VO
 subsystem explicitly
Message-ID: <aKgqJWKOssEfgNRO@pie>
References: <20250820074245.16613-1-ziyao@disroot.org>
 <20250820074245.16613-2-ziyao@disroot.org>
 <20250821-bizarre-pigeon-of-unity-5a2d5d@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821-bizarre-pigeon-of-unity-5a2d5d@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_012849_608260_97C71AA1 
X-CRM114-Status: GOOD (  31.90  )
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 21, 2025 at 09:54:08AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 20, 2025 at 07:42:43AM +0000, Yao Zi wrote:
> > The reset controller driver for the TH1520 was using the generic
> > compatible string "thead,th1520-reset". However, the controller
> > described by this compatible only manages the resets for the Video
> > Output (VO) subsystem.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Thanks for your review, I appreciate it and will stick to
thead,th1520-reset for the VO reset controller.

But I'm not very clear about the subject prefix: I already have a
"dt-bindings: reset: " prefix, should I also make the subject more
precise, including the exact file changed when changing a binding file?

I've seen commits either with or without the precise name of the changed
binding in subjects. For example,

a341bcfbfa7 dt-bindings: reset: add compatible for bcm63xx ephy control

doesn't scope the prefix to brcm,bcm6345-reset.yaml, while

4e55fb7d60e1 dt-bindings: reset: atmel,at91sam9260-reset: add microchip,sama7d65-rstc

does.

Or do I miss other parts in the subject prefix? Thanks for your
explanation.

Best regards,
Yao Zi

> > 
> > Using a generic compatible is confusing as it implies control over all
> > reset units on the SoC. This could lead to conflicts if support for
> 
> No, it won't lead to conflicts. Stop making up reasons.
> 
> > other reset controllers on the TH1520 is added in the future like AP.
> > 
> > Let's introduce a new compatible string, "thead,th1520-reset-vo", to
> > explicitly scope the controller to VO-subsystem. The old one is marked
> > as deprecated.
> > 
> > Fixes: 30e7573babdc ("dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller")
> > Cc: stable@vger.kernel.org
> 
> Especially for backporting... Describe the actual bug being fixed here.
> 
> > Reported-by: Icenowy Zheng <uwu@icenowy.me>
> > Co-developed-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../bindings/reset/thead,th1520-reset.yaml      | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> > index f2e91d0add7a..3930475dcc04 100644
> > --- a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> > @@ -15,8 +15,11 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - thead,th1520-reset
> > +    oneOf:
> > +      - enum:
> > +          - thead,th1520-reset-vo
> > +      - const: thead,th1520-reset
> > +        deprecated: true
> 
> This you can do, but none of this is getting to backports and your DTS
> is a NAK. This basically means that this is kind of pointless.
> 
> Compatibles do not have particular meanings, so entire explanation that
> it implies something is not true. We have been here, this was discussed
> for other SoCs and you were told in v1 - don't do that.
> 
> You are stuck with the old compatible. Is here an issue to fix? No.
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
