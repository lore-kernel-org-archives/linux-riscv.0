Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502CFC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 06:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=aQG5Aa1FSoM3JIzue10/fSfVM2FohwDlABuTarHjt8E=; b=Dm8
	AxrM9mXj4dA2cuU8mSNUtRBtLaLKq6h3Qo1d4jshJ4RcEV0NXa5BmqB933rFOoXM24VOffoiCNV2u
	NSHTZI8pY/UgtphWF3veTSoaDLa2GclmcsSBKQLSYa06pVdzTmrCcJLXC0nfvHJMvd8B6+iRVHMO6
	0sb6BCrMAnZMDePxg+FYsgoucyr1X0uBSxYR2usUimN6Brgawtk42XJw3NUotC/WhQ5z4+8gbqzN0
	gSHb3OkKfwmu1McFfix/XMczFqhvy6m9SN+P/869PL2yXmGCPKoEottae5wsjYMozcQBQe92vBF+h
	0rWht26hWNNepQsd4sIv9cwLXUvMLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSAVC-00FJRC-38;
	Tue, 23 Jan 2024 06:43:18 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSAV8-00FJOb-0W
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 06:43:17 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-600273598c1so17285707b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 22:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705992189; x=1706596989; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2FZwZ+rXghzrwMAzRL81BGjWf4dIgKukf4yDKbJi/Es=;
        b=1m4rOMOBhMFAp4L3IsCcZaCr9dEsnxsvRWe39LBMttpL1qXn3QjEm+WSOLE1tP4GKA
         hslROkQatXQCIK496jK4FftgpeJwF1oWPRVvUWKq9Ygf9rZ/a6bZPfN0U/TfOXdhk+qZ
         BH/382NtLHpyGXyvhhik0pGJi4KeTmp3dvsxqFn95mGQ+anyaeeafIlPkx8c8bCpALAx
         bOlbxrLviN6DgHYSWrWgd+TaYGETqG3rnyD8Xobc6+J/wyFxvjHLdx89o0fOHRNwacD7
         setGlD6Ig28zRtk6sz3BxUpk2dIYzDkQ34wm67HgJQIKJWIxD/wA5Z4009fTHOeos4DF
         vGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705992189; x=1706596989;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FZwZ+rXghzrwMAzRL81BGjWf4dIgKukf4yDKbJi/Es=;
        b=Ptbfa+llS8HhPjlM3Augb2eyrXbPsyHS2MGzMM7vR0MsRyCZnjZvAU5pm6oJLkzfl8
         YZkt3OsysKqr+WvptIw2ssB/iYLvQe3ZOF9JwIiz47Dw8tO9tq7Cgr8fqK68f1uLJd9l
         zyIwQLXfHwvLGq01gM5WQkqyA7XRMOK0j2vy870kAKDwvsJcYa4bl9eK8hibOFDseLXI
         2Dh2OYhJovmLYscliHOSKLdtMS7wUmvSzSMO6ClBmMZKxCUxqf4rO845eCPBm19QOVxd
         29UwY23kV4kaoYwIc/gdj5st90H26Mvv+XvUltZrEjtSlAApp7BYIAT0MipibiXydd/b
         fD0g==
X-Gm-Message-State: AOJu0YxPe0vv79tVHMSGztS7JuifXfsOSeiykk/M/UcNcKn/zXINAb0K
	iLOkRAiOs7+cC4ERVfDqo23UduTtWeXJq/uzv+StONP2OwaBfPc32wsFoUjkhdyZF8sO7ufvuKS
	EqQ==
X-Google-Smtp-Source: AGHT+IEO6A9zRBfOAVXliXkQQKxCV0qhRt+egkKWA991dYf7yzqjSRjLplw2MTnE92/ZhwSFnAUoRNjPv64=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:6bca:2511:6f80:6efe])
 (user=surenb job=sendgmr) by 2002:a0d:d68f:0:b0:5f9:990d:78c0 with SMTP id
 y137-20020a0dd68f000000b005f9990d78c0mr2517316ywd.4.1705992189291; Mon, 22
 Jan 2024 22:43:09 -0800 (PST)
Date: Mon, 22 Jan 2024 22:43:05 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240123064305.2829244-1-surenb@google.com>
Subject: [PATCH 1/1] arch/arm/mm: fix major fault accounting when retrying
 under per-VMA lock
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, will@kernel.org, catalin.marinas@arm.com, 
	palmer@dabbelt.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu, 
	agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	surenb@google.com, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Russell King <rmk+kernel@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_224314_240942_A04FF34C 
X-CRM114-Status: UNSURE (   8.26  )
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

The change [1] missed ARM architecture when fixing major fault accounting
for page fault retry under per-VMA lock. Add missing code to fix ARM
architecture fault accounting.

[1] 46e714c729c8 ("arch/mm/fault: fix major fault accounting when retrying under per-VMA lock")

Fixes: 12214eba1992 ("mm: handle read faults under the VMA lock")

Reported-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/arm/mm/fault.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index e96fb40b9cc3..07565b593ed6 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -298,6 +298,8 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		flags |= FAULT_FLAG_TRIED;
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
-- 
2.43.0.429.g432eaa2c6b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
