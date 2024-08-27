Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3413C5320E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4pqr9xrKgCuO21zTlixaLeJDeUlaViE22gbbHIhkN8=; b=lw14jBsCFnXmy0
	LAw2vynI23zXutKMxBo8pLYUgTHpqcpO4TKKHmVyos53Suft/oH2bNXZII9w/WcqNzbyih2Nj27cX
	tdg63HutJ7rwnylts3J9xfT4yWXeEj4+3/LXI8rBdzIQsYWC939tWwEC6++58Q+fxDdZ7fT0YFlI7
	7VwGt7BiMlexkAqJ4PRuzHJ3GgrN7jjWbJuGCHUB0Ughtcl5KBodW9eEHJmTjlctwmfTGTECp4JeY
	cHUcjfJ/GF/BhGOW7c92Nyb/YzPOnChVwf3gvWtb12pD5m9grUh05vbT6gKln647TZmVw1UFCj/D3
	yI5XRrFQZkCGLoLS0HkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirEz-0000000ALNG-1ToC;
	Tue, 27 Aug 2024 08:07:49 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirEw-0000000ALM2-1KER
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 08:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1724746064; bh=Rpaxy/Sgp6KQtqGI36Fiss4HXP2gm06tq/QCoeKMT0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LWXRsSHZMmnkzY56Qn2LBxhp9LAYEattZ19JeynT8+5FJItJlx5Q/WYv6FyQFDGxQ
	 X3rw4VqaYrwCfxzojwBsXq0YGQWjALY9uhtdORPJJ37xTp5WVO9HEziVB0yQQDql+8
	 ZdcKg4UH5WOiCag5zdJbFlHhGuy8DS/diytSI1ZM=
Received: from cyy-pc.lan ([240e:379:224b:5f00:16b6:fb41:2849:da9d])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 1CBA7234; Tue, 27 Aug 2024 16:07:11 +0800
X-QQ-mid: xmsmtpt1724746041tien190zy
Message-ID: <tencent_C8DB706163A442181BBBF946053FB4311C09@qq.com>
X-QQ-XMAILINFO: N26DAMVpW7UE3a09X6sZWH6ObhF0zWKAG1iocK70Ucurce3lGwQzSWE77xpTeW
	 EqEPeUGMD0x2hA4rUWze2dn5QDH8FpiDrO2prf2xK3ga4U8M6QaNLTL3SIvQPCxJM2IC9AW4AONO
	 hlVF09EjXZwVMploet79noqL26Gbn3Xnho3M2xUdLx7wPpGVWT1vFDBHqgjZyNe94nNq1BYoWWVZ
	 +4EoD34cZmH2lCbaTrYnvvzdvYpNQ9B9fF/oYm1Y9851FNZsx41c3AhZrJ+nXQzL4eN1sqfxNwca
	 LoOuCtlfLQHzzdZ6hkKfZLQWRg7G7wWNGiuNUIkxJXe5LYxQzj42RKBT4YIK2W6okSHxHTzsfRq2
	 QYTyuSaQbYQLsaX6weZVRZPFGfq2QjwP/ZWvkSkBdPwYsGJ3oyK9FKqRK5qnq4Ugq+KRfMbdbPso
	 NK9mkiL3P9itoJnXQtIuADVnubRksEbxgYvNuZ5OllfwHXdHMS5LRvgVp5llS7bwnJQNhtBJXq80
	 4O1QMappEnv72PF+SlgSRsUdmp99SZ2naZP+ZvPzDqkTNVYgGIiEZoAzs8aVkKOfB2jCVboOsmRq
	 UuiHFm7YzEGN8AVPJqIPYJFaC7aG+XTHB2xvwXfLUHwtF+GTzr/PaXP6A8PTuU22lAMxZtKq4Kpb
	 aIQV5CGU5SBZEUf5tGfwvkxAOeVc8XLVJwdrcESsdLCOSSODj+QXS3Q1ecUJXHAB0ElWe25mYxoG
	 Dd4mKr9PzczQ/+D8G39hWyRFmuE5IV6tRG2pF5cjAFXR7JMZSPMlVcqRnA4LDXdgfNm8vK4gK6eP
	 FK+PJOomGD0nFoaoo8jB/Hpkv4NG3zEytcsX/tez2/JJUjSDE1EnVlu3Elf559dORsP6YdUjf8gq
	 L0o/yy2XX4C/R9dJP8upMidMeBaGI3tHWc12D6P7YHofZqEx5/XekKef60w+vTBt74r3DBMdEhUM
	 rbjydD3CC8T4FJJLSvryzCkIc3IPKubPQuhGgun2FFKa3zb/NMpH6qb6Mc7uC0FJX1NxJZEEjTVx
	 nJUoY4cQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Levi Zim <rsworktech@outlook.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-kselftest@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v3 2/3] RISC-V: mm: not use hint addr as upper bound
Date: Tue, 27 Aug 2024 16:07:06 +0800
X-OQ-MSGID: <20240827080707.3788836-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
References: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_010746_666371_0F42B6D7 
X-CRM114-Status: GOOD (  14.66  )
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

This patch reverted the meaning of the addr parameter in the mmap syscall
change from the previous commit b5b4287accd7 ("riscv: mm: Use hint address
in mmap if available") from patch[1] which treats hint addr + size as the
upper bound of the mmap return address. Result in ENOMEM error caused when
hint address + size is not big enough.

Thus, this patch makes the behavior of mmap syscall to align with x86,
arm64, powerpc by only limiting the address space to DEFAULT_MAP_WINDOW
which is defined as not larger than 47-bit. If a user program wants to
use sv57 address space, it can use mmap with a hint address larger than
BIT(47) as it is already documented in x86 and arm64.

[1] https://lore.kernel.org/linux-riscv/20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/include/asm/processor.h | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 8702b8721a27..faf3e230ab24 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,22 +13,17 @@
 #include <vdso/processor.h>
 
 #include <asm/ptrace.h>
+#include <asm/mman.h>
 
-/*
- * addr is a hint to the maximum userspace address that mmap should provide, so
- * this macro needs to return the largest address space available so that
- * mmap_end < addr, being mmap_end the top of that address space.
- * See Documentation/arch/riscv/vm-layout.rst for more details.
- */
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
 	unsigned long mmap_end;					\
 	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || is_compat_task() ||			\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
+	if (((_addr + len) > DEFAULT_MAP_WINDOW) ||		\
+	    ((flags) & MAP_FIXED))				\
 		mmap_end = STACK_TOP_MAX;			\
 	else							\
-		mmap_end = (_addr + len);			\
+		mmap_end = DEFAULT_MAP_WINDOW;			\
 	mmap_end;						\
 })
 
@@ -38,11 +33,10 @@
 	typeof(addr) _addr = (addr);				\
 	typeof(base) _base = (base);				\
 	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || is_compat_task() || 		\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_base = (_base);				\
+	if ((_addr + len) > DEFAULT_MAP_WINDOW)			\
+		mmap_base = (STACK_TOP_MAX - rnd_gap);		\
 	else							\
-		mmap_base = (_addr + len) - rnd_gap;		\
+		mmap_base = (_base);				\
 	mmap_base;						\
 })
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
