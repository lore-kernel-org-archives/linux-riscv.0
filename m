Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336ECCCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ksh/e+FmT9TumHQ/90wYF/W75sjLFAZS4jGIU0e08JQ=; b=RXu42mOQSp+BKS
	RB2hG5uV7lnFntQpKAwTa4vx6FV4vZmR62IgPoAzH8xqEqR3AH7o6EKoIOAxQsDJqdq7zF8DFAmTa
	LQfuodQv/0TVzjeyzRWQFbRYrE0fhWpFR38881OIBaDIRycP5OZGqLQYZictllWz29vJ0RcL/dl/6
	sPQ+RZ0t+Fs3wwk+hrgqqmK5HdHfCZYnwopbsSBlcLDowRls8eEmet2+lNOHT4u0uoOhe7rG9qeDk
	xedGkTER9BiBBqsnZFeE8dZSYl2TmNFEFHUXAs5PDeLjHANs+6WEodKSDYVULbAYtQtywqs+bSRGw
	526Suv6mIHqaHd9abzxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YQl-00000006FWv-1aQb;
	Fri, 17 Oct 2025 00:34:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPd-00000006Dfb-0QLh
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=; b=p170XZb/iQqdOPAN6FkUgzSNzR
	in4mDXXcNp5VLJ5JtQEgcO3j6HyxoPS2nLUUCIFignuzmrtjLv00XWUtGDjyff+utETr6LmepjG4Z
	5FNw1Hio6OOZyjd/3MTVNkc6UyYaxjoMlESHyRA23rfEZDeRTYudjNG4zVUGkqI0xrtC/FhC7Ru2j
	IVwKEiEEnS7dlsmbJSgwcJFPyl9ZfG208tIEGdq7ohR31uiro7mBsvkfteIuRTZ78PS8gkkqCVxNt
	ubVJK7pxjevo4fD0YUqzBGTf5TaFfGcHREvhnvWOFnZQ1NkY6TRlMgrHJc7mJn3HP7R9/Um8NLGNF
	+Pssaexw==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPV-0000000FiEV-3Bbj
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:39 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-269af520712so16811875ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661200; x=1761266000; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=;
        b=fUJFc5bpnCdtlajkTQ0KZuoPblW0WCMOtAZ/uPO0ylsHwIrNvNsFyNi3b9lgpDbcjS
         qyjPYVoziINKi3uiXEOH0NnLDd3j5aRQJdzcQGeGKiJnNA9CuRv93nJjIjoDPN7G3SW2
         X9VznNv69WyswQMVmD1Unj3/j7DwKQ90HUgpf8dWTrbi3DUbvGbZRd6s/p6InoeJZ/I5
         Rld7Nl/gE1IX/fJvnmTB4bb0LqHnxnuLhZ63xtFxh2SBWIAxY8njZgXSo0MenQS2KoWV
         dJ6ESazN4tmV0c5DUlx78Kc3/AwrqMOakcmSJdwcG4QYNRj98ISfAYCz93104z/6Q6mQ
         xMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661200; x=1761266000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=;
        b=f6WNZj4S8GJiPRNsnDlHAE7Lgc19EiKZRyxog4RGt5AiDaxDFVXpQjVeJ/Y0J57TDl
         3CvxIC3i8chpO3v/EWDNoCoAR0ipvphD8E0JyMJQycde2oJaFlj+2MCj3aiXclz7D0CL
         OiLq56DzAndzLSCeWeAcDvDkRHWvJFy1SBCIUCP7MxR/oWJp+nzQeTEerzS7oh+1jbZn
         gKClK7qwswpG6qX6tDQ7JnZldlu0tERpEoM9ltM6NppzHCd+uIJtMiljuRIb3wWq1Tol
         7gPw4eRrxArlZ359uDfMfQGlwJSWwJpw9C4ItTT8BhCtZCLohaaevsHkqMkzu+tGRvYu
         xPOw==
X-Forwarded-Encrypted: i=1; AJvYcCXs5HJELV5zHqOPWFhCCgsOgVr7/r108kMUi8KQQRC/6o+K0EbvmBFeBnXqIedAQapNEvO3Ifs49mfxcw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+bvYfjLDFZqwxeP/ZGOq6sux1GdnARNjx40unaB6DvsK0w7vn
	ZZKIP4aL4k5T4UcTxGQpiK1FqNEoaxuLcP/xvuHYchD4BXH07KZ4ZwKc0xueC1paYl5qI5x10kf
	OUsBovQ==
X-Google-Smtp-Source: AGHT+IF8DlOutKWl0i8m+B1TfQqXPthFr1585kr7hlu5o2md7/0QzZzZHhKvSNGyUqeTAbPYZaEbqdnIEp8=
X-Received: from pjbmr8.prod.google.com ([2002:a17:90b:2388:b0:330:49f5:c0a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e544:b0:26b:5346:5857
 with SMTP id d9443c01a7336-290c9cd4b82mr18056465ad.24.1760661200311; Thu, 16
 Oct 2025 17:33:20 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:36 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-19-seanjc@google.com>
Subject: [PATCH v3 18/25] KVM: TDX: Derive error argument names from the local
 variable names
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
X-CRM114-CacheID: sfid-20251017_013335_039076_32AA91CA 
X-CRM114-Status: UNSURE (   7.04  )
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

When printing SEAMCALL errors, use the name of the variable holding an
error parameter instead of the register from whence it came, so that flows
which use descriptive variable names will similarly print descriptive
error messages.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2d587a38581e..e517ad3d5f4f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -41,14 +41,15 @@
 #define TDX_BUG_ON(__err, __fn, __kvm)				\
 	__TDX_BUG_ON(__err, #__fn, __kvm, "%s", "")
 
-#define TDX_BUG_ON_1(__err, __fn, __rcx, __kvm)			\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx", __rcx)
+#define TDX_BUG_ON_1(__err, __fn, a1, __kvm)			\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx", a1)
 
-#define TDX_BUG_ON_2(__err, __fn, __rcx, __rdx, __kvm)		\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx", __rcx, __rdx)
+#define TDX_BUG_ON_2(__err, __fn, a1, a2, __kvm)	\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 " 0x%llx", a1, a2)
 
-#define TDX_BUG_ON_3(__err, __fn, __rcx, __rdx, __r8, __kvm)	\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx, r8 0x%llx", __rcx, __rdx, __r8)
+#define TDX_BUG_ON_3(__err, __fn, a1, a2, a3, __kvm)	\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 ", 0x%llx, " #a3 " 0x%llx", \
+		     a1, a2, a3)
 
 
 bool enable_tdx __ro_after_init;
-- 
2.51.0.858.gf9c4a03a3a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
