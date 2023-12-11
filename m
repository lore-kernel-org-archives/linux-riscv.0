Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C49CC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7Tg2C1+JZnPi+v6kAgoNI817Yj3MS4HZdL/ao2Zk5s=; b=NMSWTKEFCoOACr
	G8RKdV7ClCFE/cdIe2IkOqeK7GeLOJGtn6EvJ2Jsc3ocvmk5aJmMRuRtZ4IyI0uQE4Hq2lkvh3OaE
	QhqMlGK7WeUOiZwJmRhfa0KGiZEvWk70N52UbGl2rC/lIOZfg4pm/V5Ukr1p7S1lvoOygudFTULHZ
	WkxF+u6OQoyGS7s5j1c+MOOOt1L760LrDq7muKvvAhUKwpBOaAwmCQsSthixc00mQWAfQ1ViYa3ei
	t3PT6AFmmIW54jbupHin/Iycaumvi0p5JgdPHUcr6yMGBixH3ay6y7Is58FpH5vJgtbfUS03oVLil
	Y1u8WQu+cSuuAo7sNzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcq9-004VJA-08;
	Mon, 11 Dec 2023 09:44:41 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcq2-004VGg-2y
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 09:44:39 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-54f5469c211so3631752a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 01:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702287872; x=1702892672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfT6yTigw0JL9rPQ3RLVTHss5/tTMRXlGfMsOm5hiBA=;
        b=Fgz9I4lQXMY4GGhYKtl4akhhprq0XdJJ26ilWZYdUNdYh8vWFaZklJ/h5M35uPzZ+p
         vXwzzUyX3GsVVKWhSuLK7+28lLmm6er5nacumyMGEXG5BSGe5MopMixvzVHxJ9qJV+zn
         bpDri9O+E3i9Z2mw2wZ2nRcr4PYWJE6RgneE33hdRPRhI6ZwQedvp1U3n+jq0ekpGntK
         vb/T0wsYQBNk9WSLQ0SHPjtvzqILeeEUjQvSbfAdNDmJiXMDRVi4kyZisOHY8lGfFqnV
         4SCeElcLaGfPWXtQrXb+sULbN2h/9dgrU7YtGsVDaGr0RX4orBD84Ai27l6ozNpwNdUx
         NjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287872; x=1702892672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfT6yTigw0JL9rPQ3RLVTHss5/tTMRXlGfMsOm5hiBA=;
        b=VD8I7bm+fVJx+uWV/RQvgFwI45N+/6lS+9NWOr+Kn3RDGmrwSv+Qok/tLXF2iGIhQ5
         nu+ro7XulTwFQfXzbXLBOld6H2jKs04V0ibW53TXMfGFDRK4uRDlDqZ2tynjgOYY99TJ
         jqDcLf1yK/ceAecmyLtyYc1HzThPFnQoIs3e046xpL0ry1WLqzz9FI+DRZMdWKtITEsV
         zx1OE8WmlpXTbqJ179223d3qhA/D3NHB+ExoN9LDT72ADT5SfKjDjnQY+E5LhP3ayP4S
         1iMmYe+4HxxcbQmH88iIIW2JsNg61jQpYwPBG7/fATJw35z7i7mwcGjQtMJtmV98K2NE
         v6gg==
X-Gm-Message-State: AOJu0YyQJG9Oh/dTfN7ePSPjCVWsNCCllAyuac093YXZnnqZQ/7RoOqO
	QgCXk1ZsujDDbL71+8vy3Q4=
X-Google-Smtp-Source: AGHT+IGMxuKPrFTwj2zbLSblfgSfd44OwUT+BQyj3R0X1rt7fU+FpQfB/msMTDFYA5XJOFpr3giP2g==
X-Received: by 2002:a50:fb8b:0:b0:54c:4837:93f7 with SMTP id e11-20020a50fb8b000000b0054c483793f7mr2864378edq.62.1702287871520;
        Mon, 11 Dec 2023 01:44:31 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.124.152])
        by smtp.gmail.com with ESMTPSA id if3-20020a0564025d8300b0054afcab0af2sm3463505edb.59.2023.12.11.01.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:44:31 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: mmaas@google.com,
	hboehm@google.com,
	striker@us.ibm.com,
	charlie@rivosinc.com,
	rehn@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v2 2/4] locking: Introduce prepare_sync_core_cmd()
Date: Mon, 11 Dec 2023 10:44:12 +0100
Message-Id: <20231211094414.8078-3-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211094414.8078-1-parri.andrea@gmail.com>
References: <20231211094414.8078-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_014434_959765_4E1AEB87 
X-CRM114-Status: GOOD (  12.40  )
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
index 9ffb103fc927b..87daf50838f02 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1972,6 +1972,9 @@ source "kernel/Kconfig.locks"
 config ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	bool
 
+config ARCH_HAS_PREPARE_SYNC_CORE_CMD
+	bool
+
 config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	bool
 
diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index 2ad881d07752c..58f801e013988 100644
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
