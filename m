Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42EAC05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Al0dY2aScBW4IjCxtKPozWYp2UQ4DH84lHuYTICTLCY=; b=01S/53LdXlmQnx
	jyi0rg+9itUVcVTwzEZ1ccQ75HXXIUoV8bsW2ws5mU70vuBGrswSBbMlNyY9pFc2Bo2moG25wfoCa
	bMtYPE20KpTREnQQYorFwnXPvsjl/zIruuuyvCGAVYpfODABFBZcVmP684iBwLiH6rUZCfwBSrWYU
	jNz6kmvgEeOgJjUPpBm+xTOd1ee/dEoxPUN+e2pQkBo4Jm8v3aBpqKu/9IOvzREjOSsl6j78vvoKk
	irVjKY0/HRQsq1LtPyYyZQ9T48z5VB9Lt+Czg9TPiRNQ8ZYkThTL/LIK7QZLJ+dFjFGCJQqsbJK0v
	pNsvo3iGfdFpAU8vUEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7tj-009oZa-Uc; Mon, 06 Feb 2023 20:15:31 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7tf-009oVj-MG
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 20:15:29 +0000
Received: by mail-pj1-x102e.google.com with SMTP id mi9so12713562pjb.4
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 12:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3E7gTy1SZ/rYCbfPiq6VlVdMXLKt386NsSmOIvpWA4=;
        b=d7Hb5NLdauK+98+KYLb/5jnKRBJ18m6p1tGFFJIg+5BAzF9yTJrYEN83GG6vZFh36v
         yr6yVgcyJ0S3/UU5WvW8M1/P37bmvL4Qp6ruOAw+JCf/J5yfqQXc+gcdzmQMVDGFrTIX
         ajvfH5AbA9VwC8DX/Tz8SjG+NMTj4W8ZCQyWa0DERSaTTLttMrQ+n4U267it20SgXkDw
         miF94exCJq5BxV7x6FTNeEfXwfzPfrQWoY+YdVLwg5nN9N7XnIOJR77DL4AomYm4z3Hn
         SPOD+nriiYYT8z1W9e5yUDnA6YrYR7vt0joB6qLOww83G9Z7FYGE8w7rRbAvB21rawh5
         A4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3E7gTy1SZ/rYCbfPiq6VlVdMXLKt386NsSmOIvpWA4=;
        b=IbviilmPX/tv3IpkaGXb4M1SePF+Ah3j3fmDxJkFHvZjo7b2cNmLYMw6zdC4kvs2t7
         SsCn7B828Ptj4cCYw1fdki0cj1eirOGthQfXul+XPf0NLYdWrFRU6jt5MIHZa+eLQCyO
         t0a0CkmxoTny98TZ5S9GugY7HpxcA4SXDO9/MOPioapQ40E+0NjqW5bfyYilG+ncfYac
         b5v25ZA4YmW774easuG/ZIhyl50nWch4dMkGWKO1bINX8+vCIXutQT32SP2Uogds4gw+
         3m3oLx4Pgiak7r9PfJgg6cBV70OFkFhC5OeuyegXCnFeRVCX5wlRYYs1J4TuupAdldKR
         OyjQ==
X-Gm-Message-State: AO0yUKVMQOxitnylusq8PH/TIxhNA9u7zpHHxu3QBR4Wqbvcy5WuQXRa
	CN1UBkyatV8H+AlhLLEWxKgKvA==
X-Google-Smtp-Source: AK7set89wInCODEUg3p17p5zHU1W/mDyBIfYFOL5qrDCXusDtTme4YBO8NalJNVzABW6CNbgFZA8XQ==
X-Received: by 2002:a05:6a20:8421:b0:bf:bcfb:1fc2 with SMTP id c33-20020a056a20842100b000bfbcfb1fc2mr884580pzd.45.1675714521714;
        Mon, 06 Feb 2023 12:15:21 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k10-20020a63ab4a000000b004df4fbb9823sm6425079pgp.68.2023.02.06.12.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 12:15:21 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 1/6] RISC-V: Move struct riscv_cpuinfo to new header
Date: Mon,  6 Feb 2023 12:14:50 -0800
Message-Id: <20230206201455.1790329-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206201455.1790329-1-evan@rivosinc.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_121527_732308_9DABE334 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, heiko@sntech.de, Atish Patra <atishp@rivosinc.com>, Randy Dunlap <rdunlap@infradead.org>, vineetg@rivosinc.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, slewis@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In preparation for tracking and exposing microarchitectural details to
userspace (like whether or not unaligned accesses are fast), move the
riscv_cpuinfo struct out to its own new cpufeatures.h header. It will
need to be used by more than just cpu.c.

Signed-off-by: Evan Green <evan@rivosinc.com>
---

(no changes since v1)

 arch/riscv/include/asm/cpufeature.h | 21 +++++++++++++++++++++
 arch/riscv/kernel/cpu.c             |  8 ++------
 2 files changed, 23 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpufeature.h

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 000000000000..66c251d98290
--- /dev/null
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022 Rivos, Inc
+ */
+
+#ifndef _ASM_CPUFEATURE_H
+#define _ASM_CPUFEATURE_H
+
+/*
+ * These are probed via a device_initcall(), via either the SBI or directly
+ * from the cooresponding CSRs.
+ */
+struct riscv_cpuinfo {
+	unsigned long mvendorid;
+	unsigned long marchid;
+	unsigned long mimpid;
+};
+
+DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
+
+#endif
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..684e5419d37d 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
@@ -70,12 +71,7 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
-struct riscv_cpuinfo {
-	unsigned long mvendorid;
-	unsigned long marchid;
-	unsigned long mimpid;
-};
-static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
+DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
