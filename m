Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD265C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ssFCcOzQYME1Cgr6UYY2s7zG1rHVx1Q3ED5puV4p00=; b=RbKWaRPjKUIONw
	W57wuYOa6pF92yu11LnBf7d2kkGaWoKHnKQAbikiRSwjdjANeMVGBThzScytl6sobLfe7/Qq/KkoU
	J1m6MzFgc89ertLRTOkhkEWRF5z+VlIk4VlSBKfJ+be3iYMDmaTRSfo859Rw4INIFPOkDV8ExpoFj
	OpWJVb1i+aGZLQIQPqqD+MkA0OEk5/DeJ8knZi28Khy4X98MJYuEAl+3S2ianvu4Njb8zDhnbOnAS
	qt7yQYqASTEVwRXbd2zRgLSU7wUIpkrdhVNOijB8441FTC6BBfV+RjJTcoQifn9eoeUEFyFA7x5kw
	n566rW4C8zDd1FWR47tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVL3-00000005jE5-0QoU;
	Sat, 27 Jul 2024 00:31:09 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmF-00000005RES-2M6L
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:16 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-665a6dd38c8so7231767b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038110; x=1722642910; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FGNMZjC6zrq4QPk0aaY9W+lI1TKYWYG7APrsjifVvZM=;
        b=ZLp5txfxYH6q2vmavmG997qwjBolQPC+YcsmUXhWlVmZ9Qtc9WeyBrgRwFoGpBRUqN
         A51TRObFHCPZux/6+OeZWCDVR74M2+zX97YgUSY5HkSdJN2KuSCALfx/8uhLtIx/PNm9
         04wdf3t/H+Py3bLaECsLQikDqOzFiE1n5NBElBNvSpgTHhmB5PLV2YB90pbSiLuRV0Db
         Zi3NbkAr6GfD7asOEJBKfvQSCSYtpPypzvvq9sA0c/28R1q8DMrDhOBZjeFN3Fo8d9X+
         wyKHVY785vOeY63wLXv+8EqRnORHy7maTE2XpetWWUFEi9IR5qooRG5IDZEIhugWtDQA
         /Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038110; x=1722642910;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGNMZjC6zrq4QPk0aaY9W+lI1TKYWYG7APrsjifVvZM=;
        b=HyZ6rdwumb/WfIVAg+OkWpnb8VOqNVrg3IrTeX3CcrtplWx4QIwsqrl9DvRrM+HfNN
         t5dM1R+CafeFXBB9//qmmnUQsn85Xw0+3S5swwSn2Dnpy5JkMRuSR/ZiZfwY2JX5O0MZ
         hJbXAwvvppP/F/CRJKQlUVfUgP2MFdxgHalLhfkxBrvKsIp3GBbctvMpsI1TMFxqxwXN
         SA/+rqU6bxxIFkM+BQ0rKhfxvw1g9jQ+G6eQyUAMBh/0ddq8+//c3elwvb89Lo5fKjde
         uViKDz0qPqhDaylwc0ZyR/Q4RcPIct57plYjZw6dapC2dCAx5qVTNkzVU5sLxCYu5S7f
         SkKA==
X-Forwarded-Encrypted: i=1; AJvYcCVeiOT+Iuoxa06hJPB0hrDQsfVGN38SIg4JPRcqeQAJ1IKxPyQtPGU6Ug6JncUPZxd5u/PT2KRDj/I+7B3BARD71sRysJAlqoXK2EEhUzs6
X-Gm-Message-State: AOJu0Ywjg0PWBLeSV+hbEiPV/AGIYqhyC1h0yiecLCDYGuCSlMgqmUR7
	ItF0bpeubD13aNO1mkCivviFb4sx7kPwCEICn6auzWwTfKpdaKvlPyMp8mtP6aOBM4y0FcoZPuA
	nEg==
X-Google-Smtp-Source: AGHT+IFLZWO6XOpdLpjl0c1N0cYikN5d5kXLguU/WRS6HZfMhk4D9x8u+2tsxxP6CN0/8qHX8YjuuRQeC7A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:830:b0:61b:e103:804d with SMTP id
 00721157ae682-67a004a2a4amr37877b3.0.1722038109325; Fri, 26 Jul 2024 16:55:09
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:22 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-74-seanjc@google.com>
Subject: [PATCH v12 73/84] KVM: PPC: Use kvm_vcpu_map() to map guest memory to
 patch dcbz instructions
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
X-CRM114-CacheID: sfid-20240726_165511_765572_AD293A4B 
X-CRM114-Status: GOOD (  11.78  )
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

Use kvm_vcpu_map() when patching dcbz in guest memory, as a regular GUP
isn't technically sufficient when writing to data in the target pages.
As per Documentation/core-api/pin_user_pages.rst:

      Correct (uses FOLL_PIN calls):
          pin_user_pages()
          write to the data within the pages
          unpin_user_pages()

      INCORRECT (uses FOLL_GET calls):
          get_user_pages()
          write to the data within the pages
          put_page()

As a happy bonus, using kvm_vcpu_{,un}map() takes care of creating a
mapping and marking the page dirty.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_pr.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index ae4757ac0848..393c18958a5b 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -639,28 +639,27 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
  */
 static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 {
-	struct page *hpage;
+	struct kvm_host_map map;
 	u64 hpage_offset;
 	u32 *page;
-	int i;
+	int i, r;
 
-	hpage = gfn_to_page(vcpu->kvm, pte->raddr >> PAGE_SHIFT);
-	if (!hpage)
+	r = kvm_vcpu_map(vcpu, pte->raddr >> PAGE_SHIFT, &map);
+	if (r)
 		return;
 
 	hpage_offset = pte->raddr & ~PAGE_MASK;
 	hpage_offset &= ~0xFFFULL;
 	hpage_offset /= 4;
 
-	page = kmap_atomic(hpage);
+	page = map.hva;
 
 	/* patch dcbz into reserved instruction, so we trap */
 	for (i=hpage_offset; i < hpage_offset + (HW_PAGE_SIZE / 4); i++)
 		if ((be32_to_cpu(page[i]) & 0xff0007ff) == INS_DCBZ)
 			page[i] &= cpu_to_be32(0xfffffff7);
 
-	kunmap_atomic(page);
-	put_page(hpage);
+	kvm_vcpu_unmap(vcpu, &map);
 }
 
 static bool kvmppc_visible_gpa(struct kvm_vcpu *vcpu, gpa_t gpa)
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
