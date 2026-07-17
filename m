Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B96C44516
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=log91quMDygMO9lyiqAiI24v2t45Gq6gVlUHDTc41lk=; b=bvdLLfzFgfs38V
	VdXizTJ9ZZ5/0wFVpNSsjLuup7i9Zx86H2B8ddvGMmUgCNSosmxpFGuuNqwu+rio4DETXU03KfVhR
	nlZmMUDZmbAJN08boutzqSwHbd0ee+aVj21hocP/EioR0Vh3eExlGpPlnlLOIpsj6avU+ERoGu/z+
	9ra6XvbCNcWdM/ON6M2lVMDBIVN4ywOtjHsKgtCilWcrHFLc88aU5QeKNhNNrKpz1MzTA/k03Pfvx
	fUCsw4SVMZzydMJ+aiVfr6fiUokpVuqS/lMBOusAdXn9wmSLJo2vulHWEavoeVmApibpXH4Fs8OPl
	T2+OTtJ1XCM4k+SURZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhrf-00000002JXJ-49GS;
	Fri, 17 Jul 2026 12:40:27 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhrc-00000002JW5-1YjB
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 12:40:26 +0000
Received: from [127.0.0.2] (unknown [123.116.46.73])
	by APP-05 (Coremail) with SMTP id zQCowAB35T+xIlpq9FsHAA--.9215S2;
	Fri, 17 Jul 2026 20:40:17 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 17 Jul 2026 20:40:06 +0800
Subject: [PATCH] riscv: cmpxchg: Use .option arch for Zacas and Zabha
MIME-Version: 1.0
Message-Id: <20260717-riscv-no-zacas-zabha-in-march-v1-1-82b5b0799fb6@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAxA0auUrA20EZzWq4iLNEYnglNJtIild
 3fUzYe3+QuEumnAvlnAdbawqVR0mwYkc7ko2qkaqKVdm7qEbiEzlgnfLBy1Y2a0gjd2yUi9Uup
 5GLZMUB9317O9fv/D8e94jleVx3cK6/oB9ogDg4EAAAA=
X-Change-ID: 20260717-riscv-no-zacas-zabha-in-march-28e278a993a2
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Nam Cao <namcao@linutronix.de>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: zQCowAB35T+xIlpq9FsHAA--.9215S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFyfKrWfurWUXw4rXr47urg_yoW5CryDpr
	Wqkr4fCrW8Ar97Zr97try5Xr1FkwsxK3sI9ryqkryUZ39I9rW0vrnYkw1rJ34UJFWIv34x
	uw45ury5u3WUZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU18sqtUUUU
	U==
X-Originating-IP: [123.116.46.73]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_054024_794812_2FDF7612 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

Instead of adding these to -march globally, use .option arch to use
instructions from these extensions only in code paths where we know they
are available, like how it is done for most other extensions.
TOOLCHAIN_HAS_{ZACAS,ZABHA} already depend on AS_HAS_OPTION_ARCH, so
this is not a functionality regression even on older assemblers.

Although the compiler is unlikely to generate atomics on its own accord,
this aligns handling of Zacas and Zabha with most other extensions and
improves consistency on how assembly code requiring extra extensions is
written in kernel code.

This is analogous to the use of __LSE_PREAMBLE or .arch_extension lse in
arm64 code.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/Makefile              |  6 ------
 arch/riscv/include/asm/cmpxchg.h | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index ce0cc737f870..4d74b141122c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -75,12 +75,6 @@ else
 riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
 endif
 
-# Check if the toolchain supports Zacas
-riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
-
-# Check if the toolchain supports Zabha
-riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
-
 KBUILD_BASE_ISA = -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
 export KBUILD_BASE_ISA
 
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 8712cf9c69dc..662e160b0522 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -23,7 +23,10 @@
 	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {		\
 		__asm__ __volatile__ (						\
 			prepend							\
+			"	.option push\n"					\
+			"	.option arch, +zabha\n"				\
 			"	amoswap" swap_sfx " %0, %z2, %1\n"		\
+			"	.option pop\n"					\
 			swap_append						\
 			: "=&r" (r), "+A" (*(p))				\
 			: "rJ" (n)						\
@@ -141,7 +144,10 @@
 										\
 		__asm__ __volatile__ (						\
 			cas_prepend							\
+			"	.option push\n"					\
+			"	.option arch, +zacas, +zabha\n"				\
 			"	amocas" cas_sfx " %0, %z2, %1\n"		\
+			"	.option pop\n"					\
 			cas_append							\
 			: "+&r" (r), "+A" (*(p))				\
 			: "rJ" (n)						\
@@ -188,7 +194,10 @@
 									\
 		__asm__ __volatile__ (					\
 			cas_prepend					\
+			"	.option push\n"				\
+			"	.option arch, +zacas\n"			\
 			"	amocas" cas_sfx " %0, %z2, %1\n"	\
+			"	.option pop\n"				\
 			cas_append					\
 			: "+&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
@@ -340,7 +349,10 @@ union __u128_halves {
 	register unsigned long t4 asm ("t4") = __ho.high;			\
 										\
 	__asm__ __volatile__ (							\
-		 "       amocas.q" cas_sfx " %0, %z3, %2"			\
+		 "       .option push\n"					\
+		 "       .option arch, +zacas\n"				\
+		 "       amocas.q" cas_sfx " %0, %z3, %2\n"			\
+		 "       .option pop\n"						\
 		 : "+&r" (t3), "+&r" (t4), "+A" (*(p))				\
 		 : "rJ" (t1), "rJ" (t2)						\
 		 : "memory");							\

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260717-riscv-no-zacas-zabha-in-march-28e278a993a2

Best regards,
--  
Vivian Wang <wangruikang@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
