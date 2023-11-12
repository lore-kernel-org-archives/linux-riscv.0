Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281F3C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsZ+ctCk1tFDMyws1A3us57UZJmKYQEAhRRZuChjPz4=; b=yKB5FiuV6LT4KD
	1JO+exey8ZV5Wy9vHqpxRyHv5tO8Is+skLKAJycZkEvUcpaXJlH5woY4FGZ8f+AGECunM6apdYsc7
	+G3Pie77+V9oPTB9dDUjL1s3FKjOdVVVUVBGmZkIWN2pftmDzij1duIx4dXP+95X2mInGajklN6zj
	C/iInn5W2ylWXURuLvbq+wEcGXMEK9CWPOjabdu48XvWa+x+Dt+C4ZdL86WkiTbQ7Brs3ZrKQTYai
	9Vadg9x8x1/wVunB9L0OYooZDfstKFhAmf03Izs3gfgmeUjV8bUXTaFQzrDkMSwAWtpYpLXAow557
	k6HVjGMMTcrcULbwPsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23lk-00BjYX-2c;
	Sun, 12 Nov 2023 06:16:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23lh-00BjTt-16
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 35A27B80A1F;
	Sun, 12 Nov 2023 06:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F126C43395;
	Sun, 12 Nov 2023 06:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769782;
	bh=c/XztdxeZEb8IqwcMkuoEz/d2lH7K8y6SAjCB4w9a8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=boE1zCDRZd99yF7fq4wSEnK3GZSGwQ3y48zx3AyteCaYr2xiZaQ3Cqta7dphkuQav
	 JsXrIEmI7/L+FoOIP7vXpjhKk60uSnEj6qWvRdCgOCqtBWvh3jO3cmJlurSuxTVGgt
	 Cuil7yr8pjzmWRurKglAKkTYEKfu9r3uer2cCuDhvPEawE+gmnGt3FsMMjwaUKGYYJ
	 mG6BLk/AWF0pFnFwuXpzxrxmp1s2n8KlOH/XxpnEGtmjJQCIpwZpQ7qpdkmYDxJysN
	 tO9TKi5TlnSZF+zanRFWdm38dyJmfonLs13kI4VPKhFNaqvQEqXKXbYOdO4rdwcDRl
	 aqilmLVLIsaTA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 09/38] riscv: u64ilp32: Add xlen_t in user_regs_struct
Date: Sun, 12 Nov 2023 01:14:45 -0500
Message-Id: <20231112061514.2306187-10-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221625_648739_3B8FE66A 
X-CRM114-Status: UNSURE (   8.19  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The u64ilp32 xlen is 64-bit, not the size of long, so change the
elements of user_regs_struct with xlen_t to match different
__riscv_xlen.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/uapi/asm/ptrace.h | 72 +++++++++++++++-------------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index e17c550986a6..39e8d10eebaf 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -10,6 +10,14 @@
 
 #include <linux/types.h>
 
+#if __riscv_xlen == 64
+typedef __u64 xlen_t;
+#elif __riscv_xlen == 32
+typedef __u32 xlen_t;
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
 /*
  * User-mode register state for core dumps, ptrace, sigcontext
  *
@@ -17,38 +25,38 @@
  * struct user_regs_struct must form a prefix of struct pt_regs.
  */
 struct user_regs_struct {
-	unsigned long pc;
-	unsigned long ra;
-	unsigned long sp;
-	unsigned long gp;
-	unsigned long tp;
-	unsigned long t0;
-	unsigned long t1;
-	unsigned long t2;
-	unsigned long s0;
-	unsigned long s1;
-	unsigned long a0;
-	unsigned long a1;
-	unsigned long a2;
-	unsigned long a3;
-	unsigned long a4;
-	unsigned long a5;
-	unsigned long a6;
-	unsigned long a7;
-	unsigned long s2;
-	unsigned long s3;
-	unsigned long s4;
-	unsigned long s5;
-	unsigned long s6;
-	unsigned long s7;
-	unsigned long s8;
-	unsigned long s9;
-	unsigned long s10;
-	unsigned long s11;
-	unsigned long t3;
-	unsigned long t4;
-	unsigned long t5;
-	unsigned long t6;
+	xlen_t pc;
+	xlen_t ra;
+	xlen_t sp;
+	xlen_t gp;
+	xlen_t tp;
+	xlen_t t0;
+	xlen_t t1;
+	xlen_t t2;
+	xlen_t s0;
+	xlen_t s1;
+	xlen_t a0;
+	xlen_t a1;
+	xlen_t a2;
+	xlen_t a3;
+	xlen_t a4;
+	xlen_t a5;
+	xlen_t a6;
+	xlen_t a7;
+	xlen_t s2;
+	xlen_t s3;
+	xlen_t s4;
+	xlen_t s5;
+	xlen_t s6;
+	xlen_t s7;
+	xlen_t s8;
+	xlen_t s9;
+	xlen_t s10;
+	xlen_t s11;
+	xlen_t t3;
+	xlen_t t4;
+	xlen_t t5;
+	xlen_t t6;
 };
 
 struct __riscv_f_ext_state {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
