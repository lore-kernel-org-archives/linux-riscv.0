Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C83C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 01:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6jICLsgAgvjzDvJEeDXENlS17O5nhrakUowmtIjWuI=; b=SOgGz/grfwTI93
	Az33YGnFk6BlzFOOkuQ38Stq0St5PHx+il8zf5Aq7I4MV55lxIMCdwdQuw4GrJF1eN/ZsYAcXIXLp
	IHDSBBa5jWr2ZRbCbbcLvZIs4NrjXwPlyqOVkf5DuipinsBmaR2Fg33nUzS0Sg7Ai89TSlspux6y7
	ruf3VCpykdOlFUnUqZivQsSEauXdAxuJAZDCslbNAtZ+g+ce755pcQTEWquOPKULxQiAAvT5DM9GP
	ZteqDcs7PCQFx6ZoVtgx81xz40tmD/joLpApsffeNj/q2vHxfzaZHcuk3EGhzR8LJlRmqs/AbrEDe
	evsOIGHCSKckirx7YVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAjBs-00DaFX-IF; Fri, 21 Jan 2022 01:58:12 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAjBp-00DaE8-9u
 for linux-riscv@lists.infradead.org; Fri, 21 Jan 2022 01:58:10 +0000
Received: by mail-lf1-x136.google.com with SMTP id h26so13796941lfv.11
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 17:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6UldeKnr9PGsHDm84/QvQaIofT9QuBopddvadaSRieY=;
 b=SJG97pub7A4eya4kCKHOmmqrelrMniQ/VP8wnpQf7tPxCcgyptuQO+LEhUDNd5ccRJ
 Vw4hs5mU3pQBXq5kLDfsV7lUA0n2XRt67LaihqJy19vYW0NXn3pd9u6F6Td+FFo3MoVp
 tpF9t43jtpsS0yoXIpDM9HODwYAs6YC8JEOATJyeJT6D6jYmUu96AjGlix7AGfnY6d1K
 k2wFRbCjLRIwhfNbjD2TBCvdDdFWqGyeFJMtYET7KwpI7zVCTwojm2VxKTinw/jRtYht
 PAVqpmMTtVk+8BDmbdX5y7NXjMSLIaC4tDQMTDPewWqF7yVTF9QtIjRnZMp4ZITiJbHy
 UzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6UldeKnr9PGsHDm84/QvQaIofT9QuBopddvadaSRieY=;
 b=RmtGmqT1K+Mb9OtUqFqov9UieGLAl7u8uKhfmnRrEhbJNEGXuSDPtQiJn3lZua/lGD
 aH17podU9H3FbYcGJUOba+gQMSpqKHrkjLAtD8XS7gEXzV93owJG8IDppWUEiGu7mSEi
 bQjfkWqg5nnLGtyPIwqPER2NwP9qQtc7OywlAI3hSNqdZyAOHXj714mGainweT50G1zz
 2zbCaaKOKeyYWemZnLTTGjzX1WW7uolk7fjT2JDxGAHdDTtPPy1RF7AfPu/D/RdyPmub
 Kj7291x4deckK4XBNPNpiKm+6MU3hkhp/4AoL8LVs9QHkE2f/7RY0jAs1Xdf+nvCUGgh
 MnMw==
X-Gm-Message-State: AOAM531tD0eht5o01VFm9Ahjao73fncyX5ByqG6wNe42rfStDumUNUIP
 OUeHeeuWHSvIGqRdmRZTpQLtOtzXSGwqopHs5PH2yQ==
X-Google-Smtp-Source: ABdhPJxSDXdkiBVnafLq8QOd3wg3RcHUJ9cAed5T94EdWRYG+0qGg5gqguJOGXbjy+s9xjqMZmi40VDbu7CUgLuii/Y=
X-Received: by 2002:a2e:a90c:: with SMTP id j12mr1559970ljq.71.1642730286659; 
 Thu, 20 Jan 2022 17:58:06 -0800 (PST)
MIME-Version: 1.0
References: <5db314b798cd9cfcb5cb61bc56515220b7d50315.1642383007.git.zong.li@sifive.com>
 <mhng-e5e649a2-96bf-4244-a29a-a75c913111a2@palmer-ri-x1c9>
In-Reply-To: <mhng-e5e649a2-96bf-4244-a29a-a75c913111a2@palmer-ri-x1c9>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 21 Jan 2022 09:57:55 +0800
Message-ID: <CANXhq0o_d58cx7L_cUQMUYALwBbY7DKm3agT9+LM8Lt8KYaMnQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: Add dma-channels for pdma device node
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>,
 Vinod <vkoul@kernel.org>, dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_175809_371945_645E2A53 
X-CRM114-Status: GOOD (  22.26  )
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

On Fri, Jan 21, 2022 at 2:51 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 16 Jan 2022 17:35:27 PST (-0800), zong.li@sifive.com wrote:
> > Add dma-channels property, then we can determine how many channels there
> > by device tree, rather than statically defines it in PDMA driver
>
> Maybe "statically defining it" is better here?
>

Thanks for the correction, I would modify it in the next version.

> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml    | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > index d32a71b975fe..3dbb8caefc17 100644
> > --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> > @@ -34,6 +34,12 @@ properties:
> >      minItems: 1
> >      maxItems: 8
> >
> > +  dma-channels:
> > +    description: For backwards-compatible, the default value is 4
>
> Maybe "backwards-compatibility" is better here?

Thanks, let me change it in the next version together.

>
> > +    minimum: 1
> > +    maximum: 4
> > +    default: 4
> > +
> >    '#dma-cells':
> >      const: 1
> >
> > @@ -50,6 +56,7 @@ examples:
> >      dma@3000000 {
> >        compatible = "sifive,fu540-c000-pdma";
>
> IMO we should have a "sifive,pdma-1.0.0" (or whatever the versioning
> scheme ended up being) here, in addition to the SOC-specific DT entry.
> It's kind of odd to start extending the SOC-specific DT entry, as the
> whole idea there is to let us have an out in case we find future
> compatibility issues.

yes, I notice that we usually have a entry with the version in other
device nodes, such as "sifive,xxx0", I guess we should have a
"sifive,pdma0" there, thanks for your advice, let me add it and use it
in match table of pdma driver in the next version.

>
> >        reg = <0x3000000 0x8000>;
> > +      dma-channels = <4>;
> >        interrupts = <23 24 25 26 27 28 29 30>;
> >        #dma-cells = <1>;
> >      };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
