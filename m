Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45ADC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 09:04:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B196E61051
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 09:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B196E61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XNQFvxmw682pIReGbXX7E5fWhL1zF4sb7Bku4rBAyeU=; b=VaSTJZnGUjD37Q
	f4xmufTfS2ME4rtwdJbaEPt0F898q3AiB4yLWwy1WNCT84dcvGYClZsFnbNvMtI4HdnLwqJpUhSxL
	xCOjMF3Uf3eNGtT476GEtOpMUX5YEKjn5DP8wI220ye08FZZdj25GnIn1inJnkCdH2w99GzVeH0tK
	1aEA7ejPqC92mStkhYL6U3HXFJYOuNGDZCs1mg20b3Y7D7JUwxJLFIH6L7hX3953HWvlnodp9YM1Y
	EhbUgqUNaoOA4E6rwPxehMET2Aquripc4lKk1b1ZtLW0J4mrd3Oe5iulJmmwhmNbpoCnEz/G4bs8z
	mVQPcCQiw9ZImbmNNS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOFyv-008hZO-OX; Thu, 09 Sep 2021 09:04:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOFxw-008h5Z-9i; Thu, 09 Sep 2021 09:03:30 +0000
Received: by mail-pj1-x102f.google.com with SMTP id c6so901212pjv.1;
 Thu, 09 Sep 2021 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oxrt0Di1Z5ok1Wnf6tUzyGoie6Gm8VDj4Nc/fyIhFs0=;
 b=ow8B+4vt1F9pLfHYV9Ij+hl6+gQr9b6FrcTZp87zzgq1QFzurdhRot3GR615SQjlCw
 Zh4RokFDllDi62GMhO7kFspujGar5GxlzpGSBRNRsZfQbQVIAbEOyPCqPhV1TBKXPJ+s
 u9zasRNTyWq8lIbx1jH8+5ssE7WtjYRbI0SxC0XjXbWBG7dNmL5jDpm04aYaqCtEHPMd
 oLMLrY6dxdb9aYvbcIz452wViyDA59FwyRhJgVKZpONOjEDjVsaSYv3vx/vOrl7m0wyK
 ghHlPZ1M7WyydtleY3pZPxr+zKPmwqTqIBcA98XBRxv6yxV4tWBWRIp7oAV3uoS7xKav
 JWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oxrt0Di1Z5ok1Wnf6tUzyGoie6Gm8VDj4Nc/fyIhFs0=;
 b=nPi7bezJeJPpkyboHpZurMsvJDDfHXd55+XD1PJqLnAdLPpJgjgqJ4D7mqEDM7Jub4
 xKvPQQWvdGLB+YHRN0RszCrHFVCGchubycTguFW2eVeQdyy0Ock7S4sPLd044j0DtNvx
 o2AmfpYKLhFyCHDldwbtYPB/B+5UYfDzRZupmzQnc9q/EOoJVxJaiJUQXuOUZam4Bs05
 2z09EMJozkYXB1flrbH+LT2BF5ZDdbfSurgS8wUIGcFhAYmaZTY9gO+NvQohu+OClyuu
 QpVO9XBytJ0yDs10ULpG43vU7XH00AyPjtPxdXDBMBAlivCNU0W4YFYOC6YYZLOejKeh
 Ie3Q==
X-Gm-Message-State: AOAM533VOYQbAUmTFgG+ozpnZNweZIpHmkPGW40FSb2Js2JLGI7axeW2
 fplvLeXVWRXW3ioIEobV1SQ=
X-Google-Smtp-Source: ABdhPJxHu9zJJ9FJUWJZJWQdpknTVzTkm8TBNRuaQJzThvN9YUYI4ouL8lSFHZOTHz+j9wwl1nI78w==
X-Received: by 2002:a17:902:d486:b0:135:9335:795b with SMTP id
 c6-20020a170902d48600b001359335795bmr1692439plg.73.1631178199865; 
 Thu, 09 Sep 2021 02:03:19 -0700 (PDT)
Received: from ownia.. ([173.248.225.217])
 by smtp.gmail.com with ESMTPSA id q126sm1600085pfc.156.2021.09.09.02.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 02:03:19 -0700 (PDT)
From: Weizhao Ouyang <o451686892@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, Weizhao Ouyang <o451686892@gmail.com>
Subject: [PATCH v4] ftrace: Cleanup ftrace_dyn_arch_init()
Date: Thu,  9 Sep 2021 17:02:16 +0800
Message-Id: <20210909090216.1955240-1-o451686892@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_020328_434404_D1F9D035 
X-CRM114-Status: GOOD (  12.59  )
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

Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
ftrace_dyn_arch_init() to cleanup them.

Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
Acked-by: Helge Deller <deller@gmx.de> (parisc)

---
Changes in v4:
-- revert the generic declaration

Changes in v3:
-- fix unrecognized opcode on PowerPC

Changes in v2:
-- correct CONFIG_DYNAMIC_FTRACE on PowerPC
-- add Acked-by tag

---
 arch/arm/kernel/ftrace.c        | 5 -----
 arch/arm64/kernel/ftrace.c      | 5 -----
 arch/csky/kernel/ftrace.c       | 5 -----
 arch/ia64/kernel/ftrace.c       | 6 ------
 arch/microblaze/kernel/ftrace.c | 5 -----
 arch/nds32/kernel/ftrace.c      | 5 -----
 arch/parisc/kernel/ftrace.c     | 5 -----
 arch/riscv/kernel/ftrace.c      | 5 -----
 arch/s390/kernel/ftrace.c       | 5 -----
 arch/sh/kernel/ftrace.c         | 5 -----
 arch/sparc/kernel/ftrace.c      | 5 -----
 arch/x86/kernel/ftrace.c        | 5 -----
 kernel/trace/ftrace.c           | 5 +++++
 13 files changed, 5 insertions(+), 61 deletions(-)

diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
index 3c83b5d29697..a006585e1c09 100644
--- a/arch/arm/kernel/ftrace.c
+++ b/arch/arm/kernel/ftrace.c
@@ -193,11 +193,6 @@ int ftrace_make_nop(struct module *mod,
 
 	return ret;
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index 7f467bd9db7a..fc62dfe73f93 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -236,11 +236,6 @@ void arch_ftrace_update_code(int command)
 	command |= FTRACE_MAY_SLEEP;
 	ftrace_modify_all_code(command);
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/csky/kernel/ftrace.c b/arch/csky/kernel/ftrace.c
index b4a7ec1517ff..50bfcf129078 100644
--- a/arch/csky/kernel/ftrace.c
+++ b/arch/csky/kernel/ftrace.c
@@ -133,11 +133,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 				(unsigned long)func, true, true);
 	return ret;
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/ia64/kernel/ftrace.c b/arch/ia64/kernel/ftrace.c
index b2ab2d58fb30..d6360fd404ab 100644
--- a/arch/ia64/kernel/ftrace.c
+++ b/arch/ia64/kernel/ftrace.c
@@ -194,9 +194,3 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	flush_icache_range(addr, addr + 16);
 	return 0;
 }
-
-/* run from kstop_machine */
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
diff --git a/arch/microblaze/kernel/ftrace.c b/arch/microblaze/kernel/ftrace.c
index 224eea40e1ee..188749d62709 100644
--- a/arch/microblaze/kernel/ftrace.c
+++ b/arch/microblaze/kernel/ftrace.c
@@ -163,11 +163,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	return ret;
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	unsigned long ip = (unsigned long)(&ftrace_call);
diff --git a/arch/nds32/kernel/ftrace.c b/arch/nds32/kernel/ftrace.c
index 0e23e3a8df6b..f0ef4842d191 100644
--- a/arch/nds32/kernel/ftrace.c
+++ b/arch/nds32/kernel/ftrace.c
@@ -84,11 +84,6 @@ void _ftrace_caller(unsigned long parent_ip)
 	/* restore all state needed by the compiler epilogue */
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 static unsigned long gen_sethi_insn(unsigned long addr)
 {
 	unsigned long opcode = 0x46000000;
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 0a1e75af5382..01581f715737 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -94,11 +94,6 @@ int ftrace_disable_ftrace_graph_caller(void)
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	return 0;
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 7f1e5203de88..4716f4cdc038 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -154,11 +154,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 
 	return ret;
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index 0a464d328467..3fd80397ff52 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -262,11 +262,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	return 0;
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 void arch_ftrace_update_code(int command)
 {
 	if (ftrace_shared_hotpatch_trampoline(NULL))
diff --git a/arch/sh/kernel/ftrace.c b/arch/sh/kernel/ftrace.c
index 295c43315bbe..930001bb8c6a 100644
--- a/arch/sh/kernel/ftrace.c
+++ b/arch/sh/kernel/ftrace.c
@@ -252,11 +252,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	return ftrace_modify_code(rec->ip, old, new);
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/sparc/kernel/ftrace.c b/arch/sparc/kernel/ftrace.c
index 684b84ce397f..eaead3da8e03 100644
--- a/arch/sparc/kernel/ftrace.c
+++ b/arch/sparc/kernel/ftrace.c
@@ -82,11 +82,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	new = ftrace_call_replace(ip, (unsigned long)func);
 	return ftrace_modify_code(ip, old, new);
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 1b3ce3b4a2a2..23d221a9a3cd 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -252,11 +252,6 @@ void arch_ftrace_update_code(int command)
 	ftrace_modify_all_code(command);
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 /* Currently only x86_64 supports dynamic trampolines */
 #ifdef CONFIG_X86_64
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 7efbc8aaf7f6..4c090323198d 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6846,6 +6846,11 @@ void __init ftrace_free_init_mem(void)
 	ftrace_free_mem(NULL, start, end);
 }
 
+int __init __weak ftrace_dyn_arch_init(void)
+{
+	return 0;
+}
+
 void __init ftrace_init(void)
 {
 	extern unsigned long __start_mcount_loc[];
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
