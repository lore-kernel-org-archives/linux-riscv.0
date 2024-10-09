Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E29FCEE32A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mfRfXYGkYLLeUPQ/4eYOAMSN6VPiLqhnx4F4uqVTh4=; b=aZTXW3XQXzfpEK
	A/buYFpzGzHa30snoXSEGbzbsbTWmNAnjQE2XpxURwHGX/jxG3N/NKy3/BMNcRUaJwUX+TpKtG39v
	fE8uiH4HTK59DvX+3sa8RKwK07sXuDRcVcLWtRdqh5w+gIbNlxJMYASYgT3+VP169sBcTaon77FaQ
	ZqSzYF3Piv8dQqquH8OGMJDPdkzMhiWmSbaORg+qbz37zfyAiwSOKqoTbNFxV1h3PnztuOrB9LLkg
	j243xRAdbZY2Q9XwzGq8qar3dN98rDsAvpeT2MWFg1Q+I+tTNEpMLt+hrgJuRlb9DHs8ui3qmW0EO
	3M68KzAIUgjfNOZtefJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZF3-00000009sbA-037c;
	Wed, 09 Oct 2024 16:08:49 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYxA-00000009oDJ-2g4B
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:22 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e163641feb9so1554476276.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489019; x=1729093819; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IpGlLPpdKIlhRCfJQtftwzWlWOxZ3g0ZRZhoTsEcT4I=;
        b=CcJumS7W20HiHRkWlWvivwDUuP8/dyuHCoCsrxJC+R4SWEHSHfjVKz/gQIeW2TP8GR
         5DAuNjfhNM23laQWeFswiDAuDgo8X85L+YzcB4vRU+mQzCO9uE+hGspWTZ9SOvBMeppO
         pKc+wd7Tsi14iQxKv2xsZX0tyMmPjGNOkTpuc+uLgLFK1vEzPgbX644BI2SFH6BG61q4
         6m++mGAVACMbFO1jDZWvREeaSY1blfyeZr8y0yDGlQa+uu9AOqOFyziGy+sCpOEGJ5fb
         Cb33cP+iNrHDQ1u0wIujCMU4/URQZt+lN+Y1aXMGQtvqH6LuGl5CAxgZCBBpAg7bqifY
         fopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489019; x=1729093819;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpGlLPpdKIlhRCfJQtftwzWlWOxZ3g0ZRZhoTsEcT4I=;
        b=cuTunx/NlYIQWvp08PIQXblEDltzPze2Tqe6cXoeE4nPxKpwWBuXUKGNR4gKrqfhf0
         Ye6B9kT2srI02bmL+SZXIhnIB4TnylzJuj0kr7s4RGqq0Wub58vzpzZLq6gBMo0W3bvo
         Ae87QDS2nT7Sc3wBglpKwkjV1uv3vLaJ1lqZruUBkplnLkHsAXmcmiJIgOoRXgXlEsly
         SQUvHANgYo5NVmkKoLP4toVpl4JxqHH0kqnE2kTNQRg6SYYkHTkZpBQoUB/cHka7abtD
         dWHIdIjpPJ0UwtVp5WezNIyKiqLyP9afX299x2725utzyqFuM92UCj/x7kwOi6IXdFsn
         3ahQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDCvQCAhg+T3lw52pRJII+NgLIR+vIE8cylWK4B3l1s/nGuOZNQ8i6l4togFeh0NfB9yMLIvofqy08NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJJC4sAGd0D8IMvGYU9FbJpSPeB2v5f7KMMxB9CYTFk6PHGAgT
	Oq7Hd5KJEE+byekGPfTAHzTgB9rYwR3q7SEXWwwzM3IJeOnhkzrWgGqntNqNSUyRN415WMVdPys
	2HA==
X-Google-Smtp-Source: AGHT+IHJrTSljEGX+w+vGWljsF6J67uTWXS92qMmyHsTMzVm3HG9JVjkOOVhTNIgejhJpa5nZzlmmTlBPQo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:8248:0:b0:e28:e97f:5397 with SMTP id
 3f1490d57ef6-e290b7ec5bdmr51276.3.1728489018761; Wed, 09 Oct 2024 08:50:18
 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:50 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-12-seanjc@google.com>
Subject: [PATCH v3 11/14] KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085020_691038_B5DDE041 
X-CRM114-Status: GOOD (  10.11  )
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

Use vcpu_arch_put_guest() to write memory from the guest in
mmu_stress_test as an easy way to provide a bit of extra coverage.

Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index fbb693428a82..656a837c7f49 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -23,7 +23,7 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 
 	for (;;) {
 		for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
-			*((volatile uint64_t *)gpa) = gpa;
+			vcpu_arch_put_guest(*((volatile uint64_t *)gpa), gpa);
 		GUEST_SYNC(0);
 	}
 }
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
