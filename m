Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9786DC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2GP8FOvSemq812lq2MrHCh2ZfeszswQg8Bxh/Wpv9s=; b=OgWG4BvRAFSCqZ
	3HrE04ixRrDHYXfIphLQfQiQ0LgzmEjleamLDADW7ATHn71Pp66EbPihcFaspKw3/Z4+w8uaw/g4G
	YvJqGFSw1Ia1fu3oENl2rtAY+8RivcsWihrBj7gfTfHFq8nlZKoAzXj3whfAdJ+uQr28qmdvK8GpT
	L9NR1A/O4kMU8HuvTMON2NJw+jEdQzMTEuATmZHdBp32PINvz17Moi5F+95X5r6gjIM00aoQ5pmUW
	K96aZB7AnWLRt4Cv/dgWFHUzuqS58cSvMlLrESFZwkJRyzr6dXUKegZ5ctIMKtmnmxvnLy0oXzr6c
	3r7WPAx6mXDk1E23lxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yv9-00263O-0J;
	Mon, 27 Nov 2023 10:32:55 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yv4-00260i-1m
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:32:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54a95657df3so5752124a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 02:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701081167; x=1701685967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIxf4qA9d3iQNURLT0XW05wJYozIZ97sH6EQJwhq5Vo=;
        b=WoEuM0sMM24sg4KApvXeFFyxGA4Xmyl1bnh74aFvF/Rk3QSPzZoz9t3dmFst3mPuix
         SqGgv8uK9vYINdsDQocqzp4RGv+o8G5QM/vlVfpxSF31tFZcmmCI9/iQR8St7cJMQyZr
         DGVV59kpdFKczkw8innaDCjFVMlTxohoNC7THX0XqTfBChYjsfB9nKVKU3qYBq6p9B88
         f6Z2GWI4QMsH59li1Vt7ZVLYT8JoFjiaRYx8gPeT1lOdJvSmUUvDSUHJh8PVxRpGLP5t
         iXkZHkeMJslQStde/0gvskmz3yH4tawfBEE1iQYJ/hgFMbxjEmdJFSWDJxjkztWyLV2X
         pXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701081167; x=1701685967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIxf4qA9d3iQNURLT0XW05wJYozIZ97sH6EQJwhq5Vo=;
        b=Tj0gmUpjqDLuceaSHfzyr4DvMuhgbT0QGFNiV5hrVSr2L1MPUg/L7PhK/TwrCJy+3m
         IppA6DRt6PMNDpBbMqrwHcoeoKYJufEoUQzgB5Im5kF3S/9bPV926e9xJIkJwn8uxLUy
         XGlWzI9LrIpGogCiM41npWVQyVGwuhpeRELj+y0EUeFPgThT7Qu3bnNCd+NHO+bHuZyE
         iRNu82I+MkTs8PWbb9xlVkJi4ZBG24i560lLmBsag0M+ek3wR6uxQRsIeJmrv8rr5GQf
         mkJlZwfnBXE1MvIhtna02J/GNVXU57F+CPzd21c/8R91nhjeVnMlqicTF6Kny+elGm0B
         JfRA==
X-Gm-Message-State: AOJu0Yz8CsB1G9bWmDEWXPg5Cd3bu4xDs+gdLY3ZEGehdWaV/olq7355
	ZWWBuFg7NosgMLJCR6APiKs=
X-Google-Smtp-Source: AGHT+IFmy1m9Y+H2p9q9elT0xydMtLsrFZsvRFhY2WqKMjU52KidZjpTJC0i2aZ2LuL0kaVMfQA+aQ==
X-Received: by 2002:a05:6402:751:b0:54b:3edc:180 with SMTP id p17-20020a056402075100b0054b3edc0180mr3517112edy.11.1701081167489;
        Mon, 27 Nov 2023 02:32:47 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.63.178])
        by smtp.gmail.com with ESMTPSA id p5-20020a056402044500b00540ea3a25e6sm5142057edw.72.2023.11.27.02.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:32:47 -0800 (PST)
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
Subject: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()
Date: Mon, 27 Nov 2023 11:32:34 +0100
Message-Id: <20231127103235.28442-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127103235.28442-1-parri.andrea@gmail.com>
References: <20231127103235.28442-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_023250_597634_BD557C4C 
X-CRM114-Status: GOOD (  13.00  )
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

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
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
