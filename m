Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69238C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 15:46:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B38960725
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 15:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B38960725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMAgkwctrSSrH+lnku6q+qSTUyALeCF6MdlLQYNR4wo=; b=aC0zLO7HsW3keY
	n6MGf/5ix4085ZTLx5+99cMKkyT4to0KkLVic0MF6zTXdsEB73lyhc3r+a6ajgYtdPuI8mblNjs8o
	+RSCL9vdQsH8tgKo+URRGrmnJzvPJNGyIWeBsLHweUoURPFVUAO1ELzVWl7UuHEwjqoWCnvN8tXd2
	HW2s0+XpYQN4dqj+Xhcntyh0SCLRtjpu4EJrLufZOF6KTSu5JZ8ie3ZQMYi3si/QrRocY3O8rK34M
	Gyg/ZJyj/jjFGdeRjHjK9A0w5lqoKz1sX8ism/1TeV6w4jvq+CtAEPEERdjvhRFUbarKYvBt+aoe1
	juUlYr8RXZgQiVbaTX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIYd1-003n5l-0M; Tue, 24 Aug 2021 15:46:19 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIYcx-003n4l-Cq
 for linux-riscv@lists.infradead.org; Tue, 24 Aug 2021 15:46:16 +0000
Received: by mail-ua1-f45.google.com with SMTP id 90so11902788uax.5
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 08:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=msURh4HPk6Cq1BimDbNhMMucXYT7U0Vcy0Sq2atJrx0=;
 b=LzlaEJpk+uLknEJ/RdRcdBXy8WIO5o5+SJfot6vDHTIFlf6N6SC5eRjIDANiLr/kMt
 BRBt8oH5mn8uAKYNmaWMiedPlKAD4O1Z9L4Jh88txCE8NwkiOuR8arEijtXwXiCfuOQ0
 +Ru+FxzweJ1GFzq/E/G2oiK5tkoI+Rf9fYLCaNO1KDHJ7LFA8+15CyJYeztdbgV6H4XP
 7zR4uAyBorud8Cws4zow1r5JnppFwjUS6Hpzvi3ZzbklfaeM50dVXIYMLTTd+q9O1HZT
 KNE07tZU15Q4zmMf709d1SFgXmtRqPdiTXyXu2Bcli2UwGikv4wxTzZ2DiJyeATmMEpE
 5WiQ==
X-Gm-Message-State: AOAM530MOCJQb5A6h1JQ6We6hv/KvKkA6YqJlRX/omeeTBM0ey22qiPc
 IG5WR+QcU3KCXtwcaQHhpXtMbxiuL9JQhYRVESs=
X-Google-Smtp-Source: ABdhPJwAUNvTcQx5kvQLdZtlnNgIdtvcUkBPTndf14lOrIcWLAHO225weCyrNKkIAJ0DtWEtZ71qlOnUdevBBlpY9MY=
X-Received: by 2002:ab0:545:: with SMTP id 63mr26240042uax.122.1629819974316; 
 Tue, 24 Aug 2021 08:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210804123015.807929-1-bmeng.cn@gmail.com>
 <20210804123015.807929-2-bmeng.cn@gmail.com>
In-Reply-To: <20210804123015.807929-2-bmeng.cn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Aug 2021 17:46:03 +0200
Message-ID: <CAMuHMdVi9EccyTK7KWqb-Box3PaaMkZ0GRFOszmHP6JsyvAzAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: microchip: Add ethernet0 to the
 aliases node
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <Conor.Dooley@microchip.com>, 
 Atish Patra <atish.patra@wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_084615_481538_E832F368 
X-CRM114-Status: GOOD (  23.71  )
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

Hi Bin,

On Wed, Aug 4, 2021 at 2:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> From: Bin Meng <bin.meng@windriver.com>
>
> U-Boot expects this alias to be in place in order to fix up the mac
> address of the ethernet node.
>
> Note on the Icicle Kit board, currently only emac1 is enabled so it
> becomes the 'ethernet0'.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v2:
> - move the aliases node to board dts

Thanks for the update!

> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -14,6 +14,10 @@ / {
>         model = "Microchip PolarFire-SoC Icicle Kit";
>         compatible = "microchip,mpfs-icicle-kit";
>
> +       aliases {
> +               ethernet0 = &emac1;
> +       };
> +
>         chosen {
>                 stdout-path = &serial0;
>         };

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

BTW, is Ethernet working in Linux for you?
IP-Config is always timing out for me.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
