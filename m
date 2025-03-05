Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77040C28B27
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFu12Kl4rzjZDt6B8XLfwm9KB49ufBpR5kgUhszAcFc=; b=OCXnXrlx9rC+kG
	GIz/2+tRaOpFpcQMdX72qEkSfMfYfEU2EhCOphttYZmDqEEu/M4dA+FLEBD47GuKlEkhHGuVRQR9b
	1zo8d9q8UhXPUTJkgLSvypQIdaRbUQRTbqYFJ0oMAkH1SSuQsTSPJM8vVXVZfk0bBHSkP+MOnZv8D
	gqNYAMnWQMj0/SHpiRGNcuSIOIHo4My2tC78tpCD1H+ozEljuz/2hOdoZ4+V/XqyUcX1gdg0MaBPq
	2qVefImsp55Lma/v+kQbg1SWi1pUaLbcGiM8MvbdFMJg6ktFHTXnWOiOKw5S2qBPwRpfXbLlGlZSH
	7OX7iYcAJMEBmLZ8M+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4p-0000000BU10-28Er;
	Thu, 06 Mar 2025 16:28:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoYJ-000000088oQ-36G9
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Mar 2025 13:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iOdrgfnKDo0adnIeWCzGbGdt+czcdG3OGWY151PLQj4=; b=hbK+Y7tfE0Y+fulWDTgVSgXaFI
	CYt5teZl1jfJhCWTDZfU0d1CwiK5VVEtt6e6LE9TW2EF2Rr4pY59Of+no0QIxO8wTiE0d4z/AWMEm
	krItBRowBWcdH4Z8kVJsW4IOkO3RAavEiYFD4xZtQ9NjQiQny0VsZ3z8R0C8nTMf64hCUOttDpiXt
	6tsqeNSBhx9vXSlkvPQGi0sBa9sNN+if+F7H+oo9K7HWaBGVEkJl4nrSiC1T/Lrv871nae5qRkLi0
	/SOcysIbSgFRUe3Ah0UCLhQY5H1Y8MUc2WwGnosvHGlFwer1HSoitqOdgMN1a3BgdhFyOo0s5zD9s
	RH8wnaUQ==;
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoYD-00000005YDv-3HrY
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 13:12:46 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-474e1b8c935so265521cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 05:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741180358; x=1741785158; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iOdrgfnKDo0adnIeWCzGbGdt+czcdG3OGWY151PLQj4=;
        b=T8XgUQRKwNGfX6FXr3HP9peivIuH6Y6fnwNCfIo6TKqP9qFo+maUn5FrjS4lSTwt9R
         sR/7u4g8KNjGFgtMHJNcS/ZMJRZXbWcWnJgQd20X0u2Noxng+p+KCRD22JWB9HKTgDKt
         /7c0oN31PMdwFJ2lt5y+cSocFAfcyGG5TMZF00Dl+DDEFahDSdQeO5cF5CVB3N2qBVlF
         45tcDy3CB/LuNmyO7v1fYhPI0jtRexcJxnznxGzpI7z59oNYXIjVvllgZYdEgQPiG2Gb
         wxF9uYjxWTYtoMpP/6i11O3tjnvTdNgkAAoUqE+mM7nl8XzPbxLuj8X5GSElKdKigaGk
         2E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180358; x=1741785158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOdrgfnKDo0adnIeWCzGbGdt+czcdG3OGWY151PLQj4=;
        b=MmZL2Qorb7jtSbPinGXnoC4vW3IwZZm2b2JhkBAm1Q0FEoe5wTPUfd/Qj4Btec7q1P
         Ac53qUQV7eManI/rMsp35/9XjxeTLUBK5sYCmXu/6auH/+u8tg0803Ma8rbK0i76wAo3
         XKEwLKFFQI6WlQkeJuzDRAc1YEgDeZJix/0AEFQ7FQVlGTaBEtQ/BD1bkW+diHjidpl/
         4+W9BcIzwByZXUNPafoBND6a1wHvvx8HHLZipNfxeT7yu0eKxd15SH+YzSeG5/ZMYXeK
         TpZSu1x7JGM33tx3Ks6tJaSd+xeqca1FPhDxo58tv/UV05uc5RgGuNPdPBK7nVukeu3P
         Oh1A==
X-Forwarded-Encrypted: i=1; AJvYcCU/OoGebVds7pI5qGhSiMUvSsfK3NWeDq8DisVNZXAb6InI8lL2PhIa66zTr6QzcIuALJT+PH3iURQzNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwIFUQBuB4VtgDLlQBCimbbclvecXmQGxOl3RF/jB6qzFH/Gzw
	ciZFRWDgdRJ79tNQz/nEwPNgSfzIGsBNIK6x66iHzaMgF0KxuGT6gdHkAhOW1RWwsX1Xfww8xg5
	DAnPf4ZS6iFxmoDI7DLTEczmo64ZyTi5tgOWb
X-Gm-Gg: ASbGncufytz9xYyTmu3aPZi1ubIjgiGgTcyYKVEbbux6zmhhRcQR5r+eehMtzD/QCxj
	O77KTsUqmANvQ6TPxCqfef54xgFNefUN3bOI0kdZsJaspuqJlx/lRJuKOk/OShbDrIhHqwbEl+7
	SGgMCDiZBw68WkEtbu5Y1vzoyXK2r5HxtAOb4c8QLBEpufmBJvOW2aZWHZ
X-Google-Smtp-Source: AGHT+IFIn6b7M1PNu9NZZ9KBzOuRO4deZPOixhL9M73rMvQkDHUtfUtYPha+8DdwHlmaLHcT+urAybKKpNAnQK1YFdU=
X-Received: by 2002:a05:622a:110b:b0:471:f560:27dc with SMTP id
 d75a77b69052e-4750cae2127mr2406081cf.27.1741180357471; Wed, 05 Mar 2025
 05:12:37 -0800 (PST)
MIME-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-2-8419288bc805@google.com> <Z8K2B3WJoICVbDj3@kernel.org>
In-Reply-To: <Z8K2B3WJoICVbDj3@kernel.org>
From: Brendan Jackman <jackmanb@google.com>
Date: Wed, 5 Mar 2025 14:12:25 +0100
X-Gm-Features: AQ5f1JrEWoe__i5J-gwzMxiuWZ9pJYk4XLPMWAQuPYUSu5vOhjZQNejm22RSyYE
Message-ID: <CA+i-1C06Sunj0BmFON=MbWBK6ZDt_=K4P3BHChRBYyxXqEkQ2g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 02/29] x86: Create CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
To: Mike Rapoport <rppt@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Junaid Shahid <junaids@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_131241_838718_E368D726 
X-CRM114-Status: GOOD (  26.03  )
X-Mailman-Approved-At: Thu, 06 Mar 2025 08:27:49 -0800
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

On Sat, Mar 01, 2025 at 09:23:51AM +0200, Mike Rapoport wrote:
> Hi Brendan,
>
> On Fri, Jan 10, 2025 at 06:40:28PM +0000, Brendan Jackman wrote:
> > Currently a nop config. Keeping as a separate commit for easy review of
> > the boring bits. Later commits will use and enable this new config.
> >
> > This config is only added for non-UML x86_64 as other architectures do
> > not yet have pending implementations. It also has somewhat artificial
> > dependencies on !PARAVIRT and !KASAN which are explained in the Kconfig
> > file.
> >
> > Co-developed-by: Junaid Shahid <junaids@google.com>
> > Signed-off-by: Junaid Shahid <junaids@google.com>
> > Signed-off-by: Brendan Jackman <jackmanb@google.com>
> > ---
> >  arch/alpha/include/asm/Kbuild      |  1 +
> >  arch/arc/include/asm/Kbuild        |  1 +
> >  arch/arm/include/asm/Kbuild        |  1 +
> >  arch/arm64/include/asm/Kbuild      |  1 +
> >  arch/csky/include/asm/Kbuild       |  1 +
> >  arch/hexagon/include/asm/Kbuild    |  1 +
> >  arch/loongarch/include/asm/Kbuild  |  3 +++
> >  arch/m68k/include/asm/Kbuild       |  1 +
> >  arch/microblaze/include/asm/Kbuild |  1 +
> >  arch/mips/include/asm/Kbuild       |  1 +
> >  arch/nios2/include/asm/Kbuild      |  1 +
> >  arch/openrisc/include/asm/Kbuild   |  1 +
> >  arch/parisc/include/asm/Kbuild     |  1 +
> >  arch/powerpc/include/asm/Kbuild    |  1 +
> >  arch/riscv/include/asm/Kbuild      |  1 +
> >  arch/s390/include/asm/Kbuild       |  1 +
> >  arch/sh/include/asm/Kbuild         |  1 +
> >  arch/sparc/include/asm/Kbuild      |  1 +
> >  arch/um/include/asm/Kbuild         |  2 +-
> >  arch/x86/Kconfig                   | 14 ++++++++++++++
> >  arch/xtensa/include/asm/Kbuild     |  1 +
> >  include/asm-generic/asi.h          |  5 +++++
> >  22 files changed, 41 insertions(+), 1 deletion(-)
>
> I don't think this all is needed. You can put asi.h with stubs used outside
> of arch/x86 in include/linux and save you the hassle of updating every
> architecture.

...

> If you expect other architectures might implement ASI the config would better
> fit into init/Kconfig or mm/Kconfig and in arch/x86/Kconfig will define
> ARCH_HAS_MITIGATION_ADDRESS_SPACE_ISOLATION.

...

> > +++ b/include/asm-generic/asi.h
> > @@ -0,0 +1,5 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_GENERIC_ASI_H
> > +#define __ASM_GENERIC_ASI_H
> > +
> > +#endif
>
> IMHO it should be include/linux/asi.h, with something like
>
> #infdef __LINUX_ASI_H
> #define __LINUX_ASI_H
>
> #ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
>
> #include <asm/asi.h>
>
> #else /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
>
> /* stubs for functions used outside arch/ */
>
> #endif /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
>
> #endif /* __LINUX_ASI_H */

Thanks Mike! That does indeed look way tidier. I'll try to adopt it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
