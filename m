Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361E8C433F7
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 13:33:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0150D22280
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 13:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N/DEXomN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0150D22280
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fejc9g98VFMhYPBO1/a5jEZ+gn63vjH4S5sLPpcN48M=; b=N/DEXomNVDcEkgvJhpV2JuIeC
	INAt9WdBJjNmNNSMpL7K7kVW8VqMJz50EYgtSF8HnKFlY0TplfbmJ1eyKkc5jMMimJB9FCZopoBw6
	7dUzIMz1tibSbpeznH2BEfon4DJ3AdIiy6eagkWvuFl8zA8g11UDFHkzvwyXcb5zYI5E2zXhxrQbw
	aA7n8Lj5BK7gFzX/GZHl7CR/+WOtdGrrqk0+Yzgn/iaINITlY5y8F56KwXtjefSG+LiCxyLH30zQW
	qV5XY9QDZN2bPGZZOTQWUPRBfED0tqmraFd6sVPDUwge1p2cVjrN01zZ59lpqlG1m9e0szSDiRf2C
	Bo9xDFPHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvL43-0002mT-Gl; Tue, 14 Jul 2020 13:33:43 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvL3z-0002l8-V9; Tue, 14 Jul 2020 13:33:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6A00FC2;
 Tue, 14 Jul 2020 06:33:36 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.2.244])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B8493F68F;
 Tue, 14 Jul 2020 06:33:19 -0700 (PDT)
Date: Tue, 14 Jul 2020 14:33:14 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Message-ID: <20200714133314.GA67386@C02TD0UTHF1T.local>
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
 <20200714102826.GB4756@willie-the-truck>
 <20200714112927.GV10769@hirez.programming.kicks-ass.net>
 <CAMj1kXGG4vxWrp1de1FxdU=8F4Jof00=T1x-7e+BW7_HP-oZMQ@mail.gmail.com>
 <20200714130109.GX10769@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714130109.GX10769@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_093340_114065_2AC1385F 
X-CRM114-Status: GOOD (  26.89  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Philipp Rudo <prudo@linux.ibm.com>, Torsten Duwe <duwe@lst.de>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
 Alexei Starovoitov <ast@kernel.org>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Atish Patra <atish.patra@wdc.com>, Will Deacon <will@kernel.org>,
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
 David Howells <dhowells@redhat.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>,
 Jiri Olsa <jolsa@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Sven Schnelle <svens@stackframe.org>,
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

On Tue, Jul 14, 2020 at 03:01:09PM +0200, Peter Zijlstra wrote:
> On Tue, Jul 14, 2020 at 03:19:24PM +0300, Ard Biesheuvel wrote:
> > So perhaps the answer is to have text_alloc() not with a 'where'
> > argument but with a 'why' argument. Or more simply, just have separate
> > alloc/free APIs for each case, with generic versions that can be
> > overridden by the architecture.
> 
> Well, there only seem to be 2 cases here, either the pointer needs to
> fit in some immediate displacement, or not.

On some arches you have a few choices for immediates depending on
compiler options, e.g. on arm64:

* +/- 128M with B
* +/-4G with ADRP+ADD+BR
* +/- 48/64 bits with a series of MOVK* + BR

... and you might build core kernel one way and modules another, and
either could depend on configuration.

> On x86 we seem have the advantage of a fairly large immediate
> displacement as compared to many other architectures (due to our
> variable sized instructions). And thus have been fairly liberal with our
> usage of it (also our indirect jmps/calls suck, double so with
> RETCH-POLINE).
> 
> Still, the indirect jump, as mentioned by Russel should work for
> arbitrarily placed code for us too.
> 
> 
> So I'm thinking that something like:
> 
> enum ptr_type {
> 	immediate_displacement,
> 	absolute,
> };
> 
> void *text_alloc(unsigned long size, enum ptr_type type)
> {
> 	unsigned long vstart = VMALLOC_START;
> 	unsigned long vend   = VMALLOC_END;
> 
> 	if (type == immediate_displacement) {
> 		vstart = MODULES_VADDR;
> 		vend   = MODULES_END;
> 	}
> 
> 	return __vmalloc_node_range(size, TEXT_ALIGN, vstart, vend,
> 				    GFP_KERNEL, PAGE_KERNEL_EXEC, 0,
> 				    NUMA_NO_NODE, _RET_IP_);
> }
> 
> void text_free(void *ptr)
> {
> 	vfree(ptr);
> }

I think it'd be easier to read with separate functions, e.g.

  text_alloc_imm_offset(unsigned long size);
  text_alloc_absolute(unsigned long size);

> Should work for all cases. Yes, we might then want something like a per
> arch:
> 
> 	{BPF,FTRACE,KPROBE}_TEXT_TYPE

... at that point why not:

  text_alloc_ftrace();
  text_alloc_module();
  text_alloc_bpf();
  text_alloc_kprobe();

... etc which an arch can alias however it wants? e.g. x86 can have
those all go to a common text_alloc_generic(), and that could even be a
generic option for arches that don't care to distinguish these cases.

Then if there are new places that want to allocate text we have to
consider their requirements when adding them, too.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
