Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07D1C25B4F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ouSzPNJ3jddmMeOzGSo4/2kHiiZQz+iw/a2j3GLVMT0=; b=3lqnSbWHLT03Yp9ky3KUq7jaPS
	iHODG3HfaamVg/kIX1H0RReWFR1PExqJzm0yP3/GsBMrss1oE8XfB7vihQMQqsHGU7lPcoezDntHt
	f/b87ZZLWoUq0jmuJ3i6IUuDkDi9XnA132LAq8rLeQpVjMRXSi0nv4CuyPzxh2Ri4vw8b9H12UJ7W
	xbwEtRcymuqu8YUW6bJ//rp5OPP4CS6UR8uG5Iy56EVHsDjI/TJZ63N8mG2qi8wXcGwiAF1zQf9C9
	LtMjTIkg3ZSctIMgDdt2i93WEMKtTsc4AnzP+Hs/Au6Q0OUQE8jfAkGfbLZKm4tUVh3f8QAhp1kP5
	l5j6FJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xTq-0000000HWHT-0FNz;
	Fri, 03 May 2024 18:17:58 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xTd-0000000HW6p-0wxV
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:17:47 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61df903af62so71850527b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714760263; x=1715365063; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCWz5AboezUKY+fKcSkwtkc56yFvTydQOL6+C1uV1TA=;
        b=QLfMBwnNJdOp/btp8rlM42ib8SoHQzb3J/mwDLFy6EeZuN3/tG7oB5gKFgweOKBNKh
         gTKDXd96FiaWl3aJzL7rq4URBYE/4M6wQAXF8z3WFEkKKX6YE8ATphiUBwKa7T5oz0YV
         D9FAhoT8n78YefEqHzTDwFZAYEHsrVqPhpIdpxcBjNT0wMHhTHnUe/lKXDuM/WNGbRTW
         FwrS69U04YOBtXj+NdJRZD2AaLfL9HQQarlLvninXdCEiwz1pqzgFp3y+yDd4hKDov3l
         pahbDuqXOhO1OdSKuJwPWvllY7r6h70MVlnjxAN1LKc/3utIiE3eFPaZNI6QyU+1NALp
         VKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760263; x=1715365063;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCWz5AboezUKY+fKcSkwtkc56yFvTydQOL6+C1uV1TA=;
        b=mCs3d9ueBl/yr6KySVpqm4BMk8Yk+rpO4AyFi/OD2aZxVgLQSf/KhQdeq2E3lU+zDK
         G8YuXaHKei5KLjTyzonf0t8CLOahB6vSq4Qu/7U25hr/e84+B6Zv3cLfKzy8eCjqfarP
         fNemdsocugy73KuyzbU6gAr057G0zvZGhy3Y4mmozrnC407RQBER85p3n0C9yU37oWdQ
         Fe0dIWIDTkoh5JfmzIvMPyZXSE51ioQxth+2N/EItjuJP+w3imZo+/A3Aob2cWKuKjSi
         gjdk9dkNBlmq0vb3TqKg8X0wwIYQcYdB4xYgBmFIL74KaFGfZQbqo/uQUrTag9F7o97S
         5V1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8678YNH9pbHUkZ45hsu4suk2Tv/LaS47Z9gXIMzPWXDfnwcHAry2xWX0rarF8VLKslJATqXTyUdcN7gsk+CP8p3cguDvZOAmFvO/GiHQf
X-Gm-Message-State: AOJu0YwPybl8xAYeKOhaMWWnx+51QDUReQQcmhkNd/NfBwUuhB2j8pBc
	+/Odj666WHGA48ZN1PogHmD+S/ysg/Ee1+PemVcQO90S9EhKaPjwVAw/GWWgQ7LipdrMMWqEtQI
	GyFnX7Y7h1w==
X-Google-Smtp-Source: AGHT+IG8z91B85kZw12g8ILejBDce9nCeI6uZrPNjYvj7vQXfcVKq57xpnYqIWHHCJ8gvpfpvg4aSbrDSFG7Mg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a0d:ea05:0:b0:61b:7912:6cad with SMTP id
 t5-20020a0dea05000000b0061b79126cadmr815080ywe.2.1714760263504; Fri, 03 May
 2024 11:17:43 -0700 (PDT)
Date: Fri,  3 May 2024 11:17:34 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503181734.1467938-4-dmatlack@google.com>
Subject: [PATCH v3 3/3] KVM: Mark a vCPU as preempted/ready iff it's scheduled
 out while running
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_111745_465250_48F468EF 
X-CRM114-Status: GOOD (  14.71  )
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

Mark a vCPU as preempted/ready if-and-only-if it's scheduled out while
running. i.e. Do not mark a vCPU preempted/ready if it's scheduled out
during a non-KVM_RUN ioctl() or when userspace is doing KVM_RUN with
immediate_exit.

Commit 54aa83c90198 ("KVM: x86: do not set st->preempted when going back
to user space") stopped marking a vCPU as preempted when returning to
userspace, but if userspace then invokes a KVM vCPU ioctl() that gets
preempted, the vCPU will be marked preempted/ready. This is arguably
incorrect behavior since the vCPU was not actually preempted while the
guest was running, it was preempted while doing something on behalf of
userspace.

This commit also avoids KVM dirtying guest memory after userspace has
paused vCPUs, e.g. for Live Migration, which allows userspace to collect
the final dirty bitmap before or in parallel with saving vCPU state
without having to worry about saving vCPU state triggering writes to
guest memory.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2b29851a90bd..3973e62acc7c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6302,7 +6302,7 @@ static void kvm_sched_out(struct preempt_notifier *pn,
 {
 	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);
 
-	if (current->on_rq) {
+	if (current->on_rq && vcpu->wants_to_run) {
 		WRITE_ONCE(vcpu->preempted, true);
 		WRITE_ONCE(vcpu->ready, true);
 	}
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
