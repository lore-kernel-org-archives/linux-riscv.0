Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E418CCA479
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLtpAZ7jlJNcBAlL8GAcGmNfcMHCyIJKwN7X0jd1Frg=; b=K9sJiiXe/vDsTF
	p9TmFgATQqp2UPotXqNvnzkEMS/kFYpi1QnIi5adwN+qTQM4LRIMsVocDEYr3AUAvYmBjYe7XEsXs
	U4qTUnsM1VDai3JcovJTVUMBwLV4nCVxzglaAsFELeYL164UbuiMkczcsJLKVZHzwJpVvh8zKMyv6
	TTjouINoQZHToPRmTEWWLXkkGP3KnzezPWKv0Dw9eCXiF965nqD6KyOreooneiljAOZlBHwO0KN+v
	a66TDsCMvD0CFgE7mNr6SMgMXj7NA/8JY2o5smM9sErbO3j0eZdLzA03TNWOIwa7ljn217J7wxMA+
	A2v7K2rHJ+Iosqy4N7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDMLs-00Bpxx-UC; Mon, 18 Jul 2022 08:43:41 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDMJP-00BoRW-HJ
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 08:41:09 +0000
Received: from mail-yb1-f178.google.com ([209.85.219.178]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1McH1O-1nfNw304Z2-00cf7i for <linux-riscv@lists.infradead.org>; Mon, 18
 Jul 2022 10:41:03 +0200
Received: by mail-yb1-f178.google.com with SMTP id e69so19597897ybh.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 01:41:02 -0700 (PDT)
X-Gm-Message-State: AJIora9DZgFVQRdNWtCXbYmGvrHlja6XvFc5EuX+j8TeQtUiA3iN1iIR
	NNqcjBbzyU7h+WpFhYjIil2Qc9HoJUPPSCFvG3M=
X-Google-Smtp-Source: AGRyM1v6P9bRfP0SGacMoyNgstO+0kAXXfpT0DxcKtXM2lnDi5JkTyHnmtvpqCyUYAbfe++I5HITDjFfLLAjFIN9yoU=
X-Received: by 2002:a25:9f87:0:b0:669:4345:a8c0 with SMTP id
 u7-20020a259f87000000b006694345a8c0mr25927260ybq.472.1658133650969; Mon, 18
 Jul 2022 01:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220717033453.2896843-1-shorne@gmail.com> <20220717033453.2896843-2-shorne@gmail.com>
 <YtTif+vNq+gkfqsc@infradead.org>
In-Reply-To: <YtTif+vNq+gkfqsc@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Jul 2022 10:40:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a02R651U9Md8DHT33FgSp56Baiw4sNCWCFBPcMi0bB1-g@mail.gmail.com>
Message-ID: <CAK8P3a02R651U9Md8DHT33FgSp56Baiw4sNCWCFBPcMi0bB1-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
To: Christoph Hellwig <hch@infradead.org>
Cc: Stafford Horne <shorne@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michael Ellerman <mpe@ellerman.id.au>, 
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
	"open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	sparclinux <sparclinux@vger.kernel.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:m2rkhGuI/DE9fKfha/SmX2aWC1MORVD0W/dWhfger0f+kyTDIzw
 S8XD0P1u35juNO4nR0mJ7fbrx/AkmqmtASyDNoDa1k7Nt0nJPaII5znw1IL5TF0ZOGpjKmy
 V/ecp7owORn5JNpVY91OH2eGd1wzEJny98xXLUrtOEZBOb/mKyPK79O8MBzEVJD3KyJPYUK
 rzNb4GHzjGLJc3Eeq7gLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0xj6zfq6MTM=:xLcUN12xpzevB6F7qJJ4Ty
 cFLeUoJo3y1/Qd/5Y/C9aXtam0gSEn6mjAC9PHadvsTwcr+yv4ovtuUEd9ceF6U+h+u336RLx
 FCfVgJ66EjTkCM7UwlLAlaVEPKUHto+nIdtzbbbI/KFtrC9vpOZFpNBhSAIRrONBcenlWZQ8n
 C1v8sosBhaKwQRte7v8aOLQGiWUT/oCysQvh4NgU+fNkPqiNskHCZz95HFOGx6nA6Eb3laesd
 BtFaLR4qBnJ/J0FO+CfZj7RSOniF/OKQ+23lP8uFgjvO8E4Sdx2p3/7gQlGCjhW4UyPOfxx7o
 5L0BJJX1VubKWWLcMLF+aFNSPUgF7SdpbCe8C2mYeyL7RSTsCGqfUEUfN9peqb4Avu7Fxz/EX
 ggAS4+0cw/TKNhv2xnU2/onzLGo4Ow0aro6hOfsGLNM4n+0rM7Eep36e1jQbvhD+MbWjUWoHK
 DDVkpSnDzzEg5//9aHXd6+wr2hFxzBFINm0XoSadEVp5DGuH79eLXsmJGdEuK7/OIFefC93fg
 j+dODkaImkH2psfE+JUb+tXVusjjMj/Zoe7nriQM344pWQbLTy0VYE5OZ5aKSN4UCeUaytUcU
 qBzs5k1zDHKdXey0I/KneKxhpGS/GooHmoK+yav3AW9yXa8CzQorGVbv4q0Oaum6M9idxiP5Q
 u/FzPT0RNA0j4kPuXokMMGvB7GzFP/eFi73gkOr1aaih7A+Vj2HNRQ3HaNyQ5aobPFlr6tX1b
 mi3ZzFWY8YdDfpPNRu7MVcXk4gHzB8txRhsQZkGpEOQIxUrMvjumV4tfg53812hmuMdezVplr
 XVld14Qg4DznVPizH8OFK/IXUpeCqQ//YwwLyms/aO54zjA92fNIQjHPTlLsbMyXuFXY3Iy7h
 dux03xzoqv8aOHnd3NJ7j4dhXw530jgfeViNLAmwo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_014107_892939_4734599F 
X-CRM114-Status: GOOD (  20.78  )
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

On Mon, Jul 18, 2022 at 6:33 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sun, Jul 17, 2022 at 12:34:52PM +0900, Stafford Horne wrote:
> > The generic pci.h header now only provides a definition of
> > pci_get_legacy_ide_irq which is used by architectures that support PNP.
> > Of the architectures that use asm-generic/pci.h this is only x86.
>
> Please move this into a separate header, ike legacy-ide.h.  It doens't
> have anyting to do with actual PCI support.

It looks like asm/libata-portmap.h is meant to have this information already,
and this is what libata uses, while drivers/ide used the
pci_get_legacy_ide_irq()
function for the same purpose.

Only ia64 and powerpc have interesting definitions of both, and they
return the same thing, so I think this is sufficient to remove the last caller:

diff --git a/drivers/pnp/resource.c b/drivers/pnp/resource.c
index 2fa0f7d55259..d7a6250589d6 100644
--- a/drivers/pnp/resource.c
+++ b/drivers/pnp/resource.c
@@ -16,7 +16,7 @@
 #include <asm/io.h>
 #include <asm/dma.h>
 #include <asm/irq.h>
-#include <linux/pci.h>
+#include <linux/libata.h>
 #include <linux/ioport.h>
 #include <linux/init.h>

@@ -322,8 +322,8 @@ static int pci_dev_uses_irq(struct pnp_dev *pnp,
struct pci_dev *pci,
                 * treat the compatibility IRQs as busy.
                 */
                if ((progif & 0x5) != 0x5)
-                       if (pci_get_legacy_ide_irq(pci, 0) == irq ||
-                           pci_get_legacy_ide_irq(pci, 1) == irq) {
+                       if (ATA_PRIMARY_IRQ(pci) == irq ||
+                           ATA_SECONDARY_IRQ(pci) == irq) {
                                pnp_dbg(&pnp->dev, "  legacy IDE device %s "
                                        "using irq %d\n", pci_name(pci), irq);
                                return 1;

This is fine on the architectures that currently return an error from
pci_get_legacy_ide_irq() but will change to returning 15/14 instead,
because they do not support ISA devices, so pci_dev_uses_irq()
will never be called either.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
