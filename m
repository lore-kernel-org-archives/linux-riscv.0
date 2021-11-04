Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAD0C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:48:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1180260F9D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1180260F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObDT8IrgddkLNbG/uc+/ot2rdBmWm1zIdMLppDyLu4Q=; b=g9kYQQUVxhMcTO
	nPTHk2LrGCEnILlBsEe16Lr+2wljf1Fk5xRQucQndbqP9mofqKjJ6OXFuiPpIpZc5QzfaUxByvBla
	Bd769sBK4d75q2oPdocovwtnFTdpTkeQIMhqKu8z55gFZpGccl/JhoXW5M1H73aCVJlCkpXDL3y0o
	6rc75VmlNftzKW+Vx15kPuaa5TBDlZleX+JMITC/wdGrRLoc+hSXSEldmr439bVxh60y001M4UG3O
	htuuLNqYcDTV5DmOa/iIDOgJNCP1WOKbIlVMnFY4SnP/54uP22V9OPjYzNpzzg28SRQXAanfEcuSy
	eo5VeNpEyatZ43npVmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQvz-007MA3-Q2; Thu, 04 Nov 2021 00:48:51 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaU-007CvT-8s
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:40 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 76-20020a63054f000000b002c9284978aaso2389989pgf.10
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=z9H8IQzlDNgV44iopVPD/a5Trpa0ZdTpJckFcsIyzz0=;
 b=YKpIJ4e4/wfganLDuC8K208Zpsp5JVcK50xnWQQTLSFM+X50LE78T6m87p5qT3DblR
 Oqy3rk1VQsN1i/paB2gXcz5pvl+Jhd8ELjKdXAD0WmwFnDoXvIApQ5t8wATtH/xHBo3e
 E3zgwsISbQWVPjz/S1RIgDi94l9z3MF9WBJMMJEtMbLYrCmw/M0/pklTGnCcvsIM1IzC
 7p8hk9aIycQqutIs+/eYz7g/lbNHI/oVf07ie2vQl+tlRkiyfau6HsmDc9DeODVl5ybk
 WJzJ95EFnzX+H5HwRah9xIveGt9v2x/cU0TbcVn1MuEYGyTz7eHSGiF0kmPeMBG8mGAx
 hpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=z9H8IQzlDNgV44iopVPD/a5Trpa0ZdTpJckFcsIyzz0=;
 b=M+Hce+9u3SZ6YWpOLIrOqlWUjY2L2lkNEGBMa4+TKmBfC6JsezD2I9Fbmj7b0E9ew1
 jv7z6ySMxP5h+yWWXHffm3DfE2WfzRT3ICui9VZfhp3EdN/oLuYVXYveXBf2cq+z8sVC
 H0WpCOpOKXSbo4ZHGdNJM7SLBDAnXieUVCbDtdV1pZ2xH0uP1J8YtAqotx5bRCWGWf0B
 qBwdZOfdlEFALJUOCk79b8CwTNMdtIgfgRB4G/MQ8M1B6a30s2gMDeSMrs5uwNQ6gPfX
 7bSbm0kKZVn7X+IDWNADZ/dgKQJGPBWfS2BIS9R/F1AB3iJ6qCZlpkgsMPejBphp/KXf
 EtUg==
X-Gm-Message-State: AOAM530Jgo3w56zOcKqSRnHE8gnOLWwK6bztyNlCL1NirlOyFvtbQJgj
 807qVnxGYl9R4hlYq3B8ssKM/mEolw4=
X-Google-Smtp-Source: ABdhPJzonurVPT2PlJyw4WaELXDlFkKjeT4hoSllYUuMDrNarwts75/W8wr8EQC45lWUJfQCoW+ypti7LUM=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr261421pjh.1.1635985596589; Wed, 03 Nov 2021 17:26:36 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:23 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-23-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 22/30] KVM: Move WARN on invalid memslot index to
 update_memslots()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ben Gardon <bgardon@google.com>, 
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_172638_383245_5473BBAA 
X-CRM114-Status: UNSURE (   9.86  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Since kvm_memslot_move_forward() can theoretically return a negative
memslot index even when kvm_memslot_move_backward() returned a positive one
(and so did not WARN) let's just move the warning to the common code.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a2d51ce957e1..d45d574a5a2d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1307,8 +1307,7 @@ static inline int kvm_memslot_move_backward(struct kvm_memslots *slots,
 	struct kvm_memory_slot *mslots = slots->memslots;
 	int i;
 
-	if (WARN_ON_ONCE(slots->id_to_index[memslot->id] == -1) ||
-	    WARN_ON_ONCE(!slots->used_slots))
+	if (slots->id_to_index[memslot->id] == -1 || !slots->used_slots)
 		return -1;
 
 	/*
@@ -1412,6 +1411,9 @@ static void update_memslots(struct kvm_memslots *slots,
 			i = kvm_memslot_move_backward(slots, memslot);
 		i = kvm_memslot_move_forward(slots, memslot, i);
 
+		if (WARN_ON_ONCE(i < 0))
+			return;
+
 		/*
 		 * Copy the memslot to its new position in memslots and update
 		 * its index accordingly.
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
