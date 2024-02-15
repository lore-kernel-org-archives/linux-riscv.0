Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB769C48BC4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 17:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4RrG6tzRaxPGrEQAzZf8MQUT0qKRC66L84yzcfOmQiw=; b=lQajYXXdfHwja4VLTJsefpNB9s
	wEY6L7chWJ0f7/1asw6frefxAa0Nb0x0H8ViExtHEw1hj8IWYph7VSj1OWJ1hQHl+680bHsgp591x
	xkRTWeWEpjh9a1PRilMHimWn136INpw1DwH+VLn0kpnR3gtxusJszTyCdDWETCch22pMF0orMyvmo
	myp+S9EpxGYk8hqV9jftWHpaVkD6W32HLudlBhVSbx2Rbu4k9mYvgRM79lTncYubL+XAqJfLtwQzi
	DoONL1jcSrZ4OTcKp4SISSZJJsMcsl+UlWOUP5/he0KNG8lIsZuMnXxrn9zMCAKGAahRB7X5gwtgc
	CkduCDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rafki-0000000HDju-1uXf;
	Thu, 15 Feb 2024 17:42:28 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rafkf-0000000HDiR-20R3
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 17:42:27 +0000
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6940B3F186
	for <linux-riscv@lists.infradead.org>; Thu, 15 Feb 2024 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1708018940;
	bh=itMxjOpdbsY2nONIH8lkAcrbbGF1rBZB+VhIXId8/HU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=l2ZeqQwAAocrpHWBeZTTAgqajoTEdOPTF7QeKr3Y2Qux6fbns32zR8WOPPO5kiOdh
	 mF9bf3ejJ/WW6xjX+BsQZqz0/BtHHJfvgGSCyKpZCwVnJ9ag1ETh0MRFXrbvNZSVoY
	 f0TOeu9Fta5q5PjB4eP+8Ihz1V33P6lK7JwSFNUdiEIg0AEbBRereDkkKM1wUSfwGC
	 dLI38AHa+VBwkIvQJfvk6VY8s8WxOCt+MPHtiD9ip4U+h4FU51Qf1lUcOMeQMoQLoF
	 aGWTm7rm0OTOUK861PBfuilC6+5JShnhhhLeVmRf3jPAL6kQcsjUnhSA/b6TBwUQOJ
	 QpITTinWrQp1w==
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3c02a63d499so2074442b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Feb 2024 09:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708018939; x=1708623739;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itMxjOpdbsY2nONIH8lkAcrbbGF1rBZB+VhIXId8/HU=;
        b=qgzosHbXyAuqG9mL6pbdxhOKuE4MVosFaOww68oGMytQglHoGCOpyrPufKhpUWQ06a
         uHrgyHWZsCuaZs57CPVEUH0PP/fRkBQUDCOyUqujxic+T4seQXBLaHLBvkPeE2Obq9aD
         AG0le86qKQWM9ca0yLXrNxT2lrpBW8RoGpKUUnrfhUIWQkGlFrcIo60DzDXLEV59iZf+
         6p1IC/8oOGvD/zY1ki03iErUghSh0cMPL/VwAcbnww7gceebMkjigDGOdU2RXWUqqB4n
         YfA8mXjBauc6yj0n9RY3mfVOSqQXO0YDpBz9r1oaSHibibsIzQo0IIa+4PsnxIASnGG3
         MTMA==
X-Gm-Message-State: AOJu0YxKPPRcXHNECwgnSXzeUWkp2qknd7yNZZd3MrKsCuSyAMxoGM/I
	xOZ2QnVT1Njh14RuZyh5AKYfPCUHzXaGCFmxhdV8yge/gVJ6CMI+zgVc/OUBjjF9s9Zc1XkL8ik
	kXX6IuoTfvMoQIHYQitYDhWN6dV1QzVJ3akoIImfapd0Ysp2u6Vt1lBnyl+VO2qt+az6Aitu5hp
	r2VU+kk7LRvGL2VM1hiQsl/ByiEIvHjxwx/tu/UV/YjUOCvQGV+HvVRipv
X-Received: by 2002:aca:280f:0:b0:3c0:2fd9:5158 with SMTP id 15-20020aca280f000000b003c02fd95158mr2329568oix.49.1708018939361;
        Thu, 15 Feb 2024 09:42:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHU08R5xI0RL8D+bUo0EqTVGH61HjNxSmKOBg31rT3nGy17WIRkBGvEBXjSjDG3faSm+XLyqVOiwzTPAZ1EUzc=
X-Received: by 2002:aca:280f:0:b0:3c0:2fd9:5158 with SMTP id
 15-20020aca280f000000b003c02fd95158mr2329556oix.49.1708018939131; Thu, 15 Feb
 2024 09:42:19 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Feb 2024 09:42:18 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <e541754cd564253b2da9efa952479c75bb7fd2d6.1708003477.git.geert+renesas@glider.be>
References: <e541754cd564253b2da9efa952479c75bb7fd2d6.1708003477.git.geert+renesas@glider.be>
Mime-Version: 1.0
Date: Thu, 15 Feb 2024 09:42:18 -0800
Message-ID: <CAJM55Z92hpGq2f=CsR6CbDh_OzVO7KcvbouyGXxYgn=hNT_nmg@mail.gmail.com>
Subject: Re: [PATCH resend] riscv: misaligned: Grammar s/disable/disabled/
To: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_094225_795872_C4D95D09 
X-CRM114-Status: GOOD (  13.61  )
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

Geert Uytterhoeven wrote:
> Fix a wrong conjugation of "disabled".
>
> Fixes: 7c83232161f609bb ("riscv: add support for misaligned trap handling in S-mode")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b49016bb5077b860..84b8200f7a625b07 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -706,7 +706,7 @@ config RISCV_MISALIGNED
>  	default y
>  	help
>  	  Say Y here if you want the kernel to embed support for misaligned
> -	  load/store for both kernel and userspace. When disable, misaligned
> +	  load/store for both kernel and userspace. When disabled, misaligned
>  	  accesses will generate SIGBUS in userspace and panic in kernel.
>
>  config RISCV_EFFICIENT_UNALIGNED_ACCESS
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
