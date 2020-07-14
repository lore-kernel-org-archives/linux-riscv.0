Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAC0C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 10:17:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C00221FF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 10:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DCWS02zc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4cQNcFS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C00221FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Yo5UzHoSrSpMWTo6GmYkDf0ZJUVU5wq94/K6F0n1dY=; b=DCWS02zc5Xq5gPy2tZcaqT5ef
	Zgs/L/WvN6KSquaLLM47AqHDiXmsR1wcggTlcZvKemGqi7ZGppGiaVgisBiv8MauHSS/vf7jvdQEV
	O/QDVUxjM7db6Dupgq7mlz42L3NjwVDnfmCALUcEh2qmGiNepAL1LUnQdcioEEMRZkTRsJ6kJfvh8
	5wcw0nncLBrDX6KAEvVaN9xBiWWq5NpyYwGMZSctZUm9L9MqQnEjOqUecsd+2odN1pAOZYkZN45m+
	xXqL0IDsUZk3+iU5F64O90qt2+g7R3RIrvBBVaid2L45BIx+x48b9qUxwxU+8ackQxwOpwTqee88v
	EFuWi90cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvI0J-0004c2-Rl; Tue, 14 Jul 2020 10:17:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvI0G-0004b4-Oj; Tue, 14 Jul 2020 10:17:37 +0000
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDCC222242;
 Tue, 14 Jul 2020 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594721854;
 bh=tldfCbGX7WNIgoKko/oLYaOyXTRH6GokxksB76il3+4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q4cQNcFSf5zEpo9vhTQJSgN3V8ntE25HKVRXe6fwuMHlMwQj+BWAiM/l7j7Uotg67
 CuKNw9bdPgHTmQWZmQCAnutyPaNXSSkdzgQ77hJJsMjUp+gOO74HdEN4hx6E5AJMCA
 yVfxGs/E3ecdZ/VwsrKKWSvnhYu60Qbz6UjIVSxw=
Received: by mail-oi1-f172.google.com with SMTP id j11so13467445oiw.12;
 Tue, 14 Jul 2020 03:17:34 -0700 (PDT)
X-Gm-Message-State: AOAM533m4U9TpO6MjK/XHSUt/+OBBbbRHhokyhf+WuDM1OBEnYmPL6bF
 5d8svrHjqiSj02ehZGjDgt0SREM1vml6MSdaykg=
X-Google-Smtp-Source: ABdhPJxHHl/ZjkVDcXGAU0II8SE5bwBs6xJ0c4UdVyd0y5ppCMRxVQyn5lUlldodDVcBZUaDabRWLahEt2DwHdim5zE=
X-Received: by 2002:aca:d643:: with SMTP id n64mr3011967oig.33.1594721853647; 
 Tue, 14 Jul 2020 03:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200713182030.1418041-1-jarkko.sakkinen@linux.intel.com>
 <CAMj1kXGhZYxjZTP+_PGdBy4hZgdeeTNUkuaE_eQKwB4pPAYNXA@mail.gmail.com>
 <20200714095243.GB1442951@linux.intel.com>
In-Reply-To: <20200714095243.GB1442951@linux.intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Jul 2020 13:17:22 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGV_bWehdQvxaMBTOYHXUoFjifBWNpyVy3gaWKktko1mg@mail.gmail.com>
Message-ID: <CAMj1kXGV_bWehdQvxaMBTOYHXUoFjifBWNpyVy3gaWKktko1mg@mail.gmail.com>
Subject: Re: [PATCH 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_061737_017736_E8D06B08 
X-CRM114-Status: GOOD (  25.38  )
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
 Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Philipp Rudo <prudo@linux.ibm.com>, Torsten Duwe <duwe@lst.de>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
 Jiri Olsa <jolsa@redhat.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Sven Schnelle <svens@stackframe.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Paul E. McKenney" <paulmck@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 KP Singh <kpsingh@chromium.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Nick Hu <nickhu@andestech.com>,
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

On Tue, 14 Jul 2020 at 12:53, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Mon, Jul 13, 2020 at 10:49:48PM +0300, Ard Biesheuvel wrote:
> > This patch suggests that there are other reasons why conflating
> > allocation of module space and allocating  text pages for other uses
> > is a bad idea, but switching all users to text_alloc() is a step in
> > the wrong direction. It would be better to stop using module_alloc()
> > in core code except in the module loader, and have a generic
> > text_alloc() that can be overridden by the arch if necessary. Note
> > that x86  and s390 are the only architectures that use module_alloc()
> > in ftrace code.
>
> This series essentially does this: introduces text_alloc() and
> text_memfree(), which have generic implementations in kernel/text.c.
> Those can be overriddent by arch specific implementations.
>
> What you think should be done differently than in my patch set?
>

On arm64, module_alloc is only used by the module loader, and so
pulling it out and renaming it will cause unused code to be
incorporated into the kernel when building without module support,
which is the use case you claim to be addressing.

Module_alloc has semantics that are intimately tied to the module
loader, but over the years, it ended up being (ab)used by other
subsystems, which don't require those semantics but just need n pages
of vmalloc space with executable permissions.

So the correct approach is to make text_alloc() implement just that,
generically, and switch bpf etc to use it. Then, only on architectures
that need it, override it with an implementation that has the required
additional semantics.

Refactoring 10+ architectures like this without any regard for how
text_alloc() deviates from module_alloc() just creates a lot of churn
that others will have to clean up after you.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
