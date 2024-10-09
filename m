Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE215CEE326
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 16:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+VCY8oCs4LjiPMKu9YCAy1RvPAs1oI7NL9QCHmna00=; b=Ya/sLGYPDa4IkD
	qzSW26ClYXM8U/O2bkIdcSrrN4evkyGErJAiJO/f2N+v7RxjezemeEji19IQ0RI+YpmYQXtcSeR31
	ahLgesCuIIjWb/wGoSy9OEOT2zGWiJn/tpY/9mY3VoHzPYTstynYhcHJD3veePOpF57120tiVnHhu
	UbdnJPRzHTF/U9WpS1Mn+//yywaUIbKnA9LoJ/KqQGFZIaE7iPrcilhgW5DNmTyDBZIiOqWF9p5o6
	T6KguHONX+8nycCFOTm7hhWrn3VsC3EpYb3xIABuS1DC5DLyZYcbEHp+D9ptyu+hNWKORP3y6sTvd
	+/0Jt7ySh3bEo+z7hGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZCQ-00000009rwW-0g1G;
	Wed, 09 Oct 2024 16:06:06 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYx5-00000009oAk-2SEo
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:17 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6dbbeee08f0so16867227b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489014; x=1729093814; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pKnU0Kp/o5z6vCl+SnuNv4XsTANtPNd0KXgSeGLrrD0=;
        b=W3FIXHHh2Xfu6JGNahSx67a/EfaNynYETS1Fr7RfjVyhIZoCqN9XWT8MvRfBBN9ONv
         sw3Gl76+rqWdVitcVOBXQS7VbG5Gw/qn1d51hNNAlQM7miqIEkWTYIZUykfZrdAfCZcI
         aJD4xrCqy4uDFY3PZK0MfgwAX+Y8T1xI3pcwZ6ly42DKopqO9qwV+a/Gs57EY2DNQnSc
         wsCKMkIhCWJ96Igjnw5JT9l0EWtKPTKbwlKJHBZqUJP5lGR6aCkmixDblubT4tAXmgaJ
         Taqxvd1jtkQkmTYrfAZdmYdZFvx5nZLrinhLnHNdhR2KaXy4uLj0FyLPhz1f4EoALIiQ
         1zXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489014; x=1729093814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKnU0Kp/o5z6vCl+SnuNv4XsTANtPNd0KXgSeGLrrD0=;
        b=Jdb+4gLkKitYNgk/0sefF6AluUSo+1pKAX98WE2agpg8Sq85LVi8urIVylkcIh2f1k
         DOikpaVQvL0PTgGWuss4fohsp8syJ7jIWByyy+HsWE4AJTpnM1O1W+4n1HHvdkx4/lrm
         w0kPuarhASAyymLO/AqwzAfaEPe45ZNvtXpeuF50bLy+y43afVoBuO28QjoHlMBIb0aj
         z7FD64YLQJU/ybOgy5agkBN+q9dvxYOFOHnuTAVtFjON5UyAJK5hhjW1QZjE2QBbuWYa
         sdqmmjk82AVL7egorokuHbjsc+9ueCH0qcDshhRBXpbtW6uFfL7bUZs9zZvs2lbOKqUu
         ak7w==
X-Forwarded-Encrypted: i=1; AJvYcCWfuWyUBeVWNcO/2OO6wNzarOaAu3ysG0zH2LW34Oztg/6+Hm/iQQTykgbdt+hdWhKJYPGtbdYJUDkVYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhQ8Ipxif3t2l28zw4bOWT7FRN3I6DAKlvh79XDBproyIXyXIH
	LcrR39EuQn+oLmutTP1u66PpKHGfwEbbZrnn6YiwjJAOsr5kyJX8iVMBr/EpDV07qdYZjM8wjoO
	vAw==
X-Google-Smtp-Source: AGHT+IFl4KKTDXOPETiRWWIkjcYQuDw12IfhMjxBQcTnANGnaD3TD9lTchjjvx4T5v8klQyshc757dwsFY8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2b86:b0:68e:8de6:617c with SMTP id
 00721157ae682-6e32f279e6fmr2237b3.5.1728489013701; Wed, 09 Oct 2024 08:50:13
 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:48 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-10-seanjc@google.com>
Subject: [PATCH v3 09/14] KVM: sefltests: Explicitly include ucall_common.h in mmu_stress_test.c
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
X-CRM114-CacheID: sfid-20241009_085015_671728_80A9D1B8 
X-CRM114-Status: UNSURE (   7.90  )
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

Explicitly include ucall_common.h in the MMU stress test, as unlike arm64
and x86-64, RISC-V doesn't include ucall_common.h in its processor.h, i.e.
this will allow enabling the test on RISC-V.

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 5467b12f5903..fbb693428a82 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -15,6 +15,7 @@
 #include "test_util.h"
 #include "guest_modes.h"
 #include "processor.h"
+#include "ucall_common.h"
 
 static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 {
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
