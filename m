Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DCEC25B06
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 21:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3xuNernVa6+eNSb6sTj0W9Yj+9xrCyrwejV/VBWV4E=; b=TH0Pd5SdfGVIwO
	J4N4nyPhxTNWMzg9wqzXylGcUFXIuD2DgaBvip8pzA/T4MlwN+JgID24wsZj58ei1ETWmdKVWDGsQ
	Zn23VNzu05blv0yMLjX+V6sh6JsAcV9naRQqFDpZ5iUKfLsZnESKNZXCNYUrYpZvILOvOLH3a/vUf
	k7DIbXCIoXIX+lPPrGyOdaMwwWw9AZjAWFKz1EpAPmhZxL0W5tCMyPY6AX3nmEQl+aWBUeDogNHTV
	K8DE13zW2HMUAvLUSOTLPPQ6/khM18sH0jcDt5qOPPQigbEt9fboxuYXwsFDJWbFXyWRQzrOCvKKD
	45G+g25N+udlXmh7nYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNLaO-009NIK-Ia; Sun, 14 Aug 2022 21:55:56 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNLaL-009NH6-Gs
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 21:55:55 +0000
Received: by mail-pl1-x633.google.com with SMTP id m2so4984775pls.4
        for <linux-riscv@lists.infradead.org>; Sun, 14 Aug 2022 14:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=GBxN+sPBU9Sl/lscOMy1MjZne9FQGdwFrSHvq8m8+nI=;
        b=oBjLax2Hb1iTZPLfIi6JtGAJb3V4i6Nmq7wzQOfrLjsD+q6Mzj1wTHKEIkXx6/bfGw
         xXtYOh0qMRjjXRJOMFSvDWydVdoTBPBMOHs9meNINibjj1ITFQPa8Kgelm5wuldYYr+o
         3/cjBDEhOdY5Hs6ayChQ9USXPc6ve4g8U4Lo/p9ZvjmMHmCm4tOBJPq+uW4byCgwE6PO
         SCrhgjq4JVHtpN+qk9WMRfZ3S6IROjdoHsoM/dkyByPnrHj2isRvLT5JXu867nG+RYZ9
         mJPyaud49gPuX7pfk0gaev37694oe0W9oKlHqwQL/r+v4G/hXvgnN6t4TFhq6do8kWuQ
         8ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=GBxN+sPBU9Sl/lscOMy1MjZne9FQGdwFrSHvq8m8+nI=;
        b=U983uX8Gxg87yYAM2Au/cUrxID8ueZmxDPu2pWsatflN3y4WujXhxZF5azqTI02gLO
         YsfPSaae+EZHK7zS6I9tK/n+SD7j6Q5rxY29LC3AonafhJO5pDn7DorO+faFbtgXhTX5
         mCjCaZKPU5sCELepQ1oVASPE2elSK2ne+aG7vHCX5/ARtrbcsv2g8+l/GjiNJfKw2eC6
         VLyW0Rf7oXzpXI5y9fTP0poboQe3MYw6L5T9paZYpBteDGusgSjN9Hr9PTP+qi1mqP6D
         290h7G3ew4i239piWJegot2pUiFr9HOCHTNWqbMMdmj4tLgFTY3LyGD30XNCwVatPjF1
         JpXw==
X-Gm-Message-State: ACgBeo3XjkGhFD69kBSKyuPx+LLm+aK0eZg6c2Klgph2ayFlIq/U8sGX
	/fVXXDgq0SY/FKagupBgDuL0+zRjZbloJTDj6WI=
X-Google-Smtp-Source: AA6agR5gG7rPAnxy+e9v42mucMt3OdSKehsj7JfSJQua93wDgp2dXsWTI7YBZmeXcc2Pm1Ol8QQ/bP6gC+xAJWmpUvU=
X-Received: by 2002:a17:902:d4c1:b0:16f:8311:54bc with SMTP id
 o1-20020a170902d4c100b0016f831154bcmr13270201plg.25.1660514151794; Sun, 14
 Aug 2022 14:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220810184612.157317-1-mail@conchuod.ie> <20220810184612.157317-4-mail@conchuod.ie>
In-Reply-To: <20220810184612.157317-4-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Aug 2022 07:55:25 +1000
Message-ID: <CAKmqyKMUZQ-XXxED=2-QQcQsbh270=Q4ODwfZn4qNuiUj15AWw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/riscv: virt: fix syscon subnode paths
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_145553_602746_417987D0 
X-CRM114-Status: GOOD (  18.13  )
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

On Thu, Aug 11, 2022 at 5:06 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The reset and poweroff features of the syscon were originally added to
> top level, which is a valid path for a syscon subnode. Subsequently a
> reorganisation was carried out while implementing NUMA in which the
> subnodes were moved into the /soc node. As /soc is a "simple-bus", this
> path is invalid, and so dt-validate produces the following warnings:
>
> /stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
>         From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
> /stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
>         From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
>
> Move the syscon subnodes back to the top level and silence the warnings.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> I dropped your R-b Alistair intentionally.
> Tested both Linux and FreeBSD:
> [    0.073406] device: 'poweroff': device_add
> [    0.073441] bus: 'platform': add device poweroff
> [    0.502347] bus: 'platform': add driver syscon-poweroff
> [    0.502379] bus: 'platform': __driver_probe_device: matched device poweroff with driver syscon-poweroff
> [    0.502397] bus: 'platform': really_probe: probing driver syscon-poweroff with device poweroff
> [    0.502423] syscon-poweroff poweroff: no pinctrl handle
> [    0.502681] syscon-poweroff poweroff: pm_power_off already claimed for sbi_srst_power_off
> [    0.503333] syscon-poweroff: probe of poweroff failed with error -16
> [    0.073629] device: 'reboot': device_add
> [    0.073664] bus: 'platform': add device reboot
> [    0.500640] bus: 'platform': add driver syscon-reboot
> [    0.500673] bus: 'platform': __driver_probe_device: matched device reboot with driver syscon-reboot
> [    0.500694] bus: 'platform': really_probe: probing driver syscon-reboot with device reboot
> [    0.500725] syscon-reboot reboot: no pinctrl handle
> [    0.502168] driver: 'syscon-reboot': driver_bound: bound to device 'reboot'
> [    0.502242] bus: 'platform': really_probe: bound device reboot to driver syscon-reboot
>
> syscon_power0: <Syscon poweroff> on ofwbus0
> syscon_power1: <Syscon reboot> on ofwbus0
> ---
>  hw/riscv/virt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 8b2978076e..6f0fd1541b 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -896,7 +896,7 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
>      test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
>      g_free(name);
>
> -    name = g_strdup_printf("/soc/reboot");
> +    name = g_strdup_printf("/reboot");
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
>      qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> @@ -904,7 +904,7 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
>      g_free(name);
>
> -    name = g_strdup_printf("/soc/poweroff");
> +    name = g_strdup_printf("/poweroff");
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
