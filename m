Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109A1C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fHp8qu397GnXfMgr45YGcXNODNN3OXmSTwEu0JMcyPQ=; b=R7MlcpyC1/DPpNuQzXYZfxJpAl
	f6qCkPHtq8eNaHyJnwGUtmS07QKINO3Wu1gmhSra14p0/lQXsRhZuqn10hVztbM5hbT/4OooioR89
	ZpMLmFHrPztQEDN9RIBoxSNJnNOT08InWCR4LSi3WYLrVUNXeQsfGDe+4yVdUZgO5ri2v2yorlBu/
	8sUrYSawvyG1Nl9NLefvXeYraqfOmTB13OVmCjVFxXr06QIb31rG6mC3GgNeeARv8BiFKAEVVtxB2
	Yc49jp8LZaE/dh9RQihLpTRHLZej3wz3gVm8RzJb34czwDD/TJUzS6RxvBUou4qUqaiVWgc9QUQgu
	IcJ3/8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xTj-0000000HWBr-3ACu;
	Fri, 03 May 2024 18:17:51 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xTb-0000000HW5M-207n
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:17:46 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dbe9e13775aso17605815276.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714760262; x=1715365062; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QHXu+3wMl1x8qNonydytLIV6nGk0zgXCPmBNIKdSDOU=;
        b=i0YZkghn5IVvoLhCIYXAr0UvoYoOy9XNuFTSwing3AImXFHHylfdO1DCNCmvk7cBFN
         eDf0bqokgTwnKgtaXMolMWwcQENgwHbHWTSpTz1BndLu67Sl+a8rSwnQAyld5YO4crXo
         fSstCcYWBMMCv/f5tVMNcCjBfw9w4Ok3f8aKG5BLiLbudAnLf9HXY2KZh3itCKWGZMl0
         LMLiX/7v5j3utb25QZ070bAyj+7PAgK6/cxm+wvMIrsqecGotj9eWR9u9xiNauhYp0L0
         C6K3BHwvyKpGMxufHBu00yNucI23mYyrnifDWr+H1g5aPKTr+YGPbjmw8M0ZhXWLI05/
         LJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760262; x=1715365062;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHXu+3wMl1x8qNonydytLIV6nGk0zgXCPmBNIKdSDOU=;
        b=d3jhJhTuyboGkcNOd7Z5Ft7mtdt9t9C7kBgSP8NjKPa9HX79ieRE+1E0TlCsX5Ke9H
         vUUlmDag6n2fQkyvGKhlhWAaCtBxUQkI1n2mql93UcdBH1N7VXnHU8ncDof/P7yk+bjL
         771BPCqDUvuUo5GpxohkQeoi8THLyrFs1jcyLApO4VbADzs0vmlBFxfK3qLeEugWXg2z
         r+yPm4/OLC46jSwPDOteAcDBTkeNx+cLhJ1vBvY6EVHKo6QURfTb5ok95g4BTdJfBap9
         hj9A1WsdfGdKonkfQDH2rtVRzCzC6hAoGtDZY2I6XjlUH7xCtiznjQl5/c+yJpS5hpTm
         2qWg==
X-Forwarded-Encrypted: i=1; AJvYcCVjh1YrJlJjm+X73z9VzueZV14tnLpThcrVZC5o1w/rKyjKoy4hLyBgVoaocdGXf4dckKezvgKAZeRD4QMDzSYED/xraNLIjLNlPrxoLn0Y
X-Gm-Message-State: AOJu0YzPLwC9ClZXgVVpxcEs5DF6mGbiV39CxzCVv3nKmk3EUaFksqdS
	O6CDMJHVCRTKAA0jGKoYiPRqYoNv5nPLCchQKLfXlDwNydvNDvTdZxajQfYb2aI6+rFOXkk+ilj
	s7pWLxs5VOQ==
X-Google-Smtp-Source: AGHT+IH9qLn6o/uHe9WEM8VyAqFxWSMZ3MFnxC1YcYZ+IPtGArmXDrrlLFlgmBP/HenuKUWhjozjdfJl16Pvww==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:26cc:0:b0:de4:e042:eee9 with SMTP id
 m195-20020a2526cc000000b00de4e042eee9mr1003169ybm.6.1714760262024; Fri, 03
 May 2024 11:17:42 -0700 (PDT)
Date: Fri,  3 May 2024 11:17:33 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503181734.1467938-3-dmatlack@google.com>
Subject: [PATCH v3 2/3] KVM: Ensure new code that references immediate_exit
 gets extra scrutiny
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
X-CRM114-CacheID: sfid-20240503_111743_619236_277D6807 
X-CRM114-Status: GOOD (  14.16  )
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

Ensure that any new KVM code that references immediate_exit gets extra
scrutiny by renaming it to immediate_exit__unsafe in kernel code.

All fields in struct kvm_run are subject to TOCTOU races since they are
mapped into userspace, which may be malicious or buggy. To protect KVM,
this commit introduces a new macro that appends __unsafe to field names
in struct kvm_run, hinting to developers and reviewers that accessing
this field must be done carefully.

Apply the new macro to immediate_exit, since userspace can make
immediate_exit inconsistent with vcpu->wants_to_run, i.e. accessing
immediate_exit directly could lead to unexpected bugs in the future.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/uapi/linux/kvm.h | 15 ++++++++++++++-
 virt/kvm/kvm_main.c      |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 2190adbe3002..3611ad3b9c2a 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -192,11 +192,24 @@ struct kvm_xen_exit {
 /* Flags that describe what fields in emulation_failure hold valid data. */
 #define KVM_INTERNAL_ERROR_EMULATION_FLAG_INSTRUCTION_BYTES (1ULL << 0)
 
+/*
+ * struct kvm_run can be modified by userspace at any time, so KVM must be
+ * careful to avoid TOCTOU bugs. In order to protect KVM, HINT_UNSAFE_IN_KVM()
+ * renames fields in struct kvm_run from <symbol> to <symbol>__unsafe when
+ * compiled into the kernel, ensuring that any use within KVM is obvious and
+ * gets extra scrutiny.
+ */
+#ifdef __KERNEL__
+#define HINT_UNSAFE_IN_KVM(_symbol) _symbol##__unsafe
+#else
+#define HINT_UNSAFE_IN_KVM(_symbol) _symbol
+#endif
+
 /* for KVM_RUN, returned by mmap(vcpu_fd, offset=0) */
 struct kvm_run {
 	/* in */
 	__u8 request_interrupt_window;
-	__u8 immediate_exit;
+	__u8 HINT_UNSAFE_IN_KVM(immediate_exit);
 	__u8 padding1[6];
 
 	/* out */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index bdea5b978f80..2b29851a90bd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4425,7 +4425,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 				synchronize_rcu();
 			put_pid(oldpid);
 		}
-		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit);
+		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
 		vcpu->wants_to_run = false;
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
