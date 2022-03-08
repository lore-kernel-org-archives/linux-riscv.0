Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216DBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1CxnFHRyVz+mB9wdHORiL7m5TCVbDHvmJLg5thxs4lU=; b=Pyyxr7jXvk+1Q4
	A7FMFctC6EEWfROzM5DEaHUnVUenE2AokdG3MVJq1CX2MOcTTxuWV0bkLpKSDia+UkylOsM8ZeaNh
	/NiyvywjAdnzWJNJ5CmcVjIanbBqf+KIqpcFX1c3VcGM+1FdCoOcg5dN47XX8QIZvs0ZM1cnJcxgc
	vwgLbuomvX/upA5MBRGPEIviG6im0TTAG345wQrm21TsYh27PqC4opdeIMnN66jlzdaSLwvOjKU+Y
	RoejNeIO5MZ9fvOVlt37toTdbk2nxOeihaJsTAfJplj5r1DpOmcF/COII3RaiNKoghqh5JpHUpjnc
	T2+FIVTJwbHphKJsAUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVHE-003HRl-SG; Tue, 08 Mar 2022 08:33:04 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVHB-003HQD-Gc
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 08:33:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id m2so10437645pll.0
 for <linux-riscv@lists.infradead.org>; Tue, 08 Mar 2022 00:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=8lLMPOLAcgvE0Bpd2ag3NkqEvdiu5tMiWTqlwKllSqc=;
 b=ai6JennFt5sE2ErgPIZ1S0v1mxwwJDOO/aCLufstgOeuuHK/WximeI37PkslBatfmF
 MBG2bP3zeHgFh1OCd5236mBcbpnrlKnqN6ZsT2f8WQ9d+EywnMdR9PceJhvqJ2x3eIOM
 eFjsFcmzs/idOTmHrgooHi8E61DoataquvE1B2Z++m8yxz6gdVW/r9GLxh1YghYBrfj8
 vpdLnqhLeMnN71GK26Qtz9x742zIDN4oXt2Iirx8rhd1j9oCMS9i961s+LEJwyXJI3P7
 vMumz4OW0VAkI6uiLtTq5fN667VLCb3PsuE6JFXgi9G6CE89ydQ38/fj4llvNbtdxVu4
 5SYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8lLMPOLAcgvE0Bpd2ag3NkqEvdiu5tMiWTqlwKllSqc=;
 b=cEhRYtWkIVECucB2xiPPUXRfr0s1SZ0jv0StwyAGi7uiIsVZO9MYpbOjlmuzGj/2Rn
 ihs4fLHekUwpFDgPMY7xtLWzQCSHQj9nBtgEgU7Ne9n5rahexIPHZLxqRbrfakarivw4
 DhCz4Yy0HqjZmw7jNYAmgKiBWDD8UOsb996Sto5mcF0aNpAEghvzpau8nZnMZoZs5C8C
 fIxjmpWkQ6C7Cqvf7FhFQ4vNewTvzJ1qmoKdQjq3NI6Z6deJt1YUEIiP3UG1QXWZciGb
 HjyszIGe7lJ8ipOcx/KiKMMlY4urJSFyylM0ataaUPJYdyJfD+RMRYSRmeGLHCvVWTBH
 yR+g==
X-Gm-Message-State: AOAM530fainrLnCIwUkYpucY2scRXtSLKMr10R1XBEtKfb9W5FXoT2iE
 sPSX5yB18UiYIU23ihswIhA1qnGw8WpKfYX3
X-Google-Smtp-Source: ABdhPJyylbfeD0S0jB/0AiyhuVwl55cE/EVhOt5TC2GJsAoS18eM5idwgEEYg4mpyeS21EB4wpsW4g==
X-Received: by 2002:a17:90a:cca:b0:1bd:729:5091 with SMTP id
 10-20020a17090a0cca00b001bd07295091mr3452731pjt.105.1646728379865; 
 Tue, 08 Mar 2022 00:32:59 -0800 (PST)
Received: from localhost.localdomain (36-226-208-100.dynamic-ip.hinet.net.
 [36.226.208.100]) by smtp.gmail.com with ESMTPSA id
 x6-20020a17090aa38600b001bce781ce03sm1912854pjp.18.2022.03.08.00.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:32:59 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: palmer@dabbelt.com,
	mathieu.desnoyers@efficios.com
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [PATCH v4 0/2] RISC-V: add support for restartable sequence
Date: Tue,  8 Mar 2022 16:32:51 +0800
Message-Id: <20220308083253.12285-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_003301_637790_69C594FC 
X-CRM114-Status: UNSURE (   8.78  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Add RSEQ, restartable sequence, support and related selftest to RISCV.
  
The relevant RSEQ tests in kselftest require the binutils patch "RISC-V:
Fix linker problems with TLS copy relocs" to avoid placing
PREINIT_ARRAY and TLS variable of librseq.so at the same address.
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=3e7bd7f24146f162565edf878840449f36a8d974
A segmental fault will happen if binutils misses this patch.

Changes since v3:
1. Modify the endianness checking.
2. Fix a bug encountered in 32bit environment.

Changes since v2:
1. Move rseq_signal_deliver() after syscall restart handling.
2. Add rseq_offset_deref_addv() to support memory barrier tests.

Vincent Chen (2):
  RISC-V: Add support for restartable sequence
  rseq/selftests: Add support for RISC-V

 arch/riscv/Kconfig                        |   1 +
 arch/riscv/kernel/entry.S                 |   4 +
 arch/riscv/kernel/signal.c                |   2 +
 tools/testing/selftests/rseq/param_test.c |  23 +
 tools/testing/selftests/rseq/rseq-riscv.h | 677 ++++++++++++++++++++++
 tools/testing/selftests/rseq/rseq.h       |   2 +
 6 files changed, 709 insertions(+)
 create mode 100644 tools/testing/selftests/rseq/rseq-riscv.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
