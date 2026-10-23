Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C353E606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pUMhDmW/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=O8Iixtg2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q+LeVQVNBHwJWun+FLlTKtpoCJ8GjZm0AH3ZvtB12Aw=; b=pUMhDmW/4IueR/OoupC9ihKsTY
	DGWD0CMobTdpH7HFitoa5MHYb+sMB3olcBF3RV8GB3XXMYadsra0CPnuxwPYIjim8aWTcSme/4PBi
	Rlz2dNEw8mio3ZECxAWAZUWhkRMgo16tOXYTtmA1T9U8Dzk8OprUhGc+h0w02x5D/ebK6yx99huFR
	k5X07mpQENK083Ws6C7JkIhhMiotFxIbyurnS41I1L3RBn97psAbCWHDH9e1G6zNBP6DTU7GtxSik
	A5v0ZyyS0qmNIr04UMHBlb2X2oXLGlSLlf24fUtVY8wS0V9wxkf/4LZIAtqvmtiujE7xXvznYmL07
	WR71prAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHMC-0000000GcBh-40og;
	Fri, 23 Oct 2026 15:39:00 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHM9-0000000GcAt-31In;
	Fri, 23 Oct 2026 15:38:58 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69NFc9VP3102952
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 23 Oct 2026 08:38:09 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69NFc9VP3102952
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1792769891;
	bh=z2qBUDb/HEVpnZ0AdLrT9xxIZXcyNTPm5i0euSKeI8A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=O8Iixtg27nerxz4pv3MPQ79Qbkly3Qzdhjb7iI4+o56x6i8BSeIR1xQGCwnY7KKaQ
	 QA0Qg7pDBg5vVmC4UggSsNd6S8W3qav0zjBwEGselkJ0VJy5I7ZrNewKIutUb7AfVm
	 MdkVett81Uf9k7w/9M6Vs9Qyoxeec92PLSHDc6Cl9fwDnysLHD8N+1Ef2Jj1dB1Bez
	 Q/DmdOARJu1F614hVTT4HTy48AJ8iHcZSQvZDYXV0Cb5RUaF6zX8Iqu24NZ3rB/QHw
	 a/FnYpSSLXQYPrCSxXHH5/8CUI5QKVmOH3JXCGBKbQtNNmTk/ivswwNpvRE42ECOtx
	 l5XmL1xVvuk2g==
Date: Fri, 23 Oct 2026 08:38:03 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Thomas Gleixner <tglx@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?ISO-8859-1?Q?Michal_Such=E1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Bpatch_16/18=5D_x86/entry=3A_Get_rid?=
 =?US-ASCII?Q?_of_the_sys=5Fni=5Fsyscall=28=29_indirection?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87y0boze95.ffs@fw13>
References: <20260707181957.433213175@kernel.org> <20260707190254.493733289@kernel.org> <20261022142425.3Wx-RrU5@linutronix.de> <87fqxx1r80.ffs@fw13> <87cxt11ktr.ffs@fw13> <1149A39E-BEBA-46EA-94F4-4DFFC4733EF5@zytor.com> <871p9g1s3w.ffs@fw13> <87y0boze95.ffs@fw13>
Message-ID: <C6D7BF04-4CF7-48D1-93B5-E80D52C2617D@zytor.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_083857_770883_9C172680 
X-CRM114-Status: GOOD (  18.51  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On October 23, 2026 7:24:22 AM PDT, Thomas Gleixner <tglx@kernel.org> wrote:
>On Fri, Oct 23 2026 at 15:09, Thomas Gleixner wrote:
>> On Thu, Oct 22 2026 at 17:22, H. Peter Anvin wrote:
>> Tired brain misread the test output:
>>
>> [RUN]   Running tests under ptrace: modifying the default return
>> [RUN]       Checking system calls with msb = 0 (0x0)
>> [OK]                x32 syscalls 0:-64..-2 returned -ENOSYS as expected
>> [OK]                x32 syscall 0:-1 returned MODIFIED_BY_PTRACE as expected
>> [OK]                x64 syscalls 0:-64..-1 returned -ENOSYS as expected
>>
>> But that's because the "-1" on x32 is actually 0xFFFFFFFF while on x64
>> it's 0x7FFFFFFF.
>>
>> The whole mess comes from using -1 as indicator for syscall abort which
>> is undistinguishable from a syscall(nr=-1).
>>
>> Bah. Let me restore this nonsense.
>
>The real question is how we ended up there. By design or as an
>implementation detail which got later set in stone and the selftest was
>written to test the implementation instead of testing against a
>specification.
>
>I went back in history and in 2.6.12 the behavior was for both i386 and
>x86_64:
>
>  regs->ax = -ENOSYS;
>  syscall_trace_enter();
>  if (syscall_nr < MAX)
>  	do_syscall();
>  ....
>
>IOW, a tracer modification of regs->ax is not overwritten when the
>syscall number is out of range.
>
>Between 2.6.19-rc2 and -rc3 x86_64 was changed to _always_ overwrite
>regs->ax when the syscall number is out of range.
>
>In the 3.8 merge window seccomp introduced the -1 == skip bogosity which
>got fixed up and made "consistent" in several changes afterwards. Just
>that it never reached a state of consistency due to the overloading.
>
>So are we stuck with this behavior or do we sit down and define what the
>correct behavior should be?
>
>Thanks,
>
>        tglx
>
>

Going back on something from 3.8 that is actively used seems unwise. I fear that that ship sailed a long time ago, even though I hate it just as much as you do.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
