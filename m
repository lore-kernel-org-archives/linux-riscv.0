Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3521D606A327
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E1djx+fZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JdtSp7nC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uR4CYat6DGIcwnIGYQOA74fK/vvzlbRMDg8L3wwyQgg=; b=E1djx+fZayanZciwktzmvi1J+C
	TetuePUjhVAggkW3m6AYsKGLv9vRLDnrZaY45cOnsbSnmmB9nu5xmNIw1g2iWH4bUr9BNO4NGUxmK
	FsR1Xw/41zXc/8PxQkoPnickYLlzhiFqR8UVL7RoLLOWyki8v1dST2CyDPZdgi+ypQbCuNaF3u25/
	fAMgxbJtm/cdknfil6T7v2QGpDhhVf8itcbTjORXh1eOAzKkyOCn2wdfI7c+qBka76Qkq3FS2MeAi
	DuqixLNPlliG7FIIvDAoPrl0fa7tp5AmDveDyR8DnYK2a2u1SEuQSesvQLLCaQ/nfOZIwggL+tqD0
	Dm951/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSL5-00000003CCD-39Az;
	Mon, 23 Nov 2026 11:36:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSL4-00000003CC6-3MPZ
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 11:36:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4303C60623;
	Mon, 23 Nov 2026 11:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BEB1F000C0;
	Mon, 23 Nov 2026 11:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795433761;
	bh=qSB5AX3GYmbt8NSqSdC0z3/9TEkmf19b/WBkZ7CJSaE=;
	h=From:To:Cc:Subject:Date;
	b=JdtSp7nCus0RIJMLqxUSmSxQI4+dWuB2vjcS6IA2wyy4za3iR9ZfDGj+Qsn9k83uY
	 UsBMC//JWkBspQWyuCAifbh4o4de+Sovcho5ITepjJdHBhnOrADJGM0nbsPKnsquAv
	 q32XaKgOEx7hVDQW5repJcqIeDCLyVqXAjqqLEtkJk0cIXi1ajgPXbWJDTK/nedoal
	 jm/sf/tPFTUN76kDVrtVgBlk9FOHsH+3/Q+B9XTxTKf35siwCvD45j6Ie+95LY55pV
	 R1SEg0McNk8l3nx2GM4Wh5ZaNhUwrU35Ur6VQAAXyJCu0I4a4gUrtUNIGSjMynNIlU
	 56FCDqOWcm1LA==
From: Thorsten Blum <blum@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Zishun Yi <vulab@iscas.ac.cn>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH RESEND] riscv: process: Use str_supported_unsupported() in compat_mode_detect()
Date: Mon, 23 Nov 2026 12:34:33 +0100
Message-ID: <20261123113433.8286-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=blum@kernel.org; h=from:subject; bh=yyUUyE+rg2oYLamVmL8mFnSFPdyaZ54Qdrg/OZPV9FA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDNksKicfNE5ZZJtS5LBL5MkJ7wxGW+sv3z0+mr3mLu1+I Kpw/UF7RykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExEmpHhn67XOdZPvdJJK5hr jpt58p5weB1WzpkxJc609bjzxJrNTxgZVu9adL+0KPDJ/oPzLd45n5ge8W6Kf93DtS9cD/us6H+ Qyg4A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace hard-coded strings with the str_supported_unsupported() helper.
This unifies the output and helps the linker with deduplication, which
can result in a smaller binary.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Resending since its dependency commit ccd5ff410feb ("lib/string_choices:
Add str_supported_unsupported() helper") is now in mainline.

 arch/riscv/kernel/process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d1ca..bc6bf7ea5593 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
+#include <linux/string_choices.h>
 #include <linux/tick.h>
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
@@ -134,7 +135,7 @@ static int __init compat_mode_detect(void)
 	csr_write(CSR_STATUS, tmp);
 
 	pr_info("riscv: ELF compat mode %s",
-			compat_mode_supported ? "supported" : "unsupported");
+		str_supported_unsupported(compat_mode_supported));
 
 	return 0;
 }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
