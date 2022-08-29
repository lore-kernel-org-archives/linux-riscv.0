Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727E9ECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS66lZMJJ/wr/wbPM6j5f+u8AT2CaOgAy5uNx8I4Zv0=; b=UcEdZcxOBRd1aL
	o818tAZbkkUtI7uSEZtW7GXfoAHwxYQcBvpo5VwYYyNFKjTyQqI2ds6ZYDiZRTmAON7b0umnd1gEe
	v6mNAcPoshvZvyOPBaVVousHnkHPdyO60teM/Jb0xP1Z0I7DAy8guLfkDgJJzQjHr34LK0jqUS7sj
	i20umtB7+LkRwsa0ySZoBk/7QiEfA4v8RVLTuIKgK+3c6c1egwLp7/7BpcFUqalrlwwLe9DbVXBUt
	TeOhgCoeW4CzkDHAiBu1ajo0QYRGQIA4uyadoVAREKjNdWlr7c36ungdAtKXogdpEpHGuQCeFGXZ6
	TxxC/+COPiH32DNacHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZMM-005ijL-Cv; Mon, 29 Aug 2022 07:39:02 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZMF-005icr-1a
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 07:38:58 +0000
Received: by mail-lf1-x12a.google.com with SMTP id m7so1051374lfq.8
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SLnfZ0YtBrAFrby7u2BSMdjwnYBP5EXUc9M7gwySMFc=;
        b=WkuVDoMnPSkj0vEifVC2w2xi1AX9POY3FSxOvaHXLrMCOqmrmhY5AfP0PutPjHEiCu
         a3iQ1fcGwkgc8DqpmTrkUTY0uZgwrtfZwwpxMdnA/ZgDQbe87IF6qWT5tchG9pX4HL7V
         0yfmupIxlEACVzNTL7TyrLR4EavjsVUkupzOcXTRTBKe1eLU9sLAxgPqLjR2OIySU68D
         +jySDLepM+8q4BMNwYn/iYUMKiU5UDBG3GiAPIQQJ3ZjVmxFj6L29awQOJVX3ttZjujo
         9miOIrak/NXwL1uUxotOxJ2cfOZaQTaC6FMLjCrNBCBd0fBrQGqGm6pGr9B1xlRJDNyf
         ECEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SLnfZ0YtBrAFrby7u2BSMdjwnYBP5EXUc9M7gwySMFc=;
        b=DHxT7vLwYqJXmHIjt1qgbW+h5BNg27ZV3tE0X0P41TzkqclRAhpUWV9dh/pH9+gN6w
         sFx5wy9jZcHqQo10T/1rqa8dP9nYhpmTcuQN3FM84HMamwkMXhp/qgLMmuUbeOR7Ttx3
         XZHs0H/Sg30V0x42Y1rLvwT9g2MyzXybMNu3vqnYCGGCi/wUECTW/mWfAlvQDp47bjDt
         EO3WU6RBVS/WJ6B77Rov00UZrR4A9kLf5m7qV4xMNj1KGaKRYKZDKJzEi0oBi/58iL+V
         RWEhv0T3kXPkW5TcKqcEhhxhkNKEIXVe5k797bITH0WtWC0ESdnFzhEWq5/brdnMajG3
         5tnQ==
X-Gm-Message-State: ACgBeo016EjFcv+QBZoNDkHkWhmQf6ZqdDzU+hL0fsgb9amLqnDjeY1f
	TN/91vza+HFQYiOJ1MynYRbC96OJpEi4fHRkVtdPABVeG3nbiQ==
X-Google-Smtp-Source: AA6agR7Z/64kezARSma8q5qNz73IG4E3JSPDN4bXIxxADcRxsY9NxznD3iA75wQjgm9ZxrfLxirk+9UL16NI7RCfhgE=
X-Received: by 2002:a05:6512:3b28:b0:494:6b56:ae0a with SMTP id
 f40-20020a0565123b2800b004946b56ae0amr1267119lfv.498.1661758731260; Mon, 29
 Aug 2022 00:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220829062202.3287-1-zong.li@sifive.com> <20220829062202.3287-2-zong.li@sifive.com>
 <d009d829-54d5-7b96-cfbb-3f75515a29fe@microchip.com>
In-Reply-To: <d009d829-54d5-7b96-cfbb-3f75515a29fe@microchip.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 29 Aug 2022 15:38:38 +0800
Message-ID: <CANXhq0qECPDehan6U4-R166EkZww5VMFntDToOkYjsOiELPi9A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: sifive-ccache: rename SiFive L2 cache to
 composible cache
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Greentime Hu <greentime.hu@sifive.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_003855_728054_C29ECC09 
X-CRM114-Status: GOOD (  26.32  )
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

On Mon, Aug 29, 2022 at 2:45 PM <Conor.Dooley@microchip.com> wrote:
>
> Hey Zong,
> Couple quick comments for you:
>
> On 29/08/2022 07:22, Zong Li wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Since composible cache may be L3 cache if private L2 cache exists, it
>
> s/composible/composable
>
> > should use its original name composible cache to prevent confusion.
>
> s/composible/composable
>

I will fix it in each patch.

> >
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >   .../riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml}      | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >   rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml} (92%)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
> > similarity index 92%
> > rename from Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > rename to Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
> > index 69cdab18d629..1a64a5384e36 100644
> > --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
>
> Binding filenames are supposed to match the first compatible. Since
> it was not named that way in the first place, I suppose naming after
> the generic compatible makes the most sense. The correct filename
> would then be "sifive,ccache0.yaml"
>

Thanks for pointing this out. Let me change the filename.

> > @@ -12,8 +12,8 @@ maintainers:
> >     - Paul Walmsley  <paul.walmsley@sifive.com>
> >
> >   description:
> > -  The SiFive Level 2 Cache Controller is used to provide access to fast copies
> > -  of memory for masters in a Core Complex. The Level 2 Cache Controller also
> > +  The SiFive Composable Cache Controller is used to provide access to fast copies
> > +  of memory for masters in a Core Complex. The Composable Cache Controller also
> >     acts as directory-based coherency manager.
> >     All the properties in ePAPR/DeviceTree specification applies for this platform.
> >
> > @@ -27,6 +27,7 @@ select:
> >           enum:
> >             - sifive,fu540-c000-ccache
> >             - sifive,fu740-c000-ccache
> > +          - sifive,ccache0
>
> Despite what the commit message says, this is more than a rename.
> Thanks,
> Conor.
>
> >
> >     required:
> >       - compatible
> > @@ -37,6 +38,7 @@ properties:
> >         - enum:
> >             - sifive,fu540-c000-ccache
> >             - sifive,fu740-c000-ccache
> > +          - sifive,ccache0
> >         - const: cache
> >
> >     cache-block-size:
> > --
> > 2.17.1
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
