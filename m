Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6367C19F2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 22:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57QALs+C0zKuOeJ95eFeU5CBDMzdVNY/iU1XWo1VGrg=; b=xVQC1A8wrKMI6d
	rxIkLeGEsNbf4Mqlb/PJWRdNpo7Ob39qR0p5fbK2bqCofmZnMN+/LfIHrZMQjEpRAXn8p+viMm054
	LRpN1qS7LcRMv0MmFZDWXB9HBlizqWBEOmtwmA9chC/az3ImaEiI0QogulapOXmUK6+YeWZcD4DUn
	gurEQ+IsDrVr0pEw40KL7Sess2Ja1PPggkhh4PAK5sD+VHIrwH5H0Xl2J5dXyKkQNsLowl+X3/Ws+
	qnUBSShMf5QXgikoW6RsKgZH8H5WZl2ReRXQ+jtar3keOPOEhAWW1gBdjzynx86rNGZLOVvcdf2iy
	tQaJxWa+AtX22Lz1GLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKpBh-003dPG-Hw; Sun, 07 Aug 2022 22:56:01 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKpBe-003dNM-K3
	for linux-riscv@lists.infradead.org; Sun, 07 Aug 2022 22:56:00 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso12919748pjo.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Aug 2022 15:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=J35VYfb/k+UHn3LPA5cvyRwQTefgVmN3WoLJbDt7REk=;
        b=X7HrpkbtFlnom2BYDhOHN1/hcm5nT8vTY9GfQkTFJ6w1muRYq5d6B7NHusUJL7HALl
         oN5DhwJ+p1vg1/hdLhzym/7R0sUOG1L3wNcqxGx6HaG6nQ7SmMMbcp/pNRDBil2Pb+qO
         My6fxbo4SsnC5MMUZMPB9bM/DsrxCVh4ktVP7ToiWlluVg0ZxCmAb0prkGevw1ua4/ET
         4BpOwxdjKfNtW9QK/mYAmHuZz2ST5OLSwbNAx+yu6jHGwx7IwHoQrGcUG3IpBt2x0r6+
         T/w6nv2ObzbL06Ko+oMUjkvGsyyILXL7K/sRAlx/Y2zPLC3koFKUnpVPoarOzhAL7jXn
         aR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=J35VYfb/k+UHn3LPA5cvyRwQTefgVmN3WoLJbDt7REk=;
        b=yRLHPt64YHnZpXnnaWEibmipj6qUfbdOD62nWu0wSTqSGRGPfMILB5WsrSACeXQVgZ
         Yjeh0pGt9/nXTm1n6s9YIagDS0JN2I1eYoO8wcsBgkQoT0miIM14gAwo2hoQrtnq8TI2
         6Itwp7DwhlkJzNX4NkmOB1KCpYHcX1F72TLLsgVjVd9ody17Khi+t3F0ekACifLCnjMb
         XlgUpACFvLX7rPmHk42RneR2RFUXDyWTlhjOjADLuK/Dxb2B5oQLCTa8qdrjzkzYpOVN
         ThKWp+bI7adGEFkUBKpn8UT1o5gCMzgSUljiumJjYACkInob1Jnq7s/VM7R0wk8paLhA
         vJKg==
X-Gm-Message-State: ACgBeo3tldC7LS0YBEsgIU9hfXEysZ26Y607UfHfXfaIV1wbg8w0NCbh
	uFJOKIfvdCpS6kxozgTJr4IwRTBs3jZuwhQawy5Uo5bFziE=
X-Google-Smtp-Source: AA6agR5vRb9tdgQsI3Fu1w/08lyVQregHr4zyKnVRFkyDEFtxF1wZXMQ5+F/Emzi2XElDWvHoW82YDNkH5B3UtZktuQ=
X-Received: by 2002:a17:902:e5c8:b0:16f:1511:7575 with SMTP id
 u8-20020a170902e5c800b0016f15117575mr16374823plf.83.1659912957399; Sun, 07
 Aug 2022 15:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie> <20220805155405.1504081-3-mail@conchuod.ie>
In-Reply-To: <20220805155405.1504081-3-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:55:31 +1000
Message-ID: <CAKmqyKOipk6L56xFYO52JXrW2DFjbfrtXvdm+6=Wjh2H5rxx-Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/riscv: virt: fix uart node name
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_155558_764376_8B99EC8E 
X-CRM114-Status: GOOD (  13.95  )
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

On Sat, Aug 6, 2022 at 2:01 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> "uart" is not a node name that complies with the dt-schema.
> Change the node name to "serial" to ix warnings seen during
> dt-validate on a dtbdump of the virt machine such as:
> /stuff/qemu/qemu.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
>         From schema: /stuff/linux/Documentation/devicetree/bindings/serial/8250.yaml
>
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Fixes: 04331d0b56 ("RISC-V VirtIO Machine")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index bc424dd2f5..6c61a406c4 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -917,7 +917,7 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
>      char *name;
>      MachineState *mc = MACHINE(s);
>
> -    name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
> +    name = g_strdup_printf("/soc/serial@%lx", (long)memmap[VIRT_UART0].base);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
>      qemu_fdt_setprop_cells(mc->fdt, name, "reg",
> --
> 2.37.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
