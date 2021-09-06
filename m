Return-Path: <SRS0=oCzz=N4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85CFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 18:57:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97BC960724
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 18:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97BC960724
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZAKKkNRm3OHblKdXAWH2YZ2y4UJReJVDPtJZNfKMYxY=; b=4d7iubJIKqOAa7
	YzmUc37OZRNC1o6AJHjx9yk6eRrUE84jOOg4/XdQDvXLpR8qcots4THR8rN/LlyOPAQmV35gLovRO
	NPkaY7BuShQ1UoZ+1Hn5xAE3Ek+69l1dglCcxByOniq4gpckP53wi5R7O2ddivQUV6gejAPl7pqGu
	+lzDkKYk4+Cru/XGRKs0UF25OEeUfyMdHQYK7YlakS+gQFIRetOzqsb1M4mMbxLTeeW9Hv+xnbYRa
	yghr/nZNeNaiS0132HVWFTWMg5Jy9mG+THAZLYen5vR0w7UZSsNzoFoy0/QgZ6qh9NtLHXWhsgPNp
	ip7rcL8Y35QYAl+6VtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNJnp-001eY9-9k; Mon, 06 Sep 2021 18:57:09 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNJjL-001cKV-LW
 for linux-riscv@lists.infradead.org; Mon, 06 Sep 2021 18:52:33 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id ew6so4444022qvb.5
 for <linux-riscv@lists.infradead.org>; Mon, 06 Sep 2021 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=t7mbN5z4OIJJ66nDXiL99ZjroDagAxmDDsoWbvCVp7U=;
 b=TkRgRgEogIxTuqBPkWPjMInAOmjEtJZbaefduF8XDzrUEc6+FE33MNIi8z231zNczB
 vfRMfX4FgSuQjKFPObsMK5yPmjVomeN0SEfjfIzxUtpQX14BbxIY1jUdHqNGlLZHWSHl
 NAdKAFwvabX68D044NGlZOby3yPoc/znNF+5DI+HPEIvDhG5G7Cicqgne7MfrfpwMl3x
 j8nu+nf4inKL/Jo3BOJQnRJ8CV0IBiR6hBsi9F+Fjt5ymbejh+lmWVIVMF+A3aeAaJpV
 A4FKsS5PZE9M16efB/JmkU0ZMDTlDvLnmt3NrWeHE7bZW0zUms8Br/U8Lf49FiXcOhmD
 cG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=t7mbN5z4OIJJ66nDXiL99ZjroDagAxmDDsoWbvCVp7U=;
 b=SYeAyL4sNVMLUNfF6ytLDQGCR8T4xSZj/o9SWAu78y2eGJfu9R6koqhP+bb+nyaKZq
 iXpwzvGKdyCaqXTChfyDVL4EIbykabO1EexM2Loeq6Ez8ylcNeMXNbnTdihZzAyKerta
 JJsKVfmQij61MKhu8ORHejGduuT95Q5/NkYWvzXymVv0IprAXXzUSAXrSAqEX1QctSFl
 Q5lt3ePcb59DhF+NpDynHXDqz0D2fqhi130saN9UOmP763JMQNeUtBB0ySPNhiqpH38u
 hvE8gOjBC5C5Q4J8NsAF5vWkHGkGJoVci8HMORKZ+x0Tu+jnVD04BZOfvtawcZBt06FR
 KoDQ==
X-Gm-Message-State: AOAM530AgMRctT2CGQcXF0qf2EhqA4QQ5pS0XwBq9AThNeOdbAZpAhy5
 jXFT1B1vxKZYqOp34oWTlFjXHg==
X-Google-Smtp-Source: ABdhPJwIOJ89b8B9Na2q6HFhUYes9XYVePurpgFRqakDLgJYCTcsysBMsHetKZ4cGPbEzTveGV9Y4g==
X-Received: by 2002:a0c:e983:: with SMTP id z3mr12988808qvn.1.1630954347042;
 Mon, 06 Sep 2021 11:52:27 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h6sm5880415qtn.51.2021.09.06.11.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 11:52:26 -0700 (PDT)
Subject: [PATCH] RISC-V: Inform checksyscalls.sh about the rv32 ABI
Date: Mon,  6 Sep 2021 11:52:01 -0700
Message-Id: <20210906185201.368451-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Alistair Francis <Alistair.Francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_115231_782408_8DBAB172 
X-CRM114-Status: GOOD (  11.69  )
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

I remember having seen some build output from this before, but didn't
know what it meant.  These are now showing up as errors.

As far as I understand our 32-bit syscall ABI is fine, the issue here is
simply that we don't need the syscalls in question because we never had
the legacy versions to begin with.  One could imagine describing these
constraints in an arch-generic way, but I'm not sure it's worth
bothering until another arch comes along that behaves this way.

Fixes: d4c08b9776b3 ("riscv: Use latest system call ABI")
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/unistd.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index 6c316093a1e5..cbc2646b4662 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -14,3 +14,17 @@
 #include <uapi/asm/unistd.h>
 
 #define NR_syscalls (__NR_syscalls)
+
+#if __BITS_PER_LONG == 32
+/*
+ * RISC-V never had the 32-bit off/len syscall flavors, which means we don't
+ * need the the explicit off64/len64 versions.
+ */
+#define __IGNORE_fstat64
+#define __IGNORE_fstatat64
+/*
+ * RISC-V never had the 32-bit time_t syscall flavors, which means we don't
+ * need the explicit 64-bit versions.
+ */
+#define __IGNORE_clone3
+#endif
-- 
2.33.0.153.gba50c8fa24-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
