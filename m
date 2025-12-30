Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2B7EE57C2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9Ey9tEaTubtX2SWROOcz5NlXbRPC2Eann3VkaYUWqc=; b=i4nwSKvwj7Tjnb
	s0SqjH9KHirvm13lIZ+GoJfd6VL515h4UbWdhhkyF4NNqxVZ17bzzrwMWpRcu/JSvIaoW2QqdtIYi
	vFWO/L4Ojl+N996g8bIaOmYqqMXARiMNrceIyxmcKbBBgJXEAQZykAhMd4q9Z42pIk6+Ifjr5rlZn
	McmxBNNJQSYMYMOmCzBupl2xBXVCnaW/eVdkkzpfcCkKaMUq957eKXubQerrlY1lq9Xdyx8NajHcb
	vpNETmtApE6e7LmPsHpvuFfumqjEsRJBVSw6m4xPWc5GdEj68QNEJmhUagT1QaDsQRplovMEMFxPQ
	lJaR8ySpJmODsID+QDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaikl-00000005OcE-00KG;
	Tue, 30 Dec 2025 23:03:47 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijM-00000005Mua-1mYU
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:22 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34eb6589ed2so9158123a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135739; x=1767740539; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=huRdRK/iPbU8RR9eXbhBU7huR1SivgrOj8/wOFgY0o8=;
        b=gGVvCUNDFb8clGofoeHePXYtkrs/nr2AiCRn+tr2kYdjb8kgyAOCX1MpWF9JwrpiHU
         NxF8pIUMQx/nxbmvFr0Gr4/QI69NXr9OSD885JPOhnR97fXXDWm+rUK/QaWdHDBT37WW
         j6l0u8D7TqdvoLIFMGMiyd8LAQ4QX9ChbMO5+YOspz098NR3nzBa1jmSP3tH0SS05Eov
         tETE5NigZ0DwbSQL6AxC+pmAmxVmjj9IBTp9gk8PQjO7wqTRjzeEizMjR0mmNBcZ9mN5
         byx6Rc84BjI9UKAm8KooxkXn98JbNhhkMRdE9/4AgSwQnocTAriP4JNp2grgTehO9Gob
         qvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135739; x=1767740539;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huRdRK/iPbU8RR9eXbhBU7huR1SivgrOj8/wOFgY0o8=;
        b=K9dfIFSo7MFpeaCSC7Gdqk4Wzfun72fSIGUSroqfDwkO8w8C2qOuguBzBod7Vi7E65
         eq5mst7yYt0eJnXoLEWnbXFQmM0nSSYiNsD52hzFbJYO3/3lEydqGDPIgzAtIKpv2n10
         gahZ4O/tUQL3z3+XtjF+a8eqam1cTD01bSTcXYfhWxTiQ4felz7EfDG28DqiN/MkvfST
         Ld+L4tDtpiR9udTGhezPWhAAe3sqjCXLQJhxkwvdtp8ywHuzeowlpMIany9LtUoRBaCO
         58c9Lf3ZxVQiinzF05ojY+hM/Hlc4kSui9iaevMMMPdtfqhfGQnCyh+MGyracq6G95bl
         Je7w==
X-Forwarded-Encrypted: i=1; AJvYcCVx2bqGM6RnXoT1ZYPqI5zgAOKYFFpj8zJhsqs9Y5xRM4UhBk1U0Rh7//ImoDLUEJA6BCWqqIwEBu0fuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1BTSMNSZt/U7ShZYAzVLANPAsz9c1zeZyIp7xL+ngfUdqpaib
	dt2ivwnM+G/K1vgoLdTD3S1/MiRvsl3RieINqg0IU+mFpMi5Qx3ARVa5YgiqJEPqOKt3nzqxPR0
	0SxD+ZA==
X-Google-Smtp-Source: AGHT+IGZKtBCYgVUD+NyJMek1FLHVR3iv8QadOzR34XMxVrGwi8alAagMVcgqb3s54atcYK8jGvrWX49Hsw=
X-Received: from pjwt5.prod.google.com ([2002:a17:90a:d145:b0:34c:7437:183d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:580e:b0:34e:5516:6655
 with SMTP id 98e67ed59e1d1-34e92143ca1mr27682847a91.9.1767135738632; Tue, 30
 Dec 2025 15:02:18 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:44 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-16-seanjc@google.com>
Subject: [PATCH v4 15/21] KVM: selftests: Allow kvm_cpu_has_ept() to be called
 on AMD CPUs
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150220_837611_AAD6208C 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Yosry Ahmed <yosry.ahmed@linux.dev>

In preparation for generalizing the nested dirty logging test, checking
if either EPT or NPT is enabled will be needed. To avoid needing to gate
the kvm_cpu_has_ept() call by the CPU type, make sure the function
returns false if VMX is not available instead of trying to read VMX-only
MSRs.

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86/vmx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 448a63457467..c87b340362a9 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -377,6 +377,9 @@ bool kvm_cpu_has_ept(void)
 {
 	uint64_t ctrl;
 
+	if (!kvm_cpu_has(X86_FEATURE_VMX))
+		return false;
+
 	ctrl = kvm_get_feature_msr(MSR_IA32_VMX_TRUE_PROCBASED_CTLS) >> 32;
 	if (!(ctrl & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS))
 		return false;
-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
