Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3575C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ze/b7b5TblkXK5srNDjRWxDey3UdkbBxvx4U5QAnPn8=; b=qqhZFE3EbpqWHc
	r2DwqYcRwK8EGeCAKLLEvh1qScJCa6BoCH+86M3C70tlA+EiHCyo2+35/JOzU7XOhAV2x46fgLBoB
	RKIUwDJC7Rf+o6O/cNHRfdMu3BVIjnDYIMe1FIpy2jbdsg+669bgyuEkI9gqeTVkSFjUzA7WWWMmv
	pSk9knrhqHFfit72a3xWR2O9BNN9F7fAZaAPm63vF/jV7GUoEhmNF57M2IOMy8wf5cqZiNffUzty5
	71pDQ1t768jSKotr5h9ufIDQWwhBtZ5VIwrQWqSTuhtzUw6Gw3NlpDQjP5Zpk7WRN+ZtVZkYIxtXU
	sP1FnQRZ4ZzMW3FxbLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFwP-004zTO-Ce; Fri, 15 Jul 2022 07:40:49 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFwM-004zOU-5x
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 07:40:47 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Msqpq-1nNr8q3UIC-00tGC8 for <linux-riscv@lists.infradead.org>; Fri, 15
 Jul 2022 09:40:41 +0200
Received: by mail-ot1-f46.google.com with SMTP id r22-20020a056830419600b0061c6edc5dcfso2944756otu.12
        for <linux-riscv@lists.infradead.org>; Fri, 15 Jul 2022 00:40:38 -0700 (PDT)
X-Gm-Message-State: AJIora90JHkVoIpEleeve56ibiSbWru7EvqB3DAr1RfGu9GRx4gv6/4D
	6ai74K1lUpiXXCnMWKD7lugFe/OXxYLQn5VRjTw=
X-Google-Smtp-Source: AGRyM1uqN7hbJWu1Kc45V1df/TuEhLpRBy0jFrUgJKDcJEoO7ehMJuFR6t3QFdid1eQbrmQCLxECRTpajxA3X2Ob8Ys=
X-Received: by 2002:a81:1e4d:0:b0:31c:86f1:95b1 with SMTP id
 e74-20020a811e4d000000b0031c86f195b1mr14141207ywe.42.1657870826723; Fri, 15
 Jul 2022 00:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220714214657.2402250-1-shorne@gmail.com> <20220714214657.2402250-2-shorne@gmail.com>
 <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
In-Reply-To: <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 15 Jul 2022 09:40:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3S5crDdUcO0kAgOLVGYgXnkU9D3uo44Wrcu5LdAWCGoQ@mail.gmail.com>
Message-ID: <CAK8P3a3S5crDdUcO0kAgOLVGYgXnkU9D3uo44Wrcu5LdAWCGoQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] asm-generic: Remove pci.h copying code out to architectures
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Stafford Horne <shorne@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nick Child <nick.child@ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>, 
	Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, 
	"open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>, 
	"open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	"open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-pci <linux-pci@vger.kernel.org>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:Avbat61dsLnm3o51p21BI4Sbn0YkAzKRPsy4HszdEzwVmHk3Vls
 ik4ZFThR3KOQqvz1sk/ov9UXJGEPLn6lnmejoZ81WZYThKpa0gl1BL8pk1ifZ21GUz5Owh9
 vQiPtovWBKNvVeH37Md1aVQRb9kxXrhrIwV5DaH56Ti2UALezW7TsvAnONjSqeDC4sgwjBE
 KD5uLwSGQ1EnYZ2HExKQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qsRKztP8lZM=:a2WCuYyzNklUpHm/n6XG4s
 nT28N+zuVVx675o+HMU/FG23E9uGXY/221b3mB+E/QFxOmuL1x+6lHCR5K8DMVq0lejPuqWT6
 fVihb7/V7io4KUstIjSVAdbDqqcYD7HCY9czP7njKaENXpjg1QGFGqdUhLZ0/ls6q35SMQV9b
 Tkc+M8ZcN7s9gKcuVvA+zM3yoMhYpF+QZi9lsk846WBsfbveFEoZCjXfAA4wCb6SdE8WrCmCu
 1mjXSOI2p6LISYE9WIJ3km9Z5MPprfiaHBbsPbJ6fHwDh2nN5qH/U38RW8KsE0Vns48x/6MBu
 1csGmX57/5OAg6dhrpOxuE89DvPqKyqJMSebS31wUdNTCyGzGhn2PBnLlc1jlGiSq+xXTZcIW
 Yl5oBHtJNz4HK5x9OAsQ0Ufu6rB3ylsLCCujUuRwiTs1wCSw9fTvH6PF5KHqNUh5XMtVCxavo
 TA8jUiCQNITHZ2Q2tGCjk/hPS62BzxIa0TDQX+Ibhl6wkKtM8OJJ3m5vZS8D0+bJXlMeQ7L6Y
 hxMuvloHo75NFBtoxEjLfWkII+uwFMrCGgVcdsbSiQsOt/1TTvQHKDprW9aWiJMsXwSjPq3vp
 sITqwipfbZ1TqFbARJ9r+WxRdgiGB7zeLBUGCTYF3MgceRT1J5wX9WsokgsoP0x8UjXkDeizJ
 aYhSY8ktJKsdN9WvmaWxtXlccjqXv3ueLhqC2WX2m6tSByDwrqPHsRM5WGwnFdFj7I5gklZXQ
 TPQZKdNXb6CE9zShWs7gb81P0LHSjQoSACCvEaOxxvHu/Ykw6tKckSifoqOFYIKBIDidyPomE
 VWJv2JG4MbHgEPpTF0IIWKTerLuMSgqvpDRKf0svxgqnZF5dGG5jcN5w6oXjbIW37sreT/CAj
 5LcwQPAA+EBOqCzw/W0g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_004046_526594_1DEC1446 
X-CRM114-Status: GOOD (  19.21  )
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

On Fri, Jul 15, 2022 at 3:45 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Thu, Jul 14, 2022 at 2:47 PM Stafford Horne <shorne@gmail.com> wrote:
>
> > +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > +{
> > +       return channel ? 15 : 14;
> > +}
>
> This addition does not make sense for the xtensa as it isn't even possible
> to enable PNP support (the only user of this function) on xtensa.

Nice catch! I had looked at this function earlier and only tried to infer
which architectures might have this based on who has those interrupt
numbers reserved for ISA devices, but looking at CONFIG_PNP is clearly
better here.

PNP depends on "ISA || ACPI", and this already rules out most
architectures. The remaining ones are:

* x86, ia64, alpha: These clearly use PNP based on-board devices on
   common machines, and use PC-style interrupts

* arm64, loongarch: These select PNP when ACPI is enabled. I don't
   think they actually use PNP, but for the moment the function needs to
  be defined, probably returning 0. Loongarch still lacks PCI support
  though, so asm/pci.h is not yet there.

* arm, mips, powerpc: Only a few older machines in each of these
  support ISA devices, and the function is probably machine specific.
  These all have a custom pci.h already and don't use the asm-generic
  version.

* m68k: there are two that enable CONFIG_ISA and one that enables
  CONFIG_PCI, but nothing that has both, so we don't need this
  function.

In summary, I think only x86 actually uses this function, and it is
correct there, everything else either has its own implementation
or does not need it, so the existing asm-generic/pci.h file can
just be folded into the x86 asm/pci.h. That is a great cleanup.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
