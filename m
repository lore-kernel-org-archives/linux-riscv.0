Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4B6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 02:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aUQcKtINyMzARFX3+fhqcQB9La5M7Vt+4JrV2iFjo4=; b=KzhNqGs4tpN3DK
	WqiW8OHwvVBhIqtZZA6ggy4v3yNrQO5i2t/1hr+OQtIcVFO+3L/FbEOIuGXgYEwCyi3lAomDcdaWP
	pqVNEvYJaorO3iwX8auNjanQdwqHNpkqg69CkAtriVJsgzMqi4MeISNsXsM7oU27UFndC6uyC2o64
	+kpK+sVFDi2jR9W9DaueWh07FckoKdfv6utbS7mFm++E8lKA5Auf2GsrzmX+/xW2HJMxtvIIfcg6x
	qEocZhpejz+TNj4E1YD5vKp9mFdDkc1hkYyRTZqkIO+dy2/EeMAGjxPzRJAcz0+nEYTnPDyuWUOnQ
	XbdLxbQEpkjTvcHVQTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCB3U-003Yuc-UK; Fri, 15 Jul 2022 02:27:48 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCB3S-003YtD-5x
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 02:27:47 +0000
Received: by mail-pf1-x42a.google.com with SMTP id 70so3500386pfx.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 19:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2PHQEHiPUK5/kMXd0Tiaa/2KkMXqEO7YBVcbpRdWkzU=;
        b=IEJMJOhzDLt+yfASXyPdeXR1oGGTsGDx3vl/pKDJYU0fM7xGoEYifRYmndgoDBn8V+
         8KaH2UOTKaWNm2bcmSVrDZgCQRS5bZdc/JErVv0oiKI4D779tqf8qqqo8Y4iLSedLKu6
         KJvBrd7MyyR0lBJJ++sR+EsLWE8c5/Kb5Z0fTJPJtZS1NwarGIQrRHk8mNKtsfmdVnsk
         DdHkjkVUI3Go5QJOuWJ7tFYeVZyOTWJ1DVFRKCXBlPEbNV+fVinpn4yVP5n1HJQodgh9
         gnwtaOMTLLw/5pbt9rN0/tXbYqausx/cGWYNWZ3PmgEiWfJZrxEj2bcNKssaqRx0mKTs
         9LaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2PHQEHiPUK5/kMXd0Tiaa/2KkMXqEO7YBVcbpRdWkzU=;
        b=uCWbAa+d0fmQ8myTganBREjMXMKH/l0RXyxbUbiur+jdJgeKk5Khr/i0lU0DScLUkL
         lih0GTBWLeE3Etd3qTDJuQVELHsfh3Iy95Qfey5gn539YnoaBvFVqcqDUKMkSCN97rh+
         L1O9DiqSrVQLtbdBXZn08z4dGPbU0Ch/BhMG813oc5hG7nFqqp6hoWrCJ1jZVwdk8AC9
         SLe6lKdEuBoG/O3uR5xuNodw3OdPNZYQxT//qGVBO9rw5yBo150tlU+8O17iroNFppBl
         A5kis9V2DjMEUEwyKg0uhj2JgKjyAI/0YvRi2171QFrAPEeUjQCAVqDEtSXYNbMWhjep
         VTeA==
X-Gm-Message-State: AJIora/tKPzjTxXgZgX9X2zFq2tw9RXIVzfEUP0iNGIPipG9/RLYPAvM
	7Ty0kZcr6IQSLfOeswZYAQc=
X-Google-Smtp-Source: AGRyM1tFpAPO14ibbARmvlyA7Dm2i3y8ihIra24Y5oG5D9v2V9oCrT80IZwFQQ8AdtfnaIGZOBL3gA==
X-Received: by 2002:a63:9547:0:b0:408:be53:b599 with SMTP id t7-20020a639547000000b00408be53b599mr10179125pgn.463.1657852063244;
        Thu, 14 Jul 2022 19:27:43 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id v22-20020a631516000000b0040caab35e5bsm1998257pgl.89.2022.07.14.19.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 19:27:42 -0700 (PDT)
Date: Fri, 15 Jul 2022 11:27:41 +0900
From: Stafford Horne <shorne@gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
	"maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Nick Child <nick.child@ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
	"open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>,
	"open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390 <linux-s390@vger.kernel.org>,
	"open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
	linux-pci@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [RFC PATCH 1/2] asm-generic: Remove pci.h copying code out to
 architectures
Message-ID: <YtDQnQOeDF6RID4g@antec>
References: <20220714214657.2402250-1-shorne@gmail.com>
 <20220714214657.2402250-2-shorne@gmail.com>
 <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_192746_305484_C0D06275 
X-CRM114-Status: GOOD (  24.81  )
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

On Thu, Jul 14, 2022 at 06:45:27PM -0700, Max Filippov wrote:
> On Thu, Jul 14, 2022 at 2:47 PM Stafford Horne <shorne@gmail.com> wrote:
> >
> > The generic pci.h header provides a definition of pci_get_legacy_ide_irq
> > which is used by architectures that use PC-style interrupt numbers.
> >
> > This patch removes the old pci.h in order to make room for a new
> > pci.h to be used by arm64, riscv, openrisc, etc.
> >
> > The existing code in pci.h is moved out to architectures.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >  arch/alpha/include/asm/pci.h   |  1 -
> >  arch/ia64/include/asm/pci.h    |  1 -
> >  arch/m68k/include/asm/pci.h    |  7 +++++--
> >  arch/powerpc/include/asm/pci.h |  1 -
> >  arch/s390/include/asm/pci.h    |  6 +++++-
> >  arch/sparc/include/asm/pci.h   |  5 ++++-
> >  arch/x86/include/asm/pci.h     |  6 ++++--
> >  arch/xtensa/include/asm/pci.h  |  6 ++++--
> >  include/asm-generic/pci.h      | 17 -----------------
> >  9 files changed, 22 insertions(+), 28 deletions(-)
> >  delete mode 100644 include/asm-generic/pci.h
> 
> [...]
> 
> > diff --git a/arch/xtensa/include/asm/pci.h b/arch/xtensa/include/asm/pci.h
> > index 8e2b48a268db..f57ede61f5db 100644
> > --- a/arch/xtensa/include/asm/pci.h
> > +++ b/arch/xtensa/include/asm/pci.h
> > @@ -43,7 +43,9 @@
> >  #define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
> >  #define arch_can_pci_mmap_io()         1
> >
> > -/* Generic PCI */
> > -#include <asm-generic/pci.h>
> 
> Ok.
> 
> > +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > +{
> > +       return channel ? 15 : 14;
> > +}
> 
> This addition does not make sense for the xtensa as it isn't even possible
> to enable PNP support (the only user of this function) on xtensa.

Thanks for your feedback, this is the kind of feedback I was hoping to fish out
with this patch.  I will look into completely removing this then.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
