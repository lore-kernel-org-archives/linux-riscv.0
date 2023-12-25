Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338F9C47074
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlUWaDIK7ak3OJd9FdKt/T7/U3C+omNBCCd1CywPBfM=; b=hIFYnefWuV2kxU
	p60eq1Fx+FrpPC7urgPCOjYeqTKuf2GCd8HYq4Ag4o47Zq6DHRW51bBTbCR2w++WmTsrqkMO297Rj
	YSdcKjEO0+mTMO+8BwnyxokWglNtfCTd5gyay0m/I+8dDREp6YjtxVK3AkUEQT4h0oO3I9CsRaM95
	zf6/0bSg0Zb+ujDaeXlzSryKShLZtOfj4hbKFSDvy+d8HdcaqOI62x08h8ax3Zx0bZdxvFv5pav5C
	3BkapT60/fRyR22eh+mwbjfS2Jo5+o4SxtKjuzq1WddjJvYSMmj2xytSEELzqnugY+L0jx4nCFuEy
	NsazkrqHB+N6O9Arew/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkYG-00AsDP-1p;
	Mon, 25 Dec 2023 12:59:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkYB-00AsAW-1t
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 12:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FBB960C55;
	Mon, 25 Dec 2023 12:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88CDC433CA;
	Mon, 25 Dec 2023 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703509158;
	bh=3EFSZ9V3K5SZT469njNqLUEIh+v/uQJT8cZLmH7rXc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=exz7WcxHSFJYnV0zYjZwtNq4f0lLoSqmVc7aPMOkBI7D3SflUAJ+y1zbjwumSVf0e
	 NgsXqStjRs3ywmZfyIlZxtyRQONyU88LjNuMJDA2C1VUNoOo8diKKs0mHtJxhcgG3J
	 KUjiuhXwlLSxAn3BHVB7Ft6B9V8kBpoxJOtElXbXyOdClU85R84Jd8tJRwrZoFfzQh
	 LsfSFFGjGX0xvqYm2QIp1L5eqRKcHMi1JVeZSPmTU1BarJ80nAAgNGd0bQPBVKy7iA
	 HI2HR1MPmJQoFnxOoU5SEV8iIO4ctoOpC8X/J9f/X/q+H7AFJwLTlqjWLE2vtSwYau
	 sf5b6rKBzpvPA==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	panqinglin2020@iscas.ac.cn,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	leobras@redhat.com,
	peterz@infradead.org,
	anup@brainfault.org,
	keescook@chromium.org,
	wuwei2016@iscas.ac.cn,
	xiaoguang.xing@sophgo.com,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	uwu@icenowy.me,
	jszhang@kernel.org,
	wefu@redhat.com,
	atishp@atishpatra.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V12 03/14] riscv: errata: Move errata vendor func-id into vendorid_list.h
Date: Mon, 25 Dec 2023 07:58:36 -0500
Message-Id: <20231225125847.2778638-4-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231225125847.2778638-1-guoren@kernel.org>
References: <20231225125847.2778638-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_045919_668134_B776549C 
X-CRM114-Status: UNSURE (   7.06  )
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

Move errata vendor func-id definitions from errata_list into
vendorid_list.h. Unifying these definitions is also for following
rwonce errata implementation.

Suggested-by: Leonardo Bras <leobras@redhat.com>
Link: https://lore.kernel.org/linux-riscv/ZQLFJ1cmQ8PAoMHm@redhat.com/
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/errata_list.h   | 18 ------------------
 arch/riscv/include/asm/vendorid_list.h | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 83ed25e43553..31bbd9840e97 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -11,24 +11,6 @@
 #include <asm/hwcap.h>
 #include <asm/vendorid_list.h>
 
-#ifdef CONFIG_ERRATA_ANDES
-#define ERRATA_ANDESTECH_NO_IOCP	0
-#define ERRATA_ANDESTECH_NUMBER		1
-#endif
-
-#ifdef CONFIG_ERRATA_SIFIVE
-#define	ERRATA_SIFIVE_CIP_453 0
-#define	ERRATA_SIFIVE_CIP_1200 1
-#define	ERRATA_SIFIVE_NUMBER 2
-#endif
-
-#ifdef CONFIG_ERRATA_THEAD
-#define	ERRATA_THEAD_PBMT 0
-#define	ERRATA_THEAD_CMO 1
-#define	ERRATA_THEAD_PMU 2
-#define	ERRATA_THEAD_NUMBER 3
-#endif
-
 #ifdef __ASSEMBLY__
 
 #define ALT_INSN_FAULT(x)						\
diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index e55407ace0c3..c503373193d2 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -9,4 +9,22 @@
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
+#ifdef CONFIG_ERRATA_ANDES
+#define ERRATA_ANDESTECH_NO_IOCP	0
+#define ERRATA_ANDESTECH_NUMBER		1
+#endif
+
+#ifdef CONFIG_ERRATA_SIFIVE
+#define	ERRATA_SIFIVE_CIP_453 0
+#define	ERRATA_SIFIVE_CIP_1200 1
+#define	ERRATA_SIFIVE_NUMBER 2
+#endif
+
+#ifdef CONFIG_ERRATA_THEAD
+#define	ERRATA_THEAD_PBMT 0
+#define	ERRATA_THEAD_CMO 1
+#define	ERRATA_THEAD_PMU 2
+#define	ERRATA_THEAD_NUMBER 3
+#endif
+
 #endif
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
