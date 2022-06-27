Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E40C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 06:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wV3mtoCMsGR/tRufehjZ8ttumX3lXswUym3Cunnb2Vo=; b=feZmJtyoII17ig
	kfkV4I1tRq/G8d1UJNM1rDcUZshEm4nN07Ns4jRCNwQV7gc8RJw0ytrT+cUmpZDrLnTqGC8aohHxS
	YRWv7ZRFAe4HBG7ZYjn6ncGzQw9YSLoR6E1/E+qqwkjXprOKfynmgN6JPqI/oi+OG6rZXsmuD2e9u
	8P8qhFuCSIq9KKVnDhcaViEhVpKopUgf55Lg1z3sXJrnDmugKAmW0rf4/jvRmdHPqj0c+xDf3yX10
	YteXwAR/StM8qLeUqAcYBrJHLJR2yBIP7F04MqhzOv3LOzwB5VOt8Ri9Rq4qz+3Ogipr6k+P0V1aD
	JpRRmrszuNc/4YkUdBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5icb-00GDVD-RM; Mon, 27 Jun 2022 06:53:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ia4-00GCFn-7f
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 06:50:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B644612F0
	for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 06:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C6FC341D3
	for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 06:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656312641;
	bh=kD7SZF1jNAVPc0INxaOHFTvsDEVbYxB3CbbfNIpTB1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BWRvRLt/oqeA2/Hmle5OVB6hEoiC86UQg676mPsNHKWzzof6dtBDZ0wk6/pFfHycH
	 m41UbhTCR8N8VMDQCRFHrtds/D1a0KtPApRKpJOVB00hfAbuyhYpMmKuCZI8cWi/9p
	 z0jJmIZ6CJF8XhVqSV+rv2kyzQUUh3I7AxBzgMEsSwlT06PdgD/AUtdeAmLu6s6FNE
	 YUUCpO/+M8U3se+4QjdTes5aZSkvcgvdfmTVJuY90L01DeSz6aRQ3TrlDPh64GyO08
	 DmkUCiSMCkJW0n+5r4gtnltfcVknBOGjheNWw+Dh3gblXROBSf+Gj1VB2ljGbdxgbJ
	 FlFWe8yMTzCoQ==
Received: by mail-vs1-f53.google.com with SMTP id j1so8033529vsj.12
        for <linux-riscv@lists.infradead.org>; Sun, 26 Jun 2022 23:50:41 -0700 (PDT)
X-Gm-Message-State: AJIora/j9IgJmt1dd02boFJ+os6sxyAwIrTiDgXgnStfxZhJezLcnNqJ
	0JCHXt8TF1nsLFBPwNkLvLFjR8Ql5mlZ3kaLSDU=
X-Google-Smtp-Source: AGRyM1sMPTXuLWt0JOCsNU6oMtoWPerFopULnWcC0H4jByn+qpMAeG/bE/AP0NKukPYSLKCka+W+5Qa2MkXg1Lte8Jk=
X-Received: by 2002:a05:6102:366f:b0:356:352f:9de2 with SMTP id
 bg15-20020a056102366f00b00356352f9de2mr2292856vsb.2.1656312640226; Sun, 26
 Jun 2022 23:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220627051257.38543-1-samuel@sholland.org> <20220627051257.38543-3-samuel@sholland.org>
In-Reply-To: <20220627051257.38543-3-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 27 Jun 2022 14:50:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTjcP44+HHsNz8RHHEA_XqL2OjKqVHNK-e3sakFP2oW6w@mail.gmail.com>
Message-ID: <CAJF2gTTjcP44+HHsNz8RHHEA_XqL2OjKqVHNK-e3sakFP2oW6w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] irqchip/sifive-plic: Name the chip more generically
To: Samuel Holland <samuel@sholland.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Marc Zyngier <maz@kernel.org>, 
	Sagar Kadam <sagar.kadam@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_235044_438448_EA8B3E25 
X-CRM114-Status: GOOD (  24.21  )
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

On Mon, Jun 27, 2022 at 1:13 PM Samuel Holland <samuel@sholland.org> wrote:
>
> The interface for SiFive's PLIC was adopted and clarified by RISC-V as
> the standard PLIC interface. Now that several PLIC implementations by
> different vendors share this same interface, it is somewhat misleading
> to report "SiFive PLIC" to userspace, when no SiFive hardware may be
> present. This is especially the case when some implementations are
> subtly incompatible with the binding and behavior of the SiFive PLIC,
> yet are similar enough to share a driver.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  drivers/irqchip/irq-sifive-plic.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index bb87e4c3b88e..90515865af08 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -28,6 +28,11 @@
>   * The largest number supported by devices marked as 'sifive,plic-1.0.0', is
>   * 1024, of which device 0 is defined as non-existent by the RISC-V Privileged
>   * Spec.
> + *
> + * The PLIC behavior and memory map is futher formalized as an official RISC-V
> + * specification:
> + *
> + *     https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
>   */
>
>  #define MAX_DEVICES                    1024
> @@ -177,12 +182,12 @@ static void plic_irq_eoi(struct irq_data *d)
>  }
>
>  static struct irq_chip plic_chip = {
> -       .name           = "SiFive PLIC",
> -       .irq_mask       = plic_irq_mask,
> -       .irq_unmask     = plic_irq_unmask,
> -       .irq_eoi        = plic_irq_eoi,
> +       .name                   = "PLIC",
> +       .irq_mask               = plic_irq_mask,
> +       .irq_unmask             = plic_irq_unmask,
> +       .irq_eoi                = plic_irq_eoi,
>  #ifdef CONFIG_SMP
> -       .irq_set_affinity = plic_set_affinity,
> +       .irq_set_affinity       = plic_set_affinity,
>  #endif
>  };
>
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
