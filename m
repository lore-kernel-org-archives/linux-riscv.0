Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811C1C7619A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oE7XcGEBjYqsUbqE7c3Yw//Iq5kpRHscuijiobfrYeI=; b=2HKVcaXiX+1Ke2
	wr4GcR1645LwrDWmhT3zFHjIq0lrK1preb3i9qX12zQ7FubTzcQhcg510+r94smxuWqHrfq1K8M/a
	uSzDap5OfQjWvRR3jBp0XvRmqVTAHWyBNTWL4RO2TSRe35W5HqhoUDo87SMIVztZzo3eSSlzMCA6c
	yEp/8f8krjhu2M5oPPw9gHZi30qLB2aVTJdHs5FTcqlwTZmHRbURI8YZuNzQ9yeoioDBxTFtCX0o1
	nPuiLVGcCjbKl1rfRhU5cyEsbZHJ3BxYnodFud7n5AXj0mj+2M6UxQApz/HI6VejHVSkzonbIufet
	ZOKpSFyj72SWRLOvvLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9MW-005a08-0Y;
	Wed, 05 Apr 2023 20:04:08 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9MT-005Zyw-19;
	Wed, 05 Apr 2023 20:04:07 +0000
Received: from [127.0.0.1] ([73.223.221.228])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 335K0Sot3654908
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 5 Apr 2023 13:00:29 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 335K0Sot3654908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023030901; t=1680724836;
	bh=e+7idCFcOldUdf6Kn1N4qPSHOAd8AGbMfDqGpl68/MY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EcXIoUqgD3GVk8dx9ASffLO9ApOOB/n4lbb3fej1ORvYHN0/iMb/OoqoAXejO+Zl0
	 Rw/g8eHLmO+3g1cgp+fB4K8y/Tv66bULY41CG0VNoNe1xXssQzoSffnMPSdWphcYwf
	 ZzGlpNJKo4CsJ2a2nk0pmTpZD0wBYq7o8dQL4gvncAtMrlBPm5aJCuPjVQ630EH6kU
	 RTKT9BP7sk08N3WlXh3R+KcPbOQKrbUAmaN/sN+VsgfhU1MyFvVfA0l5ideAWavhGi
	 1hSCNrnhuIGoxexs5BAE4C0+dBVdtOYUI9AG6FgCpZuqROhanSelavXMtP8wX3ELEQ
	 7+LEVmStcCTzw==
Date: Wed, 05 Apr 2023 13:00:27 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
        Arnd Bergmann <arnd@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_Kconfig=3A_introduce_HAS=5FI?= =?US-ASCII?Q?OPORT_option_and_select_it_as_necessary?=
User-Agent: K-9 Mail for Android
In-Reply-To: <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
References: <20230323163354.1454196-1-schnelle@linux.ibm.com> <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
Message-ID: <B1EC1AC7-6BB5-4B66-B171-24687C3CBFB3@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_130405_402624_2E521296 
X-CRM114-Status: GOOD (  20.07  )
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

On April 5, 2023 8:12:38 AM PDT, Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>On Thu, 2023-03-23 at 17:33 +0100, Niklas Schnelle wrote:
>> We introduce a new HAS_IOPORT Kconfig option to indicate support for I/O
>> Port access. In a future patch HAS_IOPORT=n will disable compilation of
>> the I/O accessor functions inb()/outb() and friends on architectures
>> which can not meaningfully support legacy I/O spaces such as s390.
>> 
>> The following architectures do not select HAS_IOPORT:
>> 
>> * ARC
>> * C-SKY
>> * Hexagon
>> * Nios II
>> * OpenRISC
>> * s390
>> * User-Mode Linux
>> * Xtensa
>> 
>> All other architectures select HAS_IOPORT at least conditionally.
>> 
>> The "depends on" relations on HAS_IOPORT in drivers as well as ifdefs
>> for HAS_IOPORT specific sections will be added in subsequent patches on
>> a per subsystem basis.
>> 
>> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
>> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
>> Acked-by: Johannes Berg <johannes@sipsolutions.net> # for ARCH=um
>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>> ---
>> Note: This patch is the initial patch of a larger series[0]. This patch
>> introduces the HAS_IOPORT config option while the rest of the series adds
>> driver dependencies and the final patch removes inb() / outb() and friends on
>> platforms that don't support them. 
>> 
>> Thus each of the per-subsystem patches is independent from each other but
>> depends on this patch while the final patch depends on the whole series. Thus
>> splitting this initial patch off allows the per-subsytem HAS_IOPORT dependency
>> addition be merged separately via different trees without breaking the build.
>> 
>> [0] https://lore.kernel.org/lkml/20230314121216.413434-1-schnelle@linux.ibm.com/
>> 
>> Changes since v3:
>> - List archs without HAS_IOPORT in commit message (Arnd)
>> - Select HAS_IOPORT for LoongArch (Arnd)
>> - Use "select HAS_IOPORT if (E)ISA || .." instead of a "depends on" for (E)ISA
>>   for m68k and parisc
>> - Select HAS_IOPORT with config GSC on parisc (Arnd)
>> - Drop "depends on HAS_IOPORT" for um's config ISA (Johannes)
>> - Drop "depends on HAS_IOPORT" for config ISA on x86 and parisc where it is
>>   always selected (Arnd)
>> 
>
>Gentle ping. As far as I can tell this hasn't been picked to any tree
>sp far but also hasn't seen complains so I'm wondering if I should send
>a new version of the combined series of this patch plus the added
>HAS_IOPORT dependencies per subsystem or wait until this is picked up.
>
>Thanks,
>Niklas
>
>

You need this on a system supporting not just ISA but also PCI.

Typically on non-x86 architectures this is simply mapped into a memory window.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
