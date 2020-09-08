Return-Path: <SRS0=Gbtx=CR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2F9C433E2
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2020 07:00:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E392218AC
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2020 07:00:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J+mtI6lU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E392218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nEFLVcJ7L9E4WZm8MFVExSD5A1HgVBmg78Xng/uWKTQ=; b=J+mtI6lUxmFyr3IIrvQ8dz6mm
	lkAsxRocGdPtlJVb9DlfV2LaNs2EMzBAvRf/9tv+Apgz13k8k4MWAfWQc4nQlzdMLSjpPjmldmYdm
	faglhiT4tTCXJ2aJpw2vNZ+Ea8eSmAUwxmy7RYmgV6dVVlF8/z5P4Dlp093K2PVhxNlCGUed1rUl+
	7gfByZkWQtSlqn3GoxeA5/FB84Z3+5MhQvwc/Bb6zAJXWMjY0ADF9TZkpCzKlzchu6Eyhu7jcMjH+
	DM9UaAamI0AU59VwTGEPfX+0WJrSYBpy4Og6kcBHt1BtkAD+pq2LpzQ/t2vqbFN01FkiK7t/ghGoT
	uPG8NsPYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFXbn-0007EE-3f; Tue, 08 Sep 2020 07:00:03 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFXbk-0007D7-Ez; Tue, 08 Sep 2020 07:00:01 +0000
Received: by mail-oi1-f194.google.com with SMTP id 3so15577864oih.0;
 Mon, 07 Sep 2020 23:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=80BY8rNg7RfD6oxznXYOKPcFZuo8wajfOpZ0OBeC/wY=;
 b=ll+syRKj0hdrnpMOh4TCbHoz6ZPaanM5I4HR4tC41YIBtaWKg/qe1i708GczHeczOD
 Uh39stFiI+3raID2fZowBz3Q8bQqj7sYkJ0o36CEUbVQsEb50h1TUihan3UBxRGu6UEW
 qCABAKiEuCbXqQ873oMjxBfFZzmqxffwxrUa0N40xTdVLWdpw88hvFK8QdwwtaohUd8B
 y46dlU8v+W/OwFLhY2WWRvuGVbZThd6ezwvsj+/TCs68s3WUZE01OhwaDBWXXj6foxtv
 jSmyeGdYzDEhBv/KUlpeQNkiqEx98/yXG79jycet7M6PsJA0JdPNI0DJsbiyN+wwbcnE
 XLqA==
X-Gm-Message-State: AOAM533lS+TIGS2eSHsnjWCLqZOe8JpzOzbj7GASQs90BrfOvFd5WgAM
 LckFJ3+gPvrIlyCY3h4x2uMPlkZm9JZtmJaZJhs=
X-Google-Smtp-Source: ABdhPJw+Sdn/Kf/NbESMrEGT3ykKzS7L5e1uWHMt5PE98XyXUrM0snkLRMMoZ/Q/NW5lb7vt9j4vz11Ltnr3Qr8PC/E=
X-Received: by 2002:aca:b742:: with SMTP id h63mr1711017oif.148.1599548399253; 
 Mon, 07 Sep 2020 23:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200908042708.2511528-1-masahiroy@kernel.org>
In-Reply-To: <20200908042708.2511528-1-masahiroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2020 08:59:48 +0200
Message-ID: <CAMuHMdVobzKWKnN0ScqSY+Jv3N1ri8=mWEd-SZfH5+je+CVVcQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: preprocess module linker script
To: Masahiro Yamada <masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_030000_790142_82492718 
X-CRM114-Status: GOOD (  18.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Linux-Arch <linux-arch@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Tony Luck <tony.luck@intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jessica Yu <jeyu@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 8, 2020 at 6:29 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> There was a request to preprocess the module linker script like we
> do for the vmlinux one. (https://lkml.org/lkml/2020/8/21/512)
>
> The difference between vmlinux.lds and module.lds is that the latter
> is needed for external module builds, thus must be cleaned up by
> 'make mrproper' instead of 'make clean'. Also, it must be created
> by 'make modules_prepare'.
>
> You cannot put it in arch/$(SRCARCH)/kernel/, which is cleaned up by
> 'make clean'. I moved arch/$(SRCARCH)/kernel/module.lds to
> arch/$(SRCARCH)/include/asm/module.lds.h, which is included from
> scripts/module.lds.S.
>
> scripts/module.lds is fine because 'make clean' keeps all the
> build artifacts under scripts/.
>
> You can add arch-specific sections in <asm/module.lds.h>.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Tested-by: Jessica Yu <jeyu@kernel.org>
> Acked-by: Will Deacon <will@kernel.org>

>  arch/m68k/Makefile                                     |  1 -
>  .../{kernel/module.lds => include/asm/module.lds.h}    |  0

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
