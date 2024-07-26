Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800D6C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8k86ir02PpDKsPAKNBScGP3PMjwShNYIFb7E6uhWaUs=; b=zdGbNCN8Nz0dpp
	7HoRDz7ch0FE1/NmXzKWevr29IJdsUKdQguGs0judKzFFCZLHgsrINfWxNb0038MyXivxTE9egFtR
	qpTIXp2ThpUTD+OsnCh3LOSa1/ptfONrRdhgxX4bz5sckMcKgtH4FHr9TBUfZdBwIW2iglcTmzYk3
	Rfe84XAkxb37aUEKXwyH7PLyEzdGEaljotd1eWb1CRw4Ayb7KT0MlPIodZ3rmnnIbL7SsnELJazgL
	aIWKhawRReIKe3lx/97LY8SwxxhsYt5v+DNOIaD7PYPz6HPiRGeDPTvZWGo+pA+5nf6/h3vv3n2V6
	Egjj2l33BVlZbRSnu/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlw-00000005QwT-2tpr;
	Fri, 26 Jul 2024 23:54:52 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUjr-00000005P9T-3Tcn
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:52:45 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70ecd589debso373191b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037962; x=1722642762; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+ACqpXiHFW0htcnePdxx7jkBXYAkQBnbtzPYGP86yy4=;
        b=GUTcAD7G/IEqTQBDwkN0d+unfvHGOHtzepTk0k95GMmhpmyt55Pg0jbDr4Vxu9pMJz
         7i/T07LhY03vJfzAA+439QiKhl8X5SShXNeN868QZIhkErIsJyT+ss/dCjKaUag5OZtQ
         p9rekki1UeXULTwmdrwX//WA5aLj0VL/CMQDdyWyFwNltswQbAbH6b64kCNQueyqZvtm
         3FZ4a66QnzSO2wts4NY1YQVRF7HOACiCoXrkqxN/2B1v/TcsJOqXQfOEkmS3L1mZPmDU
         G4uuRvFHpaWCQMqoISPEklRLd3IWS9MqbUKF9qw6l9L+JOKYFkbgSD9AfnCgu81FV0wf
         kQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037962; x=1722642762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ACqpXiHFW0htcnePdxx7jkBXYAkQBnbtzPYGP86yy4=;
        b=kKVjcanAmKIFShy44BmhGCbUzZpbKkJc1H5/+lZPIraED3ubprYo4salEyDEbzXT7Y
         xIsLaGmTZANpifDY8vS+2fNicMEdFLhovNFnf00DhkHLF34vZeUWtmz01sAXsjJRMaQc
         yXPgl299MhEY6KpaKASneONi9qB6EQHhXkexMymS46iVWHCmfH9qPB+O4PsC9yr3HUPT
         GcB8TtwEDMGKC7PL0WiLLrlvCDdVNRJAsJSL/gkwew1C8oF5V6pHZIA4dWuuzmK2Ds1Q
         TK+3NQw/wANxW0pB5hyCOKlWvdr85nbxLoJwZ9j7MLN2jBc1ncwKuMAlvlvZED/HEPI+
         fABA==
X-Forwarded-Encrypted: i=1; AJvYcCVx4iQkQ7jUAxviH+mTT+wzNPRXSPQlKDBlqh3WoYefkCyE91t7Yjmdq/VEnMSvDPC6EoILBvWvjqkYvHII2QlHt0vnpAJKMJJjyZNm9Z0P
X-Gm-Message-State: AOJu0Yz6bnJ2USKNLEP2M/o1omZkhfBh7V6qID7DY8imDPnaxu4QjQ+G
	IVEm0Ct6+LTQq/ySaxkuybKBAY/wwHixKhzgEbezaKrxUg64wBMpeqUNsMIYhUN8dcWV5l/q/MB
	j8Q==
X-Google-Smtp-Source: AGHT+IGwCQGQqihWYa2umPunvMXl+38XfICaGVr07aRfeEr4UWXG0owvMV5oQenmn7mjdAWrLBWC2Kt2f3c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d5:b0:70d:1cb3:e3bb with SMTP id
 d2e1a72fcca58-70ecedee1c9mr17317b3a.5.1722037961972; Fri, 26 Jul 2024
 16:52:41 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:11 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-3-seanjc@google.com>
Subject: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest memory
 while KVM is dirty logging
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165243_882396_9B54AB18 
X-CRM114-Status: UNSURE (   9.90  )
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

Disallow copying MTE tags to guest memory while KVM is dirty logging, as
writing guest memory without marking the gfn as dirty in the memslot could
result in userspace failing to migrate the updated page.  Ideally (maybe?),
KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
and presumably the only use case for copy MTE tags _to_ the guest is when
restoring state on the target.

Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index e1f0ff08836a..962f985977c2 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 
 	mutex_lock(&kvm->slots_lock);
 
+	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
 	while (length > 0) {
 		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
 		void *maddr;
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
