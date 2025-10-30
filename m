Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45047CCFA00
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTEn0/3jZYBuo5ijixdiG/fysFyRqZIkf1xmDlqwz20=; b=iAB3Ew5vRrJiaO
	lI1DD6FP4fw8nTA2VTauw1RciBkzOoMncnGYgGFSgK2Scw+ATi4+LG+IUnBS48O2k5JzhRzcMGH7x
	zg+PiRyIKliqpXBe95tyKNpWL0P6ukh1DJCr9Ch3av7vlczi+NSJyeMbrcQYfekbRt8F+mHGem0jA
	2dAL6t+exKATZ9aMGgUC4vEuKlzb+Z+CwpvA9OGMbykQ8i9IwwlUWKA7eht3fxSdoZFpbmYxz7LfU
	EBS6SqyF5aj3ssxcqFiOdESj+8Dnpoac2lMMopAE+ysonFGj0dAMcH8ZQ7LOA3Uo3rFFHyP/1mckI
	R8abqUYVY7jtC8uqZ+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzi-00000004l7A-2RxF;
	Thu, 30 Oct 2025 20:11:38 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYye-00000004jn3-3lwF
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:36 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3405e02ff45so1132795a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855031; x=1762459831; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=meKFn4T9FN95UHKOhoydSdUPWQIDJ02hjx7Eu38ytY8=;
        b=wY7EmhP7Rp5GgfxMMTpYAzx8DR1ft9E5IUJoWbvtivU0TP+5C9BlHJePGGa8bT9vgO
         zgRDsrZ21s1CIXAmetQdKTP0YcG4Axo/BzshMz0kcjckypvhK4E8xqOpWsCCrBnpce0o
         Tagwz/EZoY579aLGn4jomkQR2La7QG9ZhYxKY+E+WN/qJaCJ+VGXK/h7bTbotKFxygEL
         +KzFgx21cXMLbG0EyYL+L6HtASC8lzJ+Gb8LAfTAgX6Kd46AxhTE91iJXZ5b0V6z+yrm
         NYohJd405dncC8SN6HRNwX68zFRsoj9PSVXO6GuBMA8aDLYFQzslXGUeLaTGgbCezMSD
         /f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855031; x=1762459831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meKFn4T9FN95UHKOhoydSdUPWQIDJ02hjx7Eu38ytY8=;
        b=EyzEBoZEUJ06eDGQj+ttTEtg+g0xbhXpASbcMNWswRvxPbWq4jpxGCpwpToEs0fwRH
         KkK1uhmw6/Y7VxPoDmpoXnV7RywdkqEj+L3WHKJ+mBYSwlHYMp+x7R527vwKcABFDUkl
         0kggGK86b/XlXsrmziYbFkIszfC6cOSAJGFOlZeCxmbWj6KdpsT4PMX4FgNaGiFnjQER
         rcoclJ2YWUQqhtQDqPHb3xuiUpuMl3Yz8xFqzzQwmWeHXRG984F6y8pCm7gis8Reoel7
         Zj6d5fZlpQVaqK0zVp09OVErQUe4kynJCa+sMD82GAgB6ilEiAeqhH+x0IAKjPPVbuwQ
         /aAw==
X-Forwarded-Encrypted: i=1; AJvYcCUaDjQh4OGF0rm7RsIg/V5wPAF+x2riSHlW1rE+1JuqP0ejEmxDF90Z0+FfLsfuZYbG/giPtL+Ifwm+og==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZzUh08kqI+pX+KZKVtSVZPzF6CIrswxYVOiQ23IvBifxpKSaH
	54ImaDTFQhRdS71qgvKTx8/WDlEHO8AAw0LubE/QG/ApgnRqe7aOezUgXabhZY5Bb2NkfCx2H0v
	9diyofA==
X-Google-Smtp-Source: AGHT+IFHot6p8Ozw6sPTCEifBtpuZu56mTW8C+szZfak/MuPqOINRZqkxHegGZo0IYVURE2JpMgMqwrtO2U=
X-Received: from pjvl22.prod.google.com ([2002:a17:90a:dd96:b0:340:6aca:917f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d92:b0:340:5c38:3a56
 with SMTP id 98e67ed59e1d1-340830a3a7cmr1392650a91.37.1761855030672; Thu, 30
 Oct 2025 13:10:30 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:36 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-14-seanjc@google.com>
Subject: [PATCH v4 13/28] KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_131033_103740_91DA0A92 
X-CRM114-Status: UNSURE (   9.97  )
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

Return -EIO immediately from tdx_sept_zap_private_spte() if the number of
to-be-added pages underflows, so that the following "KVM_BUG_ON(err, kvm)"
isn't also triggered.  Isolating the check from the "is premap error"
if-statement will also allow adding a lockdep assertion that premap errors
are encountered if and only if slots_lock is held.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 658e0407eb21..db64a9e8c6a5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1725,8 +1725,10 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
 		tdx_no_vcpus_enter_stop(kvm);
 	}
-	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level) &&
-	    !KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm)) {
+	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
+		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+			return -EIO;
+
 		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
-- 
2.51.1.930.gacf6e81ea2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
