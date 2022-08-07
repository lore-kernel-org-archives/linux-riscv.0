Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AABC19F2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 22:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eJGwBo26TPFa9YGee4Dhwk3vtClWbg2xRrTOui4liQ=; b=fb507wBY17y2tK
	VWD4e+NA7NlUT1aobxGeJ97HAN1ZrvzpI7ViAm44hkSew/3zNhHUjxtE2d1mSJP6CQ4soLcAL9FU5
	VM+/JCbWBIogdUmPKXSnLvdlYr4CekPv0Vo3o23MhHQr72x7s5K/WDNJpza15B+p+kWveg/BBnh3s
	ASIsas/gHhwkU60tZoahYpk1liVpuZ0W2EIHyP1bH07+Kx9nWhJFF7/RnI6hn0DU1EvtMWtLgHoSF
	/5pzK7/rmjV2cy4R/8PEdqunSSmpE1Y/6HgGbqdXI+SXxiNXQQiJwIzHvQPZ5IK3zw1L1PYuPvEtN
	wFR4ja91i08UKinjMJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKpBM-003dBn-Ko; Sun, 07 Aug 2022 22:55:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKpBB-003d3Y-TQ
	for linux-riscv@lists.infradead.org; Sun, 07 Aug 2022 22:55:38 +0000
Received: by mail-pl1-x62d.google.com with SMTP id p8so7027733plq.13
        for <linux-riscv@lists.infradead.org>; Sun, 07 Aug 2022 15:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=FgYajevSy5JJOV/dvjp7vruzarNh37WfAGf2aLFXqgE=;
        b=ACcFkSGhwqsqXioVrnxFq+RHZwtSA3xfQ79I7MuOg3je8Uo8iu29m3bFj3LxCAbnzw
         Yn0JKEb+bYOZFF+p14jUyWBSnlMtB9HwEC5eaEGz5/Rmwr5sg4SCNNZc83pOihcjCuBS
         Nbd051rtoMLWuW1zXCH4+kNJxnZT9+/jM/OSRrcSHnbD/IPRa3Z6fs/bYaTZnIrr8Nmn
         6Zp+TdarbryM4360O6H0LtSF2X/NHPmcHxrZhBM0mUfj2veudWxkAXGUIAbHMUyIVZDo
         K9QjLWBfzRTNEl8pPdsRa6FzH3JY+GI4iap68m0g/fpE2lbFxHMvlgNdM7ohys3UFdV9
         4ioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FgYajevSy5JJOV/dvjp7vruzarNh37WfAGf2aLFXqgE=;
        b=DgKt1f3b8aR9albgsRYLgQaaBvFcyAxUJQ7aqpDLIoYTAgQU1Oy84BCqo8aKEGnqx8
         qfPP+oXZWNpEOVw+tDDCrMx7tuAqABjKPKGU4tmaqiZMGZUKBGfzIU2Ct50Z2gN+rYwW
         bXzp5A9J45diJMBx48ZmhI7D7GoWZ1vh5fyTsXsSu5NY38ODZiptXL6YCOpEklSxQk4M
         24obYEHVXGcyMdVYi2UyBlseRPsLlBHejZEa4VX/8QnM4E4+5djGv6ZrjZxCEMSfMJQH
         zLpgjmVRSWT58M3fStHyHpkhmH+VjEkUW1NvBY0nFgI61eL3qNXeRCYpMNcn9Ekdk8cQ
         p9gw==
X-Gm-Message-State: ACgBeo3XdF15ZhzSKIsyToBRpS4+f8suvs8NeoB1DG9uljjUf9AA29W1
	8Xbf6iCHsZI2iFy6tdozvRqhjjPvpyF1TrcGYoXjaEAhgL8=
X-Google-Smtp-Source: AA6agR4Mgwjx8G9tE8+yz7IcX0GIElOKLyDRRuqBHhObSd0d30OhHfKYgCPcdYjlc65+6MWSnTlph9piLPmCczZqlUs=
X-Received: by 2002:a17:90a:b391:b0:1f3:6c3:392c with SMTP id
 e17-20020a17090ab39100b001f306c3392cmr26040074pjr.166.1659912928746; Sun, 07
 Aug 2022 15:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie> <20220805155405.1504081-4-mail@conchuod.ie>
In-Reply-To: <20220805155405.1504081-4-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:55:02 +1000
Message-ID: <CAKmqyKPv52ZkoJsEqHRJSnQS+ojQehY+PX0e0FN3xSFBYOMPYQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/riscv: virt: Fix the plic's address cells
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_155534_913462_395C731D 
X-CRM114-Status: GOOD (  15.75  )
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

On Sat, Aug 6, 2022 at 2:11 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> When optional AIA PLIC support was added the to the virt machine, the
> address cells property was removed leading the issues with dt-validate
> on a dump from the virt machine:
> /stuff/qemu/qemu.dtb: plic@c000000: '#address-cells' is a required property
>         From schema: /stuff/linux/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> Add back the property to suppress the warning.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Fixes: e6faee6585 ("hw/riscv: virt: Add optional AIA APLIC support to virt machine")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 2 ++
>  include/hw/riscv/virt.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 6c61a406c4..8b2978076e 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -465,6 +465,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      qemu_fdt_add_subnode(mc->fdt, plic_name);
>      qemu_fdt_setprop_cell(mc->fdt, plic_name,
>          "#interrupt-cells", FDT_PLIC_INT_CELLS);
> +    qemu_fdt_setprop_cell(mc->fdt, plic_name,
> +        "#address-cells", FDT_PLIC_ADDR_CELLS);
>      qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
>                                    (char **)&plic_compat,
>                                    ARRAY_SIZE(plic_compat));
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 984e55c77f..be4ab8fe7f 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -111,6 +111,7 @@ enum {
>
>  #define FDT_PCI_ADDR_CELLS    3
>  #define FDT_PCI_INT_CELLS     1
> +#define FDT_PLIC_ADDR_CELLS   0
>  #define FDT_PLIC_INT_CELLS    1
>  #define FDT_APLIC_INT_CELLS   2
>  #define FDT_IMSIC_INT_CELLS   0
> --
> 2.37.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
