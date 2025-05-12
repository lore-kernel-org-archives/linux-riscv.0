Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24119C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnPDq9dSIplUOPe4sm19mJhqTWHBob0p5uW/QAaDosI=; b=FaX9ukVpDGNmNe
	BWYheuADyFrINT+WgUMly9mbK7TJjpxlvAFhG4IvIJueFNCapxFm4BimkpJT/F9+gw/o8p4r/ZJZ8
	9bWu+BJNwlNbH2MJBBLeBTEv9xRGnVS2HCo6GJVJ6CUkPEcjjhKr+WMqQty5I3DY+SISW1eZU3Lul
	cdWxL/5FUyUf7MVJEr8hHWEoHXPb8eosTgdv+xrep73gIkvQ0PeaXiFw9MgkbaZUtzNZle4ALPb2p
	AzQI4SCFRUwzI5OoFCtRGbdPRjdefwU88nCgkHQB33QvWKu/fmIojkPh1Qmn/BRbyth/DcO7YjM1e
	ug0Sad6kmgiP1lZe8+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEP2p-00000008rhu-2LGL;
	Mon, 12 May 2025 09:01:55 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEP2m-00000008rgb-1zHL
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 09:01:53 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72b7a53ceb6so2587404a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 02:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747040511; x=1747645311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJ9B+L/0pxk/aAA36fM5U+1DbR7T5khcLMrOecJLuZE=;
        b=IrwW47GMncgrEv1mjVmYr/u1YUgKCtOdfwEwyz3Z4A4sp+96iA+hSJHnbPxhioICNU
         0MTq9QQcmO0xUPM1QIEgPk41HafOsU56YgR8MOSvBsnuyWKnUUCB1YP+pYTQOWBeK8TC
         BDiG95VDW0zV/GvVHsyVEaYGiB2rjd0HCRE5lXSpUmj2vGpeaRtsOczBrhXlxNvIJLYC
         tzA1hajr07xPkrBPJCuwxLiYy04eXODzX6pu51/hgLrrui2EKvK2UuvfpUYdXh1XZxzg
         1s570RvtbDfzTQ9TuEFnXpdxTdH4xEmjXEvozJ6IsTZnz+R/5ek/iernpiSePsbgrdTm
         YZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsQzwOodX24GqC3WDfCtYjpx0a5tI036Mj25J1npOLuABqi1ydpsImgdkGzYEWnuvjCoNozwWcXY677w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvvqh1ydd4kSD6fuHzwYyVtTfdHprkIUQ4t2SB2zCsy2Bb6yzL
	2DDLLvdyzeZSAIGz5TKvn+RGWEf2hvVOn80hd/kqF9PhgJgEg65qfMVQPpaL
X-Gm-Gg: ASbGncvAqum3p+BWrwHIAO3iCokwQW4x3avPg868aCOh/iIgG8WsNl062cxkVXHPuYp
	Cy4sTBFL5iqDKL2SpphSvp/7E/NV5f7lugGaZkgV38d36N0fJDOUOJYaNk38Pir2u7Vw9OYpr7w
	Q+rPjM8jGs7wYIIDERDm1LhHNmtNAU9HGYBFSmGQERhDKqtLFDUySBGJItRL3Pqhp1cjb8LMy9o
	2gOIc4r5D8iU6XRV/rV4zuq/wPU2xwePpf+B4J6Tf/v9/xQXLno598cB5tzGREbEDYBXbbf7Psy
	zm8dX1ocYrG36zbTBcXICphnpU4pgBeLfxAUgwpWeZsBARoLg8a1QyvOYKB0fgWZK7PXw9v8Cxf
	04s7NODeqy4Vd7g==
X-Google-Smtp-Source: AGHT+IFCRpwAhyA7Vqv4SQ0W15FoSowi8k1D9GKLdcpeN5FAunRoc6k4yTWMgYo2fMKzWFHKvlW1qQ==
X-Received: by 2002:a05:6830:280a:b0:72b:88b0:d8dc with SMTP id 46e09a7af769-73256d35ad1mr5677687a34.5.1747040510744;
        Mon, 12 May 2025 02:01:50 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732264b4a69sm1472391a34.24.2025.05.12.02.01.49
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 02:01:50 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-730580b0de8so3118037a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 02:01:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXu5JgqhrRrEGXRNREG6bWjsNK45AjErnGOiV5+Ut6Tk4WE23HhE7xXG8sWF8fGTonBBGu9S3smoQ/olA==@lists.infradead.org
X-Received: by 2002:a05:6122:4710:b0:52a:654e:bd98 with SMTP id
 71dfb90a1353d-52c43a928a5mr15501650e0c.0.1747040499288; Mon, 12 May 2025
 02:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-sapling-exhale-72815a023ac1@spud> <20250509-dwindle-remold-98b3d03d0631@spud>
In-Reply-To: <20250509-dwindle-remold-98b3d03d0631@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 11:01:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
X-Gm-Features: AX0GCFspRySgDb6ycd4xRu9GZUWvVUHvETzhZOkoOpahhaSVXdE-xy2cDcixKwI
Message-ID: <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_020152_510287_DFB7A303 
X-CRM114-Status: GOOD (  24.71  )
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

On Fri, 9 May 2025 at 17:39, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> When the binding was originally written, it was assumed that all
> ax45mp-caches had the same properties etc. This has turned out to be
> incorrect, as the QiLai SoC has a different number of cache-sets.
>
> Add a specific compatible for the RZ/Five for property enforcement and
> in case there turns out to be additional differences between these
> implementations of the cache controller.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> @@ -28,6 +28,7 @@ select:
>  properties:
>    compatible:
>      items:
> +      - const: renesas,r9a07g043f-cache

This name looks a bit too generic to me, as this is not a generic
cache on the R9A07G043F SoC, but specific to the CPU cores.

>        - const: andestech,ax45mp-cache
>        - const: cache
>
> @@ -70,7 +71,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>
>      cache-controller@13400000 {
> -        compatible = "andestech,ax45mp-cache", "cache";
> +        compatible = "renesas,r9a07g043f-cache", "andestech,ax45mp-cache", "cache";
>          reg = <0x13400000 0x100000>;
>          interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
>          cache-line-size = <64>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
