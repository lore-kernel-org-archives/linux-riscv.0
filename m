Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C00DC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B68320731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OrBY1gTE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IzQaAMMT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B68320731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L4wFDSwx7dQRJS2QWT+cmtcuJVxIXFlIvjhSim9Eds4=; b=OrBY1gTEKjqRJvXTLVUr+FU/P
	s5wZ3SGahWhiAjrZVLIpZEfw29flPt8gN+kkMHZ0IRm5lGMGkaJWhKdDgmVAo/VWeBA71/LYxIoxI
	f61eu1bEIDH9SWXBKTHdcR/2BxuqLeeEt5QAOlEpbyVzAyrnzBnNDzOpY3Kw9FsgEjhkiMsq5oYDr
	VmidJb5MtWOPOSqhZFPWJRe9WGPSH4moySTGWfjyOZgA4fJJX+2oc/8qt2Gdjock2BypReqfI7grX
	3FhWQRzDksJfLJSji4ZcJ/iOHT2YMH/NNC0Uk2VXObF7OzyOG8TCTJPN32TAdSOK5lNyc0AHAkJrx
	X8rJvh0Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhY-0008Nf-4i; Thu, 10 Sep 2020 08:13:04 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhP-0008GV-KH
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:12:59 +0000
Received: by mail-pj1-x1044.google.com with SMTP id gf14so2658146pjb.5
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b7nwVvrjTBVRtHppJqQAkiSfbar3bHistj9A5OWSP/U=;
 b=IzQaAMMT2j0UvYxCP6rnBPqQiDH2qMqu/NIuRa+EjILwwb4WLiqn9RspVzMJEVmpqE
 KOvyjCo2zxHnSrmKFpvawqwa71LiLQTLSpWaDO2xTBod4XGLkf5vWpbPAaMNxKnf4q8l
 9rK8yOdPEF3V6yQRA8z+dzed8utlKxdCjPKpRwVdUYmePQdDWoUqWXzfklVial1oZGmN
 UhlIxxQUxSHiKXDf4uErygfu/LcnTm7X6CKHWpk2u7/PC97lfJQDPC1RE/gFHeb76eEU
 EVabX4/2FtFa/6GhAX62tqHrtef1/z2R9WGAm1UPUJMDU8k6eibMSg6aWEzc0X9Vmk0W
 OFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b7nwVvrjTBVRtHppJqQAkiSfbar3bHistj9A5OWSP/U=;
 b=ru6eayJ/r1l+b4SwP+4uftIWa20vSQh8n+G6xvp8frHt02ji9etNReT9ONmCifJktX
 kUkl7VtusQO1DuhulVTkXcT7VyxUCNsEBmpWkGoXYKgRRHG3rQ22twAXYmid24vodMXf
 jzw8KKOm7yS6p5nSpdQ2N7IjZR2yURy3axQr6KVNIuCHdyQ69WV7wSeyBdp6cL4oWMjZ
 QarzwwbYpV8tOc+gy0Ba3nxCzyTxVa3SL9StlNVLEwGbl7v0EDM7oi4+TdPaEdW6jXQ7
 c8ukr9MK/6LamjbKP4k5wJyp3RI4EPmfR3CB0O7GcVtYYXM6B9UAxjWAkMzYc2hZq5rn
 R/Bg==
X-Gm-Message-State: AOAM531VydHtTFjgRiODYWuEIw0m1pKYc1SkrEmlrvlAM+ukhcZWAtdz
 2NkE7Ttg09+ucHF3kYcDCNSnxg==
X-Google-Smtp-Source: ABdhPJz+QyaGhkNP1HKU+VvxmMIedmnjMbRDvuvuw6dtRoI9tVnaL4pCHYxhOuf8CLM2YRRedhJvJA==
X-Received: by 2002:a17:902:eb0b:b029:d1:8c50:b1ed with SMTP id
 l11-20020a170902eb0bb02900d18c50b1edmr1614334plb.41.1599725573393; 
 Thu, 10 Sep 2020 01:12:53 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:12:52 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 08/21] riscv: Add vector struct and assembler
 definitions
Date: Thu, 10 Sep 2020 16:12:03 +0800
Message-Id: <4cb7ed8c6af8e1865ca817d590f06f4fb485230f.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041255_751547_7B45FA35 
X-CRM114-Status: GOOD (  12.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add vector state context struct in struct thread and asm-offsets.c
definitions.

The vector registers will be saved in datap pointer of __riscv_v_state. It
will be dynamically allocated in kernel space. It will be put right after
the __riscv_v_state data structure in user space.

[guoren@linux.alibaba.com: first version vector porting]
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/include/asm/processor.h   |  1 +
 arch/riscv/include/uapi/asm/ptrace.h | 13 +++++++++++++
 arch/riscv/kernel/asm-offsets.c      |  8 ++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index bdddcd5c1b71..a66a5d4ee5ad 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -34,6 +34,7 @@ struct thread_struct {
 	unsigned long sp;	/* Kernel mode stack */
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
+	struct __riscv_v_state vstate;
 };
 
 #define INIT_THREAD {					\
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 882547f6bd5c..661b0466b850 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -77,6 +77,19 @@ union __riscv_fp_state {
 	struct __riscv_q_ext_state q;
 };
 
+struct __riscv_v_state {
+	__u32 magic;
+	__u32 size;
+	unsigned long vstart;
+	unsigned long vl;
+	unsigned long vtype;
+	unsigned long vcsr;
+	void *datap;
+#if __riscv_xlen == 32
+	__u32 __padding;
+#endif
+} __attribute__((aligned(16)));
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index db203442c08f..f6fa65a6aaf0 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -67,6 +67,14 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_F31, task_struct, thread.fstate.f[31]);
 	OFFSET(TASK_THREAD_FCSR, task_struct, thread.fstate.fcsr);
 
+	OFFSET(RISCV_V_STATE_MAGIC, __riscv_v_state, magic);
+	OFFSET(RISCV_V_STATE_SIZE, __riscv_v_state, size);
+	OFFSET(RISCV_V_STATE_VSTART, __riscv_v_state, vstart);
+	OFFSET(RISCV_V_STATE_VL, __riscv_v_state, vl);
+	OFFSET(RISCV_V_STATE_VTYPE, __riscv_v_state, vtype);
+	OFFSET(RISCV_V_STATE_VCSR, __riscv_v_state, vcsr);
+	OFFSET(RISCV_V_STATE_DATAP, __riscv_v_state, datap);
+
 	DEFINE(PT_SIZE, sizeof(struct pt_regs));
 	OFFSET(PT_EPC, pt_regs, epc);
 	OFFSET(PT_RA, pt_regs, ra);
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
