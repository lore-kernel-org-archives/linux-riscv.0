Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2146DC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 02:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ynn1VSFdOv1t+Q9nGKEqvtH1JoWBp2ZEQwaBT5KKqmc=; b=w5l1CjF3I7pVe7jhSVZYTsB6+G
	04g5Hs7xlwgqrPUXgm94iMT4fBwQLZkpm3eDI9n39fTG/5YCsnHVdJR/MHBA+q5PlUGqKwGJNq9BY
	qe16phZPdvTuTsyEwdpLiI9WNp7DadKwTiPrkZa5Tox9yOJD4CD6hOifZ/gEwpAUH2K9byxVE0VVP
	l4IXW6pfFWY89YTeNJ/ib4yLGGcPg9Fl1Zs6olyCxVw1wCdGDQGgjqf+TQkSwCsm/3+nvejhC5kOT
	tw12Y3W3shH7A9xWuPKpz8EUy8sAz0M+r58nWSByKGrKXVVEOOTJlrJRgh4UIGqaaHDIH7o3e7oZR
	92yOX+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nE0Iv-005po7-RA; Sun, 30 Jan 2022 02:51:01 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nE0Is-005pnd-Po
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 02:51:00 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1C8DB3200F9C;
 Sat, 29 Jan 2022 21:50:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 29 Jan 2022 21:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=M/oKfxWweBksHL
 qGbrQQV1iOXRgcdwMf8Ir4g8ZQd74=; b=l8gQO6Ui3rytddIrgmkc3qFDtlrOLo
 z2uI8DPrBKCAZc8wwCIBB0Lko41R6NDSjX3bh3PABb8yLvf6u7eyPBC18gtEJD8h
 1tvnVfUlunMVVz5OOo28QqMLnzdLvQgTF4OP3kpqIy5GC2VH/Itcdeu9gyeRbIas
 NTu8v8wxz3tRuzGrQzqxCjWbnEqDnysYl+6pTx2VYC+H+xWCe3Eg7Zgs2xA4H0t5
 DozcZpwZD5CNSZI9kjtOjaEm8U0/U6ga6sjw5PKF+RjIi6S6PFmbivj1/jvMyKJP
 q7fqD02xCchWm7uwfX606s5YcVXCl6utdImZl/j++yyyYwUHcW8rn4Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=M/oKfxWweBksHLqGbrQQV1iOXRgcdwMf8Ir4g8ZQd
 74=; b=DpkNz4lvM4zrtbcc/vlddQ40KjRVANBsuP42MD/2q7pa+3hyUmQ4AT9tn
 n7lcMylAvoP/SHeYgSkExw8s1xK2oPbmyd+9p2kJZL8CKtkUHo0vlVRsO/G1ozzF
 3ywgXkxajHxBxrRTAVE0zbXCSxEAdGUkBoQuDE8GkIVplaZLZ7hvvkeMW6JMOwQx
 rvUR6LCoFXGtfO2liJjAcALgwftUiGCug05WaaPpNGjorkgwUcbPgAoG+jaY/fJX
 RXj0AJ+gqne9/bjnvvMa9qBpukHmrKxLgTQDH549kqm8uIHkMjR6MHx3ll665mEZ
 RVD88930E1kVTHdEWkvMltcVw7wNA==
X-ME-Sender: <xms:DP31YUeblmLIBFiL4MjOZvINBJuB5-16psgTpDJ3kAoJSCPbWdmvuw>
 <xme:DP31YWMDDEkjH5ks5jcrNDBD4N1ryW8VoNCEX3HuyutHmyqvcZI7a4qVAXQepkjay
 aUZaRwdKqO5hf1pGg>
X-ME-Received: <xmr:DP31YVi7zNXJBtgmwB8ub6t03R8uRr33vFPx4GGw2TPGT_21PmKAAiPh7qEgsfC4FjJccwCi3lvbWue5h1oosijO8Ww5T-bZK51vL61JyjbC751PMYwmKLVffQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeekgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeetteffjeefhfegtdduledutdegudffleduueeftddvlefgieffveef
 hfdukeegvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:DP31YZ9AgEK4zNsJ_HxuGRDelprVW1yN8Efel_DbPrdbDNGRSibgiQ>
 <xmx:DP31YQsigjuBROKMNDiP2n1MuDoZ2SHud0YH3TMHkE6K96BjC3UkbA>
 <xmx:DP31YQH9CK5ELyaWeZZEmSfZuzUetq6tzDSE0PR5l7GqKjVzO0S3Jg>
 <xmx:DP31YV8sWT_mxM6fLaIhjiOfHpNclkIF0NxkQXsLBKzsoxTa6P64MA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Jan 2022 21:50:51 -0500 (EST)
Subject: Re: [PATCH V6 2/2] irqchip/sifive-plic: Fixup thead,c900-plic dt
 parse in opensbi
To: Guo Ren <guoren@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
References: <20220129162726.1154501-1-guoren@kernel.org>
 <20220129162726.1154501-3-guoren@kernel.org> <87r18qxui9.wl-maz@kernel.org>
 <CAJF2gTTYN0bxnnMtP9L1KvaH0h6ny+Lr3+fC7GP-YWnwjAYd4A@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <35b1838d-ef80-1816-46f6-9cba7afc813e@sholland.org>
Date: Sat, 29 Jan 2022 20:50:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTYN0bxnnMtP9L1KvaH0h6ny+Lr3+fC7GP-YWnwjAYd4A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_185058_902547_A45F908C 
X-CRM114-Status: GOOD (  27.16  )
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

On 1/29/22 8:08 PM, Guo Ren wrote:
> On Sun, Jan 30, 2022 at 2:32 AM Marc Zyngier <maz@kernel.org> wrote:
>>
>> On Sat, 29 Jan 2022 16:27:26 +0000,
>> guoren@kernel.org wrote:
>>>
>>> From: Guo Ren <guoren@linux.alibaba.com>
>>>
>>> The thead,c900-plic has been used in opensbi to distinguish
>>> PLIC [1]. Although PLICs have the same behaviors in Linux,
>>> they are different hardware with some custom initializing in
>>> firmware(opensbi).
>>>
>>> [1]: https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd62653b9fb31623a42ced45f38ea6
>>>
>>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>>> Cc: Anup Patel <anup@brainfault.org>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>>> Cc: Samuel Holland <samuel@sholland.org>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> ---
>>>  drivers/irqchip/irq-sifive-plic.c | 25 +++++++++++++++++++++++--
>>>  1 file changed, 23 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
>>> index 259065d271ef..245655928076 100644
>>> --- a/drivers/irqchip/irq-sifive-plic.c
>>> +++ b/drivers/irqchip/irq-sifive-plic.c
>>> @@ -172,7 +172,7 @@ static void plic_irq_eoi(struct irq_data *d)
>>>       }
>>>  }
>>>
>>> -static struct irq_chip plic_chip = {
>>> +static struct irq_chip sifive_plic_chip = {
>>>       .name           = "SiFive PLIC",
>>>       .irq_mask       = plic_irq_mask,
>>>       .irq_unmask     = plic_irq_unmask,
>>> @@ -182,12 +182,24 @@ static struct irq_chip plic_chip = {
>>>  #endif
>>>  };
>>>
>>> +static struct irq_chip thead_plic_chip = {
>>> +     .name           = "T-Head PLIC",
>>> +     .irq_mask       = plic_irq_mask,
>>> +     .irq_unmask     = plic_irq_unmask,
>>> +     .irq_eoi        = plic_irq_eoi,
>>> +#ifdef CONFIG_SMP
>>> +     .irq_set_affinity = plic_set_affinity,
>>> +#endif
>>> +};
>>
>> For pure entertainment, let's compare the two structures:
>>
>> static struct irq_chip plic_chip = {
>>         .name           = "SiFive PLIC",
>>         .irq_mask       = plic_irq_mask,
>>         .irq_unmask     = plic_irq_unmask,
>>         .irq_eoi        = plic_irq_eoi,
>> #ifdef CONFIG_SMP
>>         .irq_set_affinity = plic_set_affinity,
>> #endif
>> };
>>
>> Oh wait: a string. Must be really important. Not.
> No, pls see below comment.
> 
>>
>>> +
>>> +static struct irq_chip *def_plic_chip = &sifive_plic_chip;
>>> +
>>>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>>>                             irq_hw_number_t hwirq)
>>>  {
>>>       struct plic_priv *priv = d->host_data;
>>>
>>> -     irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
>>> +     irq_domain_set_info(d, irq, hwirq, def_plic_chip, d->host_data,
>>>                           handle_fasteoi_irq, NULL, NULL);
>>>       irq_set_noprobe(irq);
>>>       irq_set_affinity(irq, &priv->lmask);
>>> @@ -396,5 +408,14 @@ static int __init plic_init(struct device_node *node,
>>>       return error;
>>>  }
>>>
>>> +static int __init thead_c900_plic_init(struct device_node *node,
>>> +             struct device_node *parent)
>>> +{
>>> +     def_plic_chip = &thead_plic_chip;
>>> +
>>> +     return plic_init(node, parent);
>>> +}
>>> +
>>>  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
>>>  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
>>> +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
>>
>> Sorry, but I can't see any point to this patch.
> You didn't see the link I've put in the patch. In that opensbi patch:
> 
>                 intc: interrupt-controller@10000000 {
>                         #interrupt-cells = <1>;
> -                       compatible = "riscv,plic0";
> +                       compatible = "allwinner,sun20i-d1-plic",
> +                                    "thead,c900-plic";
> 
> +#define THEAD_PLIC_CTRL_REG 0x1ffffc
> +
> +static void thead_plic_plat_init(struct plic_data *pd)
> +{
> +       writel_relaxed(BIT(0), (void *)pd->addr + THEAD_PLIC_CTRL_REG);
> +}
> +
>  static const struct fdt_match irqchip_plic_match[] = {
>         { .compatible = "riscv,plic0" },
>         { .compatible = "sifive,plic-1.0.0" },
> +       { .compatible = "thead,c900-plic",
> +         .data = thead_plic_plat_init },
>         { },
>  };
> 
> We've changed the compatible name for thead,c900-plic, and there is no
> riscv,plic0 / sifive,plic-1.0.0 in dts. Without the patch, the newest
> opensbi + newest Linux would be broken in the Allwinner D1 dev board.

Yes, some patch is still necessary, because the hardware is indeed incompatible
with riscv,plic0. However, this driver does not care about the difference. So
all you need to do is hook up the existing code to the new compatible:

+IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init);

Regards,
Samuel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
