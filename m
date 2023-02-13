Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E53CC6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VrnQLBrgAdR/11ZOmyCylVTmqltMpFWg0P1DdL/33cE=; b=pbWVWCWo17dDrx
	9VgHKaRH8URWGhNTTVZS4MjdatrjFLLt0FLd9VUxzAePGObRFuDaDoERaTkzxpL+Ci5pUO0RPoIGm
	axvnJmt3I9Q6jJK2Qq2P11oXR4Xc4bjePALzrYP5Afx+1Q93WGgybKe++8gmDR0o+XybXu3u8Dx0O
	HX92yJvKJnZQ//D04BBNrnqqsGneUrBmSyDDrdzjXZv6sKwraUdMBYGQnrxnGTZ+LjWcHcgbDI+qw
	QPfmAd3hBUxH4aHaMoiZoZXVZbByAHsQC1wPCczziq/ZJ5dODl+4i9rW1NX/JUWffWsrbN+NU/wE9
	GUmcjiuDaBATdkB2DhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQrh-00D9sg-8U; Mon, 13 Feb 2023 04:54:58 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQrC-00D9VR-Kp
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:35 +0000
Received: by mail-pj1-x1033.google.com with SMTP id d2so10743803pjd.5
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sWo6wCd+6s/qv8qKQzFAIRIpzM1RXjpCLCKpSqwk7c=;
        b=wt3q+VJD6Cp/b63Im6YhKcHv2i1AyapK9Tkrv/Lhww4i7czsTc+eUGnKJic8SCla3/
         PZeWAHDzQcpwxfG87wj9siHJ53pcxmGJj0Al/qZsMz4b8wLG4BExSAIQ4Nh0yVWI8eA1
         mdxKCUjoG1enCDnovmujulzh9ivudh8B7fewqOfdwU/ZGjXrEe0tnW65F6JP3I73DJ0O
         2pC+POBx+yCDZm97cI3uisSvoGWjp5y005oxdW98wIerdHNjp+Fv0zqfuea3nWldQhEm
         4GleUJiZnFqHyNc5rExalqnFx+zUnW254K9Y/BfKidu8I/uoOfcdaSt+6r9FSxD1x7yu
         usKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sWo6wCd+6s/qv8qKQzFAIRIpzM1RXjpCLCKpSqwk7c=;
        b=sYzOO6P2xmSvTp6lAn0rH/j2P3yhgUthe5j3xEgU+xJiq6nxnhMFnym5U74u8tP4lt
         AdFGDh7EjzSz7YEGe5RnwKlqcml5SnC2uscII6+fTnkGHKs5axw5UQJmxo3O0LCI3oSZ
         TDQaEFH6vIF5N9M9AnK3ZYoFA6DqfbbZdF0stPcO6P9q+5xFtBGUrC94nC3svD2H7W3s
         tLYJhDLZ/LQoMnHr+cUXFrF5sy3F0u8k+S7hI4HL4JRwH+imVSK8wZ0/55D+sQlQM8rL
         gOoQaAfGX3o31t4l2zCDdYcPBrKGxr8xc4BQ1z3xpPhqL3fNQCycKOyWQjwUJEADCgJa
         H4qw==
X-Gm-Message-State: AO0yUKW5aDKrwHC1YPLtyA8FHswMilP7EqeS4fO1J1mE14hGZn7wYKlY
	fv1L88aNK9R+o1b7IoGN/lPVlg==
X-Google-Smtp-Source: AK7set/We3gZfKBWsBui9LQ+h2dQamScS+mnmA55bftJ1qX9qQdJsEmqonYKb0jOGqlzZmSqaU7JgA==
X-Received: by 2002:a17:903:124b:b0:19a:9406:b234 with SMTP id u11-20020a170903124b00b0019a9406b234mr5720720plh.45.1676264065599;
        Sun, 12 Feb 2023 20:54:25 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:25 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 16/20] riscv: Implements sslp prctls
Date: Sun, 12 Feb 2023 20:53:45 -0800
Message-Id: <20230213045351.3945824-17-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205433_292889_E34453AD 
X-CRM114-Status: GOOD (  13.76  )
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

New prctls are PR_GET_SHADOW_STACK_STATUS/PR_SET_SHADOW_STACK_STATUS and
PR_GET_INDIRECT_BR_LP_STATUS/PR_SET_INDIRECT_BR_LP_STATUS are implemented
on riscv in this patch.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/processor.h |  4 +-
 arch/riscv/kernel/process.c        | 88 +++++++++++++++++++++++++++++-
 2 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 39c36f739ebb..c088584580b4 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -46,7 +46,9 @@ struct cfi_status {
 	unsigned int ufcfi_en : 1; /* Enable for forward cfi. Note that ELP goes in sstatus */
 	unsigned int ubcfi_en : 1; /* Enable for backward cfi. */
 	unsigned int audit_mode : 1;
-	unsigned int rsvd1 : 29;
+	unsigned int ufcfi_locked : 1;
+	unsigned int ubcfi_locked : 1;
+	unsigned int rsvd1 : 27;
 	unsigned int lp_label; /* saved label value (25bit) */
 	long user_shdw_stk; /* Current user shadow stack pointer */
 	long shdw_stk_base; /* Base address of shadow stack */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index bfd8511914d9..1218ed4fd29f 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -257,4 +257,90 @@ int arch_elf_setup_cfi_state(const struct arch_elf_state *state)
 
 	return ret;
 }
-#endif
\ No newline at end of file
+#endif
+
+#ifdef CONFIG_USER_SHADOW_STACK
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	unsigned long bcfi_status = 0;
+	struct thread_info *info = NULL;
+
+	if (!arch_supports_shadow_stack())
+		return -EINVAL;
+
+	info = current_thread_info();
+	bcfi_status |= info->user_cfi_state.ubcfi_locked ? (1UL << 0) : 0;
+	bcfi_status |= info->user_cfi_state.ubcfi_en ? ((1UL << 1) |
+		       (info->user_cfi_state.user_shdw_stk)) : 0;
+
+	return copy_to_user(status, &bcfi_status, sizeof(bcfi_status)) ? -EFAULT : 0;
+}
+
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	unsigned long bcfi_status = 0;
+	struct thread_info *info = NULL;
+	unsigned long shdw_stk = 0;
+
+	if (!arch_supports_shadow_stack())
+		return -EINVAL;
+
+	info = current_thread_info();
+	/* bcfi status is locked and further can't be modified by user */
+	if (info->user_cfi_state.ubcfi_locked)
+		return -EINVAL;
+
+	if (copy_from_user(&bcfi_status, status, sizeof(bcfi_status)))
+		return -EFAULT;
+	/* clear two least significant bits. Always assume min 4 byte alignment */
+	shdw_stk = (long) (bcfi_status & (~3));
+
+	if (shdw_stk >= TASK_SIZE)
+		return -EINVAL;
+
+	info->user_cfi_state.ubcfi_en = (bcfi_status & (1UL << 1)) ? 1 : 0;
+	info->user_cfi_state.ubcfi_locked = (bcfi_status & (1UL << 0)) ? 1 : 0;
+	info->user_cfi_state.user_shdw_stk = (long) shdw_stk;
+
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_USER_INDIRECT_BR_LP
+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	unsigned long fcfi_status = 0;
+	struct thread_info *info = NULL;
+
+	if (!arch_supports_indirect_br_lp_instr())
+		return -EINVAL;
+
+	info = current_thread_info();
+	fcfi_status |= info->user_cfi_state.ufcfi_locked ? (1UL << 0) : 0;
+	fcfi_status |= info->user_cfi_state.ufcfi_en ? (1UL << 1) : 0;
+
+	return copy_to_user(status, &fcfi_status, sizeof(fcfi_status)) ? -EFAULT : 0;
+}
+
+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	unsigned long fcfi_status = 0;
+	struct thread_info *info = NULL;
+
+	if (!arch_supports_indirect_br_lp_instr())
+		return -EINVAL;
+
+	info = current_thread_info();
+	/* bcfi status is locked and further can't be modified by user */
+	if (info->user_cfi_state.ufcfi_locked)
+		return -EINVAL;
+
+	if (copy_from_user(&fcfi_status, status, sizeof(fcfi_status)))
+		return -EFAULT;
+
+	info->user_cfi_state.ufcfi_en = (fcfi_status & (1UL << 1)) ? 1 : 0;
+	info->user_cfi_state.ufcfi_locked = (fcfi_status & (1UL << 0)) ? 1 : 0;
+
+	return 0;
+}
+#endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
