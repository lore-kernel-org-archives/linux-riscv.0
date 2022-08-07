Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88482C19F2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 22:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+A7UsHHeP2+asOdjSObY9T7+vdmmpvkjFTzNZblAzY=; b=Hpmk3fN/1VCeoD
	2FbXBQynw7JzdnkkfiAavEdEnNjfNYU5NrAPOfsxkGxwFiWODKJTkJMnqbRYMa89rE1WYy+IE5Pwf
	LWmE77cHx6XJAjDDORwSv5MSwzrmfRGKorskYVsWcIh5TdSpyR8/tb4A0Lzxk4A9wMPPqOzzrCrgt
	Ys+59iYa8hMjziT0W3ajh9LDJDD3i8FPk735D5Q8+WWbQ8YXHWJYTBS9ObdpLTtZJ1ugUgO075+ss
	NXogwE+/dALOl3dbhscWi+ZZu36qK8Oq8XBp/5Ues9jYFRw/26tijRvd5/MYM3cflSKWObpmKPgTl
	nOUrPLEQttefKC5jCZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKpDP-003eaP-2R; Sun, 07 Aug 2022 22:57:53 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKpDK-003eXY-Pl
	for linux-riscv@lists.infradead.org; Sun, 07 Aug 2022 22:57:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id b4so7260581pji.4
        for <linux-riscv@lists.infradead.org>; Sun, 07 Aug 2022 15:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=BMTC+DwXoz+zkXquQeRYDcoGv3cu7wN4+LhltZtMJeA=;
        b=Dpsn7TpMHiZJHB69YFWtt1X9ZOAYMem6tdASVybB0ucUfIciTrCsPvMlpLtkjW/3kS
         gZE1yw2ek86JaO8tZnw4ZKMwAraiLvJqc2ku0Q07tix6Kw3ZhOoVzF5JDYzJFWn3ncHN
         jyfgTblbTb8Nk8SWTl/auuTU7sFvHvJWm5oGzMCI0oZftTge47gNm4nJuSCgKE4b7NoC
         wYW3s1doMg6O2LC6Q2btGNzweEyzwrqwFyDV7/n4P+o5gVLFMZN4x01uJULSp/fsetVo
         rxwE0fq7VSa4/rVA9ng9u3vXnTT6Fbhtyup8LY5NZct3cWp7CFhqojucyOAdtqAyXyFw
         gHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=BMTC+DwXoz+zkXquQeRYDcoGv3cu7wN4+LhltZtMJeA=;
        b=JUSxYuwBAcquMOy5xOm6lB8pDc697LnsL9AKzPluFeGBtOJKyS4Wkf4UR17JOeuEHY
         sLKgw9NLqxsSqLqUID0rx683Yz3W/bE+u5SgT3mWTknaixXWi19LMWY0abTYt3YJEFDW
         MxgzDdl3HZF2dmgT69polLXGLjoJGSNX9+R00RRIS7XahahxJ6HwUUnUPiQnuF5vguLQ
         /u/Ay8V2N5eyKy8UwJ646+KM1AWp8N/nli4UHdp9uK0cVPTW2rVtJR58Z87qzH9aIXgI
         Fb1Nky8BDCDojBY8xDlvsl5rgkOB7gtYjtyZuXGHGh/jCqbE4QzyTN8nJbCd3i3fNyrc
         e4nA==
X-Gm-Message-State: ACgBeo1RtBWxcSUnlUt5uas56J7EOd+YxdHA6uWIxqCZRA8hBuTS3ySE
	L8C2JhgMacLA1a9+gD9a6FP/8yxR4eBHE3V9S/g=
X-Google-Smtp-Source: AA6agR6xoAS6Kjto5qys7Bhma0ux+UmuU+jZ6yGBvIQ/DRXyLznEjcQQpr0tVst26RQpRmZupfAMyo/Ej5t7f5RGHcc=
X-Received: by 2002:a17:90b:3b49:b0:1f4:df09:d671 with SMTP id
 ot9-20020a17090b3b4900b001f4df09d671mr18013298pjb.129.1659913061562; Sun, 07
 Aug 2022 15:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie> <20220805155405.1504081-6-mail@conchuod.ie>
In-Reply-To: <20220805155405.1504081-6-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:57:15 +1000
Message-ID: <CAKmqyKO02Wx5XOcNUrX-+at+BTLgCLNo_7zqi4i_HM6ZcBLN6w@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/core: fix platform bus node name
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_155744_409954_481D064C 
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

On Sat, Aug 6, 2022 at 2:02 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> "platform" is not a valid name for a bus node in dt-schema, so warnings
> can be see in dt-validate on a dump of the riscv virt dtb:
>
> /stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
>         From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
> "platform-bus" is a valid name, so use that instead.
>
> CC: Rob Herring <robh@kernel.org>
> Fixes: 11d306b9df ("hw/arm/sysbus-fdt: helpers for platform bus nodes addition")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/sysbus-fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> index 19d22cbe73..edb0c49b19 100644
> --- a/hw/core/sysbus-fdt.c
> +++ b/hw/core/sysbus-fdt.c
> @@ -539,7 +539,7 @@ void platform_bus_add_all_fdt_nodes(void *fdt, const char *intc, hwaddr addr,
>
>      assert(fdt);
>
> -    node = g_strdup_printf("/platform@%"PRIx64, addr);
> +    node = g_strdup_printf("/platform-bus@%"PRIx64, addr);
>
>      /* Create a /platform node that we can put all devices into */
>      qemu_fdt_add_subnode(fdt, node);
> --
> 2.37.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
