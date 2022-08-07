Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272FDC19F2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 22:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXdtdtdaoXA0KRZjz6RgOvBiz4Ku0t43JhZXP0vNhG0=; b=jvDMJI6cMEXP2I
	kCTsamn9LhplbbTBtxaC6NRNJ2ApKnoju67xK370ibmdW1q2nTzX522ndbZnHNNQL1IegvA8+9nIH
	mt3WMsa7qTwwgTEZzpns7C5w5i/b5SSQ1avhGqdF2x3e/KtRQ8ZAdFEH073dzsCDyASBGRbBHnGs5
	lMbqdtXZKl21YTbMhJp8fvb0rBDPDTjCAtAw/cAZBzprD8UlBR10wAQFSvWM9WPx7wuBCb/lPpyY8
	JWFWoDZRinYBEuiwnBrnCv/AjJYaxwNwH7Ij6st+akTkf8miVt7v/yjs2e2hENjkZuz4yoc9XeYfD
	Obw9TIK98ag72p85LU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKpCn-003e8J-KB; Sun, 07 Aug 2022 22:57:09 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKpCe-003dzp-2o
	for linux-riscv@lists.infradead.org; Sun, 07 Aug 2022 22:57:01 +0000
Received: by mail-pf1-x429.google.com with SMTP id k14so4684598pfh.0
        for <linux-riscv@lists.infradead.org>; Sun, 07 Aug 2022 15:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=m6mp7lo6yuezAIF/o/AFEZq8cosxJpR5uX3sLTCul3c=;
        b=dbsCt/bpEragvjxy3VsKqM1MOZVTx/S27Ecr6MV4DzyPscuWnd4Gn/x/U2TYwZnWCb
         58pGEx5fa1uirisZSBP3VE8Gbpbh86aIQcNDgEsamGpI3bsxL4tE6mkyLKclK0O45IcZ
         X4x9RuthG1+Otx3zU9Vfq9T9+8pLbL+E5/g2XzJJfd99XuuwEReyYCIY6yieA63zlcFV
         +SSVB9yvkn0qOLoH4R/Gf0am+cVcjO3I2V4Zq8etglKa/ygMj7nmR4gAnN0C+zx5tv/B
         tXM6TBZB0WMyBKeokUQHE0xd1DHIMQ9KONFNp3sLhcL9EDmTA9R65gFuM9pMpXpyZfoV
         5WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=m6mp7lo6yuezAIF/o/AFEZq8cosxJpR5uX3sLTCul3c=;
        b=qkwhfCpjSaVk7TSUA7ImeWqwcEMRy4dGJXKM1h7EYB8Bs6TdvNFCKWfr3mGGoYyEcy
         JGePo2+lrYFVDSC/I8UTdhXFUxJpaRgDtIijoEnPpC85Z0xuJqGMWNo8NKDxWpeuvqVu
         2QANofpInSwRq9VZhkeLGCJKvCwOu9CmpUThkNBvCcyDFr6KEpQGupa+EqlElu1JcPxd
         gEkb5Dv7IO+sM3lByQPrS18T9yBsKzIkD+dU0sNqjnXI36bhwq5zdlGGYGTApj3RT+Sk
         XE0Ul15GLbkZWJf14lum2ZNhY9aaE0+HTVQrvo1XfXlI7meRUVtTBd2oguKKtQxm99W/
         EXrQ==
X-Gm-Message-State: ACgBeo2RatLbELBnQft2ritW6RSJ17U267p3lBQ+ecqmIi4TgzETdRig
	m2JlViUv00z8z+6w6UF48uWNIJ3FLhiSDxVxiT8=
X-Google-Smtp-Source: AA6agR4/zm3uU4TtEdDqN1yGCg2kBlKZTWXny5+xTeKCQIFhWINjiGWbF0nA4f6gTPfylqGo85QJuVG5aHs8RfiNl74=
X-Received: by 2002:a63:f14c:0:b0:41a:b83d:a636 with SMTP id
 o12-20020a63f14c000000b0041ab83da636mr13455804pgk.361.1659913018847; Sun, 07
 Aug 2022 15:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie> <20220805155405.1504081-5-mail@conchuod.ie>
In-Reply-To: <20220805155405.1504081-5-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:56:32 +1000
Message-ID: <CAKmqyKPkSi9A074tK3AhCsaxkXaE71UO=OW5PSh4bYbVjVHRmQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/riscv: virt: fix syscon subnode paths
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_155700_163805_B4BFE3A2 
X-CRM114-Status: GOOD (  16.30  )
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

On Sat, Aug 6, 2022 at 2:10 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The subnodes of the syscon have been added to the incorrect paths.
> Rather than add them as subnodes, they were originally added to "/foo"
> and a later patch moved them to "/soc/foo". Both are incorrect & they
> should have been added as "/soc/test@###/foo" as "/soc/test" is the
> syscon node. Fix both the reboot and poweroff subnodes to avoid errors
> such as:
>
> /stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
>         From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
> /stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
>         From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
>
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
> Fixes: 0e404da007 ("riscv/virt: Add syscon reboot and poweroff DT nodes")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 8b2978076e..a98b054545 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -896,7 +896,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
>      test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
>      g_free(name);
>
> -    name = g_strdup_printf("/soc/reboot");
> +    name = g_strdup_printf("/soc/test@%lx/reboot",
> +        (long)memmap[VIRT_TEST].base);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
>      qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> @@ -904,7 +905,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
>      g_free(name);
>
> -    name = g_strdup_printf("/soc/poweroff");
> +    name = g_strdup_printf("/soc/test@%lx/poweroff",
> +        (long)memmap[VIRT_TEST].base);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
>      qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> --
> 2.37.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
