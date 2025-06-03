Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEB8C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 12:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rj5jXYNcPuMuTtCqh0AZXMwwimb5GdOP20/RNVxiwjg=; b=ZY+sw2bHc16x/Y
	a2oNGbLn7rrw5ZUjVltekJN2CRFrAZ5snK5xFWZPuDhjSyWx+h69WwLCPBvv6VzBQBDzWYeymAia6
	kd/lfITuEpGsPw2c30djZKaZmXvJqjs3yfaKp1g9G+ZVvxYd9pmnSc1et6xxdq6ZyGLh8Wp02iO/7
	3eKT+C0Akd6N3H9vvCSeCFRx0e7U/UfruDtcwiE3UpLCdGaw5ULtIneDt98F3r8w9Xg8Y9R4Wp308
	gq0PFSCDsPU8F/8o8wDSujXnkwA/TqQJjtYkcaH/7uAxa/B4rhqpOd+2tyZWwmCQjvlDt4NDp8wlP
	xHl+/ZO+mRAwXUsKbKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMREM-0000000AyUM-217L;
	Tue, 03 Jun 2025 12:59:02 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMREJ-0000000AyRu-18Z9
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 12:59:01 +0000
Date: Tue, 3 Jun 2025 14:58:47 +0200
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andreas Larsson <andreas@gaisler.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chris Zankel <chris@zankel.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rich Felker <dalias@libc.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
Message-ID: <20250603-sturdy-gaur-of-security-7effbb@l-nschier-aarch64>
References: <20250602181256.529033-1-masahiroy@kernel.org>
 <20250602181256.529033-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602181256.529033-2-masahiroy@kernel.org>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_055859_491738_1A0865E6 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 03, 2025 at 03:12:54AM +0900, Masahiro Yamada wrote:
> The extra-y syntax is deprecated. Instead, use always-$(KBUILD_BUILTIN),
> which behaves equivalently.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/alpha/kernel/Makefile      | 2 +-
>  arch/arc/kernel/Makefile        | 2 +-
>  arch/arm/kernel/Makefile        | 2 +-
>  arch/arm64/kernel/Makefile      | 2 +-
>  arch/csky/kernel/Makefile       | 2 +-
>  arch/hexagon/kernel/Makefile    | 2 +-
>  arch/loongarch/kernel/Makefile  | 2 +-
>  arch/m68k/kernel/Makefile       | 2 +-
>  arch/microblaze/kernel/Makefile | 2 +-
>  arch/mips/kernel/Makefile       | 2 +-
>  arch/nios2/kernel/Makefile      | 2 +-
>  arch/openrisc/kernel/Makefile   | 2 +-
>  arch/parisc/kernel/Makefile     | 2 +-
>  arch/powerpc/kernel/Makefile    | 2 +-
>  arch/riscv/kernel/Makefile      | 2 +-
>  arch/s390/kernel/Makefile       | 2 +-
>  arch/sh/kernel/Makefile         | 2 +-
>  arch/sparc/kernel/Makefile      | 2 +-
>  arch/um/kernel/Makefile         | 2 +-
>  arch/x86/kernel/Makefile        | 2 +-
>  arch/xtensa/kernel/Makefile     | 2 +-
>  21 files changed, 21 insertions(+), 21 deletions(-)
> 

Reviewed-by: Nicolas Schier <n.schier@avm.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
