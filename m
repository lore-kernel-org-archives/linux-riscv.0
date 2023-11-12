Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F52FC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6WzUvb5q1W4/GETg2pGgbaVDZSmgNG/YOj847/0jGE=; b=GYfH1ooEA4KvQi
	POSzmWfmwaOv6QnnZhL2ckUBCHIIrN8HZSbrDa3RtoJYtBma6GF22IT5rpntTKjEBVRIRqc23T1JZ
	5dOpnVLzo3/57XHG9OaEJNYq6wXqeN5ykMsoUb9+6PLnyYArglbYSFQmsHwm2B8qSk1uR3OJo0MbI
	RhhWXcGO1pMlqLwgAFWKIPZVwhRAheGMhK6S46WSVOj3LM3Ecm36E40OoRMGDcJY8mV4qVFFtxNad
	s+QiLpit/L5M8eRbaOYHR+d8MP2gHwdypAj4Sg4EppJK5HqF7q+GmRJ6PcTDbcAkAnjgB45nNwT3V
	wL6JzNn1mmERAMb5QuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23l1-00BjEh-1r;
	Sun, 12 Nov 2023 06:15:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23ky-00BjDh-2N
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25CF860B8B;
	Sun, 12 Nov 2023 06:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8497BC433CC;
	Sun, 12 Nov 2023 06:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769738;
	bh=zy+LIqvorCsCX2M/f8auQf0yEixqHw8DL0243s77+7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RM0z84tJA0mRaJMee/k+ux2axfXtnnmJ3Vb+KxOgBWXWNeRBvHdig4yh5SxFL/lQ0
	 0RrdKxAfQFL7jVYOmeEuWUKEWuDoO7tNWc53/eZ5c5AJC3PgcAcPf7+D1rw1+p9Z7s
	 JYx7Kmod9QzBxqdXH5lkw9zW+2FQx1auZTTrL7nLONLkq+gsHo1gqcDVSk4noc1+IV
	 RRUETV07GcboogqBaZbB47abzXtGphvh1F6qvVBifBtCcgerIOVzkbLbmpGnJyB5dM
	 UZoQUmchMmgaX3UEokh6oG7q0vDslWUjM+ykEQrxEK/4i/3MFYIJp5AVvEyR3Mm4Sq
	 Q8Xwhyfhctnng==
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
Subject: [RFC PATCH V2 02/38] riscv: u64ilp32: Remove compat_vdso/
Date: Sun, 12 Nov 2023 01:14:38 -0500
Message-Id: <20231112061514.2306187-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221540_859447_D20D771B 
X-CRM114-Status: UNSURE (   8.88  )
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

After unifying vdso32 & vdso64 into vdso/, we ever needn't compat_vdso
directory. This commit removes the whole compat_vdso/.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/compat_vdso/.gitignore                 | 2 --
 arch/riscv/kernel/compat_vdso/compat_vdso.S              | 8 --------
 arch/riscv/kernel/compat_vdso/compat_vdso.lds.S          | 3 ---
 arch/riscv/kernel/compat_vdso/flush_icache.S             | 3 ---
 arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh | 5 -----
 arch/riscv/kernel/compat_vdso/getcpu.S                   | 3 ---
 arch/riscv/kernel/compat_vdso/note.S                     | 3 ---
 arch/riscv/kernel/compat_vdso/rt_sigreturn.S             | 3 ---
 8 files changed, 30 deletions(-)
 delete mode 100644 arch/riscv/kernel/compat_vdso/.gitignore
 delete mode 100644 arch/riscv/kernel/compat_vdso/compat_vdso.S
 delete mode 100644 arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
 delete mode 100644 arch/riscv/kernel/compat_vdso/flush_icache.S
 delete mode 100755 arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
 delete mode 100644 arch/riscv/kernel/compat_vdso/getcpu.S
 delete mode 100644 arch/riscv/kernel/compat_vdso/note.S
 delete mode 100644 arch/riscv/kernel/compat_vdso/rt_sigreturn.S

diff --git a/arch/riscv/kernel/compat_vdso/.gitignore b/arch/riscv/kernel/compat_vdso/.gitignore
deleted file mode 100644
index 19d83d846c1e..000000000000
--- a/arch/riscv/kernel/compat_vdso/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-compat_vdso.lds
diff --git a/arch/riscv/kernel/compat_vdso/compat_vdso.S b/arch/riscv/kernel/compat_vdso/compat_vdso.S
deleted file mode 100644
index ffd66237e091..000000000000
--- a/arch/riscv/kernel/compat_vdso/compat_vdso.S
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#define	vdso_start	compat_vdso_start
-#define	vdso_end	compat_vdso_end
-
-#define	__VDSO_PATH	"arch/riscv/kernel/compat_vdso/compat_vdso.so"
-
-#include "../vdso/vdso.S"
diff --git a/arch/riscv/kernel/compat_vdso/compat_vdso.lds.S b/arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
deleted file mode 100644
index c7c9355d311e..000000000000
--- a/arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
+++ /dev/null
@@ -1,3 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#include "../vdso/vdso.lds.S"
diff --git a/arch/riscv/kernel/compat_vdso/flush_icache.S b/arch/riscv/kernel/compat_vdso/flush_icache.S
deleted file mode 100644
index 523dd8b96045..000000000000
--- a/arch/riscv/kernel/compat_vdso/flush_icache.S
+++ /dev/null
@@ -1,3 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#include "../vdso/flush_icache.S"
diff --git a/arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh b/arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
deleted file mode 100755
index 8ac070c783b3..000000000000
--- a/arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-LC_ALL=C
-sed -n -e 's/^[0]\+\(0[0-9a-fA-F]*\) . \(__vdso_[a-zA-Z0-9_]*\)$/\#define compat\2_offset\t0x\1/p'
diff --git a/arch/riscv/kernel/compat_vdso/getcpu.S b/arch/riscv/kernel/compat_vdso/getcpu.S
deleted file mode 100644
index 10f463efe271..000000000000
--- a/arch/riscv/kernel/compat_vdso/getcpu.S
+++ /dev/null
@@ -1,3 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#include "../vdso/getcpu.S"
diff --git a/arch/riscv/kernel/compat_vdso/note.S b/arch/riscv/kernel/compat_vdso/note.S
deleted file mode 100644
index b10312907542..000000000000
--- a/arch/riscv/kernel/compat_vdso/note.S
+++ /dev/null
@@ -1,3 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#include "../vdso/note.S"
diff --git a/arch/riscv/kernel/compat_vdso/rt_sigreturn.S b/arch/riscv/kernel/compat_vdso/rt_sigreturn.S
deleted file mode 100644
index 884aada4facc..000000000000
--- a/arch/riscv/kernel/compat_vdso/rt_sigreturn.S
+++ /dev/null
@@ -1,3 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#include "../vdso/rt_sigreturn.S"
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
