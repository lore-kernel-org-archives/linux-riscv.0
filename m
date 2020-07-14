Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6B8C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 11:43:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A770120BED
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 11:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q205ci+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A770120BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+gxnAmteTPfO/LzdMB21j/+0w9pGBJN1pmSWKw8LTjI=; b=q205ci+rO2vOboqKQVRqnfrj9
	mN+VZzYw/4RWHaSB36mbGJkrNuEEDrpMz0kO5a+lj2TR11UkFW31E14ivahtTuINg/6p4oGjU4g5b
	Lf3h8RW3EwfhcUOZwEFywoU7jwz11gPf5h8kt4SWm7kvLCvOXbSCvo9luiXBhyBBLE2fGpmE1K076
	TdBXWUY9MyzeesiOIAMzlNOwJZHM9Su2C0kwJhz6Ym9+udd8Z5o1D7XSccpWvDpVvHP2aoDdlUH4J
	yvs44bu8xb6uDAhR7kTRm39jSA8ono47lU+tJ5JFEuPO3dp+/mSQdCEn9Vr86/fbJxWuXpzi0iG8q
	iu3TEjjtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvJLl-0003IK-Fk; Tue, 14 Jul 2020 11:43:53 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvJLi-0003H9-Mo; Tue, 14 Jul 2020 11:43:51 +0000
IronPort-SDR: XMsFOpaOQFhrbz/+Cotmi6n5rzw1dAob6EI6u0Oi4q6YfOqxjy5IJs1dvZFXzCpj/ObUnZ+PWi
 lqOK+di+Lm4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="146881968"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="146881968"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 04:43:49 -0700
IronPort-SDR: fstJxPQ124MmOQa5plQpg5ev9IKavwl9YKD5USnNHmGOKRNNXKQN8YtHnAadJpH2+M9zOyL+hi
 VGzfrISS6hXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="307841427"
Received: from pipper-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.46.185])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2020 04:43:10 -0700
Date: Tue, 14 Jul 2020 14:43:09 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Message-ID: <20200714114309.GB1463346@linux.intel.com>
References: <20200713182030.1418041-1-jarkko.sakkinen@linux.intel.com>
 <20200713183410.GY1551@shell.armlinux.org.uk>
 <20200714094928.GA1442951@linux.intel.com>
 <20200714095346.GA1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714095346.GA1551@shell.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_074351_009612_550D7001 
X-CRM114-Status: GOOD (  32.17  )
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
 Andy Lutomirski <luto@kernel.org>, Yonghong Song <yhs@fb.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Philipp Rudo <prudo@linux.ibm.com>, Torsten Duwe <duwe@lst.de>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 John Fastabend <john.fastabend@gmail.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Iurii Zaikin <yzaikin@google.com>,
 Andrii Nakryiko <andriin@fb.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Damien Le Moal <damien.lemoal@wdc.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dmitry Vyukov <dvyukov@google.com>, Sami Tolvanen <samitolvanen@google.com>,
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
 Peter Zijlstra <peterz@infradead.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>,
 Jiri Olsa <jolsa@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Sven Schnelle <svens@stackframe.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, KP Singh <kpsingh@chromium.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Nick Hu <nickhu@andestech.com>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 10:53:46AM +0100, Russell King - ARM Linux admin wrote:
> On Tue, Jul 14, 2020 at 12:49:28PM +0300, Jarkko Sakkinen wrote:
> > On Mon, Jul 13, 2020 at 07:34:10PM +0100, Russell King - ARM Linux admin wrote:
> > > On Mon, Jul 13, 2020 at 09:19:37PM +0300, Jarkko Sakkinen wrote:
> > > > Rename module_alloc() to text_alloc() and module_memfree() to
> > > > text_memfree(), and move them to kernel/text.c, which is unconditionally
> > > > compiled to the kernel proper. This allows kprobes, ftrace and bpf to
> > > > allocate space for executable code without requiring to compile the modules
> > > > support (CONFIG_MODULES=y) in.
> > > 
> > > I'm not sure this is a good idea for 32-bit ARM.  The code you are
> > > moving for 32-bit ARM is quite specific to module use in that it also
> > > supports allocating from the vmalloc area, where the module code
> > > knows to add PLT entries.
> > > 
> > > If the other proposed users of this text_alloc() do not have the logic
> > > to add PLT entries when branches between kernel code and this
> > > allocation are not reachable by, e.g. a 26-bit signed offset for 32-bit
> > > ARM code, then this code is not suitable for that use.
> > 
> > My intention is to use this in kprobes code in the place of
> > module_alloc().  I'm not sure why moving this code out of the module
> > subsystem could possibly break anything.  Unfortunately I forgot to add
> > covere letter to my series. Sending v2 with that to explain my use case
> > for this.
> 
> Ah, so you're merely renaming module_alloc() to text_alloc() everywhere?
> It sounded from the initial patch like you were also converting other
> users to use module_alloc().

Yes, exactly. I'm making the allocators unconditionally part of the
kernel proper.

My application for this is test kernels. I never compile anything as
modules when I test a release.

Also, I could imagine that especially in small scale embedded devices,
it could be sometimes useful to be able to have tracing support w/o
module support.

/Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
