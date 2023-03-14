Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD42C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1mD1Y6Ws8RrcFRS7BrKSWrlJZ52Shl4YEOY+9pJ39E=; b=tPGtZZ3lKXbVX9
	keTVqeI/TSmSxe4PhWWpvKIdZohn3fuMx4zh+oK2/OkfKY/AscwqYmhz8aNoqnwHitPMBrBIr6sPM
	f0fRl/FhtWj6eFBer9VfxDxLuhNqp3BcsKRajDEWn2g2z2BcZw0tIDxFjFqpiDV1mqJ/0/KifS5DU
	SIAGayBmWUgRn7B488AQRcBSs+COq7eO476qkB2QXzJtsPHzZXiSeYmI2aXIepyPd5aBRL2x1zGi5
	+pQwywk5DC3spVp9XWNQZipnvExm1ILG0YrRMF1elcfcvhZ5YlQN3o92MpXN+XgKvphCfU3qr7x8Z
	YQ+YQUZL7ETto+/4Ospg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc9Rt-00BCIy-1V;
	Tue, 14 Mar 2023 18:32:37 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc9Rp-00BCI4-0m
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 18:32:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id y11so17590052plg.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678818753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tga5shMHyjc0TB9sW2hC3q3qhXdH8jnVVmQsmewODbI=;
        b=fqdENcGiupBXLWJzcac75bZHKj70wOfrBAIlfGPvxgr7ssgFuE2Pf58C/qEZjdxlZw
         Dt4Fn4iy/JmCqs+dRf5tBs676FfzjpVWwNOBa/NduDczdGAGUHdLmd67xbvFLUOEyI35
         pSz5+LCMRdzzljXC068womITkk7ozLxH5T3+0JohxZIunhBOITQEGM7okiH0VW5lHSU3
         MPI4aaMN53SpTf6XUApffLj9DNn6W1WOxT6iPtwlA6vn8DlKpMIlY7PG7ACn5IYJl/Eb
         VF4hyc0UJFBJi+OLGqtpdE1C3TfFAYepbKoZXDLzzO7I/9BNf7dzlS7F7gGEhuESTwqn
         OWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tga5shMHyjc0TB9sW2hC3q3qhXdH8jnVVmQsmewODbI=;
        b=mRJe+Yt+Um/7xdlCMvzKnpUZRxvraSO/T22IHdeml5qZYZe/pwwWH0z7ND1opXMkUm
         zrDNef0kUx6rJCmiQbGo76ldhOQjNE/DOwgF5jOsr8wt5TMD4+xjGPlBT/W4CNIVkBMo
         Reethu+K+ghtQ2p09dcvoG99lQ4oYWpYcjbf0d0CLCKAa88ZbYao2AXwK7QyienvMIdq
         +jsjQ3Gnpnm51zXCq4wbaUSPiez2QQyzQrwJgc29Q64+JUyjxxSB1/xHY4Yp8UmA1Baf
         0uq18aLpj8wb58vy8k8jT9exXohGpihthP4bQRUwcbLFB9Dc4JqnKTjgjfdguTij6WgB
         2D8A==
X-Gm-Message-State: AO0yUKWpCxKEDmezfDcCzh9ZRcf+bWzjG+uNBd4fRZzVGrbRS7JsZPxr
	qxDIp66cL5DZ8DwrHszERNleuw==
X-Google-Smtp-Source: AK7set9v9zIkmYb9ikpU9Da6c1URJ3+lBxePQISeL3aEwed0jfmqNAFJLGyZD2Ib8PdTkZhgH0knog==
X-Received: by 2002:a17:902:facf:b0:19e:dc0e:1269 with SMTP id ld15-20020a170902facf00b0019edc0e1269mr55859plb.7.1678818752836;
        Tue, 14 Mar 2023 11:32:32 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id kn3-20020a170903078300b0019d397b0f18sm2072019plb.214.2023.03.14.11.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:32:32 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 1/6] RISC-V: Move struct riscv_cpuinfo to new header
Date: Tue, 14 Mar 2023 11:32:15 -0700
Message-Id: <20230314183220.513101-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314183220.513101-1-evan@rivosinc.com>
References: <20230314183220.513101-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_113233_303734_67FEC31F 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, heiko@sntech.de, Atish Patra <atishp@rivosinc.com>, Randy Dunlap <rdunlap@infradead.org>, vineetg@rivosinc.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, slewis@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, Dao Lu <daolu@rivosinc.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In preparation for tracking and exposing microarchitectural details to
userspace (like whether or not unaligned accesses are fast), move the
riscv_cpuinfo struct out to its own new cpufeatures.h header. It will
need to be used by more than just cpu.c.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---

(no changes since v3)

Changes in v3:
 - Updated copyright date in cpufeature.h
 - Fixed typo in cpufeature.h comment (Conor)

Changes in v2:
 - Factored the move of struct riscv_cpuinfo to its own header

 arch/riscv/include/asm/cpufeature.h | 21 +++++++++++++++++++++
 arch/riscv/kernel/cpu.c             |  8 ++------
 2 files changed, 23 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpufeature.h

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 000000000000..66ebaae449c8
--- /dev/null
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022-2023 Rivos, Inc
+ */
+
+#ifndef _ASM_CPUFEATURE_H
+#define _ASM_CPUFEATURE_H
+
+/*
+ * These are probed via a device_initcall(), via either the SBI or directly
+ * from the corresponding CSRs.
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
