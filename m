Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628BDC77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaWwJgpvzdPzNg0c1eR270AhWQpE66UH/xdhnfMaUlI=; b=CLceC+h+5/ye74
	JosDDS5vv2OdgWLhHRK0RPL53vgTnq/FDE5hq3lBh9TrLtv+LOGghPz5JmduKNE3q52ojvOUX31gg
	Ha3sjLtE3oPvpOj+RKAEuA+D+dB9U9uI/KsBZFIsJOVBPdvxlzWKuI2abm7x6T/zHkX/Iu5VzvLsg
	MBdFK4FzqtJSrxExmjki2XBqVvf2s54U4vPGIprDCxGyvxyMIaf99A06NjtjmIUh8K6xq2pAie70r
	3wcbcCIQFFOyFRWqPm/dMT/zQ7s8Pyu8WIg0XKSJO6nwX+UE8fA7LwOC/7t6eYMq/qNzocl/jGQeE
	rmnJdIMm2r7jOQfF9gqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIY-00G1Uq-2s;
	Mon, 17 Apr 2023 11:45:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIW-00G1SR-33
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Apr 2023 11:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0ijp3BGzPoW2lUPdTctTphHIcIoj7d+4OnCG2M4gtHw=; b=FGNh8qCSDbJjqmcLp8Xa9iSKV9
	PhPQS3g6CxinEpI7g4CmZij4yMoKQiqg4e2ULr4q5WgsC25MPoZw0HzUlQap/NbSkDqBQXzB7tmE9
	tI1BDvmqmL25WclzV3+ReFUW0AtaP1PvBJxyHymlAcrE1c8kbtrNoksfp/GS9ao0wmt1HqbRPpGoH
	YqoY1TTRcGX/P90LUDSptCgj4j2LgSINtAoAWyDPbPKI+QngmA9sqWHkvJhS7i8zOG405fEBnL2oV
	LRdOUbDKVd5SE+qnukzq1p+52td0jg2R1Q2XZarNcXeeC6aZe9eerCT7T0EpPGhJxJN/PaEIUs6PA
	5Ed8hH9Q==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBk-00HIDo-2I
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:33 +0000
Received: by mail-ej1-x62f.google.com with SMTP id dm2so62906140ejc.8
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727663; x=1684319663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ijp3BGzPoW2lUPdTctTphHIcIoj7d+4OnCG2M4gtHw=;
        b=KYr35lEjrzT97L/dhtKuQaH+14yfjqdGSo+42e6lniEE7Y8t0DyVtvNfD5IeoKLEuX
         NEwKpsJy0TRwy/ejpZLR9mn5HF/e7HRhGhXtX8SAycrqnEqDY6dQck8YU6k7CJAwmGPN
         6CKpLnDDYOSGBDX5AY8K+Rhht8u66//MhEFgKhgIOyluW9JKM66HM5eNfBa/e6x7zFYK
         ea2dN2jLltLQQVhM3LU8aePd43dPzyaBsaMaEfDIWE9DxjQ6j7zMUllzg/lEhGBNR2C1
         09jpIPZVJLUqCrJnjT/0ppIluS9ym3ineeZJoQEYgxsAli/bEz7reiZX4ZJFHtAvIWp/
         bU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727663; x=1684319663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ijp3BGzPoW2lUPdTctTphHIcIoj7d+4OnCG2M4gtHw=;
        b=ZHIpez/1XGFfUXQJL0cy5oXq5BL1Iu0SIOHDXld8xO8VK7V683+5CMtAd9qtTL0L/x
         BvDECzjhsMcV1GfyZqVTvN1aue95qBTZqf1L9uexBN5sQkmgT0AMkfZ812gV/YWuUkhS
         cbsGTWF7rMrQBU8YNFnBOoFoHyY6SH7onDSbcg0T9Fckvb+dtoSuLrFWM+V3qP7bqa77
         P9xeX+prLKkDK0Qlrtaf8RtoLorZbKdwPq3KAcIq4IjpmD6x4maBuTSGSdnk3hLgwfZo
         OEcRmJFkGVKVBg2CGSjpPCNTFHUba4XX0+YzP88nomUjcJb+pelzbgznZm2VTnAbANUF
         quYw==
X-Gm-Message-State: AAQBX9ecnJ1nBAri00lxpwOCn2FHPjc5PbaSCJtUOxHxYvS7JM/u/Swb
	Uw7vtSCBm9jXe0Dpz3rDFUv/nA==
X-Google-Smtp-Source: AKy350YQFyfdwnG2SaYiwqI8vZVJNIcx3xqCbG0Ic36Y74FShJlSrVYjiW3BdsCbjFdapZde0pFNug==
X-Received: by 2002:a17:906:6bcd:b0:94a:bd17:fc40 with SMTP id t13-20020a1709066bcd00b0094abd17fc40mr7043799ejs.25.1681727663757;
        Mon, 17 Apr 2023 03:34:23 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id j25-20020a1709062a1900b0094f614e43d0sm1937204eje.8.2023.04.17.03.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:23 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 11/14] KVM: selftests: riscv: Move sbi_ecall to processor.c
Date: Mon, 17 Apr 2023 12:33:59 +0200
Message-Id: <20230417103402.798596-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_113424_830371_2B6D8A92 
X-CRM114-Status: UNSURE (   8.37  )
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

sbi_ecall() isn't ucall specific. Move it to processor.c.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/lib/riscv/processor.c       | 26 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 26 -------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d146ca71e0c0..de67197ee848 100644
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
index 9a3476a2dfca..ff6eef140293 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -14,32 +14,6 @@ void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
 }
 
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
 void ucall_arch_do_ucall(vm_vaddr_t uc)
 {
 	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
