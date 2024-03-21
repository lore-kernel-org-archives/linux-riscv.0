Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0BFC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 23:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pxpGRmmT20p3ubzomP2HeBnOJnGssvy7R1hvE7eGoMg=; b=xBVXuyTROHW1v/
	toNgmvvzDP9O9UsVtA0pWqeQhewIJyZ9D88O9CShmXqJHcA108OVgsrko3q6sP9RAK/Q+LqJo23yM
	oEo1Bw+9OqkCVX39MSuNoWVcPM0jHJXyBvvFXeGJ/dc5HZaARxAOTyUVBA3W1ft9FtJtemqKpxoIy
	jX1wyu3gcugYqlKOE2rMAUdfTWs2bhW8Zxu+HpAABz6qUNUkB9JNOIvgcEWAjcbX3yzN1yUue/91d
	zvy29/ek61USrEj9HBGTGnbTSrWBvKQkjjMfQOzNmrKmQFZjKGczDUjj0THjFMgsUTtFiDgPygtUf
	TKK0PIWojew+pE0Eq5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnRWl-000000053PU-0Zwv;
	Thu, 21 Mar 2024 23:08:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnRWh-000000053OE-3DZi
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 23:08:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e00b1c2684so12143555ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 16:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711062524; x=1711667324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2g6BoqLKj372/A/Rp4yX95Q1DYjG7vH04Tm1sPT6Ptc=;
        b=RKKpRXPRQqE4uGbjtsCnjpDMQ3zY7hXu2uq/uFtfC6SGF8EOe5ZFyTUrhZRUVKY6Qz
         07hJYquHt+HIEERC0ZtY6HuGKooRNwsvTNxivisEqD9dYBEqKjl3xNkCpav1ZeeQrO9A
         +kTTin4W2I6vM0m3/ajsg+HptIB68OohMWY/BfK1d8vshnbr8sHmmcebY85Ev9OcyunT
         s6vmMO4Xe26RNPTvZrzwAXsQeZvDHHuuW3frSYHE3IcDMvRGPVBArrtXGi7d1oQ1TJxQ
         pHWA2CUHv6GCg0rTQQoKOnDdb0vT4kXGmlm464V2esqNd8dcL9cZ3pF48YGQ0vndLpTx
         s+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711062524; x=1711667324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2g6BoqLKj372/A/Rp4yX95Q1DYjG7vH04Tm1sPT6Ptc=;
        b=bWZh/YNwgumMZ5UkuHcHjRtkBenMPIRQK07wtziTVj8Fse6XsIaomU+iQ1MAu2Bg3e
         /646iqsu+XpBTnTU13qNH2kGdCeOM61Zkcmr3/m+Z2MYS68hUJhJmNdCtkllU36PTFh2
         Pqwfvr1mRh8nMRzUlA94Yi4/2ROhobjdp1X9nWInFpbv5HS1h52yRPVz+HnauctM8d6k
         oLbC6cAWbcaSTIL1Cb/EPXlqhdKLIa5C4UZWGsGGmFx/YE3ZlKOtF3nnBRfxFTMurwRF
         b1F+v446dUu8cwxYCQ0zFlyEmVtWCtqpCUnjLv1vaBBQdrNwsrg5mHH+a7n7nB4ym5L1
         thig==
X-Forwarded-Encrypted: i=1; AJvYcCXD0Od7UbA9TqFFIst6Rr/LHS5juz2j9ea7gze1yWt/Vx8OSo4lWt2akQ2GejKAUza9+o0/yfzSlJrROioZj6iUwmzIfaS7YFBRNYnJ2Kqm
X-Gm-Message-State: AOJu0YzE+Pel2PguV2O/CmS4vHSUqp8iUkWo36hmznNpoSmxIPfhmTAm
	6My7GlXp4iTr2UEIGegwdV+4HJ1LwEdslCyZNnVO5o6/y2ds5d8utI0yGZbunsKfm/Ct7WS6pIZ
	Z
X-Google-Smtp-Source: AGHT+IHIoIGMfAMpYRB/firUliTLDlGtLCx6TBBwf1mVlVbKPjyICGbmWA2wnx86gggF4keCKftKfg==
X-Received: by 2002:a05:6a20:9f95:b0:1a3:8904:1fc9 with SMTP id mm21-20020a056a209f9500b001a389041fc9mr1145120pzb.41.1711062093305;
        Thu, 21 Mar 2024 16:01:33 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id h16-20020aa786d0000000b006e6baf14752sm369511pfo.58.2024.03.21.16.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 16:01:32 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Marc Zyngier <maz@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: Add tracepoints for SBI calls and returns
Date: Thu, 21 Mar 2024 16:01:25 -0700
Message-ID: <20240321230131.1838105-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_160848_027332_90C992B4 
X-CRM114-Status: GOOD (  13.84  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Remove some blank lines

 arch/riscv/include/asm/trace.h | 54 ++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/sbi.c        |  7 +++++
 2 files changed, 61 insertions(+)
 create mode 100644 arch/riscv/include/asm/trace.h

diff --git a/arch/riscv/include/asm/trace.h b/arch/riscv/include/asm/trace.h
new file mode 100644
index 000000000000..6151cee5450c
--- /dev/null
+++ b/arch/riscv/include/asm/trace.h
@@ -0,0 +1,54 @@
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
+	TP_PROTO(int ext, int fid),
+	TP_ARGS(ext, fid),
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
+	TP_PROTO(int ext, long error, long value),
+	TP_ARGS(ext, error, value),
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
