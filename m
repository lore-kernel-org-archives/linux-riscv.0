Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ADDC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eg1ynbqSV3At8cjCW0P90V/Zg26/nVnN3H0wzYV1j4M=; b=Wrx68qIpZ6zs/8
	REOmzA+wjqGHx4gPiqQqRzwc9sFsIF3xb4QsEgld6xknDTY4ybLe36IB9kCQ7w0YkIrsGtVh0f9HB
	WBcwFPG5AkQs7jW4y/vnX0TIzF/A3QADdjbCl96tStKDSat5MHeyVSXAwS8tnwDIs583iAS2VNWnx
	UBJfe6m3T2xuXoLy4XG0lpfRPhjjzE1Q93HaroF5P73VDyjG2kPFPZEemTJgUqYkrs5vdhRTB/221
	rsD1haoZAZXhZ5vW6wP1AnFijYjYr0aiuxIzdnyNAoIZor1ONPBEipF5tx/T9ptfR7KbM+7ftujYm
	3Q+m7ssKNPY+jkjnsuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFz0H-000MRQ-1v;
	Wed, 20 Dec 2023 16:01:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFz03-000M89-2m
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:00:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33680da01d6so196975f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088044; x=1703692844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOMbKPx9f+JcS4fNjPCKfauG48/CPKUV3NQDAwTQdeE=;
        b=i5J1dCKN3ndFlL2BmWg/cLLwpz7nhtDWcznYn6wXEC6UlAC3h1fKDg+FD/Pzg5TLLI
         Mg5/Fr+b9w2Wn4KkrFXiRy9OyY0DgGWYWXcGI4OykT+UTMhWiSimtf98jkbY0I5iqsBP
         ZsCJHZ1Tuw+4/DHUdgKljcEhFQpHTD8xBhc5O6wgbtThe0dk8NGgJ2Geb11ZYgpRmRyf
         etzwx56YIT7TZD+yssRg2xnvkASUq7blxs4TDnpLQatbJ1k2cx/j2bBikYKRT4gYLfif
         y1T6tCGC29rVD4qEJIjp+Ef9rlhrRguDw9p7unV1TpRcJZp0usubKpqHGwJ0gVaioEFD
         KvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088044; x=1703692844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOMbKPx9f+JcS4fNjPCKfauG48/CPKUV3NQDAwTQdeE=;
        b=nC6yoRssm+euB5V3puribuULVbBrMU9dt4qmm6pL6KM0MByKrlcjyUo3ldcHFB+NIP
         Lidq9OeO/I4vmfUaXBApUY2absrHBGtOXO5wSAKIA1oE38TBMcffo6sBdJ9DeEYnajc4
         lAqOP7qb3FekV6yDKBet7Yh45AQ1OJPVsuwer5LveksFNYOsq4+BCuRIrEnyLcXe5AjT
         Qh5hbXtFbe+msLQH+MzqPXgLGubFvw122et2kSkJhaNvcq5HamwmkX2e5lbMRzjp1lnD
         t2iZytgs2sb0zrxj8zplgzgne0rajGLlKuGteMGyd4meCGrkZHkjfWn4Pr7mmVgzhOK1
         6Srw==
X-Gm-Message-State: AOJu0YzYZmZpO983IEz00uqnjXK30e4LPCIXK6KMBSfWzvhTLUq+ZoyU
	iefSkopJbB0rQ9PVm1yADgLBuKifvGwTamMYJQY=
X-Google-Smtp-Source: AGHT+IHAymYvsc8zEqN1v3qElq0WfVx384eiJmTqDAz6MBPOM6JEK5f4WJQK6gTsluRbahFbSGEd9A==
X-Received: by 2002:a5d:6691:0:b0:336:7659:c2c2 with SMTP id l17-20020a5d6691000000b003367659c2c2mr1430322wru.21.1703088043894;
        Wed, 20 Dec 2023 08:00:43 -0800 (PST)
Received: from localhost (cst-prg-16-115.cust.vodafone.cz. [46.135.16.115])
        by smtp.gmail.com with ESMTPSA id s8-20020a5d5108000000b003366fb71297sm5272750wrt.81.2023.12.20.08.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:00:43 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com
Subject: [PATCH v4 10/13] RISC-V: KVM: selftests: Move sbi_ecall to processor.c
Date: Wed, 20 Dec 2023 17:00:23 +0100
Message-ID: <20231220160012.40184-25-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_080047_934279_B91C331B 
X-CRM114-Status: UNSURE (   9.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

sbi_ecall() isn't ucall specific and its prototype is already in
processor.h. Move its implementation to processor.c.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/lib/riscv/processor.c       | 26 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 26 -------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 6c25f7843ef4..6905a4348380 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -367,3 +367,29 @@ void vcpu_args_set(struct kvm_vcpu *vcpu, unsigned int num, ...)
 void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 {
 }
+
+struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
+			unsigned long arg1, unsigned long arg2,
+			unsigned long arg3, unsigned long arg4,
+			unsigned long arg5)
+{
+	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
+	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
+	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
+	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
+	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
+	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
+	register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
+	register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
+	struct sbiret ret;
+
+	asm volatile (
+		"ecall"
+		: "+r" (a0), "+r" (a1)
+		: "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
+		: "memory");
+	ret.error = a0;
+	ret.value = a1;
+
+	return ret;
+}
diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index fe6d1004f018..14ee17151a59 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -10,32 +10,6 @@
 #include "kvm_util.h"
 #include "processor.h"
 
-struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
-			unsigned long arg1, unsigned long arg2,
-			unsigned long arg3, unsigned long arg4,
-			unsigned long arg5)
-{
-	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
-	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
-	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
-	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
-	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
-	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
-	register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
-	register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
-	struct sbiret ret;
-
-	asm volatile (
-		"ecall"
-		: "+r" (a0), "+r" (a1)
-		: "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
-		: "memory");
-	ret.error = a0;
-	ret.value = a1;
-
-	return ret;
-}
-
 void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
