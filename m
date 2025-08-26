Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD25CA0FE9
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 19:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjsW5Mt0IWs9uIFHSs70s8oHw6/Qqyb1LbCWzze07p8=; b=VNRtxiNiefPwjs
	P80SYZrfvqQ0sWpvr8QA7WULxOWZRouKw9jcJtfi+JjI1s1VKSJPORvi2M1EEIaAruKyliU3MfsgG
	PUtkTjAo/V5Ie5kg69lMpvPFGepY1dTR2Q/jFdi4jqHAbFD9iH6ZAQ/c7qzZGBVTWFfUwEHP1d+2l
	gh59jsTxyDlTRH13hUtNUj52kyExNF8ocR2fqk69wovIu+Lj/lsrNu80AHpwpAbN21S0OqhcLbowL
	OU/k/wwOl78F4xj5cxN1UGNafBU0r2E0hgK1/J3pvZUHAEKOxcMeP44rr6RueFJtlci/ki0bYThBC
	ydg9gcFzLn7jyqFATN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzhV-0000000D2ZL-1VjB;
	Tue, 26 Aug 2025 19:51:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzRM-0000000D0JJ-15Qe;
	Tue, 26 Aug 2025 19:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE6EB43C0C;
	Tue, 26 Aug 2025 19:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D17BC4CEF1;
	Tue, 26 Aug 2025 19:34:37 +0000 (UTC)
Date: Tue, 26 Aug 2025 20:34:39 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 10/11] vdso: Drop kconfig GENERIC_VDSO_TIME_NS
Message-ID: <aK4MTxWGoe461HGb@arm.com>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
 <20250826-vdso-cleanups-v1-10-d9b65750e49f@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250826-vdso-cleanups-v1-10-d9b65750e49f@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_123444_316132_009F960E 
X-CRM114-Status: GOOD (  12.92  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 26, 2025 at 08:17:13AM +0200, Thomas Wei=DFschuh wrote:
> All architectures implementing time-related functionality in the vDSO are
> using the generic vDSO library which handles time namespaces properly.
> =

> Remove the now unnecessary kconfig symbol.
> =

> Enables the use of time namespaces on architectures, which use the
> generic vDSO but did not enable GENERIC_VDSO_TIME_NS, namely MIPS and arm.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> =

> ---
> Technically this is still too restrictive, as it prevents architectures
> without a real vDSO to enable CONFIG_TIME_NS. Right now this restriction
> only protects the SPARC vDSO. I have patches to drop it completely,
> as soon as SPARC is usingthe generic vDSO.
> ---
>  arch/arm64/Kconfig                   | 1 -

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
