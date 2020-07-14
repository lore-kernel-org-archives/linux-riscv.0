Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A289C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 10:28:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 636E722203
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 10:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dc+6s1c/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlVqa27f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 636E722203
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jnhwge6n4NSFWiF8EraTnNOaO2hO6wuFmcaVvc5dZXA=; b=Dc+6s1c/P0N+tPiuum6qNfmcj
	dBSfsKC5XCiyO3GOV8x5NuYDl//suHOq1uujaMgd4qrIOCxH6UMbC37IMQDV/wnm7xBsETgWhXN4Y
	oXeB11MUnjuaM6NKiiI2ocy0p47+No9WvNJCvCDkWb4TfL/W1pouz6P3FcuSl6KLmh9uIkspvLv/S
	L063wipO1vOEiCfkxjlUo0QyWXQWvJ0bjhL/Ekr6HHEaKoXVTBTD4YUa683PaB+JA73CRYMq3dCgg
	XzNO/cpC5ZvjnBMCLpsemRI0kl2dMxlX057PlVpAMbUSowcjdv5NALoZiKNzpUaM1swChLbXUuaKh
	dayKVcunw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvIB6-00064F-IB; Tue, 14 Jul 2020 10:28:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvIB3-000633-Iz; Tue, 14 Jul 2020 10:28:46 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97C4621D7D;
 Tue, 14 Jul 2020 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594722524;
 bh=mPVDK+qqH1tm3N93m2yLoFOn1KwcBbsmaZp8CSAbvt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QlVqa27f64ZyOpN17giIVIcdHXfBXxkKLs/DEyTrdikrv9OrVpmokkY3cInzl9WLL
 6fYOUia8bpoQPhnLuw932q4ELdtJbimgWTEXvXrdrtWg3SmzG6137eYwe9LG/DY93n
 ykErTEx0kh6ObREVI3LGK7h0SuVz8U9mJEHLV7Kw=
Date: Tue, 14 Jul 2020 11:28:27 +0100
From: Will Deacon <will@kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Message-ID: <20200714102826.GB4756@willie-the-truck>
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_062845_756863_05464EE3 
X-CRM114-Status: GOOD (  29.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Paul Mackerras <paulus@samba.org>,
 Zong Li <zong.li@sifive.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Petr Mladek <pmladek@suse.com>, Brian Gerst <brgerst@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Kosina <jkosina@suse.cz>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Philipp Rudo <prudo@linux.ibm.com>,
 Torsten Duwe <duwe@lst.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Vincent Chen <deanbo422@gmail.com>, Omar Sandoval <osandov@fb.com>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 John Fastabend <john.fastabend@gmail.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Yonghong Song <yhs@fb.com>, Iurii Zaikin <yzaikin@google.com>,
 Andrii Nakryiko <andriin@fb.com>, Thomas Huth <thuth@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Damien Le Moal <damien.lemoal@wdc.com>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Nayna Jain <nayna@linux.ibm.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Babu Moger <Babu.Moger@amd.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Ben Dooks <ben-linux@fluff.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>,
 Sven Schnelle <svens@stackframe.org>, Ard Biesheuvel <ardb@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Jiri Olsa <jolsa@redhat.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, KP Singh <kpsingh@chromium.org>,
 Dmitry Vyukov <dvyukov@google.com>, Nick Hu <nickhu@andestech.com>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 12:45:36PM +0300, Jarkko Sakkinen wrote:
> Rename module_alloc() to text_alloc() and module_memfree() to
> text_memfree(), and move them to kernel/text.c, which is unconditionally
> compiled to the kernel proper. This allows kprobes, ftrace and bpf to
> allocate space for executable code without requiring to compile the modules
> support (CONFIG_MODULES=y) in.
> 
> Cc: Andi Kleen <ak@linux.intel.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

[...]

> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 1cd1a4d0ed30..adde022f703c 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -20,48 +20,6 @@
>  #include <asm/insn.h>
>  #include <asm/sections.h>
>  
> -void *module_alloc(unsigned long size)
> -{
> -	u64 module_alloc_end = module_alloc_base + MODULES_VSIZE;
> -	gfp_t gfp_mask = GFP_KERNEL;
> -	void *p;
> -
> -	/* Silence the initial allocation */
> -	if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> -		gfp_mask |= __GFP_NOWARN;
> -
> -	if (IS_ENABLED(CONFIG_KASAN))
> -		/* don't exceed the static module region - see below */
> -		module_alloc_end = MODULES_END;
> -
> -	p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> -				module_alloc_end, gfp_mask, PAGE_KERNEL, 0,
> -				NUMA_NO_NODE, __builtin_return_address(0));
> -
> -	if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
> -	    !IS_ENABLED(CONFIG_KASAN))
> -		/*
> -		 * KASAN can only deal with module allocations being served
> -		 * from the reserved module region, since the remainder of
> -		 * the vmalloc region is already backed by zero shadow pages,
> -		 * and punching holes into it is non-trivial. Since the module
> -		 * region is not randomized when KASAN is enabled, it is even
> -		 * less likely that the module region gets exhausted, so we
> -		 * can simply omit this fallback in that case.
> -		 */
> -		p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> -				module_alloc_base + SZ_2G, GFP_KERNEL,
> -				PAGE_KERNEL, 0, NUMA_NO_NODE,
> -				__builtin_return_address(0));
> -
> -	if (p && (kasan_module_alloc(p, size) < 0)) {
> -		vfree(p);
> -		return NULL;
> -	}
> -
> -	return p;
> -}
> -
>  enum aarch64_reloc_op {
>  	RELOC_OP_NONE,
>  	RELOC_OP_ABS,
> diff --git a/arch/arm64/kernel/text.c b/arch/arm64/kernel/text.c
> new file mode 100644
> index 000000000000..64fc7e2d85df
> --- /dev/null
> +++ b/arch/arm64/kernel/text.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * AArch64 loadable module support.
> + *
> + * Copyright (C) 2012 ARM Limited
> + *
> + * Author: Will Deacon <will.deacon@arm.com>
> + */
> +#include <linux/kasan.h>
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +void *text_alloc(unsigned long size)
> +{
> +	u64 module_alloc_end = module_alloc_base + MODULES_VSIZE;
> +	gfp_t gfp_mask = GFP_KERNEL;
> +	void *p;
> +
> +	/* Silence the initial allocation */
> +	if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> +		gfp_mask |= __GFP_NOWARN;
> +
> +	if (IS_ENABLED(CONFIG_KASAN))
> +		/* don't exceed the static module region - see below */
> +		module_alloc_end = MODULES_END;
> +
> +	p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> +				module_alloc_end, gfp_mask, PAGE_KERNEL, 0,
> +				NUMA_NO_NODE, __builtin_return_address(0));
> +
> +	if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
> +	    !IS_ENABLED(CONFIG_KASAN))
> +		/*
> +		 * KASAN can only deal with module allocations being served
> +		 * from the reserved module region, since the remainder of
> +		 * the vmalloc region is already backed by zero shadow pages,
> +		 * and punching holes into it is non-trivial. Since the module
> +		 * region is not randomized when KASAN is enabled, it is even
> +		 * less likely that the module region gets exhausted, so we
> +		 * can simply omit this fallback in that case.
> +		 */
> +		p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> +				module_alloc_base + SZ_2G, GFP_KERNEL,
> +				PAGE_KERNEL, 0, NUMA_NO_NODE,
> +				__builtin_return_address(0));
> +
> +	if (p && (kasan_module_alloc(p, size) < 0)) {
> +		vfree(p);
> +		return NULL;
> +	}
> +
> +	return p;
> +}

I'm not especially keen on this approach.

As Ard says, module_alloc() _is_ special, in the sense that the virtual
memory it allocates wants to be close to the kernel text, whereas the
concept of allocating executable memory is broader and doesn't have these
restrictions. So, while I'm in favour of having a text_alloc() interface
that can be used by callers which only require an executable mapping, I'd
much prefer for the module_alloc() code to remain for, err, modules.

Thanks,

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
