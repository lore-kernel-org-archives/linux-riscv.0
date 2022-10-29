Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7F8C38A02
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 04:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpCVyofvJcvFddO6Sg5yhkmvhSh+c0k+89e1dL5NWvc=; b=jyxQOH4g30gaxa
	CGon6Y22FJm8UeW7m1LQqz2p/aSb7p75QBKPdCr/EJvhAI9tJy3N3EU6h19iJYybE+j+QMtghxWkp
	d9/whlTJCr9XELTMWiRyYa6zMPkLF/o+5gdexWKj0LNyHWUoRw3S7ZJ4mPXpeyFzFCMVO0U2jxfVE
	5LsvaGF7U2gbepHEsdU6MlWNPPC747iOr4vpkror70Z1XXlIqkTFuhU9liAS4OMwttHrhsuXw2eHd
	mMdzNK2PYu7SJkhV3wtCNpp3Ba+yug5ny95AXz6wOGy+YFJx2ei4vZJKGvL+EKQsnsmB1Q2ETrFiG
	9qdkfA+6J+ft7G7OhiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodLR-004bh4-Qy; Sat, 29 Oct 2022 04:21:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodLO-004bfq-NQ
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 04:21:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 66C54B82AA2
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79134C43145
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667017270;
	bh=DAQCxbXwMfg1p4G23fMdN/nNri7kMOq1RxK2JbdA5iw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lAA8fUmpWpwGK7nAiRCN7c8bxUf7G4fwR2nsld0ekFqYZbosaGz9g5YfoXcoHGHRr
	 OWjtN83FaI0nFw/8R9A4h3cK4RXpFYc8cLp2lHupVpjUaU6CbjHm8NZlmig8AZ1riM
	 dgYHChefDc4EPHt2aQ/IXM4jjjsPkbnKPimWRRnORu4V/9rSgrbWH78JpycB8wODfa
	 nCcg912jYtrOEOhNUmnhJlP2xpUTuOC9a5sQGguXZ6rY7C1Rk3LCPhDhXr33Y8vtD5
	 5BGlIGs07bGcn/8+IcpcARE9WYrao2tAQZHKCxoVHLTk/yDVTX7lNaPTwxS65slsvP
	 T9/O8FWG+5NNQ==
Received: by mail-oi1-f177.google.com with SMTP id r76so1610357oie.13
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 21:21:10 -0700 (PDT)
X-Gm-Message-State: ACrzQf3YNCAnrRjnJCRI017xjex5/OCILjHV0U0Cg0OUN4WpA/sM85LK
	5vBMVHlU8AKw3KmtK+5Ejf78eFosLb4e9iAS2vg=
X-Google-Smtp-Source: AMsMyM6FOABjTLDcw3RrE443Uzjnikyq9yGGZy+gLlTL3TwV3Lam38lhpojPimnyjLnasX0VFaVeg3G05mq2c7E4sPc=
X-Received: by 2002:a05:6808:f0e:b0:359:b055:32ea with SMTP id
 m14-20020a0568080f0e00b00359b05532eamr9041256oiw.112.1667017269693; Fri, 28
 Oct 2022 21:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221028165921.94487-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221028165921.94487-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 29 Oct 2022 12:20:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSaEi=Hjy+57bxNFSKBj4-_ayeh+=9qtX9HXsK3pw3LUw@mail.gmail.com>
Message-ID: <CAJF2gTSaEi=Hjy+57bxNFSKBj4-_ayeh+=9qtX9HXsK3pw3LUw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: riscv: Add Andes AX45MP core to the list
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
X-CRM114-CacheID: sfid-20221028_212115_061369_F72808AF 
X-CRM114-Status: GOOD (  18.46  )
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
> The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> Single) from Andes. In preparation to add support for RZ/Five SoC add
> the Andes AX45MP core to the list.
>
> More details about Andes AX45MP core can be found here:
> [0] http://www.andestech.com/en/products-solutions/andescore-processors/riscv-ax45mp/
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v4 -> v5
> * Included RB tag from Conor
>
> v3 -> v4
> * No change
>
> v2 -> v3
> * Included RB tag from Geert
>
> v1 -> v2
> * Included ack from Krzysztof
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index ae7963e99225..2bf91829c8de 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -28,6 +28,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - andestech,ax45mp
Reviewed-by: Guo Ren <guoren@kernel.org>

>                - canaan,k210
>                - sifive,bullet0
>                - sifive,e5
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
