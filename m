Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749B1C3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9D/XWQcFdJg77GWxseGfOQavVGVQ4X0hLYd2UUg6Gus=; b=yATG+5lAw3USHv
	vG2nWteLg/eZoZUn2M9jNRl39Z9Ra9XDxYrKqOYuCq9xme/0ewkGhpjc818WaAxWwxA7O5+Lks3Kf
	NPyvx7FVnfJYaiYTa55l8UkBCoQ/+xKK0Bpt7nCx6leiLaPQKVrbiSVqCeWTMRML+5XC09MSUgnxt
	fpqsB/SGKdCZ9cEzVS8PI5KYLS9BTMT97iWb/cOkivNtQ1ikJrlgdzJfDQzzKQBTLWWtjUJb5/hOb
	zp31+uGiGY7m/NxRn0dQPf+CIByM1001prlK19hOJcwkFqflBM9sLbnRGPt79nC52OTG7WmRR1r5k
	aNTo48DMqHoYgySTw4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVJa-00000005iTN-3PcY;
	Sat, 27 Jul 2024 00:29:38 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUm9-00000005R8L-06GL
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:09 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-778702b9f8fso980510a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038104; x=1722642904; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=y+Ar7T6On16alzy9M8c5sPTmukkBuZuZUdMs6MViY54=;
        b=Xp+oKq+tgSaakiE6sOy9CxG4QRN4uS+QNzJ7kjMpUAoSZEvNxAIqL3C7BpprX+d2uC
         RFINH9qvnLQKAqjISIMjX2bTo6sNEJvt/qbmcOaEWtUeBjgf41gNttkPymXMZfdblf3x
         1szZThDQwNIBLjqYRRKu7mfuxeqPEwGVcVjB0W1BiwDkOXDAIMtQA+Rx59uiAR+Vvm6w
         ag5YebQynXSLGIE4LnXxB2gaIbqDPu1m4qIHGAzeYVCip9/Vx5GD/EzUg6OU0fYULCbS
         aPXaPCuGzbB7Z0rcTvCbb3cbi9pWE95kgnSf/Z73WYEv7no++f2TF3g0awk3EpAojYx1
         xj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038104; x=1722642904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+Ar7T6On16alzy9M8c5sPTmukkBuZuZUdMs6MViY54=;
        b=MFl1eF5aaLxDqWJEheIw3a413OyadbZpkvy7WST/PPBdCmA5gUlU6jHXYnMxfwuT/C
         aPKkvmLvI1AyDuQNRYtGnV0s1i3DBdusJIhjX0lsSTw28Qz0lk0GP+I9IxRZDHDr3URO
         ubqIcLCCcsr8XxUo46RA9NKIZgcXuV0BxaBWT2/oriZm+IKsJ49wn69s6HhSIep8VBuC
         DAQRaCPG6JP1SJA8ObFPHgeO3aYm6j7tirpcvJ32DJQAlxAD46paZFtOYa4SCw2wN7J7
         niF5mKSDlNThFKuw7PWHfF59+RrJOuvp/1XPDfFfnlNMk3QydMjheX9hX/pcMhUriKaN
         l/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVVwPSDiPlHaHcIeHDYpiftNMCIUa91THWJUXhJ78ICNpSxzmNm96J4uaad8V3X84JbmkA0b7wBKqcoG7ZxtxqAfifXpb3PtnQGgm1Zwcgt
X-Gm-Message-State: AOJu0YxoKe1BUtMZ+emJFDp9d+ugk2NLF1D8wPUU/Lv/sPwsF94aeEQT
	kM/vzANFoHWEQ4gL+GAE7Vys2BYyS3YPuThpWTswipUlNnRflUceUnkUh8ks6txKRG2urDHs/QF
	Tjw==
X-Google-Smtp-Source: AGHT+IFnr9ua4KoyN+kf9dgXRrvt4SVsbQldBEs2PtVQEhle6Kqivs/NJk7PeSFySHT1lFiCWuBu3lKqAis=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:50a:b0:740:2b12:8780 with SMTP id
 41be03b00d2f7-7ac8fd30684mr3158a12.5.1722038103410; Fri, 26 Jul 2024 16:55:03
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:19 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-71-seanjc@google.com>
Subject: [PATCH v12 70/84] KVM: MIPS: Mark "struct page" pfns accessed prior
 to dropping mmu_lock
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
X-CRM114-CacheID: sfid-20240726_165505_358405_B7A1C438 
X-CRM114-Status: UNSURE (   8.89  )
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
so that MIPS can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index f1e4b618ec6d..69463ab24d97 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -634,10 +634,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
-
-	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
-	kvm_set_pfn_accessed(pfn);
+
+	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
