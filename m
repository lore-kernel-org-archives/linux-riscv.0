Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B15C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 07:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F8E46054F
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 07:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F8E46054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HlNmGWgUNltAHkF0YVonG4ko7oceA674UEA14G6HnE=; b=bULh154wq3nqoO
	tlTmwdgIEHE5X00hU8t6uRa9iiJzl+HMSPfHuWsloLtlTDaZNzJYfba8kEZvcahwo+NvuqWght6DH
	25Dylgv+EfEQpWE6HO1TGp7ar9PRi4tptnkPo/PhMmEQjQeBPHAYqEa+2t3xrb1V3wAFlrmMqGlV8
	gpdGiaUUb8ZBiYBfDSn8qmbCnfrxq+OKrun6et5GpO9lUxgebZdRUEgOeZ6vkWVpBz3x62YdQvWNU
	HvCwI9aWbAb+bd3VN73vmjFiOFiyaB7sXP25ToAiZ+8xyYBWyRu3kq1hbQUNeyuhcPQLRqmcBvnXz
	9ezb9deGfL4OUYHeAlyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meY2P-00DlZk-Ak; Sun, 24 Oct 2021 07:35:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meY2M-00DlZO-EI
 for linux-riscv@lists.infradead.org; Sun, 24 Oct 2021 07:35:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 71-20020a1c014a000000b0032cafd23b1dso2138851wmb.4
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 00:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qRIE383vJ698wFSfRg03sNhcy6U9VEEBxhS9bVA3ruI=;
 b=2wdtSeVNGcC/Sq/OZxMtMFcS0g8vqaownUF5dmjDU3fCv7l1R2zIR2362HFm2QvGqL
 veYW9G1TlYOd538YOmhuUIzCxh8seWgHzRZmnYwPjUeuufYIxI33lKpEOdmrC1oiw69M
 37d0Ih2mXnpXphTbjZa9yQpIfPUvddXJRJyQ93RiJnglDrxtbAowydCdDWs7zHcJmb4Q
 rXCPEoCXVKZc8bNOdzEJjYErDpIJuznrXaBOZIEn6+NNU7ddMsg5/4AupIPv4KMgMgwQ
 i3x8I7x5SHYiB/pGTj+D9jN6a/BJGy/k2udCTEYJhXuKNMNcE2FbQvvvuJdVqVNIdBgb
 FLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qRIE383vJ698wFSfRg03sNhcy6U9VEEBxhS9bVA3ruI=;
 b=IuXdKRyKwddQOVZ5qDbVTgKRrIkV1eXbM9BSy5Kx8uTl8X4mc5yboLdY9MOhmLndQi
 lOCauzUhIEKIfaNwGq90L955ii63WV66rNO3syJWZwUjqcMm435WOSAJjK84+SF04JSX
 fx9JJeA/5CAkJx4izortou64STyrhsS03HUFUpqqm+hURCzzObkxdmBp9lKVQh/FiDog
 ZiMmKNKrO4eS6YfjDhCL3D8U3slzK2iJ+lj6AnGXXiAQ63szDl4QNVGKfu/Jo4xAT6wr
 P1l1RsogQpciw9iZfM6ZOJulCm3n7z9Vw9abGwcnSw0LKSun+ux7kra7RdreNY0otscy
 Hh0w==
X-Gm-Message-State: AOAM532n0Juhbzwe/Rn0e2klLM8zUrk6OF+KA4czKdGSE+5CwGunVAYh
 w+Vc/jktZAcYhAi0iwxEcHfln3mGn0UB4qOXv4I3MA==
X-Google-Smtp-Source: ABdhPJzoIR/OM0dQJ3Lg7NvMpsZq65ugnqjiaD36e/5z4YMD47mYsLKL+ZwN2SOfBg5479U8bWBd1r1MuQK+SRFUKbI=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr40201749wmc.176.1635060920075; 
 Sun, 24 Oct 2021 00:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-3-guoren@kernel.org>
In-Reply-To: <20211024013303.3499461-3-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 Oct 2021 13:05:08 +0530
Message-ID: <CAAhSdy2a2XgjOpezoq=SvX2XTcAWhceKF9X9v3z7xyO9Z4DMPQ@mail.gmail.com>
Subject: Re: [PATCH V5 2/3] dt-bindings: update riscv plic compatible string
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_003522_576383_307442EB 
X-CRM114-Status: GOOD (  19.40  )
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

On Sun, Oct 24, 2021 at 7:03 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Add the compatible string "thead,c900-plic" to the riscv plic
> bindings to support allwinner d1 SOC which contains c906 core.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
>
> ---
>
> Changes since V5:
>  - Add DT list
>  - Fixup compatible string
>  - Remove allwinner-d1 compatible
>  - make dt_binding_check
>
> Changes since V4:
>  - Update description in errata style
>  - Update enum suggested by Anup, Heiko, Samuel
>
> Changes since V3:
>  - Rename "c9xx" to "c900"
>  - Add thead,c900-plic in the description section
> ---
>  .../interrupt-controller/sifive,plic-1.0.0.yaml   | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 08d5a57ce00f..18b97bfd7954 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -35,6 +35,10 @@ description:
>    contains a specific memory layout, which is documented in chapter 8 of the
>    SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
>
> +  The thead,c900-plic couldn't complete masked irq source which has been disabled in
> +  enable register. Add thead_plic_chip which fix up c906-plic irq source completion
> +  problem by unmask/mask wrapper.
> +

This is an incomplete description about how T-HEAD PLIC is different from
RISC-V PLIC.

I would suggest the following:

The T-HEAD C9xx SoC implements a modified/custom T-HEAD PLIC specification
which will mask current IRQ upon read to CLAIM register and will unmask the IRQ
upon write to CLAIM register. The thead,c900-plic compatible string
represents the
custom T-HEAD PLIC specification.

Regards,
Anup

>  maintainers:
>    - Sagar Kadam <sagar.kadam@sifive.com>
>    - Paul Walmsley  <paul.walmsley@sifive.com>
> @@ -42,11 +46,16 @@ maintainers:
>
>  properties:
>    compatible:
> -    items:
> +   oneOf:
> +    - items:
>        - enum:
> -          - sifive,fu540-c000-plic
> -          - canaan,k210-plic
> +        - sifive,fu540-c000-plic
> +        - canaan,k210-plic
>        - const: sifive,plic-1.0.0
> +    - items:
> +      - enum:
> +        - allwinner,sun20i-d1-plic
> +      - const: thead,c900-plic
>
>    reg:
>      maxItems: 1
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
