Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD601C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 23:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baD2nsN7x3NJcLVVQPHDlB3t7qes/WPQPoHFuNZTkO4=; b=OpzKuK36I+Y358
	OAOKp1l5jhJ+KhntficRBTr6YLPc8T2nUL3Nag5Uy6vf2rKQmnphj48/BFmOO5pEIoWCgtkci8g8l
	v2EdsDYQuvHKaVaoyLDL9K4KkMRhVfElTaNPP9LjYjfFm0DfA+Gfv3G0HdVXr1JXVfJ4FvWW71Gxr
	bTZa+Y0NXiyWtF8fR+AiEnKGnHYNDkssQHNQtpA1S9pj9zrefmxGEgBywU0Q3Jn7AieUmZFjlrGnI
	rhPc56+VOzaeS0PFv205YHfeCSEJ6rJ/BLUfKRkNIwew/lRJ6og7hqbVFolGn9pOZazSWHN/T1adn
	Ag9lccajwCFDKnlm2xgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8sPj-004NCs-0S; Tue, 05 Jul 2022 23:57:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8sPg-004NBE-0I
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 23:57:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F59A60DD9
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 23:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA961C341C8
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 23:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657065423;
	bh=2nvroOFqUI72BiyhYxzigV+e1n+0dHSA4SSKeZA4Ue4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uhP6hz2DX02FVZM3f7gAl+vSkcG8c8M3AeCVoM/k23KrVC4/xYv0ZTr5gVN8/T+It
	 GLmgfad33KDW1V/ljYrTPSDw368H7b1ty1gnNQoaEk6WS8E6xYwDFSAAMlEi9QvlQl
	 4xUQ6WywQn99YzKL0x94cQjTXXjuLf2oIbHRtsBW7PZL/UjKX/RCSJNuBlnh//amnQ
	 K9VZWoQ2JPLV7hz5RDrqqPaMSYH0F9vt3AyUfdQtYsiWAb2XeejQyFqLzcPubnAFTo
	 MluflRQbkmFLOEUgS5vcC31Ov6MWFQqojGYv8kDuvVM+ujLf+YtFjixdYdz38wSJWT
	 ylKGwgNOl2uXw==
Received: by mail-vs1-f46.google.com with SMTP id h7so13540098vsr.11
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 16:57:02 -0700 (PDT)
X-Gm-Message-State: AJIora89Nsg7KdZlua25QfWbhk+JQfTXtZJYMiuWn+923PR7Z/g6QBKb
	xI7bH9pcyFAOb0PsDECPpfAR75Whl1WmSSIDsNE=
X-Google-Smtp-Source: AGRyM1sgnQezK54Hl4ttPtngEG3sziMk9S3QLvNkuhuBCXTRmmT/LuQI/QIb6P7xsrpH3r4NvNK3Dw+Uv3O75LV+f48=
X-Received: by 2002:a05:6102:149c:b0:356:c65d:218c with SMTP id
 d28-20020a056102149c00b00356c65d218cmr6956876vsv.51.1657065421944; Tue, 05
 Jul 2022 16:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220705224703.1571895-1-heiko@sntech.de> <20220705224703.1571895-3-heiko@sntech.de>
In-Reply-To: <20220705224703.1571895-3-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Jul 2022 07:56:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSCpixjAqPROP-vUuTwaiacjPsSQxiiLPi4y=XhXqELxQ@mail.gmail.com>
Message-ID: <CAJF2gTSCpixjAqPROP-vUuTwaiacjPsSQxiiLPi4y=XhXqELxQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: riscv: document cbom-block-size
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Hellwig <hch@lst.de>, Samuel Holland <samuel@sholland.org>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>, 
	Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org, 
	devicetree <devicetree@vger.kernel.org>, Drew Fustini <drew@beagleboard.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_165704_160012_1BEE1EA4 
X-CRM114-Status: GOOD (  17.97  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Wed, Jul 6, 2022 at 6:47 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The Zicbom operates on a block-size defined for the cpu-core,
> which does not necessarily match other cache-sizes used.
>
> So add the necessary property for the system to know the core's
> block-size.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d632ac76532e..873dd12f6e89 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -63,6 +63,11 @@ properties:
>        - riscv,sv48
>        - riscv,none
>
> +  riscv,cbom-block-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The blocksize in bytes for the Zicbom cache operations.
> +
>    riscv,isa:
>      description:
>        Identifies the specific RISC-V instruction set architecture
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
