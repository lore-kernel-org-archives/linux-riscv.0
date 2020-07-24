Return-Path: <SRS0=jwAp=BD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBE8C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 08:05:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A5FE2073E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 08:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2YHvBZIj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQgxYosI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A5FE2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lujWL1J62/doqnZPp9V7Gk3bmO7smeCyfgkCY0FJfoA=; b=2YHvBZIjhl82rqbTrZHvr9cbi
	qNTkxxP9S6kAHDjPTqFa6TxXTBp4Y8cWF210FvXCcmsewGM0u6M/sIjvTCSGoHbXwGqJO1nvsb5av
	6JnY3HDlVdXW6M2cExu4Bv63LZ5Wudq1IvZuWSm0gqtgWX/6LQZ8dG6pK+NfpbLW4YzQognzMRlrA
	YVEWwNXsLj7Xuhr4sY5tn+u7NvFi1DlNXC5PzvTD6JswcbSEmFzd89njm55If8SxoS6aLcOCybuJz
	vImlAnC+Q0NhVSvdU51cySyUZJZ/fYn2O6nvjZfh0NBTQ2y5TIFy4iVQLv/6I+rqdvlI1QU/Qn4aO
	c7Q/3H3qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyshw-0003zr-1o; Fri, 24 Jul 2020 08:05:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyshs-0003yC-3A; Fri, 24 Jul 2020 08:05:29 +0000
Received: from linux-8ccs (p57a236d4.dip0.t-ipconnect.de [87.162.54.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA66B20714;
 Fri, 24 Jul 2020 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595577926;
 bh=us2W5N9wAnP0SRTf2NETN3sn0PTr7LNBP/LAvhLqDbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iQgxYosIuT/VUzj6+qKIwKf0IR9OKpxSh4OiUa+6rfL2yxtBGsii3LQuRzcoxWYjq
 WmSWWCQKgrWA4hh7O9H3q9SWSEelUNw0KZuaw9jZ0e757JHdQ1Oqyy6N3x0PqIO0Vu
 lguPTAYMJfYhShKoQhGPpNT5RzKACvw/rBbeNwqg=
Date: Fri, 24 Jul 2020 10:05:08 +0200
From: Jessica Yu <jeyu@kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Message-ID: <20200724080508.GA17719@linux-8ccs>
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
 <20200716184909.Horde.JVRLLcKix_jhrJfiQYRbbQ1@messagerie.si.c-s.fr>
 <20200723015127.GE45081@linux.intel.com>
 <CAMj1kXGJhqC+asc6JUNeEkRsHYTzNQVe4-65vKqigbW03gO9Jg@mail.gmail.com>
 <20200724073621.GC1872662@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724073621.GC1872662@linux.intel.com>
X-OS: Linux linux-8ccs 5.5.0-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_040528_265144_0E49FEAB 
X-CRM114-Status: GOOD (  25.10  )
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
 Guan Xuetao <gxt@pku.edu.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC sparc/sparc64" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Miroslav Benes <mbenes@suse.cz>, Jiri Olsa <jolsa@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>,
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

+++ Jarkko Sakkinen [24/07/20 10:36 +0300]:
>On Thu, Jul 23, 2020 at 03:42:09PM +0300, Ard Biesheuvel wrote:
>> On Thu, 23 Jul 2020 at 04:52, Jarkko Sakkinen
>> <jarkko.sakkinen@linux.intel.com> wrote:
>> >
>> > On Thu, Jul 16, 2020 at 06:49:09PM +0200, Christophe Leroy wrote:
>> > > Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> a =E9crit :
>> > >
>> > > > Rename module_alloc() to text_alloc() and module_memfree() to
>> > > > text_memfree(), and move them to kernel/text.c, which is unconditi=
onally
>> > > > compiled to the kernel proper. This allows kprobes, ftrace and bpf=
 to
>> > > > allocate space for executable code without requiring to compile th=
e modules
>> > > > support (CONFIG_MODULES=3Dy) in.
>> > >
>> > > You are not changing enough in powerpc to have this work.
>> > > On powerpc 32 bits (6xx), when STRICT_KERNEL_RWX is selected, the vm=
alloc
>> > > space is set to NX (no exec) at segment level (ie by 256Mbytes zone)=
 unless
>> > > CONFIG_MODULES is selected.
>> > >
>> > > Christophe
>> >
>> > This has been deduced down to:
>> >
>> > https://lore.kernel.org/lkml/20200717030422.679972-1-jarkko.sakkinen@l=
inux.intel.com/
>> >
>> > I.e. not intruding PPC anymore :-)
>> >
>>
>> Ok, so after the elaborate discussion we had between Jessica, Russell,
>> Peter, Will, Mark, you and myself, where we pointed out that
>> a) a single text_alloc() abstraction for bpf, kprobes and ftrace does
>> not fit other architectures very well, and
>> b) that module_alloc() is not suitable as a default to base text_alloc()=
 on,
>
>In the latest iteration (v5) it is conditionally available only if arch
>defines and fallback has been removed.
>
>> you went ahead and implemented that anyway, but only cc'ing Peter,
>> akpm, Masami and the mm list this time?
>
>No problems with that. Actually each patch gets everything that
>get_maintainer.pl gives with a cc cmd script, not just the ones
>explicitly listed in the patch.
>
>Should I explicitly CC you to the next version? I'm happy to grow
>the list when requested.

Yes, please CC everybody that was part of the discussion last time
especially during v2, and please use a consistent CC list for the
whole patchset. It is difficult to review when you only receive patch
1 out of 6 with no mention of text_alloc() anywhere and without being
CC'd on the cover letter.

Jessica

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
