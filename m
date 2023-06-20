Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499EBEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wK4t4KpzO0it8PUO9YvWDWBYKzFCf6KDrTfjXDHVGlo=; b=tDJD+n2DicIiAd
	q58Mc6wDw5+OLoHWnbEnyOjmpwoNIJV32DrqoGehhiX8yWuFMHwUNSL1OXQZblLMSZZIOJnHah98y
	KRwi9cR72JAVjbbQxa8gRkeY7NsnBn13xFShVwjBpkReifsLh7uvEJrKnJrCIE/qa4UIUSo3K27qz
	iISvT/xt/c0zmjC69Z+cjwE5+uJozT0+Ox1BsgRxa/W8Ilw8p2r5qkNPKBgYSxSAMT1LFzpd+kN3g
	D1rpkkSE9kjfnCS42F70gMIo5A+0RsY+nQASsyKd8h+6IxoCteDrUgYhUMYpYmVKW8xXFvhcDFpyc
	8sKt5lQrWmRQzlBx9pYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBarH-00BJ2f-12;
	Tue, 20 Jun 2023 12:53:19 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBarC-00BJ0E-2k;
	Tue, 20 Jun 2023 12:53:17 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1qBaqt-000884-00; Tue, 20 Jun 2023 14:52:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AD602C03C3; Tue, 20 Jun 2023 14:52:36 +0200 (CEST)
Date: Tue, 20 Jun 2023 14:52:36 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, geert@linux-m68k.org,
	James.Bottomley@HansenPartnership.com, deller@gmx.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
	keescook@chromium.org, paulmck@kernel.org, peterz@infradead.org,
	frederic@kernel.org, akpm@linux-foundation.org, ardb@kernel.org,
	samitolvanen@google.com, juerg.haefliger@canonical.com,
	arnd@arndb.de, rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org,
	sebastian.reichel@collabora.com, rppt@kernel.org,
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
	ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
	mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
	xin3.li@intel.com, tj@kernel.org, gregkh@linuxfoundation.org,
	tsi@tuyoix.net, bhe@redhat.com, hbathini@linux.ibm.com,
	sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v2 08/13] mips/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <20230620125236.GF10520@alpha.franken.de>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-9-eric.devolder@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230619145801.1064716-9-eric.devolder@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_055315_198492_BE84A90E 
X-CRM114-Status: GOOD (  11.13  )
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

On Mon, Jun 19, 2023 at 10:57:56AM -0400, Eric DeVolder wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/mips/Kconfig | 32 +++++---------------------------
>  1 file changed, 5 insertions(+), 27 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
