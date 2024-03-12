Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD60EC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 21:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k6Lfv0n0dJ13h7e7o+4h6eh81OyjVa6I5K9KvP2Kd2Y=; b=2514JNhzR/j0x1
	0/rUgoy22eJgHq1R/PIuiXGsEYxgHF3kpdig+4YoXI9Gh6e08KR5j5mP2Leej64/0Ca5B93q5NBv3
	r5d5/pp0V/iFn2attmaOXz8UHWD7tes/be7XCWH+I0Fqg6F0FD298kYZv+klmpcbZGM9YhN4zknNy
	UCxKOdfXRUuAI49wipKSF0EWdvrZXUhhdMXK8D/0PPtKbvAhnH+CKaQWMVeqaqIaIsnmpITnsLtw2
	1VPolpCQFWNND++K5GIreKSuUUJV6Sk53wbr78nvMCacpUpVLbh2mK6tSr4p4nv/3nlTNAEcpJrTy
	psScBF+ac7P4d/DMsb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk9c8-00000007aaR-0gdk;
	Tue, 12 Mar 2024 21:24:48 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk9c4-00000007aZO-0jzv
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 21:24:46 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso357378a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 14:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710278682; x=1710883482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POJmgEct7odPCU2lHiEFfrvljmEVEMGIYXU9CkBwZGw=;
        b=MZxYpSBSEKjCWw0g8n3WIVDtYlY2OwJrEJ29J5hz1YO++9J54hgYk3qiMxYcE1rWJS
         X53U0nh/Rb28GFga+7+0QsDZKbKJbII4rmxt77UhglVKgsKnWLNX5t2l32DENQ0K9myE
         aenWDfq3wRrhWoveo7xa2wmbdrpXHcpVM+1iDo/o6NSopv/PTdYfJse3AblgBKKNtQV6
         RXjVyfclLM97Jm/JaQL6645Vgq7jMHlHNr7SgxhZ/zrR64vu7YJg3XmFs/48HZnWoPB7
         YBCQroZFye8FrXjdtZONtWViS+sm9pqCfSbaS7ED6jXaDRBtSPGeUNnVXtgZsfzldHqK
         I4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710278682; x=1710883482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POJmgEct7odPCU2lHiEFfrvljmEVEMGIYXU9CkBwZGw=;
        b=Ab6VE+qRFPzs8n0krkYhvKCoQlvG/BdfKyMk0kGkEV3WBWY4gOV03UXSY2foa6zmGq
         q9qDPvx9k5gfQyBG7f1FO+PavkNV8dtlvOi7CR7JkUhM0C1EU1Lajhg5ITnkt8NET6N9
         SwY+kFSxf5Uo+RTiQSRY6pOPHHgBYcPPepHm6EYZQUWLvKh041w7MooK+KcXhhGAXYo3
         1bWYhvepozkqzI+cS4r366DsKTuJQVaTPYwtg7qe8mb82xG0tSZN3jQuw5PqJJVWp+Ay
         ukWai2rVgifSLqRs9UU2nhOYUKlDWX8eTbQxTS52xKKesxEpU1/7J/Kur3yZ8PxhLlUQ
         rSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBYQ7zhfXFiue3kfvAeIs1Ua0ZzfHDOLXayCVKe7s2jOFzQlXjpvU/RtVztC8OK+k6XJJvwtOczGcf77JI9Do6+gpEgVbyw/lXvp3anitc
X-Gm-Message-State: AOJu0YzxSM52/kvFKq8uUzgJs7+FOI96849Y5DYOd8+seKFbxKDdUfjG
	qfl5wxthnWFlt8/oFE9HSUCei9NwgbQ5sSsNf+eDc13eNAL2+nM8iksKCuD9Dfk=
X-Google-Smtp-Source: AGHT+IEwScSJtysO1OwJWcVDCi/FLHLz22ZYjopeyUGf6UmugoZJ0G9YjmPWpPXpJ6LYpcSejUezgw==
X-Received: by 2002:a17:903:4292:b0:1dd:6fc5:1c5c with SMTP id ju18-20020a170903429200b001dd6fc51c5cmr3880349plb.52.1710278682675;
        Tue, 12 Mar 2024 14:24:42 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902f68500b001dca99546d2sm7148489plg.70.2024.03.12.14.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 14:24:42 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Add tracepoints for SBI calls and returns
Date: Tue, 12 Mar 2024 14:23:34 -0700
Message-ID: <20240312212441.2322765-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_142444_371499_36E009E6 
X-CRM114-Status: GOOD (  13.69  )
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

These are useful for measuring the latency of SBI calls. The SBI HSM
extension is excluded because those functions are called from contexts
such as cpuidle where instrumentation is not allowed.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/trace.h | 60 ++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/sbi.c        |  7 ++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/riscv/include/asm/trace.h

diff --git a/arch/riscv/include/asm/trace.h b/arch/riscv/include/asm/trace.h
new file mode 100644
index 000000000000..f96091f83c25
--- /dev/null
+++ b/arch/riscv/include/asm/trace.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM riscv
+
+#if !defined(_TRACE_RISCV_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_RISCV_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT_CONDITION(sbi_call,
+
+	TP_PROTO(int ext, int fid),
+
+	TP_ARGS(ext, fid),
+
+	TP_CONDITION(ext != SBI_EXT_HSM),
+
+	TP_STRUCT__entry(
+		__field(int, ext)
+		__field(int, fid)
+	),
+
+	TP_fast_assign(
+		__entry->ext = ext;
+		__entry->fid = fid;
+	),
+
+	TP_printk("ext=0x%x fid=%d", __entry->ext, __entry->fid)
+);
+
+TRACE_EVENT_CONDITION(sbi_return,
+
+	TP_PROTO(int ext, long error, long value),
+
+	TP_ARGS(ext, error, value),
+
+	TP_CONDITION(ext != SBI_EXT_HSM),
+
+	TP_STRUCT__entry(
+		__field(long, error)
+		__field(long, value)
+	),
+
+	TP_fast_assign(
+		__entry->error = error;
+		__entry->value = value;
+	),
+
+	TP_printk("error=%ld value=0x%lx", __entry->error, __entry->value)
+);
+
+#endif /* _TRACE_RISCV_H */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+
+#define TRACE_INCLUDE_PATH asm
+#define TRACE_INCLUDE_FILE trace
+
+#include <trace/define_trace.h>
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index e66e0999a800..a1d21d8f5293 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -14,6 +14,9 @@
 #include <asm/smp.h>
 #include <asm/tlbflush.h>
 
+#define CREATE_TRACE_POINTS
+#include <asm/trace.h>
+
 /* default SBI version is 0.1 */
 unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
 EXPORT_SYMBOL(sbi_spec_version);
@@ -31,6 +34,8 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 {
 	struct sbiret ret;
 
+	trace_sbi_call(ext, fid);
+
 	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
 	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
 	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
@@ -46,6 +51,8 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 	ret.error = a0;
 	ret.value = a1;
 
+	trace_sbi_return(ext, ret.error, ret.value);
+
 	return ret;
 }
 EXPORT_SYMBOL(sbi_ecall);
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
