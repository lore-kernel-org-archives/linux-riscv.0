Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003C6C4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 14:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XHneKj9QDZH/VFJS5fh7b7H2Bb/XD585xBilw9t05E=; b=cZSBXbrvuY/jm1
	7uAZ6uTYwQNtJOjXHxVKQWWjIgT78O6a0JYQ9nNLtDAPulLuqG4p+K6RzmHWbmwRpKXpsGZX0/fgc
	loGKzl1Uzex2khvb6olHVQYdEno8QmOTcbBUxjF9uzZRbz1csBnkN3+Vgm7mqY3JQoNJRBHqYCm+x
	8PHYHwwuyRPqUn4xUWwMrbze7j3J0Wk48U1vu+ytzK+BOjOJxO6tGfkx5VrNf4UdXE8p7Cvv4M3ew
	vxxhO9y8szDXHXMymwFKbbTPpRC3+qrxxgSnVVSR6dKwgv2FASBvMT+K+nlE4jOCv4TFPCXpGJh+f
	cheEc1GtSNvx+ll5QXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNa08-00CREm-0U;
	Wed, 10 Jan 2024 14:56:16 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNa03-00CR9A-2s
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 14:56:14 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-557535489d0so4884467a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 06:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704898569; x=1705503369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEsiVEXZ3aHRFWQgBMV3CYshoa+SSWa26OTBHMwiUvc=;
        b=IZO1o3P7t7cHuht0qlFAIvZZ3k3BH6oLKpVlmf505K6pDF4fTTl6kttoyP9PW5csB4
         3+Jsy1Y5qHgrcLn3EPPeXUj9uRAcSpw6RlxAndjPTIQD4x3j5IEPEFmnfncelM6L8aQI
         HFGsyCm9gIY/LuZtmB1bJyQN077dcyLMYepdwrqpRmND9pANzkflOOUpBQMRSlgodubI
         8+nMaE2Hvg3ud2CwqkKvXSOLQLLlb67Eghxlyrq0Zkn1aL0OGCDPKOE3KFBLDfmRv1TT
         g5ejiLW1y6Gn2ouzlp0vAYTUXTosUf0pA8Vok5N31R3XdBUyqFJw6HzWffZdhsnZU9R6
         C2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898569; x=1705503369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEsiVEXZ3aHRFWQgBMV3CYshoa+SSWa26OTBHMwiUvc=;
        b=GeDsZHkbgA9F8FRAs1D9f0C57OHpxMfkfAWy5scZXqOdQWyDlkC6w1BgRQm/MkhEvh
         0FN6vlA0y3F6xl1UxEp9ELcvIy3XfyvKjK3bt7yZxaIiqiXxkPidy0xCimhKzSqvPeqZ
         s4z3P5EPrHQ+wz4AZbpjfZEFsiCVkqrB3qB0810wb24UrGy0W4JztU3kTlLsQ7Z5xB3t
         ILC4hZkhI5ya05TzGcNXL4r6hfd5xdOWWgF1FIB39rjxjK34sHT7Tm74EZcmjMIHAhiK
         xRyC1o4K/+a55sJdrF2iVCkl7yKfsuQg4ES6XOzSI+aqs4Nl9O1mkGOjzL3d++EwmDb0
         BUJw==
X-Gm-Message-State: AOJu0YwSaqB4IQ9slSDr16EChi5YfbrhjkTCOs6OX2KOT8odZAmYuelw
	Aud8MtoskO9ya/kE9Go1RqM=
X-Google-Smtp-Source: AGHT+IFwxGwbeQbDiKjtn0R8Py9o0Em/I6mAlCsr3OSjWzlRKLx4g5GXutJihc3ls0LK+MenHk9Vjw==
X-Received: by 2002:a17:906:168d:b0:a2b:61dd:1687 with SMTP id s13-20020a170906168d00b00a2b61dd1687mr665162ejd.116.1704898569033;
        Wed, 10 Jan 2024 06:56:09 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.29.12])
        by smtp.gmail.com with ESMTPSA id bm3-20020a170906c04300b00a2a4efe7d3dsm2161032ejb.79.2024.01.10.06.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:56:08 -0800 (PST)
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
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v3 3/4] locking: Introduce prepare_sync_core_cmd()
Date: Wed, 10 Jan 2024 15:55:32 +0100
Message-Id: <20240110145533.60234-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110145533.60234-1-parri.andrea@gmail.com>
References: <20240110145533.60234-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_065611_933684_3801072E 
X-CRM114-Status: GOOD (  13.34  )
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
