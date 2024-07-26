Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC34C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpCi+j/t6c16itfb4nhHtF/1GXGbrpG1cHjrBvOjka4=; b=qtwnpX7isjoKL6
	2fl9M+fANNterkmzIpsA8P1GgTzg+H4QVcNXd9ACKXJzxm5uY83ZuKhZk7YB6wkYn/yjIyyVDWmpq
	axh32zYTIl0Z3tSI0uV1zi24om371dZpQYCDhCSmevkX551BMUZZ4rGikSu8gSElwfSTdQnkN3NsJ
	q44ddPjGCKrTkanKtQwusoAe4TvkDV3DcaxnnpXVR66nG9cIqyDsMxCMGtIsGMNYTVuofKbq+M836
	IuhwXitwZQ1q95VEX4odt+3+KWgCRKW3ZcHxx7NAAttyCgi25MYMBLXqJqVIg+XT3jBq11XxiF06A
	OhLA1W1kwwZ027BSgcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUzT-00000005YTm-177U;
	Sat, 27 Jul 2024 00:08:51 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUl3-00000005QC6-0jfh
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:58 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc658a161bso8412715ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038036; x=1722642836; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G6XdYYnK6SmaIVsSbjLWLiXTD6vQEkdodh0PTaLJXbU=;
        b=iBeXJb+g0qQJ2gVCuL5L2WREBrai8rYzW1tegUMgyrC7f3tNKZDnPvY/+FY8h+tu19
         FAqx7jTpFWs9HRJ6j/ID2yP2hNE8wxPrSM6dccHVoAbKu9xHto+hmRmkQeNknM8FH+93
         PjA8Vl/d+Nc8bzKM5W/YqVUX99+Pwi5i79aSjpvijZVuHl3Mdu60ojnMfanBg6mqDSbY
         nCQZkJ17kRAg3nqszLlAldZknGUqg4qtc2UArT6hE2kaYLUaBR5MfwEGyBdy3R06U5nL
         n8mqgD78SYPTCVzf12e8EfNLyVHmNxquEAdVOtZ+JJgsdG7m4RDRlWDuVZBqfCQ7CZUg
         OmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038036; x=1722642836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6XdYYnK6SmaIVsSbjLWLiXTD6vQEkdodh0PTaLJXbU=;
        b=syJ9QKsIw3afydrdYU6MP/Dd4lqQ4psWWLP72PEAHbo2eUD0oma4jiFGMZ1eqVMm+w
         JvVdZJ10RSbm0aTiV98u8PT2o1Oe7t6iXtYLnQgbw/mCL9WFwtRZxQTRVO6QG2Qrsmnz
         GyE2iIx7oNcH17yYyBz3kQYxFL7p/r3I/1gBbP7S9XpOFKQipyQHeK60O0SfGFykp8Ii
         KsJUqtDvEEfuQOGJsgxntZzCWYuBk7rHRomn79uOPu+OlxGD+kSDr47IpKHW1Lfgd8TT
         lp38rweKtWaolw7EOnCM6Zy12yMI6bxUpx/R7cDiXjjsFb9bed+MhTi/LdTOrm8QEssK
         4ZBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIow00sjEhyjWuKGIGhJ4JiR5UZXFSkWUB0zwiTJmav+4z8hcFahyO+BDM7IqQnJVFArPu1PadX5S1Ypor2T6oBu+fOPtJIsASOWDldvV7
X-Gm-Message-State: AOJu0YxSSsddgWAdiGPX+bTeA//CJLWyu5GOUieytlynGr0nTQxRT7zb
	Mmp5Vhw+qHaJf5AKVINHUMVgRfeuKY7rVFiJMb2hucOXaN8QnNWsDPTrRuGIm/F6otDF5FPwRHy
	qSQ==
X-Google-Smtp-Source: AGHT+IFqcJX/9FY6hmZYd8EnC/sSURY7mS/rFneQMUHDSr3ovaE0Tb6dbx+RwJc5DGDg7FZUxHqlUK5Q8cY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c945:b0:1fc:733d:8465 with SMTP id
 d9443c01a7336-1ff0488cadamr598725ad.8.1722038035986; Fri, 26 Jul 2024
 16:53:55 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:47 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-39-seanjc@google.com>
Subject: [PATCH v12 38/84] KVM: x86/mmu: Put direct prefetched pages via kvm_release_page_clean()
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
X-CRM114-CacheID: sfid-20240726_165357_314386_9098CA82 
X-CRM114-Status: GOOD (  11.52  )
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

Use kvm_release_page_clean() to put prefeteched pages instead of calling
put_page() directly.  This will allow de-duplicating the prefetch code
between indirect and direct MMUs.

Note, there's a small functional change as kvm_release_page_clean() marks
the page/folio as accessed.  While it's not strictly guaranteed that the
guest will access the page, KVM won't intercept guest accesses, i.e. won't
mark the page accessed if it _is_ accessed by the guest (unless A/D bits
are disabled, but running without A/D bits is effectively limited to
pre-HSW Intel CPUs).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4d30920f653d..0def1444c01c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2919,7 +2919,7 @@ static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
 	for (i = 0; i < ret; i++, gfn++, start++) {
 		mmu_set_spte(vcpu, slot, start, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
-		put_page(pages[i]);
+		kvm_release_page_clean(pages[i]);
 	}
 
 	return 0;
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
