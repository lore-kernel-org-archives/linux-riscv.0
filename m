Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5975C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:52:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8565E60D07
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8565E60D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHcN1h00uh5TO+mBUAYIf5Ie9NFSzJrcuaOwehpxYyQ=; b=SO+RiEu9uCjZMz
	nHyTuk8UyRl6eG2JYh1pdSksXfKB3GPVv5AV7sglWNz7eTSBjyHWdpwNPo7uDrMhuismgzYD8tfwi
	zQwOPgPxP3UT81eIuX4KiUN7+Gybrjp0bjVSvA4kkLnEo5xxmI3WJSyAZyIDqn0RkMbuKslS8vzAW
	p2twdescduyeLKqsOIegMNzrFi6uz0p9cd/RbyE6KA/JGZ6EMsoXiFArG0443O/Und/gsvUPNw0VT
	9cSckkDnzsgnFV9RgoAej1sicafW0f2Tznj+I6EQ0JrHoEpN4dQxumleZKuqVC+lxv1TPwvYCXAA6
	44VEgqheMM8sTifGcdNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNnS-001KrO-Ja; Tue, 09 Nov 2021 09:52:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNkD-001JWH-Co
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id v20so19927300plo.7
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EVVuscMQp2lGVvzsl9H0FHRWDyTQs0McQHy078vwuOw=;
 b=cKAlg7aAY9F/waxsGRhspbhybLa4eWeyPdzqCUQHBxYSasLzV7nLJZCPY6umhcn1aG
 eZnGgWjISVnVUYv3S4glBB7JqmQwgIxH1B6hhY4qgy00ce0cFNjtAEMxqqOSRpt2YOXi
 2K1xkyAfnqB8tYfwhCUN+VLIKxPtvqatiaoXMPUP3B9kHW9dWCdCTBMktaKGE+9BwQ0V
 xYO1NY6Kxh1npu44TLGUhS390GMh2bnqrWOt3L+/9gc6NuJv+arNcMSrHRuVQq+e8ToG
 qVcP+DnNWcs19/FA/9/Wyoo/SgxyYeUQ02NjdNja5WSvpGLst1sVDM0hL033gm8uTisa
 zf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EVVuscMQp2lGVvzsl9H0FHRWDyTQs0McQHy078vwuOw=;
 b=h2TvorSSz6h/GnO/mLMwycFPwzZ76Oq8VQAFCQGG37YzzWp0JQRiy9c+wU0qVnIPtH
 /aGZPMMUWIscIwQ/kHetMX/eeWlSXvvJuy0Jq2Q0oIK7VFAOSqTHDjNwdOWlFVFcJ8YX
 pFJi57Eg8RVZKOXeyj6hdDq3OkPqCXMxS9VtPcKymil+ZpSBD/XNHdJGWwErj0zvwAG2
 v73OZXa6hpjmrnjXW89n1bNds5RZmWCEC1bnVolote8PwmGSvNkh98jH4azr9DrcKPeZ
 LtOQ9Ocu0ot9hfwmafNlqZEAtqim1j2SAcDj9bLL8tgP8z8BRWYNG03kQJVuFYB1qTdU
 EcUQ==
X-Gm-Message-State: AOAM533zld8i9OiO228KFLkcwGEoimwzChJuY/kqC9I7YcfiJ307fVfV
 do7KaHNhae+GnlQpVtcMb6uZNg==
X-Google-Smtp-Source: ABdhPJyNsWYWX5NtIoaU64xY9v05FODRqM9JNucFY6hQnnaGUpw+q3cXZivYrJFBQu4T5RAwxjZvNA==
X-Received: by 2002:a17:902:c947:b0:141:e7f6:d688 with SMTP id
 i7-20020a170902c94700b00141e7f6d688mr5681010pla.56.1636451324561; 
 Tue, 09 Nov 2021 01:48:44 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:44 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 08/17] riscv: Add vector struct and assembler definitions
Date: Tue,  9 Nov 2021 17:48:20 +0800
Message-Id: <15d09938180ee45bc5481c4a2d41ad656ca23c82.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014845_483281_FF6EDCEE 
X-CRM114-Status: GOOD (  10.07  )
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

Add vector state context struct in struct thread and asm-offsets.c
definitions.

The vector registers will be saved in datap pointer of __riscv_v_state. It
will be dynamically allocated in kernel space. It will be put right after
the __riscv_v_state data structure in user space.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/processor.h   |  1 +
 arch/riscv/include/uapi/asm/ptrace.h | 11 +++++++++++
 arch/riscv/kernel/asm-offsets.c      |  6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 46b492c78cbb..a268f1382e52 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -35,6 +35,7 @@ struct thread_struct {
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
+	struct __riscv_v_state vstate;
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 882547f6bd5c..bd3b8a710246 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -77,6 +77,17 @@ union __riscv_fp_state {
 	struct __riscv_q_ext_state q;
 };
 
+struct __riscv_v_state {
+	unsigned long vstart;
+	unsigned long vl;
+	unsigned long vtype;
+	unsigned long vcsr;
+	void *datap;
+#if __riscv_xlen == 32
+	__u32 __padding;
+#endif
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 90f8ce64fa6f..34f43c84723a 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -72,6 +72,12 @@ void asm_offsets(void)
 	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
 #endif
 
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
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
