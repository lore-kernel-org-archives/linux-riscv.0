Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D7AC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4M3A6vV4DuWIx8TP2gWZ5aIXjBDBvE1kltmndqvZqjU=; b=oLAn4U+aom+5jj
	3NlMP0bFlv1QiUtFPGdXaK2MAfg45kgKd4uV+dmrsbzd8FLZY6WaPfNnnIHvpU7ekrTxVGy5WHUAD
	GGLMmfVeHprtkoQvQm1XQNGtSpZD8kDLvnC9FYdH7zIYi3/sUDQmyQPJ4S0YqS9hKuKDRGcbloBu3
	G1RjyXa4wCe+yvguNMSGyZDnf7niZJkYdqSdTgk3eUgGEbKSPf+HAogGQuc15CKKclksQcfQd8Z7Q
	HMn0dKFv22WVU00ZVI3P9vaq2xnfXO6+fai37UfbxdBNNlqCKxv5CFhwpuOPijSQqVKhQd0SI0V0z
	Ug881va4pNuRp5swoY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVDt-00000005fmN-20Lb;
	Sat, 27 Jul 2024 00:23:45 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlh-00000005Qko-3f03
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:40 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d23f0a3d7so1451407b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038077; x=1722642877; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8WWxSeEhwRY8Kz5lKN5dweAMeNFVe6itBQweyIKsQVg=;
        b=gUINzmv3ccwPURuliTih7NZtM154wXvsdSsrcafg+DMUmCf4ubpEHFwzZ05zre7bTh
         hrS5r72dQVe4ry6XCpkWWN2tEcgyx1OADXToRRHJUfR8qXlmq3iN31aRq+taolnPt5gW
         uL1ZlmyxVfCLD014XsrVbKzEjXs3Xjb6VKo1vV1q1fEtfLbRUdufKsHYHACmV3Ipp0kC
         UQWjJS8enQt7lX5Sh1bNa/dygf/L8ljU5U8tvLht0KfAiQoA++7cAHJfU2M7g93az7nz
         ibGjXPVRk4tFkZVXDCLsOGyJbLhlzcOhXbm0lk5GVtsUOQiWUlU9SdjcpKDY5dMTu6U6
         9e0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038077; x=1722642877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WWxSeEhwRY8Kz5lKN5dweAMeNFVe6itBQweyIKsQVg=;
        b=CDWFQI30kQYRFjSFkRAqscWiwP1DImw17KENNi3kSTFy2QqkOIHAdtGHuU1NJ/cA3Y
         +Ls2l3iu56Qv4cFVpi4kVgNLZBLWim8OATzqTvhGBTNkbu4P+OzB06CtmoCZquj/3/ZH
         Ko8TqC7oPNrL/SZvHGN7BztDy7yCuFr1WlA+G/j/V9Smko+9p+eSyKhMY1CxOXyLBVeK
         q3SwOPydSVe1eJ5Huqf8eQb+7Q0fcQQmTJ4PhVqVeyNsbls99jmWk0Sisus3/liJrLwR
         XYo+JEC26ieToTEPpRa6Nki2gLUit+XK01tR0cm22rbel2I7YLqs8GisBhs3eDtBQPcV
         Fm7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU59ZdBOxbmO6jMCKhQNVzIhEs5BX7gdBuwbHh9xDhshJ6ibNuo2iz53bB/24MDoSwaZqa2JqAKHsVpMKqfd8U6KRiZSkc9RpULXU9MF2Ff
X-Gm-Message-State: AOJu0Yyn37qLyQF1wbthTRkDCx1Rrkqx65QL1ARoVvy5qHi86sSoR7C6
	0HetxShBxiye9I/teEqcS+2TX8/rti6+4qjCuhLT3ilk7e+MymY8NIXTwJBEt3n9QqXD9AbSCG0
	gDw==
X-Google-Smtp-Source: AGHT+IFil497nfsH36PcPgD5gbB02jEmsX2CuGy2fe2s5ytKElT5nFsSQdr9eHlR2IIEavfJT4DgKyMZ3iM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:66e5:b0:70d:1e28:1c33 with SMTP id
 d2e1a72fcca58-70ece9ecd04mr10022b3a.1.1722038076443; Fri, 26 Jul 2024
 16:54:36 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:06 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-58-seanjc@google.com>
Subject: [PATCH v12 57/84] KVM: RISC-V: Mark "struct page" pfns accessed
 before dropping mmu_lock
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
X-CRM114-CacheID: sfid-20240726_165437_953460_1B5A3AF1 
X-CRM114-Status: UNSURE (   9.68  )
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that RISC-V can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.  Marking pages accessed
outside of mmu_lock is ok (not great, but safe), but marking pages _dirty_
outside of mmu_lock can make filesystems unhappy.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 06aa5a0d056d..806f68e70642 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -683,10 +683,10 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 out_unlock:
 	if ((!ret || ret == -EEXIST) && writable)
 		kvm_set_pfn_dirty(hfn);
+	else
+		kvm_release_pfn_clean(hfn);
 
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(hfn);
-	kvm_release_pfn_clean(hfn);
 	return ret;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
