Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5758FEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zih5BYqznojDxzYaoGaHzfHrWcnMy9qsmN3F5PMNjJA=; b=1kt0sijZ6pKa4L
	3IPvkiZ9AJi8kGG4OG3yD7fn+Gt6+YYJZbFDdZlEGxCrZUDrPgZhEAPkFpj289sEbQcy1EaTEzSIO
	nZZYyAr7oUd9XADN1xDxaXBJEZ56nS3b3g6JT0vLKSkDh9H56hZfLAk77jJpxJOWEWaqYHjiS1S94
	eg9rIzThspqvgTgZHoyks0GCohvKMZ8YRyc6RoiuxXq+D2tN1yT0xDgqbmoq413CNCw9cpYs2q/m6
	muXynqrWGJqcbXIC2VWFxNEt0Use2n46yk+zSnOlSPtFWB6ErznS5qllQOT4gtift4ZjUnAMSDbZF
	Tc02QFrIkCSctL3kiMSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9q2H-00FSeO-2p;
	Thu, 15 Jun 2023 16:41:25 +0000
Received: from gate.crashing.org ([63.228.1.57])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9q2D-00FSdW-0y;
	Thu, 15 Jun 2023 16:41:23 +0000
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 35FGJsTl017085;
	Thu, 15 Jun 2023 11:19:54 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 35FGJqSI017082;
	Thu, 15 Jun 2023 11:19:52 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 15 Jun 2023 11:19:52 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Eric DeVolder <eric.devolder@oracle.com>, linux@armlinux.org.uk,
        catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
        geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.osdn.me, dalias@libc.org, glaubitz@physik.fu-berlin.de,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, peterz@infradead.org,
        linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com,
        kernel@xen0n.name, ardb@kernel.org, tsi@tuyoix.net,
        agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com,
        masahiroy@kernel.org, konrad.wilk@oracle.com,
        sebastian.reichel@collabora.com, samitolvanen@google.com,
        ojeda@kernel.org, juerg.haefliger@canonical.com,
        borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de,
        mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org,
        gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com,
        xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk,
        paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com,
        hbathini@linux.ibm.com, gregkh@linuxfoundation.org,
        kirill.shutemov@linux.intel.com, ndesaulniers@google.com,
        sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com,
        tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Subject: Re: [PATCH v1 10/21] powerpc/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <20230615161952.GD19790@gate.crashing.org>
References: <20230612172805.681179-1-eric.devolder@oracle.com> <20230612172805.681179-11-eric.devolder@oracle.com> <87fs6tflfi.fsf@mail.lhotse>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fs6tflfi.fsf@mail.lhotse>
User-Agent: Mutt/1.4.2.3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_094121_920161_FAEE2852 
X-CRM114-Status: GOOD (  13.10  )
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

On Thu, Jun 15, 2023 at 01:34:25PM +1000, Michael Ellerman wrote:
> Eric DeVolder <eric.devolder@oracle.com> writes:
> > -config KEXEC_FILE
> > -	bool "kexec file based system call"
> > -	select KEXEC_CORE
> > -	select HAVE_IMA_KEXEC if IMA
> > -	select KEXEC_ELF
> > -	depends on PPC64
> > -	depends on CRYPTO=y
> > -	depends on CRYPTO_SHA256=y
> ...
> > +
> > +config ARCH_HAS_KEXEC_FILE
> > +	def_bool PPC64 && CRYPTO && CRYPTO_SHA256
> 
> The =y's got lost here.
> 
> I think they were both meaningful, because both options are tristate. So
> this previously required them to be built-in (=y), whereas after your
> patch it will allow them to be modules.
> 
> I don't know for sure that those options need to be built-in, but that's
> what the code does now, so this patch shouldn't change it, at least
> without an explanation.

This patch shouldn't change it at all, period.  If you want to change it
(and that sounds like a good idea, if it is possible anyway), that
should be a separate patch.


Segher

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
