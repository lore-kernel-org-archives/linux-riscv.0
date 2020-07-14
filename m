Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AC1C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 09:47:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B025E217D8
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 09:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tzaHw25T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B025E217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IoWQQC0JOnim6Exe6W8dDbQQ4STBHqOAWbMb/ljWsfk=; b=tzaHw25TrPcks9JfQhLZS7QE/H
	lmr13+35lzaSFy68gRJn2OSYKa14ZG2VkVrwH3+jhpSC5m2y8yP1+lUZLSAcRPzrE6hSm46lgHliy
	YepwyJE59/tiYnSk0G3lM1ZJ17jM6YysHCLFabW34yfFo1CgF4MHddooa27RPOJOUTQ32RER0vEWu
	jNX13wlzSa4DTA8mgXYeatyPRVR1C0ZhPnKjCZHTs7k0kI2dkSs73cnPvoP5hxevIRawoOC6DavOJ
	IDJahOs3QL8Z37ImGvAApl2mlREyDx/1+mrVWPJUsTq+TOT4ZTq4VdYYQSO7zFjWy3nOFeMXiLxqj
	R9GBI8ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHX3-0007iK-Fz; Tue, 14 Jul 2020 09:47:25 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHX0-0007gH-7a; Tue, 14 Jul 2020 09:47:23 +0000
IronPort-SDR: 9cPR3wJqNVoJ2yoes4ZvaO1NE3V5mXHZNOEblgGTfkPSi2bx3q6V80rl3LnOteHeaX6vaNO85Z
 uLMs6oFIGpiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="150282966"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="150282966"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 02:47:19 -0700
IronPort-SDR: tnOCkLt8IfVkm5xN3VakaM9NZRaZ4I7vcKaIxPq0JkwL/dnT/xa9qFx9uW0JY5/S7u+lxPJYn9
 QgrYykxLQnPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="429708293"
Received: from rmarti11-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.57])
 by orsmga004.jf.intel.com with ESMTP; 14 Jul 2020 02:46:40 -0700
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] kprobes: Remove MODULE dependency
Date: Tue, 14 Jul 2020 12:45:35 +0300
Message-Id: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_054722_413891_28C356BD 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Song Liu <songliubraving@fb.com>,
 Paul Mackerras <paulus@samba.org>, Zong Li <zong.li@sifive.com>,
 Paul Burton <paulburton@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Omar Sandoval <osandov@fb.com>, Petr Mladek <pmladek@suse.com>,
 Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Iurii Zaikin <yzaikin@google.com>,
 Jiri Kosina <jkosina@suse.cz>, Anup Patel <anup.patel@wdc.com>,
 Philipp Rudo <prudo@linux.ibm.com>, Vincent Chen <vincent.chen@sifive.com>,
 Torsten Duwe <duwe@lst.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@kernel.org>, "open list:S390" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Helge Deller <deller@gmx.de>, John Fastabend <john.fastabend@gmail.com>,
 Yonghong Song <yhs@fb.com>, Borislav Petkov <bp@suse.de>,
 Andrii Nakryiko <andriin@fb.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Martin KaFai Lau <kafai@fb.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Atish Patra <atish.patra@wdc.com>, Will Deacon <will@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Babu Moger <Babu.Moger@amd.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Ben Dooks <ben-linux@fluff.org>, Peter Collingbourne <pcc@google.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <bpf@vger.kernel.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:SPARC + UltraSPARC sparc/sparc64" <sparclinux@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Amit Daniel Kachhap <amit.kachhap@arm.com>,
 "open list:LIVE PATCHING" <live-patching@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Miroslav Benes <mbenes@suse.cz>, Jiri Olsa <jolsa@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Sven Schnelle <svens@stackframe.org>,
 Mike Rapoport <rppt@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, KP Singh <kpsingh@chromium.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Remove MODULES dependency by creating module subsystem indepdent
text_alloc() and text_memfree() to allocate space for executable code.

Right now one has to compile modules support only to enable kprobes. This
incrases the barrier to use them in test kernels and I'd guess also in some
embedded kernels (the former is my use case).

v2:
* Added the missing cover letter.

Jarkko Sakkinen (3):
  module: Rename module_alloc() to text_alloc() and move to kernel
    proper
  module: Add lock_modules() and unlock_modules()
  kprobes: Flag out CONFIG_MODULES dependent code

 arch/Kconfig                     |  1 -
 arch/arm/kernel/Makefile         |  3 +-
 arch/arm/kernel/module.c         | 21 -------
 arch/arm/kernel/text.c           | 33 +++++++++++
 arch/arm64/kernel/Makefile       |  2 +-
 arch/arm64/kernel/module.c       | 42 --------------
 arch/arm64/kernel/text.c         | 54 ++++++++++++++++++
 arch/mips/kernel/Makefile        |  2 +-
 arch/mips/kernel/module.c        |  9 ---
 arch/mips/kernel/text.c          | 19 +++++++
 arch/mips/net/bpf_jit.c          |  4 +-
 arch/nds32/kernel/Makefile       |  2 +-
 arch/nds32/kernel/module.c       |  7 ---
 arch/nds32/kernel/text.c         | 12 ++++
 arch/nios2/kernel/Makefile       |  1 +
 arch/nios2/kernel/module.c       | 19 -------
 arch/nios2/kernel/text.c         | 34 +++++++++++
 arch/parisc/kernel/Makefile      |  2 +-
 arch/parisc/kernel/module.c      | 11 ----
 arch/parisc/kernel/text.c        | 22 ++++++++
 arch/powerpc/net/bpf_jit_comp.c  |  4 +-
 arch/riscv/kernel/Makefile       |  1 +
 arch/riscv/kernel/module.c       | 12 ----
 arch/riscv/kernel/text.c         | 20 +++++++
 arch/s390/kernel/Makefile        |  2 +-
 arch/s390/kernel/ftrace.c        |  2 +-
 arch/s390/kernel/module.c        | 16 ------
 arch/s390/kernel/text.c          | 23 ++++++++
 arch/sparc/kernel/Makefile       |  1 +
 arch/sparc/kernel/module.c       | 30 ----------
 arch/sparc/kernel/text.c         | 39 +++++++++++++
 arch/sparc/net/bpf_jit_comp_32.c |  6 +-
 arch/unicore32/kernel/Makefile   |  1 +
 arch/unicore32/kernel/module.c   |  7 ---
 arch/unicore32/kernel/text.c     | 18 ++++++
 arch/x86/kernel/Makefile         |  1 +
 arch/x86/kernel/ftrace.c         |  4 +-
 arch/x86/kernel/kprobes/core.c   |  4 +-
 arch/x86/kernel/module.c         | 49 ----------------
 arch/x86/kernel/text.c           | 60 ++++++++++++++++++++
 include/linux/module.h           | 29 +++++++---
 include/linux/moduleloader.h     |  4 +-
 kernel/Makefile                  |  2 +-
 kernel/bpf/core.c                |  4 +-
 kernel/kprobes.c                 | 17 ++++--
 kernel/livepatch/core.c          |  8 +--
 kernel/module.c                  | 97 +++++++++++++-------------------
 kernel/text.c                    | 25 ++++++++
 kernel/trace/trace_kprobe.c      | 20 ++++++-
 49 files changed, 484 insertions(+), 322 deletions(-)
 create mode 100644 arch/arm/kernel/text.c
 create mode 100644 arch/arm64/kernel/text.c
 create mode 100644 arch/mips/kernel/text.c
 create mode 100644 arch/nds32/kernel/text.c
 create mode 100644 arch/nios2/kernel/text.c
 create mode 100644 arch/parisc/kernel/text.c
 create mode 100644 arch/riscv/kernel/text.c
 create mode 100644 arch/s390/kernel/text.c
 create mode 100644 arch/sparc/kernel/text.c
 create mode 100644 arch/unicore32/kernel/text.c
 create mode 100644 arch/x86/kernel/text.c
 create mode 100644 kernel/text.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
