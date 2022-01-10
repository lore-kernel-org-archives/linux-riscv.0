Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BB2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOEQ67Ac0DGRqt8QOjphHuqycgDziG1WU4sqp5eC5hU=; b=QaxKIr49nyqAVK
	7E4lQ4mWoQ0mNcBmS863UwmrhAYixl5Q5KUDRX2hQxYAyG1OZb6HhKNnjCVDTrnccmIBJFhXJDOhm
	eU0+I6Mz4yzPBDGVts0RN7SXoSdGeNlAfTrMvRiRw19J4hgzlK50qHz/onRc+JSvAyB6WrQXhfxQl
	rYn0LDpctCGIHC/HAE7rpI4vbmyeQolM/vEBKGhvSoXB+U/A9veYVxhmuKSXewpZ3izVMWv9xt7jX
	N2BCB0aNn+QHnsx3YdjrhysZA2EoYhYfq8a4W/gxKEofsiXHknyLbOko8XKy+IJ6cE3ias8CLoAmM
	zyAK5enm5KeBi5QhvY5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6r0L-00AONm-LY; Mon, 10 Jan 2022 09:30:17 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qXV-00A7w4-Go
 for linux-riscv@lists.infradead.org; Mon, 10 Jan 2022 09:00:31 +0000
Received: by mail-ua1-f53.google.com with SMTP id x33so20789825uad.12
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jan 2022 01:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8NhtBWzQ5apsDhjpCyjxZEW0Il7Jt/CqRkEvPo1Xwf8=;
 b=a4PFZlqxGhfjkqOs/U455pORHwEUy6SxsYloezutPnVuIaaIsJqS06otLwT8dhCjXT
 7M1L2Hc1oaqrLU107zkgNvUdW0MfewcOGRHCd5s1tG6aPrOVVgB0R+K8+OHxxPE/k2Rq
 YIR0Ym6GYd3TctZCnw3fH5xvY9nqQPM80AGkAcjQPAQcVPQ9AlzTzmoksV66Ub5D/fYh
 MJAXOvfmAcXuvqMKQhhNyF6tq9UwUn6W8Tgh/9zuo9qA+Z1BJ3aoYBDhSDe//Jv4pWZO
 QHeWQmGwf6b+CXIWri90INpjoa8Z+qr0lnJg1y5Ar/dBuBbNti2oKR27i2bIKclJ2TAI
 sdeA==
X-Gm-Message-State: AOAM533vv406e3uVHZC4J8whwMPK/jCSEuCFob4MtXC1rNoQ8Ss50oCX
 +VkH4aQedUqCzOP5U2V+jMLjKJP3hru+Bw==
X-Google-Smtp-Source: ABdhPJykmZdPFIcDxO4A23MYR6XZ9VMCEX4Sb96vLSHGIl2/J/r/d17kM4ndgsrvWPKCyuJA1byNNw==
X-Received: by 2002:a67:d813:: with SMTP id e19mr25883622vsj.87.1641805227825; 
 Mon, 10 Jan 2022 01:00:27 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id t131sm1828285vkd.8.2022.01.10.01.00.26
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:00:27 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id x33so20789723uad.12
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jan 2022 01:00:26 -0800 (PST)
X-Received: by 2002:a67:e985:: with SMTP id b5mr1097590vso.77.1641805226820;
 Mon, 10 Jan 2022 01:00:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641289490.git.zong.li@sifive.com>
 <0419b2865c87f72adeb4edee9113a959e468b4a5.1641289490.git.zong.li@sifive.com>
In-Reply-To: <0419b2865c87f72adeb4edee9113a959e468b4a5.1641289490.git.zong.li@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jan 2022 10:00:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUyYVBXAeJ8XS9OsUePpFLgpCXYT5rH_bJCvCg3eaav_w@mail.gmail.com>
Message-ID: <CAMuHMdUyYVBXAeJ8XS9OsUePpFLgpCXYT5rH_bJCvCg3eaav_w@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: Add dma-channels for pdma device node
To: Zong Li <zong.li@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Bin Meng <bin.meng@windriver.com>, 
 green.wan@sifive.com, Vinod <vkoul@kernel.org>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_010029_630378_30E18338 
X-CRM114-Status: GOOD (  21.26  )
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

Hi Zong,

On Wed, Jan 5, 2022 at 6:44 AM Zong Li <zong.li@sifive.com> wrote:
> Add dma-channels property, then we can determine how many channels there
> by device tree, rather than statically defines it in PDMA driver
>
> Signed-off-by: Zong Li <zong.li@sifive.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -34,12 +34,17 @@ properties:
>      minItems: 1
>      maxItems: 8
>
> +  dma-channels:
> +    minimum: 1
> +    maximum: 4

As per my comment on [PATCH 3/3], perhaps you want to use a default
value of 4, and document that here, too?

> +
>    '#dma-cells':
>      const: 1
>
>  required:
>    - compatible
>    - reg
> +  - dma-channels
>    - interrupts
>    - '#dma-cells'
>


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
