Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C2BC61D88
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 01:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HF55BqpYqEUNBHZxLRD4rDmmf8mVJ3XIZSTah1YGME=; b=QADqswKtl2I3lf
	BcoXOWUz9MF+kx9LFJsy90jgrCwxMrn0mzqspu7bjIUPsKQazwvmwj+Omc6f889hpJ2j3L8G9asTi
	vlKJT7FPRC2qBJGQ7S+zrNMtX05PbwB2+jy1oiVXlzKKjDuoJnGWqRAYQBXzK1jya1HjlYxjvVGEz
	4ZX/lQS7EyemuV0ZKxE5213/LOtefX47M3VhbJ0BpBseLtOwfqOoMtQ9ARrk4/rIHQa8uJXIk74hd
	E5efpXTloDLKzZ9oj5EWvuNHk3i/bt74ymxvCR+5JWUoq/uTMUtFZ4yWXB2JFYBQd5yHBfr4lJjsv
	8JBepABDcCC9zuH86GVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5FDj-00FIU3-12;
	Tue, 21 Nov 2023 01:06:31 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5FDd-00FIRO-1a;
	Tue, 21 Nov 2023 01:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700528778;
	bh=a1oDztLoqCcees2awcLjiaomu8bb0ZU8fyFhFCJHT4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oWW1QkZze+kq8dXCMwzP9xmtsiBPKW/hq5HCmqkQq67lD/f/fkTpd/U8FMenAoeLl
	 J1jHM3vpiqO6+SZ8oTRmtfdXJh/kl4ccKcHX93lWk6Fma5jYDgW+qHGJ9G1c3wWEWD
	 7wf1DanMy/hBgRK5n8rOjbSflcR7GKDrM1MFeaKqqOQQlvcOByEoS81ZnH8kRCiVRW
	 Sitlo5WEKfvTkyRjxvm6DcVAjGDg3Q0vGj0AeAoNLiUIP8cnYZXsQFMSjypuMtAUTc
	 2SzMvY2J7oKCYA9k2z45igYP3WpwqyzkKDLwx57xpFYnZrXJC9CTNoEySocvsKn9xW
	 xnByzdpmU0vWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZ5mB3sycz4wd7;
	Tue, 21 Nov 2023 12:06:02 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ignat Korchagin <ignat@cloudflare.com>, eric.devolder@oracle.com
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
 James Bottomley <James.Bottomley@hansenpartnership.com>, deller@gmx.de,
 ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dave.hansen@linux.intel.com,
 x86@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, kernel@xen0n.name,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org,
 paulmck@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 frederic@kernel.org, Andrew Morton <akpm@linux-foundation.org>, Ard
 Biesheuvel <ardb@kernel.org>, samitolvanen@google.com,
 juerg.haefliger@canonical.com, arnd@arndb.de, rmk+kernel@armlinux.org.uk,
 linus.walleij@linaro.org, sebastian.reichel@collabora.com,
 rppt@kernel.org, kirill.shutemov@linux.intel.com,
 anshuman.khandual@arm.com, ziy@nvidia.com, masahiroy@kernel.org,
 ndesaulniers@google.com, mhiramat@kernel.org, ojeda@kernel.org,
 thunder.leizhen@huawei.com, xin3.li@intel.com, tj@kernel.org, Greg KH
 <gregkh@linuxfoundation.org>, tsi@tuyoix.net, bhe@redhat.com,
 hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, kernel-team
 <kernel-team@cloudflare.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
In-Reply-To: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
Date: Tue, 21 Nov 2023 12:05:59 +1100
Message-ID: <87y1er6hl4.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_170625_919310_C5706FCF 
X-CRM114-Status: GOOD (  17.22  )
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

Ignat Korchagin <ignat@cloudflare.com> writes:
> Good day!
>
> We have recently started to evaluate Linux 6.6 and noticed that we
> cannot disable CONFIG_KEXEC anymore, but keep CONFIG_CRASH_DUMP
> enabled. It seems to be related to commit 89cde455 ("kexec:
> consolidate kexec and crash options into kernel/Kconfig.kexec"), where
> a CONFIG_KEXEC dependency was added to CONFIG_CRASH_DUMP.
>
> In our current kernel (Linux 6.1) we only enable CONFIG_KEXEC_FILE
> with enforced signature check to support the kernel crash dumping
> functionality and would like to keep CONFIG_KEXEC disabled for
> security reasons [1].
>
> I was reading the long commit message, but the reason for adding
> CONFIG_KEXEC as a dependency for CONFIG_CRASH_DUMP evaded me. And I
> believe from the implementation perspective CONFIG_KEXEC_FILE should
> suffice here (as we successfully used it for crashdumps on Linux 6.1).
>
> Is there a reason for adding this dependency or is it just an
> oversight? Would some solution of requiring either CONFIG_KEXEC or
> CONFIG_KEXEC_FILE work here?

I don't actually see any reason for CRASH_DUMP to depend on KEXEC or
KEXEC_FILE.

None of the old CRASH_DUMP symbols depended on KEXEC AFAICS. Using
something like:

 $ git diff 89cde455..95d1fef5 | grep -A 3 "^-.*config CRASH_DUMP"

It's reasonable to want to build a kernel that supports CRASH_DUMP (ie.
can be a dump kernel), but doesn't support kexec and requires a regular
reboot. Though I doubt anyone does that in practice?

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
