Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5EDCCD183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7pcyEBvw4HIKr8bvG1gJO/lU2fo6/48RRPtx24agkA=; b=ljgNcPow9tRZAU
	9I0cVGGEd8T/mtkSL/O/eNK8RD30nHkFhNABAYzEgWfiwqnKBPpLiSF2xPfl5UHmAF0el8YzHQDRv
	QvrSXUH9RIHLGi8XjHcu1aolDRGU0CLl/rACrozb2Z/8cpU6sBWqJyxhdzhedo3JGUHMdu+kPH3II
	W9/hRFYRKe8bi9Z3MLQko5cm/000v/pX/7hu3GLekCA9AI5QJb4lkUuepJTix29SxpGq3588B/RkL
	Sy5VbMfA1/cd+3Y+NlpFMs0Kfvl44jzec1PBMzQ3Y2k6qjQkFCoMiSV2uXTsRBrtQYqB1xVK2DCIZ
	/E72pnCAH7Go2EAMMQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YR4-00000006G89-070R;
	Fri, 17 Oct 2025 00:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPy-00000006E5D-351I
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=; b=QnZPlcSg8ZsUpKhtLLmaJ2yze+
	xN23u9Bzopzq1HqqH0UX9VwWCUhYWUGPDUjQ1/5v0Z0nZBzGUg/WaREvaNRc2OkFHcuFu32Ou0fka
	X+8K7ZRQPDyzDL4tMBCUYGjeLRjwOXPxuQOh8bV3dspACLq0Fuwiu4otdHtquMSpK3i7LFchPuiHq
	gJ550gpxaOWUhcJgPTOZ8O3dutf5dvvqI6OLJ/v8Q9kC/4pwppTbNKRdQohWuC9bMSS6237+bPSKj
	PWGID0a/Vrkv52hR1h3b2aZu3IArdDyd5wVf2YIXWYu/2AB/PYI9/02G5MZIKQbrKznKLZdeirGBo
	9ETjvLTA==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPA-000000078HZ-2rR5
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:49 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-28a5b8b12bbso28797185ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661189; x=1761265989; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=;
        b=HttfWQmFgE9GuQnXOq3SdSpoyNL6bG83qZvQZmrwjjE9yOF8l5YiGpFIxR/KDgbBp6
         HPuTHb5K3PWax0Thxq42unCBEoGx6+01FgV+6dImjdxJpZrtBl5Uf3L9mWx2ee1QSxTP
         yppR0X2wqRK1Kx5bnjFaL16ejHt+JBQQdWrwMuJISoafJPaDdlOlnx5Y5srsOv6Ms8Me
         +mGtgtaI9U3VtRWzWQoCv0HiNY/l/m43S3kv0EPaaiYImSltrh5wxRduSj5K20yoaNaO
         7kv3G8prTHAaDvGF7DQ8Wtwua59lnrcjRPkW9mH8Eo6D6maTo3eU9eaDA7SnNgEoO4sO
         mM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661189; x=1761265989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=;
        b=elbySAUvxLbE/PNJw4zw2U0MX20+oPPHNpggAG+YTBeyNdXuhPpFYmJR0bS0wL9/ix
         2QUNrcXmJAuBSM5mqRltqeqUMWjZ1TOdNqTTmF7zoeo6lUHyqQmHjT+FlJsQeFiZThbz
         SJ4v5jvbDjQa5oWaCSqpzXb1j5eycvgAQxy0844QXF/Zdj1F8J758lL0UUoRrVib8Bxr
         ofVu1SCbFuEnLdW6dRP9r+78NdYv1IeIeoyFomlMFQPJ6yWdfw1l+O6io87DVTVGpab9
         Pdi4By73KqfEgCPFwCyP0fJ/oeAVSWFof3dFFglG10tlMoPoNKHKpathPlHi0F6Y2Iyx
         6FMg==
X-Forwarded-Encrypted: i=1; AJvYcCUtMxzPxOvuByBREJmmcgDCtpn8CR90yuJJIboaG7iUxiX83dA4Z8EgQjNA7Drupp3kkTRUWOgHIR4Cnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrP5x8jW0aLltvlwMeRat4chHC+FY0PfEtDcUgJJ3qyDvF/jah
	5RgvlwUlPp6lX3r67TmZvx/orZuSrzNtOv5cOCmLbSS7SqCOdxeaoKyrexAKEMbKGqGnaYMgMHy
	0jlEqsg==
X-Google-Smtp-Source: AGHT+IFzwgrTUpyTLmlR4n7vLZlT3Ntvx3uZ2AlOGbeNdkR1Pz/L5L7m7JolYZt52l8hjag9eabuD/ERTOw=
X-Received: from pjbpf6.prod.google.com ([2002:a17:90b:1d86:b0:33b:5907:81cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19f0:b0:286:d3c5:4d15
 with SMTP id d9443c01a7336-290cb947798mr22501395ad.36.1760661189400; Thu, 16
 Oct 2025 17:33:09 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:30 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-13-seanjc@google.com>
Subject: [PATCH v3 12/25] KVM: TDX: Use atomic64_dec_return() instead of a
 poor equivalent
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013326_022588_5A8C6565 
X-CRM114-Status: GOOD (  12.12  )
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

Use atomic64_dec_return() when decrementing the number of "pre-mapped"
S-EPT pages to ensure that the count can't go negative without KVM
noticing.  In theory, checking for '0' and then decrementing in a separate
operation could miss a 0=>-1 transition.  In practice, such a condition is
impossible because nr_premapped is protected by slots_lock, i.e. doesn't
actually need to be an atomic (that wart will be addressed shortly).

Don't bother trying to keep the count non-negative, as the KVM_BUG_ON()
ensures the VM is dead, i.e. there's no point in trying to limp along.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 220989a1e085..6c0adc1b3bd5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1722,10 +1722,9 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		tdx_no_vcpus_enter_stop(kvm);
 	}
 	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
-		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+		if (KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm))
 			return -EIO;
 
-		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
 
@@ -3157,8 +3156,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 		goto out;
 	}
 
-	if (!KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
-		atomic64_dec(&kvm_tdx->nr_premapped);
+	KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm);
 
 	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
 		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-- 
2.51.0.858.gf9c4a03a3a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
