Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66294D24459
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 23:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8OpRdYDYNYMg+v3Q68IlYlCm51rOaXUgBZzUEytETQ=; b=eMCvMppkf4B8XT
	px36inpNzTyG/WNJ4Ob2uleYvaFrbE6ZP0VRd1/vVsbPeJyV37UMbnqQ8HaE+8YSIk+jTdPDQf9iG
	fFSsxB8I4jluMezqAmmzcN5NtMIm8Oerz4Fnyj7BTW5zE6UKnLjabpSpp6dcp5ioIJMeKZKapUkqX
	VXral9SzTN1LH3mKegekx5XhmA7LQlnaEWB/udfAymhQwHm+y4u8XTkFKpEmKAP4477Q9kSwm/eVN
	SoQYiY2WyIoAGBbujzhNdl3WHG2DALVISoORJHUCiessD1iWaPdRKIsJmu8l/N6uTur9K/mN5s58C
	sOtX2cy1DJZRdZCdjyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz29x-0000000Ec79-2AvH;
	Thu, 10 Oct 2024 23:01:29 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsp-0000000DrgR-0elV
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:32 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2d287f944so24113597b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584850; x=1729189650; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DOlbrv8SiXT4cHz79KGvl4RMUSE/a2Kzzqa4ZWuWNYk=;
        b=WG3oPKOSidsrkm4ZH+Q4EkkXjyWwVnO477YpGgUaQXbbCDGKf93WFRJzL3OwJpofqf
         p8bdC1jeQCqxkvH9UEPZCI4TUBUrl11FjPcF0Jg+56xJraONLFpIh4p8QB77QEpzyASg
         WVsvq1N9adyKBs7THN8PQgi2x2Rkj4Fo63J7UR0df8h9znJyqu5xPmc1cvtbMBbD4Xom
         up1kKmglzcsU9NWDYJmdhKbHEZKKESlhu0NvtbrxieUxie5gb9cciF1QAZfHOGbJGhuE
         kLWFwIdmEyWnDLNui2wg1ranKldu2obulk+W9zlMSWf7qQsfQ4M5Jphmr1wnhyoiFjiT
         ia4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584850; x=1729189650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOlbrv8SiXT4cHz79KGvl4RMUSE/a2Kzzqa4ZWuWNYk=;
        b=i75SNND1dAhLsiLkW3uWuls3mE9TEw38zgInBpXri+1g7mqNZlWSLlwNLQO0q6jt6H
         FxRuqVm0Va8BTRvqz/tP8S/0wcIslGPgIDLisYRbvFM0+biGayGkd7i01+yBogygIHK1
         yRloDhHtuFTsqEpVMKU0h35nIgzezMY47NNcBVly4jhLshlqavHDoaHD6hfdTzscj64g
         hIh/7ocCXRSZvu/6pSPynDtlAyPKY1aTyknYNNxUqvGbwCUeqm8p/2JX9AqrmIvbxVU9
         /9WOiekUQLNRaLXcXCN034FK+mLMunSeY3D3XdkmjaFyLGFueRntHQ2SWJiHTegP4oAh
         Ro+g==
X-Forwarded-Encrypted: i=1; AJvYcCWXtG4eHw4Mj/eLofV/lsLZ4jYNnxroObddn0Lap+6q6KakIurQ9ANKd315IIOjN+VeUFvEsHer0jy/lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxhbTInYQZYNyB3HFpr0RSSclJxkYYeRRzkcAqvrM3lYhK+IYM
	k/OlKC0+reEIAXGiWu8TFlfFVSfnsPU/v5QnpCCqQRSsEaxSkkGxbIkRcFfPy49d3gFPqlfXqyD
	OFw==
X-Google-Smtp-Source: AGHT+IFYivPtvbNeJBK5QJ/MFgPKbd4XQ4GDAEMeTnfD7MuZnOh5ZwxKPEpX2RNQ0xKTZSwXcPzTQuagswA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a0d:f043:0:b0:6db:c6eb:bae9 with SMTP id
 00721157ae682-6e3220dbc31mr798327b3.2.1728584849896; Thu, 10 Oct 2024
 11:27:29 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:16 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-75-seanjc@google.com>
Subject: [PATCH v13 74/85] KVM: PPC: Use kvm_vcpu_map() to map guest memory to
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112731_241789_5EC0106F 
X-CRM114-Status: GOOD (  11.69  )
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
index cd7ab6d85090..83bcdc80ce51 100644
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
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
