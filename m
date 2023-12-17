Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33729C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eg1ynbqSV3At8cjCW0P90V/Zg26/nVnN3H0wzYV1j4M=; b=tk+RbDcYVgn4g9
	xFsaaH9dro/G1BBu6HmhQ/28qo1qWLTrBATSRI64rK03KB7f29z9gxeylJRqVdorUAf3dOuerbN2Z
	VbTLaH5db2nr/+VcaQbhM/3UFXCUaG0x8S+b5sD3psy7pN8Hx1OHSrxwKNNU59wBw5Dx/piQHNP6V
	NfqelBRkpbyvLHhjqD2Lq6nA2ieYT5uttnw2iQTbiQ0DyFeWJ7ZJ7yAE/bRoXmipEJZcU2JgKCR2J
	tQySxqHfnhCi7lFYoIo4dCXpBkNrLw4sqxVdADrr1Q6DI0LTsgkMFmT4Wwh6QmTpFKzJTz3WiY8Vz
	qG/ZExmlXUu6zDXJGhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwX-008QKf-2z;
	Sun, 17 Dec 2023 20:40:57 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwT-008QEO-09
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 20:40:54 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a2343c31c4bso70692966b.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 12:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702845651; x=1703450451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOMbKPx9f+JcS4fNjPCKfauG48/CPKUV3NQDAwTQdeE=;
        b=ajvUoj/tD0sVhHh+dbZlddSPjHYhnaIvgLX/7S7B+nCdLZ6o/DGsppJdYJJFyjUFt9
         BnjYwzr/II4s3eyFUFFFO5PwUETlegvQq85NXb6Gd4GXIlwS+t+vARrVfNs0MnCGMAGz
         h+wLWLO2Vck1iyGMjW7gfeP7d0Mr5CSGGQPlD91ewg+fE+VWPMFUxYppqaMVVeSUOVLK
         M5skEGYuGavoeQWlxRVSSxgZ38hdYPS1yJdNmCHbeDHdSUL5eBtD+XtHuQhCngEMNw0y
         8WQcd9PkMkTlN5zJFUYE919ePi1fKq+MO6061HcKcgB+Hgq3YcmkP4yIVFG6TzpeKg1H
         VfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845651; x=1703450451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOMbKPx9f+JcS4fNjPCKfauG48/CPKUV3NQDAwTQdeE=;
        b=l0kN8j5M1IPgF5OQh9hZwGm5II9o3uWui8StOy5sqf6ifaFy/eeaOzlVAsb6f8mf9e
         Qtw64rJMxn3iqsbr0RhqaIBdHuFwdcbSCYyndE6h5g8RHy+lBkh/jMB6SvXcv5hLzA7m
         qwwXe4JxdJdD2dKbA3DuZAJS1XKfukdfE/9mVHLh0tv/fEEpgEV1LSfxeuwinO1Ik963
         X3eGsnaFykCwbPNTF0O9aGefEphoon/ofzCO5hCakJpvjXoVL1e/ijhnpLP/2V7PD1yA
         NmW/l4ZC2uYvxroc32blKwqnC/qLIqbhYbxwgFPBc0nu+dtSdEzMngF8Bt1YaX8lRlH8
         +T+w==
X-Gm-Message-State: AOJu0YxAO8yPiTBG8D3lUvueMkgg9vwNgNHoKhm+wE46tbOr0FZTusCa
	PQo3C3PYX9KsBcfAuITYvjyuQw==
X-Google-Smtp-Source: AGHT+IElKIALGSKv91isCCjAY+9MIW2ym0pewkkwdkfoL3kKEux4VitJsNehhoeuFDnBHYAQt77IKw==
X-Received: by 2002:a17:906:83:b0:a23:195c:8a59 with SMTP id 3-20020a170906008300b00a23195c8a59mr1296006ejc.34.1702845651321;
        Sun, 17 Dec 2023 12:40:51 -0800 (PST)
Received: from localhost (cst-prg-88-42.cust.vodafone.cz. [46.135.88.42])
        by smtp.gmail.com with ESMTPSA id oz39-20020a170906cd2700b00a235f3b8259sm38073ejb.186.2023.12.17.12.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 12:40:50 -0800 (PST)
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
Subject: [PATCH v3 10/13] RISC-V: KVM: selftests: Move sbi_ecall to processor.c
Date: Sun, 17 Dec 2023 21:40:30 +0100
Message-ID: <20231217204019.36492-25-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_124053_090579_B4C64BEA 
X-CRM114-Status: UNSURE (   8.88  )
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
