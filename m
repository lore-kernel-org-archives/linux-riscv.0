Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133DECD484E
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 22:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrwG8KFq2Lu1TlfPOySpwrEdCg/IxJQWLKMG1tZOrcs=; b=gkdFjLNYcHneu1
	rNOf/uXqB9zOeGlLH5i6MyevQzCwIi77nMaL0RolCnHfub9haH2U2T2jmjCY3UNvo1A2XKnX1xnQZ
	zRTXc39ur6NIr+ajw7l8TB61vWeTvVOm0yrH9wyeLtLUiCBtu5xtWfWWIbHX9MsiW+yxm5HiLHbiF
	lMLodEGmBboYGLgXFfNHAbtwYSbANid3j9xZ4JiVRDAkdP9ckrRVy6lwdkPehPfNTp4bQdmaPG290
	7e5n9YdbO1WU8UvtpLERBDFbAcSsyNu0wflXnguitGobZGebXUyTwxDxo0baUTZfAkCEj+YsFO9b+
	LRN2c3ynXoNogle1WRXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYkL-0000000ErvF-2jj7;
	Mon, 11 May 2026 22:05:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMYkI-0000000Erum-3D5J
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 22:05:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36523acb0c1so3379347a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778537102; x=1779141902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TwJIirVuKqVtnnrvOqanwGLH5bXkSp5/1F2o6q3Zsnw=;
        b=ZliJX/UEs/IjdoHGbqm2V00lluvj9kLT4b4KPKClRYJ+eqMuwT0yPUbyNbt68FGP6w
         oGftLPqTenDCP1KwHAiLrpPcfw3wMwxjIIy1iOQ3A+pKbOlRNYNXYpxWJgM4HXoelnh7
         7tR7yGG/Cbvt8fMjyO2A0dWSthTkOSTUz0CVbjsBuLsZFxUiTUowmNEfu4zuPh1OuCiu
         UQ2szsvm9bkJppCvZ7GXGhfmhJIYt/xtgX/1b1yK71EvfPniRIIFzwsTP4Dv5H0a8HEm
         WJhFSuwcMdi8odslmUCbV5X1KslpsCcRltpmQcxuvr/GM4+jStI+6iE775MDItqXMpXl
         CCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778537102; x=1779141902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwJIirVuKqVtnnrvOqanwGLH5bXkSp5/1F2o6q3Zsnw=;
        b=czpsvwVdQMzytm3UhES8lAHdN2xpcE7LlDIxV/KaaWvtRlCL8nOAY3GhK5JtBhmLTO
         Sbjj6CRXmX1YxXshl1sMjYq8PRh3cAD5ZJLpB/BARsN1SeFT70m7v+solJtSp/k44lae
         dU32EKVtqcmw175pn3yplAaq8qbPY2QNYqG9DjNA03xXYvMTUKY0RVG4QnBVkfjoUEK0
         5UY0K0prbvM3dPVv3Crv0jRAVJvt9Bb1EOxW0zO/EDSVLYO6wrMEI1QYJodxU7i7c1jI
         AkQXcSP4hZ+ELQehrTvJrwRu5bOcDCV6koC0wmkKZ2Svec6tNNRc0/j+ITcBjwtwVOCf
         OBQA==
X-Forwarded-Encrypted: i=1; AFNElJ9MfwndHKauJofWJYr3Doan/cRspDTK28GOKw2j+H177orvLMyelwT2GT0T64JC0/xQSCegT+xtyGjmtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+L3vL2LUtd35DMO9K0WOBp3w9KPwLX+SP6/mY51LXWoUs36lu
	Zy6394V7nWA9JC9EAt5AIYkBK8tWfButnP3Radk1VUAFrZrO1qbOmjCr
X-Gm-Gg: Acq92OGsIDUDABMFN892l7LOM/pWlSIgNaweUuW7sjY2nQzSBzYWEYOJnY8FfXJO1eF
	dvOg49Cw19tMs6RJQW3PJYud0albjAVFszDBkyv4KBRGA27VcrrSryqyLRNRZjGGQs91Q80N2Fc
	D76EtRfCf5a83t1IOlHa690KlHQs5TtWcfHmDD2hz/SYa2Z7gCn9foli1AIM9UzrhrSwmQ7Regg
	Me5EepgBsgcJlRLp5WkLYpcoZOA2DO3Q11W5wnPaLOYVgekUfeszb2zJ0ZuJCV0wEOGTHP3+Lee
	fuq1TVspHxuGu/KIB0qYv5SjF6I48wPqH5LrHnvFJVycVaUNlVvDqQwdC0ZZQOgIFcGoMDzYZpX
	Mi3rB17MzbXotQTlLMTiK+D5SlLlZGbeB+PCb2g8j4bicTdT7T3DFvvWhEm7YN4PQLvGtp1OE35
	XZ5wplK/GLf4oAru6d+PtnhZ4=
X-Received: by 2002:a17:90b:3d8a:b0:364:a173:2d61 with SMTP id 98e67ed59e1d1-368b2511be6mr449645a91.11.1778537101695;
        Mon, 11 May 2026 15:05:01 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771c6ddsm9907259a12.23.2026.05.11.15.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:05:01 -0700 (PDT)
Date: Tue, 12 May 2026 06:04:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@kernel.org>, 
	"Anton D. Stavinskii" <stavinsky@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback
 compatible for CV1800B
Message-ID: <agJSPkA88GcTYS86@inochi.infowork>
References: <20260511063818.463877-1-inochiama@gmail.com>
 <20260511063818.463877-2-inochiama@gmail.com>
 <20260511-crave-sworn-3b43371ce11a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-crave-sworn-3b43371ce11a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_150502_842833_A599DB40 
X-CRM114-Status: GOOD (  20.23  )
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

On Mon, May 11, 2026 at 05:01:01PM +0100, Conor Dooley wrote:
> On Mon, May 11, 2026 at 02:38:16PM +0800, Inochi Amaoto wrote:
> > The previous version of the binding change only add compatible
> > string without adding the fallback compatible, this breaks
> > backward compatibility. Add the needed fallback compatible to
> > fix this.
> 
> I don't understand how adding a specific comaptible affected backwards
> compatibility. Did the dts originally use the snps compatible before the
> device specific one was added?
> 

Yes, the device is already in DTS, and since I find an quirk for
it. A new compatible with fallback is necessary.

Regards,
Inochi

> > 
> > Fixes: be3e2a0419c6 ("dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > index 804514732dbe..0a30a455b0ee 100644
> > --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > @@ -21,11 +21,12 @@ properties:
> >        - enum:
> >            - snps,axi-dma-1.01a
> >            - intel,kmb-axi-dma
> > -          - sophgo,cv1800b-axi-dma
> >            - starfive,jh7110-axi-dma
> >            - starfive,jh8100-axi-dma
> >        - items:
> > -          - const: altr,agilex5-axi-dma
> > +          - enum:
> > +              - altr,agilex5-axi-dma
> > +              - sophgo,cv1800b-axi-dma
> >            - const: snps,axi-dma-1.01a
> >  
> >    reg:
> > -- 
> > 2.54.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
