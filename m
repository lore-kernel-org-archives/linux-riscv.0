Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8510DC10DAA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 13:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NuxGBAGeTNg4ZdMSKpoNPDNzntK8a2HrjsxR5t3EjPc=; b=N8VDDygXbg1hKU
	ZCQpuAyDOM9GautnUheZfniqQGL7QCnO70W2Cu45/jwc6pUSV8JtXAYRoPe75Q6XI8Yr4arnPpiLf
	CDr7BbjQwMMKYSXlZxRh8LgKvR9kvHMKHLScQv284F2pV9DxW/9A7O7+99IdWmwhJ56Qsh5DkUw67
	rEQar+z7mkdZOJ02hq4K+HLCD5SLY2JfsfkQ8jopLvWbt+aDD+IcZSinGSj8Azmo0eFh6Y65MH0TU
	WY6saL8wsU6D4ARbarOTwvY9YFtZs74Mo+a6973gwXVb6j8DzBjJuGSHqxRtiWuenG6u4hHW4cQ01
	M8GFe0EloVfktNCWU6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hK3-00Azfg-22;
	Thu, 30 Nov 2023 13:43:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hJz-00AzbY-2l
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Nov 2023 13:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-Id:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=nTDEByR8M40duXbJYISBwBBcacxMogIgHwTMF/IlaPs=; b=ab88EBl58upGSeTBpe4Vrkh75o
	nYzYKpq9wEt3x47E/cOvkiJur81GoqDqoYi6s74VQaga3MieJo7RSEDJJn9EHrsZ46o/Vt0PPba1O
	7N5MIGE2WkZ/1Npup0E2UMyjY99eQrOiAjDzCz+uiwRFWY8STstyrd8wuNrmhS3G+8ZpNFPKPpiMt
	Lz9iDzeQng+KlkneqRr7su3ELXk2i6rPC9rSP57zMgxdI/AfqeNJ4DjMvpgNXy85ZYBUNySuUb/WE
	pmLEr6Rc8OdsHi1fUzABmTXTUCWk9SqdOdJwom8QGOR8Hb55UVkXG+n8YE+knnmgF+D9jpOO841TP
	jGKbXRSg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hJs-0013s7-0o;
	Thu, 30 Nov 2023 13:43:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 50E0B300427; Thu, 30 Nov 2023 14:43:07 +0100 (CET)
Message-Id: <20231130133630.192490507@infradead.org>
User-Agent: quilt/0.65
Date: Thu, 30 Nov 2023 14:36:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Cc: paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 tglx@linutronix.de,
 mingo@redhat.com,
 bp@alien8.de,
 dave.hansen@linux.intel.com,
 x86@kernel.org,
 hpa@zytor.com,
 davem@davemloft.net,
 dsahern@kernel.org,
 ast@kernel.org,
 daniel@iogearbox.net,
 andrii@kernel.org,
 martin.lau@linux.dev,
 song@kernel.org,
 yonghong.song@linux.dev,
 john.fastabend@gmail.com,
 kpsingh@kernel.org,
 sdf@google.com,
 haoluo@google.com,
 jolsa@kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 samitolvanen@google.com,
 keescook@chromium.org,
 nathan@kernel.org,
 ndesaulniers@google.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org,
 bpf@vger.kernel.org,
 linux-arch@vger.kernel.org,
 llvm@lists.linux.dev,
 jpoimboe@kernel.org,
 joao@overdrivepizza.com,
 mark.rutland@arm.com
Subject: [PATCH v2 0/2] x86/bpf: Fix FineIBT vs eBPF
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi!

There's a problem with FineIBT and eBPF using __nocfi when
CONFIG_BPF_JIT_ALWAYS_ON=n, in which case the __nocfi indirect call can target
a normal function like __bpf_prog_run32().

Specifically the various preambles look like:

   FineIBT				JIT

   __cfi_foo:
      endbr64
      subl	$hash, %r10d
      jz	1f
      ud2
   1: nop
   foo:					foo:
      osp nop3				   endbr64
      ...				   ...

So while bpf_dispatcher_*_func() does a __nocfi call to foo()+0 and this
matches what the JIT generates, it does not work for regular FineIBT functions,
since their +0 endbr got poisoned and things go *boom*.

Cure this by teaching the BPF JIT about all the various CFI forms. Notably this
removes the last __nocfi call on x86.

If the BPF folks agree (and the robots don't find fail) I'd like to take this
through the x86 tree, because I have a few more patches that turn the non-fatal
'osp nop3' poison into a 4 byte ud1 instruction which is rather fatal. As a
result this problem will also surface on !IBT hardware.

Changes since v1:
 - added wee comment to asm/cfi.h (ast)
 - added asm comments to bytecode (ast)
 - renamed bpf_func_proto() to __bpf_prog_runX() (ast)
 - added bpf_prog_aux::ksym_prefix (ast)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
