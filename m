Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26B4C021A4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 00:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5pYBZ4IKpqXKoJUowfkMEMrDe1jYQfZCVyMHdTLQvc=; b=MR8Q6kMLuFpAot
	X3q2R9AiSn6K9nLXPgwEKybNNaDSXCbUPWe+ARGAhZiNLTu5le/U7MmoUboDry8WRLlm4pNjYJoZQ
	ger+lUncW0o0J08kcmMTBPtNlxuBp/sYV4qnxDsFMHyKve/GFQJPq/Tv7x4iBZGWB+TtB+y7tBQAw
	OWPgQ0RbHvjS1A1l6J3LtZjlpvJB7MrzsHgAepMp7+luV6X/gU1XhkJFzXE4Y3WjhsewlCL5vf40H
	MlUQ6EwW5rF3iLyQ2u15TkcW/cGGYqkQezjSF5rHvPFYgh8wOfrYEVlIJNOD3gf7IBEzlQ/EfBf4z
	d4GfHQ/d7/vQfcKqjB5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiNH-0000000FZNe-2EXb;
	Tue, 25 Feb 2025 00:00:35 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiIh-0000000FXx7-49rx
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 23:55:53 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-220d9d98ea6so43734015ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 15:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441350; x=1741046150; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cX82JgrIVLcCgP8NY5WI6d8YhxJG+M3Mihkk6f4MOJg=;
        b=3nh84VgVLnx0IeX/0dOOd1PrUaTs9ZeMugaA8ECFuK2BB0AY+JFlSu2f3CXz4+g69C
         n+FnDOeoluJdpalQLDG/P88ZkawgOWlRW7tN7xaHrvIlkWimsHccRRWdcc80mCZbu1K8
         2KPVFxobEVV8HbNxT07BgGaUqz8seg0OBq4mncbVCGQZYlKy/LToFfBR33A7E1pN7KZ6
         /+uLZJnkyAKN7Hre1fW0EZaDmypRwRNLmQtrHtXHz1HUNI3nyhBNHnDVXFPQEb+S7IJN
         KFrwkuFbsn+Amy7din4sWE7oXVQ5aNmc6LCzljehXc8oRRwQXp0FahhTgDajN8ItpyAL
         aa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441350; x=1741046150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX82JgrIVLcCgP8NY5WI6d8YhxJG+M3Mihkk6f4MOJg=;
        b=cjsLnIwi4E394Hz50UzaUYsIe03ZD2GSqkaS/DtXQJ3yl3KEHmBPQaPBZvIzz+2JRF
         VnY0FbLSoRrR0WjovPFegIShFEYvBQwHEeJk/6cKd9saCRIyofvcy1o83zPJXVw0nBpM
         tblCNBYz9d+3Zccb2mfJZbahRRIbx5IDxybuPzDtx530obDRwo4KWOLq2OQNpn/E5Z9L
         2yHYHk/lqCet6XCSasVNaP2cFxk+U5+99G7tAGkIpa/TlNZMOOMr+dkGGs9rM6g+uNMu
         hzxN8DQ8AKRra5TQnEnieW4l1VLWOrwh5U2h3/S7Yh9DLebNWZZ1gUNLgY78zQFxN4Hd
         fHTA==
X-Forwarded-Encrypted: i=1; AJvYcCWUROSZFeMZrqa9PHM6sw9UMR694rmvslEzZJGZ+Af3Sr/gp/e7nvHeQSPWjLC+DHzN6e9LAk+LMa7CSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhgrdM53gdLKIAMVG3AROZYDnGscYnBcSDBXVKBhsDwyXzFXjd
	poW3sXQqhtnbBd8kU4ZJXAzHMwM3cMEacP6SC14bXHJwVtxvRWNWhZdlyahDJPUkBfAJVxcHJ8b
	UyQ==
X-Google-Smtp-Source: AGHT+IGsyGC9C+MeujnUnW2nPba4jsQ7IgXXOkNko0b7VAiFOZ5bP8OY6ummej4/xlJQLwWUr2RcXaF45Ig=
X-Received: from pjbse14.prod.google.com ([2002:a17:90b:518e:b0:2ef:78ff:bc3b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f8d:b0:220:d81d:f521
 with SMTP id d9443c01a7336-22307e72198mr15100345ad.51.1740441350608; Mon, 24
 Feb 2025 15:55:50 -0800 (PST)
Date: Mon, 24 Feb 2025 15:55:38 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-4-seanjc@google.com>
Subject: [PATCH 3/7] KVM: Assert that a destroyed/freed vCPU is no longer visible
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_155552_035899_21BA9E59 
X-CRM114-Status: GOOD (  10.37  )
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

After freeing a vCPU, assert that it is no longer reachable, and that
kvm_get_vcpu() doesn't return garbage or a pointer to some other vCPU.
While KVM obviously shouldn't be attempting to access a freed vCPU, it's
all too easy for KVM to make a VM-wide request, e.g. via KVM_BUG_ON() or
kvm_flush_remote_tlbs().

Alternatively, KVM could short-circuit problematic paths if the VM's
refcount has gone to zero, e.g. in kvm_make_all_cpus_request(), or KVM
could try disallow making global requests during teardown.  But given that
deleting the vCPU from the array Just Works, adding logic to the requests
path is unnecessary, and trying to make requests illegal during teardown
would be a fool's errand.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 201c14ff476f..991e8111e88b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -489,6 +489,14 @@ void kvm_destroy_vcpus(struct kvm *kvm)
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		kvm_vcpu_destroy(vcpu);
 		xa_erase(&kvm->vcpu_array, i);
+
+		/*
+		 * Assert that the vCPU isn't visible in any way, to ensure KVM
+		 * doesn't trigger a use-after-free if destroying vCPUs results
+		 * in VM-wide request, e.g. to flush remote TLBs when tearing
+		 * down MMUs, or to mark the VM dead if a KVM_BUG_ON() fires.
+		 */
+		WARN_ON_ONCE(xa_load(&kvm->vcpu_array, i) || kvm_get_vcpu(kvm, i));
 	}
 
 	atomic_set(&kvm->online_vcpus, 0);
-- 
2.48.1.658.g4767266eb4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
