Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20E3C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 22:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:CC:Mime-Version:Message-ID:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=fWFhBOSWp/wYV9YwMXVMfzPQY54f/ug+eMZdG70yvoo=; b=i1mcrd+soI6MgMgz3uoFkLr90h
	bT2czkFj6IFcLA3SzBDPGg9CEgMqRoXqINss0He2P8Amt07DIoSAckRdruNazREN7Ly5CjjPh1ACS
	8uSYxWrYjceH/mce58oGu/WUe+i8qYwEp/kv7crendsKAJoRbGISxIzPUG2h+4GbNi8KJ14NQS3nz
	KxeW0AP9uAfZwRapAqIkXtxSeQS8t90ff+ovhC0/Tzzn7mmYpnoa3PiKjNnOrPss8Lt0gr5pvyPKj
	I2dblC5D97WlKZL13s5eViBjJSgErDJsJQHzPZRVgVU6qYUcIOqmmhar/Hdi2dY8GwuE8QUPUsV+r
	fUlSPB+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQwxm-006k4F-2l;
	Fri, 19 Jan 2024 22:03:46 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQwxj-006k3e-2t
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 22:03:45 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso921145a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 14:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705701822; x=1706306622; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aaVzBMeeZblMbEUbDFmZomg/HzP8H1Gn+gnGtwevNs=;
        b=iOCphZiHqnxjAI9twug+oMhGRSWwhmXhVX33NSLcHhvpQGDUpo0zVXdpH7Fi5Hk0z1
         e8iTkH5x8/P2dCHlHzWslYOAg6U27e2BJKjLYH9qhvA71KJuugoBFzmbB+JBOkOIwKXI
         Tg4zuPeQblaa4ONaSgemQBMF0kL5F07Afa1918Swzot42Rhk8VkZ7BUeOWho4HLz098O
         9HLoLJLz+sccfQPvFWMqEgkA+avjKhMMxGINEtoiEYipPgO8oK8cZoDEdsNHnTbvOzo1
         h6jM6Kdzv1nK9gSr4xH+2SlocxeiEdUuyQDUMjBKZmyJCnPV/o4camWBFWua4ABD89uU
         7iNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705701822; x=1706306622;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aaVzBMeeZblMbEUbDFmZomg/HzP8H1Gn+gnGtwevNs=;
        b=S2jITun0fSD51YEScZQH/B1GuVue1Ks/EwNrlB7YjQATCTR32OTHZjxH4MCWoReCjl
         ULZjdnULvw9od9dC7TfketARXWxQ6/osulVTuasdR0AfWv49qgJVG7tkjd9K+0aZE4/e
         jmQEVfLn4aEBfWJ1qu9mGUq8wW9r3BpVf4WV6+G4sJT6P24XZmA4g3bSTIa9Qia/RB27
         Ky7EyJxCfyfVYlAa9RmDLcdhUnCDLZd/3oet3WW1eX1csy+VDeL7NGzxh1Hc9/66XAiZ
         PyzYwiCnZzLrEY3lG/GkpAvP5FQsK5785eN0eScQHB5eJMb6zg4z3kx/IVdq1T5wsW/M
         2ayA==
X-Gm-Message-State: AOJu0YzRjv8NWT7l7AiMwMBrmZOijVAbh+31s25hjl+x2ZnxqD2agTkp
	lcLUaG9UJrhHPm2LH/BkAS/tEv5G4YOkf/F7FQjLjnObh2e1YszwSh2xm2LHOUfmPszjtCu029q
	c
X-Google-Smtp-Source: AGHT+IGftZP2Jl+VwJV08AVdkfiAwWPWCiEg5yYwDaS6Y+0pO5wM+PStwOKVnAiNRaDx+cdEX7oaxg==
X-Received: by 2002:a17:90b:30c6:b0:28f:f70f:ee60 with SMTP id hi6-20020a17090b30c600b0028ff70fee60mr415981pjb.8.1705701821779;
        Fri, 19 Jan 2024 14:03:41 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id e16-20020a170902cf5000b001d5c38bfa33sm3486111plg.307.2024.01.19.14.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 14:03:41 -0800 (PST)
Date: Fri, 19 Jan 2024 14:03:41 -0800 (PST)
X-Google-Original-Date: Fri, 19 Jan 2024 14:03:11 PST (-0800)
Subject: Re: [PATCH] tty: hvc: Fix the RISC-V SBI driver for a refactoring
In-Reply-To: <20240119215612.20529-2-palmer@rivosinc.com>
Message-ID: <mhng-dd8222be-f59f-4422-8cf5-dbefccf63f5f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
CC: linux-riscv@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
  jirislaby@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  ajones@ventanamicro.com, Atish Patra <atishp@rivosinc.com>, apatel@ventanamicro.com,
  linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_140343_938355_7664BF24 
X-CRM114-Status: GOOD (  19.73  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 19 Jan 2024 13:56:13 PST (-0800), Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> I missed the int->size_t refactoring in f32fcbedbe92 ("tty: hvc: convert
> to u8 and size_t"), which causes the newly used ops in 88ead68e764c
> ("tty: Add SBI debug console support to HVC SBI driver") to fail to
> build due to a
>
> linux/drivers/tty/hvc/hvc_riscv_sbi.c:59:15: error: incompatible function pointer types initializing 'ssize_t (*)(uint32_t, const u8 *, size_t)' (aka 'long (*)(unsigned int, const unsigned char *, unsigned long)') with an expression of type 'int (uint32_t, const char *, int)' (aka 'int (unsigned int, const char *, int)') [-Wincompatible-function-pointer-types]
>         .put_chars = hvc_sbi_dbcn_tty_put,
>
> Fixes: f32fcbedbe92 ("tty: hvc: convert to u8 and size_t")
> Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI driver")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> I now remember Anup pointing this one out, but looks like I forgot about
> it.
> ---
>  drivers/tty/hvc/hvc_riscv_sbi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
> index 2f3571f17ecd..c08718be8e73 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -15,7 +15,7 @@
>
>  #include "hvc_console.h"
>
> -static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
> +static size_t hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)

I got a little lost in my branches here, that should be "ssize_t".  I'll 
send a v2 when I figure out why my tester is acting oddly...

>  {
>  	int i;
>
> @@ -25,7 +25,7 @@ static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
>  	return i;
>  }
>
> -static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
> +static size_t hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
>  {
>  	int i, c;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
