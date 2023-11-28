Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ECBC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sHMdnwb7A/YGL26WHL9TivUHdnqzvHxCiqALMqWd/Q=; b=eKwZ4JtnTWs4dK
	Wf48qRoDEzUisWqzopoD79VjPpdAgH6SzbA4UERG3H3seCLxZjiKvHzqNPYSA4HiAASQElB3rJTiD
	60Kq4+KJbE/tN1d6rqEwCfMULbUVF0m8DcAgfr4BS8q3Dx4r0bu1aq3Ss0PWJcm8SyY8yAnBlX1/t
	yEz85cS/9kJvX75UzVjH8xsKX5i/86vIDePjXEYi/CUj8ZotC7NDt+bPOkAkSH26+OH9PfUy8EWtv
	nwtrjc8EyvGx5eeVzJJolq7+BMTwzExzw7Rrmal+vQntZZtnTrkvjoYay6aAMK4G5dHuTIeWw0SS8
	iYlK9hrKgrTuN6XUOqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUF-005ZjV-1U;
	Tue, 28 Nov 2023 14:54:55 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUC-005Zeu-2m
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:54:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cfc2d03b3aso19312165ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183290; x=1701788090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm/Iyo3ZjfxV3AvcIfkWbfx2G5Qea1Dpvj7in6gJJEo=;
        b=n6jzjhZr1NtkvcTTHE9Lz3f2qm4dT6dVbcqHmIi074Kr/GvoXoIrGz0aTWZKjYpQwN
         qp2+OQhmpzT68474ikwIWmRlb1xliv0NlPYFowUZa9hU12WuK8aprOTFOeUI1gdjRCpH
         QMGZJRAvRzfrnWVBTsIGR1Pssom1dslqTsmGuDlBrHCHrox24HjYvfD6nxNhfbHoP0va
         VklBtVW4UlxIMHixLfziNeOdTiujXJ+yFYqZT/Q6ff9wyHvfjFvV1O3tHxyjutCZWXaM
         CU2vuLasbHEBPAtxU08xKfSa5FtcW+DOGVwLvhDZzF1alhSoEI1jpAwQwp9kPZI2rwp5
         4eXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183290; x=1701788090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm/Iyo3ZjfxV3AvcIfkWbfx2G5Qea1Dpvj7in6gJJEo=;
        b=gSZaDB/z4iLMTivfoA1KVI0aL0SQM1iAVr34wUqdheiuFfQzezTpaVH719iVTSj4l9
         iQ/+6Ts7QKEE2I3FLxKebbvdfWlYqKNJ5V0LPR1hzDSMGKcuXdf3c5+myGkIwuV+zQ2V
         p+ilOdjOyWc4e3LHYB6iq9K1/k1p9bXDgmxoVk4zGO5o0CEF2+wJuNaqGf/zoz61BNuy
         rMVpJkxA1vA+hCOkXa4+4pe6bVBVJR3Q1Ogt6uBQ8ixxnmNMfCmg8ezLYwF1zjO2qSoP
         yoTGXTli7KGRMZvkSjvKsbRexPQLOrzanCgcqo3flV634O0Ffd7P4HWXFDQYJeyoFwg+
         7mTA==
X-Gm-Message-State: AOJu0Yz8j+NRVR2VvKC4rETPTQdH1Liv/r6RKB6OzZ1lggwxFVpZcpMj
	Kgp0bkmX2/69R/rJhZjThtocyw==
X-Google-Smtp-Source: AGHT+IGNa0gmUO/XYyy1AQclzWoEopJjPk2a6P+hxdcxMn26I35PIIr0XIYsIPFAX9+qx2+hdanbsA==
X-Received: by 2002:a17:902:cec8:b0:1cf:c018:b4e9 with SMTP id d8-20020a170902cec800b001cfc018b4e9mr10533194plg.43.1701183290185;
        Tue, 28 Nov 2023 06:54:50 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:54:49 -0800 (PST)
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
Subject: [PATCH 08/15] RISC-V: KVM: Allow Zfh[min] extensions for Guest/VM
Date: Tue, 28 Nov 2023 20:23:50 +0530
Message-Id: <20231128145357.413321-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065452_906256_B89ACBA9 
X-CRM114-Status: UNSURE (   8.58  )
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
user space to detect and enable Zfh[min] extensions for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/vcpu_onereg.c      | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 241632f91f73..fa1a8e01b803 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -160,6 +160,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZVKSED,
 	KVM_RISCV_ISA_EXT_ZVKSH,
 	KVM_RISCV_ISA_EXT_ZVKT,
+	KVM_RISCV_ISA_EXT_ZFH,
+	KVM_RISCV_ISA_EXT_ZFHMIN,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 4cd075f4cf9f..ba418ac47e81 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -47,6 +47,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZBKC),
 	KVM_ISA_EXT_ARR(ZBKX),
 	KVM_ISA_EXT_ARR(ZBS),
+	KVM_ISA_EXT_ARR(ZFH),
+	KVM_ISA_EXT_ARR(ZFHMIN),
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICNTR),
@@ -118,6 +120,8 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZBKC:
 	case KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_RISCV_ISA_EXT_ZBS:
+	case KVM_RISCV_ISA_EXT_ZFH:
+	case KVM_RISCV_ISA_EXT_ZFHMIN:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_RISCV_ISA_EXT_ZICSR:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
