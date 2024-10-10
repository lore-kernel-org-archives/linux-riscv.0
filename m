Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7B9D2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVs9qHt/eGF3EiceM99W6MXvNO9gbtKsbHgCn2n2Uk8=; b=RpvOzn63CONoEN
	ecFOSNr+4mnOT6YY9Hj637NmGA2zen6afFypFJQrRNVR8ejL/GTlGUlnEOsLXi8Me09V0l2mNb3P5
	F1eui1QtFLoo+pjkYzoJ1f7NeReJUr07t4S9YdXDsAr3cc9kJmOqvmUPiRvEOup9uFA+QGBUZXTeg
	zgdg5H0edZOQ+SqhOIbaAV/ewbgXfx0JO/gSHraf3uc0qnRQS0Z79p+xKZkzsX2LhDuIk3GIs130I
	QTJyCZYtpTWKns38MwaGm3MqF+AVpQnQfteDQixEsAhRgocILSUHZuVID8l+v0rZqLwHxdxRO6aL3
	DzBuN+KRxDMN8JeEuggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz29v-0000000Ec5r-2KvK;
	Thu, 10 Oct 2024 23:01:27 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsc-0000000DrWC-43OE
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:21 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e2906efc0eeso1521807276.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584837; x=1729189637; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Sag0fj8OwucY2qRogRu5ELvjWktNcy71jZ/+qgEdHaE=;
        b=E2zHzaRZqpx7PmmOp3LUhoHU9Dr1MkBl5G0WTprILSNA1mq0tHxEkTsU10v77+QvpN
         0zFwtgeL7W3gLusd7cDl6EFytNV+h4xDtKwQ84UL7e0cR2cdNgj3Dnms8wEJu/GQeCw2
         rt7R7dMOceITVKPIgq5JWL/qwK3SfMqFQ2pgXkciOlQiuO16Q7TJPnLvr3j8HJGzk/g/
         PNbNvTkYqJyNtEyeLClT7pwiry+CiUZP34/omc1IrYUyQZyp2bxaEbPY4j91F8t3KOyK
         XOI9XrCQ/PvTIRVwt9Rf9AqfV0T7By8bPGHJYXiy5nTIL84TTZYDMKUFvEYpQPHXGEzJ
         9snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584837; x=1729189637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sag0fj8OwucY2qRogRu5ELvjWktNcy71jZ/+qgEdHaE=;
        b=tQyVMPph9HIfDGEETOJnmPNZ+LKOHR6ChP88PMVGDK5eWOpGWf8ZOKLheFoSiW0v8X
         jawKkxzf/OrA0a6lXs0iU6D6GGMHR4QikjG58dJbnpc/+rKYUHt65Z2ProfkuTiCCHy6
         FFjjv/a6Ci/3vd4gXz9GM6sN+BrmrubbnGzX78cqjcRd7I0Y1JbafwkFcG2mGKw6pXIQ
         jJFSCplXxT4QE78w70oeK4RC6JbvJ2u52fdtdwERJo13qo3zBZ30Z4Ejlw3ZgWteMFOM
         fHx5wFAwEYdJlbnXF38O6GS49KV3EKJaK7DD3jEIa+hWx/QiXGPb6heWECwSRPHbG7UC
         DMgg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ4CdPO6/SS76F28oNQ85Kgtd/6CkAt+YZ4/ShNAI2RFDtYB/6CleAU/hhZkppS+vIjPXEh7Ps3OrwzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1GkFr0386J/f+OzP4MT/RAni2LByWZgVxw1w0azQNZNvYdiPo
	66/B7nMwjSGgUDM/lNRw5DKKyOrhYY1Omgm3bOnQux/DpsN2X2meK26oeunk+gDdQoEBYU9dTkR
	LFw==
X-Google-Smtp-Source: AGHT+IEjJriLMGICq9yty21Fx3Z3FQyTG0XCg9lS5qhc+MvTVoRASG8drmw0OxSoWZyAtrQmM3pJDo8jQYk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:a4c:0:b0:e28:f454:7de5 with SMTP id
 3f1490d57ef6-e28fe52740fmr75826276.6.1728584837458; Thu, 10 Oct 2024 11:27:17
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:11 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-70-seanjc@google.com>
Subject: [PATCH v13 69/85] KVM: MIPS: Mark "struct page" pfns dirty only in
 "slow" page fault path
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
X-CRM114-CacheID: sfid-20241010_112719_106173_80506684 
X-CRM114-Status: UNSURE (   9.57  )
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

Mark pages/folios dirty only the slow page fault path, i.e. only when
mmu_lock is held and the operation is mmu_notifier-protected, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).

See the link below for details.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index c17157e700c0..4da9ce4eb54d 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -514,7 +514,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 		set_pte(ptep, pte_mkdirty(*ptep));
 		pfn = pte_pfn(*ptep);
 		mark_page_dirty(kvm, gfn);
-		kvm_set_pfn_dirty(pfn);
 	}
 
 	if (out_entry)
@@ -628,7 +627,6 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 		if (write_fault) {
 			prot_bits |= __WRITEABLE;
 			mark_page_dirty(kvm, gfn);
-			kvm_set_pfn_dirty(pfn);
 		}
 	}
 	entry = pfn_pte(pfn, __pgprot(prot_bits));
@@ -642,6 +640,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	if (out_buddy)
 		*out_buddy = *ptep_buddy(ptep);
 
+	if (writeable)
+		kvm_set_pfn_dirty(pfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
 	kvm_set_pfn_accessed(pfn);
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
