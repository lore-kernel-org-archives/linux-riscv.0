Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51708C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2422361158
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2422361158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xf3/pRwqo+TD6eBaEe94CjIXqrFT4m1Ja0Yh0kTjwnU=; b=NJXgl1uWfWuO14
	5biXM5PJt8QM5NpAskAB+fBCn5iCmJpCPHb88yXhfkCLk1Ce+9S2m0I8GwRV3XYm4U8ohiVJCHhd2
	vt4W+fZgeKOCQH3b2hUaPOqaU+IqWTAqeXrkmEYcvM5NWKO+O53hz2/h0SebLVkU2bUhn1jA08feQ
	vc9w9ujZ2l2ltNqSQfNYerkKX6oWZJLWEvmlWGA0nq7lM72y6BQmzBVn5IJv9BGXzL02ocJ+7x0i4
	3hgG+Z/ZjoufbHqTlkcEEmCQ8UBvJf4g+lTCy9jiw4Gk20/d6u1wPrc/2cTSbN3+IKBZ9VHW4DblU
	kZcHe+EJQMAg+KgJ13mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1e6-007Ibq-D2; Wed, 08 Sep 2021 17:46:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1ds-007IQk-Vm
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:50 +0000
Received: by mail-pl1-x636.google.com with SMTP id j2so1797081pll.1
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iGhMejAAmA76H3ZkvML6O16y7Qo+v4duTV6nU5CVEvA=;
 b=HYwOm/v80woR7hZrASRuBt9VEWYdfEIGZVv1D7mKKxhBV9MozBcHYtMEk60BWOmfTK
 7IXvrPee8c++Uiy95m635dPmN2A2eMyYF8QL/k63dzswzQKuvtLqI0MhOxNdGxfbAjI7
 CMlIWh07zb5yta+9yQyXdPYB7z/h+bzyTURg5LGhVE7mi5xeW4dxIghVP4GpDXJ8ahpm
 aQzsFa25jPAVO1cixaDya+rs9fch8l2CQS5/vuosaGYsssdj0C6iMgswqpRUgWpEPoGm
 vNa+GDMCAujcNTZnAkdmO6+r9X78DRv0JBdL5BPwjUEJSSv6FYVto+Ta3a/vpUkNJMSs
 /HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iGhMejAAmA76H3ZkvML6O16y7Qo+v4duTV6nU5CVEvA=;
 b=ZDCrjCe+gTiXKg5GRKlV66VDF3y6AiEhCkdkWSx7wzd2eqDxw6AfrrEVGS9phYx3eS
 O1G6dHy4Pw8GxksC4e3jIzcui8IH5QPaHC3prkF807lmt0/pQkQc2Uwfzvg9BJoMBzE7
 +j+cjP0NBlAEA0WanolFwwTuaa5LiI2lKHqNuoAuxnKMzPHuKvC7+vqansVVefSxoycn
 XOhvpYs2w+i4GKkYBDxtDiRFDVtHFw04j0vCd1wuxZF4BCW90iuaB6ZL6e6uObygGvKf
 goTSfxAYly5OxILb/UmecQkMGMpHbtOuBu/Cefy9dQCVI61Bm9wracH0YQORdWrr1d1V
 4fUw==
X-Gm-Message-State: AOAM532gd5QHZMkNX7/79vSURDPJfvjTHmlaq0LM/QwQhLWhZt/upo/Z
 e/bBRAfV88+pJT7HXKbSD6iephDxFvMHUA==
X-Google-Smtp-Source: ABdhPJxREmCJ+n/R6hnBhI28AUCMDziOr6/XIG0206lpF6ZNUJo2cmW3uWW0usZEdTDgXOB7YpYSZQ==
X-Received: by 2002:a17:90a:1d8:: with SMTP id 24mr5418832pjd.69.1631123148372; 
 Wed, 08 Sep 2021 10:45:48 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:48 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 08/21] riscv: Add vector struct and assembler
 definitions
Date: Thu,  9 Sep 2021 01:45:20 +0800
Message-Id: <96e2155d473e72c97c70360df549015c188fe6b8.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104549_064690_039FF0D2 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
index 021ed64ee608..1b037c69d311 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -35,6 +35,7 @@ struct thread_struct {
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
+	struct __riscv_v_state vstate;
 };
 
 #define INIT_THREAD {					\
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
