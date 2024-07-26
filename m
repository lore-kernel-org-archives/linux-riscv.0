Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECADC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Roa56V5+pAkRhMBwS1jy8DZwIcZtbD/yPd0or9BlBXo=; b=s79111rX4lf7Ie
	KqefEuPlJag/1rYTxg3jD9GSKWIGxfLDKGLD1ikh0PRf1RyhtRNLp/a3HF/5hCteadIQYBUEy/G1I
	QfItCl1DDapCi1GVxRwK11ftkL52b0xM4KvZNktF51GGKFFO8siJ6nkV96zy6zzqWc//yrtNML7fy
	sZX6FFdK8pcuFmIp73/HTwHtH5OaFCvbb5f/wQScxBULZLuqLrQrbkTp9Ugla31WrZQVnM+RxnCTn
	FKf1JPfeogo3aAFOM7unHLcZ63sSRs0YdS9HHVYwBddpn9hgR7nFrzPsHFpZEvf6Bmxnz9eEi6DTJ
	CLBBmS1UrOkQ+PWxpiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVCU-00000005f3R-32jH;
	Sat, 27 Jul 2024 00:22:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUle-00000005QiJ-1FiJ
	for linux-riscv@bombadil.infradead.org;
	Fri, 26 Jul 2024 23:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tp8vWxWuEfoTun4nd23rTIy8nVqGGlQS/g8lo8vNdQg=; b=bVcp5E7jSkWpvM9hcOIje5PGcn
	xY+Cj3FPhxKnSkmpjJoqfPeCFMGqFuFEspu0YhEQqoeD8mCYrB6gxCV5colaXGwILzJCkpNggoZqt
	SX2erYTFyg1TX3bY/FW6oM2Xi9zDj0tsYFzaCJHvMdFzmlmGMD4gItnZWqmFoCmkynuxPlLiqyihe
	n0zzF1R4fCt7LWlT1etSReuDCwNqfBx+7rbKtpiw/7rwNHrhjeFm8etJpfI9H7AIft5EFkaNhQxhE
	x30I52zb5mhrMonjDrDR69LgvsJmB2mDFwJ7qM/Yv1xIOJXbXqwVudZI2PTFS6G37ru+beIj2wWvz
	RPctzcEA==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlb-00000004K2w-04PK
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:33 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70d14d11f42so1334294b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038069; x=1722642869; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Tp8vWxWuEfoTun4nd23rTIy8nVqGGlQS/g8lo8vNdQg=;
        b=a1Lhshv8scCGz4BW/AhCsEkLRsaRE03TXxu79ACYfTgekGUogBCvMSdGmgyhHZOtFV
         M5/Y3F0oraYdEq2hipg7fJb6pX222KltgONMQcluQxaskkHxMb+TwImU+Z6cgCzipXUS
         97v+5JEJlIEUh9/pPVsIw3GeKmbtcPutToCS4lgJVAzaPwm3JEArcedc4zy9dP7h1bDH
         /hky0GMwSrc5viTH5liLZAWG7T+SY3RdN2B9mjqtDfIIrESwzQws6ZGsekrs2pT4cFmn
         n2uZXIGgMJ2lcjAEfipWXqTDWdkYlaA+3KveekqQb7ZRlc+/knjrPxRFLKThdYPKjxny
         wi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038069; x=1722642869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tp8vWxWuEfoTun4nd23rTIy8nVqGGlQS/g8lo8vNdQg=;
        b=Uhi+uehV225s1Pe5FSoHIYahkFPjLtWdYq8rbYaXBgp8tCFw1tys2Anv7PnoIQaddO
         c6s/BJcHnCqINVgPPL12nS+igxH/KaootwIb3j7aPgzo5FbYBSiTcO9SB63jGdo1i2PB
         f8BMNzpH1eJSCZaPCIRAga2iLPnMTNjXeFNW2BMlYwJByUBgfS4r/5Olmdi6UtxjIycS
         x73l/PoIe0dLK7035dURJzPu9uXV/FM4KmM+HUCuPDBnUuOc9Q9Yn6bJ3UsHWMmMn3E2
         rOJhP1+7MoRH30PGODdbjlmPAPsvB97nlmrUxymXCQJQ4joswTdASvmguq3ZuH8jV6ob
         AZYg==
X-Forwarded-Encrypted: i=1; AJvYcCXB8NixXBDD60Shi1mjSetzByN1cbnUoAYp4w6iJWSgYbru4qfi0v6/YhnxMRvK60b3cAdgpgpUdRRHubErezEeL5t0VGsS4nVDonPz0kKh
X-Gm-Message-State: AOJu0Yzt+X1TanJ7/nmEVfZg9Qb0MzatRf5TPn+roR3v4ZAqxGgCufA8
	uvH8ajTmPJrNUFeM9d53NmgGDnebenBbo7+8wPPzzPcCT7OSSLQLYv2ZI1TfPFrnlupzoMCjrBd
	kvQ==
X-Google-Smtp-Source: AGHT+IGdEcu09Hin88e0jkC1IJzP1gp2m8bzTdpaUdhQIiML2lxsNf415Y84GaeMaBcBrlwhHWl3MjBIRUQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f1c:b0:706:71b3:d7cf with SMTP id
 d2e1a72fcca58-70ece926b55mr9310b3a.0.1722038068878; Fri, 26 Jul 2024 16:54:28
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:03 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-55-seanjc@google.com>
Subject: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns accessed/dirty
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
X-CRM114-CacheID: sfid-20240727_005431_193153_0305D285 
X-CRM114-Status: GOOD (  11.04  )
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

Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).  See the link below
for details.

This will also allow converting arm64 to kvm_release_faultin_page(), which
requires that mmu_lock be held (for the aforementioned reason).

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 22ee37360c4e..ce13c3d884d5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	}
 
 out_unlock:
+	if (writable && !ret)
+		kvm_set_pfn_dirty(pfn);
+	else
+		kvm_release_pfn_clean(pfn);
+
 	read_unlock(&kvm->mmu_lock);
 
 	/* Mark the page dirty only if the fault is handled successfully */
-	if (writable && !ret) {
-		kvm_set_pfn_dirty(pfn);
+	if (writable && !ret)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
-	}
 
-	kvm_release_pfn_clean(pfn);
 	return ret != -EAGAIN ? ret : 0;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
