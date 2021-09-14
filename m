Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1D4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2150C606A5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2150C606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DLxx5DjhAbVTuwqLdf6XerI4BVbMnDXf5oPCVxEx0A=; b=H6PeNBEbHI7VCU
	RGUMDq95xv4jXKaqRxlp98EpgcEXs84GQVBKQWJHl+kMSZfaC0YwOrEXXmpNEHX8mfQPGbFdfB4JR
	gkBsTaHjndU1t4y9Jyh8R0grlmF0p4XQDCBkS1P3kgzPI3QBB+Puvf+VyitDOOlJLm5BtxdZLEejQ
	+oi/kH/rlOLBh+5D8MCU8yRFVoL2EPQS16m+7vD4mzhYUpuzJ7/wl8MyH6GiLdqtIShOEOuvOrbnX
	C6oqg4Le5V3FkJFTR1MGraq4ozx8lT+fSW70cZ4w/pJhODZ3pjsvpsZOnF6seXTKXlDbxE6/9Fu20
	vOlOKdHfVyEPVhB3wfpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7HS-005YxA-0Y; Tue, 14 Sep 2021 12:11:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7H2-005Yn6-PY; Tue, 14 Sep 2021 12:10:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF0126112E;
 Tue, 14 Sep 2021 12:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621452;
 bh=ctJUbexNag4Ww69LjFDSR84qdpCMaKBOhiN3IwJaXws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eUi18+jGcKYL2ZIvzB4Tdp9umFvvNxr8SxEbgK2vtVURDyopcc4j8SVgQHYRl+oSd
 jD1HDDdHCS0X2qFkxVSwjhCpW6s8Hp96/ONOJXprkzVEv8iiCPPpPOYqaeQC++qK+F
 gMuM2eHySUa6p6L2J2o9DQ8lStY2DIvZxyAiwjDg113m5y+NwLSEqaJgx8B5T++7Lg
 UVHXMyz3FmlndLNHzJ7jUxNrZyF0581QLC+4yGgW9GL8aZV0rNJVKBxnvp5vmlGZgc
 uCZQvfC/GHAQYEp5nHmE0lrfk4JBdK+S+UglEzmm10Apwya4T9Lm64gd4aM4NsUaOa
 Su6kXY2gKmo+A==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Keith Packard <keithpac@amazon.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [RFC PATCH 1/8] arm64: add CPU field to struct thread_info
Date: Tue, 14 Sep 2021 14:10:29 +0200
Message-Id: <20210914121036.3975026-2-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_051052_960985_545B5E4C 
X-CRM114-Status: GOOD (  11.13  )
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

The CPU field will be moved back into thread_info even when
THREAD_INFO_IN_TASK is enabled, so add it back to arm64's definition of
struct thread_info.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/thread_info.h | 1 +
 arch/arm64/kernel/asm-offsets.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 6623c99f0984..c02bc8c183c3 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -42,6 +42,7 @@ struct thread_info {
 	void			*scs_base;
 	void			*scs_sp;
 #endif
+	u32			cpu;
 };
 
 #define thread_saved_pc(tsk)	\
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 551427ae8cc5..cee9f3e9f906 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -29,6 +29,7 @@ int main(void)
   DEFINE(TSK_ACTIVE_MM,		offsetof(struct task_struct, active_mm));
   DEFINE(TSK_CPU,		offsetof(struct task_struct, cpu));
   BLANK();
+  DEFINE(TSK_TI_CPU,		offsetof(struct task_struct, thread_info.cpu));
   DEFINE(TSK_TI_FLAGS,		offsetof(struct task_struct, thread_info.flags));
   DEFINE(TSK_TI_PREEMPT,	offsetof(struct task_struct, thread_info.preempt_count));
 #ifdef CONFIG_ARM64_SW_TTBR0_PAN
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
