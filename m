Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4A8C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z93FrsjsuXG6joZZPpdZgL0iPAYwI/jsSAD0lVzTdiM=; b=sZOsPV5KqhF/CE
	exlSPVWhFUC9Cm1PFxjtqz4OVQAhyqXD9+dZwizJooCOPSRXu194eRMU3Z3uMCljczuH9J+GUobaV
	RlwWskK3zPui0Eu7G6x+/Eb44cNMFBC4VUs2/8RDyTgqsEiqZIsSFCTGfkKiYD1wqK3oAjYn2Fx7R
	eewMcmCA0RL+YIFnBKOPwtXqO0jTfyo+ugY7fBSaVHIrMHM3lShUzJcZgNC49cU9amxdysst2qPSP
	TNyhK0Wc5j6rkCc4xfzZb7HDvOZc/XyuZIPvenY/GHo0tEOqqxiSI6K2o0kUZTNFpWNzy7Wjy7f2n
	vrYChjzMXXRAXfvo739A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVD1x-00000004Na5-1QYt;
	Wed, 31 Jan 2024 16:01:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBus-0000000407j-0Nki
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 14:50:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33ae4205ad8so3013702f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 06:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706712614; x=1707317414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgAdMMq2AoWWNilPNigg7Nbpcu7FSjABsk32vurOK/A=;
        b=lmKvyYSjvWjfdyRny3BQffnJZ/10tzQAEQdIpzbQiYN97reDKSGxTRPOYQQEkX8maf
         nYTK4oPE8Hb8oeE/yYwaZ09s5b0FuswzJN724B/1/ze4HYtkOIdK//a1n/wWX+R7r4Pg
         VXcwfRUlgV5RTR6I3ASSL6o+wiOqe8z8dJAmeOEkP551dIzaHlS3wPzrvJcxblOdS3Eg
         6ilGmeu7d1yjcf+5rcbm5lzugXloSwghfcS6XPIKW6y4Ozmfvm8RY+8DtRpjC2owejfH
         Lqdh/fNjUWnCU8pmGAuajFp6RU009N/Lrs7F6Ycju4SXkTXmf4ErwbRbD0+ZA6DIifC0
         Qv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706712614; x=1707317414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgAdMMq2AoWWNilPNigg7Nbpcu7FSjABsk32vurOK/A=;
        b=e9wFz3QC8xOxY7+Kpb0jztHK5wukdossyLwDNneXxKz+QGrllQEEiAfg1cY3Kh/zZz
         jFk9eJFqjZShDKnL7mM4HuJy7KR21oU9+BsoTAyHxO+ZiC5yeWxiIVLvgxfDbMc3t4pG
         0GupV4dAT79yPQkfXr5A+nJpDwNym4wIzOhrb5j2u0bRqjyqrCdzTG5GXaZUdtQePAvB
         A7rUoJRPdEQCCXmzXqxjtexK9opv4A18wD+aAqyQ8pLoEe8KbFs+3egJ892ADfwvTCJT
         2ZiSUu695fyq8S3gXTJfMqkQPSZeT7/TuhCECOeVtwm+pKuJOmgRfNLWJre6hwPC2a3H
         KITg==
X-Gm-Message-State: AOJu0YyeyxzpRe3duTnjaPQludZkJG/MMZI3N/xcc+67tCok3Gvnmrws
	Gs9i0OiZ1PtX6eXpdLr/npJm3sAGgOjTgS+ulLyQnwvo0q4gG+sJ
X-Google-Smtp-Source: AGHT+IFRT6v8rC9ruh3UI6dztiV62kHw03zIYHJ0VpYeoWNXLg2hPPytoIqnwPVCg0HA7hvUfEmVsg==
X-Received: by 2002:a5d:64ce:0:b0:33a:e834:5545 with SMTP id f14-20020a5d64ce000000b0033ae8345545mr1675049wri.16.1706712614271;
        Wed, 31 Jan 2024 06:50:14 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.8.91])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d4046000000b0033b0d049c71sm419265wrp.54.2024.01.31.06.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 06:50:13 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	corbet@lwn.net
Cc: mmaas@google.com,
	hboehm@google.com,
	striker@us.ibm.com,
	charlie@rivosinc.com,
	rehn@rivosinc.com,
	rdunlap@infradead.org,
	sorear@fastmail.com,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v4 3/4] locking: Introduce prepare_sync_core_cmd()
Date: Wed, 31 Jan 2024 15:49:35 +0100
Message-Id: <20240131144936.29190-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131144936.29190-1-parri.andrea@gmail.com>
References: <20240131144936.29190-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_065018_250458_3E06B714 
X-CRM114-Status: GOOD (  12.74  )
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

Introduce an architecture function that architectures can use to set
up ("prepare") SYNC_CORE commands.

The function will be used by RISC-V to update its "deferred icache-
flush" data structures (icache_stale_mask).

Architectures defining prepare_sync_core_cmd() static inline need to
select ARCH_HAS_PREPARE_SYNC_CORE_CMD.

Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 include/linux/sync_core.h | 16 +++++++++++++++-
 init/Kconfig              |  3 +++
 kernel/sched/membarrier.c |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/sync_core.h b/include/linux/sync_core.h
index 013da4b8b3272..67bb9794b8758 100644
--- a/include/linux/sync_core.h
+++ b/include/linux/sync_core.h
@@ -17,5 +17,19 @@ static inline void sync_core_before_usermode(void)
 }
 #endif
 
-#endif /* _LINUX_SYNC_CORE_H */
+#ifdef CONFIG_ARCH_HAS_PREPARE_SYNC_CORE_CMD
+#include <asm/sync_core.h>
+#else
+/*
+ * This is a dummy prepare_sync_core_cmd() implementation that can be used on
+ * all architectures which provide unconditional core serializing instructions
+ * in switch_mm().
+ * If your architecture doesn't provide such core serializing instructions in
+ * switch_mm(), you may need to write your own functions.
+ */
+static inline void prepare_sync_core_cmd(struct mm_struct *mm)
+{
+}
+#endif
 
+#endif /* _LINUX_SYNC_CORE_H */
diff --git a/init/Kconfig b/init/Kconfig
index 8d4e836e1b6b1..e2bad47922642 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1982,6 +1982,9 @@ source "kernel/Kconfig.locks"
 config ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	bool
 
+config ARCH_HAS_PREPARE_SYNC_CORE_CMD
+	bool
+
 config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	bool
 
diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index f3d91628d6b8a..6d1f31b3a967b 100644
--- a/kernel/sched/membarrier.c
+++ b/kernel/sched/membarrier.c
@@ -320,6 +320,7 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 		      MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_READY))
 			return -EPERM;
 		ipi_func = ipi_sync_core;
+		prepare_sync_core_cmd(mm);
 	} else if (flags == MEMBARRIER_FLAG_RSEQ) {
 		if (!IS_ENABLED(CONFIG_RSEQ))
 			return -EINVAL;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
