Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1231C7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QiwA9h+qrd4KzI+lWNKTe53kwRqt+164NbizJH782H4=; b=h2BBQ5X441kMbQUBVtVG6BsONS
	ZZCaYCbZGg9GFul3zM2/8hjad5IvmBgUDPQIOjKG5U8aa1qwvHXOXQldD+R0N7JRwYi5HLhQHFcZP
	/iSHJhRwHNEZ6b3vUPhcGhwpYlmWZ5ApNstSSQsuIjsK8+I0vJryVvnZUHuFBAkmwR8n7o39x7G2b
	VuqqVyQruML+3SgLnRPPPh9HzFq4LTVQ2iq6FSy9tj8WkZjEdOVsu9+7Cdz/QSOCDuwhtV9P5nZbq
	YGFtcY57UP6UFbOoVFENvamKqFw5DVAvawKeIPZuPLJrKeQC//gPdh3FD/nWNxP8vNwCfzreV/+uE
	SZ0sfRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57qI-007REq-0O;
	Fri, 02 Jun 2023 16:41:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57qG-007RBb-2X
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Jun 2023 16:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rivHDhk0ioxMpP1XynwGaSZFsNZDBBbqgVAGbR7E/X8=; b=dyecyeCEd59sMLHaoda9jZN1nU
	FDOkOhfKgqmqbCGQRmrKVyQ6+j07mK3875igB3inDMKxiFgoeyx9l+GWcbnqhesilzyMnFUPw+yNY
	XEmEhnbWem9LWFE7i1yNZuU6PFzz/AvtGMvcOr1p+2EMEop0+p1Hj38vsFel/tNAVgNduYJCqbKFr
	16n7DO61zT37ZxFuuc2LeiG99x0seas+bMvd9POKFQcxMhINtjM2SUV8bz8ulrxjeB2GvMQddM28b
	PNBJU4OQMxUgjaJulSAKG1mIdlaVQ1U+vHrK3Fg2qJb7t+iN0zZjX6Nes1sBTtxw8sTPHee01V7Hk
	ZYSnYgkg==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LT-001NB7-2q
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:09:50 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1afba64045aso22825445ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722181; x=1688314181;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rivHDhk0ioxMpP1XynwGaSZFsNZDBBbqgVAGbR7E/X8=;
        b=IxpZG4TkYuPd8UtpcDQplKJDDIpAs6lGKWZe95duADLUk5Xly6SRvjrVvCEGB/Fk1a
         E9X3IJECzkdQ25Bkjejj4IbXek6JqPY58HRA50EOI/YFTzUpFaA/bzGSlAOm+5PEvo+T
         6jKSmBS0KSmdPni70wpBlwTPrvyYGZvMtxSC3Fbri9jwwzePk7OY91lpj01vmu9g7PZn
         a5J+YN0h1Qu/z/w7ubpNpCMDwcQqYWttGGXgoLeySgwUxIZDyVDmv/3Bk/4OJqAcfD0+
         gHcpPqAo0vTPvSXpzWrIqDWuTjrALALhGQwaLZCyItTHvmVctEjS/JfpfTvctKcX+1gM
         QFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722181; x=1688314181;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rivHDhk0ioxMpP1XynwGaSZFsNZDBBbqgVAGbR7E/X8=;
        b=dgIdJxlikLlQJ25hTajJrg+Jkq2urXvvPZqRYQfgDPtJu0bsdmICq5auja/mXsLasY
         V9aGLPWVAO1//KacO1/Rnv+UtUAzxj3CMbH1n9ZuRoQ5JG4IRtyFzzN3g3oVXgAV21MH
         jGD7VNZ3xll14ASKNVE2NjxLcCqLBiMS9X1h6rTO1XfSAO3xilzc4ggCFyRtnErX3BG5
         +xH0GNlvn8ksZrRYCBRerZT1b6nop3yglkrYhsibu430hxOan+kzWi53rlyJb8hJLobF
         85QwbmAFQSM2+7BTXWf7o5/2B4iNr38c2N67iR5ilCd5gH30QAeMovvTopkG4YJ3em6t
         e5oQ==
X-Gm-Message-State: AC+VfDwu0P9/HgarPLswCWQqBtExbyarCrBNUu8Sy700kGAuomRL0UrJ
	al0Y4pY2Nzv8F9f3CKEip/MkJry8hRLf
X-Google-Smtp-Source: ACHHUZ4crxpGe15BxcOcaGOZO2WjPbibX9jRmjl7rSrwdD8Z6/aya1uE9CJM9AhjU7HHArKs+z3PEQeSOj8s
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a17:902:e3c5:b0:1b1:c90e:b7aa with SMTP id
 r5-20020a170902e3c500b001b1c90eb7aamr56727ple.4.1685722181662; Fri, 02 Jun
 2023 09:09:41 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:09 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-12-vipinsh@google.com>
Subject: [PATCH v2 11/16] KVM: arm64: Use KVM_PGTABLE_WALK_SHARED flag instead
 of KVM_PGTABLE_WALK_HANDLE_FAULT
From: Vipin Sharma <vipinsh@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_170944_233669_F9062542 
X-CRM114-Status: GOOD (  11.41  )
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

Check against shared page table walker flag instead of fault handler
flag when determining if walk should continue or not.

vCPU page fault handlers uses shared page walker and there are no
other shared page walkers in Arm. This will change in future commit when
clear-dirty-log will use shared page walker and continue, retry or
terminate logic for a walk will change between shared page walkers.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index bc8c5c4ac1cf..7f80e953b502 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -191,7 +191,7 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 	 * Callbacks can also return ENOENT when PTE which is visited is not
 	 * valid.
 	 *
-	 * In the context of a fault handler interpret these as a signal
+	 * In the context of a shared walker interpret these as a signal
 	 * to retry guest execution.
 	 *
 	 * Ignore these return codes altogether for walkers outside a fault
@@ -199,7 +199,7 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 	 * with the page table walk.
 	 */
 	if (r == -EAGAIN || r == -ENOENT)
-		return !(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
+		return !(walker->flags & KVM_PGTABLE_WALK_SHARED);
 
 	return !r;
 }
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
