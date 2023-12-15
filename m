Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1991C46CCD
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=5knxtVugrTdoGROJ1FT2sf6/xchMYV6sz6BddUiSyUo=; b=QInowF6wmW5VRQ
	R+0UOUNfDtP9TKEN4i2LIPAEmw9AxtSRdTvsS5sZVpQJoj8aBMo52o8OSxRAfvPkRZfKXlnpaV5KW
	zuWWp2uhGRBy08bvkxHiwHSHEGEUj+DD1eUgCRsSurengKOdnL0MzkzwUhhTXKLBveahnx4NlZXsW
	XpmhAqTy+vARjrFx5Dvm79+VXfqhRDKb3zn06eU5+fcdO5bMU0CBTaDvbQY5wZXEDCaC9fEs0Jo6b
	ZoXp+fBzEeRdh0iQdSxsntojMLiAV4vBDkAsT5cTfboVpuUq2lBieHcM5/QgXEj2iZZQ9b94QATA8
	bViNjgoGGiV8Nfwvbqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZV-002db8-0Q;
	Fri, 15 Dec 2023 09:33:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZO-002dYm-2L
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 Dec 2023 09:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=b4R8oBfA9zqLdMspEmf7BM9tcAtmYn2SA6ZbJ+T1P5c=; b=Lq2PgWhtX3V8toHwd4gXthsfPV
	51X7SJQC7Nru1W8AxzAo9FgQf8X7B//HhiVa4Wni0K2G+n5NSLp0J6KuWaVPHCg5LqaWnnTct6an7
	VSn/94veX/IqLryss/BBYEDgrH3uHxiAng0tbAwUZR/2wWcS1xNJe4HBpFsWFWk2lHDRHwf+hSYIV
	jW3O6OYVrI2YIUtYDEzNZCpeDl/mhsRZv8X+fwN3HuvgHv0Zv4s2ZWXFlNfony2rirfUxjBaebt0e
	2AMaCofhDa/dAdzVSTw7hG62RjkawKG+01OP4YeCDE2L2mGeW2/sgrNjJVf24DXfwrfjR9XaYP+Bk
	aMms2tmQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZF-009rG1-0w;
	Fri, 15 Dec 2023 09:33:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id D6BA730098F; Fri, 15 Dec 2023 10:33:11 +0100 (CET)
Message-Id: <20231215092707.669401084@infradead.org>
User-Agent: quilt/0.65
Date: Fri, 15 Dec 2023 10:12:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
 mark.rutland@arm.com,
 peterz@infradead.org
Subject: [PATCH v3 5/7] cfi: Add CFI_NOSEAL()
References: <20231215091216.135791411@infradead.org>
MIME-Version: 1.0
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

Add a CFI_NOSEAL() helper to mark functions that need to retain their
CFI information, despite not otherwise leaking their address.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/cfi.h |    5 +++++
 include/linux/cfi.h        |    4 ++++
 2 files changed, 9 insertions(+)

--- a/arch/x86/include/asm/cfi.h
+++ b/arch/x86/include/asm/cfi.h
@@ -8,6 +8,7 @@
  * Copyright (C) 2022 Google LLC
  */
 #include <linux/bug.h>
+#include <asm/ibt.h>
 
 /*
  * An overview of the various calling conventions...
@@ -138,4 +139,8 @@ static inline u32 cfi_get_func_hash(void
 }
 #endif /* CONFIG_CFI_CLANG */
 
+#if HAS_KERNEL_IBT == 1
+#define CFI_NOSEAL(x)	asm(IBT_NOSEAL(__stringify(x)))
+#endif
+
 #endif /* _ASM_X86_CFI_H */
--- a/include/linux/cfi.h
+++ b/include/linux/cfi.h
@@ -46,4 +46,8 @@ static inline void module_cfi_finalize(c
 #endif /* CONFIG_ARCH_USES_CFI_TRAPS */
 #endif /* CONFIG_MODULES */
 
+#ifndef CFI_NOSEAL
+#define CFI_NOSEAL(x)
+#endif
+
 #endif /* _LINUX_CFI_H */



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
