Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40172ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajGQVuTbU0W+jpElJSzJdq0DiBlGmd+7iMnN1AosftQ=; b=f9Zym3j0LewoMU
	IaAYMFZP+Gsf/UCMKpIQA/NOWc/ErDDp/5avktx8kCoZdXTueSyJzRIFtrHrIQpsVbV0JdoNtQEtw
	w+eHnbgE0wqk/r091b2Zc27z2oXuJJ13O8plsAjiGc1zHtcPJImWmRDbjIXZlSC0iAOHFehbkWhhS
	/eRjxASP1TBc6uUDXsouPG2EpIbh8g01UtibUKSmnjC5VonnuOC32LRV+sPid4yio9fXStzsMkSzI
	m0pZoypxGG544cLDhhtNPaZ3gbUDPP7Fz7SQETPwXwXfsR2Z4hYWJaRDaru8Ue5GBoDZ3I3/ITa5z
	jY7WdOVtvObIYDE8FgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6ql-00CdYa-Ec; Wed, 21 Sep 2022 21:01:43 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gM-00CUX6-Ge
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:46:56 +0000
Received: by mail-pg1-x535.google.com with SMTP id s206so6968427pgs.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BvXu+QXgzcKTzY7GQZ6McuBPlZWnkV19grD1UPI3mnI=;
        b=IWpcP4sI8SsPHjHX24aC478FGMh3gzJpfe14fyvIcwOb7K4BKly9moVUweEfe5gNkt
         N4rZbBapy5OAy8R24ISr8s7enXG1efoSTeb1dP+X4Pz54t1GGYum8mDzYBU/+C//vupg
         GKQNOvkrMbcH5wNaHU1u6uoTG36lZqcHC/sK/zFI7u1wOWFmN5UNNYCUA1VoSgL6ddZp
         xLClGxEm91xI098Gkjtb33rG4Nuz6eQvTQwK/PG6ftT2YpNh3VeTqZaSKgCyA4S1F0PH
         MyCCitaA4griOE8UTQB4JV3U+QAeS84qlD0oc2Wsi2ULi5s08yOinmN5VhY49nsaD4HN
         99Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BvXu+QXgzcKTzY7GQZ6McuBPlZWnkV19grD1UPI3mnI=;
        b=pMb207S8nGrW3hVIfaCRWXvfoCDqBmYo0K/BFjzoCZ/p9kGL3WD3YpM1Xf4ZoBBQP7
         j3f/s4K/U4oPIAYBRMxtxUn1I6A1hPyeOcZ3EiZbASoL5Fnvcgx+GZAeInSuXufwT/HY
         NTwyFC5bqrKAsRELPJG7F1ZQkmDRrI0FlzETxfFXhsBcIJl4shJH7OYa2k90lG1ygtQm
         1TwFHafpgtxcoIn3zWJidSWB9te0INXHOTNvdoQIU76bRSJ1epj6gUeLaWuoBZXDF3np
         7ahcyor9/k4f8xx80PTCocCVfTh1a626wE4j6rDnO/LYGNNwYFwTJuoDQU/L+4/91Hf6
         p6aQ==
X-Gm-Message-State: ACrzQf26GhEGisayuw1XptB/rha9Rf1I7iALMcj1GjiSK4zF2OE3TFnk
	1iZaP1FYEJDEvqpQnImntXOxKu7GFEceNA==
X-Google-Smtp-Source: AMsMyM6a6mTHeV1dgAHhuIh/H9nRZewXJ9u2phWd4+uLzHUrR+GBazXmbUAAMAT5WXjiTDy24zU64Q==
X-Received: by 2002:a05:6a02:186:b0:431:25fb:f1fe with SMTP id bj6-20020a056a02018600b0043125fbf1femr26761823pgb.130.1663789611322;
        Wed, 21 Sep 2022 12:46:51 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:50 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH 07/17] riscv: Add vector struct and assembler definitions
Date: Wed, 21 Sep 2022 12:46:19 -0700
Message-Id: <20220921194629.1480202-8-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124654_561978_74C5877A 
X-CRM114-Status: GOOD (  12.38  )
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

From: Greentime Hu <greentime.hu@sifive.com>

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
 arch/riscv/include/uapi/asm/ptrace.h | 17 +++++++++++++++++
 arch/riscv/kernel/asm-offsets.c      |  6 ++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 19eedd4af4cd..95917a2b24f9 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -39,6 +39,7 @@ struct thread_struct {
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
+	struct __riscv_v_state vstate;
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 882547f6bd5c..6ee1ca2edfa7 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -77,6 +77,23 @@ union __riscv_fp_state {
 	struct __riscv_q_ext_state q;
 };
 
+struct __riscv_v_state {
+	unsigned long vstart;
+	unsigned long vl;
+	unsigned long vtype;
+	unsigned long vcsr;
+	void *datap;
+	/*
+	 * In signal handler, datap will be set a correct user stack offset
+	 * and vector registers will be copied to the address of datap
+	 * pointer.
+	 *
+	 * In ptrace syscall, datap will be set to zero and the vector
+	 * registers will be copied to the address right after this
+	 * structure.
+	 */
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index df9444397908..37e3e6a8d877 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -75,6 +75,12 @@ void asm_offsets(void)
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
