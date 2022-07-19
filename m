Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13114C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 10:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zI9XhiP3xqhwnfY7ZRJ/b6faldPJ540gahxHMSxVvPc=; b=QCGghk1NocR2AU
	u9lo510SZS8CR4UWD4nEsyKx2fW7eFykXY7x4g71/VtJtDv8Kmj+ni+0M+7/kpJhOU9jkFG0RYusN
	5ZCkz+T3nwunYbv7VMiFys84H61WOp3J749Cb/SSsziMcdgdaFSD0HUxc0d3D41UP5wPiEt9lawkF
	aosCFqIcoifefUdpmTGXl5xGYsd5S5txOePY7UATXrDO3HAsM2L4E5ma8n8/zCCQNBq1DZxEXAlF0
	ZbfMoEDwMkST3mUKYFzxR/Yfo0pzKVQfv4pvJAqUf1a53322n6hzewd+K8U4NBrlHlRZ/HLghQYSj
	2SUDwSmgLJ3TjEXpDzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkpT-0086cD-EI; Tue, 19 Jul 2022 10:51:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkpP-0086Yv-Cu
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 10:51:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id v21so11603259plo.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9r5Q68sSonSuFNnUgS5s5Aq4lQPVRc3ftjUkjt5E+/U=;
        b=BOnJQHOrKNukFMXMC1nU6y4ArvL3vrbcOB435U/Vzx1k1fn6r436k543OFDgaWokoN
         tDErjZCkEJHwVO1H9RQMX6lk34fHev+Aj5/gKGFjtSnH8f4W9B86s0nsqJfg9JeN8ml2
         JpIehp+Baf/hC0iEenp4Vlpui6EBPFyHuw5pyeahpcXpOlX6hXba88BFS6CklcADGLsD
         uF4jiHQM1YmdN8VkpQPyWmk/8xJ0QlGm1a4CTd/3gGsmLRaK9WiL+TrM3sZCWwiys/37
         kJ3jZOnmNy/5GCMbwcqkClcv2x5+kayzRqwLIi+9L4ewDsXPITUTBKitxHlTC+mUPCTq
         HiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9r5Q68sSonSuFNnUgS5s5Aq4lQPVRc3ftjUkjt5E+/U=;
        b=um2EzWVupf1tlh6t/OWrW6qAy6JvitViAT1teWeHouttQIFtrfnBdjGQietDumCowD
         NVCRehFnPRAFOLKA4TVuRIz9wPUkg0+9ug/4WQE67wap+UkzI4Nqp8PX4yIy/ZlSnrfj
         QBDnpHl+lH0wqGK6phd56X9svFX3vbaBaDeCzp/pcjlxqsaMG6mRexxxfI8fPhx3ynn3
         ZmS+QKGQKmdfptk/9Cq53j6JvZiZTYyz97PEK89SDQP8j+scIjyY7A6i+IhdN2APOrWV
         +uD9naMX3tWJBQxO6l0M0C7BKnQVNCkWi0VeshX/AmtXAbngFM4OHvwM56shzmjdzETb
         WmRQ==
X-Gm-Message-State: AJIora8I/zrWmqXniX0fhVicKR4xBo2rsleWrjojfP3N51pPQxWdYTVC
	2Ib+dOsV0M1y/FDh2FdlTbo=
X-Google-Smtp-Source: AGRyM1vZ9IAj9wB2om7mrxhh/fUk9aNQMH63dmua/3Emg6xcerZ0EDmPY1xKNwyujRSIvj70HenApQ==
X-Received: by 2002:a17:90b:3e89:b0:1f0:4233:b20e with SMTP id rj9-20020a17090b3e8900b001f04233b20emr37808145pjb.0.1658227905897;
        Tue, 19 Jul 2022 03:51:45 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id x23-20020a1709027c1700b001696751796asm11299184pll.139.2022.07.19.03.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 03:51:45 -0700 (PDT)
Date: Tue, 19 Jul 2022 19:51:43 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Richard Henderson <rth@twiddle.net>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Nick Child <nick.child@ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	alpha <linux-alpha@vger.kernel.org>,
	"open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	sparclinux <sparclinux@vger.kernel.org>,
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
Message-ID: <YtaMv2kfdxFyDsis@antec>
References: <20220717033453.2896843-1-shorne@gmail.com>
 <20220717033453.2896843-2-shorne@gmail.com>
 <YtTif+vNq+gkfqsc@infradead.org>
 <CAK8P3a02R651U9Md8DHT33FgSp56Baiw4sNCWCFBPcMi0bB1-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a02R651U9Md8DHT33FgSp56Baiw4sNCWCFBPcMi0bB1-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_035147_466101_9CAA8A97 
X-CRM114-Status: GOOD (  29.68  )
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

On Mon, Jul 18, 2022 at 10:40:34AM +0200, Arnd Bergmann wrote:
> On Mon, Jul 18, 2022 at 6:33 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Sun, Jul 17, 2022 at 12:34:52PM +0900, Stafford Horne wrote:
> > > The generic pci.h header now only provides a definition of
> > > pci_get_legacy_ide_irq which is used by architectures that support PNP.
> > > Of the architectures that use asm-generic/pci.h this is only x86.
> >
> > Please move this into a separate header, ike legacy-ide.h.  It doens't
> > have anyting to do with actual PCI support.
> 
> It looks like asm/libata-portmap.h is meant to have this information already,
> and this is what libata uses, while drivers/ide used the
> pci_get_legacy_ide_irq()
> function for the same purpose.
> 
> Only ia64 and powerpc have interesting definitions of both, and they
> return the same thing, so I think this is sufficient to remove the last caller:
> 
> diff --git a/drivers/pnp/resource.c b/drivers/pnp/resource.c
> index 2fa0f7d55259..d7a6250589d6 100644
> --- a/drivers/pnp/resource.c
> +++ b/drivers/pnp/resource.c
> @@ -16,7 +16,7 @@
>  #include <asm/io.h>
>  #include <asm/dma.h>
>  #include <asm/irq.h>
> -#include <linux/pci.h>
> +#include <linux/libata.h>
>  #include <linux/ioport.h>
>  #include <linux/init.h>
> 
> @@ -322,8 +322,8 @@ static int pci_dev_uses_irq(struct pnp_dev *pnp,
> struct pci_dev *pci,
>                  * treat the compatibility IRQs as busy.
>                  */
>                 if ((progif & 0x5) != 0x5)
> -                       if (pci_get_legacy_ide_irq(pci, 0) == irq ||
> -                           pci_get_legacy_ide_irq(pci, 1) == irq) {
> +                       if (ATA_PRIMARY_IRQ(pci) == irq ||
> +                           ATA_SECONDARY_IRQ(pci) == irq) {
>                                 pnp_dbg(&pnp->dev, "  legacy IDE device %s "
>                                         "using irq %d\n", pci_name(pci), irq);
>                                 return 1;
> 
> This is fine on the architectures that currently return an error from
> pci_get_legacy_ide_irq() but will change to returning 15/14 instead,
> because they do not support ISA devices, so pci_dev_uses_irq()
> will never be called either.

I like this, I didn't know about the ATA_PRIMARY_IRQ/ATA_SECONDARY_IRQ macro.
Let me add this to the series before 1/2.  I will keep you as the author via
Signed-off-by annotation.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
