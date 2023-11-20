Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAE1C2BB3F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZTGPFVBJrECT0UE5J6cNpKXY0klxQDV7doa0Qvl7mkc=; b=15ZN+rfH/+VUd8
	UC1i+xdOYF5kHUJ3nrN0snKh38e8py0O4ljk1pnb1ExgAqsm6feOw67n51D2epP3h8heUrJze7cwS
	2KQDpnTXpLEbkspZfJ7rFlRGd13F0hda4tgVcE9F8zzbApUhC1V2c1nCdX9pjUol9CyMsBzDbO3F4
	dab/acsrgyX2KVoAqEGW3CGtEyfIBrkVhLI9nkDt4YeNTzEbZXY5rmPUzbZkWIDGjZJW4ww05EVGk
	o3ooZv8aQIBxMUe45oCF1AvuRdl3BnGY+uLRYldhXiuKO/ihe/NWTLw5ADSFF4qr83TV6D3fusQKu
	hofvC0NkRiDWbRF6GTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r56ZJ-00Cso3-1D;
	Mon, 20 Nov 2023 15:52:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r56ZH-00Cslo-07
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Nov 2023 15:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-Id:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=MZyP9bbN2OhFmaCO48JjdH05j95W9qWzKHyC/r9shIA=; b=AJ8R0APoE3kvguae/t7BRpSBMx
	CbYGmu5Fck97KBn9bNsfBC/0axTNbqoXuhPbuH3owW4KH2Tj3hpjWvP0ZJuXGmgo2hoV8mw2Z2GKK
	9UcjURzUH8ViNZr/kAh4OJQSdtGinFLoIhZy+RLK/0LpEYf2czxFxlWSsJWzjcTOF627S2Vk/is7C
	H0Y+uXehusnOrffASCN/8v/dNbj0roeAthhOWeakUv27dUwPB7Fi8nVK6K6rDzheSgqoRuNPxeMoa
	oY1eUM456tHJ58poVvkLUmZNl8QRxoPypM8BNJBMCLc7QhGAhnKHTHe16kR/UNsXimxuaZw0KDyWZ
	z8+52VYg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r56Z8-00B1Hd-1z;
	Mon, 20 Nov 2023 15:52:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 444DF300419; Mon, 20 Nov 2023 16:52:01 +0100 (CET)
Message-Id: <20231120144642.591358648@infradead.org>
User-Agent: quilt/0.65
Date: Mon, 20 Nov 2023 15:46:42 +0100
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
Subject: [PATCH 0/2] x86/bpf: Fix FineIBT vs eBPF
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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
