Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2444C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JV+bC1DmaxpkzWYmS0qmztBEVGMtJzsiQSqR4cUsuo=; b=dZzrtBaGXnf2ru
	SJLvYIfV8RbAb7NwHjnlLx88W9Zb5e7lq6cCbgiMB93FGeAJLfreXuBb/m4yWbY1cWqHJ7goWw239
	OfmFqW8R4mYp/1/h2V/1O/XsKD9Za3mLO1KfBWLvAGGdLUQNZsjnMzjeuYxIiajGkcfVdOR495h6m
	hQNoadRAfjB/rrv5Qr+udncUQ5y6QCUVBpL/lD7J8aEU5cNg6NpdUF1c+XuT2fcIUkFHHcnTXAbKs
	lL5BJGextjzXwZCg+W9aFAXnlbN+vxvnbJOAENJlRe0BetA4z5HJzbbD1TeMvuyzawRlRwC78W1wG
	m0/QTwQGm8le85m+gG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55c-00000007tjO-1zi1;
	Mon, 13 Jul 2026 01:04:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55Z-00000007tfe-363W
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:04:06 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2caf228a910so18339105ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904645; x=1784509445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=sTND7hhPpivrNPKLcY7E1QNl8LbT409YtQuJrH7IdLYQMALyCQ7Sn7u5AJOSvLsfUj
         9nRV6hY5s6IvGXnv8rRxWTTz4w0guu5N1nkW0WPCNnc3bNbj2PbHqCtUudmQ1pNTIjJ9
         /40vzFAFgg1Tx5wYfbKCkMjEyGj946/D7LOiwdbYGZ2X9JjvZCflxElDYEMRHpvAMQ8s
         SUqtfVzJHeI6z73pWqQmg+mQSHklPbOI9XruOQ9fJkHD0cf0KpHWDhjP3EE+ffVvpmlc
         x47PIdws4Dmv9clo54p355SDPyic7buJoyOfr+Ce0A8nJ5GEdma/7KI9VrJd7J9mYBsD
         RXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904645; x=1784509445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=e9HIVvXtD3LhWQdkU1EMxpo0ULTM0FyGx9bIttzYuqjLMmhHYa7wGZhkOTyN9HJnRk
         f1xzHs+e685fr5tWk8vnu4cxzCKus0Wz880NgpaKOnOaLqz7SVw7Qe0LyH93xOgIFcjU
         uav3XREOLBpF87md4a5d7koTmRVCrObXj+lSYQSJorKK06L9wQFAceyeL7BXdRluJwla
         eS3vAzoB4SW1yv6soFsE8Jzh5T/1dChbxRw0juf6O6166nU2JCbRsKbaWCMAClk3j465
         L4YqVWbm4BamkdqQGmZV8N7ndaSC1Vit72ZXZcEtidr+wq8ug8/M5lPBDGcPqt+e6XHj
         wBVg==
X-Gm-Message-State: AOJu0YzkrGyAFU4NArXOz+6uBbznt5eJUPw1Rf1lp4OvQU/cyL5g4t4X
	6k3JpF0P9UgZR9smVi1ClZGyPTSjF4V+DZNQlT8nKl2bBvs7QVEAW/CW
X-Gm-Gg: AfdE7cm0jDDnzKppyFoYQ3hjr33lyy81ZgcmkuzAbXRK2KROtKJOqs5u39OreyO4gl5
	qnL/phjHEfq1YZEK4MmrMAgaW4dxy0ZBtdw0PK/FDOG97Xkdn5YMM2eUPWJ0zzXISSjhMCfMQse
	hKH3KRtljFHeQ9jOiC6I89WdtIDQ7me3sfCY2WcEvZM3M+J1htUhyHw206HGhZwMefP4MHetMkt
	gBsweLGE/SVlztubBLeLHm69ZwvE7bUtyl8AtYyprHw3MVnxceVTE97RHvPFBh85SaFbtDMNrE8
	3TDWeNsMCVb80KLRX9We7MTlAaj3gGGiPnxfzL4HT4Fe5GXsmZlM2veCJY+05kujrNz42pMurhG
	CPBV+/9o1fn0ziQvUkJtE5X2FHcY0KtKLiViqm0LR46xudhkKmR2vnYeXz/+jzfJ2rNXmx9OJ6S
	RHsMMP3Z04yWM=
X-Received: by 2002:a17:902:f708:b0:2cc:98b4:e7d7 with SMTP id d9443c01a7336-2ce9f17913emr69731695ad.45.1783904645152;
        Sun, 12 Jul 2026 18:04:05 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm91755405ad.39.2026.07.12.18.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:04:04 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 6/8] RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is enabled.
Date: Mon, 13 Jul 2026 09:02:59 +0800
Message-ID: <20260713010302.303278-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180405_778433_F372FDF5 
X-CRM114-Status: UNSURE (   9.04  )
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

Delegate the newly added SPELP bit from Zicfilp extension to VS/VU mode
if it enables landing pad support.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_exit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 12eebeabdf14..92a3ea7c7ffb 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -154,6 +154,13 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	/* Clear Guest SSTATUS.SIE bit */
 	vsstatus &= ~SR_SIE;
 
+	/* Change Guest SSTATUS.SPELP bit */
+	if (vcpu->arch.cfg.henvcfg & ENVCFG_LPE) {
+		vsstatus &= ~SR_SPELP;
+		vsstatus |= vcpu->arch.guest_context.sstatus & SR_SPELP;
+		vcpu->arch.guest_context.sstatus &= ~SR_SPELP;
+	}
+
 	/* Update Guest SSTATUS */
 	ncsr_write(CSR_VSSTATUS, vsstatus);
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
