Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51990C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 21:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gq6nrf1My9GBWCWQ3e/4Ts5Z3gvC1rRS+Qf2h3AkmqQ=; b=w405SAhuIhZYao
	+XB24OuKBBPSmPbsyfiNfLxHY1BMOWViG3rErp5JQw7fMJmPva73r8WOHPdyVbt8GE22aXdQEtga7
	MtOonu+18s9TGGreqXD5Fb6rjIJDFCkh+mvHYEFfOTT9M+ZbV7Y6IzLLU7xBqMlxyuY7YO568C8ce
	JYMdL30d0U7zWLb4SdRYhzpNu66TJGgyFQsAZsHdzLAtXZvnH3hgFUBEkiuvYb59qRtMS2gXsqpTL
	Q4uhoJPYx9Mo8OwAMYnuaGeeFzo/y4KVNxQbMfG/bF4FTM1uNYa/6IIyHdnBN+wzAl6HoSK0vyvaj
	jL0Qbr2l0aPWqc7K5p2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3OdM-002Vx3-M7; Mon, 20 Jun 2022 21:08:32 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3OdH-002VvX-Gx
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 21:08:30 +0000
Received: by mail-pj1-f46.google.com with SMTP id f16so9851730pjj.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 14:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8vnXJaBC+wqR2rqj0TTygLadybVfml89WeYO1Om96V8=;
        b=Pdn/lzKO4+Nc8CYBVlTgucaWvVOzKxWit8VFEDqCNC3Bo9ZDIenSGI0FW7kP8AQErk
         Ew9vfXEQUcaJNbzAhw4PST3WtQfoZ5Or1pHIDClcLwnllolVbzOT/XayqpvaB24pAEVR
         k7JWoOBTxk1TqJeXuKyMTorhrWkcY9Irx6cwDlD9mbPwaeUDhoOJSCk40rEUoUiwpm5o
         v0Pwtp6mfkCLTsd59cb0VshBK9X0E2QacOqGC+WcZ0b2MTV+Rw4QKly8hAEjXfa5t8pj
         2ePBYB1U8Hse3vuzFDI6H7OhUKxFicYxEbsKNha+DYt1ONiTIVeXFZjtNYF5pH8GJPVN
         25oQ==
X-Gm-Message-State: AJIora+6XUxpFNomKNAT7E7AchBfhRfD59st0rfE5v+0P0pUPJCo6JOT
	lSI9dxjsqQ09o/guwZt4bCB9QDZwrcJsGl8o8xI=
X-Google-Smtp-Source: AGRyM1sMagwhLX/FXm9Q+qgiRigk7x6gH6Y7s1wrNteJGy4Qabian8fCQ7YPPLO2LlmBYs363Dbro95SueaxFrvOaV4=
X-Received: by 2002:a17:90b:3911:b0:1ec:bd65:a307 with SMTP id
 ob17-20020a17090b391100b001ecbd65a307mr2891655pjb.4.1655759304623; Mon, 20
 Jun 2022 14:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220617182424.324276-1-mail@conchuod.ie>
In-Reply-To: <20220617182424.324276-1-mail@conchuod.ie>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 20 Jun 2022 22:08:13 +0100
Message-ID: <CANBLGcxBSkSFSH=JqzY+CLoUap1hhRN+vxukxg0oxqUNu-NHkg@mail.gmail.com>
Subject: Re: [PATCH] riscv: config: enable SOC_STARFIVE in defconfig
To: Conor Dooley <mail@conchuod.ie>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_140827_647176_296FE8F4 
X-CRM114-Status: GOOD (  14.56  )
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

On Fri, 17 Jun 2022 at 19:26, Conor Dooley <mail@conchuod.ie> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> SOC_STARFIVE is the odd one out among the (compatible) SOC_FOO options
> as it is not enabled in the default defconfig. Add it to make catching
> dt regressions etc easier.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks, this would be great.
Acked-by: Emil Renner Berthing <kernel@esmil.dk>

>
> git send-email gave me an error that was unclear as to whether anything
> got sent. Checked lore (and my inbox) but didn't see it come through so
> hopefully this isn't a resend.
>
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0cc17db8aaba..f8d7d9527c6e 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -18,6 +18,7 @@ CONFIG_EXPERT=y
>  CONFIG_PROFILING=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
> +CONFIG_SOC_STARFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> --
> 2.36.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
