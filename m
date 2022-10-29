Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650F4C38A02
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 04:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEu1cI/30FscbzlBlf+/Jd/XAPM8ykG4LSv4AOu9R9I=; b=gq7LRTLxNRyzG+
	NdEKfw/qxQgYzPBXtaViVCXCZOj0gNYb10VQkuZDRSi2NceHwaY8CcyJ8nlNUKe3IJcCcRGrfNCev
	LyHB0/VNsqREHt/bj93VPmhhzDFFICwmjxqbuBJTdD9rVejXiXjmCr/jWyDF9SH7hB1Y32pH5DiV2
	BLPWD4WVPEj9AHl112gRIuy4EsDJKySkFaTmxYYy4N5wiWmI7UtOMkHlMGaDmM6s+0z8QLQrCUE6N
	zZxdWglB41iSfeS3ig61QTW5tMQxMMJ69W0ovOsrqdYuLXBUQyLKLL9K5EoWA2+YJHplgsn4c6bh9
	BtjhrXqCe3wCzTST9gOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodKx-004bbE-7F; Sat, 29 Oct 2022 04:20:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodKu-004baA-PM
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 04:20:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5B654CE0932
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7B5C43144
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667017237;
	bh=U1L2nG/BurOlnYwrzwbS8Rl/892HKSG0C1mj+wpdIpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MkJbyj7GXqH6kBYgZSWN8rLnNX9ZHeCEF5QaLqWj1z47hc2EkDo4IQLzow7RIF8v5
	 Yrmsc98T1Jzb0u/pfcM0IR5AFGTyciGI3LSYAh3INWa4ui2CtuzHvHG9Oxw7hAibiA
	 iliJa1qpgmWgR1F7dC4qgaF50MG1wauMK4rLISja+5EzQFwKQq+mYM2muyNwJ8cvE4
	 DULGxy3QAa3/x8cOIKJy7l8d1RQS2eLGN7O+y1ieqklIB/nftA5Jsa6oTWqtHQAG1x
	 9+B4XlqsnngmNAvGLP0BsI8mThceYS8Zo2wUFTM+eAS2aMNV2e4wOfIMyqlIkXhPLi
	 lQOEWAEvU09WQ==
Received: by mail-oi1-f179.google.com with SMTP id n83so8112355oif.11
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 21:20:36 -0700 (PDT)
X-Gm-Message-State: ACrzQf023Jz8t5vZjFbExmPr0WeJODisyhJIEPZ+8xMewhJ0MMkKeGA/
	LsxeW9U1VoWnqJtV/BcCTO8+qi2sbUdZJo36Zjs=
X-Google-Smtp-Source: AMsMyM4a5nUdYCi1/1Tu0LtcsNnTV/tRNEApjoCgKc97PZVomGEhOVoiQ9nNukXf8dxzjzo1Rj1GnEImpNTu908x64w=
X-Received: by 2002:a05:6808:2222:b0:354:9c65:79ed with SMTP id
 bd34-20020a056808222200b003549c6579edmr9039277oib.19.1667017236125; Fri, 28
 Oct 2022 21:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221028165921.94487-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221028165921.94487-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 29 Oct 2022 12:20:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRDTXN9ad4ZRq8qhxNCrMRcKhb5EaPRgzFshAFdyh09Lw@mail.gmail.com>
Message-ID: <CAJF2gTRDTXN9ad4ZRq8qhxNCrMRcKhb5EaPRgzFshAFdyh09Lw@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: riscv: Sort the CPU core list alphabetically
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_212045_183354_12AD1FBF 
X-CRM114-Status: GOOD (  16.65  )
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

On Sat, Oct 29, 2022 at 12:59 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Sort the CPU cores list alphabetically for maintenance.
Reviewed-by: Guo Ren <guoren@kernel.org>

>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v4 -> v5
> * Included RB tag from Conor
>
> v3 -> v4
> * Included RB tag from Heiko
>
> v2 -> v3
> * Included RB tag from Geert
>
> v1 -> v2
> * Included RB tag from Krzysztof
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 90a7cabf58fe..ae7963e99225 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -28,17 +28,17 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> -              - sifive,rocket0
> +              - canaan,k210
>                - sifive,bullet0
>                - sifive,e5
>                - sifive,e7
>                - sifive,e71
> -              - sifive,u74-mc
> -              - sifive,u54
> -              - sifive,u74
> +              - sifive,rocket0
>                - sifive,u5
> +              - sifive,u54
>                - sifive,u7
> -              - canaan,k210
> +              - sifive,u74
> +              - sifive,u74-mc
>            - const: riscv
>        - items:
>            - enum:
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
