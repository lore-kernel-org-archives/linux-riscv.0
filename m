Return-Path: <SRS0=jwAp=BD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52DBC433E3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 07:37:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC4B20748
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 07:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ljw1cm+V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC4B20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BAFhlC48mJTbpYkCUc+RAF856sRH7+3NJnt+7PRCovg=; b=Ljw1cm+VzJ0BO+nFqGq7f+0OX
	uoxBIZArKDBPZKLRpf93jEvVjz22aj6SIzQ5RwcWGqre8dsoAbfZsT+0fy5PPtuCT1dnGdwPe7DKt
	3VkQCJy9broLGmg6SncwA+Gu0+bRDJi4zegPcPVaiYc/ZE9MZwGzCjwxjgYczapIY2vcU0Lgplc+J
	8UeUo5V2rgXFZN/yHLf3wdAOpkVB36fjpTP3VajPBsgFVtWfbf/7WcQmkHil8UJ9gRYNf9R55sMXs
	VEP74kqwz1Oj3v9/HJB+c25g/+g4cQYXCMuV07C4YYPkqol+UNwYwpsVsfgCwbQnyEIf3t+QsVq7s
	Bz3scAyuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysGZ-0008Sf-Nq; Fri, 24 Jul 2020 07:37:15 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysGO-0008Ma-4I; Fri, 24 Jul 2020 07:37:08 +0000
IronPort-SDR: S+QSh22f0QdgTCsOeWivs0boD2Tcn7hiN0bNu5E+Zs8icm6lYhXxnJYEfgsmb3VFybghv9oJmk
 aTeWChd5jYRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="215259404"
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; d="scan'208";a="215259404"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2020 00:37:01 -0700
IronPort-SDR: TAB03xecSlI4basjrQIy2hbhaeXXyXKAkMJFtaNhpLJDNY3l0q2EBJc0tt5g94JWjrS8//u4J3
 0Kk+Cc01yUeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; d="scan'208";a="288909362"
Received: from cbuerkle-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.36.184])
 by orsmga006.jf.intel.com with ESMTP; 24 Jul 2020 00:36:23 -0700
Date: Fri, 24 Jul 2020 10:36:21 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Message-ID: <20200724073621.GC1872662@linux.intel.com>
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
 <20200716184909.Horde.JVRLLcKix_jhrJfiQYRbbQ1@messagerie.si.c-s.fr>
 <20200723015127.GE45081@linux.intel.com>
 <CAMj1kXGJhqC+asc6JUNeEkRsHYTzNQVe4-65vKqigbW03gO9Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGJhqC+asc6JUNeEkRsHYTzNQVe4-65vKqigbW03gO9Jg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_033704_597029_2F5B3CA9 
X-CRM114-Status: GOOD (  27.89  )
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
 Paul Burton <paulburton@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Petr Mladek <pmladek@suse.com>,
 Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Philipp Rudo <prudo@linux.ibm.com>, Torsten Duwe <duwe@lst.de>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
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
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Babu Moger <Babu.Moger@amd.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Ben Dooks <ben-linux@fluff.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC sparc/sparc64" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Miroslav Benes <mbenes@suse.cz>, Jiri Olsa <jolsa@redhat.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Sven Schnelle <svens@stackframe.org>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, KP Singh <kpsingh@chromium.org>,
 Dmitry Vyukov <dvyukov@google.com>, Nick Hu <nickhu@andestech.com>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 03:42:09PM +0300, Ard Biesheuvel wrote:
> On Thu, 23 Jul 2020 at 04:52, Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> >
> > On Thu, Jul 16, 2020 at 06:49:09PM +0200, Christophe Leroy wrote:
> > > Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> a =E9crit :
> > >
> > > > Rename module_alloc() to text_alloc() and module_memfree() to
> > > > text_memfree(), and move them to kernel/text.c, which is unconditio=
nally
> > > > compiled to the kernel proper. This allows kprobes, ftrace and bpf =
to
> > > > allocate space for executable code without requiring to compile the=
 modules
> > > > support (CONFIG_MODULES=3Dy) in.
> > >
> > > You are not changing enough in powerpc to have this work.
> > > On powerpc 32 bits (6xx), when STRICT_KERNEL_RWX is selected, the vma=
lloc
> > > space is set to NX (no exec) at segment level (ie by 256Mbytes zone) =
unless
> > > CONFIG_MODULES is selected.
> > >
> > > Christophe
> >
> > This has been deduced down to:
> >
> > https://lore.kernel.org/lkml/20200717030422.679972-1-jarkko.sakkinen@li=
nux.intel.com/
> >
> > I.e. not intruding PPC anymore :-)
> >
> =

> Ok, so after the elaborate discussion we had between Jessica, Russell,
> Peter, Will, Mark, you and myself, where we pointed out that
> a) a single text_alloc() abstraction for bpf, kprobes and ftrace does
> not fit other architectures very well, and
> b) that module_alloc() is not suitable as a default to base text_alloc() =
on,

In the latest iteration (v5) it is conditionally available only if arch
defines and fallback has been removed.

> you went ahead and implemented that anyway, but only cc'ing Peter,
> akpm, Masami and the mm list this time?

No problems with that. Actually each patch gets everything that
get_maintainer.pl gives with a cc cmd script, not just the ones
explicitly listed in the patch.

Should I explicitly CC you to the next version? I'm happy to grow
the list when requested.

> Sorry, but that is not how it works. Once people get pulled into a
> discussion, you cannot dismiss them or their feedback like that and go
> off and do your own thing anyway. Generic features like this are
> tricky to get right, and it will likely take many iterations and input
> from many different people.

Sure. I'm not expecting this move quickly.

I don't think I've at least purposely done that. As you said it's tricky
to get this right.

/Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
