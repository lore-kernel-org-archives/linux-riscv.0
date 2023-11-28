Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F0CC07CA9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUW7kUHaKytn83ndmJbrXNsI/9vwoGrsQ1oACNWrBTg=; b=na14Fr/qfLU4sI
	6NJYUMDF19D0bAaLi0szyqg8IzorUxcURyhBHNNTPFPOAwHn4fCO1UpFPAl8ZIoVr1RwPBTfhhJFt
	FEqP+u/byWkRqeMd1vAR/VpHQJ4IIanXku0/zY3NwswXG4HY6hN/Aqk6YDFKVFjiLiTsWq/tYk9ST
	lUzUUkTIfJXzdT1IRFwk3+KGfuhJpy4/Wd7hWgn/19mUyKM1RjnCcxSiehdLYpoZGHvB+BU8ADW19
	oYw0RwEhj9Q8V98Bn9PFP/nafYRvZl7LM+iv4RrFEkkPkgqiNsN1Wo5duD9nTLTp5LtPnwXh85SkY
	XfwrshsdliUo4MFriPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTr-005ZOB-2x;
	Tue, 28 Nov 2023 14:54:31 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTp-005ZL1-1b
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:54:30 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cf8c462766so39941705ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183268; x=1701788068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqxVg8l3Hg6Frv7KJ86Slj6nrb0o+W/dOYeQGaFJwTE=;
        b=HdUOSEaQ4ZmTPa3pbatUFgLMEDmA7jFkCsBkta9nMDODQ0NtqGTlnE0yc85IRi18pC
         +PMIlRc6/V6Lcc1W3cJoeppiac5XOiwBvELMe/C9RL1hbIY4POoXy6rS0rshvtGtn5nr
         pXx6lHCYcBPiwyuA6rMa8WU8wEsJEt53smUgB8stmZri8t2ZZmv7UGjAHzk6gV3NIenu
         /l1rdfbrXkLrtSZ09lnmC9notQ69Ns2URn/N8yJ5+8V3VO3L4CT56i1xF+orV9KpdDpN
         HC999dpX/VsYYKFjKL2sVGJxuL7RFewM5wGCPkGRnY3covJzu0asD1pXvUmKtGcYSoAH
         ITgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183268; x=1701788068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqxVg8l3Hg6Frv7KJ86Slj6nrb0o+W/dOYeQGaFJwTE=;
        b=ubXMNL6QS9LGMVKV7iXcIhlbyhsHwRVb9vUr4u6PZhsMMOZZ8mVkafFDfBynyp9V2S
         OQFjfr99Bzj45+ojHYcPe2tYaHDtL+Okf5pbxNEZUNUvX3PDLIAzaxkNy0cqFB7cPmKf
         ci5X+4ORwHjcBMOUgtpXyOwo1vzfrCDzGdFRqvNIQ6+sdGbuYiVfwh5PRV67qfHpw1nG
         vP/tJOchmyAcxMWw5+lz2M9Kln9ZI6WUtaJznuSmnhcI6UeuxkJop3egW+VEbiLIQX7H
         w89xWHmaqAX3zrsrf+9rpuXwHTIhuZ5Q7iipvfFhVOHoSO8hd9qOeCvL1PE8/XH3eYA8
         PK/w==
X-Gm-Message-State: AOJu0YxtG46dJY1K+ZzXPu5az4JArDxY2JNOn7vjza7Sff7Nc10YELK0
	xDisPm2KdedNiToHC88KqT1Hlg==
X-Google-Smtp-Source: AGHT+IFcoaA2hxnFbXCCUocOR1sG99CREnANM1PmTY3hLfSSQRNudLUWraMAAhbsdJoHp2lrLA44uw==
X-Received: by 2002:a17:903:11c4:b0:1cc:4072:22c6 with SMTP id q4-20020a17090311c400b001cc407222c6mr17937667plh.24.1701183267919;
        Tue, 28 Nov 2023 06:54:27 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:54:27 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 04/15] RISC-V: KVM: Allow scalar crypto extensions for Guest/VM
Date: Tue, 28 Nov 2023 20:23:46 +0530
Message-Id: <20231128145357.413321-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065429_538550_1D7C80A6 
X-CRM114-Status: UNSURE (   8.40  )
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

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable scalar crypto extensions for
Guest/VM. This includes extensions Zbkb, Zbkc, Zbkx, Zknd, Zkne,
Zknh, Zkr, Zksed, Zksh, and Zkt.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 10 ++++++++++
 arch/riscv/kvm/vcpu_onereg.c      | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 518b368b41e5..7b54fa215d6d 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -140,6 +140,16 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SMSTATEEN,
 	KVM_RISCV_ISA_EXT_ZICOND,
 	KVM_RISCV_ISA_EXT_ZBC,
+	KVM_RISCV_ISA_EXT_ZBKB,
+	KVM_RISCV_ISA_EXT_ZBKC,
+	KVM_RISCV_ISA_EXT_ZBKX,
+	KVM_RISCV_ISA_EXT_ZKND,
+	KVM_RISCV_ISA_EXT_ZKNE,
+	KVM_RISCV_ISA_EXT_ZKNH,
+	KVM_RISCV_ISA_EXT_ZKR,
+	KVM_RISCV_ISA_EXT_ZKSED,
+	KVM_RISCV_ISA_EXT_ZKSH,
+	KVM_RISCV_ISA_EXT_ZKT,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f789517c9fae..b0beebd4f86e 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -43,6 +43,9 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
 	KVM_ISA_EXT_ARR(ZBC),
+	KVM_ISA_EXT_ARR(ZBKB),
+	KVM_ISA_EXT_ARR(ZBKC),
+	KVM_ISA_EXT_ARR(ZBKX),
 	KVM_ISA_EXT_ARR(ZBS),
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
@@ -52,6 +55,13 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZIHPM),
+	KVM_ISA_EXT_ARR(ZKND),
+	KVM_ISA_EXT_ARR(ZKNE),
+	KVM_ISA_EXT_ARR(ZKNH),
+	KVM_ISA_EXT_ARR(ZKR),
+	KVM_ISA_EXT_ARR(ZKSED),
+	KVM_ISA_EXT_ARR(ZKSH),
+	KVM_ISA_EXT_ARR(ZKT),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -94,6 +104,9 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_RISCV_ISA_EXT_ZBC:
+	case KVM_RISCV_ISA_EXT_ZBKB:
+	case KVM_RISCV_ISA_EXT_ZBKC:
+	case KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_RISCV_ISA_EXT_ZICOND:
@@ -101,6 +114,13 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_RISCV_ISA_EXT_ZKND:
+	case KVM_RISCV_ISA_EXT_ZKNE:
+	case KVM_RISCV_ISA_EXT_ZKNH:
+	case KVM_RISCV_ISA_EXT_ZKR:
+	case KVM_RISCV_ISA_EXT_ZKSED:
+	case KVM_RISCV_ISA_EXT_ZKSH:
+	case KVM_RISCV_ISA_EXT_ZKT:
 		return false;
 	/* Extensions which can be disabled using Smstateen */
 	case KVM_RISCV_ISA_EXT_SSAIA:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
