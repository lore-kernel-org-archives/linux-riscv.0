Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA4DCFC5F8
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbrL0P7R5W29256kjSMKEuzaBOVSGtkLbr06InJRoMU=; b=C0qfOsGO4WP/Mn
	JYyEE2YyuEpys1fgYazLcOENUlftEyUPEi7F+vAJyn2tjMnmnYK/K58uvvwVhbo/hIZypaQmUTYt4
	9fRNpLKNhjPhKJ2bAek+sexjcdFdQXjyFigKsbbMQMJHR8TKSWhNODFMA9/slXSJJNY/UbzfeDUwe
	+C8ThSQvcnkVG9bsSVfpoP/l82fy4us3HDlW6yZ8fsExkXb4ShKW8DuUdy12MAcB4N6Vuzeg6eNuN
	MAHTmSUATkPkZzzrMRDzunXWHuz1dzMymh0B5P0oMSOk7YeKUJQ3UsNPMjD1BSFOKX1eX2hLawUWF
	CXOy/OkkWSf6El0thSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyWm-0000000E386-1eJF;
	Thu, 10 Oct 2024 19:08:48 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrU-0000000DqaP-1STM
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:09 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71df07ac9faso1221367b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584767; x=1729189567; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=n3l8C52m2RjpLTXcY6dq+UIBo01A1fTC4GBMzDz1kHI=;
        b=hbUUm6huEsIpvBlGvvHRI3wy9VneLaobE+5HtYZY5ER96gyN7mdBt227GEUK5zzVMn
         76vbGKJ41cFK+Ysmvcp7yzuv7ili+YPUjYOxE/ctNAbuu4Nnb7yjxtQS1drQiUhAjqUc
         Ip97sqxSr37TeirbDgYFFRiSaHoci9HOuvGFeZA6n046j+szLpL2tKQh7Ei2hE6WbqkS
         ntJU0pnF07qDfzHcM1/OBCL3m4W69iEVbt8ImxGUxYS+T3YNq0sWzfDSXc6BIWrgACxA
         cLY+/1MsX2oQAbg3Kc7OdW631minPkxe5BLmqpeshd1NcocBBwJNRd9/VTPro4cW+odU
         d97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584767; x=1729189567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3l8C52m2RjpLTXcY6dq+UIBo01A1fTC4GBMzDz1kHI=;
        b=A7aXeTj5qKQxg03pVoLa7mzeynB6lyI/YMkXeA7le2Jg3cMO5E88hvrGDjqMlTpdp5
         L5ROJtX/sz2mraR2urrKLET0ybTuC2zj/B5ygbxEW4JZ+XoxgrOpTP0bIViyA7Tc33ZC
         y88hbOercD8wcBWXyczivQu+G6ALYB1DIbhTSjtlSmr6PuLpLVnLrwE+wJhiVJU+kBCS
         dVfDwO2wJ+9RaJnEkl+FRAu2Bzd6miXcTUyYJ+MYaUSoNPau5hs/U4FB1yGn4OwQeCZV
         +Yl+HUXz1pbNlf9X4id8eTZfI5y/oj7zbbeczMBoG87T0jJgcaWs8pP7LYMR51NTwrYM
         dRbw==
X-Forwarded-Encrypted: i=1; AJvYcCWe/2IFSQLzrVKjECHWXI9/Pl/A7O886hM70f/zERe8Da+8wXSuY4YKCg7OqH75J/bT+fgOHvyy270dFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy77ehOyWnGKQ3GlOHkNYWCQJRzDI9u+YFoCP05LpOP6jxRhB5g
	fJ3Lx+eI3kRNJNRMGZVowcvH6dkIECGGw6Hn3Yi5BXRQ9M8W7lWfDE1l5nrHcwQP6e4PCIO2P4m
	WRg==
X-Google-Smtp-Source: AGHT+IH5y4h19aQ8D3UFZNHEjFs0l+IkJ/F+GwDOdY5CLNZ6WKY+eP+zfpO4DiXt2PfVXCIgSRJOtCb+AeE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f44:b0:71e:268b:845e with SMTP id
 d2e1a72fcca58-71e26e53c16mr11733b3a.1.1728584766802; Thu, 10 Oct 2024
 11:26:06 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:38 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-37-seanjc@google.com>
Subject: [PATCH v13 36/85] KVM: x86: Don't fault-in APIC access page during
 initial allocation
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112608_471574_7335FB84 
X-CRM114-Status: GOOD (  10.14  )
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

Drop the gfn_to_page() lookup when installing KVM's internal memslot for
the APIC access page, as KVM doesn't need to immediately fault-in the page
now that the page isn't pinned.  In the extremely unlikely event the
kernel can't allocate a 4KiB page, KVM can just as easily return -EFAULT
on the future page fault.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 20526e4d6c62..65412640cfc7 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2647,7 +2647,6 @@ void kvm_apic_update_apicv(struct kvm_vcpu *vcpu)
 
 int kvm_alloc_apic_access_page(struct kvm *kvm)
 {
-	struct page *page;
 	void __user *hva;
 	int ret = 0;
 
@@ -2663,17 +2662,6 @@ int kvm_alloc_apic_access_page(struct kvm *kvm)
 		goto out;
 	}
 
-	page = gfn_to_page(kvm, APIC_DEFAULT_PHYS_BASE >> PAGE_SHIFT);
-	if (!page) {
-		ret = -EFAULT;
-		goto out;
-	}
-
-	/*
-	 * Do not pin the page in memory, so that memory hot-unplug
-	 * is able to migrate it.
-	 */
-	put_page(page);
 	kvm->arch.apic_access_memslot_enabled = true;
 out:
 	mutex_unlock(&kvm->slots_lock);
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
