Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BC0C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7ceyiQec1zotSbLHrvetEiWg8IgqJop/iSwQHmjsPg=; b=2UZfN5iB5Mk2jg
	d6o7vVCsUY33tv3Pl01/fYu5AsbSmwOcK9igmDllC4juDcBvMjWtqeLVn9KWtTK1ukjJeAtvtEKB5
	u9AlW8dhcDbioUvgmmEy+B2Oum2GfCtMX6rWicUbywaHb8F3OLDqBM28t9ZrgHXl9neGyDWfZD1Sh
	xtBavVs78yPPwV6mTe+EySjQlrpQbg1+vUCThVQis+gDAkKOcSLfU81WFipW6PRJ5Dai9TowwwYDR
	iuw+Hv/ptUB9tzl9zT9Q/of4Lxr76FMuCU3TBH5MZ9g1VibHUNCXX7fPJ1pfTdQRTvNAgYNGn5mkd
	WfNxE62KwJA5nwnttnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD0VL-0065hj-OB; Sun, 17 Jul 2022 09:23:59 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD0VB-0065cd-42
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 09:23:55 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-10c0052da61so16726445fac.12
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 02:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wc3nIaC4TGrabTRR6ZU1E+ucBztRvo43HV92KBQYbRU=;
        b=So8FmdGXdiOnR6zCREv0x+P+ojGNEOjj5oD7KToP1v5+8NhgYNxjSyZHQfeSyI1oGc
         rdHPDE5x1bJVxFa5rYY4wBLA7NHMc/Yg9o/JQNTnMY2n7fsNLy5P4Lx118tcaqnWgzHX
         5ec8cMrh07QmGjycuYaaK0V419m0Yf8PydnHhY0uaOck3QWpYk9knsKXwIqPgtEu47C/
         LBhfcTDbLxDSZuxRhYJjBo7uvcmHgzO0tSfpTQsnNCx0CKlD/rKgn0YyjQOul2S+riFq
         s0/kiWO4GVkCBHMkmqbEQB1nRu6vuT0V1yTPLRIBAPoqMIaKGq3A62aZIWwMsZGBBbhx
         mAHA==
X-Gm-Message-State: AJIora86rZZgGceO1WdSLtyYW77AJFwWVYCTctPKlvHyUVhVpo8hrWbT
	XWVRnbePSnjQlwm3/yTFoERfDVIaO04mTQ==
X-Google-Smtp-Source: AGRyM1uzQwSUx5nqIMX7lew9SivGT4WGHXs5dTze40anF46XZATKX5RBhGcgXq2bEGWyr/2fIKkozQ==
X-Received: by 2002:a05:6871:85:b0:fe:29a0:4a2c with SMTP id u5-20020a056871008500b000fe29a04a2cmr15263283oaa.249.1658049826982;
        Sun, 17 Jul 2022 02:23:46 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id c4-20020a9d7844000000b0061c74b9ac26sm3520339otm.57.2022.07.17.02.23.46
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 02:23:46 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id l9-20020a056830268900b006054381dd35so7001944otu.4
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 02:23:46 -0700 (PDT)
X-Received: by 2002:a81:af27:0:b0:31c:833f:eda5 with SMTP id
 n39-20020a81af27000000b0031c833feda5mr24448251ywh.358.1658049815479; Sun, 17
 Jul 2022 02:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220717033453.2896843-1-shorne@gmail.com> <20220717033453.2896843-2-shorne@gmail.com>
In-Reply-To: <20220717033453.2896843-2-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 17 Jul 2022 11:23:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUT6nEft8v30sq0WP49RW2qUn+1sunk+ow2_EEyVEieEQ@mail.gmail.com>
Message-ID: <CAMuHMdUT6nEft8v30sq0WP49RW2qUn+1sunk+ow2_EEyVEieEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] asm-generic: Remove pci.h copying remaining code
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
	Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	alpha <linux-alpha@vger.kernel.org>, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	sparclinux <sparclinux@vger.kernel.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-pci <linux-pci@vger.kernel.org>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_022349_204969_72CB5C04 
X-CRM114-Status: GOOD (  25.39  )
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

Hi Stafford,

On Sun, Jul 17, 2022 at 5:35 AM Stafford Horne <shorne@gmail.com> wrote:
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

Thanks for your patch!

> --- a/arch/m68k/include/asm/pci.h
> +++ b/arch/m68k/include/asm/pci.h
> @@ -2,11 +2,14 @@
>  #ifndef _ASM_M68K_PCI_H
>  #define _ASM_M68K_PCI_H
>
> -#include <asm-generic/pci.h>
> -
>  #define        pcibios_assign_all_busses()     1
>
>  #define        PCIBIOS_MIN_IO          0x00000100
>  #define        PCIBIOS_MIN_MEM         0x02000000
>
> +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> +{
> +       return channel ? 15 : 14;
> +}
> +

I thought you were not going to add this?

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
