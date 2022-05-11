Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDAFC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMjN4kiC0zR6Sa1vFpL+iSKGtrcPjkfj0uW9twWxxl0=; b=W88TCE3e3znHVY
	RasXzCN1K7MzWt5TsldfLXz8qQWqfXkO0B4vIft5DVgvXaJDVFPXU3QGQwF6R/Y1ZLRqQnx/43GM1
	JzjPaaj0QZ0wd0MnG1uO9RVa44kboZIMe5vMtgFN9e923ZCacEYse6bOjOJFAVvQGA66FEEOgrL/4
	4rRL/+Ubc1BcnnTUTzX9sp89/ki1EQAMP6TFb0aMzK/7JO77HO4dUK17owEa2tYyxXqM8iM85Hda3
	w6Rwt0kPubtN8dKgvpEwUXS0+ZDG9Sovx+cnKruCjo6yHkPhhi1Ce122+N12S7/OG7a35B/bVNd1a
	E3ez9/MsxQXO227JbBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohlC-005xXT-Ss; Wed, 11 May 2022 08:31:54 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohl2-005xHr-He
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:45 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so4255563pjv.4
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=/ojtaq0pVTISiVB+t5H7Gtqn9qT+yiZRc8EYMYytpr0=;
 b=D1p70MhwIuPllZCRHztQBSDqpmMGP0lmYpciM3ZdGEM0H1RHycrby4c4kHVhvjsScp
 1pJu9uzHt+ntZZ48Tm2pMH+pl9nSJnNIrjC+ItTs+LCxOIPu67a1PmsiqShdXZOXbN8g
 2k9IFwmsVcRFPyrMP+n6R4fpoDl3EHpGz+RUlTzgA1/FX+7EHILH9y/uyJ0mUzVw9QD6
 aIa0CqGiGgaL1P08hjhMI8dJJCbBj3TlSAYAX8Wr//UToiMDl6aACJ4pEhsMGtsJ1HJI
 gh0kfq5WriFOuyj2z/MOOAKzgWbF1AFF/mYR/GvcQAW5CWbxygEtEyO3EVPgviT/uI4J
 pdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=/ojtaq0pVTISiVB+t5H7Gtqn9qT+yiZRc8EYMYytpr0=;
 b=AjcjAVtDTidT9v3OHtjI25CpRzE5cgH0QT+MTE+DLtc2cjvzw+hNEU2o3Pu+OjgzN8
 mZA2hoZwCut25IM9cuKHgk6oqx6y1mRsHt6SPdfAYwFOUruRExaI0XRWfYuizz+nHGdG
 ZALNbO1KXtKfC7yZXrBIOB93Y9QTR3r6N1YM5dAOolJi5rAFvyxarpPLJb+IsITepmy2
 7cFRCYSrHFOC1zvTAxmERd8E1xnjAJ860QeIDjizWicGdK3VveN+dq2SZjkzMtquHL3v
 M/x337nddJwrnHuK/ZCZJ5qeaZE7DMvOFGgsaXm+znHJz9+CMHvPg9cfQPaaM48dKUj1
 zNZw==
X-Gm-Message-State: AOAM530BzAtrHw8AunPhx7o9RGJK+To9UgpHQ5wK2wfhK/TVzJX4K0ds
 fH8Sr+fHp8851vNeCxktBH/SaC7aWY8w4A==
X-Google-Smtp-Source: ABdhPJyBwuSNtM5/ptBpzBtWQ0GULx0806sbKBjU++Ipvid80IN1LkB54oBCdLtT6xip2SfKgAaWuQ==
X-Received: by 2002:a17:902:da8b:b0:15e:aba7:43fe with SMTP id
 j11-20020a170902da8b00b0015eaba743femr24282811plx.9.1652257900729; 
 Wed, 11 May 2022 01:31:40 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:40 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 07/16] riscv: Add vector struct and assembler definitions
Date: Wed, 11 May 2022 08:31:17 +0000
Message-Id: <fb2d3a118a4e2d657ee2b345c81f9c437d013773.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_013144_634513_9BD879B7 
X-CRM114-Status: GOOD (  11.55  )
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
MIME-Version: 1.0
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
 arch/riscv/include/uapi/asm/ptrace.h | 17 +++++++++++++++++
 arch/riscv/kernel/asm-offsets.c      |  6 ++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 0749924d9e55..91f1c318328e 100644
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
