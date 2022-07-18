Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74348C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 08:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6gcLI3c/9v7iBnbcwhUOt/JdgbUG8tRvU9RNrGcaBc=; b=I2Pv0RXGEe6KK3
	Y+OlxjtWjexhPSdbog4eliNsD7+lzsx+knrPJMnTtRmXOGxdcizfDrqWIhKiiXS80ix+V0Xs+4Ynh
	ZePdxMpwwtaKOXhFNq6bp4aUTXJKlybSzJbg5yMO5e4Mg2AO37KS4GodSruzDLC6s58LTanunl8cX
	I7xqBv8QcylM/H0jVsy2yPZ2jPXR3+AlKUwS7E8OlFEaHDhq3Jf6UmLbPHWLAMcxoDHEOWJMfsOmN
	oEw+U138QF1HgZRwMg72KamjCBYKK+g1UUtJexVNgTHu8jStNTK4N9rGSd5xWxrgNeEEKxKJzm/bg
	iUylapG5D/vjYYwxGDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDM1Z-00BiKT-OM; Mon, 18 Jul 2022 08:22:41 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDM1X-00BiJH-0K
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 08:22:40 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-f2a4c51c45so21918802fac.9
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 01:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EQibuB+HRd3lrCPdCHjd5Kptvz7t3wE5RCUTUbzpTH8=;
        b=VvWO5QHfaWtkcUjV/FfWIzQ8XfJXNYUmno32w3tv2Utj4xolNgtFw4QMMlOGRnUTVf
         Wzxxw47qbI8lub1u6U4C46gexVHsveb5zly/dDH5ZK010YP5hRW76YakcmLrVvQlgfPj
         Gnims7SP7+uHVGikagTzfl5L1DKyHuk5OEhN676kOTB/vlt3NwCMjC+sSLpRBgIMYqmG
         GnqkT8J4jD/c479nXq0hJZNenps4AKSzcdhWOBruiSvknhxy3OSq/TrxLNRsMHV3wRSy
         NFWheXbisGWUc9DNtopUyyRnpN6kQOSSuBU9ZMXEEbFYq67VZdIBOGri2uJdaeUcOkPi
         8b3g==
X-Gm-Message-State: AJIora9knK/Kv/CH8sKuuGG7Tv5OKVksq8gXW2s8UuBQ3ImTtXLT9r8M
	FZAQ4p2lisPC0Wx5aVmkUcMh1kPq6oUVZw==
X-Google-Smtp-Source: AGRyM1vhp8tZWGW08zVVks5hTEPO8APeIXSXN725O9h88rl8lr3BsgMRGSNlZrQc0c/tRj5IdBTI2w==
X-Received: by 2002:a05:6808:1913:b0:337:9c29:1a5e with SMTP id bf19-20020a056808191300b003379c291a5emr12427549oib.192.1658132557092;
        Mon, 18 Jul 2022 01:22:37 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id d8-20020a056870e24800b0010d4aba3339sm1388603oac.42.2022.07.18.01.22.36
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 01:22:36 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id k25-20020a056830169900b0061c6f68f451so8652417otr.9
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 01:22:36 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr28386378ywb.502.1658132545091; Mon, 18
 Jul 2022 01:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220718004114.3925745-1-shorne@gmail.com> <20220718004114.3925745-2-shorne@gmail.com>
In-Reply-To: <20220718004114.3925745-2-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Jul 2022 10:22:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP=1ovo62oXaOXT4ipA9Qb61XQ1e4XVVi1gEi+s+wtTQ@mail.gmail.com>
Message-ID: <CAMuHMdVP=1ovo62oXaOXT4ipA9Qb61XQ1e4XVVi1gEi+s+wtTQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nick Child <nick.child@ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>, 
	alpha <linux-alpha@vger.kernel.org>, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	sparclinux <sparclinux@vger.kernel.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-pci <linux-pci@vger.kernel.org>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_012239_070863_2239AEC4 
X-CRM114-Status: GOOD (  23.80  )
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

On Mon, Jul 18, 2022 at 2:41 AM Stafford Horne <shorne@gmail.com> wrote:
> The generic pci.h header now only provides a definition of
> pci_get_legacy_ide_irq which is used by architectures that support PNP.
> Of the architectures that use asm-generic/pci.h this is only x86.
>
> This patch removes the old pci.h in order to make room for a new
> pci.h to be used by arm64, riscv, openrisc, etc.
>
> The existing code in pci.h is moved out to x86.  On other architectures
> we clean up any outstanding references.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v2:
>  - Remove pci_get_legacy_ide_irq in m68k
> Since v1:
>  - Remove pci_get_legacy_ide_irq for most architectures as its not needed.

>  arch/m68k/include/asm/pci.h    |  2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
