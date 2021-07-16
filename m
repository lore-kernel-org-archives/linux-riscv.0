Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D15C12002
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 09:23:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56F60613D4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 09:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56F60613D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7Pi6U/lpDY8X5I4eftSScbfyybiPmuGZsXIK/ISkCg=; b=KGESlE5S43AZUL
	7ksFl9r8MU7rPl1URSY58hk37qAH6628Xh7kUNcJSZ1me5oimDajQmm/UEN7xdOKxmZJj5ai8//zQ
	lpLBV5SpOOCpxykp/sqc+7yq/pV+LlN7IV280d0BXJwd7Pu+AB/pIjqcKpO2V8j8VERu7qv/IWjLA
	MI1nTVg4Ha7KV9malIBHgTt0qEZfPKNqq6TiojvdHg9p1pyfswC2ViyamzXNmDAU4qq6N20MCnklc
	KSy9gv2BuwMRuTUYxVN7TtrFHjgZEjQj0pM+JWVA3e1zdZntAp5Z5Z8DjgVGS5lRmdWYe5ltU70PP
	QOa7m8AU6pmKW9rvMTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4K4A-003vIB-Ts; Fri, 16 Jul 2021 09:23:30 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4K46-003vHY-4A
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 09:23:28 +0000
Received: by mail-vs1-f46.google.com with SMTP id a22so4665978vso.1
 for <linux-riscv@lists.infradead.org>; Fri, 16 Jul 2021 02:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1OqoN0B06XByOpA3tvQ9e3EVDa9GANnN7IQYUpgh/g8=;
 b=GODdnNtVOMTEoFermrhHQ61KBdPg7x4uZjSREKzAYIBIf7EXXnSscTdgGerp1/ySBr
 KqNZl0PS+dmojSz9eD9fEo7xmvZAtVlhx8y0O/MGGgh1kRsYKTz9Lzxa6zfJ1ILsVOax
 ZBqGBI22DSKHiCHJ0jiJbslf20QHpRMw8mkcsZ6cxA6M4K/bYDzV3canm0HH7oYALyku
 9KEjiOgD4BqRR2odtBBUldyw/Q9GtrOWBCyXMA3IZ4jnDXcw+vryFY6AcJ0gQw5lscdU
 qa6yCszXVSB24nFQosc9qTw80VcPbPi1TpvEUNgArh7bwGOfX/8SDw5Bkm7J0nCdam+V
 steg==
X-Gm-Message-State: AOAM533YTrNLS2NLhlvA+28atgWb9/x7xaoXAUnXPBVB8t7Ydl9gOlAZ
 322fwdMUzuvNBvTEd/+ChxYveJ0ClqVQ3FBSCOU=
X-Google-Smtp-Source: ABdhPJyZz8xamPCaCgF5o9kpuaoOkG86/tNUETDuZikOJ1wKaZ5/cu6TX3V11ted7nXi6hg4j9uW3JfatNByxpjFu0M=
X-Received: by 2002:a05:6102:321c:: with SMTP id
 r28mr11247074vsf.40.1626427405168; 
 Fri, 16 Jul 2021 02:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210702014319.1265766-1-bmeng.cn@gmail.com>
 <20210702014319.1265766-2-bmeng.cn@gmail.com>
In-Reply-To: <20210702014319.1265766-2-bmeng.cn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jul 2021 11:23:14 +0200
Message-ID: <CAMuHMdWpJ194jEnXiUhs5dfC-33rGUm7pE9aMHUTYoMCUdFxZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: microchip: Add ethernet0 to the aliases
 node
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Lewis Hanly <lewis.hanly@microchip.com>, 
 Atish Patra <atish.patra@wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_022327_648412_9B735C4D 
X-CRM114-Status: GOOD (  21.64  )
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

Hi Bing,

On Fri, Jul 2, 2021 at 3:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> From: Bin Meng <bin.meng@windriver.com>
>
> U-Boot expects this alias to be in place in order to fix up the mac
> address of the ethernet node.
>
> Note on the Icicle Kit board, currently only emac1 is enabled so it
> becomes the 'ethernet0'.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Thanks for your patch!

> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -9,6 +9,10 @@ / {
>         model = "Microchip MPFS Icicle Kit";
>         compatible = "microchip,mpfs-icicle-kit";
>
> +       aliases {
> +               ethernet0 = &emac1;
> +       };
> +
>         chosen {
>         };

This should be added to the board DTS (microchip-mpfs-icicle-kit.dts)
instead.

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
