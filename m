Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3D3C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 00:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KV5Y00nNYCDrpvjjL5WMiJz3gSWs0WCq/y6sCpD0HI=; b=mCJF2m1d6a9wmr
	OUH64Rgua8sUN6nnU30CNZS9cFmYq+4bgS4YiMXR0XaoainZuW0BaZxqCkvqhCch9m54UNRxzRAPA
	0C0kJgFe9KIUfLINE7ouKVcnnJZizdbu4FkKjKdPz7cqY0v0SQEUVkh2bvz+WvE3UIea8cV6DoNvQ
	eBhFY9CmtmAGfZPQyecY3dzJztKOsZL5i4s2z1n5FZOJ68ePUUe9rHmcDEh+7wQSBg08nBfPh5CLX
	GbWay0P4aXl2Ln+RjaxHy+3P7ygbKHPZ0k/PDrZFQXKoojAuI121uhEKW0l+JF9QB4wnyLoTSsDq/
	cNZchEe+er4hv/Uc5yUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7n1Q-006Qqv-DM; Wed, 21 Dec 2022 00:31:48 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7n1N-006QoB-5l
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 00:31:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id a1so4896221edf.5
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 16:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCqofWIdcRE0wcGcSYV7leS63wz3iWTm3oh5pG3tFkc=;
        b=ErTUjWAMWzlIL8k4rTRrQFek0BdgPOCmhnjqDcWpWtonCq6c1XTEGzH6sp4pn0lUxz
         x3z+eUpewj90wgHmbPH3/EgJiZXLKuT8fltUObTY4ZeGXrqq/kCdICQ3ta3JYJ5w9lZv
         LbmSdH44cxFZgLnTjl96cxPJ2vsx1QSRRkayQwawxQXDXEI+Bk7ncl5SlvTv1ZzF7MkD
         hvQd2e+Lj3d/lA47bPPz0K0gUAmL5G6iHf5Qq/+uLYvDEb6vo03SWYNjyFgDVcwduge0
         8B6c3GDvoK23djOrnLLEw9yfz0K/4tqWn/jPN+MkpoN8+Z+X8eMPEn8KSYBwXhg2klHU
         K5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCqofWIdcRE0wcGcSYV7leS63wz3iWTm3oh5pG3tFkc=;
        b=DD+l83WJWfZSLtVujE+rqCLKnIRKcSIT5uBlA9xcu2EzAY4GWgLeMEr+Z4Y/qYD+6I
         mF325Ktb0Wy3bmldsyV4Li9YQbFNdUiV2QyLqe2WLIYWabTT5Yr2PlSczvIh2jNlOdeg
         /DC/g9Uocjxtk0Ec2jUOfOBrhmcz1JyqhYGPJaqV85m1442GVwQ7Ix3byAS8yMPNISSq
         w4z5neQm05CQRDeEEFmJCFUO5UlQ6CBdgb0jBkGGzhhl46zIcHWGh0RzG56NjRAZBDDv
         vnnfLvVojk4pJcj73dpgVHfzi8NVbcpmrVMP48EhPEmArCPDvDewkYfoye2m0zoxvQLE
         VO9w==
X-Gm-Message-State: ANoB5pk25APculkNAx0FkD1h+4xzQsEtvlAKAYwNMKI0XaZW4gQdvo4l
	s8gyqzE22XwKNYNE/ZGC/MyMucUAohuwslK5O+o=
X-Google-Smtp-Source: AA0mqf7Vj4LDQTGT2qms5U1xLKxeAG3aN068iuTz4pDqzDHwntSg3DsFDaeiJD2ru6wqI5VUjpTXdMYzkArTY5MWRxQ=
X-Received: by 2002:aa7:cc08:0:b0:461:8a43:e93 with SMTP id
 q8-20020aa7cc08000000b004618a430e93mr10657639edt.275.1671582702709; Tue, 20
 Dec 2022 16:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y54ycZdMLjU5QVn5@spud> <CA+V-a8sa1H=Hh2SzbKDWhiAO=C+Y2YN7sk9APBeqktBeHf49jA@mail.gmail.com>
 <Y6CPQWHrPLk1O6jB@spud>
In-Reply-To: <Y6CPQWHrPLk1O6jB@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 Dec 2022 00:31:16 +0000
Message-ID: <CA+V-a8sZeFgbUuuxHmXGEMKoayB02K22dZuw0TZHHv36UcdcVw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] riscv: errata: Add Andes alternative ports
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_163145_251535_72CF7722 
X-CRM114-Status: GOOD (  34.50  )
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

Hi Conor,

On Mon, Dec 19, 2022 at 4:20 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Dec 19, 2022 at 11:19:13AM +0000, Lad, Prabhakar wrote:
> > Hi Conor,
> >
> > Thank you for the review.
> >
> > On Sat, Dec 17, 2022 at 9:19 PM Conor Dooley <conor@kernel.org> wrote:
> > >
> > > On Mon, Dec 12, 2022 at 11:55:02AM +0000, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add required ports of the Alternative scheme for Andes CPU cores.
> > > >
> > > > I/O Coherence Port (IOCP) provides an AXI interface for connecting external
> > > > non-caching masters, such as DMA controllers. IOCP is a specification
> > > > option and is disabled on the Renesas RZ/Five SoC due to this reason cache
> > > > management needs a software workaround.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v4 -> v5
> > > > * Sorted the Kconfig/Makefile/Switch based on Core name
> > > > * Added a comments
> > > > * Introduced RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT ID to check if
> > > >   CMO needs to be applied. Is there a way we can access the DTB while patching
> > > >   as we can drop this SBI EXT ID and add a DT property instead for cmo?
> > > >
<snip>
> > > Seeing as you need a new version for some of the other bits, I think it
> > > would be good to add a minor comment here somewhere (be it here or the
> > > commit message) that links to the SBI specs for this.
> > > I think this looks pretty good though.
> > Sure I'll add a comment here.
> >
> > I was wondering if we can get rid of this vendor specific extension
> > here if we get access to the DT here (for example having a DT property
> > which would indicate if IOCP CMO should be applied or not). Do you
> > think that would be good approach?  ATM we dont have a pointer here
> > for FDT whie early patching.
>
> I dunno. I think it is fine to use the ECALL to be honest - I'd rather
> that than a property that someone may omit.
>
Ok, I was so I will stick with the current implementation.

> That said, for the cache management stuff we are gonna need for
> PolarFire SoC, we will need to have info from the DT AFAICT - marchid
> etc are all set to zero on our platform so cannot be used.
>
Aha so while patching you will need a pointer to FDT node.

> I was thinking about using the compatible instead, but...
> we've not tried to "forward"-port our stuff from 5.15 yet as we have
> not yet completed testing testing on our vendor tree (and need some PCI
> changes accepted upstream first anyway), as a result I have not looked
> into what's needed there for use with alternatives. We've been using a
> pre-alternatives version of that patchset from around the 5.15
> development point in time instead.
>
Good to know. Let me know if you plan to implement the patching
mechanism based on FDT soon. I can give it a test.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
